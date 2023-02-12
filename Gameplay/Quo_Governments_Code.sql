/*
    Created by Quo
*/
 

-- Debug
INSERT INTO tblQuoDebug 
	(DebugID, 		x_Open, x_Close, 	Message)
VALUES ('Quo_Governments_Code',	'1',	'0',		'') ;


-- Chiefdom 
-- Remove the economic policy slot and add a wildcard slot
UPDATE Government_SlotCounts SET NumSlots=0 WHERE GovernmentType='GOVERNMENT_CHIEFDOM' AND GovernmentSlotType='SLOT_ECONOMIC' ;

INSERT OR IGNORE INTO Government_SlotCounts 
		(GovernmentType, GovernmentSlotType, NumSlots)
VALUES 		('GOVERNMENT_CHIEFDOM', 'SLOT_WILDCARD', 1) ;


-- Split the early governments into different branches of the tree
UPDATE Governments
   SET PrereqCivic = 'CIVIC_DRAMA_POETRY'
 WHERE GovernmentType = 'GOVERNMENT_AUTOCRACY';

UPDATE Governments
   SET PrereqCivic = 'CIVIC_GAMES_RECREATION'
 WHERE GovernmentType = 'GOVERNMENT_OLIGARCHY';
 


-- Move the mid tier governments to a location on the tree where they no longer require each other
-- Removed in favor of changes to the civics tree itself
/* UPDATE Governments
   SET PrereqCivic = 'CIVIC_MEDIEVAL_FAIRES'
 WHERE GovernmentType = 'GOVERNMENT_MERCHANT_REPUBLIC';

UPDATE Governments
   SET PrereqCivic = 'CIVIC_DIVINE_RIGHT'
 WHERE GovernmentType = 'GOVERNMENT_THEOCRACY';
 */ 
/* UPDATE Governments
   SET PrereqCivic = 'CIVIC_GUILDS'
 WHERE GovernmentType = 'GOVERNMENT_MONARCHY'; */
				   
 

 -- AUTOCRACY
 -- Bonus yields for adjacency to a wonder
 
/* 
INSERT INTO Modifiers 
		(ModifierId, ModifierType, RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
VALUES	('QUO_GOVERNMENT_AUTOCRACY_WONDERS', 'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD', 0, 0, NULL, 'PLOT_ADJACENT_TO_WONDER_REQUIREMENTS') ,
		('QUO_GOVERNMENT_AUTOCRACY_WONDERS_PLAYER', 	'MODIFIER_PLAYER_CITIES_ATTACH_MODIFIER', 0, 0, NULL, NULL) ;
 
INSERT INTO ModifierArguments
		(ModifierId, 			Name, 		Type, 			Value, 			Extra, 	SecondExtra)
VALUES	('QUO_GOVERNMENT_AUTOCRACY_WONDERS', 	'Amount', 	'ARGTYPE_IDENTITY', 	'1',			NULL, 	NULL),
		('QUO_GOVERNMENT_AUTOCRACY_WONDERS', 	'YieldType', 	'ARGTYPE_IDENTITY', 	'YIELD_FAITH',			NULL, 	NULL) ,
		('QUO_GOVERNMENT_AUTOCRACY_WONDERS_PLAYER', 	'ModifierId', 	'ARGTYPE_IDENTITY', 	'QUO_GOVERNMENT_AUTOCRACY_WONDERS',		NULL, 	NULL)  ;


INSERT INTO GovernmentModifiers
		(GovernmentType, 			ModifierID)
VALUES	('GOVERNMENT_AUTOCRACY',	'QUO_GOVERNMENT_AUTOCRACY_WONDERS_PLAYER')  ;
 
 
 
 -- OLIGARCHY
 
 -- Oligarchy no longer provides a free battering ram on completing an Encampment
/*  INSERT INTO Modifiers 
	(ModifierId, ModifierType, RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
VALUES	('QUO_GOVERNMENT_OLIGARCHY_FREE_UNIT', 'MODIFIER_PLAYER_DISTRICT_CREATE_UNIT', 0, 0, NULL, NULL) ;


INSERT INTO ModifierArguments
	(ModifierId, 			Name, 		Type, 			Value, 					Extra, 	SecondExtra)
VALUES	('QUO_GOVERNMENT_OLIGARCHY_FREE_UNIT', 	'DistrictType', 'ARGTYPE_IDENTITY', 	'DISTRICT_ENCAMPMENT',	NULL, 	NULL) ,  
		('QUO_GOVERNMENT_OLIGARCHY_FREE_UNIT', 	'UnitType', 	'ARGTYPE_IDENTITY', 	'UNIT_BATTERING_RAM',		NULL, 	NULL) ;

INSERT INTO GovernmentModifiers
		(GovernmentType, 			ModifierID)
VALUES	('GOVERNMENT_OLIGARCHY',	'QUO_GOVERNMENT_OLIGARCHY_FREE_UNIT') ;
  */

