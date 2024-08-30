// F4SE
#include <f4se/GameReferences.h>
#include <f4se/GameRTTI.h>
#include <f4se/PluginManager.h>
#include <f4se/NiNodes.h>
#include <f4se/GameObjects.h>
#include <f4se/GameData.h>
#include <f4se/GameExtraData.h>

#include <f4se/PapyrusVM.h>
#include "f4se/PapyrusNativeFunctions.h"
#include <f4se/GameMenus.h>
// Common
#include "f4se_common/f4se_version.h"
#include <f4se_common/BranchTrampoline.h>
#include <f4se_common/SafeWrite.h>

#include <shlobj.h>
#include <chrono>
#include <sstream>
#include <fstream>
#include <regex>
#include "Global.h"
#include <xbyak/xbyak.h>
#include <random>
#include <iostream>
#include <vector>
#include <chrono>
#include <iomanip>
#include <string>

struct RefrOrInventoryObj
{
	TESObjectREFR* refr;
	TESObjectREFR* inv;
	UInt16 id;
};

struct ItemData
{
	TESBoundObject* form;
	std::vector<UInt32> mods;
	UInt32 count;
	bool hasCustomName;
	std::string customName;
};

class ExtraStartingWorldOrCell : public BSExtraData
{
public:
	TESForm* data;
};

typedef void* (*_operator_new)(UInt64);
RelocAddr <_operator_new> operator_new(0x0030D0);

typedef void (*_operator_delete)(void*);
RelocAddr <_operator_delete> operator_delete(0x003110);

typedef BGSInventoryList* (*_BGSInventoryList_ctor)(BGSInventoryList*, TESContainer*, UInt32*);
RelocAddr <_BGSInventoryList_ctor> BGSInventoryList_ctor(0x001AB0E0); // 0x80

typedef void (*_AddItem)(BGSInventoryList*, TESBoundObject*, UInt32, ExtraDataList*, UInt16);
RelocAddr <_AddItem> AddItem(0x001AB460);

typedef void (*_InitItem)(ExtraDataList*, TESForm*);
RelocAddr <_InitItem> InitItem(0x00084700);

typedef void (*_AddIventoryItem)(BGSInventoryList*, BGSInventoryItem&);
RelocAddr <_AddIventoryItem> AddInventoryItem(0x001ABA00);

typedef void (*_RemoveIventoryItem)(BGSInventoryList*, UInt32);
RelocAddr <_RemoveIventoryItem> RemoveInventoryItem(0x001AD570);

typedef ExtraDataList* (*_ExtraDataList_ctor)(ExtraDataList*);
RelocAddr <_ExtraDataList_ctor> ExtraDataList_ctor(0x00080750); // 0x28

typedef BSExtraData* (*_AddExtra)(ExtraDataList*, BSExtraData*);
RelocAddr <_AddExtra> AddExtra(0x00042FA0);

typedef BGSObjectInstanceExtra* (*_BGSObjectInstanceExtra_ctor)(BGSObjectInstanceExtra*);
RelocAddr <_BGSObjectInstanceExtra_ctor> BGSObjectInstanceExtra_ctor(0x00042480); // 0x28

typedef void (*_AddMod)(BGSObjectInstanceExtra*, BGSMod::Attachment::Mod*, UInt8, UInt8, bool);
RelocAddr <_AddMod> AddMod(0x0003BF70);

typedef BSFixedString* (*_GetDisplayName)(ExtraTextDisplayData*, TESBoundObject*);
RelocAddr <_GetDisplayName> GetDisplayName(0x000C0A00);

typedef void (*_SetOverrideName)(ExtraDataList*, const char*);
RelocAddr <_SetOverrideName> SetOverrideName(0x00089440);

typedef bool (*_CreateInstanceDataForObjectAndExtra)(TESBoundObject*, ExtraDataList*, UInt32*, bool);
RelocAddr <_CreateInstanceDataForObjectAndExtra> CreateInstanceDataForObjectAndExtra(0x000517B0);

typedef bool (*_HasCustomName)(ExtraTextDisplayData*);
RelocAddr <_HasCustomName> HasCustomName(0x000DAE80);

typedef TBO_InstanceData* (*_CreateInstanceData)(ExtraDataList*, TESBoundObject*, bool setDisplayName);
RelocAddr <_CreateInstanceData> CreateInstanceData(0x0008A260);

typedef UInt32* (*_PlaceAtMeFunctionBase)(UInt32*, TESObjectREFR*, TESObject*, SInt32, SInt32, SInt32, float, bool);
RelocAddr <_PlaceAtMeFunctionBase> PlaceAtMeFunctionBase(0x005121D0);

typedef UInt32* (*_CreateReference)(UInt32*, UInt8, bool);
RelocAddr <_CreateReference> CreateReference(0x003F3570);

typedef void (*_CreateInventoryList)(TESObjectREFR*, TESContainer*);
RelocAddr <_CreateInventoryList> CreateInventoryList(0x0040A370);

typedef void (*_OpenContainerMenu)(TESObjectREFR*, SInt32, bool);
RelocAddr <_OpenContainerMenu> OpenContainerMenu(0x01264F40);

typedef void (*_SetWantsDelete)(TESObjectREFR*, bool);
RelocAddr <_SetWantsDelete> SetWantsDelete(0x004115C0);

typedef void (*_SetLocationOnReference)(TESObjectREFR*, NiPoint3*);
RelocAddr <_SetLocationOnReference> SetLocationOnReference(0x0040C060);

typedef bool (*_RemoveStack)(BGSInventoryItem*, BGSInventoryItem::Stack*);
RelocAddr <_RemoveStack> RemoveStack(0x001A78D0);

typedef void (*_CallGlobalFunctionNoWait)(VirtualMachine*, UInt32, void*, const BSFixedString*, const BSFixedString*, VMArray<VMValue>);
RelocAddr <_CallGlobalFunctionNoWait> CallGlobalFunctionNoWait(0x01451A80);

typedef void(*_SetOwner)(TESObjectREFR*, TESForm*);
RelocAddr <_SetOwner> SetOwner(0x0047F0E0);

typedef SInt32(*_GetCount)(TESObjectREFR*);
RelocAddr <_GetCount> GetCount(0x00243780);

typedef void (*_MoveToFunctionBase)(TESObjectREFR*, TESObjectREFR*, float, float, float);
RelocAddr <_MoveToFunctionBase> MoveToFunctionBase(0x004FDD60);

typedef void (*_GetAtRefCollection)(TESQuest*, BGSRefCollectionAlias*, UInt32, TESObjectREFR*&);
RelocAddr <_GetAtRefCollection> GetAtRefCollection(0x005DB5B0);

typedef void (*_REFR_Pointer_Release)(void*, TESObjectREFR*);
RelocAddr <_REFR_Pointer_Release> REFR_Pointer_Release(0x0000B0E0);

typedef void (*_MovetoNode)(VirtualMachine*, UInt32, RefrOrInventoryObj*, TESObjectREFR*, BSFixedString const*, BSFixedString const*);
RelocAddr <_MovetoNode> MovetoNode(0x01409E40);

typedef TESForm* (*_GetFormFromFile)(VirtualMachine*, UInt32, void*, UInt32, BSFixedString const*);
RelocAddr <_GetFormFromFile> GetFormFromFile(0x013C10A0);

typedef TESForm* (*_GetItemAtFormListIndex)(BGSListForm*, UInt32);
RelocAddr <_GetItemAtFormListIndex> GetItemAtFormListIndex(0x004B0940);

