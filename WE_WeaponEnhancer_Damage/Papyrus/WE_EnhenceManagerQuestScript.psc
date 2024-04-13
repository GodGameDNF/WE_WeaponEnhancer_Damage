ScriptName WE_EnhenceManagerQuestScript Extends Quest

ObjectMod Property aTestMod Auto

Actor Property PlayerRef Auto
Message Property WE_CheckQuestErrorMessage Auto

Static Property WE_ActiWhiteBackGroundMS Auto
Static Property WE_Corpse_BottomStatusMS Auto
MiscObject Property WE_EnhanceCoreMisc Auto
MiscObject Property Caps001 Auto

ObjectReference Property WE_ReturnMarker Auto
ObjectReference Property WE_ContainerRef Auto
ObjectReference Property WE_CorpseContainerRef Auto
RefCollectionAlias Property MenuCollection Auto

Keyword Property BlockWorkshopInteractionKeyword Auto
GlobalVariable Property gWE_GameID Auto

FormList Property WE_LevelKeywordList Auto
FormList Property WE_LevelModList Auto

Sound Property sWE_MachineOff Auto
Sound Property sWE_BuyCorePlus Auto
Sound Property sWE_MenuBackClick Auto
Sound Property sWE_Drill_Enhance_Long Auto
Sound Property sWE_Drill_Enhance_Mid Auto
Sound Property sWE_Drill_Enhance_Short Auto
Sound Property sWE_Drill_Enhance_Move Auto
Sound Property sWE_Hammer_Long Auto
Sound Property sWE_Hammer_Short Auto
Sound Property sWE_EnhanceBreak Auto
Sound Property sWE_Success Auto
Sound Property sWE_Fail Auto
Sound Property sWE_VeryGood Auto
Sound Property sWE_AddonChange_B Auto
Sound Property sWE_GetBuyCore Auto
Sound Property sWE_MenuInClick Auto

;; ㅡㅡㅡ 강화확률용 숫자배열
Int[] Property iDamageArray Auto
Int[] Property iSuccessArray Auto
Int[] Property iMinusArray Auto
Int[] Property iBreakArray Auto
Int[] Property iCoreArray Auto

;; ㅡㅡㅡ 첫번째 메뉴 & 숫자
ObjectReference[] Property FirstPanalArray Auto
FormList Property WE_NumberList_Blue Auto
FormList Property WE_NumberList_Red Auto

;; ㅡㅡㅡ 강화 메뉴들
Static Property WE_EnhanceMenuMS Auto
Static Property WE_EnhanceFunction_BackMainMS Auto
Static Property WE_EnhanceFunction_HammerMS Auto
Static Property WE_EnhanceFunction_DrillMS Auto
Static Property WE_EnhanceFunction_SuccessBarMS Auto
Static Property WE_EnhanceFunction_SuccessNoticeMS Auto
Activator Property WE_EnhanceFunction_CouponButtonActi Auto
Activator Property WE_EnhanceFunction_GunActi Auto
Activator Property WE_EnhanceFunction_GoEnhanceActi Auto
Activator Property WE_EnhanceFunction_CancelActi Auto
RefCollectionAlias Property EnhanceNumberCollection Auto
FormList Property WE_FailList Auto
FormList Property WE_EnhanceResultList Auto

ObjectReference EnhanceNumberMenuRef
ObjectReference EnhanceBackBoradRef
ObjectReference EnhanceGunRef
ObjectReference EnhanceCouponRef
ObjectReference EnhanceDrillRef
ObjectReference EnhanceGoRef
ObjectReference EnhanceCancelRef
ObjectReference EnhanceGaugeRef
ObjectReference EnhanceNoticeRef
ObjectReference EnhanceBreakRef
int iEnhanceResult
int iBreakReward
int iSuccessCopy

;; ㅡㅡㅡㅡ 강화쿠폰메뉴 ㅡㅡㅡㅡ
Keyword Property kWE_EnhanceCoupon Auto
FormList Property WE_CouponMiscList Auto
FormList Property WE_CouponActiList Auto
Static Property WE_Coupon_NoneMS Auto

ObjectReference CouponRef10
ObjectReference CouponRef20
ObjectReference CouponRef30
ObjectReference CouponRefBack
int iCouponLevel
;; ㅡㅡㅡ 애드온 관련 ㅡㅡㅡㅡ
Static Property WE_AddonMS_None Auto
Static Property WE_AddonMS_Fail Auto
FormList Property WE_AddonModList Auto
FormList Property WE_AddonKeywordList Auto
FormList Property WE_AddonStaticList Auto
ObjectMod Property WE_Mod_Addon_None Auto
ObjectMod Property WE_Mod_Addon_Fail Auto
Keyword Property kWE_Addon_None Auto
Keyword Property kWE_Addon_Fail Auto
String[] Property AddonNameArrayS Auto
String[] Property AddonNameArrayA Auto
String[] Property AddonNameArrayB Auto

;; ㅡㅡㅡㅡ 애드온 변경 ㅡㅡㅡㅡ
ObjectReference Property WE_AddonContainerRef Auto
Static Property WE_Addon_BackMainMS Auto
Static Property WE_AddonBottomStatusMS Auto
Activator Property WE_Addon_CouponButtonActi Auto
Activator Property WE_AddonFunction_GoChangeActi Auto
Activator Property WE_AddonFunction_CancelActi Auto

ObjectReference AddonNumberHundRef
ObjectReference AddonNumberTenRef
ObjectReference AddonNumberOneRef

Keyword Property kWE_AddonCoupon Auto
FormList Property WE_AddonCouponMiscList Auto
FormList Property WE_AddonCouponActiList Auto

int iAddonChangeCoreCount
int iAddonCoreSave
bool bRankACouponOn

;; ㅡㅡㅡㅡㅡㅡ 강화수치 이관
Static Property WE_MoveEnhance_BackMainMS Auto
Static Property WE_MoveEnhance_BottomStatusMS Auto
Activator Property WE_MoveEnhance_LeftGunActi Auto
Activator Property WE_MoveEnhance_RightGunActi Auto
Activator Property WE_MoveEnhance_GoMoveActi Auto
Activator Property WE_MoveEnhance_CancelActi Auto
ObjectReference Property WE_MoveEnhanceContainerRef_Left Auto
ObjectReference Property WE_MoveEnhanceContainerRef_Right Auto

ObjectReference MoveGunRef_Left
ObjectReference MoveGunRef_Right

ObjectReference TargetWeaponRef_Left
ObjectReference TargetWeaponRef_Right

;; ㅡㅡㅡㅡㅡㅡㅡ 강화코어 구입
Static Property WE_BuyCore_BackMainMS Auto
Static Property WE_BuyCore_BottomStatusMS Auto
Activator Property WE_BuyCore_GoBuyCoreActi Auto
Activator Property WE_BuyCore_CancelActi Auto
int iReserveCore

;; ㅡㅡㅡㅡㅡㅡㅡㅡ 모드설명
Static Property WE_ModDesp_BackMainMS Auto
Static Property WE_ModDesp_BottomStatusMS Auto
Activator Property WE_ModDesp_CancelActi Auto
Activator Property WE_ModDespActi_Left Auto
Activator Property WE_ModDespActi_Right Auto
ObjectReference DespAddonRef
float fDespIndex
int iAddonMaxCount

ObjectReference WhiteBackRef
ObjectReference CurrentMachineRef
ObjectReference TargetWeaponRef

ObjectReference SuccessNumberTenRef
ObjectReference SuccessNumberOneRef

float fNoticeBaseHeight = 15.0
float fNoticeLevel4Height = 11.0 
float fNoticeLevelHeightMult = 0.5
float fFailRangeMax = 5.5
float fGaugeSpeedLow = 15.0
float fGaugeSpeedMid = 8.0
float fGaugeSpeedHigh = 4.5

float fWeaponPlaceZ = 120.0
bool bMenuOn
bool bBlockMenu
bool bCouponBlock
bool bCouponRegister
int iEnhanceLevel
int iFirstCoreCount
int iRankBIndex = 0
int iRankAIndex = 1
int iRankSIndex = 2
int cPlaySound

bool bForceStop
int iModStage ;; 0 = 첫메뉴 1 = 강화중 2 = 애드온변경 3 = 이관
int iCouponStage ;; 0 쿠폰아님 1 강화쿠폰메뉴열기 2 강화쿠폰등록

;/
Event OnQuestInit()
	int iQuestCompleteCount = Game.QueryStat("Quests Completed")
	RegisterForTrackedStatsEvent("Quests Completed", iQuestCompleteCount + 1)
EndEvent

Event OnTrackedStatsEvent(string asStat, int aiStatValue)
	RegisterForTrackedStatsEvent("Quests Completed", aiStatValue + 1)
	debug.Notification(aiStatValue)
EndEvent
/;

Function CheckQuestError()
	if bMenuOn
		int i =WE_CheckQuestErrorMessage.Show()
		if i == 0
			Stop()
			Utility.Wait(1)
			Start()
		Endif
	Endif
