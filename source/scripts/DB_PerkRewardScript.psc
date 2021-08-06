Scriptname DB_PerkRewardScript extends ActiveMagicEffect  

GlobalVariable Property DB_PerkPoints Auto
GlobalVariable Property DB_PerkPointsTotal Auto

Message Property DB_PerkMessage Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
	DB_PerkPoints.Value += 1
	DB_PerkPointsTotal.Value += 1
	DB_PerkMessage.Show()
EndEvent