typedef TESObjectREFR* (*_PlaceAtMe)(VirtualMachine*, UInt32, RefrOrInventoryObj*, TESForm*, UInt32, bool, bool, bool);
RelocAddr <_PlaceAtMe> PlaceAtMe(0x0140B0E0);

typedef TESObjectREFR* (*_PlaceAtNode)(VirtualMachine*, UInt32, TESObjectREFR*, BSFixedString const*, TESForm*, UInt32, bool, bool, bool, bool);
RelocAddr <_PlaceAtNode> PlaceAtNode(0x0140B720);

typedef UInt32(*_GetSize)(VirtualMachine*, UInt32, BGSListForm*);
RelocAddr <_GetSize> GetSize(0x013D3630);

typedef void (*_Enable)(TESObjectREFR*, bool);
RelocAddr <_Enable> Enable(0x0040DA90);

typedef void (*_EnableNoWait)(VirtualMachine*, UInt32, TESObjectREFR*, bool);
RelocAddr <_EnableNoWait> EnableNoWait(0x01405740);

typedef void (*_Disable)(TESObjectREFR*);
RelocAddr <_Disable> Disable(0x0040E0B0);

typedef UInt32(*_GetRefCollectionCount)(TESQuest*, BGSRefCollectionAlias*);
RelocAddr <_GetRefCollectionCount> GetRefCollectionCount(0x005DB540);

typedef void (*_AddRefToCollectionAlias)(TESQuest*, BGSRefCollectionAlias*, TESObjectREFR*);
RelocAddr <_AddRefToCollectionAlias> AddRefToCollectionAlias(0x005DB3C0);

typedef void (*_ClearRefCollectionAlias)(TESQuest*, BGSRefCollectionAlias*);
RelocAddr <_ClearRefCollectionAlias> ClearRefCollectionAlias(0x005DB200);

typedef UInt32(*_GetItemCount)(VirtualMachine*, UInt32, TESObjectREFR*, TESForm*);
RelocAddr <_GetItemCount> GetItemCount(0x01406C00);

typedef void (*_Stop)(VirtualMachine*, UInt32, TESQuest*);
RelocAddr <_Stop> Stop(0x014498E0);

typedef bool (*_HasKeyword)(VirtualMachine*, UInt32, RefrOrInventoryObj*, BGSKeyword*);
RelocAddr <_HasKeyword> HasKeyword(0x014085F0);

typedef bool (*_IsCreated)(TESForm*);
RelocAddr <_IsCreated> IsCreated(0x00153CC0);

typedef TESActorBase* (*_GetActorBase)(Actor*);
RelocAddr <_GetActorBase> GetActorBase(0x00D702A0);

BGSInventoryList* staticContainer = nullptr;
TESObjectREFR* targetContainer = nullptr;
TESObjectREFR* ReturnMarker = nullptr;

BGSListForm* BlueList = nullptr;
BGSListForm* RedList = nullptr;
BGSListForm* AddonKeywordList = nullptr;
BGSListForm* BuyCoreActiList = nullptr;
BGSListForm* AllCouponList = nullptr;

TESQuest* ManageQuest = nullptr;
TESQuest* DropQuest = nullptr;
TESForm* CoreForm = nullptr;
TESForm* Caps001 = nullptr;

std::vector<BSFixedString> FirstPanalNodeArray;
std::vector<int> iBreakArray;
std::vector<int> iCoreArray;
std::vector<int> iDamageArray;
std::vector<int> iSuccessArray;

std::vector<BSFixedString> BuyCoreNodeArray;
std::vector<BSFixedString> CapNodeArray01;
std::vector<BSFixedString> CapNodeArray02;
std::vector<BSFixedString> CapNodeArray03;
std::vector<BSFixedString> CapNodeArray04;

BGSListForm* DespAddonList = nullptr;

BGSKeyword* Legendery = nullptr;

int iCorePrice = 500;

std::string basePath;

bool isReadOnly = false;

// 4 = 파워아머 5 = 정크젯 6 = 작업장 7 = 주사기 총 8 = 적의 파워아머? 9, 10 = 알 수 없음. 절도 반응 없음.
SInt32 containerMenuMode = 3;

std::string Base64Table = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";

std::string Base64Decode(std::string value)
{
	std::string str = std::regex_replace(value, std::regex("[^0-9a-zA-Z+/]"), "");
	if (str.empty())
	{
		return str;
	}
	str += "AAAA";
	UInt32 strLength = str.length();
	UInt32 tChars = 0;
	std::vector<char> arr;
	for (UInt32 i = 0; i < strLength - 4; i += 4)
	{
		tChars = Base64Table.find(str[i + 3]) + (Base64Table.find(str[i + 2]) << 6) + (Base64Table.find(str[i + 1]) << 0x0C) + (Base64Table.find(str[i]) << 0x12);
		arr.push_back((tChars >> 0x10) & 0xFF);
		arr.push_back((tChars >> 0x08) & 0xFF);
		arr.push_back(tChars & 0xFF);
	}
	arr.push_back(0);
	return arr.data();
}

std::string Base64Encode(std::string str)
{
	if (str.empty())
	{
		return str;
	}
	std::vector<unsigned char> arr;
	UInt32 strLength = str.length();
	for (UInt32 i = 0; i < strLength; i++)
	{
		arr.push_back((unsigned char)str[i]);
	}
	std::vector<char> arr2;
	for (UInt32 i = 0; i < strLength - 2; i += 3)
	{
		arr2.push_back(Base64Table[arr[i] >> 0x02]);
		arr2.push_back(Base64Table[((arr[i] & 0x03) << 0x04) + (arr[i + 1] >> 0x04)]);
		arr2.push_back(Base64Table[((arr[i + 1] & 0x0F) << 0x02) + (arr[i + 2] >> 0x06)]);
		arr2.push_back(Base64Table[arr[i + 2] & 0x3F]);
	}
	if (strLength % 3 == 1)
	{
		arr2.push_back(Base64Table[arr[strLength - 1] >> 0x02]);
		arr2.push_back(Base64Table[(arr[strLength - 1] & 0x03) << 0x04]);
		arr2.push_back('=');
		arr2.push_back('=');
	}
	else if (strLength % 3 == 2)
	{
		arr2.push_back(Base64Table[arr[strLength - 2] >> 0x02]);
		arr2.push_back(Base64Table[((arr[strLength - 2] & 0x03) << 0x04) + (arr[strLength - 1] >> 0x04)]);
		arr2.push_back(Base64Table[(arr[strLength - 1] & 0x0F) << 0x02]);
		arr2.push_back('=');
	}
	arr2.push_back(0);
	return arr2.data();
}

std::string GetStringByForm(TESForm* tForm, char delimeter = '|')
{
	if (tForm != nullptr && LookupFormByID(tForm->formID) == tForm)
	{
		std::stringstream stream;
		ModInfo* info;
		UInt32 target = tForm->formID;

		if ((target >> 24) == 0xFE)
		{
			(*g_dataHandler)->modList.lightMods.GetNthItem((target >> 12) & 0xFFF, info);
			if (info != nullptr)
			{
				stream << info->name << delimeter << std::hex << (target & 0xFFF);
			}
		}
		else if ((target >> 24) != 0xFF)
		{
			(*g_dataHandler)->modList.loadedMods.GetNthItem(target >> 24, info);
			if (info != nullptr)
			{
				stream << info->name << delimeter << std::hex << (target & 0xFFFFFF);
			}
		}

		return stream.str();
	}
	return "";
}

