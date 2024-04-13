ScriptName WE_CouponButtonScript Extends ObjectReference

String Property MenuName Auto
WE_EnhenceManagerQuestScript Property WE_EnhenceManagerQuest Auto

Event OnActivate(ObjectReference akActionRef)
	WE_EnhenceManagerQuest.PushCouponButton(MenuName)
EndEvent