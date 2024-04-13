ScriptName WE_ContainerScript Extends ObjectReference

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
				WE_EnhenceManagerQuest.WeaponEnhance_Ready()
			Endif
		Endif
	Endif
EndFunction