// from https://ssungkang.tistory.com/entry/C-string-%EB%AC%B8%EC%9E%90%EC%97%B4-%EB%82%98%EB%88%84%EB%8A%94-split
std::vector<std::string> split_string(std::string inputString, char delimiter) {
	std::vector<std::string> answer;
	std::stringstream ss(inputString);
	std::string temp;
	while (getline(ss, temp, delimiter)) {
		temp = std::regex_replace(temp, std::regex("^\\s+"), ""); // strip whitespace
		temp = std::regex_replace(temp, std::regex("\\s+$"), ""); // strip whitespace
		answer.push_back(temp);
	}
	return answer;
}

std::vector<std::string>* GetLinesFromFile(std::string dataPath)
{
	std::vector<std::string>* result = new std::vector<std::string>();
	std::ifstream ifs(dataPath);
	if (!ifs.is_open())
	{
		return result;
	}
	std::string tString = "", efshName;
	UInt32 formID = 0;
	TESEffectShader* tShader = nullptr;
	while (getline(ifs, tString))
	{
		tString = std::regex_replace(tString, std::regex("(#|;|//)(.*)$"), std::string("")); // remove comment
		tString = std::regex_replace(tString, std::regex("^\\s+"), ""); // strip whitespace
		tString = std::regex_replace(tString, std::regex("\\s+$"), ""); // strip whitespace
		result->push_back(tString);
	}
	return result;
}

void DoDefaults()
{
	char resultBuf[256];

	UInt32 tInt = GetModuleFileName(GetModuleHandle(NULL), resultBuf, sizeof(resultBuf));

	basePath = std::string(resultBuf, tInt);

	basePath = basePath.substr(0, basePath.find_last_of('\\'));

	FirstPanalNodeArray = { "FM_0", "FM_1", "FM_2", "FM_3", "FM_4" , "FM_5"};

	iBreakArray = { 0, 0, 0, 0, 0, 0, 0, 0, 20, 25, 30, 32, 35, 35, 35, 0};
	iCoreArray = { 15, 16, 18, 20, 25, 30, 40, 50, 80, 100, 120, 150, 180, 220, 300, 0};
	iDamageArray = { 0, 2, 4, 6, 8, 12, 16, 20, 25, 35, 45, 55, 65, 75, 85, 98};
	iSuccessArray = { 99, 99, 99, 99, 70, 60, 55, 48, 30, 25, 20, 18, 15, 15, 15, 0 };
	
	BuyCoreNodeArray = { "BuyNode_1", "BuyNode_5", "BuyNode_10", "BuyNode_50", "BuyNode_100", "BuyNode_500", "BuyNode_All", "BuyNode_Zero" };
	CapNodeArray01 = { "BuyNumber_16", "BuyNumber_15", "BuyNumber_14", "BuyNumber_13", "BuyNumber_12", "BuyNumber_11" };
	CapNodeArray02 = { "BuyNumber_26", "BuyNumber_25", "BuyNumber_24", "BuyNumber_23", "BuyNumber_22", "BuyNumber_21" };
	CapNodeArray03 = { "BuyNumber_33", "BuyNumber_32", "BuyNumber_31"};
	CapNodeArray04 = { "BuyNumber_43", "BuyNumber_42", "BuyNumber_41" };

	BlueList = DYNAMIC_CAST(GetFormFromFile((*g_gameVM)->m_virtualMachine, 0, nullptr, 0x00000886, new BSFixedString("WE_WeaponEnhancer.esp")), TESForm, BGSListForm);

	RedList = DYNAMIC_CAST(GetFormFromFile((*g_gameVM)->m_virtualMachine, 0, nullptr, 0x00000887, new BSFixedString("WE_WeaponEnhancer.esp")), TESForm, BGSListForm);

	ManageQuest = DYNAMIC_CAST(GetFormFromFile((*g_gameVM)->m_virtualMachine, 0, nullptr, 0x00000800, new BSFixedString("WE_WeaponEnhancer.esp")), TESForm, TESQuest);

	CoreForm = GetFormFromFile((*g_gameVM)->m_virtualMachine, 0, nullptr, 0x0000085E, new BSFixedString("WE_WeaponEnhancer.esp"));

	ReturnMarker = DYNAMIC_CAST(GetFormFromFile((*g_gameVM)->m_virtualMachine, 0, nullptr, 0x00000850, new BSFixedString("WE_WeaponEnhancer.esp")), TESForm, TESObjectREFR);

	DropQuest = DYNAMIC_CAST(GetFormFromFile((*g_gameVM)->m_virtualMachine, 0, nullptr, 0x000008A1, new BSFixedString("WE_WeaponEnhancer.esp")), TESForm, TESQuest);

	AddonKeywordList = DYNAMIC_CAST(GetFormFromFile((*g_gameVM)->m_virtualMachine, 0, nullptr, 0x00000944, new BSFixedString("WE_WeaponEnhancer.esp")), TESForm, BGSListForm);

	BuyCoreActiList = DYNAMIC_CAST(GetFormFromFile((*g_gameVM)->m_virtualMachine, 0, nullptr, 0x00000A38, new BSFixedString("WE_WeaponEnhancer.esp")), TESForm, BGSListForm);

	//Caps001 = GetFormFromFile((*g_gameVM)->m_virtualMachine, 0, nullptr, 0x0000000F, new BSFixedString("Fallout4.esm"));
	Caps001 = (TESForm*)LookupFormByID(0xf);

	DespAddonList = DYNAMIC_CAST(GetFormFromFile((*g_gameVM)->m_virtualMachine, 0, nullptr, 0x00000970, new BSFixedString("WE_WeaponEnhancer.esp")), TESForm, BGSListForm);

	AllCouponList = DYNAMIC_CAST(GetFormFromFile((*g_gameVM)->m_virtualMachine, 0, nullptr, 0x00000A60, new BSFixedString("WE_WeaponEnhancer.esp")), TESForm, BGSListForm);
	//0 - 10퍼 1 - 20퍼 2 - 30퍼 3 - 애드온공짜 4 - A랭크
	Legendery = (BGSKeyword*)LookupFormByID(0x001CF26C);
}

//const std::string& filePath = basePath + "\\Data\\강화기록.txt";

std::string getCurrentDateTime() {
	auto now = std::chrono::system_clock::now();
	auto in_time_t = std::chrono::system_clock::to_time_t(now);

	std::stringstream ss;
	ss << std::put_time(std::localtime(&in_time_t), "(%m-%d %H:%M)");
	return ss.str();
}

void SaveItemUseCheck(StaticFunctionTag* base, BSFixedString text, BSFixedString Coupon)
{
	std::string filePath = basePath + "\\Data\\강화기록.txt";
	std::string newContent = text.c_str();
	std::string currentTime = getCurrentDateTime();

	// 파일 열기
	std::ifstream inputFile(filePath);

	// 기존 내용 읽기
	std::string existingContent;
	if (inputFile.is_open()) {
		std::stringstream buffer;
		buffer << inputFile.rdbuf();
		existingContent = buffer.str();
		inputFile.close();
	}

	// 파일 열고 쓰기
	std::ofstream outputFile(filePath);
	if (outputFile.is_open()) {
		// 새로운 내용 추가
		outputFile << newContent << " " << currentTime << Coupon << "\n";

		// 기존 내용이 있으면 한 줄씩 아래로 내리기
		if (!existingContent.empty()) {
			outputFile << existingContent;
		}

		outputFile.close();
		std::cout << "파일에 내용이 추가되었습니다.\n";
	}
	else {
		std::cerr << "파일을 열 수 없습니다.\n";
	}
}

