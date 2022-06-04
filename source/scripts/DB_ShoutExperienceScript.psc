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

Keyword Property MagicShout Auto

ObjectReference CasterRef

Perk Property DB_DragonBlood10 Auto

Shout EquippedShout

Spell ShoutSpell

Event OnEffectStart(Actor akTarget, Actor akCaster)

	RegisterForTrackedStatsEvent()
	
endEvent

Event OnSpellCast(Form akSpell)

	If (akSpell.HasKeyword(MagicShout))
		EquippedShout = PlayerRef.GetEquippedShout()
		ShoutSpell = akSpell as Spell
		If PlayerRef.IsInCombat()
			DBAdvanceSkillCombat()
		else
			DBAdvanceSkillExploration()
		endIf
	endIf

EndEvent

Event OnTrackedStatsEvent(String asStatFilter, Int aiStatValue)

	If PlayerRef.HasPerk(DB_DragonBlood10) && asStatFilter == "Dragon Souls Collected"
		DBAdvanceSkillDragon()
	endIf

EndEvent

Function DBAdvanceSkillCombat()

	If DB_Level.GetValueInt() < DB_LevelMax.GetValueInt()
		Float DBLevelCost = 2 * (DB_Level.GetValue() * DB_Level.GetValue())
		If ShoutSpell == EquippedShout.GetNthSpell(0)
			Float DBShoutsExp = 50 * (1 + Game.QueryStat("Shouts Mastered") / 2)
			Float DBExpPoints = (DBShoutsExp / DBLevelCost)
			DB_SkillProgress.SetValue(DB_SkillProgress.GetValue() + DBExpPoints)
		elseIf ShoutSpell == EquippedShout.GetNthSpell(1)
			Float DBShoutsExp = 100 * (1 + Game.QueryStat("Shouts Mastered") / 2)
			Float DBExpPoints = (DBShoutsExp / DBLevelCost)
			DB_SkillProgress.SetValue(DB_SkillProgress.GetValue() + DBExpPoints)
		elseIf ShoutSpell == EquippedShout.GetNthSpell(3)
			Float DBShoutsExp = 150 * (1 + Game.QueryStat("Shouts Mastered") / 2)
			Float DBExpPoints = (DBShoutsExp / DBLevelCost)
			DB_SkillProgress.SetValue(DB_SkillProgress.GetValue() + DBExpPoints)
		endIf
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

Function DBAdvanceSkillExploration()

	If DB_Level.GetValueInt() < DB_LevelMax.GetValueInt()
		Float DBLevelCost = 2 * (DB_Level.GetValue() * DB_Level.GetValue())
		If ShoutSpell == EquippedShout.GetNthSpell(0)
			Float DBShoutsExp = 5 * (1 + Game.QueryStat("Shouts Mastered") / 2)
			Float DBExpPoints = (DBShoutsExp / DBLevelCost)
			DB_SkillProgress.SetValue(DB_SkillProgress.GetValue() + DBExpPoints)
		elseIf ShoutSpell == EquippedShout.GetNthSpell(1)
			Float DBShoutsExp = 10 * (1 + Game.QueryStat("Shouts Mastered") / 2)
			Float DBExpPoints = (DBShoutsExp / DBLevelCost)
			DB_SkillProgress.SetValue(DB_SkillProgress.GetValue() + DBExpPoints)
		elseIf ShoutSpell == EquippedShout.GetNthSpell(2)
			Float DBShoutsExp = 15 * (1 + Game.QueryStat("Shouts Mastered") / 2)
			Float DBExpPoints = (DBShoutsExp / DBLevelCost)
			DB_SkillProgress.SetValue(DB_SkillProgress.GetValue() + DBExpPoints)
		endIf
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
		Float DBShoutsExp = 15 * (1 + Game.QueryStat("Shouts Mastered") / 2)
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