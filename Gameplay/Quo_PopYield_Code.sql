/*
    Created by Quo
*/


-- LOGS
-- Debug
INSERT INTO tblQuoDebug 
	(DebugID, 		x_Open, x_Close, 	Message)
VALUES ('Quo_PopYield_Code',	'1',	'0',		'') ;


/* The code below is a dirty attempt to soft-crash out of the file if hardcore rules are not enabled.*/
-- As of v5.0.5, the soft crash table is no longer used, in order to prevent an error from showing in the game logs.
/* CREATE TABLE tblQuoSoftCrash
(
	Quo_ExitFile	TEXT PRIMARY KEY
) ;

INSERT INTO tblQuoSoftCrash
VALUES ('1');

INSERT INTO tblQuoSoftCrash
SELECT '1'
FROM tblQuoOptions WHERE tblQuoOptions.OptionID='QUO_OPTION_ENABLE_HARDCORE_SCIENCE_RULES' AND tblQuoOptions.Value='0' ; */




-- SCIENCE AND CULTURE FROM POPULATION
-- No longer get free science and culture just for existing


-- Drop the free science and culture from population to 0 if hardcore is turned on 
UPDATE GlobalParameters SET Value = Value * (SELECT 
	CASE WHEN tblQuoOptions.Value <= 0 THEN 1
	ELSE  0
	END as QuoVal
	from tblQuoOptions WHERE OptionID='QUO_OPTION_ENABLE_HARDCORE_SCIENCE_RULES') 
	WHERE Name='SCIENCE_PERCENTAGE_YIELD_PER_POP' ;

	
UPDATE GlobalParameters SET Value = Value * (SELECT 
	CASE WHEN tblQuoOptions.Value <= 0 THEN 1
	ELSE  0
	END as QuoVal
	from tblQuoOptions WHERE OptionID='QUO_OPTION_ENABLE_HARDCORE_SCIENCE_RULES') 
	WHERE Name='CULTURE_PERCENTAGE_YIELD_PER_POP' ;



-- GENERATOR BUILDINGS

-- Increase the output of various Science generating buildings to make up for loss from population and not just make this a find mountains or die situation.
-- No longer included. 
-- UPDATE Building_YieldChanges SET YieldChange=YieldChange+1 WHERE YieldType='YIELD_SCIENCE';


-- Reduce the output of the Monument to 1 Culture
-- Removed for balance reasons. 
-- UPDATE Building_YieldChanges SET YieldChange=1 WHERE BuildingType='BUILDING_MONUMENT' ;


-- AI BONUSES

-- Increase AI Bonus Science and Culture to account for it losing sci and cult from population

-- UPDATE ModifierArguments SET Extra = 10 WHERE ModifierId='HIGH_DIFFICULTY_SCIENCE_SCALING' AND Name='Amount';
-- UPDATE ModifierArguments SET Extra = 10 WHERE ModifierId='HIGH_DIFFICULTY_CULTURE_SCALING' AND Name='Amount';


INSERT INTO Requirements
	(RequirementId, 		RequirementType, 	Likeliness,	Inverse, 	Triggered)
VALUES	('QUO_REQ_HARDCORE_AI_TECH_UNLOCK_TIER_2', 		'REQUIREMENT_PLAYER_ERA_AT_LEAST',	0,0,0) ,
		('QUO_REQ_HARDCORE_AI_TECH_UNLOCK_TIER_3', 		'REQUIREMENT_PLAYER_ERA_AT_LEAST',	0,0,0) ;


INSERT INTO RequirementArguments 
	(RequirementId,			Name, 			Type, 			Value, 				Extra, 	SecondExtra)
VALUES 	('QUO_REQ_HARDCORE_AI_TECH_UNLOCK_TIER_2',	'EraType',		'ARGTYPE_IDENTITY',	'ERA_RENAISSANCE',	NULL,	NULL 	) ,
		('QUO_REQ_HARDCORE_AI_TECH_UNLOCK_TIER_3',	'EraType',		'ARGTYPE_IDENTITY',	'ERA_MODERN',	NULL,	NULL 	) ;		


INSERT INTO RequirementSets 
	(RequirementSetId, 		RequirementSetType)