ItemData* GetItemData(std::string str)
{
	ItemData* resultPtr = nullptr;
	TESBoundObject* addon = nullptr;
	SInt32 index = 0;
	char delimeter = '|';

	try
	{
		if (str.find(delimeter) != -1)
		{
			std::vector<std::string> result = split_string(str, delimeter);
			if (result.size() > 1)
			{
				const ModInfo* mod = (*g_dataHandler)->LookupModByName(result.at(0).c_str());
				if (mod != nullptr)
				{
					addon = DYNAMIC_CAST(LookupFormByID(mod->GetFormID(std::stoi(result.at(1), nullptr, 16))), TESForm, TESBoundObject);
					if (addon != nullptr)
					{
						resultPtr = new ItemData();
						resultPtr->form = addon;
						resultPtr->count = 1;
						if (result.size() > 2)
						{
							result.erase(result.begin(), result.begin() + 2);
							for (std::string omod : result)
							{
								if (omod.find(',') != -1)
								{
									std::vector<std::string> result2 = split_string(omod, ',');
									mod = (*g_dataHandler)->LookupModByName(result2.at(0).c_str());
									if (mod != nullptr)
									{
										TESForm* tForm = LookupFormByID(mod->GetFormID(std::stoi(result2.at(1), nullptr, 16)));
										if (tForm != nullptr)
										{
											if (tForm->formType == kFormType_OMOD)
											{
												resultPtr->mods.push_back(tForm->formID);
											}
										}
									}
								}
								else if (omod[0] == ':')
								{
									resultPtr->hasCustomName = true;
									resultPtr->customName = Base64Decode(omod);
								}
								else if (omod[0] == '@')
								{
									resultPtr->count = std::stoul(omod.substr(1));
								}
							}
						}
					}
				}
				else
				{
					_MESSAGE("%s is lookup failed. check mod state.", str.c_str());
				}
			}
		}
	}
	catch (...)
	{
		resultPtr = nullptr;
	}
	return resultPtr;
}

void LoadStatics()
{
	BGSInventoryList* tempList = (BGSInventoryList*)operator_new(0x80);
	if (tempList != nullptr)
	{
		UInt32 tInt = 0;
		BGSInventoryList_ctor(tempList, nullptr, &tInt);
		staticContainer = tempList;
		std::string targetFile = basePath + "\\Data\\F4SE\\Plugins\\" + PLUGIN_NAME + ".cont";
		std::vector<std::string>* lines = GetLinesFromFile(targetFile);
		for (std::string line : *lines)
		{
			ItemData* data = GetItemData(line);
			if (data != nullptr)
			{
				VMArray<BGSMod::Attachment::Mod*> arr;
				for (UInt32 formID : data->mods)
				{
					BGSMod::Attachment::Mod* tMod = (BGSMod::Attachment::Mod*)Runtime_DynamicCast((void*)LookupFormByID(formID), RTTI_TESForm, RTTI_BGSMod__Attachment__Mod);
					if (tMod != nullptr)
					{
						arr.Push(&tMod);
					}
				}
				//AddItemToContainer(nullptr, data->form, data->count, data->customName.c_str(), arr);
				delete data;
			}
		}
		delete lines;
	}
}

void AddItemToContainer(StaticFunctionTag* base, TESForm* item, TESObjectREFR* ChestRef, SInt32 count, BSFixedString name, VMArray<BGSMod::Attachment::Mod*> mods)
{
	BGSInventoryList* targetList = nullptr;
	TESBoundObject* bound = DYNAMIC_CAST(item, TESForm, TESBoundObject);
	std::string customName = name.c_str();

	targetList = ChestRef->inventoryList;

	if (targetList != nullptr && bound != nullptr)
	{
		ExtraDataList* tempData = (ExtraDataList*)operator_new(0x28);
		if (tempData != nullptr)
		{
			ExtraDataList_ctor(tempData);
			InitItem(tempData, bound);
			if (!mods.IsNone())
			{
				BGSObjectInstanceExtra* tempExtra = (BGSObjectInstanceExtra*)operator_new(0x28);
				BGSObjectInstanceExtra_ctor(tempExtra);
				for (UInt32 i = 0; i < mods.Length(); i++)
				{
					BGSMod::Attachment::Mod* tMod = nullptr;
					mods.Get(&tMod, i);
					if (tMod != nullptr)
					{
						AddMod(tempExtra, tMod, 0, 1, true);
					}
				}
				AddExtra(tempData, tempExtra);
			}
			CreateInstanceDataForObjectAndExtra(bound, tempData, nullptr, false);
			CreateInstanceData(tempData, bound, true);
			if (!customName.empty())
			{
				SetOverrideName(tempData, customName.c_str());
			}
			AddItem(targetList, bound, count, tempData, 0);
			//PlaceAtMeFunctionBase(&handle, *g_player, (TESObjectCONT*)LookupFormByID(0x00020D57), 1, 0, 0, 1.0f, false);
			//LookupREFRByHandle(&handle, &targetContainer);
		}
		else if (customName.empty() && mods.IsNone())
		{
			AddItem(targetList, bound, count, nullptr, 0);
		}
	}
}

void ChangeItemName(StaticFunctionTag* base, TESObjectREFR* refr, TESObjectREFR* ChestRef, BSFixedString name)
{
	if (refr != nullptr && refr->baseForm != nullptr)
	{
		BSFixedString str;
		VMArray<BGSMod::Attachment::Mod*> arr;
		arr.SetNone(true);
		if (refr->extraDataList != nullptr)
		{
			BGSObjectInstanceExtra* extra = (BGSObjectInstanceExtra*)refr->extraDataList->GetByType(ExtraDataType::kExtraData_ObjectInstance);
			if (extra != nullptr && extra->data != nullptr && extra->data->blockSize != 0)
			{
				for (UInt32 i = 0; i < extra->data->blockSize / sizeof(BGSObjectInstanceExtra::Data::Form); i++)
				{
					BGSMod::Attachment::Mod* tMod = (BGSMod::Attachment::Mod*)Runtime_DynamicCast((void*)LookupFormByID(extra->data->forms[i].formId), RTTI_TESForm, RTTI_BGSMod__Attachment__Mod);
					if (tMod != nullptr)
					{
						arr.Push(&tMod);
					}
				}
				arr.SetNone(arr.Length() == 0);
			}
			ExtraTextDisplayData* text = (ExtraTextDisplayData*)refr->extraDataList->GetByType(ExtraDataType::kExtraData_TextDisplayData);
		}

		std::string input(name);

		// 정규표현식 패턴
		std::regex pattern("\\[([^\\]]*)\\]");

		// 정규표현식에 매칭되는 모든 부분 찾기
		std::sregex_iterator it(input.begin(), input.end(), pattern);
		std::sregex_iterator end;

		// 첫 번째 매칭된 부분 처리
		if (it != end) {
			std::smatch match = *it;
			std::string bracketedText = match[0].str();
			std::string remainingText = std::regex_replace(input, pattern, "");

			std::string combined = bracketedText + remainingText;
			
			name = combined.c_str();
		}

		AddItemToContainer(nullptr, refr->baseForm, ChestRef, 1, name, arr);
	}
}

void HidePanal(StaticFunctionTag* base, VMArray<TESObjectREFR*> SendArray) {
	int i = SendArray.Length();
	UInt32 c = 0;

	while (c < i) {
		TESObjectREFR* TempRef = nullptr;
		SendArray.Get(&TempRef, c);
		MoveToFunctionBase(TempRef, ReturnMarker, 0.0, 0.0, 0.0);
		c += 1;
	}
}

