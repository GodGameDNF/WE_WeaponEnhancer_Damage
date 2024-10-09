#include <Windows.h>
#include <type_traits>

using namespace RE;

PlayerCharacter* p = nullptr;
BSScript::IVirtualMachine* vm = nullptr;
TESDataHandler* DH = nullptr;

EnchantmentItem* enhanceDamageENCH = nullptr;
ActorValueInfo* damageMultAV = nullptr;
ActorValueInfo* weaponTypeAV = nullptr;
ActorValueInfo* addonStrongMultAV = nullptr;
EffectSetting* enhanceDamageEffect = nullptr;
SpellItem* enhanceDamageSpell = nullptr;


float CalculateAttackDamage(TESObjectWEAP::InstanceData* instData, TESAmmo* tAmmo)
{
	using func_t = decltype(&CalculateAttackDamage);
	REL::Relocation<func_t> func{ REL::ID(579254) };
	return func(instData, tAmmo);
}

float getPlayerWeaponDamage()
{
	float fDamage = 0;

	BSTArray<EquippedItem>* equipped = &p->currentProcess->middleHigh->equippedItems;

	if (!equipped) {
		logger::info("장착 장비 배열을 구하지 못함");
		return fDamage;
	}

	if (equipped->size() != 0 && (*equipped)[0].item.instanceData) {
		TESObjectWEAP* weap = (TESObjectWEAP*)(*equipped)[0].item.object;

		if (!weap) {
			logger::info("장착 무기를 못구함");
			return fDamage;
		}

		

		TESObjectWEAP::InstanceData* instData = (TESObjectWEAP::InstanceData*)((*equipped)[0].item.instanceData).get();	
		BGSObjectInstanceT<TESObjectWEAP>* weaponInstance = new BGSObjectInstanceT<TESObjectWEAP>(weap, instData);

		bool bTempDamage1 = false;

		// 물리 데미지 0인 무기 배율 계산을 위해 잠시 더함. 다른 방법 찾으면 변경
		uint32_t fBaseDamage = instData->attackDamage;
		if (fBaseDamage < 1) {
			instData->attackDamage = 1;
			bTempDamage1 = true;
			fBaseDamage = 1;
		}

		//logger::info("혹시 무기 데미지 기본 말고 잘뽑히나 확인 {}", weap->weaponData.attackDamage);
		float fDisplayDamage = CombatFormulas::GetWeaponDisplayDamage(*weaponInstance, instData->ammo, 1);

		// 추가된 피해량은 DamageTypeValue는 계산되지 않기 때문에 있다면 합한다음 배율을 구해 곱하기
		uint32_t iTotalTypeDamage = 0;
		BSTArray<BSTTuple<TESForm*, BGSTypedFormValuePair::SharedVal>>* damageTypeList = instData->damageTypes;
		if (damageTypeList) {
			uint32_t iSize = damageTypeList->size();
			if (iSize > 0) {
				uint32_t iTempTotalDamage = 0;
				for (int i = 0; i < iSize; ++i) {
					auto& tuple = (*damageTypeList)[i];
					// 두 번째 요소 (BGSTypedFormValuePair::SharedVal) 접근
					BGSTypedFormValuePair::SharedVal value = tuple.second;
					iTempTotalDamage += value.i;
				}
				// 합한 데미지타입 피해에 배율을 구해서 곱함
				float fDamageTypeMult = (fDisplayDamage - fBaseDamage) / fBaseDamage;
				fDamageTypeMult = fDamageTypeMult > 0 ? fDamageTypeMult + 1 : 1;
				iTotalTypeDamage = iTempTotalDamage * fDamageTypeMult;

				
			}
		}
		

		int8_t numProj = instData->rangedData->numProjectiles; // 팰릿수를 구함

		// 펠릿 수에 따른 배수 계산 
		float fNumProjMult;
		if (numProj <= 1) {
			fNumProjMult = 1;
			p->SetActorValue(*weaponTypeAV, 0);
		} else {
			fNumProjMult = numProj * 0.8; // 팰릿이 많으면 방어력에서 손해를 보니 딜을 조금 세게함
			p->SetActorValue(*weaponTypeAV, 1); // 팰릿이 많으면 샷건으로 취급
		}

		float fStrongMult = p->GetActorValue(*addonStrongMultAV) / 100; // "강력" 애드온 배율 계산

		fDamage = (fDisplayDamage + iTotalTypeDamage) / fNumProjMult * fStrongMult;
		
		//logger::info("디스플레이 물리 피해량 {} 다른 피해 보정값 {}", fDisplayDamage, iTotalTypeDamage);

		// 계산을 위해 임시로 1 데미지를 부여했다면 다시 0으로 되돌림
		if (bTempDamage1) {
			instData->attackDamage = 0;
		}
	}

	return fDamage;
}

