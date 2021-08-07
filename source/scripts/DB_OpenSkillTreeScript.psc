Scriptname DB_OpenSkillTreeScript extends ActiveMagicEffect

GlobalVariable Property DB_SkillTree Auto

Furniture Property GreybeardMeditate Auto

ObjectReference MeditateMatRef

Auto State Start

	Event OnEffectStart(Actor akTarget, Actor akCaster)
		
		MeditateMatRef = akTarget.PlaceAtMe(GreybeardMeditate, abInitiallyDisabled = True)
	
		Float fAngle = akCaster.GetAngleZ()
		MeditateMatRef.MoveTo(akCaster, 0, 0, 0)
		MeditateMatRef.SetAngle(0, 0, fAngle)
		MeditateMatRef.Enable()
	
		MeditateMatRef.Activate(akTarget, True)
		
	EndEvent

	Event OnSit(ObjectReference akFurniture)
	
		If akFurniture == MeditateMatRef
			GotoState("Meditate")
				Utility.Wait(1.0)
				DB_SkillTree.SetValue(1)
		endIf
		
	EndEvent

EndState

State Meditate

	Event OnGetUp(ObjectReference akFurniture)
	
		If akFurniture == MeditateMatRef
			GotoState("Cleanup")
		endIf
		
	EndEvent

	Event OnEffectFinish(Actor akTarget, Actor akCaster)
	
		MeditateMatRef.Activate(akTarget, True)
		GotoState("Cleanup")
		
	EndEvent

EndState

State Cleanup

	Event OnBeginState()
	
		MeditateMatRef.Disable()
		MeditateMatRef.Delete()
		
	EndEvent

EndState