/*
-- +1 Movement to Melee Units in Neutral Territory. Achieved by checking to be sure unit is in neither enemy or owner territory
 
INSERT INTO Requirements
	(RequirementId, 		RequirementType, 	Likeliness,	Inverse, 	Triggered)
VALUES	('QUO_REQ_OLIGARCHY_TROOP_MOVEMENT_NOT_OWN', 	'REQUIREMENT_UNIT_IN_ENEMY_TERRITORY',	0,1,0) ,
		('QUO_REQ_OLIGARCHY_TROOP_MOVEMENT_NOT_ENEMY', 	'REQUIREMENT_UNIT_IN_OWNER_TERRITORY',	0,1,0) ;


-- no requirement arguments needed


INSERT INTO RequirementSets 
	(RequirementSetId, 		RequirementSetType)
VALUES 	('QUO_REQSET_OLIGARCHY_TROOP_MOVEMENT', 	'REQUIREMENTSET_TEST_ALL') ;


-- reuses Firaxis pre-defined REQUIREMENT_UNIT_IS_MELEE
INSERT INTO RequirementSetRequirements
	(RequirementSetId,	RequirementId)
VALUES	('QUO_REQSET_OLIGARCHY_TROOP_MOVEMENT', 	'QUO_REQ_OLIGARCHY_TROOP_MOVEMENT_NOT_OWN') , 
		('QUO_REQSET_OLIGARCHY_TROOP_MOVEMENT', 	'QUO_REQ_OLIGARCHY_TROOP_MOVEMENT_NOT_ENEMY') ,
		('QUO_REQSET_OLIGARCHY_TROOP_MOVEMENT', 	'REQUIRES_LAND_UNIT') ;
		
		
INSERT INTO Modifiers 
	(ModifierId, 	ModifierType, 	RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
VALUES	('QUO_GOVERNMENT_OLIGARCHY_TROOP_MOVEMENT', 	'MODIFIER_PLAYER_UNIT_ADJUST_MOVEMENT', 0, 0, NULL, 'QUO_REQSET_OLIGARCHY_TROOP_MOVEMENT') ,
		('QUO_GOVERNMENT_OLIGARCHY_TROOP_MOVEMENT_PLAYER', 	'MODIFIER_PLAYER_UNITS_ATTACH_MODIFIER', 0, 0, NULL, NULL) ;


INSERT INTO ModifierArguments
	(ModifierId, 			Name, 		Type, 			Value, 					Extra, 	SecondExtra)
VALUES	('QUO_GOVERNMENT_OLIGARCHY_TROOP_MOVEMENT', 	'Amount', 	'ARGTYPE_IDENTITY', 	'1',					NULL, 	NULL) ,	
		('QUO_GOVERNMENT_OLIGARCHY_TROOP_MOVEMENT_PLAYER', 	'ModifierId', 	'ARGTYPE_IDENTITY', 	'QUO_GOVERNMENT_OLIGARCHY_TROOP_MOVEMENT',		NULL, 	NULL)  ;


INSERT INTO GovernmentModifiers
		(GovernmentType, 		ModifierId)
VALUES 	('GOVERNMENT_OLIGARCHY',	'QUO_GOVERNMENT_OLIGARCHY_TROOP_MOVEMENT_PLAYER');
  
 */
 
 
-- CLASSIC_REPUBLIC
-- Add +2 Movement to Settlers and Stealth


