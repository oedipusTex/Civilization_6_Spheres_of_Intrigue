/*
    Created by Quo
*/


-- LOGS
-- Debug
INSERT INTO tblQuoDebug 
	(DebugID, 		x_Open, x_Close, 	Message)
VALUES ('Quo_Wonder_Code',	'1',	'0',		'') ;


 
-- CULTURE BOMBING WONDERS


-- Boom!

-- Add a modifier, modifierargument, and link to trait modifier for every wonder in the game
-- Each created ModifierId will have a type equal to a concat of its buildingtype with a pre-string, eg QUO_WONDER_CULTURE_BOMB_BUILDING_HANGING_GARDENS
INSERT INTO Modifiers
(ModifierID, 			ModifierType, 					RunOnce, 	Permanent, 	OwnerRequirementSetId, 	SubjectRequirementSetId)
SELECT	'QUO_WONDER_CULTURE_BOMB_' || BuildingType, 	            'MODIFIER_PLAYER_ADD_CULTURE_BOMB_TRIGGER', 	0, 		0, 		NULL,			NULL
FROM Buildings WHERE Buildings.IsWonder=1 ;


INSERT INTO ModifierArguments
(ModifierID,			Name,		Type, 			Value,	Extra, SecondExtra)
SELECT	'QUO_WONDER_CULTURE_BOMB_' || BuildingType, 	            'BuildingType', 	'ARGTYPE_IDENTITY', 	BuildingType,	NULL, NULL
FROM Buildings WHERE Buildings.IsWonder=1 ;

-- Only apply the modifiers if the culture bomb ability is enabled in MyOptions
INSERT INTO TraitModifiers
(TraitType,		ModifierID)
SELECT	'TRAIT_LEADER_MAJOR_CIV', 'QUO_WONDER_CULTURE_BOMB_' || BuildingType
FROM Buildings WHERE Buildings.IsWonder=1 AND (SELECT tblquoOptions.Value FROM tblQuoOptions WHERE tblQuoOptions.OptionID='QUO_OPTION_CAN_WONDERS_CULTURE_BOMB') >0 ;



-- Add a Diplomacy Token after every wonder built
INSERT INTO Modifiers
(ModifierID, 			ModifierType, 					RunOnce, 	Permanent, 	OwnerRequirementSetId, 	SubjectRequirementSetId)
SELECT	'QUO_WONDER_FREE_TOKEN_' || BuildingType, 	            'MODIFIER_PLAYER_GRANT_INFLUENCE_TOKEN', 	0, 		0, 		NULL,			NULL
FROM Buildings WHERE Buildings.IsWonder=1 ;

-- Use the value from MyOptions
INSERT INTO ModifierArguments
(ModifierID,			Name,		Type, 			Value,	Extra, SecondExtra)
SELECT	'QUO_WONDER_FREE_TOKEN_' || BuildingType, 	            'Amount', 	'ARGTYPE_IDENTITY', 	
		(SELECT tblquoOptions.Value FROM tblQuoOptions WHERE tblQuoOptions.OptionID='QUO_OPTION_NUM_FREE_TOKENS_WONDER_BUILT'),	NULL, NULL
FROM Buildings WHERE Buildings.IsWonder=1 ;

-- only attach the modifier to the buildings if num of tokens it will award is greater than 0
INSERT INTO BuildingModifiers
(BuildingType,		ModifierID)
SELECT	BuildingType, 'QUO_WONDER_FREE_TOKEN_' || BuildingType 
FROM Buildings WHERE Buildings.IsWonder=1 AND (SELECT tblquoOptions.Value FROM tblQuoOptions WHERE tblQuoOptions.OptionID='QUO_OPTION_NUM_FREE_TOKENS_WONDER_BUILT') >0 ;




-- REMOVED DISTRICT ADJACENCY REQUIREMENTS

-- Remove all requirements for district adjacency
-- In v3.11.06 this was made a MyOption
-- in v7.0.11 made this no longer applies to Harbors because that can break boats
UPDATE Buildings SET AdjacentDistrict=NULL WHERE Buildings.IsWonder = 1 AND AdjacentDistrict not IN ('DISTRICT_HARBOR') AND (SELECT tblquoOptions.Value FROM tblQuoOptions WHERE tblQuoOptions.OptionID='QUO_OPTION_CAN_FREE_PLACE_WONDERS') >0 ; 



-- SPECIFIC WONDERS






-- HANGING GARDENS
-- Give additional Food to jungle tiles
-- Removed in v7.0.12

/* INSERT INTO Modifiers 
	(ModifierId, ModifierType, RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
VALUES	('QUO_HANGING_GARDENS_FOOD', 'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD', 0, 0, NULL, 'PLOT_HAS_JUNGLE_REQUIREMENTS') ;


INSERT INTO ModifierArguments
	(ModifierId, 			Name, 		Type, 			Value, 			Extra, 	SecondExtra)
VALUES	('QUO_HANGING_GARDENS_FOOD', 	'Amount', 	'ARGTYPE_IDENTITY', 	'1',			NULL, 	NULL),
	('QUO_HANGING_GARDENS_FOOD', 	'YieldType', 	'ARGTYPE_IDENTITY', 	'YIELD_FOOD',			NULL, 	NULL) ;



INSERT INTO BuildingModifiers
	(BuildingType, 			ModifierID)
VALUES	('BUILDING_HANGING_GARDENS',	'QUO_HANGING_GARDENS_FOOD') ;
 */


-- STONEHENGE
-- Move it to Masonry to delay how fast AI can grab it.
--UPDATE Buildings SET PrereqTech=NULL, PrereqCivic='CIVIC_STATE_WORKFORCE' WHERE BuildingType='BUILDING_STONEHENGE' ;



-- UPDATE BUG TRACKER
-- This code should go last in every file

UPDATE tblQuoDebug SET x_Close='1' WHERE DebugID='Quo_Wonder_Code';