EndFunction

Event ObjectReference.OnUnload(ObjectReference akSender)
	bForceStop = true
	ForceCloseMenu()
EndEvent

Function OnFirstMenu(ObjectReference MachineRef)
	if !bMenuOn
		bMenuOn = true
		bForceStop = false

		CurrentMachineRef = MachineRef
		CurrentMachineRef.BlockActivation(True, True)
		CurrentMachineRef.AddKeyword(BlockWorkshopInteractionKeyword)
		RegisterForRemoteEvent(CurrentMachineRef, "OnUnload")
		WhiteBackRef = CurrentMachineRef.PlaceAtme(WE_ActiWhiteBackGroundMS, 1, false, true)
		WhiteBackRef.EnableNoWait()

		int i = WE_CorpseContainerRef.GetItemCount()
		if WE_CorpseContainerRef.GetItemCount() > 2
			ObjectReference TempRef = CurrentMachineRef.PlaceAtNode("CorpseColl", WE_Corpse_BottomStatusMS, 1, false, true)
			EnhanceNumberCollection.AddRef(TempRef)
			TempRef.EnableNoWait()

			int c = Math.Floor(i * 0.7)
			WE_WeaponEnhancer.CorpseNumber(CurrentMachineRef, c, EnhanceNumberCollection)

			WE_CorpseContainerRef.RemoveItem(WE_EnhanceCoreMisc, c, false, playerref)
			WE_CorpseContainerRef.RemoveAllItems()
			Utility.Wait(2.5)
			if bForceStop
				return
			Endif

			HideNumber(EnhanceNumberCollection)
		Endif

		SetFirstMenuButton()
	Endif
EndFunction

Function SetFirstMenuButton()
	WE_WeaponEnhancer.ArrayMovetoNode(FirstPanalArray, CurrentMachineRef)
EndFunction

Function HideFirstMenuButton()
	WE_WeaponEnhancer.HidePanal(FirstPanalArray)
EndFunction

Function HideNumber(RefCollectionAlias Collection)
	WE_WeaponEnhancer.HideNumber(Collection)
EndFunction

Function PushMenuButton(String MenuName)
	if bBlockMenu
		Return
	else
		bBlockMenu = true
	Endif

	if MenuName == "FM_WeaponEnhance"
		sWE_BuyCorePlus.Play(CurrentMachineRef)
		FM_WeaponEnhance()
	elseif MenuName == "FM_GoEnhance"
		FM_GoEnhance()
	elseif MenuName == "FM_StopEnhance"
		sWE_MenuBackClick.Play(CurrentMachineRef)
		FM_StopEnhance()
	elseif MenuName == "FM_CloseFirstMenu"
		sWE_MachineOff.Play(CurrentMachineRef)
		ForceCloseMenu()
	elseif MenuName == "FM_EnhanceCouponMenu"
		sWE_BuyCorePlus.Play(CurrentMachineRef)
		FM_EnhanceCouponMenu()
	elseif MenuName == "FM_AddonChangeMenu"
		sWE_BuyCorePlus.Play(CurrentMachineRef)
		FM_AddonChangeMenu()
	elseif MenuName == "FM_GoAddonChange"
		FM_GoAddonChange()
	elseif MenuName == "FM_StopAddonChange"
		sWE_MenuBackClick.Play(CurrentMachineRef)
		FM_StopAddonChange()
	elseif MenuName == "FM_AddonCouponMenu"
		sWE_BuyCorePlus.Play(CurrentMachineRef)
		FM_AddonCouponMenu()
	elseif MenuName == "FM_MoveEnhanceMenu"
		sWE_BuyCorePlus.Play(CurrentMachineRef)
		FM_MoveEnhanceMenu()
	elseif MenuName == "FM_GoMoveEnhance"
		FM_GoMoveEnhance()
	elseif MenuName == "FM_StopMoveEnhance"
		sWE_MenuBackClick.Play(CurrentMachineRef)
		FM_StopMoveEnhance()
	elseif MenuName == "FM_BuyCoreMenu"
		sWE_BuyCorePlus.Play(CurrentMachineRef)
		FM_BuyCoreMenu()
	elseif MenuName == "FM_GoBuyCore"
		FM_GoBuyCore()
	elseif MenuName == "FM_StopBuyCore"
		sWE_MenuBackClick.Play(CurrentMachineRef)
		FM_StopBuyCore()
	elseif MenuName == "FM_ModDespMenu"
		sWE_BuyCorePlus.Play(CurrentMachineRef)
		FM_ModDespMenu()
	elseif MenuName == "FM_StopModDesp"
		sWE_MenuBackClick.Play(CurrentMachineRef)
		FM_StopModDesp()
	Endif
EndFunction


;; ㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁ 모드 설명보기 ㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁ


Function CloseModDesp()
	HideNumber(MenuCollection)
	HideNumber(EnhanceNumberCollection)

	EnhanceBackBoradRef = None
	EnhanceGoRef = None
	EnhanceCancelRef = None
	EnhanceNumberMenuRef = None
	DespAddonRef = None
	fDespIndex = 0

	bBlockMenu = false
	iModStage = 0
EndFunction

Function PushDirectionButton(float fMove)
	if !bBlockMenu
		bBlockMenu = true
	else
		return
	Endif

	fDespIndex += fMove
	if fDespIndex < 0
		fDespIndex = 0
	elseif fDespIndex > iAddonMaxCount
		fDespIndex = iAddonMaxCount
	Endif

	DespAddonRef = WE_WeaponEnhancer.ChangeDespAddon(CurrentMachineRef, EnhanceNumberCollection, DespAddonRef, fDespIndex)
	bBlockMenu = false
EndFunction

Function FM_StopModDesp()
	CloseModDesp()
	SetFirstMenuButton()
EndFunction

Function FM_ModDespMenu()
	iModStage = 5

	HideFirstMenuButton()

	FormList DespList = WE_AddonStaticList.GetAt(2) as FormList
	iAddonMaxCount = DespList.GetSize() - 1

	EnhanceBackBoradRef = CurrentMachineRef.PlaceAtme(WE_ModDesp_BackMainMS)
	MenuCollection.AddRef(EnhanceBackBoradRef)		

	EnhanceCancelRef = CurrentMachineRef.PlaceAtNode("CancelNode", WE_BuyCore_CancelActi)
	MenuCollection.AddRef(EnhanceCancelRef)

	EnhanceNumberMenuRef = CurrentMachineRef.PlaceAtNode("EnhanceNumberNode", WE_ModDesp_BottomStatusMS)
	MenuCollection.AddRef(EnhanceNumberMenuRef)

	MenuCollection.AddRef(CurrentMachineRef.PlaceAtNode("DespAddonNode_Left", WE_ModDespActi_Left))
	MenuCollection.AddRef(CurrentMachineRef.PlaceAtNode("DespAddonNode_Right", WE_ModDespActi_Right))

	DespAddonRef = WE_WeaponEnhancer.ChangeDespAddon(CurrentMachineRef, EnhanceNumberCollection, DespAddonRef, fDespIndex)
	bBlockMenu = false
EndFunction


;; ㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁ 강화정수 구입 ㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁ

Function PushBuyCoreZeroCount()
	iReserveCore = 0
	WE_WeaponEnhancer.HideNumber(EnhanceNumberCollection)
	WE_WeaponEnhancer.SetBuyCoreNumber(CurrentMachineRef, EnhanceNumberCollection, iReserveCore)
EndFunction

Function PushBuyCoreCount(int iSend)
	iReserveCore += iSend
	WE_WeaponEnhancer.HideNumber(EnhanceNumberCollection)
	iReserveCore = WE_WeaponEnhancer.SetBuyCoreNumber(CurrentMachineRef, EnhanceNumberCollection, iReserveCore)
EndFunction

Function FM_GoBuyCore()
	sWE_GetBuyCore.Play(CurrentMachineRef)

	PlayerRef.AddItem(WE_EnhanceCoreMisc, iReserveCore, true)
	PlayerRef.Removeitem(Caps001, iReserveCore * 500, true)
	iReserveCore = 0

	WE_WeaponEnhancer.HideNumber(EnhanceNumberCollection)
	iReserveCore = WE_WeaponEnhancer.SetBuyCoreNumber(CurrentMachineRef, EnhanceNumberCollection, iReserveCore)

	bBlockMenu = false
EndFunction

Function FM_BuyCoreMenu()
	iModStage = 4
	iReserveCore = 0
	HideFirstMenuButton()

	EnhanceBackBoradRef = CurrentMachineRef.PlaceAtme(WE_BuyCore_BackMainMS)
	MenuCollection.AddRef(EnhanceBackBoradRef)	

	EnhanceGoRef = CurrentMachineRef.PlaceAtNode("GoNode", WE_BuyCore_GoBuyCoreActi)
	MenuCollection.AddRef(EnhanceGoRef)

	EnhanceCancelRef = CurrentMachineRef.PlaceAtNode("CancelNode", WE_BuyCore_CancelActi)
	MenuCollection.AddRef(EnhanceCancelRef)

	EnhanceNumberMenuRef = CurrentMachineRef.PlaceAtNode("EnhanceNumberNode", WE_BuyCore_BottomStatusMS, 1, false, true)
	EnhanceNumberMenuRef.EnableNoWait()
	MenuCollection.AddRef(EnhanceNumberMenuRef)

	WE_WeaponEnhancer.SetBuyCoreMenu(CurrentMachineRef, MenuCollection)
	WE_WeaponEnhancer.SetBuyCoreNumber(CurrentMachineRef, EnhanceNumberCollection, 0)

	bBlockMenu = false
