Scriptname DB_ShoutExperienceScript extends ActiveMagicEffect

Actor Property PlayerRef Auto

GlobalVariable Property DB_Level Auto
GlobalVariable Property DB_LevelMax Auto
GlobalVariable Property DB_LevelUp Auto
GlobalVariable Property DB_PerkPoints Auto
GlobalVariable Property DB_PerkPointsTotal Auto
GlobalVariable Property DB_SkillProgress Auto

int Property NextPerk Auto

Message Property DB_PerkMessage Auto

Perk Property DB_DragonBlood10 Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)

	RegisterForTrackedStatsEvent()

endEvent

Event OnSpellCast(Form akSpell)

	If PlayerRef.IsInCombat()
		Spell ShoutSpell = akSpell as Spell
			Shout EquippedShout = PlayerRef.GetEquippedShout()
			If ShoutSpell == EquippedShout.GetNthSpell(0)
				DBAdvanceSkillCombat1()
			elseIf ShoutSpell == EquippedShout.GetNthSpell(1)
				DBAdvanceSkillCombat2()
			elseIf ShoutSpell == EquippedShout.GetNthSpell(2)
				DBAdvanceSkillCombat3()
			endIf
	else
		Spell ShoutSpell = akSpell as Spell
			Shout EquippedShout = PlayerRef.GetEquippedShout()
			If ShoutSpell == EquippedShout.GetNthSpell(0)
				DBAdvanceSkillExploration1()
			elseIf ShoutSpell == EquippedShout.GetNthSpell(1)
				DBAdvanceSkillExploration2()
			elseIf ShoutSpell == EquippedShout.GetNthSpell(2)
				DBAdvanceSkillExploration3()
			endIf
	endIf

EndEvent

Event OnTrackedStatsEvent(String asStatFilter, Int aiStatValue)

	If PlayerRef.HasPerk(DB_DragonBlood10) && asStatFilter == "Dragon Souls Collected"
		DBAdvanceSkillDragon()
	endIf

EndEvent

Function DBAdvanceSkillCombat1()

	If DB_Level.GetValueInt() < DB_LevelMax.GetValueInt()
			Float DBLevelCost = 2 * (DB_Level.GetValue() * DB_Level.GetValue())
			Float DBShoutsExp = 5 * 5 + (Game.QueryStat("Shouts Mastered"))
			Float DBExpPoints = (DBShoutsExp / DBLevelCost)
			DB_SkillProgress.SetValue(DB_SkillProgress.GetValue() + DBExpPoints)
	endIf

	If DB_SkillProgress.Value >= 1.0
		DB_Level.Mod(1.0)
		DB_LevelUp.SetValue(DB_Level.Value)
		Float DBCumulativeProgress = DB_SkillProgress.GetValue() - 1
		DB_SkillProgress.SetValue(DBCumulativeProgress)
			While (NextPerk < 100)
				If DB_Level.Value >= NextPerk && DB_PerkPointsTotal.Value < 12
				DB_PerkPoints.Value += 1
				DB_PerkPointsTotal.Value += 1
				NextPerk += 10
				DB_PerkMessage.Show()
				endIf
			endWhile
	endIf

EndFunction

Function DBAdvanceSkillCombat2()

	If DB_Level.GetValueInt() < DB_LevelMax.GetValueInt()
			Float DBLevelCost = 2 * (DB_Level.GetValue() * DB_Level.GetValue())
			Float DBShoutsExp = 7.5 * 5 + (Game.QueryStat("Shouts Mastered"))
			Float DBExpPoints = (DBShoutsExp / DBLevelCost)
			DB_SkillProgress.SetValue(DB_SkillProgress.GetValue() + DBExpPoints)
	endIf

	If DB_SkillProgress.Value >= 1.0
		DB_Level.Mod(1.0)
		DB_LevelUp.SetValue(DB_Level.Value)
		Float DBCumulativeProgress = DB_SkillProgress.GetValue() - 1
		DB_SkillProgress.SetValue(DBCumulativeProgress)
			While (NextPerk < 100)
				If DB_Level.Value >= NextPerk && DB_PerkPointsTotal.Value < 12
				DB_PerkPoints.Value += 1
				DB_PerkPointsTotal.Value += 1
				NextPerk += 10
				DB_PerkMessage.Show()
				endIf
			endWhile
	endIf

EndFunction

Function DBAdvanceSkillCombat3()

	If DB_Level.GetValueInt() < DB_LevelMax.GetValueInt()
			Float DBLevelCost = 2 * (DB_Level.GetValue() * DB_Level.GetValue())
			Float DBShoutsExp = 10 * 5 + (Game.QueryStat("Shouts Mastered"))
			Float DBExpPoints = (DBShoutsExp / DBLevelCost)
			DB_SkillProgress.SetValue(DB_SkillProgress.GetValue() + DBExpPoints)
	endIf

	If DB_SkillProgress.Value >= 1.0
		DB_Level.Mod(1.0)
		DB_LevelUp.SetValue(DB_Level.Value)
		Float DBCumulativeProgress = DB_SkillProgress.GetValue() - 1
		DB_SkillProgress.SetValue(DBCumulativeProgress)
			While (NextPerk < 100)
				If DB_Level.Value >= NextPerk && DB_PerkPointsTotal.Value < 12
				DB_PerkPoints.Value += 1
				DB_PerkPointsTotal.Value += 1
				NextPerk += 10
				DB_PerkMessage.Show()
				endIf
			endWhile
	endIf