/*
INSERT INTO Requirements
	(RequirementId, 		RequirementType, 	Likeliness,	Inverse, 	Triggered)
VALUES	('QUO_REQ_CLASSIC_REPUBLIC_SETTLER', 	'REQUIREMENT_UNIT_TYPE_MATCHES',	0,0,0) ;


INSERT INTO RequirementArguments 
		(RequirementId,			Name, 			Type, 			Value, 		Extra, 	SecondExtra)
VALUES 	('QUO_REQ_CLASSIC_REPUBLIC_SETTLER',	'UnitType',		'ARGTYPE_IDENTITY',		'UNIT_SETTLER',	NULL,	NULL 	) ;


INSERT INTO RequirementSets 
	(RequirementSetId, 		RequirementSetType)
VALUES 	('QUO_REQSET_CLASSIC_REPUBLIC_SETTLER', 	'REQUIREMENTSET_TEST_ANY') ;

 INSERT INTO RequirementSetRequirements
	(RequirementSetId,	RequirementId)
VALUES	('QUO_REQSET_CLASSIC_REPUBLIC_SETTLER', 	'QUO_REQ_CLASSIC_REPUBLIC_SETTLER') ; 

 
INSERT INTO Modifiers 
	(ModifierId, 	ModifierType, 	RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
VALUES	('QUO_GOVERNMENT_CLASSIC_REPUBLIC_SETTLER_MOVES', 	'MODIFIER_PLAYER_UNIT_ADJUST_MOVEMENT', 0, 0, NULL, NULL) ,
		('QUO_GOVERNMENT_CLASSIC_REPUBLIC_SETTLER_STEALTH', 	'MODIFIER_PLAYER_UNIT_ADJUST_HIDDEN_VISIBILITY', 0, 0, NULL, NULL) ,
		('QUO_GOVERNMENT_CLASSIC_REPUBLIC_SETTLER_MOVES_PLAYER', 	'MODIFIER_PLAYER_UNITS_ATTACH_MODIFIER', 0, 0, NULL, 'QUO_REQSET_CLASSIC_REPUBLIC_SETTLER') ,
		('QUO_GOVERNMENT_CLASSIC_REPUBLIC_SETTLER_STEALTH_PLAYER', 	'MODIFIER_PLAYER_UNITS_ATTACH_MODIFIER', 0, 0, NULL, 'QUO_REQSET_CLASSIC_REPUBLIC_SETTLER') ;



INSERT INTO ModifierArguments
	(ModifierId, 			Name, 		Type, 			Value, 					Extra, 	SecondExtra)
VALUES	('QUO_GOVERNMENT_CLASSIC_REPUBLIC_SETTLER_MOVES', 	'Amount', 	'ARGTYPE_IDENTITY', 	'3',					NULL, 	NULL) ,	
		('QUO_GOVERNMENT_CLASSIC_REPUBLIC_SETTLER_STEALTH', 		'Hidden', 		'ARGTYPE_IDENTITY', 	'1',	NULL, 	NULL) ,
		('QUO_GOVERNMENT_CLASSIC_REPUBLIC_SETTLER_MOVES_PLAYER', 	'ModifierId', 	'ARGTYPE_IDENTITY', 	'QUO_GOVERNMENT_CLASSIC_REPUBLIC_SETTLER_MOVES',		NULL, 	NULL)  ,
		('QUO_GOVERNMENT_CLASSIC_REPUBLIC_SETTLER_STEALTH_PLAYER', 	'ModifierId', 	'ARGTYPE_IDENTITY', 	'QUO_GOVERNMENT_CLASSIC_REPUBLIC_SETTLER_STEALTH',		NULL, 	NULL)  ;

INSERT INTO GovernmentModifiers
		(GovernmentType, 		ModifierId)
VALUES 	('GOVERNMENT_CLASSICAL_REPUBLIC',	'QUO_GOVERNMENT_CLASSIC_REPUBLIC_SETTLER_MOVES_PLAYER'),
		('GOVERNMENT_CLASSICAL_REPUBLIC',	'QUO_GOVERNMENT_CLASSIC_REPUBLIC_SETTLER_STEALTH_PLAYER');
 */
 
 -- debug
-- UPDATE tblQuoDebug SET Message='Classical Republic' WHERE DebugID='Quo_Governments_Code'; 

 
 -- THEOCRACY
 -- Half cost Holy Districts
 -- Changed in v3.14.9
 
/* INSERT INTO GovernmentModifiers
		(GovernmentType, 			ModifierID)
VALUES	('GOVERNMENT_THEOCRACY',	'TRAIT_BOOST_HOLY_SITE_PRODUCTION') ;
 */ 
 
 
-- In v5.0.2 removed the district requirement in favor of requiring Temples, which require more investment
/* INSERT INTO Requirements
	(RequirementId, 		RequirementType, 				Likeliness,	Inverse, 	Triggered)
VALUES	('QUO_REQ_THEOCRACY_HAS_HOLY_SITE', 	'REQUIREMENT_CITY_HAS_DISTRICT',	0,0,0) ;

INSERT INTO RequirementArguments 
	(RequirementId,			Name, 			Type, 			Value, 				Extra, 	SecondExtra)
VALUES 	('QUO_REQ_THEOCRACY_HAS_HOLY_SITE',	'DistrictType',		'ARGTYPE_IDENTITY',	'DISTRICT_HOLY_SITE',	NULL,	NULL 	) ; */