EndFunction

Function CloseBuyCore()
	HideNumber(MenuCollection)
	HideNumber(EnhanceNumberCollection)
	SetFirstMenuButton()
	iReserveCore = 0

	EnhanceBackBoradRef = None
	EnhanceGoRef = None
	EnhanceCancelRef = None
	EnhanceNumberMenuRef = None

	bBlockMenu = false
	iModStage = 0
EndFunction

Function FM_StopBuyCore()
	CloseBuyCore()
	bBlockMenu = false
EndFunction


;;ㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁ 강화수치 이관 ㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁ

Function FM_StopMoveEnhance()
	CloseMoveEnhance()
	SetFirstMenuButton()
EndFunction

Function CloseMoveEnhance()
	if TargetWeaponRef_Left.IsDisabled()
		PlayerRef.AddItem(TargetWeaponRef_Left)
	Endif
	if TargetWeaponRef_Right.IsDIsabled()
		PlayerRef.AddItem(TargetWeaponRef_Right)
	Endif

	WE_MoveEnhance_RightGunActi.SetName("강화수치를 이관받는 무기")
	WE_MoveEnhance_LeftGunActi.SetName("강화수치가 0이 되는 무기")

	HideNumber(MenuCollection)
	HideNumber(EnhanceNumberCollection)
	MoveGunRef_Left.Moveto(WE_ReturnMarker)
	MoveGunRef_Right.Moveto(WE_ReturnMarker)

	MoveGunRef_Left = None
	MoveGunRef_Right = None
	TargetWeaponRef_Left = None
	TargetWeaponRef_Right = None
	EnhanceBackBoradRef = None
	EnhanceNumberMenuRef = None
	EnhanceDrillRef = None
	EnhanceGoRef = None
	EnhanceCancelRef = None
	AddonNumberHundRef = none
	AddonNumberTenRef = none
	AddonNumberOneRef = none

	iModStage = 0
	bBlockMenu = false
EndFunction

Function SetMoveEnhanceNumber()
	iAddonChangeCoreCount = 150
	SetAddonCoreNumber()
	WE_WeaponEnhancer.PlaceAddonNumber(CurrentMachineRef, EnhanceNumberCollection)
EndFunction

Function ActivateGunActi_Right()
	if bBlockMenu
		return
	ENdif

	if TargetWeaponRef_Right == None
		WE_MoveEnhanceContainerRef_Right.Activate(PlayerRef)
	else
		PlayerRef.AddItem(TargetWeaponRef_Right)
		TargetWeaponRef_Right = None

		MoveGunRef_Right.BlockActivation(true, true)
		WE_MoveEnhance_RightGunActi.SetName("강화수치를 이관받는 무기")
		Utility.WaitMenuMode(0.03)
		MoveGunRef_Right.BlockActivation(false)
	Endif
EndFunction

Function ActivateGunActi_Left()
	if bBlockMenu
		return
	ENdif

	if TargetWeaponRef_Left == None
		WE_MoveEnhanceContainerRef_Left.Activate(PlayerRef)
	else
		PlayerRef.AddItem(TargetWeaponRef_Left)
		TargetWeaponRef_Left = None
		MoveGunRef_Left.BlockActivation(true, true)
		WE_MoveEnhance_LeftGunActi.SetName("강화수치가 0이 되는 무기")
		Utility.WaitMenuMode(0.03)
		MoveGunRef_Left.BlockActivation(false)
	Endif
EndFunction

Function FM_GoMoveEnhance()
	if TargetWeaponRef_Left == None || TargetWeaponRef_Right == None
		Debug.Messagebox("양쪽에 모두 무기를 넣어야합니다")
		bBlockMenu = false
		Return
	elseif PlayerRef.GetItemCount(WE_EnhanceCoreMisc) < 150
		Debug.Messagebox("무기 강화의 정수가 부족합니다")
		bBlockMenu = false
		Return		
	Endif

	PlayerRef.RemoveItem(WE_EnhanceCoreMisc, 150, true)

	ObjectMod tempMod = WE_LevelModList.GetAt(iEnhanceLevel - 1) as ObjectMod
	TargetWeaponRef_Left.RemoveMod(tempMod)
	int[] iAddon = WE_WeaponEnhancer.CheckAddonKeyword(TargetWeaponRef_Left)
	FormList tempList = WE_AddonModList.GetAt(iAddon[0]) as FormList
	ObjectMod tempMod02 = tempList.GetAt(iAddon[1]) as ObjectMod
	TargetWeaponRef_Left.RemoveMod(tempMod02)

	WE_WeaponEnhancer.ChangeItemName(TargetWeaponRef_Left, WE_MoveEnhanceContainerRef_Left, TargetWeaponRef_Left.GetBaseObject().GetName())

	TargetWeaponRef_Left.Moveto(WE_ReturnMarker)
	TargetWeaponRef_Left.Delete()
	TargetWeaponRef_Left = None

	Utility.Wait(0.03)
	TargetWeaponRef_Left = WE_MoveEnhanceContainerRef_Left.DropFirstObject(true)
	TargetWeaponRef_Left.SetPlayerHasTaken()

	TargetWeaponRef_Right.AttachMod(WE_LevelModList.GetAt(iEnhanceLevel - 2) as ObjectMod)
	TargetWeaponRef_Right.AttachMod(tempMod02)

	String sName = "+" + ((iEnhanceLevel - 1) as string) + " " + TargetWeaponRef_Right.GetBaseObject().GetName()

	if tempMod02 == WE_Mod_Addon_Fail
		sName += " - 개조실패"
	else
		if iAddon[0] == 0
			sName += " - " + AddonNameArrayB[iAddon[1]]
		elseif iAddon[0] == 1
			sName += " - " + AddonNameArrayA[iAddon[1]]
		else
			sName += " - " + AddonNameArrayS[iAddon[1]]
		Endif
	Endif

	WE_WeaponEnhancer.ChangeItemName(TargetWeaponRef_Right, WE_MoveEnhanceContainerRef_Right, sName)

	TargetWeaponRef_Right.Moveto(WE_ReturnMarker)
	TargetWeaponRef_Right.Delete()
	TargetWeaponRef_Right = None

	Utility.Wait(0.03)
	TargetWeaponRef_Right = WE_MoveEnhanceContainerRef_Right.DropFirstObject(true)
	TargetWeaponRef_Right.SetPlayerHasTaken()

	EnhanceDrillRef = CurrentMachineRef.PlaceAtNode("DrillNode_Left", WE_EnhanceFunction_DrillMS, 1, false, true)
	MenuCollection.AddRef(EnhanceDrillRef)
	EnhanceDrillRef.Enable()

	sWE_Drill_Enhance_Move.Play(CurrentMachineRef)
	Utility.Wait(2)

	if bForceStop
		Return
	Endif

	EnhanceDrillRef.Disable()

	Utility.Wait(0.5)

	if bForceStop
		Return
	Endif

	EnhanceDrillRef.MovetoNode(CurrentMachineRef, "DrillNode_Right")
	EnhanceDrillRef.Enable()

	sWE_Drill_Enhance_Move.Play(CurrentMachineRef)
	Utility.Wait(2)

	if bForceStop
		Return
	Endif

	PlayerRef.AddItem(TargetWeaponRef_Left)
	PlayerRef.AddItem(TargetWeaponRef_Right)

	FM_StopMoveEnhance()
EndFunction

Function FM_MoveEnhanceMenu()
	iModStage = 3
	HideFirstMenuButton()

	EnhanceBackBoradRef = CurrentMachineRef.PlaceAtme(WE_MoveEnhance_BackMainMS)
	MenuCollection.AddRef(EnhanceBackBoradRef)	

	MoveGunRef_Left = CurrentMachineRef.PlaceAtNode("GunNode_Left", WE_MoveEnhance_LeftGunActi, 1, false, true)
	MenuCollection.AddRef(EnhanceGunRef)
	MoveGunRef_Left.SetScale(0.7)

	MoveGunRef_Right = CurrentMachineRef.PlaceAtNode("GunNode_Right", WE_MoveEnhance_RightGunActi, 1, false, true)
	MenuCollection.AddRef(EnhanceGunRef)
	MoveGunRef_Right.SetScale(0.7)

	MoveGunRef_Left.EnableNoWait(true)
	MoveGunRef_Right.EnableNoWait(true)

	EnhanceGoRef = CurrentMachineRef.PlaceAtNode("GoNode", WE_MoveEnhance_GoMoveActi)
	MenuCollection.AddRef(EnhanceGoRef)

	EnhanceCancelRef = CurrentMachineRef.PlaceAtNode("CancelNode", WE_MoveEnhance_CancelActi)
	MenuCollection.AddRef(EnhanceCancelRef)

	EnhanceNumberMenuRef = CurrentMachineRef.PlaceAtNode("EnhanceNumberNode", WE_MoveEnhance_BottomStatusMS, 1, false, true)
	EnhanceNumberMenuRef.EnableNoWait()
	MenuCollection.AddRef(EnhanceNumberMenuRef)

	SetMoveEnhanceNumber()

	bBlockMenu = false
