Scriptname DB_ShoutCastScript extends ActiveMagicEffect

Actor Property PlayerRef Auto

int Property ShoutTimes Auto

Keyword Property MagicShout Auto

Perk Property DB_HardenedArmor40 Auto
Perk Property DB_TheTongue80 Auto
Perk Property DB_PaarThurNax100 Auto

Spell Property DB_HardenedArmor Auto
Spell Property DB_TheTongue Auto

Event OnSpellCast(Form akSpell)

	If PlayerRef.IsInCombat() && PlayerRef.HasPerk(DB_PaarThurNax100)
		If (akSpell.HasKeyword(MagicShout))
			While (ShoutTimes < 3)
				Utility.Wait(0.250000)
				If PlayerRef.GetVoiceRecoveryTime() <= 300 && PlayerRef.GetVoiceRecoveryTime() > 0
					PlayerRef.SetVoiceRecoveryTime(0)
					ShoutTimes += 1
				endIf
			endWhile
		endIf
	endIf

	If PlayerRef.IsInCombat() && PlayerRef.HasPerk(DB_TheTongue80)
		If (akSpell.HasKeyword(MagicShout))
			DB_TheTongue.Cast(PlayerRef)
		endIf
	endIf

	If PlayerRef.IsInCombat() && PlayerRef.HasPerk(DB_HardenedArmor40)
		If (akSpell.HasKeyword(MagicShout))
			Utility.Wait(0.250000)
			Float SpellDuration = PlayerRef.GetVoiceRecoveryTime()
			DB_HardenedArmor.SetNthEffectDuration(0, SpellDuration as int)
			DB_HardenedArmor.Cast(PlayerRef, PlayerRef)
		endIf
	endIf

endEvent 

Event OnCombatStateChanged(Actor akTarget, int aeCombatState)

	If (akTarget == PlayerRef)
		If (aeCombatState == 0)
			ShoutTimes = 0
			PlayerRef.DispelSpell(DB_HardenedArmor)
		endIf
	endIf

EndEvent 