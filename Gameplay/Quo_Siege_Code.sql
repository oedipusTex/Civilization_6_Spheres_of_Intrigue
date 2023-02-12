/*
    Created by Quo
*/
 

--LOGS
-- Debug
INSERT INTO tblQuoDebug 
	(DebugID, 		x_Open, x_Close, 	Message)
VALUES ('Quo_Siege_Code',	'1',	'0',		'') ;


-- Disable the destruction of buildings in the city center on city capture
UPDATE Districts SET CaptureRemovesBuildings=0 WHERE DistrictType ='DISTRICT_CITY_CENTER' ;

UPDATE Districts SET CaptureRemovesBuildings=1 WHERE DistrictType IN ('DISTRICT_CAMPUS', 'DISTRICT_THEATER');


-- SIEGE
-- All siege units have a range of at least 3
-- Search for any units with siege characteristics in order to make sure units added by mods get this update
UPDATE Units SET Range=3 WHERE Range <=2 AND PromotionClass='PROMOTION_CLASS_SIEGE' ;

-- Lower them to 2 Move, but allow them to move and shoot on same turn
UPDATE Units SET BaseMoves=2 WHERE PromotionClass='PROMOTION_CLASS_SIEGE' ;

-- Updated in v6.0.6 to apply to the new CLASS_SIEGE_SETUP tag created by Firaxis in Rise and Fall
DELETE FROM TypeTags WHERE Type='ABILITY_NO_MOVE_AND_SHOOT' AND Tag='CLASS_SIEGE_SETUP' AND (SELECT tblQuoOptions.Value FROM tblQuoOptions WHERE OptionID='QUO_OPTION_CAN_SIEGE_MOVE_AND_SHOOT' IS NOT 0);