EndFunction

Function FM_LeftGunActi()
	(WE_MoveEnhanceContainerRef_Left as WE_MoveEnhanceContainerScript).bAdded = false

	TargetWeaponRef_Left = WE_MoveEnhanceContainerRef_Left.DropFirstObject(true)
	Utility.Wait(0.03)
	iEnhanceLevel = 1 + WE_WeaponEnhancer.CheckKeywordIndex(TargetWeaponRef_Left, WE_LevelKeywordList)

	if iEnhanceLevel < 9 || iEnhanceLevel > 90
		Debug.Messagebox("9강 이상의 무기만 이관의 재료로 넣을수 있습니다")
		PlayerRef.AddItem(TargetWeaponRef_Left)
		Return
	Endif

	sWE_BuyCorePlus.Play(CurrentMachineRef)

	MoveGunRef_Left.BlockActivation(true, true)
	WE_MoveEnhance_LeftGunActi.SetName(TargetWeaponRef_Left.GetDIsplayName())
	Utility.WaitMenumode(0.03)
	MoveGunRef_Left.BlockActivation(false)
EndFunction

Function FM_RightGunActi()
	(WE_MoveEnhanceContainerRef_Right as WE_MoveEnhanceContainerScript).bAdded = false
	TargetWeaponRef_Right = WE_MoveEnhanceContainerRef_Right.DropFirstObject(true)

	sWE_BuyCorePlus.Play(CurrentMachineRef)

	MoveGunRef_Right.BlockActivation(true, true)
	WE_MoveEnhance_RightGunActi.SetName(TargetWeaponRef_Right.GetDIsplayName())
	Utility.WaitMenumode(0.03)
	MoveGunRef_Right.BlockActivation(false)
EndFunction


;;ㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁ 부가옵션 변경 ㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁ


Function ReplaceAddonNumber()
	AddonNumberHundRef.Moveto(WE_ReturnMarker)
	AddonNumberTenRef.Moveto(WE_ReturnMarker)
	AddonNumberOneRef.Moveto(WE_ReturnMarker)
	AddonNumberHundRef = None
	AddonNumberTenRef = None
	AddonNumberOneRef = None

	SetAddonCoreNumber()
EndFunction

Function FM_AddonCouponRegister(int i)
	MiscObject TempObject = WE_AddonCouponMiscList.GetAt(i) as MiscObject

	if PlayerRef.GetItemCount(TempObject) <= 0
		Debug.Messagebox("메뉴를 띄우고 쿠폰을 다른곳으로 옮기지 마세요")
		Return
	Endif

	AddonCouponDisableNoWait()

	iCouponStage = 2

	PlayerRef.RemoveItem(TempObject, 1, abSilent = true)

	sWE_BuyCorePlus.Play(CurrentMachineRef)

	if i == 0
		CouponRef10.SetScale(1)
		CouponRef10.MovetoNode(CurrentMachineRef, "CouponNode")

		iAddonCoreSave = iAddonChangeCoreCount
		iAddonChangeCoreCount = 0

		ReplaceAddonNumber()
		CouponRef10.EnableNoWait()
	else
		CouponRef20.SetScale(1)
		CouponRef20.MovetoNode(CurrentMachineRef, "CouponNode")
		CouponRef20.EnableNoWait()

		bRankACouponOn = true
	Endif

	bCouponBlock = false
	bBlockMenu = false
EndFunction

Function AddonCouponDisableNoWait()
	CouponRef10.DisableNoWait()
	CouponRef20.DisableNoWait()
	CouponRefBack.DisableNoWait()
EndFunction

Function RegisterAddonCouponBack(int iIndex)
	ObjectReference TempRef = PlayerRef.PlaceAtme(WE_AddonCouponMiscList.GetAt(iIndex) as MiscObject, 1, false, true)
	TempRef.SetPlayerHasTaken()
	PlayerRef.AddItem(TempRef, abSilent = true)

	if iIndex == 0
		iAddonChangeCoreCount = iAddonCoreSave
		ReplaceAddonNumber()
	else
		bRankACouponOn = false
	Endif
EndFunction

Function PushAddonCouponButton(String MenuName)
	if bCouponBlock
		Return
	else
		bCouponBlock = true
	Endif

	if iCouponStage == 2
		iCouponStage = 0
		AddonCouponDisableNoWait()
		EnhanceCouponRef.EnableNoWait()

		sWE_MenuBackClick.Play(CurrentMachineRef)

		if MenuName == "FM_AddonCouponFree"
			RegisterAddonCouponBack(0)
		elseif MenuName == "FM_AddonCouponA"
			RegisterAddonCouponBack(1)
		Endif

		CouponRef10 = None
		CouponRef20 = None
		CouponRefBack = None

		bCouponBlock = false
		bBlockMenu = false
	else
		if MenuName == "FM_AddonCouponFree"
			FM_AddonCouponRegister(0)
		elseif MenuName == "FM_AddonCouponA"
			FM_AddonCouponRegister(1)
		else
			iCouponStage = 0
			AddonCouponDisableNoWait()
			EnhanceCouponRef.EnableNoWait()

			sWE_MenuBackClick.Play(CurrentMachineRef)

			CouponRef10 = None
			CouponRef20 = None
			CouponRefBack = None

			bBlockMenu = false
			bCouponBlock = false
		Endif
	Endif
EndFunction

Function FM_AddonCouponMenu()
	if PlayerRef.GetItemCount(kWE_AddonCoupon) <= 0
		debug.messagebox("가지고 있는 쿠폰이 없습니다")
		bBlockMenu = false
		Return
	Endif

	iCouponStage = 1
	EnhanceCouponRef.DisableNoWait()

	CouponRefBack = CurrentMachineRef.PlaceAtNode("CouponNode", WE_AddonCouponActiList.GetAt(2), 1, false, true)
	CouponRefBack.EnableNoWait()
	EnhanceNumberCollection.AddRef(CouponRefBack)

	if PlayerRef.GetItemCount(WE_AddonCouponMiscList.GetAt(0) as MiscObject) > 0
		CouponRef10 = CurrentMachineRef.PlaceAtNode("CouponNodeFree", WE_AddonCouponActiList.GetAt(0), 1, false, true)
		CouponRef10.SetScale(0.7)
		CouponRef10.EnableNoWait()
		EnhanceNumberCollection.AddRef(CouponRef10)
	Endif
	if PlayerRef.GetItemCount(WE_AddonCouponMiscList.GetAt(1) as MiscObject) > 0
		CouponRef20 = CurrentMachineRef.PlaceAtNode("CouponNodeA", WE_AddonCouponActiList.GetAt(1), 1, false, true)
		CouponRef20.SetScale(0.7)
		CouponRef20.EnableNoWait()
		EnhanceNumberCollection.AddRef(CouponRef20)
	Endif
EndFunction

Function FM_AddonChangeMenu()
	WE_AddonContainerRef.Activate(PlayerRef)
	bBlockMenu = false
EndFunction

