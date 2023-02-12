/*
    Created by Quo
*/
 

-- LOGS
-- Debug
INSERT INTO tblQuoDebug 
	(DebugID, 		x_Open, x_Close, 	Message)
VALUES ('Quo_Civ_XP2_Code',	'1',	'0',		'') ;



-- Canada

INSERT INTO Requirements
	(RequirementId, 		RequirementType, 	Likeliness,	Inverse, 	Triggered)
VALUES	('QUO_REQ_CANADA_IMPROVEMENT', 	'REQUIREMENT_PLOT_HAS_ANY_IMPROVEMENT',	0,0,0) ;


INSERT INTO RequirementSets 
	(RequirementSetId, 		RequirementSetType)
VALUES 	('QUO_REQSET_CANADA_FARM_TUNDRA', 	'REQUIREMENTSET_TEST_ALL') ,
		('QUO_REQSET_CANADA_FARM_TUNDRA_HILLS', 	'REQUIREMENTSET_TEST_ALL') ;


INSERT INTO RequirementSetRequirements
	(RequirementSetId,	RequirementId)
VALUES	('QUO_REQSET_CANADA_FARM_TUNDRA', 	'QUO_REQ_CANADA_IMPROVEMENT'),
		('QUO_REQSET_CANADA_FARM_TUNDRA', 	'REQUIRES_PLOT_HAS_TUNDRA'),
		
		('QUO_REQSET_CANADA_FARM_TUNDRA_HILLS', 	'QUO_REQ_CANADA_IMPROVEMENT'),
		('QUO_REQSET_CANADA_FARM_TUNDRA_HILLS', 	'REQUIRES_PLOT_HAS_TUNDRA_HILLS');




INSERT INTO Modifiers
	(ModifierID, 			ModifierType, 					RunOnce, 	Permanent, 	OwnerRequirementSetId, 	SubjectRequirementSetId)
VALUES	('QUO_CANADA_FARM_TUNDRA', 	'MODIFIER_PLAYER_ADJUST_PLOT_YIELD', 	0, 		0, 		NULL,			'QUO_REQSET_CANADA_FARM_TUNDRA') ,
		('QUO_CANADA_FARM_TUNDRA_HILLS', 	'MODIFIER_PLAYER_ADJUST_PLOT_YIELD', 	0, 		0, 		NULL,			'QUO_REQSET_CANADA_FARM_TUNDRA_HILLS') ;


INSERT INTO ModifierArguments
	(ModifierID,			Name,		Type, 				Value,			Extra)
VALUES	('QUO_CANADA_FARM_TUNDRA', 	'Amount', 	'ARGTYPE_IDENTITY', 		'1',			NULL) ,
		('QUO_CANADA_FARM_TUNDRA', 	'YieldType', 	'ARGTYPE_IDENTITY', 		'YIELD_FOOD',			NULL) ,
		
		('QUO_CANADA_FARM_TUNDRA_HILLS', 	'Amount', 	'ARGTYPE_IDENTITY', 		'1',			NULL) ,
		('QUO_CANADA_FARM_TUNDRA_HILLS', 	'YieldType', 	'ARGTYPE_IDENTITY', 		'YIELD_FOOD',			NULL) ;


INSERT INTO TraitModifiers
	(TraitType, 				ModifierID)
VALUES	('TRAIT_LEADER_LAST_BEST_WEST',	'QUO_CANADA_FARM_TUNDRA') ,
		('TRAIT_LEADER_LAST_BEST_WEST',	'QUO_CANADA_FARM_TUNDRA_HILLS') ;



-- UPDATE BUG TRACKER
-- This code should go last in every file

UPDATE tblQuoDebug SET x_Close='1' WHERE DebugID='Quo_Civ_XP2_Code';
