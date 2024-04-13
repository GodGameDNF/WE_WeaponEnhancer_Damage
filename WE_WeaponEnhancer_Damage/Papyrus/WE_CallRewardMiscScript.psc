ScriptName WE_CallRewardMiscScript Extends ObjectReference

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
	if akOldContainer == None
		akNewContainer.RemoveItem(Self)
		WE_WeaponEnhancer.CallRewardContainer(akNewContainer)
	Endif
EndEvent