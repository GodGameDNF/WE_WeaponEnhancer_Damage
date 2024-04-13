ScriptName WE_NPCItemAddedQuestScript Extends Quest

RefCollectionAlias Property CorpseCollection Auto

Event OnStoryKillActor(ObjectReference akVictim, ObjectReference akKiller, Location akLocation, int aiCrimeStatus, int aiRelationshipRank)
	WE_WeaponEnhancer.DeathNPCItemAdd(akVictim, CorpseCollection)
EndEvent