void HideNumber(StaticFunctionTag* base, BGSRefCollectionAlias* SendArray) {

	UInt32 i = GetRefCollectionCount(ManageQuest, SendArray);
	UInt32 c = 0;

	while (c < i) {
		TESObjectREFR* TempRef = nullptr;
		GetAtRefCollection(ManageQuest, SendArray, c, TempRef);
		if (TempRef != nullptr) {
			MoveToFunctionBase(TempRef, ReturnMarker, 0.0, 0.0, 0.0);
			REFR_Pointer_Release(nullptr, TempRef);
		}
		c += 1;
	}
	ClearRefCollectionAlias(ManageQuest, SendArray);
}

void ArrayMovetoNode(StaticFunctionTag* base, VMArray<TESObjectREFR*> SendRefArray, TESObjectREFR* TargetRef) {
	if (TargetRef == nullptr) {
		return;
	}

	UInt32 i = SendRefArray.Length();
	UInt32 c = 0;

	RefrOrInventoryObj* TatgetObj = nullptr;
	TatgetObj = new RefrOrInventoryObj();
	//TatgetObj->refr = TargetRef;

	while (c < i) {
		TESObjectREFR* TempRef = nullptr;
		SendRefArray.Get(&TempRef, c);
		TatgetObj->refr = TempRef;
		BSFixedString TargetNode = FirstPanalNodeArray[c];
		MovetoNode((*g_gameVM)->m_virtualMachine, 0, TatgetObj, TargetRef, new BSFixedString(TargetNode), new BSFixedString(""));
		EnableNoWait((*g_gameVM)->m_virtualMachine, 0, TempRef, false);
		c += 1;
	}
}

void PlaceAndAddRef(BGSListForm* NumberList, BSFixedString NodeName, UInt32 iIndex, TESObjectREFR* TargetRef, BGSRefCollectionAlias* NumberCollection) {
	TESForm* myForm = GetItemAtFormListIndex(NumberList, iIndex);
	if (myForm != nullptr) {
		TESObjectREFR* TempRef = PlaceAtNode((*g_gameVM)->m_virtualMachine, 0, TargetRef, new BSFixedString(NodeName), myForm, 1, false, false, true, false);
		AddRefToCollectionAlias(ManageQuest, NumberCollection, TempRef);
		EnableNoWait((*g_gameVM)->m_virtualMachine, 0, TempRef, false);
	}
}

void PlaceNumber(StaticFunctionTag* base, TESObjectREFR* TargetRef, UInt32 iLevel, BGSRefCollectionAlias* NumberCollection)
{
	if (TargetRef == nullptr) {
		return;
	}

	if (iLevel < 10) {
		PlaceAndAddRef(BlueList, "Line_1_01", iLevel, TargetRef, NumberCollection);
	}
	else {
		PlaceAndAddRef(BlueList, "Line_1_01", 1, TargetRef, NumberCollection);
		PlaceAndAddRef(BlueList, "Line_1_02", iLevel % 10, TargetRef, NumberCollection);
	}

	int iDamage = iDamageArray[iLevel];
	int iOne = iDamage % 10;
	if (iDamage >= 10) {
		PlaceAndAddRef(BlueList, "Line_2_01", (UInt32)((iDamage - iOne) / 10), TargetRef, NumberCollection);
	}
	PlaceAndAddRef(BlueList, "Line_2_02", iOne, TargetRef, NumberCollection);

	int iBreak = iBreakArray[iLevel];
	iOne = iBreak % 10;
	if (iBreak == 0) {
		PlaceAndAddRef(BlueList, "Line_5_02", 0, TargetRef, NumberCollection);
	}
	else {
		if (iBreak >= 10) {
			PlaceAndAddRef(RedList, "Line_5_01", (UInt32)((iBreak - iOne) / 10), TargetRef, NumberCollection);
		}
		PlaceAndAddRef(RedList, "Line_5_02", iOne, TargetRef, NumberCollection);
	}

	BGSListForm* NumberList = BlueList;
	UInt32 iRemainCore = GetItemCount((*g_gameVM)->m_virtualMachine, 0, *g_player, CoreForm);
	UInt32 iCore = iCoreArray[iLevel];
	iOne = iRemainCore % 10;
	UInt32 iTen = iRemainCore % 100 - iOne;
	if (iRemainCore >= 999) {
		PlaceAndAddRef(NumberList, "Line_1_21", 9, TargetRef, NumberCollection);
		PlaceAndAddRef(NumberList, "Line_1_22", 9, TargetRef, NumberCollection);
		PlaceAndAddRef(NumberList, "Line_1_23", 9, TargetRef, NumberCollection);
	}
	else {
		if (iRemainCore < 10) {
			PlaceAndAddRef(NumberList, "Line_1_21", iOne, TargetRef, NumberCollection);
		}
		else if (iRemainCore < 100) {
			PlaceAndAddRef(NumberList, "Line_1_21", (UInt32)(iTen / 10), TargetRef, NumberCollection);
			PlaceAndAddRef(NumberList, "Line_1_22", iOne, TargetRef, NumberCollection);
		}
		else {
			PlaceAndAddRef(NumberList, "Line_1_21", (UInt32)((iRemainCore - iTen - iOne) / 100), TargetRef, NumberCollection);
			PlaceAndAddRef(NumberList, "Line_1_22", (UInt32)(iTen / 10), TargetRef, NumberCollection);
			PlaceAndAddRef(NumberList, "Line_1_23", iOne, TargetRef, NumberCollection);
		}
	}

	if (iCore > iRemainCore) {
		NumberList = RedList;
	}
	iOne = iCore % 10;
	iTen = iCore % 100 - iOne;
	if (iCore >= 100) {
		PlaceAndAddRef(NumberList, "Line_1_11", (UInt32)((iCore - iTen - iOne) / 100), TargetRef, NumberCollection);
	}
	if (iCore >= 10) {
		PlaceAndAddRef(NumberList, "Line_1_12", (UInt32)(iTen / 10), TargetRef, NumberCollection);
	}
	PlaceAndAddRef(NumberList, "Line_1_13", iOne, TargetRef, NumberCollection);
}

float GetRandom(StaticFunctionTag* base)
{
	std::random_device rd;
	std::mt19937 mt(rd());
	std::uniform_real_distribution<float> dist(0, 100000);
	float randNum = dist(mt);

	return randNum;
}

UInt32 CheckKeywordIndex(StaticFunctionTag* base, TESObjectREFR* TargetRef, BGSListForm* KeywordList) {
	RefrOrInventoryObj* TatgetObj = nullptr;
	TatgetObj = new RefrOrInventoryObj();
	TatgetObj->refr = TargetRef;

	UInt32 i = GetSize((*g_gameVM)->m_virtualMachine, 0, KeywordList);

	UInt32 c = 0;
	bool bHasKeyword = false;
	while (c < i && !bHasKeyword) {
		TESForm* myForm = GetItemAtFormListIndex(KeywordList, c);
		BGSKeyword* TempKeyword = DYNAMIC_CAST(myForm, TESForm, BGSKeyword);
		bHasKeyword = HasKeyword((*g_gameVM)->m_virtualMachine, 0, TatgetObj, TempKeyword);
		c++;
	}

	if (!bHasKeyword) {
		return 100;
	}
	else {
		c--;
		return c;
	}
}

