ScriptName Addon:WE_ME_S13_Enemy_Script Extends ActiveMagicEffect

Spell Property WE_Spell_S00_User Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
	WE_Spell_S00_User.Cast(akTarget, akCaster)
	akTarget.SetRestrained()
	Utility.Wait(4)
	akTarget.SetRestrained(false)
EndEvent