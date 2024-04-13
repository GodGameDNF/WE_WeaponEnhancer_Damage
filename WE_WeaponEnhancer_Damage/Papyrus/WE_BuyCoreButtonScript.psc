ScriptName WE_BuyCoreButtonScript Extends ObjectReference

int Property iCoreCount Auto
WE_EnhenceManagerQuestScript Property WE_EnhenceManagerQuest Auto

Event OnActivate(ObjectReference akActionRef)
	WE_EnhenceManagerQuest.PushBuyCoreCount(iCoreCount)
EndEvent