Scriptname DB_AddPowerScript extends ActiveMagicEffect  

Spell Property DB_YsmirMeditationPower Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
	akTarget.AddSpell(DB_YsmirMeditationPower)
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
	akTarget.RemoveSpell(DB_YsmirMeditationPower)
EndEvent