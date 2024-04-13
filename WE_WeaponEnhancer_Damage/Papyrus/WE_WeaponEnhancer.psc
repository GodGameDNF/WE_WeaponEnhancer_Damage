ScriptName WE_WeaponEnhancer Hidden Native

Function ChangeItemName(ObjectReference refr, ObjectReference ChsetRef, String name) Global Native

Function SaveItemUseCheck(String Desp, String cou) Global Native
Function ItemAddUseCheck(ObjectReference ChsetRef, float fGameID) Global Native
Function HidePanal(ObjectReference[] SendArray) Global Native
Function HideNumber(RefCollectionAlias EnhanceNumberCollection) Global Native
Function ArrayMovetoNode(ObjectReference[] SendArray, ObjectReference TargetRef) Global Native
Function PlaceNumber(ObjectReference TargetRef, int iLevel, RefCollectionAlias NumberCollection) Global Native
float Function GetRandom() Global Native

Function DeathNPCItemAdd(ObjectReference akVictim,RefCollectionAlias DeadCollection) Global Native
int[] Function CheckAddonKeyword(ObjectReference WeaponRef) Global Native
int Function CheckKeywordIndex(ObjectReference WeaponRef, FormList SendList) Global Native
Function PlaceAddonNumber(ObjectReference TargetRef, RefCollectionAlias NumberCollection) Global Native
Function SetBuyCoreMenu(ObjectReference TargetRef, RefCollectionAlias MenuCollection) Global Native
int Function SetBuyCoreNumber(ObjectReference TargetRef, RefCollectionAlias MenuCollection, int iReserve) Global Native
ObjectReference Function ChangeDespAddon(ObjectReference TargetRef, RefCollectionAlias Collection, ObjectReference DespAddonRef, float fMove) Global Native
Function CallRewardContainer(ObjectReference ContainerRef) Global Native
Function CorpseNumber(ObjectReference ContainerRef, int i, RefCollectionAlias Collection) Global Native