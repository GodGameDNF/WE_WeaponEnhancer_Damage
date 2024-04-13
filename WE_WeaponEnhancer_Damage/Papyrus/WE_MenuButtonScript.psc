ScriptName WE_MenuButtonScript Extends ObjectReference

String Property MenuName Auto
WE_EnhenceManagerQuestScript Property WE_EnhenceManagerQuest Auto

Event OnActivate(ObjectReference akActionRef)
	WE_EnhenceManagerQuest.PushMenuButton(MenuName)
EndEvent