VALUES 	('QUO_REQSET_HARDCORE_AI_TECH_UNLOCK_TIER_2', 	'REQUIREMENTSET_TEST_ALL') ,
		('QUO_REQSET_HARDCORE_AI_TECH_UNLOCK_TIER_3', 	'REQUIREMENTSET_TEST_ALL') ;


INSERT INTO RequirementSetRequirements
	(RequirementSetId,	RequirementId)
VALUES	('QUO_REQSET_HARDCORE_AI_TECH_UNLOCK_TIER_2', 	'QUO_REQ_HARDCORE_AI_TECH_UNLOCK_TIER_2'), 
		('QUO_REQSET_HARDCORE_AI_TECH_UNLOCK_TIER_3', 	'QUO_REQ_HARDCORE_AI_TECH_UNLOCK_TIER_3')  ,
		('QUO_REQSET_HARDCORE_AI_TECH_UNLOCK_TIER_2', 	'REQUIRES_PLAYER_IS_AI'),
		('QUO_REQSET_HARDCORE_AI_TECH_UNLOCK_TIER_3', 	'REQUIRES_PLAYER_IS_AI') ;
		


INSERT INTO Modifiers 
	(ModifierId, ModifierType, RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
VALUES	('QUO_AI_HARDCORE_BONUS_TECH_PER_DISTRICT', 'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_PER_DISTRICT', 0, 0, NULL, 'PLAYER_IS_AI') ,
		('QUO_AI_HARDCORE_BONUS_CULTURE_PER_DISTRICT', 'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_PER_DISTRICT', 0, 0, NULL, 'PLAYER_IS_AI') ,
		('QUO_AI_HARDCORE_BONUS_TECH_PER_DISTRICT_2', 'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_PER_DISTRICT', 0, 0, NULL, 'QUO_REQSET_HARDCORE_AI_TECH_UNLOCK_TIER_2') ,
		('QUO_AI_HARDCORE_BONUS_CULTURE_PER_DISTRICT_2', 'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_PER_DISTRICT', 0, 0, NULL, 'QUO_REQSET_HARDCORE_AI_TECH_UNLOCK_TIER_2') ,
		('QUO_AI_HARDCORE_BONUS_TECH_PER_DISTRICT_3', 'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_PER_DISTRICT', 0, 0, NULL, 'QUO_REQSET_HARDCORE_AI_TECH_UNLOCK_TIER_3') ,
		('QUO_AI_HARDCORE_BONUS_CULTURE_PER_DISTRICT_3', 'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_PER_DISTRICT', 0, 0, NULL, 'QUO_REQSET_HARDCORE_AI_TECH_UNLOCK_TIER_3') ;

INSERT INTO ModifierArguments
	(ModifierId, 			Name, 		Type, 			Value, 			Extra, 	SecondExtra)
VALUES	('QUO_AI_HARDCORE_BONUS_TECH_PER_DISTRICT', 	'Amount', 	'ARGTYPE_IDENTITY', 	'1',			NULL, 	NULL) , 
		('QUO_AI_HARDCORE_BONUS_TECH_PER_DISTRICT', 	'YieldType',	 'ARGTYPE_IDENTITY', 	'YIELD_SCIENCE',			NULL, 	NULL) ,
		('QUO_AI_HARDCORE_BONUS_CULTURE_PER_DISTRICT', 	'Amount',	 'ARGTYPE_IDENTITY', 	'1',			NULL, 	NULL) ,
		('QUO_AI_HARDCORE_BONUS_CULTURE_PER_DISTRICT', 	'YieldType',	 'ARGTYPE_IDENTITY', 	'YIELD_CULTURE',			NULL, 	NULL) ,
		('QUO_AI_HARDCORE_BONUS_TECH_PER_DISTRICT_2', 	'Amount', 	'ARGTYPE_IDENTITY', 	'1',			NULL, 	NULL) , 
		('QUO_AI_HARDCORE_BONUS_TECH_PER_DISTRICT_2', 	'YieldType',	 'ARGTYPE_IDENTITY', 	'YIELD_SCIENCE',			NULL, 	NULL) ,
		('QUO_AI_HARDCORE_BONUS_CULTURE_PER_DISTRICT_2', 	'Amount',	 'ARGTYPE_IDENTITY', 	'1',			NULL, 	NULL) ,
		('QUO_AI_HARDCORE_BONUS_CULTURE_PER_DISTRICT_2', 	'YieldType',	 'ARGTYPE_IDENTITY', 	'YIELD_CULTURE',			NULL, 	NULL) ,
		('QUO_AI_HARDCORE_BONUS_TECH_PER_DISTRICT_3', 	'Amount', 	'ARGTYPE_IDENTITY', 	'2',			NULL, 	NULL) , 
		('QUO_AI_HARDCORE_BONUS_TECH_PER_DISTRICT_3', 	'YieldType',	 'ARGTYPE_IDENTITY', 	'YIELD_SCIENCE',			NULL, 	NULL) ,
		('QUO_AI_HARDCORE_BONUS_CULTURE_PER_DISTRICT_3', 	'Amount',	 'ARGTYPE_IDENTITY', 	'1',			NULL, 	NULL) ,
		('QUO_AI_HARDCORE_BONUS_CULTURE_PER_DISTRICT_3', 	'YieldType',	 'ARGTYPE_IDENTITY', 	'YIELD_CULTURE',			NULL, 	NULL) ;


INSERT INTO TraitModifiers
	(TraitType, 			ModifierID)
SELECT 'TRAIT_LEADER_MAJOR_CIV',	'QUO_AI_HARDCORE_BONUS_TECH_PER_DISTRICT'
FROM tblQuoOptions WHERE tblQuoOptions.OptionID='QUO_OPTION_ENABLE_HARDCORE_SCIENCE_RULES' AND tblQuoOptions.Value > 0 ; 

INSERT INTO TraitModifiers
	(TraitType, 			ModifierID)
SELECT 'TRAIT_LEADER_MAJOR_CIV',	'QUO_AI_HARDCORE_BONUS_CULTURE_PER_DISTRICT'
FROM tblQuoOptions WHERE tblQuoOptions.OptionID='QUO_OPTION_ENABLE_HARDCORE_SCIENCE_RULES' AND tblQuoOptions.Value > 0 ; 

INSERT INTO TraitModifiers
	(TraitType, 			ModifierID)
SELECT 'TRAIT_LEADER_MAJOR_CIV',	'QUO_AI_HARDCORE_BONUS_TECH_PER_DISTRICT_2'
FROM tblQuoOptions WHERE tblQuoOptions.OptionID='QUO_OPTION_ENABLE_HARDCORE_SCIENCE_RULES' AND tblQuoOptions.Value > 0 ; 

INSERT INTO TraitModifiers
	(TraitType, 			ModifierID)
SELECT 'TRAIT_LEADER_MAJOR_CIV',	'QUO_AI_HARDCORE_BONUS_CULTURE_PER_DISTRICT_2'
FROM tblQuoOptions WHERE tblQuoOptions.OptionID='QUO_OPTION_ENABLE_HARDCORE_SCIENCE_RULES' AND tblQuoOptions.Value > 0 ; 

INSERT INTO TraitModifiers
	(TraitType, 			ModifierID)
SELECT 'TRAIT_LEADER_MAJOR_CIV',	'QUO_AI_HARDCORE_BONUS_TECH_PER_DISTRICT_3'
FROM tblQuoOptions WHERE tblQuoOptions.OptionID='QUO_OPTION_ENABLE_HARDCORE_SCIENCE_RULES' AND tblQuoOptions.Value > 0 ; 

INSERT INTO TraitModifiers
	(TraitType, 			ModifierID)
SELECT 'TRAIT_LEADER_MAJOR_CIV',	'QUO_AI_HARDCORE_BONUS_CULTURE_PER_DISTRICT_3'
FROM tblQuoOptions WHERE tblQuoOptions.OptionID='QUO_OPTION_ENABLE_HARDCORE_SCIENCE_RULES' AND tblQuoOptions.Value > 0 ; 







-- UPDATE BUG TRACKER
-- This code should go last in every file

UPDATE tblQuoDebug SET x_Close='1' WHERE DebugID='Quo_PopYield_Code';