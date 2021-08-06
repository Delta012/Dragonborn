Scriptname DB_OpenSkillTreeScript extends ActiveMagicEffect  

GlobalVariable Property DB_SkillTree Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
	DB_SkillTree.SetValue(1)
endEvent 