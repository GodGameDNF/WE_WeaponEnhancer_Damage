#include <Windows.h>
#include <type_traits>

using namespace RE;

PlayerCharacter* p = nullptr;
BGSProjectile* TestProj = nullptr;
TESForm* tempForm = nullptr;
BSScript::IVirtualMachine* vmSave = nullptr;
TESDataHandler* dataHandler = nullptr;

ActorValueInfo* damageMultAV = nullptr;
ActorValueInfo* damageResistAV = nullptr;
ActorValueInfo* energyResistAV = nullptr;

template <class Ty>
Ty SafeWrite64Function(uintptr_t addr, Ty data)
{
	DWORD oldProtect;
	void* _d[2];
	memcpy(_d, &data, sizeof(data));
	size_t len = sizeof(_d[0]);

	VirtualProtect((void*)addr, len, PAGE_EXECUTE_READWRITE, &oldProtect);
	Ty olddata;
	memset(&olddata, 0, sizeof(Ty));
	memcpy(&olddata, (void*)addr, len);
	memcpy((void*)addr, &_d[0], len);
	VirtualProtect((void*)addr, len, oldProtect, &oldProtect);
	return olddata;
}

bool DoDamage(Actor* victim, float damage, Actor* attacker)
{
	using func_t = decltype(&DoDamage);
	REL::Relocation<func_t> func{ REL::ID(1539010) };
	return func(victim, damage, attacker);
}

class ProjectileHooks : public Projectile
{
public:
	typedef bool (ProjectileHooks::*FnProcessImpacts)();

	bool tempProcessImpacts()
	{
		{
			
			for (auto it = this->impacts.begin(); it != this->impacts.end(); ++it) {
				if (it->processed || !it->collidee.get() || it->collidee.get()->GetFormType() != ENUM_FORM_ID::kACHR || !it->colObj.get())
					continue;	// 실드 프레임워크 카짓한 조건문

				Actor* a = (Actor*)it->collidee.get().get();
				TESObjectREFR* owner = this->shooter.get().get();

				if (owner && owner->formType == ENUM_FORM_ID::kACHR) {	// 총알이 사람한테서 발사됐나 확인
					float dMult = owner->GetActorValue(*damageMultAV);
					if (dMult > 0) { // 모드로 강화된 무기인지 확인
						BGSObjectInstanceT<TESObjectWEAP> sWeapon = this->weaponSource;
						TESObjectWEAP::InstanceData* sWeapData = (TESObjectWEAP::InstanceData*)sWeapon.instanceData.get();
						if (sWeapData) {	// 수류탄등이 아니라 총에서 발사된 투사체인지 확인
							if (this->damage > 0) {  // 에너지 무기는 기본 데미지가 0으로 설정되어있음
								float DR = a->GetActorValue(*damageResistAV);
								if (DR <= 0)
									DR = 0.1;

								float damageCalculation = pow(this->damage / DR, 0.366) * 0.5;
								float damagePoint;

								if (damageCalculation < 0.99) {
									damagePoint = damageCalculation;
								} else {
									damagePoint = 0.99;
								}

								int numProj = sWeapData->rangedData->numProjectiles;	// 팰릿의 수를 구함
								if (numProj < 1)
									numProj = 1;

								damagePoint = damagePoint * this->damage * dMult / numProj / 100;
								DoDamage(a, damagePoint, (Actor*)owner);

								//logger::info("기본피해 {} 추가피해 {} 팰릿수 {}", this->damage, damagePoint, numProj);
							} else {
								if (sWeapData) {
									BSTArray<BSTTuple<TESForm*, BGSTypedFormValuePair::SharedVal>>* tempTypes = sWeapData->damageTypes;
									if (tempTypes) {
										int i = tempTypes->size();
										if (i > 0) {
											int iDamage = 0;
											for (auto& tuple : *tempTypes) {
												iDamage += tuple.second.i;
											}	// weapon의 에너지 피해타입을 찾아 피해량을 합산함

											float ER = a->GetActorValue(*energyResistAV);
											if (ER <= 0)
												ER = 0.1;

											float damageCalculation = pow(iDamage / ER, 0.366) * 0.5;
											float damagePoint;

											if (damageCalculation < 0.99) {
												damagePoint = damageCalculation;
											} else {
												damagePoint = 0.99;
											}

											int numProj = sWeapData->rangedData->numProjectiles;
											if (numProj < 1)
												numProj = 1;

											damagePoint = damagePoint * iDamage * dMult / numProj / 100;
											DoDamage(a, damagePoint, (Actor*)owner);

											//logger::info("기본피해 {} 추가피해 {}", iDamage, damagePoint);
										}
									}
								}
							}
						}
					}
				}
			}
		}
		FnProcessImpacts fn = fnHash.at(*(uintptr_t*)this);
		return fn ? (this->*fn)() : false;
	}

	static void HookProcessImpacts(uintptr_t addr, uintptr_t offset)
	{
		FnProcessImpacts fn = SafeWrite64Function(addr + offset, &ProjectileHooks::tempProcessImpacts);
		fnHash.insert(std::pair<uintptr_t, FnProcessImpacts>(addr, fn));
	}

protected:
	static std::unordered_map<uintptr_t, FnProcessImpacts> fnHash;
};
std::unordered_map<uintptr_t, ProjectileHooks::FnProcessImpacts> ProjectileHooks::fnHash;

void RegisterEvent()
{
	p = PlayerCharacter::GetSingleton();
	dataHandler = RE::TESDataHandler::GetSingleton();
	if (!dataHandler)
		return;

	damageMultAV = (ActorValueInfo*)dataHandler->LookupForm(0xA6F, "WE_WeaponEnhancer.esp");
	damageResistAV = (ActorValueInfo*)dataHandler->LookupForm(0x2E3, "Fallout4.esm");
	energyResistAV = (ActorValueInfo*)dataHandler->LookupForm(0x2EB, "Fallout4.esm");

	uint64_t addr;
	uint64_t offset = 0x680;
	addr = Projectile::VTABLE[0].address();
	ProjectileHooks::HookProcessImpacts(addr, offset);

	addr = MissileProjectile::VTABLE[0].address();
	ProjectileHooks::HookProcessImpacts(addr, offset);

	addr = BeamProjectile::VTABLE[0].address();
	ProjectileHooks::HookProcessImpacts(addr, offset);

	addr = FlameProjectile::VTABLE[0].address();
	ProjectileHooks::HookProcessImpacts(addr, offset);
}

void OnF4SEMessage(F4SE::MessagingInterface::Message* msg)
{
	switch (msg->type) {
	case F4SE::MessagingInterface::kGameLoaded:
		//kPostLoadGame:  //kGameDataReady: //  //kGameLoaded:
		RegisterEvent();
		break;
	}
}

bool RegisterPapyrusFunctions(RE::BSScript::IVirtualMachine* a_vm)
{
	REL::IDDatabase::Offset2ID o2i;
	logger::info("0x0x0d79eb0: {}", o2i(0x0d79eb0));

	std::size_t offset = REL::IDDatabase::get().id2offset(1010112);
	logger::info("Offset for ID 1010112: {}", offset);

	//a_vm->BindNativeMethod("Lootjunk_F4SE"sv, "SearchAllForms"sv, SearchAllForms);
	vmSave = a_vm;
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