Function FM_GoAddonChange()
	int iCount = PlayerRef.GetItemCount(WE_EnhanceCoreMisc)
	if  iCount < iAddonChangeCoreCount
		Debug.Messagebox("무기 강화의 정수가 부족합니다")
		bBlockMenu = false
		Return
	Endif

	bCouponBlock = true
	sWE_Drill_Enhance_Move.Play(CurrentMachineRef)

	EnhanceDrillRef = CurrentMachineRef.PlaceAtNode("HammerNode", WE_EnhanceFunction_DrillMS, 1, false, true)
	EnhanceDrillRef.EnableNoWait()
	EnhanceNumberCollection.AddRef(EnhanceDrillRef)

	PlayerRef.RemoveItem(WE_EnhanceCoreMisc, iAddonChangeCoreCount, true)

	String sName = "+" + ((iEnhanceLevel) as string) + " " + TargetWeaponRef.GetBaseObject().GetName()

	EnhanceGunRef.BlockActivation(true, true)

	ObjectMod ChangeMod = None

	float fTemp = WE_WeaponEnhancer.GetRandom()
	int iTemp = Math.Floor(fTemp)
	float fDP = fTemp - iTemp
	float iIndex = fDP + iTemp%100
	int iAddonIndex

	if !bRankACouponOn
		if iIndex < 7
			ChangeMod = WE_Mod_Addon_Fail
		elseif iIndex < 87.5
			iIndex = 0
		elseif iIndex < 97.5
			iIndex = 1
		else
			iIndex = 2
		Endif

		if ChangeMod == None
			FormList TempList = WE_AddonModList.GetAt(iIndex as int) as FormList
			iAddonIndex =  Utility.RandomInt(0, TempList.GetSize() - 1)
			ChangeMod = TempList.GetAt(iAddonIndex) as ObjectMod
		Endif
	else
		bRankACouponOn = false
		iIndex = 1
		FormList TempList = WE_AddonModList.GetAt(iIndex as int) as FormList
		iAddonIndex =  Utility.RandomInt(0, TempList.GetSize() - 1)
		ChangeMod = TempList.GetAt(iAddonIndex) as ObjectMod
	Endif

	if ChangeMod == WE_Mod_Addon_Fail
		sName += " - 개조실패"
	else
		if iIndex == 0
			sName += " - " + AddonNameArrayB[iAddonIndex]
		elseif iIndex == 1
			sName += " - " + AddonNameArrayA[iAddonIndex]
		else
			sName += " - " + AddonNameArrayS[iAddonIndex]
		Endif
	Endif

	WE_WeaponEnhancer.ChangeItemName(TargetWeaponRef, WE_AddonContainerRef, sName)
	WE_EnhanceFunction_GunActi.SetName(sName)

	TargetWeaponRef.Moveto(WE_ReturnMarker)
	TargetWeaponRef.Delete()
	TargetWeaponRef = None

	Utility.Wait(0.03)

	TargetWeaponRef = WE_AddonContainerRef.DropFirstObject(true)
	TargetWeaponRef.AttachMod(ChangeMod)
	TargetWeaponRef.SetPlayerHasTaken()

	Utility.Wait(2)

	if bForceStop
		Return
	Endif

	if ChangeMod == WE_Mod_Addon_Fail || iIndex == 2
		sWE_Hammer_Short.Play(CurrentMachineRef)

		EnhanceDrillRef.Moveto(WE_ReturnMarker)
		EnhanceDrillRef = None
		EnhanceDrillRef = CurrentMachineRef.PlaceAtNode("HammerNode", WE_EnhanceFunction_HammerMS, 1, false, true)
		EnhanceDrillRef.EnableNoWait()
		EnhanceNumberCollection.AddRef(EnhanceDrillRef)

		Utility.Wait(2)
	Endif

	if bForceStop
		Return
	Endif

	if ChangeMod == WE_Mod_Addon_Fail
		sWE_Fail.Play(CurrentMachineRef)
	elseif iIndex == 0
		sWE_AddonChange_B.Play(CurrentMachineRef)
	elseif iIndex == 1
		sWE_Success.Play(CurrentMachineRef)
	else
		sWE_VeryGood.Play(CurrentMachineRef)
	Endif

	HideNumber(EnhanceNumberCollection)
	EnhanceDrillRef = None

	if EnhanceCouponRef.IsDisabled()
		EnhanceCouponRef.Enable()
	Endif
	SetAddonFunction()
	EnhanceGunRef.BlockActivation(false)

	iCouponStage = 0
	bCouponBlock = false
	bBlockMenu = false
EndFunction

Function FM_StopAddonChange()
	if iCouponStage == 2
		Debug.Messagebox("먼저 등록된 쿠폰을 회수하세요")
		bBlockMenu = false
		Return
	Endif

	PlayerRef.AddItem(TargetWeaponRef)
	CloseAddonMenu()
	SetFirstMenuButton()
	bBlockMenu = false
EndFunction

Function CloseAddonMenu()
	HideNumber(MenuCollection)
	HideNumber(EnhanceNumberCollection)

	EnhanceNumberMenuRef = None
	EnhanceBackBoradRef = None
	EnhanceGunRef = None
	EnhanceCouponRef = None
	EnhanceDrillRef = None
	EnhanceGoRef = None
	EnhanceCancelRef = None
	AddonNumberHundRef = none
	AddonNumberTenRef = none
	AddonNumberOneRef = none

	iCouponStage = 0
	iModStage = 0
EndFunction

Function SetAddonCoreNumber()
	FormList NumberList = WE_NumberList_Blue
	int iCount = PlayerRef.GetItemCount(WE_EnhanceCoreMisc)
	if iCount < iAddonChangeCoreCount
		NumberList = WE_NumberList_Red
	Endif

	if iAddonChangeCoreCount > 100
		AddonNumberHundRef = CurrentMachineRef.PlaceAtNode("Addon_1_01", NumberList.GetAt(1) as Static, 1, false, true)
		AddonNumberTenRef = CurrentMachineRef.PlaceAtNode("Addon_1_02", NumberList.GetAt(5) as Static, 1, false, true)
		AddonNumberOneRef = CurrentMachineRef.PlaceAtNode("Addon_1_03", NumberList.GetAt(0) as Static, 1, false, true)
		AddonNumberHundRef.ENableNoWait()
		AddonNumberTenRef.ENableNoWait()
		AddonNumberOneRef.ENableNoWait()
		EnhanceNumberCollection.AddRef(AddonNumberTenRef)
		EnhanceNumberCollection.AddRef(AddonNumberOneRef)
		EnhanceNumberCollection.AddRef(AddonNumberHundRef)
	elseif iAddonChangeCoreCount > 10
		AddonNumberTenRef = CurrentMachineRef.PlaceAtNode("Addon_1_02", NumberList.GetAt(5) as Static, 1, false, true)
		AddonNumberOneRef = CurrentMachineRef.PlaceAtNode("Addon_1_03", NumberList.GetAt(0) as Static, 1, false, true)
		AddonNumberTenRef.ENableNoWait()
		AddonNumberOneRef.ENableNoWait()
		EnhanceNumberCollection.AddRef(AddonNumberTenRef)
		EnhanceNumberCollection.AddRef(AddonNumberOneRef)
	else
		AddonNumberOneRef = CurrentMachineRef.PlaceAtNode("Addon_1_03", NumberList.GetAt(0) as Static, 1, false, true)
		AddonNumberOneRef.ENableNoWait()
		EnhanceNumberCollection.AddRef(AddonNumberOneRef)
	Endif
EndFunction

Function SetAddonFunction()
	iAddonChangeCoreCount = 50

	if TargetWeaponRef.HasKeyword(kWE_Addon_Fail)
		EnhanceNumberCollection.AddRef(CurrentMachineRef.PlaceAtNode("ChangeAddonNode", WE_AddonMS_Fail))
		iAddonChangeCoreCount = 75
	else
		int[] iAddon = WE_WeaponEnhancer.CheckAddonKeyword(TargetWeaponRef)
		FormList tempList = WE_AddonStaticList.GetAt(iAddon[0]) as FormList
		Static tempStatic = tempList.GetAt(iAddon[1]) as Static
		EnhanceNumberCollection.AddRef(CurrentMachineRef.PlaceAtNode("ChangeAddonNode", tempStatic))
	Endif

	SetAddonCoreNumber()

	WE_WeaponEnhancer.PlaceAddonNumber(CurrentMachineRef, EnhanceNumberCollection)

	if PlayerRef.GetItemCount(kWE_AddonCoupon) <= 0
		EnhanceNumberCollection.AddRef(CurrentMachineRef.PlaceAtNode("CouponNode_None", WE_Coupon_NoneMS))
	Endif
EndFunction

Function AddonChange_Ready()
	(WE_AddonContainerRef as WE_AddonContainerScript).bAdded = false

	TargetWeaponRef = WE_AddonContainerRef.DropFirstObject(true)
	Utility.Wait(0.03)
	iEnhanceLevel = 1 + WE_WeaponEnhancer.CheckKeywordIndex(TargetWeaponRef, WE_LevelKeywordList)

	if iEnhanceLevel < 8 || iEnhanceLevel > 90
		Debug.Messagebox("8강 이상의 무기만 부가옵션을 변경할 수 있습니다")
		PlayerRef.AddItem(TargetWeaponRef)
		Return
	Endif

	iModStage = 2

	sWE_MenuInClick.Play(CurrentMachineRef)
	HideFirstMenuButton()

	EnhanceBackBoradRef = CurrentMachineRef.PlaceAtme(WE_Addon_BackMainMS)
	MenuCollection.AddRef(EnhanceBackBoradRef)

	WE_EnhanceFunction_GunActi.SetName(TargetWeaponRef.GetDisplayName())
	EnhanceGunRef = CurrentMachineRef.PlaceAtNode("GunNode", WE_EnhanceFunction_GunActi)
	MenuCollection.AddRef(EnhanceGunRef)
	EnhanceGunRef.EnableNoWait()

	EnhanceCouponRef = CurrentMachineRef.PlaceAtNode("CouponNode", WE_Addon_CouponButtonActi)
	MenuCollection.AddRef(EnhanceCouponRef)

	EnhanceGoRef = CurrentMachineRef.PlaceAtNode("GoNode", WE_AddonFunction_GoChangeActi)
	MenuCollection.AddRef(EnhanceGoRef)

	EnhanceCancelRef = CurrentMachineRef.PlaceAtNode("CancelNode", WE_AddonFunction_CancelActi)
	MenuCollection.AddRef(EnhanceCancelRef)

	EnhanceNumberMenuRef = CurrentMachineRef.PlaceAtNode("EnhanceNumberNode", WE_AddonBottomStatusMS, 1, false, true)
	EnhanceNumberMenuRef.EnableNoWait()
	MenuCollection.AddRef(EnhanceNumberMenuRef)

	SetAddonFunction()
