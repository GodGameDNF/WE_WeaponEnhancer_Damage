ScriptName WE_SaveGlobalQuestScript Extends ReferenceAlias

Actor Property PlayerRef Auto
MiscObject Property WE_EnhanceCoreMisc Auto
GlobalVariable Property gWE_GameID Auto

;/
Event OnAliasInit()
	AddInventoryEventFilter(WE_EnhanceCoreMisc)
EndEvent
/;

Event OnItemAdded(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)
	gWE_GameID.SetValue(Utility.RandomFloat(0, 1000))
	RemoveInventoryEventFilter(WE_EnhanceCoreMisc)
	GetOwningQuest().Stop()
EndEvent
