ScriptName Addon:WE_ME_S00_User_Script Extends ActiveMagicEffect

ActorValue Property Health Auto
Float Property fMult Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
	akTarget.RestoreValue(Health, akCaster.GetBaseValue(Health) / fMult)
EndEvent