ScriptName WE_MoveEnhance_GunActiScript Extends ObjectReference

String Property sLocation Auto
WE_EnhenceManagerQuestScript Property WE_EnhenceManagerQuest Auto

Event OnActivate(ObjectReference akActionRef)
	if sLocation == "Left"
		WE_EnhenceManagerQuest.ActivateGunActi_Left()
	else
		WE_EnhenceManagerQuest.ActivateGunActi_Right()
	Endif
EndEvent