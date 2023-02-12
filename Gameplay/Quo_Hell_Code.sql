/*
    Created by Quo
*/


-- LOGS
-- Debug
INSERT INTO tblQuoDebug 
	(DebugID, 		x_Open, x_Close, 	Message)
VALUES ('Quo_Hell_Code',	'1',	'0',		'') ;




---- TIER 1

-- Give AIs a free Ranged unit when they found or conquer a city
INSERT INTO Modifiers 
	(ModifierId, 	ModifierType, 	RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
VALUES	('QUO_MOD_HELLMODE_FREE_RANGED_UNIT', 	'MODIFIER_PLAYER_CITIES_GRANT_UNIT_BY_CLASS', 0, 0, NULL, 'PLAYER_IS_AI') ;


INSERT INTO ModifierArguments
	(ModifierId, 			Name, 		Type, 			Value, 					Extra, 	SecondExtra)
VALUES	('QUO_MOD_HELLMODE_FREE_RANGED_UNIT', 	'UnitPromotionClassType', 	'ARGTYPE_IDENTITY', 	'PROMOTION_CLASS_RANGED',		NULL, 	NULL) ;


INSERT INTO TraitModifiers
	(TraitType, 				ModifierID)
SELECT 'TRAIT_LEADER_MAJOR_CIV',	'QUO_MOD_HELLMODE_FREE_RANGED_UNIT'
FROM tblQuoOptions WHERE tblQuoOptions.OptionID='QUO_OPTION_HELL_MODE_TIER' AND tblQuoOptions.Value > 0 ; 



-- Give AIs a free airplane when they discover appropriate tech
/* INSERT INTO Requirements
	(RequirementId, 		RequirementType, 	Likeliness,	Inverse, 	Triggered)
VALUES	('QUO_REQ_HELLMODE_HAS_FLIGHT', 		'REQUIREMENT_PLAYER_HAS_TECHNOLOGY',	0,0,0) ;


INSERT INTO RequirementArguments 
	(RequirementId,			Name, 			Type, 			Value, 				Extra, 	SecondExtra)
VALUES 	('QUO_REQ_HELLMODE_HAS_FLIGHT',	'TechnologyType',		'ARGTYPE_IDENTITY',	'TECH_FLIGHT',	NULL,	NULL 	)  ;		


INSERT INTO RequirementSets 
	(RequirementSetId, 		RequirementSetType)
VALUES 	('QUO_REQSET_HELLMODE_UNLOCK_FREE_AIR', 	'REQUIREMENTSET_TEST_ALL') ;


INSERT INTO RequirementSetRequirements
	(RequirementSetId,	RequirementId)
VALUES	('QUO_REQSET_HELLMODE_UNLOCK_FREE_AIR', 	'QUO_REQ_HELLMODE_HAS_FLIGHT') ,
		('QUO_REQSET_HELLMODE_UNLOCK_FREE_AIR', 	'REQUIRES_PLAYER_IS_AI') ;
		
		
INSERT INTO Modifiers 
	(ModifierId, 	ModifierType, 	RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
VALUES	('QUO_MOD_HELLMODE_FREE_AIR_UNIT', 	'MODIFIER_PLAYER_CITIES_GRANT_UNIT_BY_CLASS', 0, 0, NULL, 'QUO_REQSET_HELLMODE_UNLOCK_FREE_AIR') ;


INSERT INTO ModifierArguments
	(ModifierId, 			Name, 		Type, 			Value, 					Extra, 	SecondExtra)
VALUES	('QUO_MOD_HELLMODE_FREE_AIR_UNIT', 	'UnitPromotionClassType', 	'ARGTYPE_IDENTITY', 	'PROMOTION_CLASS_AIR_FIGHTER',		NULL, 	NULL) ;


INSERT INTO TraitModifiers
	(TraitType, 				ModifierID)
SELECT 'TRAIT_LEADER_MAJOR_CIV',	'QUO_MOD_HELLMODE_FREE_AIR_UNIT'
FROM tblQuoOptions WHERE tblQuoOptions.OptionID='QUO_OPTION_HELL_MODE_TIER' AND tblQuoOptions.Value > 0 ; 
 */

 
-- No healing from promotions 
UPDATE GlobalParameters SET Value=0 WHERE Name='EXPERIENCE_PROMOTE_HEALED' AND EXISTS (SELECT 1 from tblQuoOptions WHERE tblQuoOptions.OptionID='QUO_OPTION_HELL_MODE_TIER' AND tblQuoOptions.Value > 0) ;




-- AIs can see through trees and forests
INSERT INTO Modifiers 
	(ModifierId, 			ModifierType, 				RunOnce, 	Permanent, 	OwnerRequirementSetId, 	SubjectRequirementSetId)
VALUES	('QUO_HELLMODE_VISION', 	'MODIFIER_PLAYER_UNITS_GRANT_ABILITY', 	0, 		1, 		NULL, 			'PLAYER_IS_AI') ;


INSERT INTO ModifierArguments
	(ModifierId, 			Name, 		Type, 			Value, 		Extra, 	SecondExtra)
VALUES	('QUO_HELLMODE_VISION', 	'AbilityType', 	'ARGTYPE_IDENTITY', 	'ABILITY_UNOBSTRUCTED_VIEW',	NULL, 	NULL) ;


INSERT INTO TraitModifiers
	(TraitType, 				ModifierID)
SELECT 'TRAIT_LEADER_MAJOR_CIV',	'QUO_HELLMODE_VISION'
FROM tblQuoOptions WHERE tblQuoOptions.OptionID='QUO_OPTION_HELL_MODE_TIER' AND tblQuoOptions.Value > 0 ; 




---- TIER 2



-- Ai gets free science and culture
-- These bonuses are similar to the bonuses from the Hardcore science files
INSERT INTO Requirements
	(RequirementId, 		RequirementType, 	Likeliness,	Inverse, 	Triggered)
VALUES	('QUO_REQ_HELLMODE_AI_TECH_UNLOCK_TIER_2', 		'REQUIREMENT_GAME_ERA_ATLEAST_EXPANSION',	0,0,0) ,
		('QUO_REQ_HELLMODE_AI_TECH_UNLOCK_TIER_3', 		'REQUIREMENT_GAME_ERA_ATLEAST_EXPANSION',	0,0,0) ;


INSERT INTO RequirementArguments 
	(RequirementId,			Name, 			Type, 			Value, 				Extra, 	SecondExtra)
VALUES 	('QUO_REQ_HELLMODE_AI_TECH_UNLOCK_TIER_2',	'EraType',		'ARGTYPE_IDENTITY',	'ERA_RENAISSANCE',	NULL,	NULL 	) ,
		('QUO_REQ_HELLMODE_AI_TECH_UNLOCK_TIER_3',	'EraType',		'ARGTYPE_IDENTITY',	'ERA_ATOMIC',	NULL,	NULL 	) ;		


INSERT INTO RequirementSets 
	(RequirementSetId, 		RequirementSetType)
VALUES 	('QUO_REQSET_HELLMODE_AI_TECH_UNLOCK_TIER_2', 	'REQUIREMENTSET_TEST_ALL') ,
		('QUO_REQSET_HELLMODE_AI_TECH_UNLOCK_TIER_3', 	'REQUIREMENTSET_TEST_ALL') ;


INSERT INTO RequirementSetRequirements
	(RequirementSetId,	RequirementId)
VALUES	('QUO_REQSET_HELLMODE_AI_TECH_UNLOCK_TIER_2', 	'QUO_REQ_HELLMODE_AI_TECH_UNLOCK_TIER_2'), 
		('QUO_REQSET_HELLMODE_AI_TECH_UNLOCK_TIER_3', 	'QUO_REQ_HELLMODE_AI_TECH_UNLOCK_TIER_3')  ,
		('QUO_REQSET_HELLMODE_AI_TECH_UNLOCK_TIER_2', 	'REQUIRES_PLAYER_IS_AI'),
		('QUO_REQSET_HELLMODE_AI_TECH_UNLOCK_TIER_3', 	'REQUIRES_PLAYER_IS_AI') ;
		


INSERT INTO Modifiers 
	(ModifierId, ModifierType, RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
VALUES	('QUO_AI_HELLMODE_BONUS_TECH_PER_DISTRICT', 'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_PER_DISTRICT', 0, 0, NULL, 'PLAYER_IS_AI') ,
		('QUO_AI_HELLMODE_BONUS_CULTURE_PER_DISTRICT', 'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_PER_DISTRICT', 0, 0, NULL, 'PLAYER_IS_AI') ,
		('QUO_AI_HELLMODE_BONUS_TECH_PER_DISTRICT_2', 'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_PER_DISTRICT', 0, 0, NULL, 'QUO_REQSET_HELLMODE_AI_TECH_UNLOCK_TIER_2') ,
		('QUO_AI_HELLMODE_BONUS_CULTURE_PER_DISTRICT_2', 'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_PER_DISTRICT', 0, 0, NULL, 'QUO_REQSET_HELLMODE_AI_TECH_UNLOCK_TIER_2') ,
		('QUO_AI_HELLMODE_BONUS_TECH_PER_DISTRICT_3', 'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_PER_DISTRICT', 0, 0, NULL, 'QUO_REQSET_HELLMODE_AI_TECH_UNLOCK_TIER_3') ,
		('QUO_AI_HELLMODE_BONUS_CULTURE_PER_DISTRICT_3', 'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_PER_DISTRICT', 0, 0, NULL, 'QUO_REQSET_HELLMODE_AI_TECH_UNLOCK_TIER_3') ;

INSERT INTO ModifierArguments
	(ModifierId, 			Name, 		Type, 			Value, 			Extra, 	SecondExtra)
VALUES	('QUO_AI_HELLMODE_BONUS_TECH_PER_DISTRICT', 	'Amount', 	'ARGTYPE_IDENTITY', 	'1',			NULL, 	NULL) , 
		('QUO_AI_HELLMODE_BONUS_TECH_PER_DISTRICT', 	'YieldType',	 'ARGTYPE_IDENTITY', 	'YIELD_SCIENCE',			NULL, 	NULL) ,
		('QUO_AI_HELLMODE_BONUS_CULTURE_PER_DISTRICT', 	'Amount',	 'ARGTYPE_IDENTITY', 	'1',			NULL, 	NULL) ,
		('QUO_AI_HELLMODE_BONUS_CULTURE_PER_DISTRICT', 	'YieldType',	 'ARGTYPE_IDENTITY', 	'YIELD_CULTURE',			NULL, 	NULL) ,
		('QUO_AI_HELLMODE_BONUS_TECH_PER_DISTRICT_2', 	'Amount', 	'ARGTYPE_IDENTITY', 	'1',			NULL, 	NULL) , 
		('QUO_AI_HELLMODE_BONUS_TECH_PER_DISTRICT_2', 	'YieldType',	 'ARGTYPE_IDENTITY', 	'YIELD_SCIENCE',			NULL, 	NULL) ,
		('QUO_AI_HELLMODE_BONUS_CULTURE_PER_DISTRICT_2', 	'Amount',	 'ARGTYPE_IDENTITY', 	'1',			NULL, 	NULL) ,
		('QUO_AI_HELLMODE_BONUS_CULTURE_PER_DISTRICT_2', 	'YieldType',	 'ARGTYPE_IDENTITY', 	'YIELD_CULTURE',			NULL, 	NULL) ,
		('QUO_AI_HELLMODE_BONUS_TECH_PER_DISTRICT_3', 	'Amount', 	'ARGTYPE_IDENTITY', 	'1',			NULL, 	NULL) , 
		('QUO_AI_HELLMODE_BONUS_TECH_PER_DISTRICT_3', 	'YieldType',	 'ARGTYPE_IDENTITY', 	'YIELD_SCIENCE',			NULL, 	NULL) ,
		('QUO_AI_HELLMODE_BONUS_CULTURE_PER_DISTRICT_3', 	'Amount',	 'ARGTYPE_IDENTITY', 	'1',			NULL, 	NULL) ,
		('QUO_AI_HELLMODE_BONUS_CULTURE_PER_DISTRICT_3', 	'YieldType',	 'ARGTYPE_IDENTITY', 	'YIELD_CULTURE',			NULL, 	NULL) ;


INSERT INTO TraitModifiers
	(TraitType, 			ModifierID)
SELECT 'TRAIT_LEADER_MAJOR_CIV',	'QUO_AI_HELLMODE_BONUS_TECH_PER_DISTRICT'
FROM tblQuoOptions WHERE tblQuoOptions.OptionID='QUO_OPTION_HELL_MODE_TIER' AND tblQuoOptions.Value >= 2 ; 

INSERT INTO TraitModifiers
	(TraitType, 			ModifierID)
SELECT 'TRAIT_LEADER_MAJOR_CIV',	'QUO_AI_HELLMODE_BONUS_CULTURE_PER_DISTRICT'
FROM tblQuoOptions WHERE tblQuoOptions.OptionID='QUO_OPTION_HELL_MODE_TIER' AND tblQuoOptions.Value >= 2 ; 

INSERT INTO TraitModifiers
	(TraitType, 			ModifierID)
SELECT 'TRAIT_LEADER_MAJOR_CIV',	'QUO_AI_HELLMODE_BONUS_TECH_PER_DISTRICT_2'
FROM tblQuoOptions WHERE tblQuoOptions.OptionID='QUO_OPTION_HELL_MODE_TIER' AND tblQuoOptions.Value >= 2 ; 

INSERT INTO TraitModifiers
	(TraitType, 			ModifierID)
SELECT 'TRAIT_LEADER_MAJOR_CIV',	'QUO_AI_HELLMODE_BONUS_CULTURE_PER_DISTRICT_2'
FROM tblQuoOptions WHERE tblQuoOptions.OptionID='QUO_OPTION_HELL_MODE_TIER' AND tblQuoOptions.Value >= 2 ; 

INSERT INTO TraitModifiers
	(TraitType, 			ModifierID)
SELECT 'TRAIT_LEADER_MAJOR_CIV',	'QUO_AI_HELLMODE_BONUS_TECH_PER_DISTRICT_3'
FROM tblQuoOptions WHERE tblQuoOptions.OptionID='QUO_OPTION_HELL_MODE_TIER' AND tblQuoOptions.Value >= 2 ; 

INSERT INTO TraitModifiers
	(TraitType, 			ModifierID)
SELECT 'TRAIT_LEADER_MAJOR_CIV',	'QUO_AI_HELLMODE_BONUS_CULTURE_PER_DISTRICT_3'
FROM tblQuoOptions WHERE tblQuoOptions.OptionID='QUO_OPTION_HELL_MODE_TIER' AND tblQuoOptions.Value >= 2 ; 


----- TIER 3

-- AIs reduce Loyalty when they kill units
INSERT INTO Modifiers 
	(ModifierId, 	ModifierType, 	RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
VALUES	('QUO_MOD_HELLMODE_LOYALTY_ON_KILL', 	'MODIFIER_PLAYER_ADJUST_POST_COMBAT_LOYALTY', 0, 0, NULL, 'PLAYER_IS_AI') ;


INSERT INTO ModifierArguments
	(ModifierId, 			Name, 		Type, 			Value, 					Extra, 	SecondExtra)
VALUES	('QUO_MOD_HELLMODE_LOYALTY_ON_KILL', 	'AffectLocal', 	'ARGTYPE_IDENTITY', 	'0',		NULL, 	NULL) ,
		('QUO_MOD_HELLMODE_LOYALTY_ON_KILL', 	'Amount', 	'ARGTYPE_IDENTITY', 	'-20',		NULL, 	NULL) ;


INSERT INTO TraitModifiers
	(TraitType, 				ModifierID)
SELECT 'TRAIT_LEADER_MAJOR_CIV',	'QUO_MOD_HELLMODE_LOYALTY_ON_KILL'
FROM tblQuoOptions WHERE tblQuoOptions.OptionID='QUO_OPTION_HELL_MODE_TIER' AND tblQuoOptions.Value >= 3 ; 



-- Units heal even if they moved
INSERT INTO Modifiers 
	(ModifierId, 			ModifierType, 				RunOnce, 	Permanent, 	OwnerRequirementSetId, 	SubjectRequirementSetId)
VALUES	('QUO_HELLMODE_UNITS_ALWAYS_HEAL', 	'MODIFIER_PLAYER_UNITS_GRANT_ABILITY', 	0, 		1, 		NULL, 			'PLAYER_IS_AI') ;


INSERT INTO ModifierArguments
	(ModifierId, 			Name, 		Type, 			Value, 		Extra, 	SecondExtra)
VALUES	('QUO_HELLMODE_UNITS_ALWAYS_HEAL', 	'AbilityType', 	'ARGTYPE_IDENTITY', 	'ABILITY_MAMLUK',	NULL, 	NULL) ;


INSERT INTO TraitModifiers
	(TraitType, 				ModifierID)
SELECT 'TRAIT_LEADER_MAJOR_CIV',	'QUO_HELLMODE_UNITS_ALWAYS_HEAL'
FROM tblQuoOptions WHERE tblQuoOptions.OptionID='QUO_OPTION_HELL_MODE_TIER' AND tblQuoOptions.Value >= 3 ; 





-- UPDATE BUG TRACKER
-- This code should go last in every file

UPDATE tblQuoDebug SET x_Close='1' WHERE DebugID='Quo_Hell_Code';