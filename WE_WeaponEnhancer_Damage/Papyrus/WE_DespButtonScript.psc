ScriptName WE_DespButtonScript Extends ObjectReference

Float Property fMove Auto
WE_EnhenceManagerQuestScript Property WE_EnhenceManagerQuest Auto

Event OnActivate(ObjectReference akActionRef)
	WE_EnhenceManagerQuest.PushDirectionButton(fMove)
EndEvent