Scriptname DB_OpenSkillTreePortableScript extends ObjectReference

Actor Property PlayerRef Auto

GlobalVariable Property DB_SkillTree Auto

Event OnEquipped(Actor akActor)

	If akActor == PlayerRef
		If Utility.IsInMenuMode()
			Game.DisablePlayerControls(True, True, False, False, False, True, True, False, 0)
			Utility.Wait(0.0100000)
			game.EnablePlayerControls(True, True, True, True, True, True, True, True, 0)
		endIf
		DB_SkillTree.SetValue(1)
	endIf

EndEvent 