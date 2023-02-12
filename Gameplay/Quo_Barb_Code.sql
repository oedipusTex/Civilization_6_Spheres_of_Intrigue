/*
    Created by Quo
*/
 

-- Debug
INSERT INTO tblQuoDebug 
	(DebugID, 		x_Open, x_Close, 	Message)
VALUES ('Quo_Barb_Code',	'1',	'0',		'') ;



-- BARBARIANS
-- Increase the minimum distance where Barbs can spawn, and lower total number in the world at any one time
-- Now adjusted by value set in MyOptions


--UPDATE GlobalParameters SET Value='6' WHERE Name='BARBARIAN_CAMP_MINIMUM_DISTANCE_CITY' ;

-- UPDATE GlobalParameters SET Value='2' WHERE Name='BARBARIAN_CAMP_MAX_PER_MAJOR_CIV' ;

-- Use the value from MyOptions
UPDATE GlobalParameters SET Value=(SELECT Value from tblQuoOptions WHERE OptionID='QUO_OPTION_MIN_DISTANCE_TO_BARB_CAMPS') WHERE Name='BARBARIAN_CAMP_MINIMUM_DISTANCE_CITY' ;

UPDATE GlobalParameters SET Value=(SELECT Value from tblQuoOptions WHERE OptionID='QUO_OPTION_MAX_BARB_CAMPS_PER_PLAYER') WHERE Name='BARBARIAN_CAMP_MAX_PER_MAJOR_CIV' ;



-- Increase the soft cap for fighting Barbarians

-- UPDATE GlobalParameters SET Value='2' WHERE Name='EXPERIENCE_BARB_SOFT_CAP' ; 
-- Use the value from MyOptions
UPDATE GlobalParameters SET Value=(SELECT Value from tblQuoOptions WHERE OptionID='QUO_OPTION_BARB_XP_SOFTCAP') WHERE Name='EXPERIENCE_BARB_SOFT_CAP' ;



-- Lower the chances of a rebellion for cities low on happy

-- UPDATE GlobalParameters SET Value='0.2' WHERE Name='REBELLION_CHANCE_PER_POINT' ;


UPDATE GlobalParameters SET Value=(SELECT Value from tblQuoOptions WHERE OptionID='QUO_OPTION_REBELLION_CHANCE_PER_POINT') WHERE Name='REBELLION_CHANCE_PER_POINT' ;


-- Reduce movement of Barbarian Scouts
INSERT INTO Modifiers 
	(ModifierId, 	ModifierType, 	RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
VALUES	('QUO_SCOUTS_BARBARIAN_SLOW', 	'MODIFIER_PLAYER_UNIT_ADJUST_MOVEMENT', 0, 0, NULL, NULL) ,
	('QUO_SCOUTS_BARBARIAN_SLOW_2', 	'MODIFIER_PLAYER_UNITS_ATTACH_MODIFIER', 0, 0, NULL, 'SURVEY_RECONUNITEXPERIENCE_REQUIREMENTS') ;



INSERT INTO ModifierArguments
	(ModifierId, 			Name, 		Type, 			Value, 					Extra, 	SecondExtra)
VALUES	('QUO_SCOUTS_BARBARIAN_SLOW', 	'Amount', 	'ARGTYPE_IDENTITY', 	'-2',					NULL, 	NULL) ,	
	('QUO_SCOUTS_BARBARIAN_SLOW_2', 	'ModifierId', 	'ARGTYPE_IDENTITY', 	'QUO_SCOUTS_BARBARIAN_SLOW',		NULL, 	NULL)  ;


	-- Only apply the modifier if the player has this enabled in the MyOptions file
INSERT INTO TraitModifiers
	(TraitType, 		ModifierId)
SELECT 'TRAIT_LEADER_BARBARIAN',	'QUO_SCOUTS_BARBARIAN_SLOW_2' 
FROM tblQuoOptions 
WHERE OptionID='QUO_OPTION_SLOW_BARBARIAN_SCOUTS' AND Value='1' ;




-- Reduce combat strength of Barbarian Spearmen to compensate for changes

INSERT INTO Requirements
	(RequirementId, 		RequirementType, 	Likeliness,	Inverse, 	Triggered)
VALUES	('QUO_REQ_BARB_ANTI_CALV', 	'REQUIREMENT_UNIT_PROMOTION_CLASS_MATCHES',	0,0,0) ;


INSERT INTO RequirementArguments 
		(RequirementId,			Name, 			Type, 			Value, 		Extra, 	SecondExtra)
VALUES 	('QUO_REQ_BARB_ANTI_CALV',	'UnitPromotionClass',		'ARGTYPE_IDENTITY',		'PROMOTION_CLASS_ANTI_CAVALRY',	NULL,	NULL 	) ;


INSERT INTO RequirementSets 
	(RequirementSetId, 		RequirementSetType)
VALUES 	('QUO_REQSET_BARB_ANTI_CALV', 	'REQUIREMENTSET_TEST_ANY') ;

 INSERT INTO RequirementSetRequirements
	(RequirementSetId,	RequirementId)
VALUES	('QUO_REQSET_BARB_ANTI_CALV', 	'QUO_REQ_BARB_ANTI_CALV') ; 


INSERT INTO Modifiers 
	(ModifierId, 	ModifierType, 	RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
VALUES	('QUO_SPEARMAN_BARBARIAN_WEAK', 	'MODIFIER_UNIT_ADJUST_COMBAT_STRENGTH', 0, 0, NULL, NULL) ,
	('QUO_SPEARMAN_BARBARIAN_WEAK_PLAYER', 	'MODIFIER_PLAYER_UNITS_ATTACH_MODIFIER', 0, 0, NULL, 'QUO_REQSET_BARB_ANTI_CALV') ;


INSERT INTO ModifierArguments
	(ModifierId, 			Name, 		Type, 			Value, 					Extra, 	SecondExtra)
VALUES	('QUO_SPEARMAN_BARBARIAN_WEAK', 	'Amount', 	'ARGTYPE_IDENTITY', 	'-4',					NULL, 	NULL) ,	
	('QUO_SPEARMAN_BARBARIAN_WEAK_PLAYER', 	'ModifierId', 	'ARGTYPE_IDENTITY', 	'QUO_SPEARMAN_BARBARIAN_WEAK',		NULL, 	NULL)  ;
	



	-- Only apply the modifier if the player has ranged anti cav enabled in the MyOptions file
INSERT INTO TraitModifiers
	(TraitType, 		ModifierId)
SELECT 'TRAIT_LEADER_BARBARIAN',	'QUO_SPEARMAN_BARBARIAN_WEAK_PLAYER' 
FROM tblQuoOptions 
WHERE OptionID='QUO_OPTION_ARE_ANTI_CAV_RANGED' AND Value='1' ;



INSERT INTO ModifierStrings
	(ModifierId, 		Context, Text)
VALUES	('QUO_SPEARMAN_BARBARIAN_WEAK', 'Preview', 'LOC_QUO_ABI_PIKEMAN_BARBARIAN_WEAK_PREVIEW') ;


-- UPDATE BUG TRACKER
-- This code should go last in every file

UPDATE tblQuoDebug SET x_Close='1' WHERE DebugID='Quo_Barb_Code';
