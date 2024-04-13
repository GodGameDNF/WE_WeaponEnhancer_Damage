ScriptName WE_WeaponPatch_1_0_Script Extends Quest

Quest Property WE_EnhenceManagerQuest Auto
Quest Property WE_NPCItemAddedQuest Auto
Quest Property WE_SaveGlobalQuest Auto
GlobalVariable Property gWE_GameID Auto

Event OnQuestInit()
	if WE_SaveGlobalQuest.IsRunning() || gWE_GameID.GetValue() != 5
		WE_EnhenceManagerQuest.Stop()
		WE_NPCItemAddedQuest.Stop()
		WE_SaveGlobalQuest.Stop()

		Utility.Wait(0.3)

		WE_EnhenceManagerQuest.Start()

		Debug.Notification("테스트 무기강화기 정식버전으로 패치함")
	Endif
	stop()
EndEvent