EndFunction


;; ㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁ 무기 강화 ㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁ


Function FM_EnhanceCoupon(float fMult, ObjectReference SendRef, int iIndex)
	MiscObject TempObject = WE_CouponMiscList.GetAt(iIndex) as MiscObject
	if PlayerRef.GetItemCount(TempObject) <= 0
		Debug.Messagebox("메뉴를 띄우고 쿠폰을 다른곳으로 옮기지 마세요")
		Return
	Endif

	EnhanceCouponDisableNoWait()
	PlayerRef.RemoveItem(TempObject, 1, abSilent = true)
	SendRef.SetScale(1)
	SendRef.MovetoNode(CurrentMachineRef, "CouponNode")

	iCouponStage = 2
	bCouponRegister = true
	iCouponLevel = iIndex + 1

	iSuccessCopy = (iSuccessArray[iEnhanceLevel] * fMult) as int
	sWE_BuyCorePlus.Play(CurrentMachineRef)

	SendRef.EnableNoWait()
	ReplaceSuccessNumber()
	bCouponBlock = false
	bBlockMenu = false
EndFunction

Function EnhanceCouponDisableNoWait()
	CouponRef10.DisableNoWait()
	CouponRef20.DisableNoWait()
	CouponRef30.DisableNoWait()
	CouponRefBack.DisableNoWait()
EndFunction

Function RegisterCouponBack(int iIndex)
	ObjectReference TempRef = PlayerRef.PlaceAtme(WE_CouponMiscList.GetAt(iIndex) as MiscObject, 1, false, true)
	TempRef.SetPlayerHasTaken()
	PlayerRef.AddItem(TempRef, abSilent = true)
	iCouponLevel = 0
EndFunction

Function PushCouponButton(String MenuName)
	if bCouponBlock
		Return
	else
		bCouponBlock = true
	Endif

	if iCouponStage == 2
		iCouponStage = 0
		bCouponRegister = false

		EnhanceCouponDisableNoWait()
		EnhanceCouponRef.EnableNoWait()

		sWE_MenuBackClick.Play(CurrentMachineRef)

		if MenuName == "FM_EnhanceCoupon10"
			RegisterCouponBack(0)
		elseif MenuName == "FM_EnhanceCoupon20"
			RegisterCouponBack(1)
		else
			RegisterCouponBack(2)
		Endif

		iSuccessCopy = iSuccessArray[iEnhanceLevel]
		ReplaceSuccessNumber()

		CouponRef10 = None
		CouponRef20 = None
		CouponRef30 = None
		CouponRefBack = None

		bCouponBlock = false
		bBlockMenu = false
	else
		if MenuName == "FM_EnhanceCoupon10"
			FM_EnhanceCoupon(1.1, CouponRef10, 0)
		elseif MenuName == "FM_EnhanceCoupon20"
			FM_EnhanceCoupon(1.2, CouponRef20, 1)
		elseif MenuName == "FM_EnhanceCoupon30"
			FM_EnhanceCoupon(1.3, CouponRef30, 2)
		else
			iCouponStage = 0
			bCouponRegister = false
			iSuccessCopy = iSuccessArray[iEnhanceLevel]
			EnhanceCouponDisableNoWait()
			EnhanceCouponRef.EnableNoWait()

			sWE_MenuBackClick.Play(CurrentMachineRef)

			CouponRef10 = None
			CouponRef20 = None
			CouponRef30 = None
			CouponRefBack = None

			bBlockMenu = false
			bCouponBlock = false
		Endif
	Endif
EndFunction

Function FM_EnhanceCouponMenu()
	if PlayerRef.GetItemCount(kWE_EnhanceCoupon) <= 0
		debug.messagebox("가지고 있는 쿠폰이 없습니다")
		bBlockMenu = false
		Return
	elseif iEnhanceLevel < 4
		debug.messagebox("현재 레벨은 강화가 무조건 성공하므로 쿠폰을 사용할수 없습니다")
		bBlockMenu = false
		Return
	Endif

	iCouponStage = 1
	EnhanceCouponRef.DisableNoWait()

	CouponRefBack = CurrentMachineRef.PlaceAtNode("CouponNode", WE_CouponActiList.GetAt(3), 1, false, true)
	CouponRefBack.EnableNoWait()
	EnhanceNumberCollection.AddRef(CouponRefBack)

	if PlayerRef.GetItemCount(WE_CouponMiscList.GetAt(0) as MiscObject) > 0
		CouponRef10 = CurrentMachineRef.PlaceAtNode("CouponNode10", WE_CouponActiList.GetAt(0), 1, false, true)
		CouponRef10.SetScale(0.7)
		CouponRef10.EnableNoWait()
		EnhanceNumberCollection.AddRef(CouponRef10)
	Endif
	if PlayerRef.GetItemCount(WE_CouponMiscList.GetAt(1) as MiscObject) > 0
		CouponRef20 = CurrentMachineRef.PlaceAtNode("CouponNode20", WE_CouponActiList.GetAt(1), 1, false, true)
		CouponRef20.SetScale(0.7)
		CouponRef20.EnableNoWait()
		EnhanceNumberCollection.AddRef(CouponRef20)
	Endif
	if PlayerRef.GetItemCount(WE_CouponMiscList.GetAt(2) as MiscObject) > 0
		CouponRef30 = CurrentMachineRef.PlaceAtNode("CouponNode30", WE_CouponActiList.GetAt(2), 1, false, true)
		CouponRef30.SetScale(0.7)
		CouponRef30.EnableNoWait()
		EnhanceNumberCollection.AddRef(CouponRef30)
	Endif
EndFunction

Function FM_WeaponEnhance()
	WE_ContainerRef.Activate(PlayerRef)
	bBlockMenu = false
EndFunction

Function FM_StopEnhance()
	if iCouponStage == 2
		Debug.Messagebox("먼저 등록된 쿠폰을 회수하세요")
		bBlockMenu = false
		Return
	Endif

	PlayerRef.AddItem(TargetWeaponRef)
	CloseEnhanceMenu()
	SetFirstMenuButton()
	bBlockMenu = false
EndFunction

Function FM_GoEnhance()
	if PlayerRef.GetItemCount(WE_EnhanceCoreMisc) < iCoreArray[iEnhanceLevel]
		if PlayerRef.GetItemCount(WE_EnhanceCoreMisc) != iFirstCoreCount
			HideNumber(EnhanceNumberCollection)
			SetEnhanceNumber()
		Endif
		Debug.Messagebox("무기 강화의 정수가 부족합니다")
		bBlockMenu = false
		Return
	elseif iEnhanceLevel >= 15
		Debug.Messagebox("최대 강화레벨에 도달하여 더 강화할수 없습니다")
		bBlockMenu = false
		Return
	else
		bBlockMenu = true
		PlayerRef.RemoveItem(WE_EnhanceCoreMisc, iCoreArray[iEnhanceLevel], true)
	Endif

	GoEnhance()
EndFunction

