ScriptName Addon:WE_ME_S09_User_Script Extends ActiveMagicEffect

ActorValue Property Health Auto
Float Property fMult Auto

Event OnEffectFinish(Actor akTarget, Actor akCaster)
	akCaster.DamageValue(Health, akTarget.GetLevel() * fMult)
EndEvent