ScriptName Addon:WE_ME_S09_Enemy_Script Extends ActiveMagicEffect

Spell Property WE_Spell_S09_User Auto
ActorValue Property Health Auto
Float Property fMult Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
	WE_Spell_S09_User.Cast(akTarget, akCaster)
EndEvent