Function GoEnhance()
	bCouponBlock = true

	float fTemp = WE_WeaponEnhancer.GetRandom()
	int iTemp = Math.Floor(fTemp)
	float fDP = fTemp - iTemp
	float fRandom = fDP + iTemp%100

	int iSuccess = iSuccessCopy

	if iEnhanceLevel < 4
		iSuccess = 100
	Endif

	String sCoupon = ""

	if bCouponRegister
		bCouponRegister = false
		if iCouponLevel == 1
			sCoupon = " (10% 쿠폰 사용)"
		elseif iCouponLevel == 2
			sCoupon = " (20% 쿠폰 사용)"
		else
			sCoupon = " (30% 쿠폰 사용)"
		Endif

		iCouponLevel = 0
	Endif

	int iGaugeSpeedRank = iEnhanceLevel

	String sOrigin = TargetWeaponRef.GetDisplayName()
	String sName

	float fMoveRange
	if iSuccess > fRandom
		iEnhanceResult = 0
		fMoveRange = 37


		iEnhanceLevel += 1


		sName = "+" + ((iEnhanceLevel) as string) + " " + TargetWeaponRef.GetBaseObject().GetName()
		ObjectMod AddonMod

		if iEnhanceLevel == 8
			int iRankB = 86
			int iCheck = (WE_WeaponEnhancer.GetRandom() as int) % 100
			FormList tempList
			if iCheck <= iRankB
				tempList = WE_AddonModList.GetAt(iRankBIndex) as FormList
			else
				tempList = WE_AddonModList.GetAt(iRankAIndex) as FormList
			Endif
			int iAddonIndex = Utility.RandomInt(0, tempList.GetSize() - 1)
			AddonMod = tempList.GetAt(iAddonIndex) as ObjectMod

			if iCheck <= iRankB
				sName += " - " + AddonNameArrayB[iAddonIndex]
			else
				sName += " - " + AddonNameArrayA[iAddonIndex]
			Endif
		elseif iEnhanceLevel > 8
			int[] iAddon = WE_WeaponEnhancer.CheckAddonKeyword(TargetWeaponRef)
			if iAddon[0] == 0
				sName += " - " + AddonNameArrayB[iAddon[1]]

			elseif iAddon[0] == 1
				sName += " - " + AddonNameArrayA[iAddon[1]]
			else
				sName += " - " + AddonNameArrayS[iAddon[1]]
			Endif
		Endif

		WE_WeaponEnhancer.ChangeItemName(TargetWeaponRef, WE_ContainerRef, sName)
		WE_EnhanceFunction_GunActi.SetName(sName)
		EnhanceGunRef.BlockActivation(true, true)

		TargetWeaponRef.Moveto(WE_ReturnMarker)
		TargetWeaponRef.Delete()
		TargetWeaponRef = None

		Utility.Wait(0.03)

		TargetWeaponRef = WE_ContainerRef.DropFirstObject(true)
		TargetWeaponRef.AttachMod(WE_LevelModList.GetAt(iEnhanceLevel - 1) as ObjectMod)
		if iEnhanceLevel == 8
			TargetWeaponRef.AttachMod(AddonMod)
		Endif

		TargetWeaponRef.SetPlayerHasTaken()
	else
		iEnhanceResult = 1
		fMoveRange = fNoticeBaseHeight + fNoticeLevel4Height + (iEnhanceLevel * fNoticeLevelHeightMult) - Utility.RandomFloat(1, fFailRangeMax + (iEnhanceLevel * fNoticeLevelHeightMult * 0.5))

		if iMinusArray[iEnhanceLevel] == 1
			iEnhanceLevel -= 1
			sName = "+" + ((iEnhanceLevel) as string) + " " + TargetWeaponRef.GetBaseObject().GetName()

			WE_WeaponEnhancer.ChangeItemName(TargetWeaponRef, WE_ContainerRef, sName)
			WE_EnhanceFunction_GunActi.SetName(sName)
			EnhanceGunRef.BlockActivation(true, true)

			TargetWeaponRef.Moveto(WE_ReturnMarker)
			TargetWeaponRef.Delete()
			TargetWeaponRef = None

			Utility.Wait(0.03)
			TargetWeaponRef = WE_ContainerRef.DropFirstObject(true)
			TargetWeaponRef.AttachMod(WE_LevelModList.GetAt(iEnhanceLevel - 1) as ObjectMod)
			TargetWeaponRef.SetPlayerHasTaken()
		elseif iMinusArray[iEnhanceLevel] == 2
			int iBreak = iBreakArray[iEnhanceLevel]
			sName = TargetWeaponRef.GetDisplayName()

			if fRandom > (100 - iBreak)
				iEnhanceResult = 2
				TargetWeaponRef.Moveto(WE_ReturnMarker)
				TargetWeaponRef.Delete()
				TargetWeaponRef = None

				iBreakReward = iCoreArray[iEnhanceLevel] * 4
				fMoveRange = 37
			Endif
		Endif
		
	Endif

	RegisterForRemoteEvent(EnhanceGaugeRef, "OnTranslationComplete")

	EnhanceDrillRef = CurrentMachineRef.PlaceAtNode("HammerNode", WE_EnhanceFunction_DrillMS, 1, false, true)
	EnhanceDrillRef.EnableNoWait()
	EnhanceNumberCollection.AddRef(EnhanceDrillRef)

	if iGaugeSpeedRank < 4
		cPlaySound = sWE_Drill_Enhance_Short.Play(CurrentMachineRef)
		EnhanceGaugeRef.TranslateTo(EnhanceGaugeRef.X, EnhanceGaugeRef.Y, EnhanceGaugeRef.Z + fMoveRange, 0, 0, EnhanceGaugeRef.GetAngleZ(), fGaugeSpeedLow)
	elseif iGaugeSpeedRank < 8
		cPlaySound = sWE_Drill_Enhance_Mid.Play(CurrentMachineRef)
		EnhanceGaugeRef.TranslateTo(EnhanceGaugeRef.X, EnhanceGaugeRef.Y, EnhanceGaugeRef.Z + fMoveRange, 0, 0, EnhanceGaugeRef.GetAngleZ(), fGaugeSpeedMid)
	else
		cPlaySound = sWE_Drill_Enhance_Long.Play(CurrentMachineRef)
		EnhanceGaugeRef.TranslateTo(EnhanceGaugeRef.X, EnhanceGaugeRef.Y, EnhanceGaugeRef.Z + fMoveRange, 0, 0, EnhanceGaugeRef.GetAngleZ(), fGaugeSpeedHigh)
	Endif

	String sLog = sOrigin + " 의 강화에 "
	if iEnhanceResult == 0
		sLog = "성공 : " + sLog + "성공하여 " + sName + " 가 됨"
	elseif iEnhanceResult == 1
		sLog = "실패 : " + sLog + "실패하여 " + sName + " 가 됨"
	else
		sLog = "파괴 : " + sLog + "실패하여 무기가 파괴되고 강화정수 " + iBreakReward + " 개 획득"
	Endif
	WE_WeaponEnhancer.SaveItemUseCheck(sLog, sCoupon)
EndFunction

Event ObjectReference.OnTranslationComplete(ObjectReference akSneder)
	UnRegisterForRemoteEvent(EnhanceGaugeRef, "OnTranslationComplete")
	EnhanceGaugeStop()
EndEvent

Function EnhanceGaugeStop()
	if bForceStop
		Return
	Endif

	EnhanceGunRef.BlockActivation(false)

	if iEnhanceResult < 2
		EnhanceDrillRef.Moveto(WE_ReturnMarker)
		EnhanceDrillRef = None

		if iEnhanceResult == 0
			if iEnhanceLevel < 8
				sWE_Success.Play(CurrentMachineRef)
			else
				sWE_VeryGood.Play(CurrentMachineRef)
			Endif
		else
			Sound.StopInstance(cPlaySound)
			sWE_Fail.Play(CurrentMachineRef)
		Endif

		ObjectReference TempRef09 = CurrentMachineRef.PlaceAtNode("EnhanceResultNode", WE_EnhanceResultList.GetAt(iEnhanceResult) as Static, 1, false, true)
		TempRef09.EnableNoWait()
		EnhanceNumberCollection.AddRef(TempRef09)
	else
		sWE_Hammer_Long.Play(CurrentMachineRef)

		EnhanceDrillRef.Moveto(WE_ReturnMarker)
		EnhanceDrillRef = None
		EnhanceDrillRef = CurrentMachineRef.PlaceAtNode("HammerNode", WE_EnhanceFunction_HammerMS, 1, false, true)
		EnhanceDrillRef.EnableNoWait()
		EnhanceNumberCollection.AddRef(EnhanceDrillRef)

		EnhanceGaugeRef.TranslateTo(EnhanceGaugeRef.X, EnhanceGaugeRef.Y, EnhanceGaugeRef.Z + 5, 0, 0, EnhanceGaugeRef.GetAngleZ(), fGaugeSpeedHigh)
		Utility.Wait(2)
	Endif
	
	Utility.Wait(1.8)

	if bForceStop
		Return
	Endif

	if iEnhanceResult == 2
		EnhanceGaugeRef.StopTranslation()
		EnhanceGoRef.Moveto(WE_ReturnMarker)
	Endif

	HideNumber(EnhanceNumberCollection)
	if EnhanceCouponRef.IsDisabled()
		EnhanceCouponRef.EnableNoWait()
	Endif
	bCouponBlock = false
	iCouponStage = 0

	EnhanceGaugeRef = None
	EnhanceNoticeRef = None

	if iEnhanceResult < 2
		SetEnhanceNumber()
	else
		EnhanceBreakRef = CurrentMachineRef.PlaceAtNode("EnhanceBreakNode", WE_EnhanceResultList.GetAt(iEnhanceResult) as Static, 1, false, true)
		EnhanceBreakRef.EnableNoWait()
		MenuCollection.AddRef(EnhanceBreakRef)
		EnhanceGunRef.Moveto(WE_ReturnMarker)

		sWE_EnhanceBreak.Play(CurrentMachineRef)	
	Endif

	bBlockMenu = false
EndFunction

Function WeaponEnhance_Error(ObjectReference SendContainer)
	(SendContainer as WE_ContainerScript).bAdded = false
	(SendContainer as WE_AddonContainerScript).bAdded = false
	Utility.Wait(0.03)
	WE_ContainerRef.RemoveAllItems(PlayerRef)
	Debug.Messagebox("무기 한개만 넣어주세요. 아이템을 반환합니다")
EndFunction