/*

INSERT INTO RequirementSets 
	(RequirementSetId, 				RequirementSetType)
VALUES 	('QUO_REQSET_THEOCRACY_HAS_HOLY_SITE', 	'REQUIREMENTSET_TEST_ALL') ;

-- As of v5.0.2, we re-use the existing Firaxis requirement REQUIRES_CITY_HAS_TEMPLE
INSERT INTO RequirementSetRequirements
	(RequirementSetId,	RequirementId)
VALUES	('QUO_REQSET_THEOCRACY_HAS_HOLY_SITE', 	'REQUIRES_CITY_HAS_TEMPLE') ;


INSERT INTO Modifiers 
	(ModifierId, ModifierType, RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
VALUES	('QUO_THEOCRACY_BONUS_PRODUCTION', 'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_CHANGE', 0, 0, NULL, 'QUO_REQSET_THEOCRACY_HAS_HOLY_SITE') ,
('QUO_THEOCRACY_BONUS_FAITH', 'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_CHANGE', 0, 0, NULL, 'QUO_REQSET_THEOCRACY_HAS_HOLY_SITE') ,
('QUO_THEOCRACY_BONUS_CULTURE', 'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_CHANGE', 0, 0, NULL, 'QUO_REQSET_THEOCRACY_HAS_HOLY_SITE') ;


INSERT INTO ModifierArguments
	(ModifierId, 			Name, 		Type, 			Value, 			Extra, 	SecondExtra)
VALUES	('QUO_THEOCRACY_BONUS_PRODUCTION', 	'Amount', 	'ARGTYPE_IDENTITY', 	'1',			NULL, 	NULL) , 
	('QUO_THEOCRACY_BONUS_PRODUCTION', 	'YieldType',	 'ARGTYPE_IDENTITY', 	'YIELD_PRODUCTION',	NULL, 	NULL) ,
	('QUO_THEOCRACY_BONUS_FAITH', 	'Amount', 	'ARGTYPE_IDENTITY', 	'2',			NULL, 	NULL) , 
	('QUO_THEOCRACY_BONUS_FAITH', 	'YieldType',	 'ARGTYPE_IDENTITY', 	'YIELD_FAITH',	NULL, 	NULL) ,
	('QUO_THEOCRACY_BONUS_CULTURE', 	'Amount', 	'ARGTYPE_IDENTITY', 	'2',			NULL, 	NULL) , 
	('QUO_THEOCRACY_BONUS_CULTURE', 	'YieldType',	 'ARGTYPE_IDENTITY', 	'YIELD_CULTURE',	NULL, 	NULL) ;
	

INSERT INTO GovernmentModifiers
		(GovernmentType, 			ModifierID)
VALUES	('GOVERNMENT_THEOCRACY',	'QUO_THEOCRACY_BONUS_PRODUCTION') ,
		('GOVERNMENT_THEOCRACY',	'QUO_THEOCRACY_BONUS_FAITH') ,
		('GOVERNMENT_THEOCRACY',	'QUO_THEOCRACY_BONUS_CULTURE') ;


 -- debug
UPDATE tblQuoDebug SET Message='Theocracy' WHERE DebugID='Quo_Governments_Code'; 

 
 
 -- Update strings for Rise and Fall
 UPDATE Governments SET InherentBonusDesc = 'LOC_QUO_GOV_OLIGARCHY_DESC' WHERE GovernmentType='GOVERNMENT_OLIGARCHY' ;
 UPDATE Governments SET InherentBonusDesc = 'LOC_QUO_GOV_AUTOCRACY_DESC' WHERE GovernmentType='GOVERNMENT_AUTOCRACY' ;
 UPDATE Governments SET InherentBonusDesc = 'LOC_QUO_GOV_CLASSICAL_DESC' WHERE GovernmentType='GOVERNMENT_CLASSICAL_REPUBLIC' ;

 UPDATE Governments SET InherentBonusDesc = 'LOC_QUO_GOV_THEOCRACY_DESC' WHERE GovernmentType='GOVERNMENT_THEOCRACY' ;
 UPDATE Governments SET InherentBonusDesc = 'LOC_QUO_GOV_MONARCHY_DESC' WHERE GovernmentType='GOVERNMENT_MONARCHY' ;
 UPDATE Governments SET InherentBonusDesc = 'LOC_QUO_GOV_MERCHANT_DESC' WHERE GovernmentType='GOVERNMENT_MERCHANT_REPUBLIC' ;


 UPDATE Governments SET InherentBonusDesc = 'LOC_QUO_GOV_FASCISM_DESC' WHERE GovernmentType='GOVERNMENT_FASCISM' ;
 UPDATE Governments SET InherentBonusDesc = 'LOC_QUO_GOV_DEMOCRACY_DESC' WHERE GovernmentType='GOVERNMENT_DEMOCRACY' ;
 UPDATE Governments SET InherentBonusDesc = 'LOC_QUO_GOV_COMMUNISM_DESC' WHERE GovernmentType='GOVERNMENT_COMMUNISM' ;
 


 
-- MERCHANT REPUBLIC
UPDATE ModifierArguments SET Value='1' WHERE Name='Amount' AND ModifierID='MERCHANT_REPUBLIC_TRADE_ROUTES' ;


-- Give a bonus to Oases and Hotspots 

-- As of 5.0.2 now provides +3 culture from Oases as well 
	
INSERT INTO RequirementSets 
		(RequirementSetId, 		RequirementSetType)
VALUES 	('QUO_REQSET_GOV_MERC_OASIS', 	'REQUIREMENTSET_TEST_ANY') ;

INSERT INTO RequirementSetRequirements
		(RequirementSetId,	RequirementId)
VALUES	('QUO_REQSET_GOV_MERC_OASIS', 	'REQUIRES_PLOT_HAS_OASIS') ;  


-- In v5.0.7 added Natural Wonders to the list of buffed sites	
-- In v6.0.4 removed Culture yield for balance reasons
INSERT INTO Requirements
	(RequirementId, 		RequirementType, 	Likeliness,	Inverse, 	Triggered)
SELECT 'QUO_REQ_PLOT_HAS_NW_' || FeatureType, 	'REQUIREMENT_PLOT_ADJACENT_FEATURE_TYPE_MATCHES',	0,0,0 
	FROM Features WHERE Features.NaturalWonder=1 OR Features.FeatureType='FEATURE_OASIS';
	
INSERT INTO RequirementArguments 
		(RequirementId,			Name, 			Type, 			Value, 		Extra, 	SecondExtra)
SELECT 	'QUO_REQ_PLOT_HAS_NW_' || FeatureType,	'FeatureType',	'ARGTYPE_IDENTITY',		FeatureType,	NULL,	NULL 	 
	FROM Features WHERE Features.NaturalWonder=1 OR Features.FeatureType='FEATURE_OASIS';

INSERT INTO RequirementSetRequirements
		(RequirementSetId,	RequirementId)
SELECT	'QUO_REQSET_GOV_MERC_OASIS', 	'QUO_REQ_PLOT_HAS_NW_' || FeatureType
	FROM Features WHERE Features.NaturalWonder=1 OR Features.FeatureType='FEATURE_OASIS';



	
	


INSERT INTO Modifiers 
		(ModifierId, ModifierType, RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
VALUES	('QUO_GOVERNMENT_MERCHANT_REPUBLIC_OASIS_FOOD', 'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD', 0, 0, NULL, 'QUO_REQSET_GOV_MERC_OASIS') ,
		('QUO_GOVERNMENT_MERCHANT_REPUBLIC_OASIS_GOLD', 'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD', 0, 0, NULL, 'QUO_REQSET_GOV_MERC_OASIS') ,
		('QUO_GOVERNMENT_MERCHANT_REPUBLIC_OASIS_FOOD_PLAYER', 	'MODIFIER_PLAYER_CITIES_ATTACH_MODIFIER', 0, 0, NULL, NULL) ,
		('QUO_GOVERNMENT_MERCHANT_REPUBLIC_OASIS_GOLD_PLAYER', 	'MODIFIER_PLAYER_CITIES_ATTACH_MODIFIER', 0, 0, NULL, NULL) ;


INSERT INTO ModifierArguments
		(ModifierId, 			Name, 		Type, 			Value, 			Extra, 	SecondExtra)
VALUES	('QUO_GOVERNMENT_MERCHANT_REPUBLIC_OASIS_FOOD', 	'Amount', 	'ARGTYPE_IDENTITY', 	'1',			NULL, 	NULL),
		('QUO_GOVERNMENT_MERCHANT_REPUBLIC_OASIS_FOOD', 	'YieldType', 	'ARGTYPE_IDENTITY', 	'YIELD_CULTURE',			NULL, 	NULL) ,
		('QUO_GOVERNMENT_MERCHANT_REPUBLIC_OASIS_GOLD', 	'Amount', 	'ARGTYPE_IDENTITY', 	'2',			NULL, 	NULL),
		('QUO_GOVERNMENT_MERCHANT_REPUBLIC_OASIS_GOLD', 	'YieldType', 	'ARGTYPE_IDENTITY', 	'YIELD_GOLD',			NULL, 	NULL) ,
		('QUO_GOVERNMENT_MERCHANT_REPUBLIC_OASIS_FOOD_PLAYER', 	'ModifierId', 	'ARGTYPE_IDENTITY', 	'QUO_GOVERNMENT_MERCHANT_REPUBLIC_OASIS_FOOD',		NULL, 	NULL)  ,
		('QUO_GOVERNMENT_MERCHANT_REPUBLIC_OASIS_GOLD_PLAYER', 	'ModifierId', 	'ARGTYPE_IDENTITY', 	'QUO_GOVERNMENT_MERCHANT_REPUBLIC_OASIS_GOLD',		NULL, 	NULL)  ;


INSERT INTO GovernmentModifiers
		(GovernmentType, 			ModifierID)
VALUES	--('GOVERNMENT_MERCHANT_REPUBLIC',	'QUO_GOVERNMENT_MERCHANT_REPUBLIC_OASIS_FOOD_PLAYER') ,
		('GOVERNMENT_MERCHANT_REPUBLIC', 	'QUO_GOVERNMENT_MERCHANT_REPUBLIC_OASIS_GOLD_PLAYER') ;

		
*/
		
		