void PlaceAddonNumber(StaticFunctionTag* base, TESObjectREFR* TargetRef, BGSRefCollectionAlias* NumberCollection) {
	if (TargetRef == nullptr) {
		return;
	}

	BGSListForm* NumberList = BlueList;
	UInt32 iRemainCore = GetItemCount((*g_gameVM)->m_virtualMachine, 0, *g_player, CoreForm);
	UInt32 iOne = iRemainCore % 10;
	UInt32 iTen = iRemainCore % 100 - iOne;
	if (iRemainCore >= 999) {
		PlaceAndAddRef(NumberList, "Addon_2_01", 9, TargetRef, NumberCollection);
		PlaceAndAddRef(NumberList, "Addon_2_02", 9, TargetRef, NumberCollection);
		PlaceAndAddRef(NumberList, "Addon_2_03", 9, TargetRef, NumberCollection);
	}
	else {
		if (iRemainCore < 10) {
			PlaceAndAddRef(NumberList, "Addon_2_01", iOne, TargetRef, NumberCollection);
		}
		else if (iRemainCore < 100) {
			PlaceAndAddRef(NumberList, "Addon_2_01", (UInt32)(iTen / 10), TargetRef, NumberCollection);
			PlaceAndAddRef(NumberList, "Addon_2_02", iOne, TargetRef, NumberCollection);
		}
		else {
			PlaceAndAddRef(NumberList, "Addon_2_01", (UInt32)((iRemainCore - iTen - iOne) / 100), TargetRef, NumberCollection);
			PlaceAndAddRef(NumberList, "Addon_2_02", (UInt32)(iTen / 10), TargetRef, NumberCollection);
			PlaceAndAddRef(NumberList, "Addon_2_03", iOne, TargetRef, NumberCollection);
		}
	}
}

VMArray<UInt32> CheckAddonKeyword(StaticFunctionTag* base, TESObjectREFR* TargetRef) {
	UInt32 iIndex = 100;
	UInt32 i = 0;
	VMArray<UInt32> ReturnArray;
	ReturnArray.Resize(2);

	bool bRefeat = true;
	while (i < 3 && iIndex > 99) {
		TESForm* myForm = GetItemAtFormListIndex(AddonKeywordList, i);
		BGSListForm* TempList = DYNAMIC_CAST(myForm, TESForm, BGSListForm);
		iIndex = CheckKeywordIndex(base, TargetRef, TempList);
		i++;
	}
	i--;
	ReturnArray.Set(&i, 0);
	ReturnArray.Set(&iIndex, 1);

	return ReturnArray;
}

UInt32 SetBuyCoreNumber(StaticFunctionTag* base, TESObjectREFR* TargetRef, BGSRefCollectionAlias* SendCollection, UInt32 iReserve) {
	
	int iCaps = GetItemCount((*g_gameVM)->m_virtualMachine, 0, *g_player, Caps001);
	int iCore = GetItemCount((*g_gameVM)->m_virtualMachine, 0, *g_player, CoreForm);

	iCaps = (iCaps < 999999) ? iCaps : 999999;

	int number = iCaps;
	int originalNumber = number;

	// 숫자의 자리수를 구하기
	int digitCount = 0;
	do {
		number /= 10;
		digitCount++;
	} while (number > 0);

	// 각 자리수를 배열에 저장
	int* digits = new int[digitCount]; // 동적 배열을 사용
	int index = 0; // 배열의 인덱스
	while (originalNumber > 0) {
		digits[index++] = originalNumber % 10;
		originalNumber /= 10;
	}

	if (iCaps == 0) {
		PlaceAndAddRef(BlueList, CapNodeArray01[0], 0, TargetRef, SendCollection);
	}
	else {
		for (int count = 0; count < digitCount; ++count) {
			PlaceAndAddRef(BlueList, CapNodeArray01[count], digits[count], TargetRef, SendCollection);
		}
	}
	delete[] digits;


	iCore = (iCore < 999) ? iCore : 999;

	number = iCore;
	originalNumber = number;

	// 숫자의 자리수를 구하기
	digitCount = 0;
	do {
		number /= 10;
		digitCount++;
	} while (number > 0);

	// 각 자리수를 배열에 저장
	digits = new int[digitCount]; // 동적 배열을 사용
	index = 0; // 배열의 인덱스
	while (originalNumber > 0) {
		digits[index++] = originalNumber % 10;
		originalNumber /= 10;
	}

	if (iCore == 0) {
		PlaceAndAddRef(BlueList, CapNodeArray03[0], 0, TargetRef, SendCollection);
	}
	else {
		for (int count = 0; count < digitCount; ++count) {
			PlaceAndAddRef(BlueList, CapNodeArray03[count], digits[count], TargetRef, SendCollection);
		}
	}
	// 동적으로 할당한 배열 메모리 해제
	delete[] digits;


	iReserve = (iReserve < 999) ? iReserve : 999;

	int iBuyCaps = iReserve * iCorePrice;
	iCaps = (iCaps < iBuyCaps) ? iCaps : iBuyCaps;
	iCaps = iCaps - iCaps % iCorePrice;

	number = iCaps;
	originalNumber = number;

	// 숫자의 자리수를 구하기
	digitCount = 0;
	do {
		number /= 10;
		digitCount++;
	} while (number > 0);

	// 각 자리수를 배열에 저장
	digits = new int[digitCount]; // 동적 배열을 사용
	index = 0; // 배열의 인덱스
	while (originalNumber > 0) {
		digits[index++] = originalNumber % 10;
		originalNumber /= 10;
	}

	if (iCaps == 0) {
		PlaceAndAddRef(BlueList, CapNodeArray02[0], 0, TargetRef, SendCollection);
	}
	else {
		for (int count = 0; count < digitCount; ++count) {
			PlaceAndAddRef(BlueList, CapNodeArray02[count], digits[count], TargetRef, SendCollection);
		}
	}
	// 동적으로 할당한 배열 메모리 해제
	delete[] digits;


	iReserve = iCaps / iCorePrice;
	iCaps = iReserve;

	number = iCaps;
	originalNumber = number;

	// 숫자의 자리수를 구하기
	digitCount = 0;
	do {
		number /= 10;
		digitCount++;
	} while (number > 0);

	// 각 자리수를 배열에 저장
	digits = new int[digitCount]; // 동적 배열을 사용
	index = 0; // 배열의 인덱스
	while (originalNumber > 0) {
		digits[index++] = originalNumber % 10;
		originalNumber /= 10;
	}

	if (iCaps == 0) {
		PlaceAndAddRef(BlueList, CapNodeArray04[0], 0, TargetRef, SendCollection);
	}
	else {
		for (int count = 0; count < digitCount; ++count) {
			PlaceAndAddRef(BlueList, CapNodeArray04[count], digits[count], TargetRef, SendCollection);
		}
	}
	// 동적으로 할당한 배열 메모리 해제
	delete[] digits;



	if (iReserve < 0) {
		return 0;
	}
	else {
		return iReserve;
	}
	
}

void SetBuyCoreMenu(StaticFunctionTag* base, TESObjectREFR* TargetRef, BGSRefCollectionAlias* SendCollection) {
	int i = static_cast<int>(BuyCoreNodeArray.size());

	for (int count = 0; count < i; ++count) {
		TESForm* myForm = GetItemAtFormListIndex(BuyCoreActiList, count);
		TESObjectREFR* TempRef = PlaceAtNode((*g_gameVM)->m_virtualMachine, 0, TargetRef, new BSFixedString(BuyCoreNodeArray[count]), myForm, 1, false, false, true, false);
		AddRefToCollectionAlias(ManageQuest, SendCollection, TempRef);
		EnableNoWait((*g_gameVM)->m_virtualMachine, 0, TempRef, false);
	}
}