Function WeaponEnhance_Ready()
	(WE_ContainerRef as WE_ContainerScript).bAdded = false
	iModStage = 1

	sWE_MenuInClick.Play(CurrentMachineRef)
	HideFirstMenuButton()

	TargetWeaponRef = WE_ContainerRef.DropFirstObject(true)

	EnhanceBackBoradRef = CurrentMachineRef.PlaceAtme(WE_EnhanceFunction_BackMainMS)
	MenuCollection.AddRef(EnhanceBackBoradRef)

	iEnhanceLevel = 1 + WE_WeaponEnhancer.CheckKeywordIndex(TargetWeaponRef, WE_LevelKeywordList)
	if iEnhanceLevel >= 99
		iEnhanceLevel = 0
	Endif
	if iEnhanceLevel != 0
		WE_EnhanceFunction_GunActi.SetName(TargetWeaponRef.GetDisplayName())
	else
		WE_EnhanceFunction_GunActi.SetName("+0 " + TargetWeaponRef.GetBaseObject().GetName())
	Endif
	EnhanceGunRef = CurrentMachineRef.PlaceAtNode("GunNode", WE_EnhanceFunction_GunActi)

	MenuCollection.AddRef(EnhanceGunRef)
	EnhanceGunRef.EnableNoWait()

	EnhanceCouponRef = CurrentMachineRef.PlaceAtNode("CouponNode", WE_EnhanceFunction_CouponButtonActi)
	MenuCollection.AddRef(EnhanceCouponRef)

	EnhanceGoRef = CurrentMachineRef.PlaceAtNode("GoNode", WE_EnhanceFunction_GoEnhanceActi)
	MenuCollection.AddRef(EnhanceGoRef)
	EnhanceCancelRef = CurrentMachineRef.PlaceAtNode("CancelNode", WE_EnhanceFunction_CancelActi)
	MenuCollection.AddRef(EnhanceCancelRef)

	EnhanceNumberMenuRef = CurrentMachineRef.PlaceAtNode("EnhanceNumberNode", WE_EnhanceMenuMS, 1, false, true)
	EnhanceNumberMenuRef.EnableNoWait()
	MenuCollection.AddRef(EnhanceNumberMenuRef)

	SetEnhanceNumber()
EndFunction

Function ReplaceSuccessNumber()
	SuccessNumberTenRef.Moveto(WE_ReturnMarker)
	SuccessNumberOneRef.Moveto(WE_ReturnMarker)
	SuccessNumberTenRef = none
	SuccessNumberOneRef = none
	SetSuccessNumber()
EndFunction

Function SetSuccessNumber()
	int iSuccess = iSuccessCopy
	int iOne = iSuccess%10
	if iSuccess >= 10
		SuccessNumberTenRef = CurrentMachineRef.PlaceAtNode("Line_3_01", WE_NumberList_Blue.GetAt(((iSuccess - iOne) / 10) as int) as Static, 1, false, true)
		SuccessNumberOneRef = CurrentMachineRef.PlaceAtNode("Line_3_02", WE_NumberList_Blue.GetAt(iOne) as Static, 1, false, true)
		SuccessNumberTenRef.EnableNoWait()
		SuccessNumberOneRef.EnableNoWait()
		EnhanceNumberCollection.AddRef(SuccessNumberTenRef)
		EnhanceNumberCollection.AddRef(SuccessNumberOneRef)
	else
		SuccessNumberOneRef = CurrentMachineRef.PlaceAtNode("Line_3_02", WE_NumberList_Blue.GetAt(iOne) as Static, 1, false, true)
		SuccessNumberOneRef.EnableNoWait()
		EnhanceNumberCollection.AddRef(SuccessNumberOneRef)
	Endif
EndFunction

Function SetEnhanceNumber()
	iFirstCoreCount = PlayerRef.GetItemCount(WE_EnhanceCoreMisc)
	iSuccessCopy = iSuccessArray[iEnhanceLevel]

	EnhanceNoticeRef = CurrentMachineRef.PlaceAtNode("NoticeNode", WE_EnhanceFunction_SuccessNoticeMS, 1, false, true)

	float fNoticeRange = 0
	if iEnhanceLevel >= 4
		fNoticeRange  = fNoticeLevel4Height + (iEnhanceLevel * fNoticeLevelHeightMult)
	Endif
	EnhanceNoticeRef.Moveto(EnhanceNoticeRef, 0, 0, fNoticeRange)
	EnhanceNoticeRef.EnableNoWait()
	EnhanceNumberCollection.AddRef(EnhanceNoticeRef)

	EnhanceGaugeRef = CurrentMachineRef.PlaceAtNode("GaugeNode", WE_EnhanceFunction_SuccessBarMS)
	EnhanceNumberCollection.AddRef(EnhanceGaugeRef)

	if iEnhanceLevel < 8
		ObjectReference TempRef = CurrentMachineRef.PlaceAtNode("EnhanceAddonNode", WE_AddonMS_None, 1, false, true)
		TempRef.EnableNoWait()
		EnhanceNumberCollection.AddRef(TempRef)
	elseif TargetWeaponRef.HasKeyword(kWE_Addon_Fail)
		ObjectReference TempRef = CurrentMachineRef.PlaceAtNode("EnhanceAddonNode", WE_AddonMS_Fail, 1, false, true)
		TempRef.EnableNoWait()
		EnhanceNumberCollection.AddRef(TempRef)
	else
		int[] iAddon = WE_WeaponEnhancer.CheckAddonKeyword(TargetWeaponRef)
		FormList tempList = WE_AddonStaticList.GetAt(iAddon[0]) as FormList
		Static tempStatic = tempList.GetAt(iAddon[1]) as Static
		ObjectReference TempRef = CurrentMachineRef.PlaceAtNode("EnhanceAddonNode", tempStatic, 1, false, true)
		TempRef.EnableNoWait()
		EnhanceNumberCollection.AddRef(TempRef)
	Endif

	WE_WeaponEnhancer.PlaceNumber(CurrentMachineRef, iEnhanceLevel, EnhanceNumberCollection)

	ObjectReference TempRef02 = CurrentMachineRef.PlaceAtNode("Line_4_01", WE_FailList.GetAt(iMinusArray[iEnhanceLevel]), 1, false, true)
	TempRef02.EnableNoWait()
	EnhanceNumberCollection.AddRef(TempRef02)

	SetSuccessNumber()

	if iEnhanceLevel < 4 || PlayerRef.GetItemCount(kWE_EnhanceCoupon) <= 0
		EnhanceNumberCollection.AddRef(CurrentMachineRef.PlaceAtNode("CouponNode_None", WE_Coupon_NoneMS))
	Endif
EndFunction

Function CloseEnhanceMenu()
	HideNumber(MenuCollection)
	HideNumber(EnhanceNumberCollection)

	if iBreakReward > 0
		PlayerRef.AddItem(WE_EnhanceCoreMisc, iBreakReward)
		debug.messagebox("무기의 잔해에서 무기 강화의 정수 " + iBreakReward + "개를 회수했습니다")
		iBreakReward = 0
	Endif

	EnhanceNumberMenuRef = None
	EnhanceBackBoradRef = None
	EnhanceGunRef = None
	EnhanceCouponRef = None
	EnhanceDrillRef = None
	EnhanceGoRef = None
	EnhanceCancelRef = None
	EnhanceGaugeRef = None
	EnhanceNoticeRef = None
	EnhanceBreakRef = None
	SuccessNumberTenRef = none
	SuccessNumberOneRef = none
	AddonNumberHundRef = none
	AddonNumberTenRef = none
	AddonNumberOneRef = none
	iCouponStage = 0
	iModStage = 0
EndFunction

Function ForceCloseMenu()
	UnRegisterForRemoteEvent(CurrentMachineRef, "OnUnload")

	if iModStage == 0
		HideFirstMenuButton()
	elseif iModStage == 1
		UnRegisterForRemoteEvent(EnhanceGaugeRef, "OnTranslationComplete")
		EnhanceGaugeRef.StopTranslation()
		if TargetWeaponRef.IsDisabled() && iEnhanceResult < 2
			PlayerRef.AddItem(TargetWeaponRef)
		Endif
		CloseEnhanceMenu()
	elseif iModStage == 2
		if TargetWeaponRef.IsDisabled()
			PlayerRef.AddItem(TargetWeaponRef)
		Endif
		CloseAddonMenu()
	elseif iModStage == 3
		CloseMoveEnhance()
	elseif iModStage == 4
		CloseBuyCore()
	elseif iModStage == 5
		CloseModDesp()
	Endif

	WhiteBackRef.Moveto(WE_ReturnMarker)
	WhiteBackRef = None
	iModStage = 0
	iCouponStage = 0
	iBreakReward = 0
	bMenuOn = false
	bBlockMenu = false
	bCouponBlock = false
	bRankACouponOn = false
	CouponRef10 = None
	CouponRef20 = None
	CouponRef30 = None
	CouponRefBack = None

	if bCouponRegister
		bCouponRegister = false
	Endif

	CurrentMachineRef.RemoveKeyword(BlockWorkshopInteractionKeyword)
	CurrentMachineRef.BlockActivation(false)
EndFunction