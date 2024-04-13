ScriptName WE_CorpseCollectionScript Extends RefCollectionAlias

MiscObject Property WE_EnhanceCoreMisc Auto
ObjectReference Property WE_CorpseContainerRef Auto

Event OnActivate(ObjectReference akSender, ObjectReference akActionRef)
	RemoveRef(akSender)
EndEvent

Event OnUnload(ObjectReference akSender)
	if akSender.GetItemCount(WE_EnhanceCoreMisc) > 0
		akSender.RemoveItem(WE_EnhanceCoreMisc, -1, false, WE_CorpseContainerRef)
	Endif
	RemoveRef(akSender)
EndEvent