TESObjectREFR* ChangeDespAddon(StaticFunctionTag* base, TESObjectREFR* TargetRef, BGSRefCollectionAlias* SendCollection, TESObjectREFR* DespAddonRef, float fMove) {
	if (DespAddonRef != nullptr) {
		MoveToFunctionBase(DespAddonRef, ReturnMarker, 0.0, 0.0, 0.0);
	}

	int iCount = GetSize((*g_gameVM)->m_virtualMachine, 0, DespAddonList) - 1;

	if (fMove < 0) { 
		fMove = 0;
	}else if(fMove > iCount) {
		fMove = iCount;
	}

	iCount += 1;

	HideNumber(base, SendCollection);

	int iMaxTen = iCount / 10;
	int iMaxOne = iCount % 10;

	PlaceAndAddRef(BlueList, "Desp_21", iMaxTen, TargetRef, SendCollection);
	PlaceAndAddRef(BlueList, "Desp_22", iMaxOne, TargetRef, SendCollection);
	
	int iMove = static_cast<int>(fMove) + 1;
	int iTen = iMove / 10;
	int iOne = iMove % 10;

	PlaceAndAddRef(BlueList, "Desp_11", iTen, TargetRef, SendCollection);
	PlaceAndAddRef(BlueList, "Desp_12", iOne, TargetRef, SendCollection);

	iMove -= 1;

	TESForm* myForm = GetItemAtFormListIndex(DespAddonList, iMove);
	TESObjectREFR* ChangeAddonRef = PlaceAtNode((*g_gameVM)->m_virtualMachine, 0, TargetRef, new BSFixedString("ModDespAddonNode"), myForm, 1, false, false, true, false);
	AddRefToCollectionAlias(ManageQuest, SendCollection, ChangeAddonRef);
	EnableNoWait((*g_gameVM)->m_virtualMachine, 0, ChangeAddonRef, false);

	return ChangeAddonRef;
}

void CorpseNumber(StaticFunctionTag* base, TESObjectREFR* TargetRef, UInt32 i, BGSRefCollectionAlias* SendCollection) {
	int iHund = i / 100;
	int iTen = (i / 10) % 10;
	int iOne = i % 10;

	if (i >= 100) {
		if (i > 999) {
			i = 999;
		}
		PlaceAndAddRef(BlueList, "Corpse_11", iHund, TargetRef, SendCollection);
		PlaceAndAddRef(BlueList, "Corpse_12", iTen, TargetRef, SendCollection);
		PlaceAndAddRef(BlueList, "Corpse_13", iOne, TargetRef, SendCollection);
	}
	else if (i >= 10) {
		PlaceAndAddRef(BlueList, "Corpse_11", iTen, TargetRef, SendCollection);
		PlaceAndAddRef(BlueList, "Corpse_12", iOne, TargetRef, SendCollection);
	}
	else {
		PlaceAndAddRef(BlueList, "Corpse_11", iOne, TargetRef, SendCollection);
	}
}

float GetPercent() {
	std::random_device rd;
	std::mt19937 mt(rd());
	std::uniform_real_distribution<float> dist(0, 100);
	float randNum = dist(mt);

	return randNum;
}

void InjectCore(StaticFunctionTag* base, BGSInventoryList* targetList, ExtraDataList* tempData, int iRandom, int iBase) {
	int count = (static_cast<int>(GetRandom(base)) % iRandom) + iBase;
	TESBoundObject* bound = DYNAMIC_CAST(CoreForm, TESForm, TESBoundObject);
	InitItem(tempData, bound);
	AddItem(targetList, bound, count, tempData, 0);
}

void InjectCoupon(StaticFunctionTag* base, BGSInventoryList* targetList, ExtraDataList* tempData, int iIndex) {
	TESForm* Coupon = GetItemAtFormListIndex(AllCouponList, iIndex);
	TESBoundObject* bound = DYNAMIC_CAST(Coupon, TESForm, TESBoundObject);
	InitItem(tempData, bound);
	AddItem(targetList, bound, 1, tempData, 0);
}

void CallRewardContainer(StaticFunctionTag* base, TESObjectREFR* TargetRef) {
	BGSInventoryList* targetList = TargetRef->inventoryList;
	ExtraDataList* tempData = (ExtraDataList*)operator_new(0x28);
	ExtraDataList_ctor(tempData);

	int iLow_Core = 62;
	int iLow_Coupon = 70;
	int iMid_Core = 88;
	int iMid_Coupon = 94;
	int iHigh_Core = 97;

	int iBaseCore_Low = 18;
	int iBaseCore_Mid = 33;
	int iBaseCore_High = 50;

	int iRandom_Low = 6;
	int iRandom_Mid = 6;
	int iRandom_High = 15;


	if (targetList != nullptr && tempData != nullptr && TargetRef != nullptr) {
		float fRandom = GetPercent();
		if (fRandom < iLow_Core) {
			InjectCore(base, targetList, tempData, iRandom_Low, iBaseCore_Low);
			}
		else if (fRandom < iLow_Coupon) {
			InjectCoupon(base, targetList, tempData, 0);
		}
		else if (fRandom < iMid_Core) {
			InjectCore(base, targetList, tempData, iRandom_Mid, iBaseCore_Mid);
		}			
		else if (fRandom < iMid_Coupon) {
			int iIndex = (static_cast<int>(GetRandom(base)) % 2) * 2 + 1; // 1 또는 3을 구함
			InjectCoupon(base, targetList, tempData, iIndex);
		}			
		else if(fRandom < iHigh_Core){
			InjectCore(base, targetList, tempData, iRandom_High, iBaseCore_High);
		}		
		else{
			int iIndex = (static_cast<int>(GetRandom(base)) % 2) * 2 + 2; // 2 또는 4
			InjectCoupon(base, targetList, tempData, iIndex);
		}
	}
}

void DeathNPCItemAdd(StaticFunctionTag* base, TESObjectREFR* TargetRef, BGSRefCollectionAlias* SendCollection)
{
	Stop((*g_gameVM)->m_virtualMachine, 0, DropQuest);

	if (TargetRef == nullptr) {
		return;
	}

	TESRace* Roach = (TESRace*)LookupFormByID(0x0004716C);
	TESRace* ActorRace = TargetRef->GetActorRace();

	if (ActorRace == Roach) {
		return;
	}

	BGSInventoryList* targetList = TargetRef->inventoryList;
	ExtraDataList* tempData = (ExtraDataList*)operator_new(0x28);
	ExtraDataList_ctor(tempData);

	if (targetList == nullptr || tempData == nullptr) {
		return;
	}

	AddRefToCollectionAlias(ManageQuest, SendCollection, TargetRef);

	RefrOrInventoryObj* TatgetObj = nullptr;
	TatgetObj = new RefrOrInventoryObj();
	TatgetObj->refr = TargetRef;
	TESForm* ActorBase = TargetRef->baseForm;

	int iCore_Perfect = 23;
	int iCore_High = 15;
	int iCore_Mid = 8;
	int iCore_Low = 4;

	int iRandom_Perfect = 9;
	int iRandom_Legend = 5;
	int iRandom_High = 7;
	int iRandom_Mid = 7;
	int iRandom_Low = 5;

	int Find_Legend = 20;
	int Find_Mid = 25;
	int Find_Low = 9;

	TESForm* Kellogg = (TESForm*)LookupFormByID(0x0009BC6C);

	TESRace* SentryBot = (TESRace*)LookupFormByID(0x000AE0B7);
	TESRace* Behi = (TESRace*)LookupFormByID(0x000BB7D9);
	TESRace* Queen = (TESRace*)LookupFormByID(0x000E12A6);

	TESRace* DeathClaw = (TESRace*)LookupFormByID(0x0001DB4A);
	TESRace* Assult = (TESRace*)LookupFormByID(0x000D8417);

	if (HasKeyword((*g_gameVM)->m_virtualMachine, 0, TatgetObj, Legendery)) {
		if (GetPercent() < Find_Legend) {
			InjectCore(base, targetList, tempData, iRandom_Legend, iCore_Mid);
		}
	}

	if (ActorBase == Kellogg) {
		InjectCore(base, targetList, tempData, iRandom_Perfect, iCore_Perfect);
		int iIndex = (static_cast<int>(GetRandom(base)) % 4) + 1; // 1~4
		InjectCoupon(base, targetList, tempData, iIndex);
	}
	else if(ActorRace == SentryBot || ActorRace == Behi || ActorRace == Queen) {
		InjectCore(base, targetList, tempData, iRandom_High, iCore_High);
		int iIndex = (static_cast<int>(GetRandom(base)) % 10);
		if (iIndex < 8) {
			InjectCoupon(base, targetList, tempData, 1);
		}
		else if (iIndex < 9) {
			InjectCoupon(base, targetList, tempData, 2);
		}
		else
		{
			InjectCoupon(base, targetList, tempData, 4);
		}
	}
	else if (ActorRace == DeathClaw || ActorRace == Assult) {
		if (GetPercent() < Find_Mid) {
			InjectCore(base, targetList, tempData, iRandom_Mid, iCore_Mid);
		}
		if (GetPercent() < Find_Mid * 0.7) {
			int iIndex = (static_cast<int>(GetRandom(base)) % 11);
			if (iIndex < 8) {
				InjectCoupon(base, targetList, tempData, 0);
			}
			else if (iIndex < 10) {
				InjectCoupon(base, targetList, tempData, 1);
			}
			else
			{
				InjectCoupon(base, targetList, tempData, 3);
			}
		}
	}
	else
	{
		if (GetPercent() < Find_Low) {
			InjectCore(base, targetList, tempData, iRandom_Low, iCore_Low);
		}
		if (GetPercent() < Find_Low / 3) {
			InjectCoupon(base, targetList, tempData, 0);
		}
	}
}

