ScriptName WE_MoveEnhanceContainerScript Extends ObjectReference

String Property sLocation Auto
WE_EnhenceManagerQuestScript Property WE_EnhenceManagerQuest Auto

bool Property bAdded = false Auto Conditional

Event OnInit()
	AddInventoryEventFilter(None)
EndEvent

Event OnItemAdded(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)
	;;BlockActivation(true, true)
	CheckAndGO()
EndEvent

Function CheckAndGO()
	if !bAdded
		bAdded = true
		Utility.Wait(0.03)

		if GetItemCount() > 1
			WE_EnhenceManagerQuest.WeaponEnhance_Error(Self)
		else
			Form[] fItem = GetInventoryItems()
			Form BaseForm = fItem[0] ;; (fItem[0] as ObjectReference).GetBaseObject()
			if !(BaseForm as Weapon)
				WE_EnhenceManagerQuest.WeaponEnhance_Error(Self)
			else
				if sLocation == "Left"
					WE_EnhenceManagerQuest.FM_LeftGunActi()
				else
					WE_EnhenceManagerQuest.FM_RightGunActi()
				Endif
			Endif
		Endif
	Endif
EndFunction