-- Since there is a Unit Promotion that eliminates the move and shoot penalty, change it to +1 Movement
INSERT INTO Modifiers 
		(ModifierId, ModifierType, RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
VALUES	('QUO_MOD_EXPERT_CREW_MOVE', 'MODIFIER_PLAYER_UNIT_ADJUST_MOVEMENT', 0, 0, NULL, NULL) ;


INSERT INTO ModifierArguments
	(ModifierId, 			Name, 		Type, 			Value, 		Extra, 	SecondExtra)
VALUES		('QUO_MOD_EXPERT_CREW_MOVE', 		'Amount', 	'ARGTYPE_IDENTITY', 	'1',		NULL, 	NULL) ;


INSERT INTO UnitPromotionModifiers
	(UnitPromotionType, 	ModifierId)
VALUES 	('PROMOTION_EXPERT_CREW',	'QUO_MOD_EXPERT_CREW_MOVE') ;

	
	

-- BATTERING RAM
-- Push back to Construction
-- Removed after changes to governments were reviewed
--UPDATE Units SET PrereqTech='TECH_CONSTRUCTION' WHERE UnitType='UNIT_BATTERING_RAM' ;



-- SIEGE TOWER
-- Remove by adding a trait no player can get
-- Note that altho we are using TRAIT_BARBARIAN, Barbs can't actually build this since its not on their build lists
UPDATE Units SET TraitType='TRAIT_BARBARIAN' WHERE UnitType='UNIT_SIEGE_TOWER' ;
UPDATE Units SET TraitType='TRAIT_BARBARIAN' WHERE UnitType='UNIT_BATTERING_RAM' ;



-- Updated in v3.13.4 due to changes made by Firaxis
-- No more urban defenses from Steel. 
DELETE FROM TechnologyModifiers WHERE TechnologyType='TECH_STEEL' AND ModifierId='STEEL_UNLOCK_URBAN_DEFENSES' ;



INSERT INTO Types
	(Type, Kind)
VALUES('QUO_BUILDING_BEDROCK_ANCIENT', 'KIND_BUILDING'),
('QUO_BUILDING_BEDROCK_MEDIEVAL', 'KIND_BUILDING'),
('QUO_BUILDING_BEDROCK_RENAISSANCE', 'KIND_BUILDING');


INSERT INTO Buildings 
	(BuildingType,Name,PrereqTech,PrereqCivic,Cost,MaxPlayerInstances,MaxWorldInstances,Capital,PrereqDistrict,AdjacentDistrict,Description,RequiresPlacement,RequiresRiver,OuterDefenseHitPoints,Housing,Entertainment,AdjacentResource,Coast,EnabledByReligion,AllowsHolyCity,PurchaseYield,MustPurchase,Maintenance,IsWonder,TraitType,OuterDefenseStrength,CitizenSlots,MustBeLake,MustNotBeLake,RegionalRange,AdjacentToMountain,ObsoleteEra,RequiresReligion,GrantFortification,DefenseModifier,InternalOnly,RequiresAdjacentRiver,Quote,QuoteAudio,MustBeAdjacentLand,AdvisorType)
VALUES	('QUO_BUILDING_BEDROCK_ANCIENT','LOC_QUO_BUILDING_BEDROCK_ANCIENT_NAME',NULL,NULL,5,-1,-1,0,'DISTRICT_CITY_CENTER',NULL,'LOC_QUO_BUILDING_BEDROCK_ANCIENT_DESCRIPTION',0,0,NULL,0,0,NULL,NULL,0,0,NULL,0,0,0,NULL,0,NULL,0,0,0,0,'NO_ERA',0,0,0,0,0,NULL,NULL,0,'ADVISOR_GENERIC') ;

INSERT INTO BuildingPrereqs
	(Building, PrereqBuilding)
VALUES	('QUO_BUILDING_BEDROCK_ANCIENT','BUILDING_PALACE'); 



INSERT INTO Buildings 
	(BuildingType,Name,PrereqTech,PrereqCivic,Cost,MaxPlayerInstances,MaxWorldInstances,Capital,PrereqDistrict,AdjacentDistrict,Description,RequiresPlacement,RequiresRiver,OuterDefenseHitPoints,Housing,Entertainment,AdjacentResource,Coast,EnabledByReligion,AllowsHolyCity,PurchaseYield,MustPurchase,Maintenance,IsWonder,TraitType,OuterDefenseStrength,CitizenSlots,MustBeLake,MustNotBeLake,RegionalRange,AdjacentToMountain,ObsoleteEra,RequiresReligion,GrantFortification,DefenseModifier,InternalOnly,RequiresAdjacentRiver,Quote,QuoteAudio,MustBeAdjacentLand,AdvisorType)
VALUES	('QUO_BUILDING_BEDROCK_MEDIEVAL','LOC_QUO_BUILDING_BEDROCK_MEDIEVAL_NAME',NULL,NULL,5,-1,-1,0,'DISTRICT_CITY_CENTER',NULL,'LOC_QUO_BUILDING_BEDROCK_MEDIEVAL_DESCRIPTION',0,0,NULL,0,0,NULL,NULL,0,0,NULL,0,0,0,NULL,0,NULL,0,0,0,0,'NO_ERA',0,0,0,0,0,NULL,NULL,0,'ADVISOR_GENERIC') ;

INSERT INTO BuildingPrereqs
	(Building, PrereqBuilding)
VALUES	('QUO_BUILDING_BEDROCK_MEDIEVAL','BUILDING_PALACE'); 



INSERT INTO Buildings 
	(BuildingType,Name,PrereqTech,PrereqCivic,Cost,MaxPlayerInstances,MaxWorldInstances,Capital,PrereqDistrict,AdjacentDistrict,Description,RequiresPlacement,RequiresRiver,OuterDefenseHitPoints,Housing,Entertainment,AdjacentResource,Coast,EnabledByReligion,AllowsHolyCity,PurchaseYield,MustPurchase,Maintenance,IsWonder,TraitType,OuterDefenseStrength,CitizenSlots,MustBeLake,MustNotBeLake,RegionalRange,AdjacentToMountain,ObsoleteEra,RequiresReligion,GrantFortification,DefenseModifier,InternalOnly,RequiresAdjacentRiver,Quote,QuoteAudio,MustBeAdjacentLand,AdvisorType)
VALUES	('QUO_BUILDING_BEDROCK_RENAISSANCE','LOC_QUO_BUILDING_BEDROCK_RENAISSANCE_NAME',NULL,NULL,5,-1,-1,0,'DISTRICT_CITY_CENTER',NULL,'LOC_QUO_BUILDING_BEDROCK_RENAISSANCE_DESCRIPTION',0,0,NULL,0,0,NULL,NULL,0,0,NULL,0,0,0,NULL,0,NULL,0,0,0,0,'NO_ERA',0,0,0,0,0,NULL,NULL,0,'ADVISOR_GENERIC') ;

INSERT INTO BuildingPrereqs
	(Building, PrereqBuilding)
VALUES	('QUO_BUILDING_BEDROCK_RENAISSANCE','BUILDING_PALACE'); 





-- WALLS 
-- Walls require a Barracks or Stable
-- In v3.10.3 added as a MyOptions option
INSERT INTO BuildingPrereqs 
		(Building, PrereqBuilding)
SELECT	'BUILDING_WALLS', 'QUO_BUILDING_BEDROCK_ANCIENT'
FROM tblQuoOptions 
WHERE OptionID='QUO_OPTION_WALLS_HAVE_PREREQS' AND Value >= 1 ;



-- Bedrock requirements
INSERT INTO Requirements
	(RequirementId, 		RequirementType, 	Likeliness,	Inverse, 	Triggered)
VALUES	('QUO_REQ_BEDROCK_ANCIENT_HAS_ENCAMPMENT', 	'REQUIREMENT_CITY_HAS_DISTRICT',	0,0,0)  ,
		('QUO_REQ_BEDROCK_ANCIENT_HAS_IKANDA', 	'REQUIREMENT_CITY_HAS_DISTRICT',	0,0,0)  ;

INSERT INTO RequirementArguments 
	(RequirementId,			Name, 			Type, 			Value, 				Extra, 	SecondExtra)
VALUES 	('QUO_REQ_BEDROCK_ANCIENT_HAS_ENCAMPMENT',	'DistrictType',	'ARGTYPE_IDENTITY',	'DISTRICT_ENCAMPMENT',	NULL,	NULL 	)  ,
		('QUO_REQ_BEDROCK_ANCIENT_HAS_IKANDA',	'DistrictType',	'ARGTYPE_IDENTITY',	'DISTRICT_IKANDA',	NULL,	NULL 	)  ;

INSERT INTO RequirementSets 
	(RequirementSetId, 		RequirementSetType)
VALUES 	('QUO_REQSET_FREE_BEDROCK_ANCIENT', 	'REQUIREMENTSET_TEST_ANY') ;


-- Reuses QUO_REQ_AA_GENERIC_CITY_HAS_PALACE from global code
INSERT INTO RequirementSetRequirements
	(RequirementSetId,	RequirementId)
VALUES	('QUO_REQSET_FREE_BEDROCK_ANCIENT', 	'QUO_REQ_BEDROCK_ANCIENT_HAS_ENCAMPMENT') ,
		('QUO_REQSET_FREE_BEDROCK_ANCIENT', 	'QUO_REQ_AA_GENERIC_CITY_HAS_PALACE') ,
		('QUO_REQSET_FREE_BEDROCK_ANCIENT', 	'QUO_REQ_BEDROCK_ANCIENT_HAS_IKANDA') ;
		



-- Note: Uses the QUO_MODTYPE_GRANT_BUILDING_IN_CITY type of Modifier, established in global setup code
INSERT INTO Modifiers 
	(ModifierId, ModifierType, RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
VALUES	('QUO_FREE_BEDROCK_ANCIENT', 'QUO_MODTYPE_GRANT_BUILDING_IN_CITY', 1, 1, NULL, NULL) ,
		('QUO_FREE_BEDROCK_ANCIENT_PLAYER', 'MODIFIER_PLAYER_CITIES_ATTACH_MODIFIER', 0, 0, NULL, 'QUO_REQSET_FREE_BEDROCK_ANCIENT') ;

INSERT INTO ModifierArguments
	(ModifierId, 			Name, 		Type, 			Value, 			Extra, 	SecondExtra)
VALUES	('QUO_FREE_BEDROCK_ANCIENT', 	'BuildingType', 	'ARGTYPE_IDENTITY', 	'QUO_BUILDING_BEDROCK_ANCIENT',			NULL, 	NULL) ,
		('QUO_FREE_BEDROCK_ANCIENT_PLAYER', 	'ModifierId', 	'ARGTYPE_IDENTITY', 	'QUO_FREE_BEDROCK_ANCIENT',			NULL, 	NULL) ;


INSERT INTO TraitModifiers
	(TraitType, 			ModifierID)
VALUES	('MINOR_CIV_DEFAULT_TRAIT',	'QUO_FREE_BEDROCK_ANCIENT_PLAYER')  ,
		('TRAIT_LEADER_MAJOR_CIV',	'QUO_FREE_BEDROCK_ANCIENT_PLAYER')  ;

		
		

-- Free walls in the city with the palace
INSERT INTO Requirements
	(RequirementId, 		RequirementType, 	Likeliness,	Inverse, 	Triggered)
VALUES	('QUO_REQ_NOT_HAS_FIRST_CIVIC', 	'REQUIREMENT_PLAYER_HAS_CIVIC',	0,1,0)  ;


INSERT INTO RequirementArguments 
	(RequirementId,			Name, 			Type, 			Value, 				Extra, 	SecondExtra)
VALUES 	('QUO_REQ_NOT_HAS_FIRST_CIVIC',	'CivicType',	'ARGTYPE_IDENTITY',	'CIVIC_CODE_OF_LAWS',	NULL,	NULL 	)  ;


INSERT INTO RequirementSets 
	(RequirementSetId, 		RequirementSetType)
VALUES 	('QUO_REQSET_ALL_FREE_WALLS', 	'REQUIREMENTSET_TEST_ALL') ;


-- Note: Uses QUO_REQ_AA_GENERIC_CITY_HAS_PALACE from global code
INSERT INTO RequirementSetRequirements
	(RequirementSetId,	RequirementId)
VALUES	('QUO_REQSET_ALL_FREE_WALLS', 	'QUO_REQ_AA_GENERIC_CITY_HAS_PALACE') ,
		('QUO_REQSET_ALL_FREE_WALLS', 	'QUO_REQ_NOT_HAS_FIRST_CIVIC') ;


INSERT INTO Modifiers 
	(ModifierId, ModifierType, RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
VALUES	('QUO_FREE_WALLS_ALL', 'QUO_MODTYPE_GRANT_BUILDING_IN_CITY', 1, 1, NULL, NULL) ,
		('QUO_FREE_WALLS_ALL_PLAYER', 'MODIFIER_PLAYER_CITIES_ATTACH_MODIFIER', 0, 0, NULL, 'QUO_REQSET_ALL_FREE_WALLS') ;


INSERT INTO ModifierArguments
	(ModifierId, 			Name, 		Type, 			Value, 			Extra, 	SecondExtra)
VALUES	('QUO_FREE_WALLS_ALL', 	'BuildingType', 	'ARGTYPE_IDENTITY', 	'BUILDING_WALLS',			NULL, 	NULL) ,
		('QUO_FREE_WALLS_ALL_PLAYER', 	'ModifierId', 	'ARGTYPE_IDENTITY', 	'QUO_FREE_WALLS_ALL',			NULL, 	NULL) ;


INSERT INTO TraitModifiers
	(TraitType, 			ModifierID)
VALUES	('MINOR_CIV_DEFAULT_TRAIT',	'QUO_FREE_WALLS_ALL_PLAYER')  ,
		('TRAIT_LEADER_MAJOR_CIV',	'QUO_FREE_WALLS_ALL_PLAYER')  ;
		
		
-- Require 2 Walls to get the boost, since this mod gives 1 for free		
UPDATE Boosts SET NumItems=2, BoostClass='BOOST_TRIGGER_HAVE_X_BUILDINGS' WHERE TechnologyType='TECH_ENGINEERING' ;




-- Castles
-- Awarded for free in the city if the city has at least 1 world wonder.

INSERT INTO Requirements
	(RequirementId, 		RequirementType, 	Likeliness,	Inverse, 	Triggered)
VALUES	('QUO_REQ_FREE_BEDROCK_MEDIEVAL_WONDER', 	'REQUIREMENT_CITY_HAS_ANY_WONDER',	0,0,0)  ;

-- no req args

INSERT INTO RequirementSets 
	(RequirementSetId, 		RequirementSetType)
VALUES 	('QUO_REQSET_ALL_FREE_BEDROCK_MEDIEVAL', 	'REQUIREMENTSET_TEST_ANY') ;


INSERT INTO RequirementSetRequirements
	(RequirementSetId,	RequirementId)
VALUES	('QUO_REQSET_ALL_FREE_BEDROCK_MEDIEVAL', 	'QUO_REQ_FREE_BEDROCK_MEDIEVAL_WONDER') ,
		('QUO_REQSET_ALL_FREE_BEDROCK_MEDIEVAL', 	'QUO_REQ_AA_GENERIC_CITY_HAS_PALACE') ,
		('QUO_REQSET_ALL_FREE_BEDROCK_MEDIEVAL', 	'REQUIRES_CITY_HAS_ANCIENT_WALLS') ;


INSERT INTO Modifiers 
	(ModifierId, ModifierType, RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
VALUES	('QUO_FREE_BEDROCK_MEDIEVAL', 'QUO_MODTYPE_GRANT_BUILDING_IN_CITY', 1, 1, NULL, NULL) ,
		('QUO_FREE_BEDROCK_MEDIEVAL_PLAYER', 'MODIFIER_PLAYER_CITIES_ATTACH_MODIFIER', 0, 0, NULL, 'QUO_REQSET_ALL_FREE_BEDROCK_MEDIEVAL') ;

INSERT INTO ModifierArguments
	(ModifierId, 			Name, 		Type, 			Value, 			Extra, 	SecondExtra)
VALUES	('QUO_FREE_BEDROCK_MEDIEVAL', 	'BuildingType', 	'ARGTYPE_IDENTITY', 	'QUO_BUILDING_BEDROCK_MEDIEVAL',			NULL, 	NULL) ,
		('QUO_FREE_BEDROCK_MEDIEVAL_PLAYER', 	'ModifierId', 	'ARGTYPE_IDENTITY', 	'QUO_FREE_BEDROCK_MEDIEVAL',			NULL, 	NULL) ;


INSERT INTO TraitModifiers
	(TraitType, 			ModifierID)
VALUES	('MINOR_CIV_DEFAULT_TRAIT',	'QUO_FREE_BEDROCK_MEDIEVAL_PLAYER')  ,
		('TRAIT_LEADER_MAJOR_CIV',	'QUO_FREE_BEDROCK_MEDIEVAL_PLAYER')  ;


DELETE FROM BuildingPrereqs WHERE Building ='BUILDING_CASTLE' AND (select Value from tblquooptions where optionId='QUO_OPTION_WALLS_HAVE_PREREQS') > 0;

INSERT INTO BuildingPrereqs 
		(Building, PrereqBuilding)
SELECT	'BUILDING_CASTLE', 'QUO_BUILDING_BEDROCK_MEDIEVAL'
FROM tblQuoOptions 
WHERE OptionID='QUO_OPTION_WALLS_HAVE_PREREQS' AND Value >= 1 ;




-- Star Fort


-- Award bedrock to cities with at least 5 Ocean tiles
INSERT INTO Requirements
	(RequirementId, 		RequirementType, 	Likeliness,	Inverse, 	Triggered)
VALUES	('QUO_REQ_FREE_BEDROCK_RENAISSANCE_PLOT', 	'REQUIREMENT_CITY_HAS_X_TERRAIN_TYPE',	0,0,0)  ;


INSERT INTO RequirementArguments 
	(RequirementId,			Name, 			Type, 			Value, 				Extra, 	SecondExtra)
VALUES 	('QUO_REQ_FREE_BEDROCK_RENAISSANCE_PLOT',	'Amount',	'ARGTYPE_IDENTITY',	'6',	NULL,	NULL 	) ,
		('QUO_REQ_FREE_BEDROCK_RENAISSANCE_PLOT',	'Hills',		'ARGTYPE_IDENTITY',		'0',	NULL,	NULL 	) ,
		('QUO_REQ_FREE_BEDROCK_RENAISSANCE_PLOT',	'TerrainType',		'ARGTYPE_IDENTITY',		'TERRAIN_OCEAN',	NULL,	NULL 	) ;


INSERT INTO RequirementSets 
	(RequirementSetId, 		RequirementSetType)
VALUES 	('QUO_REQSET_ALL_FREE_BEDROCK_RENAISSANCE', 	'REQUIREMENTSET_TEST_ANY') ;


INSERT INTO RequirementSetRequirements
	(RequirementSetId,	RequirementId)
VALUES	('QUO_REQSET_ALL_FREE_BEDROCK_RENAISSANCE', 	'QUO_REQ_FREE_BEDROCK_RENAISSANCE_PLOT') ,
		('QUO_REQSET_ALL_FREE_BEDROCK_RENAISSANCE', 	'QUO_REQ_AA_GENERIC_CITY_HAS_PALACE') ,
		('QUO_REQSET_ALL_FREE_BEDROCK_RENAISSANCE', 	'REQUIRES_CITY_HAS_MEDIEVAL_WALLS') ;
		


INSERT INTO Modifiers 
	(ModifierId, ModifierType, RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
VALUES	('QUO_FREE_BEDROCK_RENAISSANCE', 'QUO_MODTYPE_GRANT_BUILDING_IN_CITY', 1, 1, NULL, NULL) ,
		('QUO_FREE_BEDROCK_RENAISSANCE_PLAYER', 'MODIFIER_PLAYER_CITIES_ATTACH_MODIFIER', 0, 0, NULL, 'QUO_REQSET_ALL_FREE_BEDROCK_RENAISSANCE') ;

INSERT INTO ModifierArguments
	(ModifierId, 			Name, 		Type, 			Value, 			Extra, 	SecondExtra)
VALUES	('QUO_FREE_BEDROCK_RENAISSANCE', 	'BuildingType', 	'ARGTYPE_IDENTITY', 	'QUO_BUILDING_BEDROCK_RENAISSANCE',			NULL, 	NULL) ,
		('QUO_FREE_BEDROCK_RENAISSANCE_PLAYER', 	'ModifierId', 	'ARGTYPE_IDENTITY', 	'QUO_FREE_BEDROCK_RENAISSANCE',			NULL, 	NULL) ;


INSERT INTO TraitModifiers
	(TraitType, 			ModifierID)
VALUES	('MINOR_CIV_DEFAULT_TRAIT',	'QUO_FREE_BEDROCK_RENAISSANCE_PLAYER')  ,
		('TRAIT_LEADER_MAJOR_CIV',	'QUO_FREE_BEDROCK_RENAISSANCE_PLAYER')  ;



DELETE FROM BuildingPrereqs WHERE Building ='BUILDING_STAR_FORT' AND (select Value from tblquooptions where optionId='QUO_OPTION_WALLS_HAVE_PREREQS') > 0;
		
INSERT INTO BuildingPrereqs 
		(Building, PrereqBuilding)
SELECT	'BUILDING_STAR_FORT', 'QUO_BUILDING_BEDROCK_RENAISSANCE'
FROM tblQuoOptions 
WHERE OptionID='QUO_OPTION_WALLS_HAVE_PREREQS' AND Value >= 1 ; 






-- UNIQUE CIVS


-- China
-- Receive Ancient Walls in city near Great Wall

INSERT INTO Requirements
	(RequirementId, 		RequirementType, 	Likeliness,	Inverse, 	Triggered)
VALUES	('QUO_REQ_FREE_BEDROCK_CHINA_ANCIENT_PLOT', 	'REQUIREMENT_PLOT_ADJACENT_IMPROVEMENT_TYPE_MATCHES',	0,0,0)  ;


INSERT INTO RequirementArguments 
	(RequirementId,			Name, 			Type, 			Value, 				Extra, 	SecondExtra)
VALUES 	('QUO_REQ_FREE_BEDROCK_CHINA_ANCIENT_PLOT',	'ImprovementType',	'ARGTYPE_IDENTITY',	'IMPROVEMENT_GREAT_WALL',	NULL,	NULL 	) ,
		('QUO_REQ_FREE_BEDROCK_CHINA_ANCIENT_PLOT',	'MaxRange',		'ARGTYPE_IDENTITY',		'4',	NULL,	NULL 	) ,
		('QUO_REQ_FREE_BEDROCK_CHINA_ANCIENT_PLOT',	'MinRange',		'ARGTYPE_IDENTITY',		'0',	NULL,	NULL 	) ;


INSERT INTO RequirementSets 
	(RequirementSetId, 		RequirementSetType)
VALUES 	('QUO_REQSET_ALL_FREE_BEDROCK_CHINA_ANCIENT', 	'REQUIREMENTSET_TEST_ANY') ;


INSERT INTO RequirementSetRequirements
	(RequirementSetId,	RequirementId)
VALUES	('QUO_REQSET_ALL_FREE_BEDROCK_CHINA_ANCIENT', 	'QUO_REQ_FREE_BEDROCK_CHINA_ANCIENT_PLOT') ;


INSERT INTO Modifiers 
	(ModifierId, ModifierType, RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
VALUES	('QUO_FREE_BEDROCK_CHINA_ANCIENT', 'QUO_MODTYPE_GRANT_BUILDING_IN_CITY', 1, 1, NULL, NULL) ,
		('QUO_FREE_BEDROCK_CHINA_ANCIENT_PLAYER', 'MODIFIER_PLAYER_CITIES_ATTACH_MODIFIER', 0, 0, NULL, 'QUO_REQSET_ALL_FREE_BEDROCK_CHINA_ANCIENT') ;

INSERT INTO ModifierArguments
	(ModifierId, 			Name, 		Type, 			Value, 			Extra, 	SecondExtra)
VALUES	('QUO_FREE_BEDROCK_CHINA_ANCIENT', 	'BuildingType', 	'ARGTYPE_IDENTITY', 	'QUO_BUILDING_BEDROCK_ANCIENT',			NULL, 	NULL) ,
		('QUO_FREE_BEDROCK_CHINA_ANCIENT_PLAYER', 	'ModifierId', 	'ARGTYPE_IDENTITY', 	'QUO_FREE_BEDROCK_CHINA_ANCIENT',			NULL, 	NULL) ;


INSERT INTO TraitModifiers
	(TraitType, 			ModifierID)
VALUES	('TRAIT_CIVILIZATION_DYNASTIC_CYCLE',	'QUO_FREE_BEDROCK_CHINA_ANCIENT_PLAYER')  ;




-- France
-- Removed in later builds in favor of having this simply be a characterstic of Euro biomes
-- Chateaus
/* INSERT INTO Requirements
	(RequirementId, 		RequirementType, 	Likeliness,	Inverse, 	Triggered)
VALUES	('QUO_REQ_FREE_BEDROCK_FRANCE_REN_PLOT', 	'REQUIREMENT_PLOT_ADJACENT_IMPROVEMENT_TYPE_MATCHES',	0,0,0)  ;


INSERT INTO RequirementArguments 
	(RequirementId,			Name, 			Type, 			Value, 				Extra, 	SecondExtra)
VALUES 	('QUO_REQ_FREE_BEDROCK_FRANCE_REN_PLOT',	'ImprovementType',	'ARGTYPE_IDENTITY',	'IMPROVEMENT_CHATEAU',	NULL,	NULL 	) ,
		('QUO_REQ_FREE_BEDROCK_FRANCE_REN_PLOT',	'MaxRange',		'ARGTYPE_IDENTITY',		'3',	NULL,	NULL 	) ,
		('QUO_REQ_FREE_BEDROCK_FRANCE_REN_PLOT',	'MinRange',		'ARGTYPE_IDENTITY',		'0',	NULL,	NULL 	) ;


INSERT INTO RequirementSets 
	(RequirementSetId, 		RequirementSetType)
VALUES 	('QUO_REQSET_ALL_FREE_BEDROCK_FRANCE_REN', 	'REQUIREMENTSET_TEST_ANY') ;


INSERT INTO RequirementSetRequirements
	(RequirementSetId,	RequirementId)
VALUES	('QUO_REQSET_ALL_FREE_BEDROCK_FRANCE_REN', 	'QUO_REQ_FREE_BEDROCK_FRANCE_REN_PLOT') ;


INSERT INTO Modifiers 
	(ModifierId, ModifierType, RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
VALUES	('QUO_FREE_BEDROCK_FRANCE_REN', 'QUO_MODTYPE_GRANT_BUILDING_IN_CITY', 1, 1, NULL, NULL) ,
		('QUO_FREE_BEDROCK_FRANCE_REN_PLAYER', 'MODIFIER_PLAYER_CITIES_ATTACH_MODIFIER', 0, 0, NULL, 'QUO_REQSET_ALL_FREE_BEDROCK_FRANCE_REN') ;

INSERT INTO ModifierArguments
	(ModifierId, 			Name, 		Type, 			Value, 			Extra, 	SecondExtra)
VALUES	('QUO_FREE_BEDROCK_FRANCE_REN', 	'BuildingType', 	'ARGTYPE_IDENTITY', 	'QUO_BUILDING_BEDROCK_RENAISSANCE',			NULL, 	NULL) ,
		('QUO_FREE_BEDROCK_FRANCE_REN_PLAYER', 	'ModifierId', 	'ARGTYPE_IDENTITY', 	'QUO_FREE_BEDROCK_FRANCE_REN',			NULL, 	NULL) ;


INSERT INTO TraitModifiers
	(TraitType, 			ModifierID)
VALUES	('TRAIT_CIVILIZATION_WONDER_TOURISM',	'QUO_FREE_BEDROCK_FRANCE_REN_PLAYER')  ;



-- Spanish missions
INSERT INTO Requirements
	(RequirementId, 		RequirementType, 	Likeliness,	Inverse, 	Triggered)
VALUES	('QUO_REQ_FREE_BEDROCK_SPAIN_REN_PLOT', 	'REQUIREMENT_PLOT_ADJACENT_IMPROVEMENT_TYPE_MATCHES',	0,0,0)  ;


INSERT INTO RequirementArguments 
	(RequirementId,			Name, 			Type, 			Value, 				Extra, 	SecondExtra)
VALUES 	('QUO_REQ_FREE_BEDROCK_SPAIN_REN_PLOT',	'ImprovementType',	'ARGTYPE_IDENTITY',	'IMPROVEMENT_MISSION',	NULL,	NULL 	) ,
		('QUO_REQ_FREE_BEDROCK_SPAIN_REN_PLOT',	'MaxRange',		'ARGTYPE_IDENTITY',		'1',	NULL,	NULL 	) ,
		('QUO_REQ_FREE_BEDROCK_SPAIN_REN_PLOT',	'MinRange',		'ARGTYPE_IDENTITY',		'0',	NULL,	NULL 	) ;


INSERT INTO RequirementSets 
	(RequirementSetId, 		RequirementSetType)
VALUES 	('QUO_REQSET_ALL_FREE_BEDROCK_SPAIN_REN', 	'REQUIREMENTSET_TEST_ANY') ;


INSERT INTO RequirementSetRequirements
	(RequirementSetId,	RequirementId)
VALUES	('QUO_REQSET_ALL_FREE_BEDROCK_SPAIN_REN', 	'QUO_REQ_FREE_BEDROCK_SPAIN_REN_PLOT') ;


INSERT INTO Modifiers 
	(ModifierId, ModifierType, RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
VALUES	('QUO_FREE_BEDROCK_SPAIN_REN', 'QUO_MODTYPE_GRANT_BUILDING_IN_CITY', 1, 1, NULL, NULL) ,
		('QUO_FREE_BEDROCK_SPAIN_REN_PLAYER', 'MODIFIER_PLAYER_CITIES_ATTACH_MODIFIER', 0, 0, NULL, 'QUO_REQSET_ALL_FREE_BEDROCK_SPAIN_REN') ;

INSERT INTO ModifierArguments
	(ModifierId, 			Name, 		Type, 			Value, 			Extra, 	SecondExtra)
VALUES	('QUO_FREE_BEDROCK_SPAIN_REN', 	'BuildingType', 	'ARGTYPE_IDENTITY', 	'QUO_BUILDING_BEDROCK_RENAISSANCE',			NULL, 	NULL) ,
		('QUO_FREE_BEDROCK_SPAIN_REN_PLAYER', 	'ModifierId', 	'ARGTYPE_IDENTITY', 	'QUO_FREE_BEDROCK_SPAIN_REN',			NULL, 	NULL) ;


INSERT INTO TraitModifiers
	(TraitType, 			ModifierID)
VALUES	('TRAIT_CIVILIZATION_TREASURE_FLEET',	'QUO_FREE_BEDROCK_SPAIN_REN_PLAYER')  ;
 */





-- Khmer Prasats provide medieval bedrock
-- Removed in v7.0.10

/* INSERT INTO Requirements
	(RequirementId, 		RequirementType, 	Likeliness,	Inverse, 	Triggered)
VALUES	('QUO_REQ_FREE_BEDROCK_KHMER_HAS_PRASAT', 	'REQUIREMENT_CITY_HAS_BUILDING',	0,0,0)  ;


INSERT INTO RequirementArguments 
	(RequirementId,			Name, 			Type, 			Value, 				Extra, 	SecondExtra)
VALUES 	('QUO_REQ_FREE_BEDROCK_KHMER_HAS_PRASAT',	'BuildingType',	'ARGTYPE_IDENTITY',	'BUILDING_PRASAT',	NULL,	NULL 	) ;


INSERT INTO RequirementSets 
	(RequirementSetId, 		RequirementSetType)
VALUES 	('QUO_REQSET_FREE_BEDROCK_KHMER', 	'REQUIREMENTSET_TEST_ANY') ;


INSERT INTO RequirementSetRequirements
	(RequirementSetId,	RequirementId)
VALUES	('QUO_REQSET_FREE_BEDROCK_KHMER', 	'QUO_REQ_FREE_BEDROCK_KHMER_HAS_PRASAT') ;


INSERT INTO Modifiers 
	(ModifierId, ModifierType, RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
VALUES	('QUO_FREE_BEDROCK_KHMER', 'QUO_MODTYPE_GRANT_BUILDING_IN_CITY', 1, 1, NULL, NULL) ,
		('QUO_FREE_BEDROCK_KHMER_PLAYER', 'MODIFIER_PLAYER_CITIES_ATTACH_MODIFIER', 0, 0, NULL, 'QUO_REQSET_FREE_BEDROCK_KHMER') ;

INSERT INTO ModifierArguments
	(ModifierId, 			Name, 		Type, 			Value, 			Extra, 	SecondExtra)
VALUES	('QUO_FREE_BEDROCK_KHMER', 	'BuildingType', 	'ARGTYPE_IDENTITY', 	'QUO_BUILDING_BEDROCK_MEDIEVAL',			NULL, 	NULL) ,
		('QUO_FREE_BEDROCK_KHMER_PLAYER', 	'ModifierId', 	'ARGTYPE_IDENTITY', 	'QUO_FREE_BEDROCK_KHMER',			NULL, 	NULL) ;



INSERT INTO TraitModifiers
	(TraitType, 		ModifierId)
SELECT 'TRAIT_CIVILIZATION_KHMER_BARAYS',	'QUO_FREE_BEDROCK_KHMER_PLAYER' 
FROM Civilizations 
WHERE Civilizations.CivilizationType='CIVILIZATION_KHMER' ; */

		
		
		
-- Stone Circles belief

INSERT INTO Modifiers 
	(ModifierId, ModifierType, RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
VALUES	('QUO_FREE_BEDROCK_STONE_CIRCLES', 'QUO_MODTYPE_GRANT_BUILDING_IN_CITY', 1, 1, NULL, NULL) ,
		('QUO_FREE_BEDROCK_STONE_CIRCLES_PLAYER', 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER', 0, 0, NULL, 'CITY_FOLLOWS_PANTHEON_REQUIREMENTS') ;

INSERT INTO ModifierArguments
	(ModifierId, 			Name, 		Type, 			Value, 			Extra, 	SecondExtra)
VALUES	('QUO_FREE_BEDROCK_STONE_CIRCLES', 	'BuildingType', 	'ARGTYPE_IDENTITY', 	'QUO_BUILDING_BEDROCK_ANCIENT',			NULL, 	NULL) ,
		('QUO_FREE_BEDROCK_STONE_CIRCLES_PLAYER', 	'ModifierId', 	'ARGTYPE_IDENTITY', 	'QUO_FREE_BEDROCK_STONE_CIRCLES',			NULL, 	NULL) ;		

INSERT INTO BeliefModifiers
	(BeliefType, 			ModifierId)
VALUES	('BELIEF_STONE_CIRCLES',	'QUO_FREE_BEDROCK_STONE_CIRCLES_PLAYER');		



-- Free extra attacks
-- Doesn't work, apparently only functions when attached to a governor
/* INSERT INTO Modifiers 
	(ModifierId, ModifierType, RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
VALUES	('QUO_WALLS_MEDIEVAL_EXTRA_ATTACKS', 'CITY_DEFENDER_ADJUST_ATTACKS_PER_TURN', 0, 0, NULL, NULL)  ,
		('QUO_WALLS_REN_EXTRA_ATTACKS', 'CITY_DEFENDER_ADJUST_ATTACKS_PER_TURN', 0, 0, NULL, NULL)  ;

INSERT INTO ModifierArguments
	(ModifierId, 			Name, 		Type, 			Value, 			Extra, 	SecondExtra)
VALUES	('QUO_WALLS_MEDIEVAL_EXTRA_ATTACKS', 	'Amount', 	'ARGTYPE_IDENTITY', 	'1',			NULL, 	NULL) ,
		('QUO_WALLS_REN_EXTRA_ATTACKS', 	'Amount', 	'ARGTYPE_IDENTITY', 	'1',			NULL, 	NULL) ;

INSERT INTO BuildingModifiers
		(BuildingType, 			ModifierId)
VALUES	('BUILDING_CASTLE',	'QUO_WALLS_MEDIEVAL_EXTRA_ATTACKS'),
		('BUILDING_STAR_FORT',	'QUO_WALLS_REN_EXTRA_ATTACKS');
 */


/*
create table tblQuo_WallsToRoutes as
SELECT routetype, prereqera, 
case 
  when routetype = 'ROUTE_ANCIENT_ROAD' then 'QUO_REQSET_WALL_EXTRA_ATTACKS_ANCIENT'
  when routetype = 'ROUTE_MEDIEVAL_ROAD' then 'QUO_REQSET_WALL_EXTRA_ATTACKS_MEDIEVAL'
  when routetype = 'ROUTE_INDUSTRIAL_ROAD' then 'QUO_REQSET_WALL_EXTRA_ATTACKS_INDUSTRIAL'
  when routetype = 'ROUTE_MODERN_ROAD' then 'QUO_REQSET_WALL_EXTRA_ATTACKS_MODERN'
end xReqSet
FROM routes
WHERE routetype in ('ROUTE_ANCIENT_ROAD', 'ROUTE_MEDIEVAL_ROAD', 'ROUTE_INDUSTRIAL_ROAD', 'ROUTE_MODERN_ROAD');


INSERT INTO RequirementSets 
	(RequirementSetId, 		RequirementSetType)
VALUES 	('QUO_REQSET_WALL_EXTRA_ATTACKS_ANCIENT', 	'REQUIREMENTSET_TEST_ALL') ,
		('QUO_REQSET_WALL_EXTRA_ATTACKS_MEDIEVAL', 	'REQUIREMENTSET_TEST_ALL') ,
		('QUO_REQSET_WALL_EXTRA_ATTACKS_INDUSTRIAL', 	'REQUIREMENTSET_TEST_ALL') ,
		('QUO_REQSET_WALL_EXTRA_ATTACKS_MODERN', 	'REQUIREMENTSET_TEST_ALL') ;


INSERT INTO RequirementSetRequirements
	(RequirementSetId,	RequirementId)
VALUES	('QUO_REQSET_WALL_EXTRA_ATTACKS_ANCIENT', 	'QUO_REQ_GLOBAL_ERA_NOT_YET_CLASSICAL'),

		('QUO_REQSET_WALL_EXTRA_ATTACKS_MEDIEVAL', 	'QUO_REQ_GLOBAL_ERA_IS_ATLEAST_CLASSICAL'),
		('QUO_REQSET_WALL_EXTRA_ATTACKS_MEDIEVAL', 	'QUO_REQ_GLOBAL_ERA_NOT_YET_INDUSTRIAL'),
		
		('QUO_REQSET_WALL_EXTRA_ATTACKS_INDUSTRIAL', 	'QUO_REQ_GLOBAL_ERA_IS_ATLEAST_INDUSTRIAL'),
		('QUO_REQSET_WALL_EXTRA_ATTACKS_INDUSTRIAL', 	'QUO_REQ_GLOBAL_ERA_NOT_YET_MODERN'),
		
		('QUO_REQSET_WALL_EXTRA_ATTACKS_MODERN', 	'QUO_REQ_GLOBAL_ERA_IS_ATLEAST_MODERN') ;


INSERT INTO Modifiers 
	(ModifierId, ModifierType, RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
SELECT 'QUO_WALLS_ANCIENT_FREE_ROUTES_' || routetype, 'MODIFIER_GRANT_ROUTE_IN_RADIUS', 1, 1, NULL, xReqSet
	FROM tblQuo_WallsToRoutes;

INSERT INTO Modifiers 
	(ModifierId, ModifierType, RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
SELECT 'QUO_WALLS_MEDIEVAL_FREE_ROUTES_' || routetype, 'MODIFIER_GRANT_ROUTE_IN_RADIUS', 1, 1, NULL, xReqSet
	FROM tblQuo_WallsToRoutes;
	
INSERT INTO Modifiers 
	(ModifierId, ModifierType, RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
SELECT 'QUO_WALLS_REN_FREE_ROUTES_' || routetype, 'MODIFIER_GRANT_ROUTE_IN_RADIUS', 1, 1, NULL, xReqSet
	FROM tblQuo_WallsToRoutes;

	
INSERT INTO ModifierArguments
		(ModifierId, 			Name, 		Type, 			Value, 			Extra, 	SecondExtra)
SELECT 'QUO_WALLS_ANCIENT_FREE_ROUTES_' || routetype, 	'RouteType', 	'ARGTYPE_IDENTITY', 	RouteType,			NULL, 	NULL
	FROM tblQuo_WallsToRoutes;
	
INSERT INTO ModifierArguments
		(ModifierId, 			Name, 		Type, 			Value, 			Extra, 	SecondExtra)
SELECT 'QUO_WALLS_ANCIENT_FREE_ROUTES_' || routetype, 	'Radius', 	'ARGTYPE_IDENTITY', 	'1',			NULL, 	NULL 
	FROM tblQuo_WallsToRoutes;

	
INSERT INTO ModifierArguments
		(ModifierId, 			Name, 		Type, 			Value, 			Extra, 	SecondExtra)
SELECT 'QUO_WALLS_MEDIEVAL_FREE_ROUTES_' || routetype, 	'RouteType', 	'ARGTYPE_IDENTITY', 	RouteType,			NULL, 	NULL
	FROM tblQuo_WallsToRoutes;
	
INSERT INTO ModifierArguments
		(ModifierId, 			Name, 		Type, 			Value, 			Extra, 	SecondExtra)
SELECT 'QUO_WALLS_MEDIEVAL_FREE_ROUTES_' || routetype, 	'Radius', 	'ARGTYPE_IDENTITY', 	'2',			NULL, 	NULL 
	FROM tblQuo_WallsToRoutes;

	
INSERT INTO ModifierArguments
		(ModifierId, 			Name, 		Type, 			Value, 			Extra, 	SecondExtra)
SELECT 'QUO_WALLS_REN_FREE_ROUTES_' || routetype, 	'RouteType', 	'ARGTYPE_IDENTITY', 	RouteType,			NULL, 	NULL
	FROM tblQuo_WallsToRoutes;
	
INSERT INTO ModifierArguments
		(ModifierId, 			Name, 		Type, 			Value, 			Extra, 	SecondExtra)
SELECT 'QUO_WALLS_REN_FREE_ROUTES_' || routetype, 	'Radius', 	'ARGTYPE_IDENTITY', 	'3',			NULL, 	NULL 
	FROM tblQuo_WallsToRoutes;
	
		
		
INSERT INTO BuildingModifiers
		(BuildingType, 			ModifierID)
SELECT 'BUILDING_WALLS',	'QUO_WALLS_ANCIENT_FREE_ROUTES_' || routetype  
	FROM tblQuo_WallsToRoutes;
	

INSERT INTO BuildingModifiers
		(BuildingType, 			ModifierID)
SELECT 'BUILDING_CASTLE',	'QUO_WALLS_MEDIEVAL_FREE_ROUTES_' || routetype  
	FROM tblQuo_WallsToRoutes;


INSERT INTO BuildingModifiers
		(BuildingType, 			ModifierID)
SELECT 'BUILDING_STAR_FORT',	'QUO_WALLS_REN_FREE_ROUTES_' || routetype  
	FROM tblQuo_WallsToRoutes;
	
	
INSERT INTO BuildingModifiers
		(BuildingType, 			ModifierID)
SELECT 'BUILDING_TSIKHE',	'QUO_WALLS_REN_FREE_ROUTES_' || routetype  
	FROM tblQuo_WallsToRoutes;


 */		
		


-- UPDATE BUG TRACKER
-- This code should go last in every file


UPDATE tblQuoDebug SET x_Close='1' WHERE DebugID='Quo_Siege_Code';