ScriptName WE_BuyCoreZeroButtonScript Extends ObjectReference

WE_EnhenceManagerQuestScript Property WE_EnhenceManagerQuest Auto

Event OnActivate(ObjectReference akActionRef)
	WE_EnhenceManagerQuest.PushBuyCoreZeroCount()
EndEvent