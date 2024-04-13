ScriptName WE_ActiBaseActiScript Extends ObjectReference

WE_EnhenceManagerQuestScript Property WE_EnhenceManagerQuest Auto

Event OnWorkshopObjectPlaced(ObjectReference akReference)
	WE_EnhenceManagerQuest.CheckQuestError()
EndEvent

Event OnActivate(ObjectReference akActionRef)
	WE_EnhenceManagerQuest.OnFirstMenu(Self)
EndEvent