EndFunction

Function DBAdvanceSkillExploration1()

	If DB_Level.GetValueInt() < DB_LevelMax.GetValueInt()
			Float DBLevelCost = 2 * (DB_Level.GetValue() * DB_Level.GetValue())
			Float DBShoutsExp = 1.5 * 5 + (Game.QueryStat("Shouts Mastered"))
			Float DBExpPoints = (DBShoutsExp / DBLevelCost)
			DB_SkillProgress.SetValue(DB_SkillProgress.GetValue() + DBExpPoints)
	endIf

	If DB_SkillProgress.Value >= 1.0
		DB_Level.Mod(1.0)
		DB_LevelUp.SetValue(DB_Level.Value)
		Float DBCumulativeProgress = DB_SkillProgress.GetValue() - 1
		DB_SkillProgress.SetValue(DBCumulativeProgress)
			While (NextPerk < 100)
				If DB_Level.Value >= NextPerk && DB_PerkPointsTotal.Value < 12
				DB_PerkPoints.Value += 1
				DB_PerkPointsTotal.Value += 1
				NextPerk += 10
				DB_PerkMessage.Show()
				endIf
			endWhile
	endIf

EndFunction

Function DBAdvanceSkillExploration2()

	If DB_Level.GetValueInt() < DB_LevelMax.GetValueInt()
			Float DBLevelCost = 2 * (DB_Level.GetValue() * DB_Level.GetValue())
			Float DBShoutsExp = 2 * 5 + (Game.QueryStat("Shouts Mastered"))
			Float DBExpPoints = (DBShoutsExp / DBLevelCost)
			DB_SkillProgress.SetValue(DB_SkillProgress.GetValue() + DBExpPoints)
	endIf

	If DB_SkillProgress.Value >= 1.0
		DB_Level.Mod(1.0)
		DB_LevelUp.SetValue(DB_Level.Value)
		Float DBCumulativeProgress = DB_SkillProgress.GetValue() - 1
		DB_SkillProgress.SetValue(DBCumulativeProgress)
			While (NextPerk < 100)
				If DB_Level.Value >= NextPerk && DB_PerkPointsTotal.Value < 12
				DB_PerkPoints.Value += 1
				DB_PerkPointsTotal.Value += 1
				NextPerk += 10
				DB_PerkMessage.Show()
				endIf
			endWhile
	endIf

EndFunction

Function DBAdvanceSkillExploration3()

	If DB_Level.GetValueInt() < DB_LevelMax.GetValueInt()
			Float DBLevelCost = 2 * (DB_Level.GetValue() * DB_Level.GetValue())
			Float DBShoutsExp = 2.5 * 5 + (Game.QueryStat("Shouts Mastered"))
			Float DBExpPoints = (DBShoutsExp / DBLevelCost)
			DB_SkillProgress.SetValue(DB_SkillProgress.GetValue() + DBExpPoints)
	endIf

	If DB_SkillProgress.Value >= 1.0
		DB_Level.Mod(1.0)
		DB_LevelUp.SetValue(DB_Level.Value)
		Float DBCumulativeProgress = DB_SkillProgress.GetValue() - 1
		DB_SkillProgress.SetValue(DBCumulativeProgress)
			While (NextPerk < 100)
				If DB_Level.Value >= NextPerk && DB_PerkPointsTotal.Value < 12
				DB_PerkPoints.Value += 1
				DB_PerkPointsTotal.Value += 1
				NextPerk += 10
				DB_PerkMessage.Show()
				endIf
			endWhile
	endIf

EndFunction

Function DBAdvanceSkillDragon()

	If DB_Level.GetValueInt() < DB_LevelMax.GetValueInt()
		Float DBLevelCost = 2 * (DB_Level.GetValue() * DB_Level.GetValue())
		Float DBShoutsExp = 15 * 5 + (Game.QueryStat("Shouts Mastered"))
		Float DBExpPoints = (DBShoutsExp / DBLevelCost)
		DB_SkillProgress.SetValue(DB_SkillProgress.GetValue() + DBExpPoints)
	endIf

	If DB_SkillProgress.Value >= 1.0
		DB_Level.Mod(1.0)
		DB_LevelUp.SetValue(DB_Level.Value)
		Float DBCumulativeProgress = DB_SkillProgress.GetValue() - 1
		DB_SkillProgress.SetValue(DBCumulativeProgress)
			While (NextPerk < 100)
				If DB_Level.Value >= NextPerk && DB_PerkPointsTotal.Value < 12
				DB_PerkPoints.Value += 1
				DB_PerkPointsTotal.Value += 1
				NextPerk += 10
				DB_PerkMessage.Show()
				endIf
			endWhile
	endIf

EndFunction 