/*
 -- debug
UPDATE tblQuoDebug SET Message='Merchant Republic' WHERE DebugID='Quo_Governments_Code'; 
		
		
-- MONARCHY

-- Remove Walls requirement for Housing bonus
UPDATE Modifiers SET SubjectRequirementSetId=NULL WHERE ModifierId='MONARCHY_CASTLE_HOUSING' ;

-- Tiles adjacent to an Encampment receive a bonus
-- Changed in v3.11.3 to City Centers instead of Encampments and Entertainment Districts

-- encampments
INSERT INTO Requirements
	(RequirementId, 		RequirementType, 	Likeliness,	Inverse, 	Triggered)
VALUES	('QUO_REQ_MONARCHY_ADJACENT_ENCAMPMENT', 	'REQUIREMENT_PLOT_ADJACENT_DISTRICT_TYPE_MATCHES',	0,0,0) ;

INSERT INTO RequirementArguments 
		(RequirementId,			Name, 			Type, 			Value, 		Extra, 	SecondExtra)
VALUES 	('QUO_REQ_MONARCHY_ADJACENT_ENCAMPMENT',	'DistrictType',		'ARGTYPE_IDENTITY',		'DISTRICT_ENCAMPMENT',	NULL,	NULL 	)  ,
		('QUO_REQ_MONARCHY_ADJACENT_ENCAMPMENT',	'MaxRange',		'ARGTYPE_IDENTITY',		'2',	NULL,	NULL 	) ,
		('QUO_REQ_MONARCHY_ADJACENT_ENCAMPMENT',	'MinRange',		'ARGTYPE_IDENTITY',		'0',	NULL,	NULL 	) ;

INSERT INTO RequirementSets 
		(RequirementSetId, 		RequirementSetType)
VALUES 	('QUO_REQSET_MONARCHY_ADJACENT_ENCAMPMENT', 	'REQUIREMENTSET_TEST_ALL') ;

 INSERT INTO RequirementSetRequirements
	(RequirementSetId,	RequirementId)
VALUES	('QUO_REQSET_MONARCHY_ADJACENT_ENCAMPMENT', 	'QUO_REQ_MONARCHY_ADJACENT_ENCAMPMENT') ,
		('QUO_REQSET_MONARCHY_ADJACENT_ENCAMPMENT', 	'REQUIRES_PLOT_HAS_FARM') ;		
		
		
				
INSERT INTO Modifiers 
		(ModifierId, ModifierType, RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
VALUES	('QUO_GOVERNMENT_MONARCHY_ADJACENCY', 'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD', 0, 0, NULL, 'QUO_REQSET_MONARCHY_ADJACENT_ENCAMPMENT') ,
		('QUO_GOVERNMENT_MONARCHY_ADJACENCY_PLAYER', 	'MODIFIER_PLAYER_CITIES_ATTACH_MODIFIER', 0, 0, NULL, NULL) ;
 
INSERT INTO ModifierArguments
		(ModifierId, 			Name, 		Type, 			Value, 			Extra, 	SecondExtra)
VALUES	('QUO_GOVERNMENT_MONARCHY_ADJACENCY', 	'Amount', 	'ARGTYPE_IDENTITY', 	'1',			NULL, 	NULL),
		('QUO_GOVERNMENT_MONARCHY_ADJACENCY', 	'YieldType', 	'ARGTYPE_IDENTITY', 	'YIELD_CULTURE',			NULL, 	NULL) ,
		('QUO_GOVERNMENT_MONARCHY_ADJACENCY_PLAYER', 	'ModifierId', 	'ARGTYPE_IDENTITY', 	'QUO_GOVERNMENT_MONARCHY_ADJACENCY',		NULL, 	NULL)   ;

INSERT INTO GovernmentModifiers
		(GovernmentType, 			ModifierID)
VALUES	('GOVERNMENT_MONARCHY',	'QUO_GOVERNMENT_MONARCHY_ADJACENCY_PLAYER')  ; 
 
 
 -- debug
UPDATE tblQuoDebug SET Message='Monarchy' WHERE DebugID='Quo_Governments_Code'; 
		 
 
 
 -- DEMOCRACY
 
 -- All districts culture bomb
INSERT INTO Modifiers
		(ModifierID, 			ModifierType, 					RunOnce, 	Permanent, 	OwnerRequirementSetId, 	SubjectRequirementSetId)
SELECT	'QUO_GOVERNMENT_DEMOCRACY_BOMB_' || Districts.DistrictType , 	'MODIFIER_PLAYER_ADD_CULTURE_BOMB_TRIGGER', 	0, 		0, 		NULL,			NULL
FROM 	Districts WHERE Districts.DistrictType != 'DISTRICT_CITY_CENTER' AND Districts.DistrictType != 'DISTRICT_WONDER' ;


INSERT INTO ModifierArguments
	(ModifierID,			Name,			Type, 			Value,			Extra)
SELECT	'QUO_GOVERNMENT_DEMOCRACY_BOMB_' || Districts.DistrictType, 	'DistrictType', 	'ARGTYPE_IDENTITY', 	Districts.DistrictType,	NULL 
FROM 	Districts WHERE Districts.DistrictType != 'DISTRICT_CITY_CENTER' AND Districts.DistrictType != 'DISTRICT_WONDER';


INSERT INTO GovernmentModifiers
		(GovernmentType, 				ModifierID)
SELECT 	'GOVERNMENT_DEMOCRACY',		'QUO_GOVERNMENT_DEMOCRACY_BOMB_' || Districts.DistrictType
FROM 	Districts WHERE Districts.DistrictType != 'DISTRICT_CITY_CENTER' AND Districts.DistrictType != 'DISTRICT_WONDER';
 
 
 
-- COMMUNISM
-- Grant cities urban defense

INSERT INTO Modifiers 
	(ModifierId, ModifierType, RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
VALUES	('QUO_COMMUNISM_URBAN_DEFENSES', 'MODIFIER_PLAYER_GRANT_CITIES_URBAN_DEFENSES', 0, 0, NULL, NULL) ;


INSERT INTO ModifierArguments
	(ModifierId, 				Name, 			Type, 			Value, 		Extra, 	SecondExtra)
VALUES	('QUO_COMMUNISM_URBAN_DEFENSES', 		'DefenseValue', 	'ARGTYPE_IDENTITY', 	'40',		NULL, 	NULL) ;


INSERT INTO GovernmentModifiers
	(GovernmentType, 			ModifierID)
VALUES	('GOVERNMENT_COMMUNISM',		'QUO_COMMUNISM_URBAN_DEFENSES') ;
 
 
 
 -- FASCISM
 
 -- increase the value of the combat bonus
UPDATE ModifierArguments SET Value='7' WHERE ModifierID='FASCISM_ATTACK_BUFF' AND Name='Amount';
 
 -- Add Range to Ranged and anti cav units
INSERT INTO Requirements
	(RequirementId, 		RequirementType, 	Likeliness,	Inverse, 	Triggered)
VALUES	('QUO_REQ_FASCISM_RANGED', 	'REQUIREMENT_UNIT_PROMOTION_CLASS_MATCHES',	0,0,0) ,
		('QUO_REQ_FASCISM_ANTI_CAV', 	'REQUIREMENT_UNIT_PROMOTION_CLASS_MATCHES',	0,0,0) ;

INSERT INTO RequirementArguments 
		(RequirementId,			Name, 			Type, 			Value, 		Extra, 	SecondExtra)
VALUES 	('QUO_REQ_FASCISM_RANGED',	'UnitPromotionClass',		'ARGTYPE_IDENTITY',		'PROMOTION_CLASS_RANGED',	NULL,	NULL 	) ,
		('QUO_REQ_FASCISM_ANTI_CAV',	'UnitPromotionClass',		'ARGTYPE_IDENTITY',		'PROMOTION_CLASS_ANTI_CAVALRY',	NULL,	NULL 	) ;

INSERT INTO RequirementSets 
	(RequirementSetId, 		RequirementSetType)
VALUES 	('QUO_REQSET_FASCISM_RANGED', 	'REQUIREMENTSET_TEST_ANY') ,
('QUO_REQSET_FASCISM_ANTI_CAV', 	'REQUIREMENTSET_TEST_ANY') ;

 INSERT INTO RequirementSetRequirements
	(RequirementSetId,	RequirementId)
VALUES	('QUO_REQSET_FASCISM_RANGED', 	'QUO_REQ_FASCISM_RANGED') ,
('QUO_REQSET_FASCISM_ANTI_CAV', 	'QUO_REQ_FASCISM_ANTI_CAV') ;

 INSERT INTO Modifiers 
	(ModifierId, 	ModifierType, 	RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
VALUES	('QUO_GOVERNMENT_FASCISM_RANGE', 	'MODIFIER_UNIT_ADJUST_ATTACK_RANGE', 0, 0, NULL, NULL) ,
		('QUO_GOVERNMENT_FASCISM_RANGE_PLAYER', 	'MODIFIER_PLAYER_UNITS_ATTACH_MODIFIER', 0, 0, NULL, 'QUO_REQSET_FASCISM_RANGED') ,
('QUO_GOVERNMENT_FASCISM_ANTI_CAV', 	'MODIFIER_UNIT_ADJUST_ATTACK_RANGE', 0, 0, NULL, NULL) ,
		('QUO_GOVERNMENT_FASCISM_ANTI_CAV_PLAYER', 	'MODIFIER_PLAYER_UNITS_ATTACH_MODIFIER', 0, 0, NULL, 'QUO_REQSET_FASCISM_ANTI_CAV') ;

INSERT INTO ModifierArguments
	(ModifierId, 			Name, 		Type, 			Value, 					Extra, 	SecondExtra)
VALUES	('QUO_GOVERNMENT_FASCISM_RANGE', 	'Amount', 	'ARGTYPE_IDENTITY', 	'2',					NULL, 	NULL) ,	
		('QUO_GOVERNMENT_FASCISM_RANGE_PLAYER', 	'ModifierId', 	'ARGTYPE_IDENTITY', 	'QUO_GOVERNMENT_FASCISM_RANGE',		NULL, 	NULL)  ,
		('QUO_GOVERNMENT_FASCISM_ANTI_CAV', 	'Amount', 	'ARGTYPE_IDENTITY', 	'2',					NULL, 	NULL) ,	
		('QUO_GOVERNMENT_FASCISM_ANTI_CAV_PLAYER', 	'ModifierId', 	'ARGTYPE_IDENTITY', 	'QUO_GOVERNMENT_FASCISM_ANTI_CAV',		NULL, 	NULL)  ;

INSERT INTO GovernmentModifiers
		(GovernmentType, 		ModifierId)
VALUES 	('GOVERNMENT_FASCISM',	'QUO_GOVERNMENT_FASCISM_RANGE_PLAYER');


-- only increase the range of Anti Cav if ranged anti cav is enabled
INSERT INTO GovernmentModifiers
		(GovernmentType, 		ModifierId)
SELECT 'GOVERNMENT_FASCISM',	'QUO_GOVERNMENT_FASCISM_ANTI_CAV_PLAYER'
FROM tblQuoOptions
WHERE tblQuoOptions.OptionID='QUO_OPTION_ARE_ANTI_CAV_RANGED' AND tblQuoOptions.Value >= 1 ; 

*/ 

 




-- UPDATE BUG TRACKER
-- This code should go last in every file

UPDATE tblQuoDebug SET x_Close='1' WHERE DebugID='Quo_Governments_Code';