void setEnhanceDamage(std::monostate) {
	float fDamage = getPlayerWeaponDamage();

	BSTArray<EffectItem*> effectList = enhanceDamageSpell->listOfEffects;
	if (effectList.empty()) {
		logger::info("스펠의 이펙트 리스트가 비었음");
		return;
	}

	for (EffectItem* effect : effectList) {
		if (!effect) {
			logger::info("이펙을 지정했지만 못잡았음");
			continue;
		}

		EffectSetting* targetEffect = effect->effectSetting;

		if (targetEffect && targetEffect == enhanceDamageEffect) {
			float dMult = p->GetActorValue(*damageMultAV);

			float fPercentAV = 80; //추가 데미지 형식이라 방어력에 막히니 100으로 나누지 않고 약간 더 세게함
			
			float fSetDamage = fDamage * dMult / fPercentAV;
			effect->data.magnitude = fSetDamage;
		}
	}
}


void OnF4SEMessage(F4SE::MessagingInterface::Message* msg)
{
	switch (msg->type) {
	case F4SE::MessagingInterface::kGameLoaded:
		//kPostLoadGame:  //kGameDataReady: //  //kGameLoaded:
		DH = TESDataHandler::GetSingleton();

		//enhanceDamageENCH = (EnchantmentItem*)DH->LookupForm(0x0ACA, "WE_WeaponEnhancer.esp");
		enhanceDamageSpell = (SpellItem*)DH->LookupForm(0x0AD2, "WE_WeaponEnhancer.esp");
		damageMultAV = (ActorValueInfo*)DH->LookupForm(0x0ACE, "WE_WeaponEnhancer.esp");
		weaponTypeAV = (ActorValueInfo*)DH->LookupForm(0x0AB3, "WE_WeaponEnhancer.esp");
		addonStrongMultAV = (ActorValueInfo*)DH->LookupForm(0x0AD4, "WE_WeaponEnhancer.esp");
		enhanceDamageEffect = (EffectSetting*)DH->LookupForm(0xACF, "WE_WeaponEnhancer.esp");
		p = PlayerCharacter::GetSingleton();

		if (!p) {
			logger::info("플레이어 못잡음");
			return;
		}

		if (!enhanceDamageSpell) {
			logger::info("스펠 못잡음");
			return;
		}

		if (!damageMultAV) {
			logger::info("엑터밸류 못잡음");
			return;
		}

		if (!enhanceDamageEffect) {
			logger::info("매직이펙트 못잡음");
			return;
		}

		break;

	case F4SE::MessagingInterface::kPostLoadGame:
		if (!p) {
			logger::info("플레이어 못잡음");
			return;
		}

		setEnhanceDamage(std::monostate{});
		break;
	}
}

bool RegisterPapyrusFunctions(RE::BSScript::IVirtualMachine* a_vm)
{
	REL::IDDatabase::Offset2ID o2i;
	logger::info("0x0x02FBB50 : {}", o2i(0x02FBB50));

	a_vm->BindNativeMethod("WE_WeaponEnhancer_Damage"sv, "setEnhanceDamage"sv, setEnhanceDamage);

	vm = a_vm;
	return true;
}

extern "C" DLLEXPORT bool F4SEAPI F4SEPlugin_Query(const F4SE::QueryInterface* a_f4se, F4SE::PluginInfo* a_info)
{
#ifndef NDEBUG
	auto sink = std::make_shared<spdlog::sinks::msvc_sink_mt>();
#else
	auto path = logger::log_directory();
	if (!path) {
		return false;
	}

	*path /= fmt::format("{}.log", Version::PROJECT);
	auto sink = std::make_shared<spdlog::sinks::basic_file_sink_mt>(path->string(), true);
#endif

	auto log = std::make_shared<spdlog::logger>("Global Log"s, std::move(sink));

#ifndef NDEBUG
	log->set_level(spdlog::level::trace);
#else
	log->set_level(spdlog::level::info);
	log->flush_on(spdlog::level::trace);
#endif

	spdlog::set_default_logger(std::move(log));
	spdlog::set_pattern("[%^%l%$] %v"s);

	logger::info("{} v{}", Version::PROJECT, Version::NAME);

	a_info->infoVersion = F4SE::PluginInfo::kVersion;
	a_info->name = Version::PROJECT.data();
	a_info->version = Version::MAJOR;

	if (a_f4se->IsEditor()) {
		logger::critical("loaded in editor");
		return false;
	}

	const auto ver = a_f4se->RuntimeVersion();
	if (ver < F4SE::RUNTIME_1_10_162) {
		logger::critical("unsupported runtime v{}", ver.string());
		return false;
	}

	return true;
}

extern "C" DLLEXPORT bool F4SEAPI F4SEPlugin_Load(const F4SE::LoadInterface* a_f4se)
{
	F4SE::Init(a_f4se);

	const F4SE::PapyrusInterface* papyrus = F4SE::GetPapyrusInterface();
	if (papyrus)
		papyrus->Register(RegisterPapyrusFunctions);

	const F4SE::MessagingInterface* message = F4SE::GetMessagingInterface();
	if (message)
		message->RegisterListener(OnF4SEMessage);

	return true;
}
