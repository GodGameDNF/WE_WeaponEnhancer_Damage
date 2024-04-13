ScriptName Addon:WE_ME_S05_Enemy_Script Extends ActiveMagicEffect

Spell Property WE_Spell_S05_User Auto
ActorValue Property Health Auto
Float Property fMult Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
	WE_Spell_S05_User.Cast(akTarget, akCaster)
	akTarget.DamageValue(Health, akCaster.GetDistance(akTarget) * fMult)
EndEvent