bool RegisterFuncs(VirtualMachine* vm)
{
	vm->RegisterFunction(new NativeFunction3<StaticFunctionTag, void, TESObjectREFR*, TESObjectREFR*, BSFixedString>("ChangeItemName", "WE_WeaponEnhancer", ChangeItemName, vm));

	vm->RegisterFunction(new NativeFunction2<StaticFunctionTag, void, BSFixedString, BSFixedString>("SaveItemUseCheck", "WE_WeaponEnhancer", SaveItemUseCheck, vm));

	vm->RegisterFunction(new NativeFunction1<StaticFunctionTag, void, VMArray<TESObjectREFR*>>("HidePanal", "WE_WeaponEnhancer", HidePanal, vm));

	vm->RegisterFunction(new NativeFunction1<StaticFunctionTag, void, BGSRefCollectionAlias*>("HideNumber", "WE_WeaponEnhancer", HideNumber, vm));

	vm->RegisterFunction(new NativeFunction2<StaticFunctionTag, void, VMArray<TESObjectREFR*>, TESObjectREFR*>("ArrayMovetoNode", "WE_WeaponEnhancer", ArrayMovetoNode, vm));

	vm->RegisterFunction(new NativeFunction3<StaticFunctionTag, void, TESObjectREFR*, UInt32, BGSRefCollectionAlias*>("PlaceNumber", "WE_WeaponEnhancer", PlaceNumber, vm));

	vm->RegisterFunction(new NativeFunction0<StaticFunctionTag, float>("GetRandom", "WE_WeaponEnhancer", GetRandom, vm));

	vm->RegisterFunction(new NativeFunction2<StaticFunctionTag, void, TESObjectREFR*, BGSRefCollectionAlias*>("DeathNPCItemAdd", "WE_WeaponEnhancer", DeathNPCItemAdd, vm));
	
	vm->RegisterFunction(new NativeFunction1<StaticFunctionTag, VMArray<UInt32>, TESObjectREFR*>("CheckAddonKeyword", "WE_WeaponEnhancer", CheckAddonKeyword, vm));

	vm->RegisterFunction(new NativeFunction2<StaticFunctionTag, UInt32, TESObjectREFR*, BGSListForm*>("CheckKeywordIndex", "WE_WeaponEnhancer", CheckKeywordIndex, vm));

	vm->RegisterFunction(new NativeFunction2<StaticFunctionTag, void, TESObjectREFR*, BGSRefCollectionAlias*>("PlaceAddonNumber", "WE_WeaponEnhancer", PlaceAddonNumber, vm));
	
	vm->RegisterFunction(new NativeFunction2<StaticFunctionTag, void, TESObjectREFR *, BGSRefCollectionAlias*>("SetBuyCoreMenu", "WE_WeaponEnhancer", SetBuyCoreMenu, vm));

	vm->RegisterFunction(new NativeFunction3<StaticFunctionTag, UInt32, TESObjectREFR*, BGSRefCollectionAlias*, UInt32>("SetBuyCoreNumber", "WE_WeaponEnhancer", SetBuyCoreNumber, vm));

	vm->RegisterFunction(new NativeFunction4<StaticFunctionTag, TESObjectREFR*, TESObjectREFR*, BGSRefCollectionAlias*, TESObjectREFR*, float>("ChangeDespAddon", "WE_WeaponEnhancer", ChangeDespAddon, vm));

	vm->RegisterFunction(new NativeFunction1<StaticFunctionTag, void, TESObjectREFR*>("CallRewardContainer", "WE_WeaponEnhancer", CallRewardContainer, vm));

	vm->RegisterFunction(new NativeFunction3<StaticFunctionTag, void, TESObjectREFR*, UInt32, BGSRefCollectionAlias*>("CorpseNumber", "WE_WeaponEnhancer", CorpseNumber, vm));

	return true;
}

void F4SEMessageHandler(F4SEMessagingInterface::Message* msg)
{
	switch (msg->type)
	{
	case F4SEMessagingInterface::kMessage_GameLoaded:
	{
		DoDefaults();
		_MESSAGE("Game Loaded");
	}
	break;
	case F4SEMessagingInterface::kMessage_GameDataReady:
	{
		_MESSAGE("Data Ready");
	}
	break;
	}
}

/* Plugin Query */
extern "C" {
	bool F4SEPlugin_Query(const F4SEInterface* f4se, PluginInfo* info) {
		std::string gLogPath{ "\\My Games\\Fallout4\\F4SE\\" PLUGIN_NAME ".log" };
		gLog.OpenRelative(CSIDL_MYDOCUMENTS, gLogPath.c_str());
		gLog.SetPrintLevel(IDebugLog::kLevel_Error);
		gLog.SetLogLevel(IDebugLog::kLevel_DebugMessage);

		// populate info structure
		info->infoVersion = PluginInfo::kInfoVersion;
		info->name = PLUGIN_NAME;
		info->version = PLUGIN_VERSION;

		if (f4se->runtimeVersion != RUNTIME_VERSION_1_10_163) {
			_MESSAGE("unsupported runtime version %d", f4se->runtimeVersion);
			return false;
		}

		return true;
	}

	bool F4SEPlugin_Load(const F4SEInterface* f4se) {
		_MESSAGE("%s Loaded", PLUGIN_NAME);
		_MESSAGE("ANSI(windows-1252) encoded");

		((F4SEMessagingInterface*)f4se->QueryInterface(kInterface_Messaging))->RegisterListener(f4se->GetPluginHandle(), "F4SE", F4SEMessageHandler);
		((F4SEPapyrusInterface*)f4se->QueryInterface(kInterface_Papyrus))->Register(RegisterFuncs);

		return true;
	}
};