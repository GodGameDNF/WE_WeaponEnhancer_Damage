ScriptName Addon:WE_ME_S11_Enemy_Script Extends ActiveMagicEffect

Spell Property WE_Spell_S11_User Auto
ActorValue Property Health Auto
Float Property fMult Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
	WE_Spell_S11_User.Cast(akTarget, akCaster)
	akTarget.DamageValue(Health, akTarget.GetBaseValue(Health) * fMult)
EndEvent