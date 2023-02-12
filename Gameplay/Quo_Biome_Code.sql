/*
    Created by Quo
*/


-- LOGS
INSERT INTO tblQuoDebug 
	(DebugID, 		x_Open, x_Close, 	Message)
VALUES ('Quo_Biome_Code',	'1',	'0',		'') ;

 
 
 
 
INSERT INTO Types 
	(Type, 					Kind)
VALUES 	('QUO_TRAIT_BIOME_ASIAN_STEPPE', 		'KIND_TRAIT'),
		('QUO_TRAIT_BIOME_NATIVE_AMERICA', 		'KIND_TRAIT'),
		('QUO_TRAIT_BIOME_NEW_WORLD', 		'KIND_TRAIT'),
		('QUO_TRAIT_BIOME_BOREAL_EUROPE', 		'KIND_TRAIT'),
		('QUO_TRAIT_BIOME_ASIAN_PACIFIC', 		'KIND_TRAIT'),
		('QUO_TRAIT_BIOME_ROMANESQUE', 		'KIND_TRAIT'),
		('QUO_TRAIT_BIOME_ARABESQUE', 		'KIND_TRAIT'),
		('QUO_TRAIT_BIOME_AFRICA', 		'KIND_TRAIT'),
		('QUO_TRAIT_BIOME_ASIAN_EXPANSE', 		'KIND_TRAIT') ,
		('QUO_TRAIT_BIOME_WEST_EUROPE', 		'KIND_TRAIT') ,
		('QUO_TRAIT_BIOME_UK', 		'KIND_TRAIT') ,
		('QUO_TRAIT_BIOME_EAST_EUROPE', 		'KIND_TRAIT') ,
		('QUO_TRAIT_BIOME_NORTH_AFRICA', 		'KIND_TRAIT') ;
		
		

INSERT INTO Traits 
	(TraitType,			Name,						Description,						InternalOnly)
VALUES ('QUO_TRAIT_BIOME_ASIAN_STEPPE',	'LOC_QUO_TRAIT_BIOME_ASIAN_STEPPE_NAME',		'LOC_QUO_TRAIT_BIOME_ASIAN_STEPPE_DESCRIPTION',		0) ,
	('QUO_TRAIT_BIOME_NATIVE_AMERICA',	'LOC_QUO_TRAIT_BIOME_NATIVE_AMERICA_NAME',		'LOC_QUO_TRAIT_BIOME_NATIVE_AMERICA_DESCRIPTION',		0) ,
	('QUO_TRAIT_BIOME_NEW_WORLD',	'LOC_QUO_TRAIT_BIOME_NEW_WORLD_NAME',		'LOC_QUO_TRAIT_BIOME_NEW_WORLD_DESCRIPTION',		0) ,
	('QUO_TRAIT_BIOME_BOREAL_EUROPE',	'LOC_QUO_TRAIT_BIOME_BOREAL_EUROPE_NAME',		'LOC_QUO_TRAIT_BIOME_BOREAL_EUROPE_DESCRIPTION',		0) ,
	('QUO_TRAIT_BIOME_ASIAN_PACIFIC',	'LOC_QUO_TRAIT_BIOME_ASIAN_PACIFIC_NAME',		'LOC_QUO_TRAIT_BIOME_ASIAN_PACIFIC_DESCRIPTION',		0) ,
	('QUO_TRAIT_BIOME_ROMANESQUE',	'LOC_QUO_TRAIT_BIOME_ROMANESQUE_NAME',		'LOC_QUO_TRAIT_BIOME_ROMANESQUE_DESCRIPTION',		0) ,
	('QUO_TRAIT_BIOME_ARABESQUE',	'LOC_QUO_TRAIT_BIOME_ARABESQUE_NAME',		'LOC_QUO_TRAIT_BIOME_ARABESQUE_DESCRIPTION',		0) ,
	('QUO_TRAIT_BIOME_AFRICA',	'LOC_QUO_TRAIT_BIOME_AFRICA_NAME',		'LOC_QUO_TRAIT_BIOME_AFRICA_DESCRIPTION',		0) ,
	('QUO_TRAIT_BIOME_ASIAN_EXPANSE',	'LOC_QUO_TRAIT_BIOME_ASIAN_EXPANSE_NAME',		'LOC_QUO_TRAIT_BIOME_ASIAN_EXPANSE_DESCRIPTION',		0) ,
	('QUO_TRAIT_BIOME_WEST_EUROPE',	'LOC_QUO_TRAIT_BIOME_WEST_EUROPE_NAME',		'LOC_QUO_TRAIT_BIOME_WEST_EUROPE_DESCRIPTION',		0) ,
	('QUO_TRAIT_BIOME_UK',	'LOC_QUO_TRAIT_BIOME_UK_NAME',		'LOC_QUO_TRAIT_BIOME_UK_DESCRIPTION',		0) ,
	('QUO_TRAIT_BIOME_EAST_EUROPE',	'LOC_QUO_TRAIT_BIOME_EAST_EUROPE_NAME',		'LOC_QUO_TRAIT_BIOME_EAST_EUROPE_DESCRIPTION',		0) ,
	('QUO_TRAIT_BIOME_NORTH_AFRICA',	'LOC_QUO_TRAIT_BIOME_NORTH_AFRICA_NAME',		'LOC_QUO_TRAIT_BIOME_NORTH_AFRICA_DESCRIPTION',		0) ;
	



CREATE TABLE tblTempCivilizationTraits
(
	tempCivilizationType text,
	tempTraitType text,
	PRIMARY KEY (tempCivilizationType, tempTraitType)
);

INSERT OR REPLACE INTO tblTempCivilizationTraits 
		(tempCivilizationType, 		tempTraitType)
VALUES ('CIVILIZATION_ARABIA',	'QUO_TRAIT_BIOME_ARABESQUE') ,
		('CIVILIZATION_SUMERIA',	'QUO_TRAIT_BIOME_ARABESQUE') ,
		('CIVILIZATION_OTTOMAN',	'QUO_TRAIT_BIOME_ARABESQUE') ,
		('CIVILIZATION_PERSIA',	'QUO_TRAIT_BIOME_ARABESQUE') ,
		('CIVILIZATION_BABYLON_STK',	'QUO_TRAIT_BIOME_ARABESQUE') ,
		
		('CIVILIZATION_MAPUCHE',	'QUO_TRAIT_BIOME_NATIVE_AMERICA') ,
		('CIVILIZATION_AZTEC',	'QUO_TRAIT_BIOME_NATIVE_AMERICA') ,
		('CIVILIZATION_CREE',	'QUO_TRAIT_BIOME_NATIVE_AMERICA') ,
		('CIVILIZATION_INCA',	'QUO_TRAIT_BIOME_NATIVE_AMERICA') ,
		('CIVILIZATION_MAYA',	'QUO_TRAIT_BIOME_NATIVE_AMERICA') ,
		
		('CIVILIZATION_BRAZIL',	'QUO_TRAIT_BIOME_NEW_WORLD') ,
		('CIVILIZATION_AMERICA',	'QUO_TRAIT_BIOME_NEW_WORLD') ,
		('CIVILIZATION_AUSTRALIA',	'QUO_TRAIT_BIOME_NEW_WORLD') ,
		('CIVILIZATION_CANADA',	'QUO_TRAIT_BIOME_NEW_WORLD') ,
		('CIVILIZATION_GRAN_COLOMBIA',	'QUO_TRAIT_BIOME_NEW_WORLD') ,
		
		('CIVILIZATION_SCYTHIA',	'QUO_TRAIT_BIOME_ASIAN_STEPPE') ,
		('CIVILIZATION_MONGOLIA',	'QUO_TRAIT_BIOME_ASIAN_STEPPE') ,
		
		('CIVILIZATION_NORWAY',	'QUO_TRAIT_BIOME_BOREAL_EUROPE') ,
		('CIVILIZATION_SWEDEN',	'QUO_TRAIT_BIOME_BOREAL_EUROPE') ,
		
		-- Iceland is now handled in the Scratchpad, since it is a fan-made civ
		--('CIVILIZATION_SUK_ICELAND',	'QUO_TRAIT_BIOME_BOREAL_EUROPE') ,
		
		('CIVILIZATION_JAPAN',	'QUO_TRAIT_BIOME_ASIAN_PACIFIC') ,
		('CIVILIZATION_INDONESIA',	'QUO_TRAIT_BIOME_ASIAN_PACIFIC') ,
		('CIVILIZATION_KOREA',	'QUO_TRAIT_BIOME_ASIAN_PACIFIC') ,
		('CIVILIZATION_MAORI',	'QUO_TRAIT_BIOME_ASIAN_PACIFIC') ,
		('CIVILIZATION_VIETNAM',	'QUO_TRAIT_BIOME_ASIAN_PACIFIC') ,
		
		('CIVILIZATION_NUBIA',	'QUO_TRAIT_BIOME_AFRICA') ,
		('CIVILIZATION_ZULU',	'QUO_TRAIT_BIOME_AFRICA') ,
		('CIVILIZATION_KONGO',	'QUO_TRAIT_BIOME_AFRICA') ,
		('CIVILIZATION_MALI',	'QUO_TRAIT_BIOME_AFRICA') ,
		('CIVILIZATION_ETHIOPIA',	'QUO_TRAIT_BIOME_AFRICA') ,
		
		--africa special districts
		('CIVILIZATION_ZULU',	'TRAIT_CIVILIZATION_MBANZA') ,
		('CIVILIZATION_MALI',	'TRAIT_CIVILIZATION_MBANZA') ,
		('CIVILIZATION_NUBIA',	'TRAIT_CIVILIZATION_MBANZA') ,
		('CIVILIZATION_ETHIOPIA',	'TRAIT_CIVILIZATION_MBANZA') ,

		('CIVILIZATION_KONGO',	'TRAIT_CIVILIZATION_DISTRICT_IKANDA') ,
		('CIVILIZATION_MALI',	'TRAIT_CIVILIZATION_DISTRICT_IKANDA') ,
		('CIVILIZATION_NUBIA',	'TRAIT_CIVILIZATION_DISTRICT_IKANDA') ,
		('CIVILIZATION_ETHIOPIA',	'TRAIT_CIVILIZATION_DISTRICT_IKANDA') ,

		('CIVILIZATION_ZULU',	'TRAIT_CIVILIZATION_DISTRICT_SUGUBA') ,
		('CIVILIZATION_KONGO',	'TRAIT_CIVILIZATION_DISTRICT_SUGUBA') ,
		('CIVILIZATION_NUBIA',	'TRAIT_CIVILIZATION_DISTRICT_SUGUBA') ,
		('CIVILIZATION_ETHIOPIA',	'TRAIT_CIVILIZATION_DISTRICT_SUGUBA') ,
		
		('CIVILIZATION_GREECE',	'QUO_TRAIT_BIOME_ROMANESQUE') ,
		('CIVILIZATION_ROME',	'QUO_TRAIT_BIOME_ROMANESQUE') ,
		('CIVILIZATION_MACEDON',	'QUO_TRAIT_BIOME_ROMANESQUE') ,
		('CIVILIZATION_BYZANTIUM',	'QUO_TRAIT_BIOME_ROMANESQUE') ,
		
		('CIVILIZATION_CHINA',	'QUO_TRAIT_BIOME_ASIAN_EXPANSE') ,
		('CIVILIZATION_INDIA',	'QUO_TRAIT_BIOME_ASIAN_EXPANSE') ,
		('CIVILIZATION_KHMER',	'QUO_TRAIT_BIOME_ASIAN_EXPANSE') ,

		('CIVILIZATION_FRANCE',	'QUO_TRAIT_BIOME_WEST_EUROPE') ,
		('CIVILIZATION_SPAIN',	'QUO_TRAIT_BIOME_WEST_EUROPE') ,
		('CIVILIZATION_GERMANY','QUO_TRAIT_BIOME_WEST_EUROPE')  ,
		('CIVILIZATION_NETHERLANDS', 'QUO_TRAIT_BIOME_WEST_EUROPE') ,
		('CIVILIZATION_PORTUGAL', 'QUO_TRAIT_BIOME_WEST_EUROPE') ,
		
		('CIVILIZATION_ENGLAND',	'QUO_TRAIT_BIOME_UK') ,
		('CIVILIZATION_SCOTLAND',	'QUO_TRAIT_BIOME_UK') ,
		('CIVILIZATION_GAUL',	'QUO_TRAIT_BIOME_UK') ,
		
		('CIVILIZATION_RUSSIA',	'QUO_TRAIT_BIOME_EAST_EUROPE') ,
		('CIVILIZATION_GEORGIA',	'QUO_TRAIT_BIOME_EAST_EUROPE') ,
		('CIVILIZATION_HUNGARY',	'QUO_TRAIT_BIOME_EAST_EUROPE') ,
		('CIVILIZATION_POLAND',	'QUO_TRAIT_BIOME_EAST_EUROPE') ,
		
		('CIVILIZATION_PHOENICIA',	'QUO_TRAIT_BIOME_NORTH_AFRICA') ,
		('CIVILIZATION_EGYPT',	'QUO_TRAIT_BIOME_NORTH_AFRICA') ;
		

-- Grab values from the MyOptions. This table contains a list of any civilizations the player has manually registered with the mod
INSERT OR REPLACE INTO tblTempCivilizationTraits 
		(tempCivilizationType, 		tempTraitType)
SELECT xCivilizationType, xBiomeTrait
FROM tblQuo_Option_FanMadeCivilizations;


		
		
-- Only do the insert if the Biome option is enabled and the civ exists (e.g. exists as a DLC)
INSERT OR REPLACE INTO CivilizationTraits
	(CivilizationType, TraitType)
SELECT tempCivilizationType, tempTraitType
FROM tblTempCivilizationTraits
	WHERE EXISTS (SELECT 1 FROM Civilizations WHERE CivilizationType = tempCivilizationType)
		AND EXISTS (SELECT 1 FROM tblQuoOptions WHERE OptionId='QUO_OPTION_ENABLE_BIOMES' AND Value > 0) ;



		
		
-- dlc assignments
/* INSERT OR REPLACE INTO CivilizationTraits 
		(CivilizationType, 		TraitType)
SELECT 	'CIVILIZATION_AZTEC',	'QUO_TRAIT_BIOME_NATIVE_AMERICA'
	FROM Civilizations WHERE Civilizations.CivilizationType='CIVILIZATION_PERSIA' 
		AND EXISTS (SELECT 1 FROM tblQuoOptions WHERE OptionId='QUO_OPTION_ENABLE_BIOMES' AND Value > 0) ;


INSERT OR REPLACE INTO CivilizationTraits 
		(CivilizationType, 		TraitType)
SELECT 	'CIVILIZATION_PERSIA',	'QUO_TRAIT_BIOME_ARABESQUE'
	FROM Civilizations WHERE Civilizations.CivilizationType='CIVILIZATION_PERSIA' 
		AND EXISTS (SELECT 1 FROM tblQuoOptions WHERE OptionId='QUO_OPTION_ENABLE_BIOMES' AND Value > 0) ;
	
INSERT OR REPLACE INTO CivilizationTraits 
		(CivilizationType, 		TraitType)
SELECT 	'CIVILIZATION_AUSTRALIA',	'QUO_TRAIT_BIOME_NEW_WORLD'
	FROM Civilizations WHERE Civilizations.CivilizationType='CIVILIZATION_AUSTRALIA' 
		AND EXISTS (SELECT 1 FROM tblQuoOptions WHERE OptionId='QUO_OPTION_ENABLE_BIOMES' AND Value > 0) ;
	
	
INSERT OR REPLACE INTO CivilizationTraits 
		(CivilizationType, 		TraitType)
SELECT 	'CIVILIZATION_POLAND',	'QUO_TRAIT_BIOME_EAST_EUROPE'
	FROM Civilizations WHERE Civilizations.CivilizationType='CIVILIZATION_POLAND' 
		AND EXISTS (SELECT 1 FROM tblQuoOptions WHERE OptionId='QUO_OPTION_ENABLE_BIOMES' AND Value > 0) ;
	
	
INSERT OR REPLACE INTO CivilizationTraits 
		(CivilizationType, 		TraitType)
SELECT 	'CIVILIZATION_INDONESIA',	'QUO_TRAIT_BIOME_ASIAN_PACIFIC'
	FROM Civilizations WHERE Civilizations.CivilizationType='CIVILIZATION_INDONESIA' 
		AND EXISTS (SELECT 1 FROM tblQuoOptions WHERE OptionId='QUO_OPTION_ENABLE_BIOMES' AND Value > 0) ;
	
	
INSERT OR REPLACE INTO CivilizationTraits 
		(CivilizationType, 		TraitType)
SELECT 	'CIVILIZATION_KHMER',	'QUO_TRAIT_BIOME_ASIAN_EXPANSE'
	FROM Civilizations WHERE Civilizations.CivilizationType='CIVILIZATION_KHMER' 
		AND EXISTS (SELECT 1 FROM tblQuoOptions WHERE OptionId='QUO_OPTION_ENABLE_BIOMES' AND Value > 0) ;
	
	
INSERT OR REPLACE INTO CivilizationTraits 
		(CivilizationType, 		TraitType)
SELECT 	'CIVILIZATION_NUBIA',	'QUO_TRAIT_BIOME_AFRICA'
	FROM Civilizations WHERE Civilizations.CivilizationType='CIVILIZATION_NUBIA' 
		AND EXISTS (SELECT 1 FROM tblQuoOptions WHERE OptionId='QUO_OPTION_ENABLE_BIOMES' AND Value > 0) ;

		
-- special code because Nubia is part of North Africa
INSERT OR REPLACE INTO CivilizationTraits 
		(CivilizationType, 		TraitType)
SELECT 	'CIVILIZATION_NUBIA',	'TRAIT_CIVILIZATION_DISTRICT_IKANDA'
	FROM Civilizations WHERE Civilizations.CivilizationType='CIVILIZATION_NUBIA' 
		AND EXISTS (SELECT 1 FROM tblQuoOptions WHERE OptionId='QUO_OPTION_ENABLE_BIOMES' AND Value > 0) ;


INSERT OR REPLACE INTO CivilizationTraits 
		(CivilizationType, 		TraitType)
SELECT 	'CIVILIZATION_NUBIA',	'TRAIT_CIVILIZATION_DISTRICT_SUGUBA'
	FROM Civilizations WHERE Civilizations.CivilizationType='CIVILIZATION_NUBIA' 
		AND EXISTS (SELECT 1 FROM tblQuoOptions WHERE OptionId='QUO_OPTION_ENABLE_BIOMES' AND Value > 0) ;

INSERT OR REPLACE INTO CivilizationTraits 
		(CivilizationType, 		TraitType)
SELECT 	'CIVILIZATION_NUBIA',	'TRAIT_CIVILIZATION_MBANZA'
	FROM Civilizations WHERE Civilizations.CivilizationType='CIVILIZATION_NUBIA' 
		AND EXISTS (SELECT 1 FROM tblQuoOptions WHERE OptionId='QUO_OPTION_ENABLE_BIOMES' AND Value > 0) ;
		
	
INSERT OR REPLACE INTO CivilizationTraits 
		(CivilizationType, 		TraitType)
SELECT 	'CIVILIZATION_MACEDON',	'QUO_TRAIT_BIOME_ROMANESQUE'
	FROM Civilizations WHERE Civilizations.CivilizationType='CIVILIZATION_MACEDON' 
		AND EXISTS (SELECT 1 FROM tblQuoOptions WHERE OptionId='QUO_OPTION_ENABLE_BIOMES' AND Value > 0) ;
	

-- support for certain fan-made mods

-- SUKs Iceland
INSERT OR REPLACE INTO CivilizationTraits 
		(CivilizationType, 		TraitType)
SELECT 	'CIVILIZATION_SUK_ICELAND',	'QUO_TRAIT_BIOME_BOREAL_EUROPE'
	FROM Civilizations WHERE Civilizations.CivilizationType='CIVILIZATION_SUK_ICELAND' 
		AND EXISTS (SELECT 1 FROM tblQuoOptions WHERE OptionId='QUO_OPTION_ENABLE_BIOMES' AND Value > 0) ; */
	


		
-- NEW WORLD
UPDATE tblQuoDebug SET Message='New World' WHERE DebugID='Quo_Biome_Code';

-- Cannot receive Great Prophets
-- Removed in 7.0.12

/* INSERT INTO ExcludedGreatPersonClasses
	(GreatPersonClassType, TraitType)
VALUES('GREAT_PERSON_CLASS_PROPHET', 'QUO_TRAIT_BIOME_NEW_WORLD') ;
 */

-- Free WMDs
INSERT INTO RequirementSets 
	(RequirementSetId, 		RequirementSetType)
VALUES 	('QUO_REQSET_BIOME_NEW_WORLD_WMD_UNLOCK', 	'REQUIREMENTSET_TEST_ALL')  ;

INSERT INTO RequirementSetRequirements
	(RequirementSetId,	RequirementId)
VALUES	 ('QUO_REQSET_BIOME_NEW_WORLD_WMD_UNLOCK', 	'QUO_REQ_GLOBAL_ERA_IS_ATLEAST_ATOMIC')  ;


INSERT INTO Modifiers 
	(ModifierId, ModifierType, RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
VALUES	('QUO_BIOME_NEW_WORLD_FREE_WMD', 'MODIFIER_PLAYER_CREATE_WMD', 1, 1, NULL, 'QUO_REQSET_BIOME_NEW_WORLD_WMD_UNLOCK') ,
		('QUO_BIOME_NEW_WORLD_FREE_WMD_PLAYER', 'MODIFIER_PLAYER_CITIES_ATTACH_MODIFIER', 0, 0, NULL, 	NULL) ;


INSERT INTO ModifierArguments
	(ModifierId, 			Name, 		Type, 			Value, 					Extra, 	SecondExtra)
VALUES	('QUO_BIOME_NEW_WORLD_FREE_WMD', 	'Amount', 'ARGTYPE_IDENTITY', 	'1',	NULL, 	NULL) ,  
	('QUO_BIOME_NEW_WORLD_FREE_WMD', 	'Type', 	'ARGTYPE_IDENTITY', 	'UNIT_ANTIAIR_GUN',		NULL, 	NULL) ,
	('QUO_BIOME_NEW_WORLD_FREE_WMD_PLAYER', 		'ModifierId', 		'ARGTYPE_IDENTITY', 	'QUO_BIOME_NEW_WORLD_FREE_WMD',	NULL, 	NULL)  ;
	
	
INSERT INTO TraitModifiers
		(TraitType, 			ModifierID)
VALUES	('QUO_TRAIT_BIOME_NEW_WORLD',	'QUO_BIOME_NEW_WORLD_FREE_WMD_PLAYER') ;

 
 
 
-- Free Settlers when world reaches Classical era. 
INSERT INTO Requirements
	(RequirementId, 		RequirementType, 	Likeliness,	Inverse, 	Triggered)
VALUES	('QUO_REQ_BIOME_NEW_WORLD_CITY_HAS_PALACE', 		'REQUIREMENT_CITY_HAS_BUILDING',	0,0,0) ,
		('QUO_REQ_BIOME_NEW_WORLD_ERA_UNLOCK', 		'REQUIREMENT_GAME_ERA_ATLEAST_EXPANSION',	0,0,0) ,
		('QUO_REQ_BIOME_NEW_WORLD_ERA_LOCK', 		'REQUIREMENT_GAME_ERA_ATLEAST_EXPANSION',	0,1,0) ;


INSERT INTO RequirementArguments 
	(RequirementId,			Name, 			Type, 			Value, 				Extra, 	SecondExtra)
VALUES 	('QUO_REQ_BIOME_NEW_WORLD_CITY_HAS_PALACE',	'BuildingType',		'ARGTYPE_IDENTITY',	'BUILDING_PALACE',	NULL,	NULL 	)  ,
		('QUO_REQ_BIOME_NEW_WORLD_ERA_UNLOCK',	'EraType',		'ARGTYPE_IDENTITY',	'ERA_CLASSICAL',	NULL,	NULL 	) ,
		('QUO_REQ_BIOME_NEW_WORLD_ERA_LOCK',	'EraType',		'ARGTYPE_IDENTITY',	'ERA_CLASSICAL',	NULL,	NULL 	) ;


INSERT INTO RequirementSets 
	(RequirementSetId, 		RequirementSetType)
VALUES 	('QUO_REQSET_BIOME_NEW_WORLD_UNIT_UNLOCK', 	'REQUIREMENTSET_TEST_ALL')  ,
		('QUO_REQSET_BIOME_NEW_WORLD_UNIT_LOCK', 	'REQUIREMENTSET_TEST_ALL')  ;



INSERT INTO RequirementSetRequirements
	(RequirementSetId,	RequirementId)
VALUES	 ('QUO_REQSET_BIOME_NEW_WORLD_UNIT_UNLOCK', 	'QUO_REQ_BIOME_NEW_WORLD_CITY_HAS_PALACE') ,
		('QUO_REQSET_BIOME_NEW_WORLD_UNIT_UNLOCK', 	'QUO_REQ_BIOME_NEW_WORLD_ERA_UNLOCK') ,
		('QUO_REQSET_BIOME_NEW_WORLD_UNIT_LOCK', 	'QUO_REQ_BIOME_NEW_WORLD_ERA_LOCK') ;


INSERT INTO Modifiers 
	(ModifierId, ModifierType, RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
VALUES	('QUO_BIOME_NEW_WORLD_FREE_UNIT', 'MODIFIER_SINGLE_CITY_GRANT_UNIT_IN_CITY', 1, 1, NULL, NULL) ,
		('QUO_BIOME_NEW_WORLD_FREE_UNIT_PLAYER', 'MODIFIER_PLAYER_CITIES_ATTACH_MODIFIER', 0, 0, NULL, 	'QUO_REQSET_BIOME_NEW_WORLD_UNIT_UNLOCK') ;


INSERT INTO ModifierArguments
	(ModifierId, 			Name, 		Type, 			Value, 					Extra, 	SecondExtra)
VALUES	('QUO_BIOME_NEW_WORLD_FREE_UNIT', 	'Amount', 'ARGTYPE_IDENTITY', 	'2',	NULL, 	NULL) ,  
	('QUO_BIOME_NEW_WORLD_FREE_UNIT', 	'UnitType', 	'ARGTYPE_IDENTITY', 	'UNIT_SETTLER',		NULL, 	NULL) ,
	('QUO_BIOME_NEW_WORLD_FREE_UNIT_PLAYER', 		'ModifierId', 		'ARGTYPE_IDENTITY', 	'QUO_BIOME_NEW_WORLD_FREE_UNIT',	NULL, 	NULL)  ;
	
	
INSERT INTO TraitModifiers
		(TraitType, 			ModifierID)
VALUES	('QUO_TRAIT_BIOME_NEW_WORLD',	'QUO_BIOME_NEW_WORLD_FREE_UNIT_PLAYER') ;


-- Lock building settlers until the correct era dawns
INSERT INTO Modifiers 
	(ModifierId, ModifierType, RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
VALUES ('QUO_BIOME_NEW_WORLD_NO_BUILD_SETTLERS', 'MODIFIER_PLAYER_UNIT_BUILD_DISABLED', 0, 0, NULL, 'QUO_REQSET_BIOME_NEW_WORLD_UNIT_LOCK');


INSERT INTO ModifierArguments
	(ModifierId, 			Name, 		Type, 			Value, 			Extra, 	SecondExtra)
VALUES ('QUO_BIOME_NEW_WORLD_NO_BUILD_SETTLERS' , 	'UnitType', 	'ARGTYPE_IDENTITY', 	'UNIT_SETTLER',			NULL, 	NULL);

	
INSERT INTO TraitModifiers
	(TraitType, 			ModifierID)
VALUES ('QUO_TRAIT_BIOME_NEW_WORLD',	'QUO_BIOME_NEW_WORLD_NO_BUILD_SETTLERS');



-- Lowered plot purchase cost
INSERT INTO Modifiers 
	(ModifierId, ModifierType, RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
VALUES	('QUO_BIOME_NEW_WORLD_PLOTPURCHASECOST', 'MODIFIER_PLAYER_CITIES_ADJUST_PLOT_PURCHASE_COST', 0, 0, NULL, NULL) ;


INSERT INTO ModifierArguments
	(ModifierId, 			Name, 		Type, 			Value, 		Extra, 	SecondExtra)
VALUES	('QUO_BIOME_NEW_WORLD_PLOTPURCHASECOST', 'Amount', 	'ARGTYPE_IDENTITY', 	'-20',	NULL, 	NULL) ;


INSERT INTO TraitModifiers
	(TraitType, 			ModifierID)
VALUES	('QUO_TRAIT_BIOME_NEW_WORLD',	'QUO_BIOME_NEW_WORLD_PLOTPURCHASECOST') ;



-- All districts culture bomb

-- Prior to Gathering Storm this required a long series of Modifiers, but in GS we can just use MODIFIER_PLAYER_ADJUST_ALL_DISTRICTS_CULTURE_BOMB
/* INSERT INTO Modifiers
		(ModifierID, 			ModifierType, 					RunOnce, 	Permanent, 	OwnerRequirementSetId, 	SubjectRequirementSetId)
SELECT	'QUO_BIOME_NEW_WORLD_CBOMB_' || Districts.DistrictType , 	'MODIFIER_PLAYER_ADD_CULTURE_BOMB_TRIGGER', 	0, 		0, 		NULL,			NULL
FROM 	Districts WHERE Districts.DistrictType != 'DISTRICT_CITY_CENTER' AND Districts.DistrictType != 'DISTRICT_WONDER' ;


INSERT INTO ModifierArguments
	(ModifierID,			Name,			Type, 			Value,			Extra)
SELECT	'QUO_BIOME_NEW_WORLD_CBOMB_' || Districts.DistrictType, 	'DistrictType', 	'ARGTYPE_IDENTITY', 	Districts.DistrictType,	NULL 
FROM 	Districts WHERE Districts.DistrictType != 'DISTRICT_CITY_CENTER' AND Districts.DistrictType != 'DISTRICT_WONDER';


INSERT INTO TraitModifiers
		(TraitType, 				ModifierID)
SELECT 	'QUO_TRAIT_BIOME_NEW_WORLD',		'QUO_BIOME_NEW_WORLD_CBOMB_' || Districts.DistrictType
FROM 	Districts WHERE Districts.DistrictType != 'DISTRICT_CITY_CENTER' AND Districts.DistrictType != 'DISTRICT_WONDER';
 */

INSERT INTO Modifiers 
	(ModifierId, ModifierType, RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
VALUES	('QUO_BIOME_NEW_WORLD_CBOMB_ALL', 'MODIFIER_PLAYER_ADJUST_ALL_DISTRICTS_CULTURE_BOMB', 0, 0, NULL, NULL) ;

-- No ModifierArguments needed

INSERT INTO TraitModifiers
	(TraitType, 			ModifierID)
VALUES	('QUO_TRAIT_BIOME_NEW_WORLD',	'QUO_BIOME_NEW_WORLD_CBOMB_ALL') ;




-- Units ignore ZOC
INSERT INTO Modifiers 
	(ModifierId, 	ModifierType, 	RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
VALUES	('QUO_BIOME_NEW_WORLD_IGNORE_ZOC', 	'MODIFIER_PLAYER_UNIT_ADJUST_IGNORE_ZOC', 0, 0, NULL, NULL) ,
	('QUO_BIOME_NEW_WORLD_IGNORE_ZOC_GLOBAL', 	'MODIFIER_PLAYER_UNITS_ATTACH_MODIFIER', 0, 0, NULL, NULL) ;


INSERT INTO ModifierArguments
	(ModifierId, 			Name, 		Type, 			Value, 					Extra, 	SecondExtra)
VALUES	('QUO_BIOME_NEW_WORLD_IGNORE_ZOC', 	'Ignore', 	'ARGTYPE_IDENTITY', 	'1',					NULL, 	NULL) ,	
	('QUO_BIOME_NEW_WORLD_IGNORE_ZOC_GLOBAL', 	'ModifierId', 	'ARGTYPE_IDENTITY', 	'QUO_BIOME_NEW_WORLD_IGNORE_ZOC',		NULL, 	NULL)  ;


INSERT INTO TraitModifiers
	(TraitType, 		ModifierId)
VALUES ('QUO_TRAIT_BIOME_NEW_WORLD',	'QUO_BIOME_NEW_WORLD_IGNORE_ZOC_GLOBAL' );


-- Units ignore rivers
INSERT INTO Modifiers 
	(ModifierId, 	ModifierType, 	RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
VALUES		('QUO_BIOME_NEW_WORLD_IGNORE_RIV', 	'MODIFIER_PLAYER_UNIT_ADJUST_IGNORE_RIVERS', 0, 0, NULL, NULL) ,
			('QUO_BIOME_NEW_WORLD_IGNORE_RIV_GLOBAL', 	'MODIFIER_PLAYER_UNITS_ATTACH_MODIFIER', 0, 0, NULL, NULL) ;


INSERT INTO ModifierArguments
	(ModifierId, 			Name, 		Type, 			Value, 					Extra, 	SecondExtra)
VALUES	 ('QUO_BIOME_NEW_WORLD_IGNORE_RIV', 	'Ignore', 	'ARGTYPE_IDENTITY', 	'1',					NULL, 	NULL) ,	
	('QUO_BIOME_NEW_WORLD_IGNORE_RIV_GLOBAL', 	'ModifierId', 	'ARGTYPE_IDENTITY', 	'QUO_BIOME_NEW_WORLD_IGNORE_RIV',		NULL, 	NULL) ;

	
INSERT INTO TraitModifiers
	(TraitType, 		ModifierId)
VALUES ('QUO_TRAIT_BIOME_NEW_WORLD',	'QUO_BIOME_NEW_WORLD_IGNORE_RIV_GLOBAL' );



		
		
-- ASIAN PACIFIC FM
UPDATE tblQuoDebug SET Message='Asian Pacific' WHERE DebugID='Quo_Biome_Code';


-- Locked borders
INSERT INTO Modifiers 
	(ModifierId, 	ModifierType, 	RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
VALUES	('QUO_BIOME_ASIAN_PACIFIC_LOCKED_BORDERS', 	'MODIFIER_PLAYER_ADJUST_ENFORCE_BORDERS', 0, 0, NULL, NULL) ;

INSERT INTO ModifierArguments
	(ModifierId, 			Name, 		Type, 			Value, 					Extra, 	SecondExtra)
VALUES	('QUO_BIOME_ASIAN_PACIFIC_LOCKED_BORDERS', 	'Enable', 	'ARGTYPE_IDENTITY', 	'1',		NULL, 	NULL) ;

INSERT INTO TraitModifiers
	(TraitType, 		ModifierId)
VALUES ('QUO_TRAIT_BIOME_ASIAN_PACIFIC',	'QUO_BIOME_ASIAN_PACIFIC_LOCKED_BORDERS' );

		
-- Building a market generates a Spy instead of a trade route, +1 route from Lighthouses
-- Ended up just going with not having Lighthouses compete with Markets
/* INSERT INTO RequirementSets 
	(RequirementSetId, 		RequirementSetType)
VALUES 	('QUO_REQSET_BIOME_ASIAN_PACIFIC_SWAP_ROUTE_FOR_SPY', 	'REQUIREMENTSET_TEST_ANY') ,
		('QUO_REQSET_BIOME_ASIAN_PACIFIC_EXTRA_LIGHTHOUSE', 	'REQUIREMENTSET_TEST_ANY') ;

INSERT INTO RequirementSetRequirements
	(RequirementSetId,	RequirementId)
VALUES	('QUO_REQSET_BIOME_ASIAN_PACIFIC_SWAP_ROUTE_FOR_SPY', 	'QUO_REQ_AUTO_CITY_HAS_BUILDING_MARKET'),
		('QUO_REQSET_BIOME_ASIAN_PACIFIC_EXTRA_LIGHTHOUSE', 	'QUO_REQ_AUTO_CITY_HAS_BUILDING_LIGHTHOUSE');

INSERT INTO Modifiers
		(ModifierID, 			ModifierType, 					RunOnce, 	Permanent, 	OwnerRequirementSetId, 	SubjectRequirementSetId)
VALUES	('QUO_BIOME_ASIAN_PACIFIC_EXTRA_SPY', 	'MODIFIER_PLAYER_GRANT_SPY', 	0, 		0, 		NULL,			NULL) ,
		('QUO_BIOME_ASIAN_PACIFIC_EXTRA_SPY_PLAYER', 	'MODIFIER_PLAYER_CITIES_ATTACH_MODIFIER', 	0, 		0, 		NULL,			'QUO_REQSET_BIOME_ASIAN_PACIFIC_SWAP_ROUTE_FOR_SPY') ,
		('QUO_BIOME_ASIAN_PACIFIC_REMOVE_TRADERS', 	'QUO_MODTYPE_PLAYER_CITIES_ENGLAND_FREE_TRADE_ROUTE', 	0, 		0, 		NULL,			'QUO_REQSET_BIOME_ASIAN_PACIFIC_SWAP_ROUTE_FOR_SPY') ,
		('QUO_BIOME_ASIAN_PACIFIC_EXTRA_TRADERS', 	'QUO_MODTYPE_PLAYER_CITIES_ENGLAND_FREE_TRADE_ROUTE', 	0, 		0, 		NULL,			'QUO_REQSET_BIOME_ASIAN_PACIFIC_EXTRA_LIGHTHOUSE') ;

INSERT INTO ModifierArguments
	(ModifierID,			Name,		Type, 				Value,			Extra)
VALUES	('QUO_BIOME_ASIAN_PACIFIC_EXTRA_SPY', 	'Amount', 	'ARGTYPE_IDENTITY', 		'1',			NULL) ,
		('QUO_BIOME_ASIAN_PACIFIC_EXTRA_SPY_PLAYER', 	'ModifierId', 	'ARGTYPE_IDENTITY', 		'QUO_BIOME_ASIAN_PACIFIC_EXTRA_SPY',			NULL) ,
		('QUO_BIOME_ASIAN_PACIFIC_REMOVE_TRADERS', 	'Amount', 	'ARGTYPE_IDENTITY', 		'-1',			NULL) ,
		('QUO_BIOME_ASIAN_PACIFIC_EXTRA_TRADERS', 	'Amount', 	'ARGTYPE_IDENTITY', 		'1',			NULL) ;

INSERT INTO TraitModifiers
	(TraitType, 				ModifierID)
VALUES	('QUO_TRAIT_BIOME_ASIAN_PACIFIC',	'QUO_BIOME_ASIAN_PACIFIC_EXTRA_SPY_PLAYER') ,
		('QUO_TRAIT_BIOME_ASIAN_PACIFIC',	'QUO_BIOME_ASIAN_PACIFIC_REMOVE_TRADERS') ,
		('QUO_TRAIT_BIOME_ASIAN_PACIFIC',	'QUO_BIOME_ASIAN_PACIFIC_EXTRA_TRADERS') ; */

		
-- Penalty for low appeal
INSERT INTO Requirements
	(RequirementId, 		RequirementType, 	Likeliness,	Inverse, 	Triggered)
VALUES	('QUO_REQ_BIOME_ASIAN_PACIFIC_APPEAL_COMBAT_PENALTY', 		'REQUIREMENT_PLOT_IS_APPEAL_BETWEEN',	0,1,0);

INSERT INTO RequirementArguments 
	(RequirementId,			Name, 			Type, 			Value, 				Extra, 	SecondExtra)
VALUES ('QUO_REQ_BIOME_ASIAN_PACIFIC_APPEAL_COMBAT_PENALTY',	'MinimumAppeal',		'ARGTYPE_IDENTITY',	0,	NULL,	NULL );

INSERT INTO RequirementSets
	(RequirementSetId, 		RequirementSetType)
VALUES ('QUO_REQSET_BIOME_ASIAN_PACIFIC_APPEAL_COMBAT_PENALTY','REQUIREMENTSET_TEST_ALL');
		
INSERT INTO RequirementSetRequirements
	(RequirementSetId,	RequirementId)
VALUES	('QUO_REQSET_BIOME_ASIAN_PACIFIC_APPEAL_COMBAT_PENALTY', 	'QUO_REQ_BIOME_ASIAN_PACIFIC_APPEAL_COMBAT_PENALTY');


INSERT INTO Modifiers 
		(ModifierId, 	ModifierType, 	RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
VALUES	('QUO_BIOME_ASIAN_PACIFIC_COMBAT_PENALTY', 'MODIFIER_PLAYER_UNITS_ADJUST_COMBAT_STRENGTH', 0, 0, NULL, 'QUO_REQSET_BIOME_ASIAN_PACIFIC_APPEAL_COMBAT_PENALTY') ;

INSERT INTO ModifierArguments
	(ModifierId, 			Name, 		Type, 			Value, 					Extra, 	SecondExtra)
VALUES	('QUO_BIOME_ASIAN_PACIFIC_COMBAT_PENALTY', 	'Amount', 	'ARGTYPE_IDENTITY', 	'-5',		NULL, 	NULL) ;

INSERT INTO TraitModifiers
		(TraitType, 			ModifierID)
VALUES	('QUO_TRAIT_BIOME_ASIAN_PACIFIC',	'QUO_BIOME_ASIAN_PACIFIC_COMBAT_PENALTY')  ;
 
INSERT INTO ModifierStrings
	(ModifierId, 		Context, Text)
VALUES	('QUO_BIOME_ASIAN_PACIFIC_COMBAT_PENALTY', 'Preview', 'QUO_LOC_BIOME_ASIAN_PACIFIC_BAD_COMBAT') ;


		
-- bonuses for fighting on high appeal tiles
CREATE TABLE tblBiomeAsianPacificAppealBreakpoints
(
	xAppealLevel text,
	xAppealMax text,
	xCombatBonus text,
	xHealAmount text,
	xYieldAmount
);


INSERT INTO tblBiomeAsianPacificAppealBreakpoints
		(xAppealLevel, xAppealMax, xCombatBonus,xHealAmount, xYieldAmount)
VALUES ('2','3','4','10','10'),('3','4','6','20','25'),('4','5','8','20','50');


-- minimum appeal
INSERT INTO Requirements
	(RequirementId, 		RequirementType, 	Likeliness,	Inverse, 	Triggered)
SELECT	'QUO_REQ_BIOME_ASIAN_PACIFIC_APPEAL_COMBAT_BONUS_' || xAppealLevel, 		'REQUIREMENT_PLOT_IS_APPEAL_BETWEEN',	0,0,0 
FROM tblBiomeAsianPacificAppealBreakpoints;


INSERT INTO RequirementArguments 
	(RequirementId,			Name, 			Type, 			Value, 				Extra, 	SecondExtra)
SELECT 'QUO_REQ_BIOME_ASIAN_PACIFIC_APPEAL_COMBAT_BONUS_' || xAppealLevel,	'MinimumAppeal',		'ARGTYPE_IDENTITY',	xAppealLevel,	NULL,	NULL 	
FROM tblBiomeAsianPacificAppealBreakpoints;


INSERT INTO RequirementSets
	(RequirementSetId, 		RequirementSetType)
SELECT 'QUO_REQSET_BIOME_ASIAN_PACIFIC_APPEAL_COMBAT_BONUS_' || xAppealLevel,'REQUIREMENTSET_TEST_ALL'
FROM tblBiomeAsianPacificAppealBreakpoints;
	
	
INSERT INTO RequirementSetRequirements
	(RequirementSetId,	RequirementId)
SELECT	'QUO_REQSET_BIOME_ASIAN_PACIFIC_APPEAL_COMBAT_BONUS_' || xAppealLevel, 	'QUO_REQ_BIOME_ASIAN_PACIFIC_APPEAL_COMBAT_BONUS_' || xAppealLevel
FROM tblBiomeAsianPacificAppealBreakpoints;


-- max appeal
-- Note that this is set up as an Inverse requirement 
INSERT INTO Requirements
	(RequirementId, 		RequirementType, 	Likeliness,	Inverse, 	Triggered)
SELECT	'QUO_REQ_BIOME_ASIAN_PACIFIC_APPEAL_COMBAT_BONUS_MAX_' || xAppealMax, 		'REQUIREMENT_PLOT_IS_APPEAL_BETWEEN',	0,1,0 
FROM tblBiomeAsianPacificAppealBreakpoints;


INSERT INTO RequirementArguments 
	(RequirementId,			Name, 			Type, 			Value, 				Extra, 	SecondExtra)
SELECT 'QUO_REQ_BIOME_ASIAN_PACIFIC_APPEAL_COMBAT_BONUS_MAX_' || xAppealMax,	'MinimumAppeal',		'ARGTYPE_IDENTITY',	xAppealMax,	NULL,	NULL 	
FROM tblBiomeAsianPacificAppealBreakpoints;
	
	
INSERT INTO RequirementSetRequirements
	(RequirementSetId,	RequirementId)
SELECT	'QUO_REQSET_BIOME_ASIAN_PACIFIC_APPEAL_COMBAT_BONUS_' || xAppealLevel, 	'QUO_REQ_BIOME_ASIAN_PACIFIC_APPEAL_COMBAT_BONUS_MAX_' || xAppealMax
FROM tblBiomeAsianPacificAppealBreakpoints;



-- combat bonus
INSERT INTO Modifiers 
	(ModifierId, ModifierType, RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
SELECT 'QUO_BIOME_ASIAN_PACIFIC_APPEAL_COMBAT_BONUS_' || xAppealLevel, 'MODIFIER_PLAYER_UNITS_ADJUST_COMBAT_STRENGTH', 0, 0, NULL, 'QUO_REQSET_BIOME_ASIAN_PACIFIC_APPEAL_COMBAT_BONUS_' || xAppealLevel
FROM tblBiomeAsianPacificAppealBreakpoints;
		
INSERT INTO ModifierArguments
	(ModifierId, 			Name, 			Type, 			Value, 				Extra, 	SecondExtra)
SELECT 'QUO_BIOME_ASIAN_PACIFIC_APPEAL_COMBAT_BONUS_' || xAppealLevel, 	'Amount', 		'ARGTYPE_IDENTITY', 	xCombatBonus,				NULL, 	NULL
FROM tblBiomeAsianPacificAppealBreakpoints;


INSERT INTO TraitModifiers
	(TraitType, 			ModifierID)
SELECT 'QUO_TRAIT_BIOME_ASIAN_PACIFIC',	'QUO_BIOME_ASIAN_PACIFIC_APPEAL_COMBAT_BONUS_' || xAppealLevel
FROM tblBiomeAsianPacificAppealBreakpoints;

--ONLY set this for the strings where the appeal level >0
-- make sure a string exists in the string tables as well 
INSERT INTO ModifierStrings
	(ModifierId, 		Context, Text)
SELECT	'QUO_BIOME_ASIAN_PACIFIC_APPEAL_COMBAT_BONUS_' || xAppealLevel, 'Preview', 'QUO_LOC_BIOME_ASIAN_PACIFIC_APPEAL_COMBAT_BONUS_' || xAppealLevel
FROM tblBiomeAsianPacificAppealBreakpoints WHERE xAppealLevel > 0;

-- the string for a tile with exactly Zero appeal
INSERT INTO ModifierStrings
	(ModifierId, 		Context, Text)
SELECT	'QUO_BIOME_ASIAN_PACIFIC_APPEAL_COMBAT_BONUS_' || xAppealLevel, 'Preview', 'QUO_LOC_BIOME_ASIAN_PACIFIC_APPEAL_COMBAT_BONUS_0'
FROM tblBiomeAsianPacificAppealBreakpoints WHERE xAppealLevel = 0;



 -- siphon health		
 -- only for tiles with appeal > 0
INSERT INTO Modifiers 
	(ModifierId, ModifierType, RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
SELECT 'QUO_BIOME_ASIAN_PACIFIC_APPEAL_HEALING_' || xAppealLevel, 'MODIFIER_PLAYER_UNITS_ADJUST_HEAL_FROM_COMBAT', 0, 0, NULL, 'QUO_REQSET_BIOME_ASIAN_PACIFIC_APPEAL_COMBAT_BONUS_' || xAppealLevel
FROM tblBiomeAsianPacificAppealBreakpoints WHERE xAppealLevel > 0;
		
INSERT INTO ModifierArguments
	(ModifierId, 			Name, 			Type, 			Value, 				Extra, 	SecondExtra)
SELECT 'QUO_BIOME_ASIAN_PACIFIC_APPEAL_HEALING_' || xAppealLevel, 	'Amount', 		'ARGTYPE_IDENTITY', 	xHealAmount,				NULL, 	NULL
FROM tblBiomeAsianPacificAppealBreakpoints WHERE xAppealLevel > 0;

INSERT INTO TraitModifiers
	(TraitType, 			ModifierID)
SELECT 'QUO_TRAIT_BIOME_ASIAN_PACIFIC',	'QUO_BIOME_ASIAN_PACIFIC_APPEAL_HEALING_' || xAppealLevel
FROM tblBiomeAsianPacificAppealBreakpoints WHERE xAppealLevel > 0;



-- siphon faith
 -- only for tiles with appeal > 0
INSERT INTO Modifiers 
	(ModifierId, ModifierType, RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
SELECT 'QUO_BIOME_ASIAN_PACIFIC_APPEAL_SIPHON_YIELD_' || xAppealLevel, 'MODIFIER_PLAYER_UNITS_ADJUST_POST_COMBAT_YIELD', 0, 0, NULL, 'QUO_REQSET_BIOME_ASIAN_PACIFIC_APPEAL_COMBAT_BONUS_' || xAppealLevel
FROM tblBiomeAsianPacificAppealBreakpoints WHERE xAppealLevel > 0;
		
INSERT INTO ModifierArguments
	(ModifierId, 			Name, 			Type, 			Value, 				Extra, 	SecondExtra)
SELECT 'QUO_BIOME_ASIAN_PACIFIC_APPEAL_SIPHON_YIELD_' || xAppealLevel, 	'PercentDefeatedStrength', 		'ARGTYPE_IDENTITY', 	xYieldAmount,				NULL, 	NULL
FROM tblBiomeAsianPacificAppealBreakpoints WHERE xAppealLevel > 0;

INSERT INTO ModifierArguments
	(ModifierId, 			Name, 			Type, 			Value, 				Extra, 	SecondExtra)
SELECT 'QUO_BIOME_ASIAN_PACIFIC_APPEAL_SIPHON_YIELD_' || xAppealLevel, 	'YieldType', 		'ARGTYPE_IDENTITY', 	'YIELD_FAITH',				NULL, 	NULL
FROM tblBiomeAsianPacificAppealBreakpoints WHERE xAppealLevel > 0;


INSERT INTO TraitModifiers
	(TraitType, 			ModifierID)
SELECT 'QUO_TRAIT_BIOME_ASIAN_PACIFIC',	'QUO_BIOME_ASIAN_PACIFIC_APPEAL_SIPHON_YIELD_' || xAppealLevel
FROM tblBiomeAsianPacificAppealBreakpoints WHERE xAppealLevel > 0;


 
-- pacific harbor
/*INSERT INTO Types
	(Type, 				Kind)
VALUES 	('QUO_DISTRICT_BIOME_ASIAN_PACIFIC_HARBOR',	'KIND_DISTRICT'	) ,
		('QUO_TRAIT_BIOME_ASIAN_PACIFIC_BUILD_HARBOR', 	'KIND_TRAIT') ;

INSERT INTO Traits 
	(TraitType,				Name,							Description,						InternalOnly)
VALUES ('QUO_TRAIT_BIOME_ASIAN_PACIFIC_BUILD_HARBOR',	NULL,		NULL,	0) ;


INSERT INTO Districts (
                          DistrictType,
                          Name,
                          PrereqTech,
                          PrereqCivic,
                          Coast,
                          Description,
                          Cost,
                          RequiresPlacement,
                          RequiresPopulation,
                          NoAdjacentCity,
                          CityCenter,
                          Aqueduct,
                          InternalOnly,
                          ZOC,
                          FreeEmbark,
                          HitPoints,
                          CaptureRemovesBuildings,
                          CaptureRemovesCityDefenses,
                          PlunderType,
                          PlunderAmount,
                          TradeEmbark,
                          MilitaryDomain,
                          CostProgressionModel,
                          CostProgressionParam1,
                          TraitType,
                          Appeal,
                          Housing,
                          Entertainment,
                          OnePerCity,
                          AllowsHolyCity,
                          Maintenance,
                          AirSlots,
                          CitizenSlots,
                          TravelTime,
                          CityStrengthModifier,
                          AdjacentToLand,
                          CanAttack,
                          AdvisorType,
                          CaptureRemovesDistrict,
                          MaxPerPlayer
                      )
                      VALUES (
                          'QUO_DISTRICT_BIOME_ASIAN_PACIFIC_HARBOR', --'DistrictType',
                          'LOC_QUO_DISTRICT_BIOME_ASIAN_PACIFIC_HARBOR_NAME', --'Name',
                          'TECH_CELESTIAL_NAVIGATION', --'PrereqTech',
                          NULL, --'PrereqCivic',
                          1, --'Coast',
                          'LOC_QUO_DISTRICT_BIOME_ASIAN_PACIFIC_HARBOR_DESCRIPTION', --'Description',
                          27, --'Cost',
                          1, --'RequiresPlacement',
                          1, --'RequiresPopulation',
                          0, --'NoAdjacentCity',
                          0, --'CityCenter',
                          0, --'Aqueduct',
                          0, --'InternalOnly',
                          0, --'ZOC',
                          1, --'FreeEmbark',
                          0, --'HitPoints',
                          0, --'CaptureRemovesBuildings',
                          0, --'CaptureRemovesCityDefenses',
                          'PLUNDER_GOLD', --'PlunderType',
                          50, --'PlunderAmount',
                          1, --'TradeEmbark',
                          'DOMAIN_SEA', --'MilitaryDomain',
                          'COST_PROGRESSION_NUM_UNDER_AVG_PLUS_TECH', --'CostProgressionModel',
                          40, --'CostProgressionParam1',
                          'QUO_TRAIT_BIOME_ASIAN_PACIFIC_BUILD_HARBOR', --'TraitType',
                          0, --'Appeal',
                          0, --'Housing',
                          0, --'Entertainment',
                          1, --'OnePerCity',
                          0, --'AllowsHolyCity',
                          0, --'Maintenance',
                          0, --'AirSlots',
                          0, --'CitizenSlots',
                          2, --'TravelTime',
                          2, --'CityStrengthModifier',
                          0, --'AdjacentToLand',
                          0, --'CanAttack',
                          'ADVISOR_GENERIC', --'AdvisorType',
                          1, --'CaptureRemovesDistrict',
                          -1 --'MaxPerPlayer'
                      );



INSERT INTO DistrictReplaces
		(CivUniqueDistrictType, ReplacesDistrictType)
VALUES	('QUO_DISTRICT_BIOME_ASIAN_PACIFIC_HARBOR', 'DISTRICT_HARBOR');


-- fix the Shipyard adjacencies for various policies and systems

-- Shipyards
INSERT INTO Building_YieldDistrictCopies
	(BuildingType, OldYieldType, NewYieldType)
VALUES ('BUILDING_SHIPYARD', 'YIELD_CULTURE', 'YIELD_PRODUCTION');


-- Fix adjacencies in governors, policies
INSERT INTO Modifiers 
	(ModifierId, 	ModifierType, 	RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
VALUES	('QUO_BIOME_ASIAN_PACIFIC_FIX_HARBOR_ADJACENCIES_100', 	'MODIFIER_CITY_DISTRICTS_ADJUST_YIELD_MODIFIER', 0, 0, NULL, 'DISTRICT_IS_HARBOR') ;

INSERT INTO ModifierArguments
	(ModifierId, 			Name, 		Type, 			Value, 					Extra, 	SecondExtra)
VALUES	('QUO_BIOME_ASIAN_PACIFIC_FIX_HARBOR_ADJACENCIES_100', 	'Amount', 	'ARGTYPE_IDENTITY', 	'100',		NULL, 	NULL) ,
		('QUO_BIOME_ASIAN_PACIFIC_FIX_HARBOR_ADJACENCIES_100', 	'YieldType', 	'ARGTYPE_IDENTITY', 	'YIELD_CULTURE',		NULL, 	NULL) ;

--governors
INSERT INTO GovernorPromotionModifiers
	(GovernorPromotionType, ModifierId)
VALUES	('GOVERNOR_PROMOTION_MERCHANT_HARBORMASTER','QUO_BIOME_ASIAN_PACIFIC_FIX_HARBOR_ADJACENCIES_100');

--policies
/* this policy was removed by firaxis */
/*INSERT INTO PolicyModifiers
	(PolicyType, ModifierId)
VALUES	('POLICY_NAVAL_INFRASTRUCTURE','QUO_BIOME_ASIAN_PACIFIC_FIX_HARBOR_ADJACENCIES_100');
*/
		


--give the trait to appropriate civs. 
/*INSERT INTO CivilizationTraits 
	(CivilizationType, TraitType)
SELECT tempCivilizationType, 'QUO_TRAIT_BIOME_ASIAN_PACIFIC_BUILD_HARBOR'
FROM tblTempCivilizationTraits WHERE tempCivilizationType IN (SELECT tempCivilizationType FROM tblTempCivilizationTraits WHERE tempTraitType = 'QUO_TRAIT_BIOME_ASIAN_PACIFIC') 
	AND EXISTS (SELECT 1 FROM Civilizations WHERE CivilizationType = tempCivilizationType)
    AND EXISTS (SELECT 1 FROM tblQuoOptions WHERE OptionId='QUO_OPTION_ENABLE_BIOMES' AND Value > 0) ;


INSERT INTO Adjacency_YieldChanges 
		(ID,										Description,											YieldType,		YieldChange,	TilesRequired,	OtherDistrictAdjacent,	AdjacentSeaResource,	AdjacentTerrain,	AdjacentFeature,	AdjacentRiver,	AdjacentWonder,	AdjacentNaturalWonder,	AdjacentImprovement,		AdjacentDistrict,	PrereqCivic,	PrereqTech,	ObsoleteCivic,	ObsoleteTech,	AdjacentResource, Self)
VALUES	('QUO_DISTRICT_BIOME_ASIAN_PACIFIC_HARBOR_adjacency',	'QUO_LOC_BIOME_ASIAN_PACIFIC_HARBOR_ADJ_DESCRIPTION',	'YIELD_CULTURE',	1,				1,				0,						1,						NULL,				NULL,			0,		0,		0,			NULL,	NULL,			NULL,		NULL,		NULL,		NULL,		0, 0)  ,	
		('QUO_DISTRICT_BIOME_ASIAN_PACIFIC_HARBOR_adj_reef',	'QUO_LOC_BIOME_ASIAN_PACIFIC_HARBOR_ADJ_REEF_DESCRIPTION',	'YIELD_CULTURE',	1,				1,				0,						0,						NULL,				'FEATURE_REEF',			0,		0,		0,			NULL,	NULL,			NULL,		NULL,		NULL,		NULL,		0,0 )  ,	
		('QUO_DISTRICT_BIOME_ASIAN_PACIFIC_HARBOR_base',	'QUO_LOC_BIOME_ASIAN_PACIFIC_HARBOR_BASE_DESCRIPTION',	'YIELD_CULTURE',	2,				1,				0,						0,						NULL,				NULL,			0,		0,		0,			NULL,	NULL,			NULL,		NULL,		NULL,		NULL,		0,1)  ;	

		
INSERT INTO District_Adjacencies (DistrictType,YieldChangeId)
VALUES 	('QUO_DISTRICT_BIOME_ASIAN_PACIFIC_HARBOR', 'QUO_DISTRICT_BIOME_ASIAN_PACIFIC_HARBOR_adjacency'),
		('QUO_DISTRICT_BIOME_ASIAN_PACIFIC_HARBOR', 'QUO_DISTRICT_BIOME_ASIAN_PACIFIC_HARBOR_adj_reef'),
		('QUO_DISTRICT_BIOME_ASIAN_PACIFIC_HARBOR', 'QUO_DISTRICT_BIOME_ASIAN_PACIFIC_HARBOR_base');
		

INSERT INTO District_CitizenYieldChanges (DistrictType,YieldType,YieldChange)
VALUES 	('QUO_DISTRICT_BIOME_ASIAN_PACIFIC_HARBOR','YIELD_CULTURE','2'),
		('QUO_DISTRICT_BIOME_ASIAN_PACIFIC_HARBOR','YIELD_SCIENCE','1');


INSERT INTO District_GreatPersonPoints (DistrictType,GreatPersonClassType,PointsPerTurn)
VALUES ('QUO_DISTRICT_BIOME_ASIAN_PACIFIC_HARBOR','GREAT_PERSON_CLASS_ADMIRAL',1),
		('QUO_DISTRICT_BIOME_ASIAN_PACIFIC_HARBOR','GREAT_PERSON_CLASS_WRITER',1),
		('QUO_DISTRICT_BIOME_ASIAN_PACIFIC_HARBOR','GREAT_PERSON_CLASS_ARTIST',1),
		('QUO_DISTRICT_BIOME_ASIAN_PACIFIC_HARBOR','GREAT_PERSON_CLASS_MUSICIAN',1);
		
INSERT INTO District_TradeRouteYields (DistrictType,YieldType,YieldChangeAsOrigin,YieldChangeAsDomesticDestination,YieldChangeAsInternationalDestination)
VALUES ('QUO_DISTRICT_BIOME_ASIAN_PACIFIC_HARBOR','YIELD_PRODUCTION',0,1,0),
		('QUO_DISTRICT_BIOME_ASIAN_PACIFIC_HARBOR','YIELD_GOLD',0,0,3);

/* INSERT INTO District_ValidTerrains
		(DistrictType, TerrainType)
VALUES	('QUO_DISTRICT_BIOME_ASIAN_PACIFIC_HARBOR', 'TERRAIN_OCEAN'),
		('QUO_DISTRICT_BIOME_ASIAN_PACIFIC_HARBOR', 'TERRAIN_COAST');
 */



-- Cannot propose trade deals or send diplomats until the Industrial era
INSERT INTO RequirementSets 
		(RequirementSetId, 		RequirementSetType)
VALUES 	('QUO_REQSET_BIOME_ASIAN_PACIFIC_UNLOCK_DIPLO', 	'REQUIREMENTSET_TEST_ALL') ;

 INSERT INTO RequirementSetRequirements
	(RequirementSetId,	RequirementId)
VALUES	('QUO_REQSET_BIOME_ASIAN_PACIFIC_UNLOCK_DIPLO', 	'QUO_REQ_GLOBAL_ERA_NOT_YET_INDUSTRIAL') ;


INSERT INTO Modifiers
	(ModifierID, 			ModifierType, 					RunOnce, 	Permanent, 	OwnerRequirementSetId, 	SubjectRequirementSetId)
VALUES	('QUO_BIOME_ASIAN_PACIFIC_NO_FRIENDS', 	'MODIFIER_PLAYER_ADJUST_BANNED_DIPLOMATIC_ACTION', 	0, 		0, 		NULL,			'QUO_REQSET_BIOME_ASIAN_PACIFIC_UNLOCK_DIPLO') ,
		('QUO_BIOME_ASIAN_PACIFIC_NO_DEALS', 	'MODIFIER_PLAYER_ADJUST_BANNED_DIPLOMATIC_ACTION', 	0, 		0, 		NULL,			'QUO_REQSET_BIOME_ASIAN_PACIFIC_UNLOCK_DIPLO') ;


INSERT INTO ModifierArguments
	(ModifierID,			Name,			Type, 			Value,			Extra)
VALUES	('QUO_BIOME_ASIAN_PACIFIC_NO_FRIENDS', 	'Banned', 	'ARGTYPE_IDENTITY', 	'1',	NULL) ,
		('QUO_BIOME_ASIAN_PACIFIC_NO_FRIENDS', 	'DiplomaticActionType', 	'ARGTYPE_IDENTITY', 	'DIPLOACTION_DIPLOMATIC_DELEGATION',	NULL) ,
		
		('QUO_BIOME_ASIAN_PACIFIC_NO_DEALS', 	'Banned', 	'ARGTYPE_IDENTITY', 	'1',	NULL) ,
		('QUO_BIOME_ASIAN_PACIFIC_NO_DEALS', 	'DiplomaticActionType', 	'ARGTYPE_IDENTITY', 	'DIPLOACTION_PROPOSE_TRADE',	NULL) ;
		
INSERT INTO TraitModifiers
	(TraitType, 				ModifierID)
VALUES	('QUO_TRAIT_BIOME_ASIAN_PACIFIC',		'QUO_BIOME_ASIAN_PACIFIC_NO_FRIENDS')  ,
		('QUO_TRAIT_BIOME_ASIAN_PACIFIC',		'QUO_BIOME_ASIAN_PACIFIC_NO_DEALS')  ;




-- Appeal from Volcanoes
-- new in Gathering Storm

INSERT INTO Modifiers 
	(ModifierId, ModifierType, RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
VALUES	('QUO_BIOME_ASIAN_PACIFIC_APPEAL_VOLCANO', 'MODIFIER_PLAYER_CITIES_ADJUST_FEATURE_APPEAL_MODIFIER', 0, 0, NULL, NULL)   ;

INSERT INTO ModifierArguments
		(ModifierId, 			Name, 		Type, 			Value, 			Extra, 	SecondExtra)
VALUES	('QUO_BIOME_ASIAN_PACIFIC_APPEAL_VOLCANO', 	'FeatureType', 	'ARGTYPE_IDENTITY', 	'FEATURE_VOLCANO',			NULL, 	NULL) ,
		('QUO_BIOME_ASIAN_PACIFIC_APPEAL_VOLCANO', 	'Amount', 	'ARGTYPE_IDENTITY', 	'3',			NULL, 	NULL) ;

		
INSERT INTO TraitModifiers
		(TraitType, 			ModifierID)
VALUES	('QUO_TRAIT_BIOME_ASIAN_PACIFIC',	'QUO_BIOME_ASIAN_PACIFIC_APPEAL_VOLCANO')  ;		 




-- ASIAN STEPPE / nomadic asia
UPDATE tblQuoDebug SET Message='Asian Steppe' WHERE DebugID='Quo_Biome_Code';

INSERT INTO Requirements
	(RequirementId, 		RequirementType, 	Likeliness,	Inverse, 	Triggered)
VALUES	('QUO_REQ_BIOME_ASIAN_STEPPE_GRASS_HILLS', 		'REQUIREMENT_PLOT_TERRAIN_TYPE_MATCHES',	0,0,0) ,
		('QUO_REQ_BIOME_ASIAN_STEPPE_PLAINS_HILLS', 		'REQUIREMENT_PLOT_TERRAIN_TYPE_MATCHES',	0,0,0) ,
		('QUO_REQ_BIOME_ASIAN_STEPPE_GRASS_NO_HILLS', 		'REQUIREMENT_PLOT_TERRAIN_TYPE_MATCHES',	0,0,0) ,
		('QUO_REQ_BIOME_ASIAN_STEPPE_PLAINS_NO_HILLS', 		'REQUIREMENT_PLOT_TERRAIN_TYPE_MATCHES',	0,0,0) ;
		

INSERT INTO RequirementArguments 
	(RequirementId,			Name, 			Type, 			Value, 				Extra, 	SecondExtra)
VALUES 	('QUO_REQ_BIOME_ASIAN_STEPPE_GRASS_HILLS',	'TerrainType',		'ARGTYPE_IDENTITY',	'TERRAIN_GRASS_HILLS',	NULL,	NULL 	) ,
		('QUO_REQ_BIOME_ASIAN_STEPPE_PLAINS_HILLS',	'TerrainType',		'ARGTYPE_IDENTITY',	'TERRAIN_PLAINS_HILLS',	NULL,	NULL 	) ,
		('QUO_REQ_BIOME_ASIAN_STEPPE_GRASS_NO_HILLS',	'TerrainType',		'ARGTYPE_IDENTITY',	'TERRAIN_GRASS',	NULL,	NULL 	) ,
		('QUO_REQ_BIOME_ASIAN_STEPPE_PLAINS_NO_HILLS',	'TerrainType',		'ARGTYPE_IDENTITY',	'TERRAIN_PLAINS',	NULL,	NULL 	) ;

		
INSERT INTO RequirementSets 
	(RequirementSetId, 		RequirementSetType)
VALUES 	('QUO_REQSET_BIOME_ASIAN_STEPPE_HILLS', 	'REQUIREMENTSET_TEST_ANY') ,
		('QUO_REQSET_BIOME_ASIAN_STEPPE_NOT_HILLS', 	'REQUIREMENTSET_TEST_ANY') ;


INSERT INTO RequirementSetRequirements
	(RequirementSetId,	RequirementId)
VALUES	 ('QUO_REQSET_BIOME_ASIAN_STEPPE_HILLS', 	'QUO_REQ_BIOME_ASIAN_STEPPE_GRASS_HILLS') ,
		('QUO_REQSET_BIOME_ASIAN_STEPPE_HILLS', 	'QUO_REQ_BIOME_ASIAN_STEPPE_PLAINS_HILLS') ,
		('QUO_REQSET_BIOME_ASIAN_STEPPE_NOT_HILLS', 	'QUO_REQ_BIOME_ASIAN_STEPPE_GRASS_NO_HILLS') ,
		('QUO_REQSET_BIOME_ASIAN_STEPPE_NOT_HILLS', 	'QUO_REQ_BIOME_ASIAN_STEPPE_PLAINS_NO_HILLS') ;



INSERT INTO Modifiers 
	(ModifierId, ModifierType, RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
VALUES	('QUO_BIOME_ASIAN_STEPPE_NONHILL', 'MODIFIER_PLAYER_ADJUST_PLOT_YIELD', 0, 0, NULL, 'QUO_REQSET_BIOME_ASIAN_STEPPE_NOT_HILLS')  ,
		('QUO_BIOME_ASIAN_STEPPE_HILL', 'MODIFIER_PLAYER_ADJUST_PLOT_YIELD', 0, 0, NULL, 'QUO_REQSET_BIOME_ASIAN_STEPPE_HILLS')  ;
 
INSERT INTO ModifierArguments
		(ModifierId, 			Name, 		Type, 			Value, 			Extra, 	SecondExtra)
VALUES	('QUO_BIOME_ASIAN_STEPPE_NONHILL', 	'YieldType', 	'ARGTYPE_IDENTITY', 	'YIELD_PRODUCTION',			NULL, 	NULL) ,
		('QUO_BIOME_ASIAN_STEPPE_NONHILL', 	'Amount', 	'ARGTYPE_IDENTITY', 	'1',			NULL, 	NULL) ,
		('QUO_BIOME_ASIAN_STEPPE_HILL', 	'YieldType', 	'ARGTYPE_IDENTITY', 	'YIELD_PRODUCTION',			NULL, 	NULL) ,
		('QUO_BIOME_ASIAN_STEPPE_HILL', 	'Amount', 	'ARGTYPE_IDENTITY', 	'-1',			NULL, 	NULL) ;
		
INSERT INTO TraitModifiers
		(TraitType, 			ModifierID)
VALUES	('QUO_TRAIT_BIOME_ASIAN_STEPPE',	'QUO_BIOME_ASIAN_STEPPE_NONHILL') ,
		('QUO_TRAIT_BIOME_ASIAN_STEPPE',	'QUO_BIOME_ASIAN_STEPPE_HILL') ;


-- special project to move the capital
INSERT INTO Types 
	(Type, 					Kind)
VALUES 	('QUO_PROJECT_BIOME_ASIAN_EXPANSE_MOVE_CAPITAL', 		'KIND_PROJECT') ;


INSERT INTO Projects
	(ProjectType, 			Name,				ShortName,				Description,					Cost,	PrereqTech,		MaxPlayerInstances,	PrereqDistrict)
VALUES ('QUO_PROJECT_BIOME_ASIAN_EXPANSE_MOVE_CAPITAL',	'QUO_PROJECT_BIOME_ASIAN_EXPANSE_MOVE_CAPITAL_NAME',	'QUO_PROJECT_BIOME_ASIAN_EXPANSE_MOVE_CAPITAL_SHORT_NAME',	'QUO_PROJECT_BIOME_ASIAN_EXPANSE_MOVE_CAPITAL_DESCRIPTION',		70,	NULL,	NULL,			'DISTRICT_CITY_CENTER');


-- this new table in expansion 2 lets us limit the project so it is only enabled once we activate an effect
INSERT INTO Projects_XP2 (
                             ProjectType,
                             RequiredPowerWhileActive,
                             ReligiousPressureModifier,
                             UnlocksFromEffect,
                             RequiredBuilding,
                             CreateBuilding,
                             FullyPoweredWhileActive,
                             MaxSimultaneousInstances
                         )
                         VALUES (
                             'QUO_PROJECT_BIOME_ASIAN_EXPANSE_MOVE_CAPITAL',
                             0,  --'RequiredPowerWhileActive',
                             0, -- 'ReligiousPressureModifier',
                             1, -- 'UnlocksFromEffect',
                             NULL, --'RequiredBuilding',
                             'QUO_BUILDING_BEDROCK_ANCIENT', -- WE ARE DOING THIS TO FORCE THE CREATION OF BEDROCK 'CreateBuilding',
                             0, --'FullyPoweredWhileActive',
                             1  --'MaxSimultaneousInstances'
                         );	
	

-- code to enable the effect that enables the special rproject for this sphere
INSERT INTO Types
	(Type, 				Kind)
VALUES 	('QUO_MODTYPE_BIOME_ASIAN_EXPANSE_MAKE_PROJECT_AVAIL',	'KIND_MODIFIER'	) ;

INSERT INTO DynamicModifiers
		(ModifierType, CollectionType, EffectType)
VALUES 	('QUO_MODTYPE_BIOME_ASIAN_EXPANSE_MAKE_PROJECT_AVAIL', 'COLLECTION_OWNER','EFFECT_ADD_PLAYER_PROJECT_AVAILABILITY');


INSERT INTO Modifiers 
	(ModifierId, ModifierType, RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
VALUES	('QUO_BIOME_ASIAN_EXPANSE_ENABLE_PROJECT', 'QUO_MODTYPE_BIOME_ASIAN_EXPANSE_MAKE_PROJECT_AVAIL', 0, 0, NULL, NULL) ;

INSERT INTO ModifierArguments
	(ModifierId, 			Name, 		Type, 			Value, 			Extra, 	SecondExtra)
VALUES	('QUO_BIOME_ASIAN_EXPANSE_ENABLE_PROJECT', 	'ProjectType', 	'ARGTYPE_IDENTITY', 	'QUO_PROJECT_BIOME_ASIAN_EXPANSE_MOVE_CAPITAL',			NULL, 	NULL) ;


INSERT INTO TraitModifiers
	(TraitType, 			ModifierID)
VALUES	('QUO_TRAIT_BIOME_ASIAN_STEPPE',	'QUO_BIOME_ASIAN_EXPANSE_ENABLE_PROJECT') ;



-- the modifier at the player level that allows Capital moving to happen when the project finishes
INSERT INTO Modifiers 
	(ModifierId, ModifierType, RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
VALUES	('QUO_BIOME_ASIAN_STEPPE_MOVE_CAPITAL_ON_PROJ_COMPLETE_PLAYER', 'MODIFIER_PLAYER_ADJUST_CAPITAL', 0, 0, NULL, NULL)   ;
 
INSERT INTO ModifierArguments
		(ModifierId, 			Name, 		Type, 			Value, 			Extra, 	SecondExtra)
VALUES	('QUO_BIOME_ASIAN_STEPPE_MOVE_CAPITAL_ON_PROJ_COMPLETE_PLAYER', 	'ProjectType', 	'ARGTYPE_IDENTITY', 	'QUO_PROJECT_BIOME_ASIAN_EXPANSE_MOVE_CAPITAL',			NULL, 	NULL)  ;
		
INSERT INTO TraitModifiers
		(TraitType, 			ModifierID)
VALUES	('QUO_TRAIT_BIOME_ASIAN_STEPPE',	'QUO_BIOME_ASIAN_STEPPE_MOVE_CAPITAL_ON_PROJ_COMPLETE_PLAYER') ;



-- Cannot build Government Plaza
INSERT INTO ExcludedDistricts 
		(DistrictType,			TraitType)
VALUES 	('DISTRICT_GOVERNMENT',	'QUO_TRAIT_BIOME_ASIAN_STEPPE') ;


-- Free Governor at various points in civic tree
create table tblQuoASIAN_STEPPEGovernorPoints as
select civictype, modifierid from civicmodifiers
where modifierid in ('CIVIC_AWARD_TWO_INFLUENCE_TOKENS','CIVIC_AWARD_THREE_INFLUENCE_TOKENS');


INSERT INTO Requirements
	(RequirementId, 		RequirementType, 	Likeliness,	Inverse, 	Triggered)
SELECT	'QUO_REQ_BIOME_ASIAN_STEPPE_GOVERNOR_' || RowId,		'REQUIREMENT_PLAYER_HAS_CIVIC',	0,0,0
FROM tblQuoASIAN_STEPPEGovernorPoints;


INSERT INTO RequirementArguments 
	(RequirementId,			Name, 			Type, 			Value, 				Extra, 	SecondExtra)
SELECT 	'QUO_REQ_BIOME_ASIAN_STEPPE_GOVERNOR_' || RowId,	'CivicType',		'ARGTYPE_IDENTITY',	CivicType,	NULL,	NULL 	
FROM tblQuoASIAN_STEPPEGovernorPoints;

		
INSERT INTO RequirementSets 
	(RequirementSetId, 		RequirementSetType)
SELECT 	'QUO_REQSET_BIOME_ASIAN_STEPPE_GOVERNOR_' || RowId, 	'REQUIREMENTSET_TEST_ALL'
FROM tblQuoASIAN_STEPPEGovernorPoints;


INSERT INTO RequirementSetRequirements
	(RequirementSetId,	RequirementId)
SELECT 'QUO_REQSET_BIOME_ASIAN_STEPPE_GOVERNOR_' || RowId, 	'QUO_REQ_BIOME_ASIAN_STEPPE_GOVERNOR_' || RowId
FROM tblQuoASIAN_STEPPEGovernorPoints;


INSERT INTO Modifiers 
	(ModifierId, ModifierType, RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
SELECT 'QUO_BIOME_ASIAN_STEPPE_FREE_GOVERNOR_' || RowId, 'MODIFIER_PLAYER_ADJUST_GOVERNOR_POINTS', 0, 0, NULL, 'QUO_REQSET_BIOME_ASIAN_STEPPE_GOVERNOR_' || RowId
FROM tblQuoASIAN_STEPPEGovernorPoints;


INSERT INTO ModifierArguments
	(ModifierId, 			Name, 		Type, 			Value, 			Extra, 	SecondExtra)
SELECT	'QUO_BIOME_ASIAN_STEPPE_FREE_GOVERNOR_' || RowId, 	'Delta', 	'ARGTYPE_IDENTITY', 	'1',			NULL, 	NULL   
	FROM tblQuoASIAN_STEPPEGovernorPoints;

INSERT INTO TraitModifiers
	(TraitType, 			ModifierID)
SELECT 'QUO_TRAIT_BIOME_ASIAN_STEPPE',	'QUO_BIOME_ASIAN_STEPPE_FREE_GOVERNOR_' || RowId
	FROM tblQuoASIAN_STEPPEGovernorPoints;




-- Resource bonuses impact nearby tiles
INSERT INTO Tags 
	(Tag, 				Vocabulary)
VALUES 	('QUO_BIOME_ASIAN_STEPPE_YIELD_GOLD_CLASS',	'RESOURCE_CLASS'	) ,
		('QUO_BIOME_ASIAN_STEPPE_YIELD_CULTURE_CLASS',	'RESOURCE_CLASS'	) ,
		('QUO_BIOME_ASIAN_STEPPE_YIELD_SCIENCE_CLASS',	'RESOURCE_CLASS'	) ,
		('QUO_BIOME_ASIAN_STEPPE_YIELD_FAITH_CLASS',	'RESOURCE_CLASS'	) ;


create table tblQuoBiomeASIAN_STEPPEResources as
select resourcetype, yieldtype from resources
left join resource_yieldchanges using (resourcetype)
where resourceclasstype ='RESOURCECLASS_LUXURY' AND resource_yieldchanges.YieldType IN ('YIELD_GOLD', 'YIELD_CULTURE', 'YIELD_FAITH', 'YIELD_SCIENCE');

		
INSERT INTO TypeTags
	(Type, 	Tag)
SELECT	tblQuoBiomeASIAN_STEPPEResources.resourcetype, 'QUO_BIOME_ASIAN_STEPPE_' || tblQuoBiomeASIAN_STEPPEResources.YieldType ||'_CLASS' 
FROM tblQuoBiomeASIAN_STEPPEResources;


INSERT INTO Requirements
	(RequirementId, 		RequirementType, 	Likeliness,	Inverse, 	Triggered)
VALUES	('QUO_REQ_ASIAN_STEPPE_ADJACENT_CITY_CENTER', 	'REQUIREMENT_PLOT_ADJACENT_DISTRICT_TYPE_MATCHES',	0,0,0) ,
		('QUO_REQ_ASIAN_STEPPE_ON_CITY_CENTER', 	'REQUIREMENT_PLOT_ADJACENT_DISTRICT_TYPE_MATCHES',	0,0,0) ,
		('QUO_REQ_BIOME_ASIAN_STEPPE_CITY_POP', 		'REQUIREMENT_CITY_HAS_X_POPULATION',	0,0,0) ,
		('QUO_REQ_BIOME_ASIAN_STEPPE_PLOT_ANY_RESOURCE', 		'REQUIREMENT_PLOT_RESOURCE_CLASS_TYPE_MATCHES',	0,0,0) ,
		
		('QUO_REQ_ASIAN_STEPPE_ON_LUX_GOLD', 	'REQUIREMENT_PLOT_RESOURCE_TAG_MATCHES',	0,0,0) ,
		('QUO_REQ_ASIAN_STEPPE_ON_LUX_CULT', 	'REQUIREMENT_PLOT_RESOURCE_TAG_MATCHES',	0,0,0) ,
		('QUO_REQ_ASIAN_STEPPE_ON_LUX_SCI', 	'REQUIREMENT_PLOT_RESOURCE_TAG_MATCHES',	0,0,0) ,
		('QUO_REQ_ASIAN_STEPPE_ON_LUX_FAI', 	'REQUIREMENT_PLOT_RESOURCE_TAG_MATCHES',	0,0,0) ,
		
		('QUO_REQ_ASIAN_STEPPE_HAS_ANCIENT_BEDROCK', 	'REQUIREMENT_CITY_HAS_BUILDING',	0,0,0) ,
		('QUO_REQ_ASIAN_STEPPE_HAS_MEDIEVAL_BEDROCK', 	'REQUIREMENT_CITY_HAS_BUILDING',	0,0,0) ,
		('QUO_REQ_ASIAN_STEPPE_HAS_REN_BEDROCK', 	'REQUIREMENT_CITY_HAS_BUILDING',	0,0,0) ,
		('QUO_REQ_ASIAN_STEPPE_HAS_IMPROVEMENT', 	'REQUIREMENT_PLOT_HAS_ANY_IMPROVEMENT',	0,0,0) ;

		
INSERT INTO RequirementArguments 
		(RequirementId,			Name, 			Type, 			Value, 		Extra, 	SecondExtra)
VALUES 	('QUO_REQ_ASIAN_STEPPE_ADJACENT_CITY_CENTER',	'DistrictType',		'ARGTYPE_IDENTITY',		'DISTRICT_CITY_CENTER',	NULL,	NULL 	)  ,
		('QUO_REQ_ASIAN_STEPPE_ADJACENT_CITY_CENTER',	'MaxRange',		'ARGTYPE_IDENTITY',		'1',	NULL,	NULL 	) ,
		('QUO_REQ_ASIAN_STEPPE_ADJACENT_CITY_CENTER',	'MinRange',		'ARGTYPE_IDENTITY',		'0',	NULL,	NULL 	) ,
		('QUO_REQ_BIOME_ASIAN_STEPPE_CITY_POP',	'Amount',		'ARGTYPE_IDENTITY',	'6',	NULL,	NULL 	) ,
		('QUO_REQ_BIOME_ASIAN_STEPPE_PLOT_ANY_RESOURCE',	'ResourceClassType',		'ARGTYPE_IDENTITY',	'RESOURCECLASS_BONUS',	NULL,	NULL 	) ,
		
		('QUO_REQ_ASIAN_STEPPE_ON_LUX_GOLD',	'Tag',		'ARGTYPE_IDENTITY',		'QUO_BIOME_ASIAN_STEPPE_YIELD_GOLD_CLASS',	NULL,	NULL 	) ,		
		('QUO_REQ_ASIAN_STEPPE_ON_LUX_CULT',	'Tag',		'ARGTYPE_IDENTITY',		'QUO_BIOME_ASIAN_STEPPE_YIELD_CULTURE_CLASS',	NULL,	NULL 	) ,		
		('QUO_REQ_ASIAN_STEPPE_ON_LUX_SCI',	'Tag',		'ARGTYPE_IDENTITY',		'QUO_BIOME_ASIAN_STEPPE_YIELD_SCIENCE_CLASS',	NULL,	NULL 	) ,		
		('QUO_REQ_ASIAN_STEPPE_ON_LUX_FAI',	'Tag',		'ARGTYPE_IDENTITY',		'QUO_BIOME_ASIAN_STEPPE_YIELD_FAITH_CLASS',	NULL,	NULL 	) ,
		
		('QUO_REQ_ASIAN_STEPPE_HAS_ANCIENT_BEDROCK',	'BuildingType',		'ARGTYPE_IDENTITY',		'QUO_BUILDING_BEDROCK_ANCIENT',	NULL,	NULL 	) ,
		('QUO_REQ_ASIAN_STEPPE_HAS_MEDIEVAL_BEDROCK',	'BuildingType',		'ARGTYPE_IDENTITY',		'QUO_BUILDING_BEDROCK_MEDIEVAL',	NULL,	NULL 	) ,
		('QUO_REQ_ASIAN_STEPPE_HAS_REN_BEDROCK',	'BuildingType',		'ARGTYPE_IDENTITY',		'QUO_BUILDING_BEDROCK_RENAISSANCE',	NULL,	NULL 	) ;
		
		

INSERT INTO RequirementSets 
		(RequirementSetId, 		RequirementSetType)
VALUES 	('QUO_REQSET_ASIAN_STEPPE_LUX_GOLD', 	'REQUIREMENTSET_TEST_ALL') ,
		('QUO_REQSET_ASIAN_STEPPE_LUX_CULT', 	'REQUIREMENTSET_TEST_ALL') ,
		('QUO_REQSET_ASIAN_STEPPE_LUX_SCI', 	'REQUIREMENTSET_TEST_ALL') ,
		('QUO_REQSET_ASIAN_STEPPE_LUX_FAI', 	'REQUIREMENTSET_TEST_ALL') ,
		
		('QUO_REQSET_ASIAN_STEPPE_CITY_CAP_REQS', 	'REQUIREMENTSET_TEST_ALL') ;
		

INSERT INTO RequirementSetRequirements
	(RequirementSetId,	RequirementId)
VALUES	('QUO_REQSET_ASIAN_STEPPE_LUX_GOLD', 	'QUO_REQ_ASIAN_STEPPE_ON_LUX_GOLD') ,
		('QUO_REQSET_ASIAN_STEPPE_LUX_GOLD', 	'QUO_REQ_ASIAN_STEPPE_HAS_IMPROVEMENT') ,
		
		('QUO_REQSET_ASIAN_STEPPE_LUX_CULT', 	'QUO_REQ_ASIAN_STEPPE_ON_LUX_CULT') ,
		('QUO_REQSET_ASIAN_STEPPE_LUX_CULT', 	'QUO_REQ_ASIAN_STEPPE_HAS_IMPROVEMENT') ,
		
		('QUO_REQSET_ASIAN_STEPPE_LUX_SCI', 	'QUO_REQ_ASIAN_STEPPE_ON_LUX_SCI') ,
		('QUO_REQSET_ASIAN_STEPPE_LUX_SCI', 	'QUO_REQ_ASIAN_STEPPE_HAS_IMPROVEMENT') ,
		
		('QUO_REQSET_ASIAN_STEPPE_LUX_FAI', 	'QUO_REQ_ASIAN_STEPPE_ON_LUX_FAI') ,
		('QUO_REQSET_ASIAN_STEPPE_LUX_FAI', 	'QUO_REQ_ASIAN_STEPPE_HAS_IMPROVEMENT') ,
		
		--('QUO_REQSET_ASIAN_STEPPE_CITY_CAP_REQS', 	'QUO_REQ_AA_GENERIC_CITY_HAS_PALACE') ,
		('QUO_REQSET_ASIAN_STEPPE_CITY_CAP_REQS', 	'QUO_REQ_ASIAN_STEPPE_HAS_ANCIENT_BEDROCK') ,
		('QUO_REQSET_ASIAN_STEPPE_CITY_CAP_REQS', 	'QUO_REQ_ASIAN_STEPPE_HAS_MEDIEVAL_BEDROCK') ,
		('QUO_REQSET_ASIAN_STEPPE_CITY_CAP_REQS', 	'QUO_REQ_ASIAN_STEPPE_HAS_REN_BEDROCK') ;
		--('QUO_REQSET_ASIAN_STEPPE_CITY_CAP_REQS', 	'QUO_REQ_BIOME_ASIAN_STEPPE_CITY_POP') ;
		
	
INSERT INTO Modifiers 
		(ModifierId, ModifierType, RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
VALUES	('QUO_BIOME_ASIAN_STEPPE_LUX_GOLD_PLAYER', 'MODIFIER_PLAYER_CITIES_ATTACH_MODIFIER', 0, 0, NULL, 'QUO_REQSET_ASIAN_STEPPE_CITY_CAP_REQS') ,
		('QUO_BIOME_ASIAN_STEPPE_LUX_GOLD', 'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD', 0, 0, NULL, 'QUO_REQSET_ASIAN_STEPPE_LUX_GOLD') ,
		
		('QUO_BIOME_ASIAN_STEPPE_LUX_CULT_PLAYER', 'MODIFIER_PLAYER_CITIES_ATTACH_MODIFIER', 0, 0, NULL, 'QUO_REQSET_ASIAN_STEPPE_CITY_CAP_REQS') ,
		('QUO_BIOME_ASIAN_STEPPE_LUX_CULT', 'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD', 0, 0, NULL, 'QUO_REQSET_ASIAN_STEPPE_LUX_CULT') ,
		
		('QUO_BIOME_ASIAN_STEPPE_LUX_SCI_PLAYER', 'MODIFIER_PLAYER_CITIES_ATTACH_MODIFIER', 0, 0, NULL, 'QUO_REQSET_ASIAN_STEPPE_CITY_CAP_REQS') ,
		('QUO_BIOME_ASIAN_STEPPE_LUX_SCI', 'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD', 0, 0, NULL, 'QUO_REQSET_ASIAN_STEPPE_LUX_SCI') ,
		
		('QUO_BIOME_ASIAN_STEPPE_LUX_FAI_PLAYER', 'MODIFIER_PLAYER_CITIES_ATTACH_MODIFIER', 0, 0, NULL, 'QUO_REQSET_ASIAN_STEPPE_CITY_CAP_REQS') ,
		('QUO_BIOME_ASIAN_STEPPE_LUX_FAI', 'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD', 0, 0, NULL, 'QUO_REQSET_ASIAN_STEPPE_LUX_FAI') ;
		

INSERT INTO ModifierArguments
		(ModifierId, 			Name, 		Type, 			Value, 			Extra, 	SecondExtra)
VALUES	('QUO_BIOME_ASIAN_STEPPE_LUX_GOLD_PLAYER', 	'ModifierId', 	'ARGTYPE_IDENTITY', 	'QUO_BIOME_ASIAN_STEPPE_LUX_GOLD',			NULL, 	NULL),
		('QUO_BIOME_ASIAN_STEPPE_LUX_GOLD', 	'Amount', 	'ARGTYPE_IDENTITY', 	'2',			NULL, 	NULL),
		('QUO_BIOME_ASIAN_STEPPE_LUX_GOLD', 	'YieldType', 	'ARGTYPE_IDENTITY', 	'YIELD_GOLD',			NULL, 	NULL) ,
		
		('QUO_BIOME_ASIAN_STEPPE_LUX_CULT_PLAYER', 	'ModifierId', 	'ARGTYPE_IDENTITY', 	'QUO_BIOME_ASIAN_STEPPE_LUX_CULT',			NULL, 	NULL),
		('QUO_BIOME_ASIAN_STEPPE_LUX_CULT', 	'Amount', 	'ARGTYPE_IDENTITY', 	'2',			NULL, 	NULL),
		('QUO_BIOME_ASIAN_STEPPE_LUX_CULT', 	'YieldType', 	'ARGTYPE_IDENTITY', 	'YIELD_CULTURE',			NULL, 	NULL) ,
				
		('QUO_BIOME_ASIAN_STEPPE_LUX_SCI_PLAYER', 	'ModifierId', 	'ARGTYPE_IDENTITY', 	'QUO_BIOME_ASIAN_STEPPE_LUX_SCI',			NULL, 	NULL),
		('QUO_BIOME_ASIAN_STEPPE_LUX_SCI', 	'Amount', 	'ARGTYPE_IDENTITY', 	'2',			NULL, 	NULL),
		('QUO_BIOME_ASIAN_STEPPE_LUX_SCI', 	'YieldType', 	'ARGTYPE_IDENTITY', 	'YIELD_SCIENCE',			NULL, 	NULL) ,
		
		('QUO_BIOME_ASIAN_STEPPE_LUX_FAI_PLAYER', 	'ModifierId', 	'ARGTYPE_IDENTITY', 	'QUO_BIOME_ASIAN_STEPPE_LUX_FAI',			NULL, 	NULL),
		('QUO_BIOME_ASIAN_STEPPE_LUX_FAI', 	'Amount', 	'ARGTYPE_IDENTITY', 	'2',			NULL, 	NULL),
		('QUO_BIOME_ASIAN_STEPPE_LUX_FAI', 	'YieldType', 	'ARGTYPE_IDENTITY', 	'YIELD_FAITH',			NULL, 	NULL) ;
		

INSERT INTO TraitModifiers
		(TraitType, 			ModifierID)
VALUES	('QUO_TRAIT_BIOME_ASIAN_STEPPE',	'QUO_BIOME_ASIAN_STEPPE_LUX_GOLD_PLAYER')  ,
		('QUO_TRAIT_BIOME_ASIAN_STEPPE',	'QUO_BIOME_ASIAN_STEPPE_LUX_CULT_PLAYER')  ,
		('QUO_TRAIT_BIOME_ASIAN_STEPPE',	'QUO_BIOME_ASIAN_STEPPE_LUX_SCI_PLAYER')  ,
		('QUO_TRAIT_BIOME_ASIAN_STEPPE',	'QUO_BIOME_ASIAN_STEPPE_LUX_FAI_PLAYER')  ; 
 


		

-- ARABESQUE FM
UPDATE tblQuoDebug SET Message='Arabesque' WHERE DebugID='Quo_Biome_Code';



INSERT INTO Modifiers 
		(ModifierId, 	ModifierType, 	RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
VALUES	('QUO_BIOME_ARABESQUE_RELIGIOUS_CONVERSION_PLAYER', 'MODIFIER_PLAYER_UNITS_ATTACH_MODIFIER', 0, 0, NULL, NULL) ;


INSERT INTO ModifierArguments
	(ModifierId, 			Name, 		Type, 			Value, 					Extra, 	SecondExtra)
VALUES	('QUO_BIOME_ARABESQUE_RELIGIOUS_CONVERSION_PLAYER', 		'ModifierId', 		'ARGTYPE_IDENTITY', 	'CONQUISTADOR_CITY_RELIGION_COMBAT',	NULL, 	NULL)  ;
	

INSERT INTO TraitModifiers
	(TraitType, 					ModifierID)
VALUES	('QUO_TRAIT_BIOME_ARABESQUE',			'QUO_BIOME_ARABESQUE_RELIGIOUS_CONVERSION_PLAYER') ;		
	
	



-- Gold in cities with at least X population
/* INSERT INTO Requirements
	(RequirementId, 		RequirementType, 	Likeliness,	Inverse, 	Triggered)
VALUES	('QUO_REQ_BIOME_ARABESQUE_CITY_POP', 		'REQUIREMENT_CITY_HAS_X_POPULATION',	0,0,0) ;
		

INSERT INTO RequirementArguments 
	(RequirementId,			Name, 			Type, 			Value, 				Extra, 	SecondExtra)
VALUES 	('QUO_REQ_BIOME_ARABESQUE_CITY_POP',	'Amount',		'ARGTYPE_IDENTITY',	'8',	NULL,	NULL 	) ;

		
INSERT INTO RequirementSets 
	(RequirementSetId, 		RequirementSetType)
VALUES 	('QUO_REQSET_BIOME_ARABESQUE_CITY_POP', 	'REQUIREMENTSET_TEST_ALL')  ;


INSERT INTO RequirementSetRequirements
	(RequirementSetId,	RequirementId)
VALUES	 ('QUO_REQSET_BIOME_ARABESQUE_CITY_POP', 	'QUO_REQ_BIOME_ARABESQUE_CITY_POP') ,
		('QUO_REQSET_BIOME_ARABESQUE_CITY_POP', 	'QUO_REQ_GLOBAL_ERA_NOT_YET_INDUSTRIAL') ;


INSERT INTO Modifiers 
	(ModifierId, ModifierType, RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
VALUES	('QUO_BIOME_ARABESQUE_RIVER_BONUS', 'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD', 0, 0, NULL, 'PLOT_ADJACENT_TO_RIVER_REQUIREMENTS')  ,
		('QUO_BIOME_ARABESQUE_RIVER_BONUS_PLAYER', 'MODIFIER_PLAYER_CITIES_ATTACH_MODIFIER', 0, 0, NULL, 'QUO_REQSET_BIOME_ARABESQUE_CITY_POP')  ;
 
INSERT INTO ModifierArguments
		(ModifierId, 			Name, 		Type, 			Value, 			Extra, 	SecondExtra)
VALUES	('QUO_BIOME_ARABESQUE_RIVER_BONUS', 	'YieldType', 	'ARGTYPE_IDENTITY', 	'YIELD_GOLD',			NULL, 	NULL) ,
		('QUO_BIOME_ARABESQUE_RIVER_BONUS', 	'Amount', 	'ARGTYPE_IDENTITY', 	'1',			NULL, 	NULL)  ,
		('QUO_BIOME_ARABESQUE_RIVER_BONUS_PLAYER', 	'ModifierId', 	'ARGTYPE_IDENTITY', 	'QUO_BIOME_ARABESQUE_RIVER_BONUS',			NULL, 	NULL)  ;
		
INSERT INTO TraitModifiers
		(TraitType, 			ModifierID)
VALUES	('QUO_TRAIT_BIOME_ARABESQUE',	'QUO_BIOME_ARABESQUE_RIVER_BONUS_PLAYER') ; */




-- Desert tiles have the same yield as Lake tiles
/* INSERT INTO Modifiers 
		(ModifierId, ModifierType, RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
VALUES	('QUO_BIOME_ARABESQUE_DESERT_FOOD', 'MODIFIER_PLAYER_ADJUST_PLOT_YIELD', 0, 0, NULL, 'PETRA_YIELD_MODIFIER_REQUIREMENTS') ,
		('QUO_BIOME_ARABESQUE_DESERT_GOLD', 'MODIFIER_PLAYER_ADJUST_PLOT_YIELD', 0, 0, NULL, 'PETRA_YIELD_MODIFIER_REQUIREMENTS') ;
 
INSERT INTO ModifierArguments
		(ModifierId, 			Name, 		Type, 			Value, 			Extra, 	SecondExtra)
VALUES	('QUO_BIOME_ARABESQUE_DESERT_FOOD', 	'YieldType', 	'ARGTYPE_IDENTITY', 	'YIELD_FOOD',			NULL, 	NULL)  ,
		('QUO_BIOME_ARABESQUE_DESERT_FOOD', 	'Amount', 	'ARGTYPE_IDENTITY', 	'1',			NULL, 	NULL)  ,
		('QUO_BIOME_ARABESQUE_DESERT_GOLD', 	'YieldType', 	'ARGTYPE_IDENTITY', 	'YIELD_GOLD',			NULL, 	NULL)  ,
		('QUO_BIOME_ARABESQUE_DESERT_GOLD', 	'Amount', 	'ARGTYPE_IDENTITY', 	'1',			NULL, 	NULL)  ;

		
INSERT INTO TraitModifiers
		(TraitType, 			ModifierID)
VALUES	('QUO_TRAIT_BIOME_ARABESQUE',	'QUO_BIOME_ARABESQUE_DESERT_FOOD')  ,
		('QUO_TRAIT_BIOME_ARABESQUE',	'QUO_BIOME_ARABESQUE_DESERT_GOLD')  ;
 */


-- No disasters in certain cities, and free water in cities
/* INSERT INTO Requirements
	(RequirementId, 		RequirementType, 	Likeliness,	Inverse, 	Triggered)
VALUES	('QUO_REQ_BIOME_ARABESQUE_CITY_HAS_DESERT', 	'REQUIREMENT_CITY_HAS_X_TERRAIN_TYPE',	0,0,0)   ,
		('QUO_REQ_BIOME_ARABESQUE_CITY_HAS_COAST', 	'REQUIREMENT_CITY_HAS_X_TERRAIN_TYPE',	0,0,0)   ;

INSERT INTO RequirementArguments 
	(RequirementId,			Name, 			Type, 			Value, 				Extra, 	SecondExtra)
VALUES 	('QUO_REQ_BIOME_ARABESQUE_CITY_HAS_DESERT',	'Amount',	'ARGTYPE_IDENTITY',	'2',	NULL,	NULL 	) ,
		('QUO_REQ_BIOME_ARABESQUE_CITY_HAS_DESERT',	'Hills',		'ARGTYPE_IDENTITY',		'1',	NULL,	NULL 	) ,
		('QUO_REQ_BIOME_ARABESQUE_CITY_HAS_DESERT',	'TerrainType',		'ARGTYPE_IDENTITY',		'TERRAIN_DESERT',	NULL,	NULL 	)  ,
		
		('QUO_REQ_BIOME_ARABESQUE_CITY_HAS_COAST',	'Amount',	'ARGTYPE_IDENTITY',	'2',	NULL,	NULL 	) ,
		('QUO_REQ_BIOME_ARABESQUE_CITY_HAS_COAST',	'Hills',		'ARGTYPE_IDENTITY',		'0',	NULL,	NULL 	) ,
		('QUO_REQ_BIOME_ARABESQUE_CITY_HAS_COAST',	'TerrainType',		'ARGTYPE_IDENTITY',		'TERRAIN_COAST',	NULL,	NULL 	) ;
 */		
		
/* INSERT INTO RequirementSets 
	(RequirementSetId, 		RequirementSetType)
VALUES 	('QUO_REQSET_BIOME_ARABESQUE_CITY_DISASTER_IMMUNITY', 	'REQUIREMENTSET_TEST_ALL')  ,
		('QUO_REQSET_BIOME_ARABESQUE_CITY_WATER_BIG', 	'REQUIREMENTSET_TEST_ANY')  ;


-- reuses the Firaxis defined REQUIRES_CITY_HAS_HOLY_SITE 
INSERT INTO RequirementSetRequirements
	(RequirementSetId,	RequirementId)
VALUES	--('QUO_REQSET_BIOME_ARABESQUE_CITY_WATER_BIG', 	'QUO_REQ_BIOME_ARABESQUE_CITY_HAS_DESERT')  ,
		--('QUO_REQSET_BIOME_ARABESQUE_CITY_WATER_BIG', 	'QUO_REQ_BIOME_ARABESQUE_CITY_HAS_COAST')  ,
		('QUO_REQSET_BIOME_ARABESQUE_CITY_DISASTER_IMMUNITY', 	'REQUIRES_PLOT_WITHIN_EIGHT_HOLY_SITE')  ,
		('QUO_REQSET_BIOME_ARABESQUE_CITY_DISASTER_IMMUNITY', 	'QUO_REQ_GLOBAL_ERA_NOT_YET_MODERN')  ;
 */

		
-- doesn't work
/* INSERT INTO Modifiers 
	(ModifierId, ModifierType, RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
VALUES	('QUO_BIOME_ARABESQUE_DISASTER_IMMUNITY_PLAYER', 'MODIFIER_PLAYER_CITIES_ATTACH_MODIFIER', 0, 0, NULL, 'QUO_REQSET_BIOME_ARABESQUE_CITY_DISASTER_IMMUNITY') ,
		('QUO_BIOME_ARABESQUE_DISASTER_IMMUNITY', 'MODIFIER_GOVERNOR_ADJUST_PREVENET_STRUCTURAL_DAMAGE', 0, 0, NULL, NULL) ;


INSERT INTO ModifierArguments
	(ModifierId, 			Name, 		Type, 			Value, 					Extra, 	SecondExtra)
VALUES	('QUO_BIOME_ARABESQUE_DISASTER_IMMUNITY_PLAYER', 	'ModifierId', 'ARGTYPE_IDENTITY', 	'QUO_BIOME_ARABESQUE_DISASTER_IMMUNITY',	NULL, 	NULL) ,
		('QUO_BIOME_ARABESQUE_DISASTER_IMMUNITY', 	'Prevent', 'ARGTYPE_IDENTITY', 	'1',	NULL, 	NULL) ;
	
	
INSERT INTO TraitModifiers
	(TraitType, 			ModifierID)
VALUES	('QUO_TRAIT_BIOME_ARABESQUE',	'QUO_BIOME_ARABESQUE_DISASTER_IMMUNITY_PLAYER' );  */
		 
		
/* INSERT INTO Modifiers 
	(ModifierId, ModifierType, RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
VALUES	('QUO_BIOME_ARABESQUE_EXTRA_DISTRICT', 'MODIFIER_PLAYER_CITIES_EXTRA_DISTRICT', 0, 0, NULL, 'QUO_REQSET_BIOME_ARABESQUE_CITY_DISASTER_IMMUNITY')  ;


INSERT INTO ModifierArguments
	(ModifierId, 			Name, 		Type, 			Value, 					Extra, 	SecondExtra)
VALUES	('QUO_BIOME_ARABESQUE_EXTRA_DISTRICT', 	'Amount', 'ARGTYPE_IDENTITY', 	'1',	NULL, 	NULL) ;
	
	
INSERT INTO TraitModifiers
	(TraitType, 			ModifierID)
VALUES	('QUO_TRAIT_BIOME_ARABESQUE',	'QUO_BIOME_ARABESQUE_EXTRA_DISTRICT' ); 
 */
		
		
		

		
		
		

		
		

-- Test of storm immunity -does not work
-- This function works on floods but not dust storms
/* INSERT INTO Modifiers 
		(ModifierId, ModifierType, RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
VALUES	('QUO_BIOME_ARABESQUE_DUST_STORM_IMMUNE_GRADIENT', 'MODIFIER_PLAYER_ADJUST_AVOID_RANDOM_EVENT', 0, 0, NULL, NULL) ,
		('QUO_BIOME_ARABESQUE_DUST_STORM_IMMUNE_HABOOB', 'MODIFIER_PLAYER_ADJUST_AVOID_RANDOM_EVENT', 0, 0, NULL, NULL)  ;
		

INSERT INTO ModifierArguments
		(ModifierId, 			Name, 		Type, 			Value, 			Extra, 	SecondExtra)
VALUES	('QUO_BIOME_ARABESQUE_DUST_STORM_IMMUNE_GRADIENT', 	'RandomEventType', 	'ARGTYPE_IDENTITY', 	'RANDOM_EVENT_DUST_STORM_GRADIENT',			NULL, 	NULL),
		('QUO_BIOME_ARABESQUE_DUST_STORM_IMMUNE_HABOOB', 	'RandomEventType', 	'ARGTYPE_IDENTITY', 	'RANDOM_EVENT_DUST_STORM_HABOOB',			NULL, 	NULL) ;
		

INSERT INTO TraitModifiers
		(TraitType, 			ModifierID)
VALUES	('QUO_TRAIT_BIOME_ARABESQUE',	'QUO_BIOME_ARABESQUE_DUST_STORM_IMMUNE_GRADIENT')  ,
		('QUO_TRAIT_BIOME_ARABESQUE',	'QUO_BIOME_ARABESQUE_DUST_STORM_IMMUNE_HABOOB')  ;
 */

 
-- Early access to antiquities 
-- This breaks antiquities, which really sucks because I loved this ability otherwise
/* INSERT INTO CivicModifiers
	(CivicType, ModifierId)
SELECT 'CIVIC_CODE_OF_LAWS', 'CIVIC_GENERATE_LAND_ANTIQUITIES'
FROM tblQuoOptions WHERE OptionId='QUO_OPTION_ENABLE_BIOMES' AND Value > 0 ;

		
INSERT INTO Modifiers 
	(ModifierId, ModifierType, RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
VALUES	('QUO_BIOME_ARABESQUE_REVEAL_ANTIQUITIES',	 'MODIFIER_PLAYER_GRANT_FREE_RESOURCE_VISIBILITY', 0, 0, NULL, NULL) ;


INSERT INTO ModifierArguments
	(ModifierId, 			Name, 			Type, 			Value, 		Extra, 	SecondExtra)
VALUES	('QUO_BIOME_ARABESQUE_REVEAL_ANTIQUITIES', 	'ResourceType', 	'ARGTYPE_IDENTITY', 	'RESOURCE_ANTIQUITY_SITE',		NULL, 	NULL);


INSERT INTO TraitModifiers
	(TraitType, 			ModifierID)
VALUES	('QUO_TRAIT_BIOME_ARABESQUE',	'QUO_BIOME_ARABESQUE_REVEAL_ANTIQUITIES') ;
		
		
INSERT INTO Adjacency_YieldChanges 
		(ID,										Description,					YieldType,		YieldChange,	TilesRequired,	OtherDistrictAdjacent,	AdjacentResourceClass)
VALUES	('QUO_Biome_Arabesque_Holy_Antiquity',		'QUO_LOC_GREATWALL_ADJ',		'YIELD_FAITH',	4,				1,				0,						'RESOURCECLASS_ARTIFACT');

INSERT INTO District_Adjacencies
	(DistrictType,	YieldChangeId)
VALUES	('DISTRICT_HOLY_SITE', 'QUO_Biome_Arabesque_Holy_Antiquity');
 */		
 
 
-- Increase resource stockpile caps
INSERT INTO Modifiers 
	(ModifierId, ModifierType, RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
VALUES	('QUO_BIOME_ARABESQUE_GIANT_STOCKPILE', 'MODIFIER_PLAYER_ADJUST_RESOURCE_STOCKPILE_CAP', 0, 0, NULL, NULL)  ;


INSERT INTO ModifierArguments
	(ModifierId, 			Name, 		Type, 			Value, 					Extra, 	SecondExtra)
VALUES	('QUO_BIOME_ARABESQUE_GIANT_STOCKPILE', 	'Amount', 'ARGTYPE_IDENTITY', 	'150',	NULL, 	NULL) ;
	
	
INSERT INTO TraitModifiers
	(TraitType, 			ModifierID)
VALUES	('QUO_TRAIT_BIOME_ARABESQUE',	'QUO_BIOME_ARABESQUE_GIANT_STOCKPILE' ) ; 


 


 
-- Unlock hidden resources at the start of each appropriate era
create table tblQuoBIOME_ARABESQUEStrategics as
select resources.resourcetype, technologies.EraType from resources
left join technologies on resources.PrereqTech = technologies.TechnologyType
where resourceclasstype = "RESOURCECLASS_STRATEGIC" AND prereqtech IS NOT NULL;


INSERT INTO Requirements
		(RequirementId, 		RequirementType, 	Likeliness,	Inverse, 	Triggered)
SELECT  "QUO_REQ_BIOME_ARABESQUE_UNLOCK_" || ResourceType, "REQUIREMENT_GAME_ERA_ATLEAST_EXPANSION", 0, 0, 0  
	FROM  tblQuoBIOME_ARABESQUEStrategics;


INSERT INTO RequirementArguments 
	(RequirementId,			Name, 			Type, 			Value, 				Extra, 	SecondExtra)
SELECT 	"QUO_REQ_BIOME_ARABESQUE_UNLOCK_" || ResourceType, 'EraType', 'ARGTYPE_IDENTITY', EraType, NULL, NULL
	FROM  tblQuoBIOME_ARABESQUEStrategics ;


INSERT INTO RequirementSets 
	(RequirementSetId, 		RequirementSetType)
SELECT "QUO_REQSET_BIOME_ARABESQUE_UNLOCK_" || ResourceType, 	'REQUIREMENTSET_TEST_ALL'
	FROM  tblQuoBIOME_ARABESQUEStrategics ;

INSERT INTO RequirementSetRequirements
	(RequirementSetId,	RequirementId)
SELECT	"QUO_REQSET_BIOME_ARABESQUE_UNLOCK_" || ResourceType, 	"QUO_REQ_BIOME_ARABESQUE_UNLOCK_" || ResourceType 
	FROM  tblQuoBIOME_ARABESQUEStrategics ;
	


INSERT INTO Modifiers 
	(ModifierId, 	ModifierType, 	RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
SELECT	'QUO_BIOME_ARABESQUE_CAN_SEE' || tblQuoBIOME_ARABESQUEStrategics.ResourceType, 	'MODIFIER_PLAYER_GRANT_FREE_RESOURCE_VISIBILITY', 0, 0, NULL, "QUO_REQSET_BIOME_ARABESQUE_UNLOCK_" || ResourceType
	FROM tblQuoBIOME_ARABESQUEStrategics;


INSERT INTO ModifierArguments
	(ModifierId, 			Name, 		Type, 			Value, 					Extra, 	SecondExtra)
SELECT 'QUO_BIOME_ARABESQUE_CAN_SEE' || tblQuoBIOME_ARABESQUEStrategics.ResourceType, 	'ResourceType', 	'ARGTYPE_IDENTITY', 	tblQuoBIOME_ARABESQUEStrategics.ResourceType,					NULL, 	NULL 	
	FROM tblQuoBIOME_ARABESQUEStrategics;

	
INSERT INTO TraitModifiers
	(TraitType, 		ModifierId)
SELECT 'QUO_TRAIT_BIOME_ARABESQUE',	'QUO_BIOME_ARABESQUE_CAN_SEE' || tblQuoBIOME_ARABESQUEStrategics.ResourceType 
	FROM tblQuoBIOME_ARABESQUEStrategics;





 
 
-- Free water  
INSERT INTO Requirements
	(RequirementId, 		RequirementType, 	Likeliness,	Inverse, 	Triggered)
VALUES	('QUO_REQ_BIOME_ARABESQUE_NOT_COAST', 		'REQUIREMENT_PLOT_IS_COASTAL_LAND',	0,1,0) ,
		('QUO_REQ_BIOME_ARABESQUE_COAST', 		'REQUIREMENT_PLOT_IS_COASTAL_LAND',	0,0,0) ,
		('QUO_REQ_BIOME_ARABESQUE_NOT_RIVER', 		'REQUIREMENT_PLOT_ADJACENT_TO_RIVER',	0,1,0) ,
		('QUO_REQ_BIOME_ARABESQUE_NOT_LAKE', 		'REQUIREMENT_PLOT_ADJACENT_TO_LAKE',	0,1,0) ;
		
-- NO ARGS
		
INSERT INTO RequirementSets 
	(RequirementSetId, 		RequirementSetType)
VALUES 	('QUO_REQSET_BIOME_ARABESQUE_NOT_COAST', 	'REQUIREMENTSET_TEST_ALL') ,
		('QUO_REQSET_BIOME_ARABESQUE_COAST', 	'REQUIREMENTSET_TEST_ALL') ;


INSERT INTO RequirementSetRequirements
	(RequirementSetId,	RequirementId)
VALUES	 ('QUO_REQSET_BIOME_ARABESQUE_NOT_COAST', 	'QUO_REQ_BIOME_ARABESQUE_NOT_COAST')  ,
		('QUO_REQSET_BIOME_ARABESQUE_NOT_COAST', 	'QUO_REQ_BIOME_ARABESQUE_NOT_RIVER')  ,
		('QUO_REQSET_BIOME_ARABESQUE_NOT_COAST', 	'QUO_REQ_BIOME_ARABESQUE_NOT_LAKE')  ,
		
		('QUO_REQSET_BIOME_ARABESQUE_COAST', 	'QUO_REQ_BIOME_ARABESQUE_COAST')  ,
		('QUO_REQSET_BIOME_ARABESQUE_COAST', 	'QUO_REQ_BIOME_ARABESQUE_NOT_RIVER')  ,
		('QUO_REQSET_BIOME_ARABESQUE_COAST', 	'QUO_REQ_BIOME_ARABESQUE_NOT_LAKE')  ;


-- Reused Firaxic created PLOT_IS_COASTAL_LAND_REQUIREMENTS
INSERT INTO Modifiers 
	(ModifierId, ModifierType, RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
VALUES	('QUO_BIOME_ARABESQUE_FREE_WATER_NO_COAST', 'MODIFIER_PLAYER_CITIES_ADJUST_WATER_HOUSING', 0, 0, NULL, 'QUO_REQSET_BIOME_ARABESQUE_NOT_COAST') ,
		('QUO_BIOME_ARABESQUE_FREE_WATER_COAST', 'MODIFIER_PLAYER_CITIES_ADJUST_WATER_HOUSING', 0, 0, NULL, 'QUO_REQSET_BIOME_ARABESQUE_COAST') ;


INSERT INTO ModifierArguments
	(ModifierId, 			Name, 		Type, 			Value, 					Extra, 	SecondExtra)
VALUES	('QUO_BIOME_ARABESQUE_FREE_WATER_NO_COAST', 	'Amount', 'ARGTYPE_IDENTITY', 	'2',	NULL, 	NULL) ,
		('QUO_BIOME_ARABESQUE_FREE_WATER_COAST', 	'Amount', 'ARGTYPE_IDENTITY', 	'1',	NULL, 	NULL) ;
	
	
INSERT INTO TraitModifiers
	(TraitType, 			ModifierID)
VALUES	('QUO_TRAIT_BIOME_ARABESQUE',	'QUO_BIOME_ARABESQUE_FREE_WATER_NO_COAST' ) ,
		('QUO_TRAIT_BIOME_ARABESQUE',	'QUO_BIOME_ARABESQUE_FREE_WATER_COAST' ); 

	
		
		
		
		
-- Unlock spaceports at Astrology
-- Just for the LOLs

/* INSERT INTO RequirementSets 
	(RequirementSetId, 		RequirementSetType)
VALUES 	('QUO_REQSET_BIOME_ARABESQUE_SPACEPORT_ERAS', 	'REQUIREMENTSET_TEST_ALL')  ;


INSERT INTO RequirementSetRequirements
	(RequirementSetId,	RequirementId)
VALUES	('QUO_REQSET_BIOME_ARABESQUE_SPACEPORT_ERAS', 	'QUO_REQ_GLOBAL_ERA_NOT_YET_CLASSICAL')  ;


INSERT INTO Modifiers 
		(ModifierId, ModifierType, RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
VALUES	('QUO_BIOME_ARABESQUE_UNLOCK_SPACEPORT', 'MODIFIER_PLAYER_ADJUST_DISTRICT_UNLOCK', 0, 0, NULL, 'QUO_REQSET_BIOME_ARABESQUE_SPACEPORT_ERAS')   ,
		('QUO_BIOME_ARABESQUE_FAST_SPACEPORT', 'MODIFIER_PLAYER_CITIES_ADJUST_DISTRICT_PRODUCTION', 0, 0, NULL, 'QUO_REQSET_BIOME_ARABESQUE_SPACEPORT_ERAS')   ;
 
INSERT INTO ModifierArguments
		(ModifierId, 			Name, 		Type, 			Value, 			Extra, 	SecondExtra)
VALUES	('QUO_BIOME_ARABESQUE_UNLOCK_SPACEPORT', 	'DistrictType', 	'ARGTYPE_IDENTITY', 	'DISTRICT_SPACEPORT',			NULL, 	NULL) ,
		('QUO_BIOME_ARABESQUE_UNLOCK_SPACEPORT', 	'TechType', 	'ARGTYPE_IDENTITY', 	'TECH_ASTROLOGY',			NULL, 	NULL) ,
		('QUO_BIOME_ARABESQUE_FAST_SPACEPORT', 	'DistrictType', 	'ARGTYPE_IDENTITY', 	'DISTRICT_SPACEPORT',			NULL, 	NULL) ,
		('QUO_BIOME_ARABESQUE_FAST_SPACEPORT', 	'Amount', 	'ARGTYPE_IDENTITY', 	'3300',			NULL, 	NULL) ;
		
INSERT INTO TraitModifiers
		(TraitType, 			ModifierID)
VALUES	('QUO_TRAIT_BIOME_ARABESQUE',	'QUO_BIOME_ARABESQUE_UNLOCK_SPACEPORT')    ,
		('QUO_TRAIT_BIOME_ARABESQUE',	'QUO_BIOME_ARABESQUE_FAST_SPACEPORT')    ; */
		
		

-- Cannot build units that require Oil
-- Removed in later builds for balance reasons
/* CREATE TABLE tblQuoBiomeArabesqueOilUnits AS 
select unittype, technologies.eratype from units 
inner join technologies on technologies.TechnologyType = units.PrereqTech 
where strategicresource in  ("RESOURCE_OIL") AND TraitType IS NULL

union

select unittype, civics.EraType from units 
inner join civics on civics.CivicType = units.PrereqCivic
where strategicresource in  ("RESOURCE_OIL") AND TraitType IS NULL ;


INSERT INTO Modifiers 
	(ModifierId, ModifierType, RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
SELECT 'QUO_BIOME_ARABESQUE_CANNOT_BUILD_' || tblQuoBiomeArabesqueOilUnits.UnitType, 'MODIFIER_PLAYER_UNIT_BUILD_DISABLED', 0, 0, NULL, NULL
	FROM tblQuoBiomeArabesqueOilUnits;


INSERT INTO ModifierArguments
	(ModifierId, 			Name, 		Type, 			Value, 			Extra, 	SecondExtra)
SELECT 'QUO_BIOME_ARABESQUE_CANNOT_BUILD_' || tblQuoBiomeArabesqueOilUnits.UnitType, 	'UnitType', 	'ARGTYPE_IDENTITY', 	tblQuoBiomeArabesqueOilUnits.UnitType,			NULL, 	NULL 
	FROM tblQuoBiomeArabesqueOilUnits;

	
INSERT INTO TraitModifiers
	(TraitType, 			ModifierID)
SELECT 'QUO_TRAIT_BIOME_ARABESQUE',	'QUO_BIOME_ARABESQUE_CANNOT_BUILD_' || tblQuoBiomeArabesqueOilUnits.UnitType
	FROM tblQuoBiomeArabesqueOilUnits;
 */

	
-- Increased Religious pressure during the appropriate era
-- Removed in v7.0.12

/* INSERT INTO RequirementSets 
	(RequirementSetId, 		RequirementSetType)
VALUES 	('QUO_REQSET_BIOME_ARABESQUE_RELIGIOUS_PRESSURE', 	'REQUIREMENTSET_TEST_ALL') ,
		('QUO_REQSET_BIOME_ARABESQUE_DEBUFF_ERA', 	'REQUIREMENTSET_TEST_ALL') ;


INSERT INTO RequirementSetRequirements
	(RequirementSetId,	RequirementId)
VALUES	('QUO_REQSET_BIOME_ARABESQUE_RELIGIOUS_PRESSURE', 	'QUO_REQ_GLOBAL_ERA_IS_ATLEAST_INDUSTRIAL') ,
		('QUO_REQSET_BIOME_ARABESQUE_RELIGIOUS_PRESSURE', 	'QUO_REQ_GLOBAL_ERA_NOT_YET_MODERN') ,
		('QUO_REQSET_BIOME_ARABESQUE_DEBUFF_ERA', 	'QUO_REQ_GLOBAL_ERA_IS_ATLEAST_INDUSTRIAL') ,
		('QUO_REQSET_BIOME_ARABESQUE_DEBUFF_ERA', 	'QUO_REQ_GLOBAL_ERA_NOT_YET_MODERN') ;


INSERT INTO Modifiers 
	(ModifierId, ModifierType, RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
VALUES	('QUO_BIOME_ARABESQUE_RELIGIOUS_PRESSURE', 'MODIFIER_PLAYER_RELIGION_ADJUST_RELIGIOUS_SPREAD_STRENGTH', 0, 0, NULL, 'QUO_REQSET_BIOME_ARABESQUE_DEBUFF_ERA')   ,
		('QUO_BIOME_ARABESQUE_RELIGIOUS_GPP_DEBUFF', 'MODIFIER_PLAYER_CITIES_ADJUST_GREAT_PERSON_POINT_BONUS', 0, 0, NULL, 'QUO_REQSET_BIOME_ARABESQUE_DEBUFF_ERA')   ;
 */
 
-- Note the dummy values inserted here just to follow the Firaxis pattern of having 3 modifierarguments for this modifiertype. Pottery provides a tiny religious pressure bonus just to
-- keep the value from being 0. If for some reason the player doesn't have Pottery yet they'll get a 99 percent bonus instead of 100 but it should barely be noticeable.

-- removed in v.7.0.12

/* INSERT INTO ModifierArguments
		(ModifierId, 			Name, 		Type, 			Value, 			Extra, 	SecondExtra)
VALUES	('QUO_BIOME_ARABESQUE_RELIGIOUS_PRESSURE', 	'EnhancingTechType', 	'ARGTYPE_IDENTITY', 	'TECH_POTTERY',			NULL, 	NULL) ,
		('QUO_BIOME_ARABESQUE_RELIGIOUS_PRESSURE', 	'SpreadMultiplier', 	'ARGTYPE_IDENTITY', 	'99',			NULL, 	NULL)  ,
		('QUO_BIOME_ARABESQUE_RELIGIOUS_PRESSURE', 	'TechEnabledSpreadMultiplier', 	'ARGTYPE_IDENTITY', 	'1',			NULL, 	NULL)  ,
		('QUO_BIOME_ARABESQUE_RELIGIOUS_GPP_DEBUFF', 	'Amount', 	'ARGTYPE_IDENTITY', 	'-50',			NULL, 	NULL)  ;
		
		
INSERT INTO TraitModifiers
		(TraitType, 			ModifierID)
VALUES	('QUO_TRAIT_BIOME_ARABESQUE',	'QUO_BIOME_ARABESQUE_RELIGIOUS_PRESSURE') ,
		('QUO_TRAIT_BIOME_ARABESQUE',	'QUO_BIOME_ARABESQUE_RELIGIOUS_GPP_DEBUFF') ;
 */	

-- Penalty vs civs in a Golden Age
-- This used to be a quality of Africa, moved to Arabesque in v7.0.1. Still uses Africas string tables
-- The RequirementSet is borrowed from the Mapuche
INSERT INTO Modifiers 
		(ModifierId, 	ModifierType, 	RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
VALUES	('QUO_BIOME_ARABESQUE_COMBAT_PENALTY', 'MODIFIER_PLAYER_UNITS_ADJUST_COMBAT_STRENGTH', 0, 0, NULL, 'OPPONENT_IS_IN_GOLDEN_AGE_REQUIREMENTS') ;

INSERT INTO ModifierArguments
	(ModifierId, 			Name, 		Type, 			Value, 					Extra, 	SecondExtra)
VALUES	('QUO_BIOME_ARABESQUE_COMBAT_PENALTY', 	'Amount', 	'ARGTYPE_IDENTITY', 	'-10',		NULL, 	NULL) ;

INSERT INTO TraitModifiers
		(TraitType, 			ModifierID)
VALUES	('QUO_TRAIT_BIOME_ARABESQUE',	'QUO_BIOME_ARABESQUE_COMBAT_PENALTY')  ;
 
INSERT INTO ModifierStrings
	(ModifierId, 		Context, Text)
VALUES	('QUO_BIOME_ARABESQUE_COMBAT_PENALTY', 'Preview', 'QUO_LOC_BIOME_AFRICA_COMBAT_BAD_MINOR') ;
	
	


-- NATIVE AMERICA
UPDATE tblQuoDebug SET Message='Native America' WHERE DebugID='Quo_Biome_Code';

-- cannot build cavalry
CREATE TABLE tblQuoBiomeNativeAmericaHorseUnits AS 
select unittype, technologies.eratype from units 
inner join technologies on technologies.TechnologyType = units.PrereqTech 
where promotionclass in  ("PROMOTION_CLASS_HEAVY_CAVALRY","PROMOTION_CLASS_LIGHT_CAVALRY") AND EraType in ("ERA_ANCIENT", "ERA_CLASSICAL", "ERA_MEDIEVAL", "ERA_RENAISSANCE", "ERA_INDUSTRIAL") AND TraitType IS NULL

union

select unittype, civics.EraType from units 
inner join civics on civics.CivicType = units.PrereqCivic
where promotionclass in  ("PROMOTION_CLASS_HEAVY_CAVALRY","PROMOTION_CLASS_LIGHT_CAVALRY") AND EraType in ("ERA_ANCIENT", "ERA_CLASSICAL", "ERA_MEDIEVAL", "ERA_RENAISSANCE", "ERA_INDUSTRIAL") AND TraitType IS NULL;



INSERT INTO Modifiers 
	(ModifierId, ModifierType, RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
SELECT 'QUO_BIOME_NATIVE_AMERICA_CANNOT_BUILD_' || tblQuoBiomeNativeAmericaHorseUnits.UnitType, 'MODIFIER_PLAYER_UNIT_BUILD_DISABLED', 0, 0, NULL, NULL
	FROM tblQuoBiomeNativeAmericaHorseUnits;


INSERT INTO ModifierArguments
	(ModifierId, 			Name, 		Type, 			Value, 			Extra, 	SecondExtra)
SELECT 'QUO_BIOME_NATIVE_AMERICA_CANNOT_BUILD_' || tblQuoBiomeNativeAmericaHorseUnits.UnitType, 	'UnitType', 	'ARGTYPE_IDENTITY', 	tblQuoBiomeNativeAmericaHorseUnits.UnitType,			NULL, 	NULL 
	FROM tblQuoBiomeNativeAmericaHorseUnits;

	
INSERT INTO TraitModifiers
	(TraitType, 			ModifierID)
SELECT 'QUO_TRAIT_BIOME_NATIVE_AMERICA',	'QUO_BIOME_NATIVE_AMERICA_CANNOT_BUILD_' || tblQuoBiomeNativeAmericaHorseUnits.UnitType
	FROM tblQuoBiomeNativeAmericaHorseUnits;
	

	
-- always Loyal
INSERT INTO Modifiers 
	(ModifierId, 	ModifierType, 	RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
VALUES	('QUO_BIOME_NATIVE_AMERICA_ALWAYS_LOYAL', 	'MODIFIER_PLAYER_CITIES_ADJUST_ALWAYS_LOYAL', 0, 0, NULL, NULL)  ;


INSERT INTO ModifierArguments
	(ModifierId, 			Name, 		Type, 			Value, 					Extra, 	SecondExtra)
VALUES	('QUO_BIOME_NATIVE_AMERICA_ALWAYS_LOYAL', 	'AlwaysLoyal', 	'ARGTYPE_IDENTITY', 	'1',					NULL, 	NULL) ;


INSERT INTO TraitModifiers
	(TraitType, 		ModifierId)
VALUES ('QUO_TRAIT_BIOME_NATIVE_AMERICA',	'QUO_BIOME_NATIVE_AMERICA_ALWAYS_LOYAL' );


-- Late game stealth for all units
-- The ability
INSERT INTO Types
	(Type, 				Kind)
VALUES 	('QUO_ABILITY_BIOME_NATIVE_AMERICAN',	'KIND_ABILITY'	) ;


INSERT INTO TypeTags
	(Type,					Tag)
VALUES  ('QUO_ABILITY_BIOME_NATIVE_AMERICAN', 	'CLASS_RECON'), 
	--('QUO_ABILITY_BIOME_NATIVE_AMERICAN', 		'CLASS_MELEE'), 
	('QUO_ABILITY_BIOME_NATIVE_AMERICAN', 		'CLASS_RANGED'),
	--('QUO_ABILITY_BIOME_NATIVE_AMERICAN', 		'CLASS_SIEGE'),
 	--('QUO_ABILITY_BIOME_NATIVE_AMERICAN', 		'CLASS_HEAVY_CAVALRY'),
	--('QUO_ABILITY_BIOME_NATIVE_AMERICAN', 		'CLASS_RANGED_CAVALRY'),
	('QUO_ABILITY_BIOME_NATIVE_AMERICAN', 		'CLASS_ANTI_CAVALRY') ;

INSERT INTO UnitAbilities
	(UnitAbilityType,		Name,				Description,			Inactive)
VALUES	('QUO_ABILITY_BIOME_NATIVE_AMERICAN',	'QUO_LOC_EXTRA_VISION',		'QUO_LOC_EXTRA_VISION_DESC',	"1"	) ;



-- The attachment
/* INSERT INTO Requirements
	(RequirementId, 		RequirementType, 	Likeliness,	Inverse, 	Triggered)
VALUES	('QUO_REQ_BIOME_NATIVE_AMERICA_STEALTH_START_ERA', 		'REQUIREMENT_GAME_ERA_ATLEAST_EXPANSION',	0,0,0) ;


INSERT INTO RequirementArguments 
	(RequirementId,			Name, 			Type, 			Value, 				Extra, 	SecondExtra)
VALUES 	('QUO_REQ_BIOME_NATIVE_AMERICA_STEALTH_START_ERA',	'EraType',		'ARGTYPE_IDENTITY',	'ERA_INDUSTRIAL',	NULL,	NULL 	)  ;
 */		

INSERT INTO RequirementSets 
	(RequirementSetId, 		RequirementSetType)
VALUES 	('QUO_REQSET_BIOME_NATIVE_AMERICA_STEALTH_ERAS', 	'REQUIREMENTSET_TEST_ALL')   ;


INSERT INTO RequirementSetRequirements
	(RequirementSetId,	RequirementId)
VALUES	 ('QUO_REQSET_BIOME_NATIVE_AMERICA_STEALTH_ERAS', 	'QUO_REQ_GLOBAL_ERA_IS_ATLEAST_MEDIEVAL')  ;
		--('QUO_REQSET_BIOME_NATIVE_AMERICA_STEALTH_ERAS', 	'QUO_REQ_GLOBAL_ERA_NOT_YET_ATOMIC')  ;


INSERT INTO Modifiers 
	(ModifierId, ModifierType, RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
VALUES	('QUO_BIOME_NATIVE_AMERICAN_STEALTH', 'MODIFIER_PLAYER_UNIT_ADJUST_HIDDEN_VISIBILITY', 0, 0, NULL, 'QUO_REQSET_BIOME_NATIVE_AMERICA_STEALTH_ERAS') ;


INSERT INTO ModifierArguments
	(ModifierId, 				Name, 			Type, 			Value, 		Extra, 	SecondExtra)
VALUES	('QUO_BIOME_NATIVE_AMERICAN_STEALTH', 		'Hidden', 		'ARGTYPE_IDENTITY', 	'1',	NULL, 	NULL)  ;


INSERT INTO UnitAbilityModifiers
	(UnitAbilityType,	ModifierId)
VALUES	('QUO_ABILITY_BIOME_NATIVE_AMERICAN', 	'QUO_BIOME_NATIVE_AMERICAN_STEALTH') ;




INSERT INTO Modifiers 
	(ModifierId, 			ModifierType, 				RunOnce, 	Permanent, 	OwnerRequirementSetId, 	SubjectRequirementSetId)
VALUES	('QUO_BIOME_NATIVE_AMERICAN_PLAYER', 	'MODIFIER_PLAYER_UNITS_GRANT_ABILITY', 	0, 		1, 		NULL, 			NULL) ;


INSERT INTO ModifierArguments
	(ModifierId, 			Name, 		Type, 			Value, 		Extra, 	SecondExtra)
VALUES	('QUO_BIOME_NATIVE_AMERICAN_PLAYER', 	'AbilityType', 	'ARGTYPE_IDENTITY', 	'QUO_ABILITY_BIOME_NATIVE_AMERICAN',	NULL, 	NULL) ;


INSERT INTO TraitModifiers
	(TraitType, 					ModifierID)
VALUES	('QUO_TRAIT_BIOME_NATIVE_AMERICA',			'QUO_BIOME_NATIVE_AMERICAN_PLAYER') ;


-- settler move speed

INSERT INTO Requirements
	(RequirementId, 		RequirementType, 	Likeliness,	Inverse, 	Triggered)
VALUES	('QUO_REQ_BIOME_NATIVE_AMERICA_SETTLER', 	'REQUIREMENT_UNIT_TYPE_MATCHES',	0,0,0) ;


INSERT INTO RequirementArguments 
		(RequirementId,			Name, 			Type, 			Value, 		Extra, 	SecondExtra)
VALUES 	('QUO_REQ_BIOME_NATIVE_AMERICA_SETTLER',	'UnitType',		'ARGTYPE_IDENTITY',		'UNIT_SETTLER',	NULL,	NULL 	) ;


INSERT INTO RequirementSets 
	(RequirementSetId, 		RequirementSetType)
VALUES 	('QUO_REQSET_BIOME_NATIVE_AMERICA_SETTLER', 	'REQUIREMENTSET_TEST_ANY') ;

 INSERT INTO RequirementSetRequirements
	(RequirementSetId,	RequirementId)
VALUES	('QUO_REQSET_BIOME_NATIVE_AMERICA_SETTLER', 	'QUO_REQ_BIOME_NATIVE_AMERICA_SETTLER') ; 

 
INSERT INTO Modifiers 
	(ModifierId, 	ModifierType, 	RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
VALUES	('QUO_GOVERNMENT_BIOME_NATIVE_AMERICA_SETTLER_MOVES', 	'MODIFIER_PLAYER_UNIT_ADJUST_MOVEMENT', 0, 0, NULL, NULL) ,
		('QUO_GOVERNMENT_BIOME_NATIVE_AMERICA_SETTLER_STEALTH', 	'MODIFIER_PLAYER_UNIT_ADJUST_HIDDEN_VISIBILITY', 0, 0, NULL, NULL) ,
		('QUO_GOVERNMENT_BIOME_NATIVE_AMERICA_SETTLER_MOVES_PLAYER', 	'MODIFIER_PLAYER_UNITS_ATTACH_MODIFIER', 0, 0, NULL, 'QUO_REQSET_BIOME_NATIVE_AMERICA_SETTLER') ,
		('QUO_GOVERNMENT_BIOME_NATIVE_AMERICA_SETTLER_STEALTH_PLAYER', 	'MODIFIER_PLAYER_UNITS_ATTACH_MODIFIER', 0, 0, NULL, 'QUO_REQSET_BIOME_NATIVE_AMERICA_SETTLER') ;



INSERT INTO ModifierArguments
	(ModifierId, 			Name, 		Type, 			Value, 					Extra, 	SecondExtra)
VALUES	('QUO_GOVERNMENT_BIOME_NATIVE_AMERICA_SETTLER_MOVES', 	'Amount', 	'ARGTYPE_IDENTITY', 	'3',					NULL, 	NULL) ,	
		('QUO_GOVERNMENT_BIOME_NATIVE_AMERICA_SETTLER_STEALTH', 		'Hidden', 		'ARGTYPE_IDENTITY', 	'1',	NULL, 	NULL) ,
		('QUO_GOVERNMENT_BIOME_NATIVE_AMERICA_SETTLER_MOVES_PLAYER', 	'ModifierId', 	'ARGTYPE_IDENTITY', 	'QUO_GOVERNMENT_BIOME_NATIVE_AMERICA_SETTLER_MOVES',		NULL, 	NULL)  ,
		('QUO_GOVERNMENT_BIOME_NATIVE_AMERICA_SETTLER_STEALTH_PLAYER', 	'ModifierId', 	'ARGTYPE_IDENTITY', 	'QUO_GOVERNMENT_BIOME_NATIVE_AMERICA_SETTLER_STEALTH',		NULL, 	NULL)  ;

		
INSERT INTO TraitModifiers
	(TraitType, 					ModifierID)
VALUES	('QUO_TRAIT_BIOME_NATIVE_AMERICA',			'QUO_GOVERNMENT_BIOME_NATIVE_AMERICA_SETTLER_MOVES_PLAYER') ,
		('QUO_TRAIT_BIOME_NATIVE_AMERICA',			'QUO_GOVERNMENT_BIOME_NATIVE_AMERICA_SETTLER_STEALTH_PLAYER') ;



	
-- SUB-SAHARAN AFRICA
UPDATE tblQuoDebug SET Message='Sub-Saharan Africa' WHERE DebugID='Quo_Biome_Code';

CREATE TABLE tblQuoBiomeAfricaNavalUnits AS 
select unittype, technologies.eratype from units 
inner join technologies on technologies.TechnologyType = units.PrereqTech 
where promotionclass in  ("PROMOTION_CLASS_NAVAL_RANGED","PROMOTION_CLASS_NAVAL_MELEE", "PROMOTION_CLASS_NAVAL_CARRIER") AND TraitType IS NULL

union

select unittype, civics.EraType from units 
inner join civics on civics.CivicType = units.PrereqCivic
where promotionclass in  ("PROMOTION_CLASS_NAVAL_RANGED","PROMOTION_CLASS_NAVAL_MELEE", "PROMOTION_CLASS_NAVAL_CARRIER") AND TraitType IS NULL;


INSERT INTO Modifiers 
	(ModifierId, ModifierType, RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
SELECT 'QUO_BIOME_AFRICA_CANNOT_BUILD_' || tblQuoBiomeAfricaNavalUnits.UnitType, 'MODIFIER_PLAYER_UNIT_BUILD_DISABLED', 0, 0, NULL, NULL
	FROM tblQuoBiomeAfricaNavalUnits;


INSERT INTO ModifierArguments
	(ModifierId, 			Name, 		Type, 			Value, 			Extra, 	SecondExtra)
SELECT 'QUO_BIOME_AFRICA_CANNOT_BUILD_' || tblQuoBiomeAfricaNavalUnits.UnitType, 	'UnitType', 	'ARGTYPE_IDENTITY', 	tblQuoBiomeAfricaNavalUnits.UnitType,			NULL, 	NULL 
	FROM tblQuoBiomeAfricaNavalUnits;

	
INSERT INTO TraitModifiers
	(TraitType, 			ModifierID)
SELECT 'QUO_TRAIT_BIOME_AFRICA',	'QUO_BIOME_AFRICA_CANNOT_BUILD_' || tblQuoBiomeAfricaNavalUnits.UnitType
	FROM tblQuoBiomeAfricaNavalUnits;

	 
-- Build Districts available to other African leaders
UPDATE Districts SET Cost = Cost * 3 WHERE DistrictType='DISTRICT_SUGUBA' AND EXISTS (SELECT 1 FROM tblQuoOptions WHERE OptionId='QUO_OPTION_ENABLE_BIOMES' AND Value > 0);
UPDATE Districts SET Cost = Cost * 3 WHERE DistrictType='DISTRICT_IKANDA' AND EXISTS (SELECT 1 FROM tblQuoOptions WHERE OptionId='QUO_OPTION_ENABLE_BIOMES' AND Value > 0);
UPDATE Districts SET Cost = Cost * 3 WHERE DistrictType='DISTRICT_MBANZA' AND EXISTS (SELECT 1 FROM tblQuoOptions WHERE OptionId='QUO_OPTION_ENABLE_BIOMES' AND Value > 0);


-- fix production rates for civs that originally owned the districts
INSERT INTO Modifiers 
	(ModifierId, 	ModifierType, 	RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
VALUES 	('QUO_BIOME_AFRICA_ZULU_FAST_DISTRICT', 'MODIFIER_PLAYER_CITIES_ADJUST_DISTRICT_PRODUCTION', 0, 0, NULL, NULL) ,
		('QUO_BIOME_AFRICA_KONGO_FAST_DISTRICT', 'MODIFIER_PLAYER_CITIES_ADJUST_DISTRICT_PRODUCTION', 0, 0, NULL, NULL) ,
		('QUO_BIOME_AFRICA_MALI_FAST_DISTRICT', 'MODIFIER_PLAYER_CITIES_ADJUST_DISTRICT_PRODUCTION', 0, 0, NULL, NULL) ;


INSERT INTO ModifierArguments
	(ModifierId, 			Name, 		Type, 			Value, 					Extra, 	SecondExtra)
VALUES	('QUO_BIOME_AFRICA_ZULU_FAST_DISTRICT', 	'Amount', 		'ARGTYPE_IDENTITY', 	'150',				NULL, 	NULL) ,  
		('QUO_BIOME_AFRICA_ZULU_FAST_DISTRICT', 	'DistrictType', 	'ARGTYPE_IDENTITY', 	'DISTRICT_IKANDA',	NULL, 	NULL) ,
		('QUO_BIOME_AFRICA_KONGO_FAST_DISTRICT', 	'Amount', 		'ARGTYPE_IDENTITY', 	'150',				NULL, 	NULL) ,  
		('QUO_BIOME_AFRICA_KONGO_FAST_DISTRICT', 	'DistrictType', 	'ARGTYPE_IDENTITY', 	'DISTRICT_MBANZA',	NULL, 	NULL) ,
		('QUO_BIOME_AFRICA_MALI_FAST_DISTRICT', 	'Amount', 		'ARGTYPE_IDENTITY', 	'150',				NULL, 	NULL) ,  
		('QUO_BIOME_AFRICA_MALI_FAST_DISTRICT', 	'DistrictType', 	'ARGTYPE_IDENTITY', 	'DISTRICT_SUGUBA',	NULL, 	NULL) ;
	
INSERT INTO TraitModifiers
		(TraitType, 		ModifierId)
SELECT 'TRAIT_CIVILIZATION_ZULU_ISIBONGO',	'QUO_BIOME_AFRICA_ZULU_FAST_DISTRICT'
FROM Civilizations  
WHERE CivilizationType='CIVILIZATION_ZULU' AND EXISTS (SELECT 1 FROM tblQuoOptions WHERE OptionId='QUO_OPTION_ENABLE_BIOMES' AND Value > 0);

INSERT INTO TraitModifiers
		(TraitType, 		ModifierId)
SELECT 'TRAIT_CIVILIZATION_NKISI',	'QUO_BIOME_AFRICA_KONGO_FAST_DISTRICT'
FROM Civilizations 
WHERE CivilizationType='CIVILIZATION_KONGO' AND EXISTS (SELECT 1 FROM tblQuoOptions WHERE OptionId='QUO_OPTION_ENABLE_BIOMES' AND Value > 0);

INSERT INTO TraitModifiers
		(TraitType, 		ModifierId)
SELECT 'TRAIT_CIVILIZATION_MALI_GOLD_DESERT',	'QUO_BIOME_AFRICA_MALI_FAST_DISTRICT' 
FROM Civilizations 
WHERE CivilizationType='CIVILIZATION_MALI' AND EXISTS (SELECT 1 FROM tblQuoOptions WHERE OptionId='QUO_OPTION_ENABLE_BIOMES' AND Value > 0);



-- Units ignore FOREST movement cost
INSERT INTO Modifiers 
	(ModifierId, 	ModifierType, 	RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
VALUES	('QUO_BIOME_AFRICA_IGNORE_FOREST', 	'MODIFIER_PLAYER_UNIT_ADJUST_IGNORE_TERRAIN_COST', 0, 0, NULL, NULL) ,
	('QUO_BIOME_AFRICA_IGNORE_FOREST_GLOBAL', 	'MODIFIER_PLAYER_UNITS_ATTACH_MODIFIER', 0, 0, NULL, NULL) ;


INSERT INTO ModifierArguments
	(ModifierId, 			Name, 		Type, 			Value, 					Extra, 	SecondExtra)
VALUES	('QUO_BIOME_AFRICA_IGNORE_FOREST', 	'Ignore', 	'ARGTYPE_IDENTITY', 	'1',					NULL, 	NULL) ,	
	('QUO_BIOME_AFRICA_IGNORE_FOREST', 	'Type', 	'ARGTYPE_IDENTITY', 	'FOREST',		NULL, 	NULL)  ,
	('QUO_BIOME_AFRICA_IGNORE_FOREST_GLOBAL', 	'ModifierId', 	'ARGTYPE_IDENTITY', 	'QUO_BIOME_AFRICA_IGNORE_FOREST',		NULL, 	NULL)  ;


INSERT INTO TraitModifiers
	(TraitType, 		ModifierId)
VALUES ('QUO_TRAIT_BIOME_AFRICA',	'QUO_BIOME_AFRICA_IGNORE_FOREST_GLOBAL' );


	
	
	
-- NORDIC/ SCANDINAVIA / BOREAL EUROPE
-- As of v6.0.19 this is now called Scandinavia, altho the name Boreal Europe remains in the database
UPDATE tblQuoDebug SET Message='Boreal Europe' WHERE DebugID='Quo_Biome_Code';



-- xx
 
-- Delay Uranium for this biome. Note this is done by reverse engineer methods. The Uranium is moved on the main tree and we manually unlock its visibility for all but this Biome 
UPDATE Resources SET PrereqTech = 'TECH_FUTURE_TECH' WHERE ResourceType = 'RESOURCE_URANIUM' AND EXISTS (SELECT 1 FROM tblQuoOptions WHERE OptionId='QUO_OPTION_ENABLE_BIOMES' AND Value > 0) ;


INSERT INTO Requirements
	(RequirementId, 		RequirementType, 	Likeliness,	Inverse, 	Triggered)
VALUES	('QUO_REQ_BIOMES_ALL_UNLOCK_SEE_URANIUM', 		'REQUIREMENT_PLAYER_HAS_TECHNOLOGY',	0,0,0)  ;


INSERT INTO RequirementArguments 
	(RequirementId,			Name, 			Type, 			Value, 				Extra, 	SecondExtra)
VALUES 	('QUO_REQ_BIOMES_ALL_UNLOCK_SEE_URANIUM',	'TechnologyType',		'ARGTYPE_IDENTITY',	'TECH_COMBINED_ARMS',	NULL,	NULL 	)  ;

		
INSERT INTO RequirementSets 
	(RequirementSetId, 		RequirementSetType)
VALUES 	('QUO_REQSET_BIOMES_ALL_UNLOCK_SEE_URANIUM', 	'REQUIREMENTSET_TEST_ALL') ;


INSERT INTO RequirementSetRequirements
	(RequirementSetId,	RequirementId)
VALUES	 ('QUO_REQSET_BIOMES_ALL_UNLOCK_SEE_URANIUM', 	'QUO_REQ_BIOMES_ALL_UNLOCK_SEE_URANIUM');



INSERT INTO Modifiers 
	(ModifierId, ModifierType, RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
VALUES	('QUO_BIOMES_CAN_SEE_URANIUM', 'MODIFIER_PLAYER_GRANT_FREE_RESOURCE_VISIBILITY', 0, 0, NULL, 'QUO_REQSET_BIOMES_ALL_UNLOCK_SEE_URANIUM' );

INSERT INTO ModifierArguments
		(ModifierId, 			Name, 		Type, 			Value, 			Extra, 	SecondExtra)
VALUES	('QUO_BIOMES_CAN_SEE_URANIUM', 	'ResourceType', 	'ARGTYPE_IDENTITY', 	'RESOURCE_URANIUM',			NULL, 	NULL) ;
  
INSERT OR REPLACE INTO TraitModifiers
		(TraitType, 			ModifierID)
SELECT 	tempTraitType, 'QUO_BIOMES_CAN_SEE_URANIUM'
FROM tblTempCivilizationTraits where tempTraittype not in ('QUO_TRAIT_BIOME_BOREAL_EUROPE');

  		
-- Unlock Canals and Dams
INSERT INTO Modifiers 
		(ModifierId, ModifierType, RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
VALUES	('QUO_BIOME_BOREAL_EUROPE_UNLOCK_CANAL', 'MODIFIER_PLAYER_ADJUST_DISTRICT_UNLOCK', 0, 0, NULL, NULL)   ,
		('QUO_BIOME_BOREAL_EUROPE_UNLOCK_DAM', 'MODIFIER_PLAYER_ADJUST_DISTRICT_UNLOCK', 0, 0, NULL, NULL)   ;
 
INSERT INTO ModifierArguments
		(ModifierId, 			Name, 		Type, 			Value, 			Extra, 	SecondExtra)
VALUES	('QUO_BIOME_BOREAL_EUROPE_UNLOCK_CANAL', 	'DistrictType', 	'ARGTYPE_IDENTITY', 	'DISTRICT_CANAL',			NULL, 	NULL) ,
		('QUO_BIOME_BOREAL_EUROPE_UNLOCK_CANAL', 	'TechType', 	'ARGTYPE_IDENTITY', 	'TECH_SHIPBUILDING',			NULL, 	NULL) ,
		('QUO_BIOME_BOREAL_EUROPE_UNLOCK_DAM', 	'DistrictType', 	'ARGTYPE_IDENTITY', 	'DISTRICT_DAM',			NULL, 	NULL) ,
		('QUO_BIOME_BOREAL_EUROPE_UNLOCK_DAM', 	'TechType', 	'ARGTYPE_IDENTITY', 	'TECH_SHIPBUILDING',			NULL, 	NULL) ;
		
INSERT INTO TraitModifiers
		(TraitType, 			ModifierID)
VALUES	('QUO_TRAIT_BIOME_BOREAL_EUROPE',	'QUO_BIOME_BOREAL_EUROPE_UNLOCK_CANAL')  ,
		('QUO_TRAIT_BIOME_BOREAL_EUROPE',	'QUO_BIOME_BOREAL_EUROPE_UNLOCK_DAM')  ;


		
-- 
-- Free Military Engineer with every governor
create table tblQuoBIOME_BOREAL_EUROPE_Civics as
select civictype from civics
inner join civicmodifiers using (civictype)
inner join modifiers using (modifierid)
where modifiertype like 'MODIFIER_PLAYER_ADJUST_GOVERNOR_POINTS';


INSERT INTO Requirements
	(RequirementId, 		RequirementType, 	Likeliness,	Inverse, 	Triggered)
VALUES	('QUO_REQ_BIOME_BOREAL_EUROPE_CITY_HAS_PALACE', 		'REQUIREMENT_CITY_HAS_BUILDING',	0,0,0) ;


INSERT INTO Requirements
	(RequirementId, 		RequirementType, 	Likeliness,	Inverse, 	Triggered)
SELECT	'QUO_REQ_BIOME_BOREAL_EUROPE_CIVIC_' || CivicType, 		'REQUIREMENT_PLAYER_HAS_CIVIC',	0,0,0 
FROM tblQuoBIOME_BOREAL_EUROPE_Civics;


INSERT INTO RequirementArguments 
	(RequirementId,			Name, 			Type, 			Value, 				Extra, 	SecondExtra)
VALUES 	('QUO_REQ_BIOME_BOREAL_EUROPE_CITY_HAS_PALACE',	'BuildingType',		'ARGTYPE_IDENTITY',	'BUILDING_PALACE',	NULL,	NULL 	)  ;


INSERT INTO RequirementArguments 
	(RequirementId,			Name, 			Type, 			Value, 				Extra, 	SecondExtra)
SELECT 'QUO_REQ_BIOME_BOREAL_EUROPE_CIVIC_' || CivicType,	'CivicType',		'ARGTYPE_IDENTITY',	CivicType,	NULL,	NULL 	
FROM tblQuoBIOME_BOREAL_EUROPE_Civics;


INSERT INTO RequirementSets
	(RequirementSetId, 		RequirementSetType)
SELECT 'QUO_REQSET_BIOME_BOREAL_EUROPE_CIVIC_' || CivicType,'REQUIREMENTSET_TEST_ALL'
FROM tblQuoBIOME_BOREAL_EUROPE_Civics;
	
		
INSERT INTO RequirementSetRequirements
	(RequirementSetId,	RequirementId)
SELECT	'QUO_REQSET_BIOME_BOREAL_EUROPE_CIVIC_' || CivicType, 	'QUO_REQ_BIOME_BOREAL_EUROPE_CITY_HAS_PALACE'
FROM tblQuoBIOME_BOREAL_EUROPE_Civics;

INSERT INTO RequirementSetRequirements
	(RequirementSetId,	RequirementId)
SELECT	'QUO_REQSET_BIOME_BOREAL_EUROPE_CIVIC_' || CivicType, 	'QUO_REQ_BIOME_BOREAL_EUROPE_CIVIC_' || CivicType
FROM tblQuoBIOME_BOREAL_EUROPE_Civics;


-- Generate the unit at the start of each appropriate era 
INSERT INTO Modifiers 
	(ModifierId, ModifierType, RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
SELECT 'QUO_BIOME_BOREAL_EUROPE_FREE_MIL_ENGINEER_' || CivicType, 'MODIFIER_SINGLE_CITY_GRANT_UNIT_IN_CITY', 1, 1, NULL, NULL 
FROM tblQuoBIOME_BOREAL_EUROPE_Civics;


INSERT INTO Modifiers 
	(ModifierId, ModifierType, RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
SELECT 'QUO_BIOME_BOREAL_EUROPE_FREE_MIL_ENGINEER_PLAYER_' || CivicType, 'MODIFIER_PLAYER_CITIES_ATTACH_MODIFIER', 0, 0, NULL, 	'QUO_REQSET_BIOME_BOREAL_EUROPE_CIVIC_' || CivicType
FROM tblQuoBIOME_BOREAL_EUROPE_Civics;


INSERT INTO ModifierArguments
	(ModifierId, 			Name, 		Type, 			Value, 					Extra, 	SecondExtra)
SELECT 'QUO_BIOME_BOREAL_EUROPE_FREE_MIL_ENGINEER_' || CivicType, 	'Amount', 'ARGTYPE_IDENTITY', 	'1',	NULL, 	NULL 
FROM tblQuoBIOME_BOREAL_EUROPE_Civics;
 
 
INSERT INTO ModifierArguments
	(ModifierId, 			Name, 		Type, 			Value, 					Extra, 	SecondExtra)
SELECT 'QUO_BIOME_BOREAL_EUROPE_FREE_MIL_ENGINEER_' || CivicType, 	'UnitType', 	'ARGTYPE_IDENTITY', 	'UNIT_MILITARY_ENGINEER',		NULL, 	NULL 
FROM tblQuoBIOME_BOREAL_EUROPE_Civics;


INSERT INTO ModifierArguments
	(ModifierId, 			Name, 		Type, 			Value, 					Extra, 	SecondExtra)
SELECT 'QUO_BIOME_BOREAL_EUROPE_FREE_MIL_ENGINEER_PLAYER_' || CivicType, 		'ModifierId', 		'ARGTYPE_IDENTITY', 	'QUO_BIOME_BOREAL_EUROPE_FREE_MIL_ENGINEER_' || CivicType,	NULL, 	NULL
FROM tblQuoBIOME_BOREAL_EUROPE_Civics;

	
INSERT INTO TraitModifiers
	(TraitType, 			ModifierID)
SELECT	'QUO_TRAIT_BIOME_BOREAL_EUROPE',	'QUO_BIOME_BOREAL_EUROPE_FREE_MIL_ENGINEER_PLAYER_' || CivicType 	
FROM tblQuoBIOME_BOREAL_EUROPE_Civics;



-- Knockback
INSERT INTO Types
	(Type, 				Kind)
VALUES 	('QUO_ABILITY_BIOME_BOREAL_EUROPE_EXTRA_SUPPORT',	'KIND_ABILITY'	) ;


INSERT INTO TypeTags
	(Type,					Tag)
VALUES  ('QUO_ABILITY_BIOME_BOREAL_EUROPE_EXTRA_SUPPORT', 	'CLASS_RECON'), 
		('QUO_ABILITY_BIOME_BOREAL_EUROPE_EXTRA_SUPPORT', 		'CLASS_MELEE'), 
		('QUO_ABILITY_BIOME_BOREAL_EUROPE_EXTRA_SUPPORT', 		'CLASS_HEAVY_CAVALRY'),
		('QUO_ABILITY_BIOME_BOREAL_EUROPE_EXTRA_SUPPORT', 		'CLASS_LIGHT_CAVALRY');
 

-- the modifier itself, including the amount of the bonus
INSERT INTO Modifiers 
	(ModifierId, 			ModifierType, 				RunOnce, 	Permanent, 	OwnerRequirementSetId, 	SubjectRequirementSetId)
VALUES	('QUO_MOD_BIOME_BOREAL_EUROPE_EXTRA_SUPPORT', 		'MODIFIER_UNIT_ADJUST_FORCE_RETREAT', 	0, 		0, 		NULL, 			NULL) ;


INSERT INTO ModifierArguments
	(ModifierId, 			Name, 		Type, 			Value, 		Extra, 	SecondExtra)
VALUES	('QUO_MOD_BIOME_BOREAL_EUROPE_EXTRA_SUPPORT', 		'ForceRetreat', 	'ARGTYPE_IDENTITY', 	'1',	NULL, 	NULL) ;



-- the ability containing the modifier
INSERT INTO UnitAbilities
	(UnitAbilityType,		Name,				Description,			Inactive)
VALUES	('QUO_ABILITY_BIOME_BOREAL_EUROPE_EXTRA_SUPPORT',	'QUO_LOC_EXTRA_VISION',		'QUO_LOC_EXTRA_VISION_DESC',	"1"	) ;


INSERT INTO UnitAbilityModifiers
	(UnitAbilityType, 			ModifierId)
VALUES 	('QUO_ABILITY_BIOME_BOREAL_EUROPE_EXTRA_SUPPORT', 		'QUO_MOD_BIOME_BOREAL_EUROPE_EXTRA_SUPPORT');


		
-- Associate the new ability with Boreal Eur/Scandi
INSERT INTO Modifiers 
	(ModifierId, 			ModifierType, 				RunOnce, 	Permanent, 	OwnerRequirementSetId, 	SubjectRequirementSetId)
VALUES	('QUO_BIOME_BOREAL_EUROPE_SUPPORT_PLAYER', 	'MODIFIER_PLAYER_UNITS_GRANT_ABILITY', 	0, 		1, 		NULL, 			NULL) ;


INSERT INTO ModifierArguments
	(ModifierId, 			Name, 		Type, 			Value, 		Extra, 	SecondExtra)
VALUES	('QUO_BIOME_BOREAL_EUROPE_SUPPORT_PLAYER', 	'AbilityType', 	'ARGTYPE_IDENTITY', 	'QUO_ABILITY_BIOME_BOREAL_EUROPE_EXTRA_SUPPORT',	NULL, 	NULL) ;


INSERT INTO TraitModifiers
	(TraitType, 					ModifierID)
VALUES	('QUO_TRAIT_BIOME_BOREAL_EUROPE',			'QUO_BIOME_BOREAL_EUROPE_SUPPORT_PLAYER') ;








-- ROMANESQUE
UPDATE tblQuoDebug SET Message='Romanesque' WHERE DebugID='Quo_Biome_Code';

 
-- no loyalty
INSERT INTO Modifiers 
	(ModifierId, ModifierType, RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
VALUES	('QUO_BIOME_ROMANESQUE_GOVERNOR_REVERSE_LOYALTY', 'MODIFIER_PLAYER_CITIES_ADJUST_IDENTITY_PER_TURN', 0, 0, NULL, 'CITY_HAS_ASSIGNED_GOVERNOR')  ;

INSERT INTO ModifierArguments
	(ModifierId, 			Name, 		Type, 			Value, 			Extra, 	SecondExtra)
VALUES	('QUO_BIOME_ROMANESQUE_GOVERNOR_REVERSE_LOYALTY', 	'Amount', 	'ARGTYPE_IDENTITY', 	'-8',			NULL, 	NULL) ;	

INSERT INTO TraitModifiers
	(TraitType, 			ModifierID)
VALUES	('QUO_TRAIT_BIOME_ROMANESQUE',	'QUO_BIOME_ROMANESQUE_GOVERNOR_REVERSE_LOYALTY') ;   



-- cities route bomb
INSERT INTO Modifiers 
	(ModifierId, ModifierType, RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
VALUES	('QUO_BIOME_ROMANESQUE_FREE_ROADS', 'MODIFIER_GRANT_ROUTE_IN_RADIUS', 0, 0, NULL, NULL)  ,
		('QUO_BIOME_ROMANESQUE_FREE_ROADS_PLAYER', 'MODIFIER_PLAYER_CITIES_ATTACH_MODIFIER', 0, 0, NULL, NULL)  ;

INSERT INTO ModifierArguments
	(ModifierId, 			Name, 		Type, 			Value, 			Extra, 	SecondExtra)
VALUES	('QUO_BIOME_ROMANESQUE_FREE_ROADS', 	'RouteType', 	'ARGTYPE_IDENTITY', 	'ROUTE_MEDIEVAL_ROAD',			NULL, 	NULL) ,	
		('QUO_BIOME_ROMANESQUE_FREE_ROADS', 	'Radius', 	'ARGTYPE_IDENTITY', 	'3',			NULL, 	NULL) ,	
		('QUO_BIOME_ROMANESQUE_FREE_ROADS_PLAYER', 	'ModifierId', 	'ARGTYPE_IDENTITY', 	'QUO_BIOME_ROMANESQUE_FREE_ROADS',			NULL, 	NULL) ;	

INSERT INTO TraitModifiers
	(TraitType, 			ModifierID)
VALUES	('QUO_TRAIT_BIOME_ROMANESQUE',	'QUO_BIOME_ROMANESQUE_FREE_ROADS_PLAYER') ;   




-- Extra districts in the city with the government plaza
-- Reuses firaxis created CITY_HAS_GOV_DISTRICT
INSERT INTO Modifiers 
	(ModifierId, ModifierType, RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
VALUES	('QUO_BIOME_ROMANESQUE_EXTRA_DISTRICTS', 'MODIFIER_PLAYER_CITIES_EXTRA_DISTRICT', 0, 0, NULL, 'CITY_HAS_GOV_DISTRICT') ;

INSERT INTO ModifierArguments
	(ModifierId, 			Name, 		Type, 			Value, 					Extra, 	SecondExtra)
VALUES	('QUO_BIOME_ROMANESQUE_EXTRA_DISTRICTS', 	'Amount', 'ARGTYPE_IDENTITY', 	'20',	NULL, 	NULL) ;

INSERT INTO TraitModifiers
	(TraitType, 			ModifierID)
VALUES	('QUO_TRAIT_BIOME_ROMANESQUE',	'QUO_BIOME_ROMANESQUE_EXTRA_DISTRICTS' );
  


-- Unlock districts one tech or civic prior to the normal unlock on the trees

create table tblQuoBIOME_ROMANESQUEDistrictUnlocks as
select districttype, technologyprereqs.PrereqTech as xUnlocker, 'REQUIREMENT_PLAYER_HAS_TECHNOLOGY' as xReqType, 'TechType' as xName from districts
left join technologyprereqs on districts.PrereqTech = technologyprereqs.Technology
where xUnlocker is not null AND traittype is null OR traittype not in (select traittype from districts where traittype is not null and traittype not in ('TRAIT_CIVILIZATION_DISTRICT_BATH', 'TRAIT_CIVILIZATION_DISTRICT_COTHON', 'TRAIT_CIVILIZATION_DISTRICT_ACROPOLIS'))

UNION

select districttype, civicprereqs.PrereqCivic as xUnlocker, 'REQUIREMENT_PLAYER_HAS_CIVIC' as xReqType, 'CivicType' as xName from districts
left join civicprereqs on districts.Prereqcivic = civicprereqs.Civic
where xUnlocker is not null AND traittype is null OR traittype not in (select traittype from districts where traittype is not null and traittype not in ('TRAIT_CIVILIZATION_DISTRICT_BATH', 'TRAIT_CIVILIZATION_DISTRICT_COTHON', 'TRAIT_CIVILIZATION_DISTRICT_ACROPOLIS'));

delete from tblQuoBIOME_ROMANESQUEDistrictUnlocks where xUnlocker is null;



/* INSERT OR REPLACE INTO Requirements
		(RequirementId, 		RequirementType, 	Likeliness,	Inverse, 	Triggered)
SELECT  "QUO_REQ_BIOME_ROMANESQUE_UNLOCK_" || DistrictType || "_" || xUnlocker , xReqType, 0, 0, 0  
	FROM  tblQuoBIOME_ROMANESQUEDistrictUnlocks;


INSERT OR REPLACE INTO RequirementArguments 
	(RequirementId,			Name, 			Type, 			Value, 				Extra, 	SecondExtra)
SELECT 	"QUO_REQ_BIOME_ROMANESQUE_UNLOCK_" || DistrictType || "_" || xUnlocker, xName, 'ARGTYPE_IDENTITY', xUnlocker, NULL, NULL
	FROM  tblQuoBIOME_ROMANESQUEDistrictUnlocks ;


INSERT OR REPLACE INTO RequirementSets 
	(RequirementSetId, 		RequirementSetType)
SELECT "QUO_REQSET_BIOME_ROMANESQUE_UNLOCK_" || DistrictType || "_" || xUnlocker, 	'REQUIREMENTSET_TEST_ALL'
	FROM  tblQuoBIOME_ROMANESQUEDistrictUnlocks ;

INSERT OR REPLACE INTO RequirementSetRequirements
	(RequirementSetId,	RequirementId)
SELECT	"QUO_REQSET_BIOME_ROMANESQUE_UNLOCK_" || DistrictType || "_" || xUnlocker, 	"QUO_REQ_BIOME_ROMANESQUE_UNLOCK_" || DistrictType || "_" || xUnlocker
	FROM  tblQuoBIOME_ROMANESQUEDistrictUnlocks ; */



INSERT OR REPLACE INTO Modifiers 
	(ModifierId, 	ModifierType, 	RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
SELECT	"QUO_BIOME_ROMANESQUE_UNLOCK_" || DistrictType || "_" || xUnlocker, 	'MODIFIER_PLAYER_ADJUST_DISTRICT_UNLOCK', 0, 0, NULL, NULL
	FROM tblQuoBIOME_ROMANESQUEDistrictUnlocks;


INSERT OR REPLACE INTO ModifierArguments
	(ModifierId, 			Name, 		Type, 			Value, 					Extra, 	SecondExtra)
SELECT "QUO_BIOME_ROMANESQUE_UNLOCK_" || DistrictType || "_" || xUnlocker, 	'DistrictType', 	'ARGTYPE_IDENTITY', 	DistrictType,					NULL, 	NULL 	
	FROM tblQuoBIOME_ROMANESQUEDistrictUnlocks;

	
INSERT OR REPLACE INTO ModifierArguments
	(ModifierId, 			Name, 		Type, 			Value, 					Extra, 	SecondExtra)
SELECT "QUO_BIOME_ROMANESQUE_UNLOCK_" || DistrictType || "_" || xUnlocker, 	xName, 	'ARGTYPE_IDENTITY', 	xUnlocker,					NULL, 	NULL 	
	FROM tblQuoBIOME_ROMANESQUEDistrictUnlocks;

	
	
INSERT OR REPLACE INTO TraitModifiers
	(TraitType, 		ModifierId)
SELECT 'QUO_TRAIT_BIOME_ROMANESQUE',	"QUO_BIOME_ROMANESQUE_UNLOCK_" || DistrictType || "_" || xUnlocker 
	FROM tblQuoBIOME_ROMANESQUEDistrictUnlocks;



	
-- unlock animal husbandry and government plaza	
/*INSERT INTO Modifiers 
	(ModifierId, 	ModifierType, 	RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
VALUES	('QUO_MOD_BIOME_ROMANESQUE_FREE_TECH', 	'MODIFIER_PLAYER_GRANT_SPECIFIC_TECHNOLOGY', 0, 0, NULL, NULL) ;


INSERT INTO ModifierArguments
	(ModifierId, 			Name, 		Type, 			Value, 					Extra, 	SecondExtra)
VALUES	('QUO_MOD_BIOME_ROMANESQUE_FREE_TECH', 	'TechType', 	'ARGTYPE_IDENTITY', 	'TECH_ANIMAL_HUSBANDRY',		NULL, 	NULL) ;

INSERT INTO TraitModifiers
		(TraitType, 			ModifierID)
VALUES	('QUO_TRAIT_BIOME_ROMANESQUE',	'QUO_MOD_BIOME_ROMANESQUE_FREE_TECH')  ;


INSERT INTO Modifiers 
		(ModifierId, ModifierType, RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
VALUES	('QUO_BIOME_ROMANESQUE_UNLOCK_GOVERNMENT_PLAZA', 'MODIFIER_PLAYER_ADJUST_DISTRICT_UNLOCK', 0, 0, NULL, NULL)   ;
 
INSERT INTO ModifierArguments
		(ModifierId, 			Name, 		Type, 			Value, 			Extra, 	SecondExtra)
VALUES	('QUO_BIOME_ROMANESQUE_UNLOCK_GOVERNMENT_PLAZA', 	'DistrictType', 	'ARGTYPE_IDENTITY', 	'DISTRICT_GOVERNMENT',			NULL, 	NULL) ,
		('QUO_BIOME_ROMANESQUE_UNLOCK_GOVERNMENT_PLAZA', 	'TechType', 	'ARGTYPE_IDENTITY', 	'TECH_ANIMAL_HUSBANDRY',			NULL, 	NULL) ;
		
INSERT INTO TraitModifiers
		(TraitType, 			ModifierID)
VALUES	('QUO_TRAIT_BIOME_ROMANESQUE',	'QUO_BIOME_ROMANESQUE_UNLOCK_GOVERNMENT_PLAZA')  ;*/




-- ASIAN EXPANSE / MAINLAND ASIA
UPDATE tblQuoDebug SET Message='Asian Expanse' WHERE DebugID='Quo_Biome_Code';




	
-- Lower range for Siege units
INSERT INTO Requirements
	(RequirementId, 		RequirementType, 	Likeliness,	Inverse, 	Triggered)
VALUES	('QUO_REQ_BIOME_ASIAN_EXPANSE_RANGED', 	'REQUIREMENT_UNIT_PROMOTION_CLASS_MATCHES',	0,0,0)  ;

INSERT INTO RequirementArguments 
		(RequirementId,			Name, 			Type, 			Value, 		Extra, 	SecondExtra)
VALUES 	('QUO_REQ_BIOME_ASIAN_EXPANSE_RANGED',	'UnitPromotionClass',		'ARGTYPE_IDENTITY',		'PROMOTION_CLASS_SIEGE',	NULL,	NULL 	)  ;

INSERT INTO RequirementSets 
	(RequirementSetId, 		RequirementSetType)
VALUES 	('QUO_REQSET_BIOME_ASIAN_EXPANSE_RANGED', 	'REQUIREMENTSET_TEST_ANY') ;

 INSERT INTO RequirementSetRequirements
	(RequirementSetId,	RequirementId)
VALUES	('QUO_REQSET_BIOME_ASIAN_EXPANSE_RANGED', 	'QUO_REQ_BIOME_ASIAN_EXPANSE_RANGED')  ;


 INSERT INTO Modifiers 
	(ModifierId, 	ModifierType, 	RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
VALUES	('QUO_BIOME_ASIAN_EXPANSE_RANGE', 	'MODIFIER_UNIT_ADJUST_ATTACK_RANGE', 0, 0, NULL, NULL) ,
		('QUO_BIOME_ASIAN_EXPANSE_RANGE_PLAYER', 	'MODIFIER_PLAYER_UNITS_ATTACH_MODIFIER', 0, 0, NULL, 'QUO_REQSET_BIOME_ASIAN_EXPANSE_RANGED') ;

INSERT INTO ModifierArguments
	(ModifierId, 			Name, 		Type, 			Value, 					Extra, 	SecondExtra)
VALUES	('QUO_BIOME_ASIAN_EXPANSE_RANGE', 	'Amount', 	'ARGTYPE_IDENTITY', 	'-1',					NULL, 	NULL) ,	
		('QUO_BIOME_ASIAN_EXPANSE_RANGE_PLAYER', 	'ModifierId', 	'ARGTYPE_IDENTITY', 	'QUO_BIOME_ASIAN_EXPANSE_RANGE',		NULL, 	NULL)   ;

INSERT INTO TraitModifiers
	(TraitType, 			ModifierID)
VALUES	('QUO_TRAIT_BIOME_ASIAN_EXPANSE',	'QUO_BIOME_ASIAN_EXPANSE_RANGE_PLAYER') ;



-- Free power with each governor title
CREATE TABLE tblQuoAsianExpanseGovernorTitles 
(
	xLevel text PRIMARY KEY
);


INSERT INTO tblQuoAsianExpanseGovernorTitles
	(xLevel)
VALUES	('1'),
		('2'),
		('3'),
		('4'),
		('5'),
		('6'),
		('7');
  

INSERT INTO Requirements
	(RequirementId, 		RequirementType, 	Likeliness,	Inverse, 	Triggered)
SELECT	'QUO_REQ_BIOME_ASIAN_EXPANSE_GOV_' || xLevel, 	'REQUIREMENT_CITY_HAS_GOVERNOR_WITH_X_TITLES',	0,0,0 
	FROM tblQuoAsianExpanseGovernorTitles;

INSERT INTO RequirementArguments 
		(RequirementId,			Name, 			Type, 			Value, 		Extra, 	SecondExtra)
SELECT 'QUO_REQ_BIOME_ASIAN_EXPANSE_GOV_' || xLevel,	'Amount',		'ARGTYPE_IDENTITY',		xLevel,	NULL,	NULL 	
	FROM tblQuoAsianExpanseGovernorTitles;

INSERT INTO RequirementArguments 
		(RequirementId,			Name, 			Type, 			Value, 		Extra, 	SecondExtra)
SELECT 'QUO_REQ_BIOME_ASIAN_EXPANSE_GOV_' || xLevel,	'Established',		'ARGTYPE_IDENTITY',		'1',	NULL,	NULL 	
	FROM tblQuoAsianExpanseGovernorTitles;
	
INSERT INTO RequirementSets 
	(RequirementSetId, 		RequirementSetType)
SELECT 'QUO_REQSET_BIOME_ASIAN_EXPANSE_GOV_' || xLevel, 	'REQUIREMENTSET_TEST_ALL'
	FROM tblQuoAsianExpanseGovernorTitles;

INSERT INTO RequirementSetRequirements
	(RequirementSetId,	RequirementId)
SELECT	'QUO_REQSET_BIOME_ASIAN_EXPANSE_GOV_' || xLevel, 'QUO_REQ_BIOME_ASIAN_EXPANSE_GOV_' || xLevel
	FROM tblQuoAsianExpanseGovernorTitles;
	
INSERT INTO RequirementSetRequirements
	(RequirementSetId,	RequirementId)
SELECT	'QUO_REQSET_BIOME_ASIAN_EXPANSE_GOV_' || xLevel, 'QUO_REQ_GLOBAL_ERA_IS_ATLEAST_INDUSTRIAL'
	FROM tblQuoAsianExpanseGovernorTitles;



INSERT INTO Modifiers 
	(ModifierId, ModifierType, RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
SELECT 'QUO_BIOME_ASIAN_EXPANSE_FREE_POWER_' || xLevel, 'MODIFIER_PLAYER_CITIES_ADJUST_FREE_POWER', 0, 0, NULL, 'QUO_REQSET_BIOME_ASIAN_EXPANSE_GOV_' || xLevel
	FROM tblQuoAsianExpanseGovernorTitles;

INSERT INTO ModifierArguments
	(ModifierId, 			Name, 			Type, 			Value, 				Extra, 	SecondExtra)
SELECT 'QUO_BIOME_ASIAN_EXPANSE_FREE_POWER_' || xLevel, 	'Amount', 		'ARGTYPE_IDENTITY', 	'2',				NULL, 	NULL
	FROM tblQuoAsianExpanseGovernorTitles;
		
INSERT INTO ModifierArguments
	(ModifierId, 			Name, 			Type, 			Value, 				Extra, 	SecondExtra)
SELECT 'QUO_BIOME_ASIAN_EXPANSE_FREE_POWER_' || xLevel, 	'SourceType', 		'ARGTYPE_IDENTITY', 	'FREE_POWER_SOURCE_MISC',				NULL, 	NULL
	FROM tblQuoAsianExpanseGovernorTitles;
		
INSERT INTO TraitModifiers
	(TraitType, 			ModifierID)
SELECT 'QUO_TRAIT_BIOME_ASIAN_EXPANSE',	'QUO_BIOME_ASIAN_EXPANSE_FREE_POWER_' || xLevel
	FROM tblQuoAsianExpanseGovernorTitles;

		

-- build mines on flat planes
-- removed in v7.0.10
/*INSERT INTO Modifiers 
	(ModifierId, ModifierType, RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
VALUES	('QUO_BIOME_ASIAN_EXPANSE_PLAINS_MINES', 'MODIFIER_PLAYER_CITIES_ADJUST_IMPROVEMENT_VALID_TERRAIN', 0, 0, NULL, NULL) ,
		('QUO_BIOME_ASIAN_EXPANSE_GRASS_MINES', 'MODIFIER_PLAYER_CITIES_ADJUST_IMPROVEMENT_VALID_TERRAIN', 0, 0, NULL, NULL) ; 


INSERT INTO ModifierArguments
	(ModifierId, 			Name, 			Type, 			Value, 				Extra, 	SecondExtra)
VALUES	('QUO_BIOME_ASIAN_EXPANSE_PLAINS_MINES', 	'ImprovementType', 		'ARGTYPE_IDENTITY', 	'IMPROVEMENT_MINE',				NULL, 	NULL)  ,
		('QUO_BIOME_ASIAN_EXPANSE_PLAINS_MINES', 	'TerrainType', 		'ARGTYPE_IDENTITY', 	'TERRAIN_PLAINS',				NULL, 	NULL)  ,
		
		('QUO_BIOME_ASIAN_EXPANSE_GRASS_MINES', 	'ImprovementType', 		'ARGTYPE_IDENTITY', 	'IMPROVEMENT_MINE',				NULL, 	NULL)  ,
		('QUO_BIOME_ASIAN_EXPANSE_GRASS_MINES', 	'TerrainType', 		'ARGTYPE_IDENTITY', 	'TERRAIN_GRASS',				NULL, 	NULL)  ;
		

INSERT INTO TraitModifiers
	(TraitType, 			ModifierID)
VALUES	('QUO_TRAIT_BIOME_ASIAN_EXPANSE',	'QUO_BIOME_ASIAN_EXPANSE_PLAINS_MINES'),
		('QUO_TRAIT_BIOME_ASIAN_EXPANSE',	'QUO_BIOME_ASIAN_EXPANSE_GRASS_MINES');*/
 
 
-- Cannot build Industrial Zones
-- removed in v7.0.10
/*INSERT INTO ExcludedDistricts 
	(DistrictType,			TraitType)
VALUES ('DISTRICT_INDUSTRIAL_ZONE',	'QUO_TRAIT_BIOME_ASIAN_EXPANSE') ; */
 
 
 
 -- Bonus to flat mines
/*INSERT INTO RequirementSets 
	(RequirementSetId, 		RequirementSetType)
VALUES 	('QUO_REQSET_BIOME_ASIAN_EXPANSE_MINE_BONUS_ON_PLAINS', 	'REQUIREMENTSET_TEST_ALL') ,
		('QUO_REQSET_BIOME_ASIAN_EXPANSE_MINE_BONUS_ON_GRASS', 	'REQUIREMENTSET_TEST_ALL') ;

--NOTE: Reuses the No Hills plains and grass requirements created for Asian Steppe,so the order of these Biomes matters in this file. 
INSERT INTO RequirementSetRequirements
	(RequirementSetId,	RequirementId)
VALUES	('QUO_REQSET_BIOME_ASIAN_EXPANSE_MINE_BONUS_ON_PLAINS', 	'QUO_REQ_BIOME_ASIAN_STEPPE_GRASS_NO_HILLS'),
		('QUO_REQSET_BIOME_ASIAN_EXPANSE_MINE_BONUS_ON_PLAINS', 	'REQUIRES_PLOT_HAS_MINE'),
		--('QUO_REQSET_BIOME_ASIAN_EXPANSE_MINE_BONUS_ON_PLAINS', 	'QUO_REQ_GLOBAL_ERA_IS_ATLEAST_CLASSICAL'),
		
		('QUO_REQSET_BIOME_ASIAN_EXPANSE_MINE_BONUS_ON_GRASS', 	'QUO_REQ_BIOME_ASIAN_STEPPE_PLAINS_NO_HILLS'),
		('QUO_REQSET_BIOME_ASIAN_EXPANSE_MINE_BONUS_ON_GRASS', 	'REQUIRES_PLOT_HAS_MINE');
		--('QUO_REQSET_BIOME_ASIAN_EXPANSE_MINE_BONUS_ON_GRASS', 	'QUO_REQ_GLOBAL_ERA_IS_ATLEAST_CLASSICAL');
 
 
INSERT INTO Modifiers
	(ModifierID, 			ModifierType, 					RunOnce, 	Permanent, 	OwnerRequirementSetId, 	SubjectRequirementSetId)
VALUES	('QUO_BIOME_ASIAN_EXPANSE_MINE_BONUS_ON_PLAINS', 	'MODIFIER_PLAYER_ADJUST_PLOT_YIELD', 	0, 		0, 		NULL,			'QUO_REQSET_BIOME_ASIAN_EXPANSE_MINE_BONUS_ON_PLAINS') ,
		('QUO_BIOME_ASIAN_EXPANSE_MINE_BONUS_ON_GRASS', 	'MODIFIER_PLAYER_ADJUST_PLOT_YIELD', 	0, 		0, 		NULL,			'QUO_REQSET_BIOME_ASIAN_EXPANSE_MINE_BONUS_ON_GRASS') ,
		('QUO_BIOME_ASIAN_EXPANSE_MINE_BONUS_ON_PLAINS_FOOD', 	'MODIFIER_PLAYER_ADJUST_PLOT_YIELD', 	0, 		0, 		NULL,			'QUO_REQSET_BIOME_ASIAN_EXPANSE_MINE_BONUS_ON_PLAINS') ,
		('QUO_BIOME_ASIAN_EXPANSE_MINE_BONUS_ON_GRASS_FOOD', 	'MODIFIER_PLAYER_ADJUST_PLOT_YIELD', 	0, 		0, 		NULL,			'QUO_REQSET_BIOME_ASIAN_EXPANSE_MINE_BONUS_ON_GRASS') ;


INSERT INTO ModifierArguments
	(ModifierID,			Name,		Type, 				Value,			Extra)
VALUES	('QUO_BIOME_ASIAN_EXPANSE_MINE_BONUS_ON_PLAINS', 	'Amount', 	'ARGTYPE_IDENTITY', 		'1',			NULL) ,
		('QUO_BIOME_ASIAN_EXPANSE_MINE_BONUS_ON_PLAINS', 	'YieldType', 	'ARGTYPE_IDENTITY', 		'YIELD_PRODUCTION',			NULL) ,
		
		('QUO_BIOME_ASIAN_EXPANSE_MINE_BONUS_ON_GRASS', 	'Amount', 	'ARGTYPE_IDENTITY', 		'1',			NULL) ,
		('QUO_BIOME_ASIAN_EXPANSE_MINE_BONUS_ON_GRASS', 	'YieldType', 	'ARGTYPE_IDENTITY', 		'YIELD_PRODUCTION',			NULL) ,
		
		('QUO_BIOME_ASIAN_EXPANSE_MINE_BONUS_ON_PLAINS_FOOD', 	'Amount', 	'ARGTYPE_IDENTITY', 		'-1',			NULL) ,
		('QUO_BIOME_ASIAN_EXPANSE_MINE_BONUS_ON_PLAINS_FOOD', 	'YieldType', 	'ARGTYPE_IDENTITY', 		'YIELD_FOOD',			NULL) ,
		
		('QUO_BIOME_ASIAN_EXPANSE_MINE_BONUS_ON_GRASS_FOOD', 	'Amount', 	'ARGTYPE_IDENTITY', 		'-1',			NULL) ,
		('QUO_BIOME_ASIAN_EXPANSE_MINE_BONUS_ON_GRASS_FOOD', 	'YieldType', 	'ARGTYPE_IDENTITY', 		'YIELD_FOOD',			NULL) ;
		
		


INSERT INTO TraitModifiers
	(TraitType, 				ModifierID)
VALUES	('QUO_TRAIT_BIOME_ASIAN_EXPANSE',	'QUO_BIOME_ASIAN_EXPANSE_MINE_BONUS_ON_PLAINS') ,
		('QUO_TRAIT_BIOME_ASIAN_EXPANSE',	'QUO_BIOME_ASIAN_EXPANSE_MINE_BONUS_ON_GRASS') ;
		--('QUO_TRAIT_BIOME_ASIAN_EXPANSE',	'QUO_BIOME_ASIAN_EXPANSE_MINE_BONUS_ON_PLAINS_FOOD') ,
		--('QUO_TRAIT_BIOME_ASIAN_EXPANSE',	'QUO_BIOME_ASIAN_EXPANSE_MINE_BONUS_ON_GRASS_FOOD') ;*/

 
 
 
		
-- Grant free tiles when a great person is expended
INSERT INTO RequirementSets 
	(RequirementSetId, 		RequirementSetType)
VALUES 	('QUO_REQSET_BIOME_ASIAN_EXPANSE_FREEPOP_ERA', 	'REQUIREMENTSET_TEST_ALL') ;


INSERT INTO RequirementSetRequirements
	(RequirementSetId,	RequirementId)
VALUES	--('QUO_REQSET_BIOME_ASIAN_EXPANSE_FREEPOP_ERA', 	'QUO_REQ_GLOBAL_ERA_IS_ATLEAST_CLASSICAL') ,
		('QUO_REQSET_BIOME_ASIAN_EXPANSE_FREEPOP_ERA', 	'QUO_REQ_GLOBAL_ERA_NOT_YET_RENAISSANCE') ;



INSERT INTO Types
	(Type, 				Kind)
VALUES 	('QUO_MODTYPE_ASIAN_EXPANSE_FREE_POPULATION',	'KIND_MODIFIER'	) ;

INSERT INTO DynamicModifiers
		(ModifierType, CollectionType, EffectType)
VALUES 	('QUO_MODTYPE_ASIAN_EXPANSE_FREE_POPULATION', 'COLLECTION_OWNER','EFFECT_ADJUST_CITY_POPULATION');



-- Reuse the modifiertype used by ASIAN_EXPANSE
INSERT INTO Modifiers 
		(ModifierId, 	ModifierType, 	RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
VALUES	('QUO_ASIAN_EXPANSE_FREE_POPULATION', 'MODIFIER_PLAYER_CITIES_ADD_EXPENDED_GREAT_PERSON_TILES', 0, 0, NULL, NULL) ,
		('QUO_ASIAN_EXPANSE_FREE_POPULATION_PLAYER', 'MODIFIER_PLAYER_CITIES_ATTACH_MODIFIER', 0, 0, NULL, 'QUO_REQSET_BIOME_ASIAN_EXPANSE_FREEPOP_ERA') ;


INSERT INTO ModifierArguments
	(ModifierId, 			Name, 		Type, 			Value, 					Extra, 	SecondExtra)
VALUES	('QUO_ASIAN_EXPANSE_FREE_POPULATION', 	'Amount', 	'ARGTYPE_IDENTITY', 	'8',		NULL, 	NULL) ,
		--('QUO_ASIAN_EXPANSE_FREE_POPULATION', 	'YieldType', 	'ARGTYPE_IDENTITY', 	'YIELD_FOOD',		NULL, 	NULL) ,
		('QUO_ASIAN_EXPANSE_FREE_POPULATION_PLAYER', 		'ModifierId', 		'ARGTYPE_IDENTITY', 	'QUO_ASIAN_EXPANSE_FREE_POPULATION',	NULL, 	NULL) ;


INSERT INTO TraitModifiers
	(TraitType, 			ModifierID)
VALUES	('QUO_TRAIT_BIOME_ASIAN_EXPANSE',	'QUO_ASIAN_EXPANSE_FREE_POPULATION_PLAYER');




-- This used to provide free Great Engineer points for every X points of population 
-- Now provides free tiles when city reaches a new population level
CREATE TABLE tblQuoAsianExpanseLevels 
(
	Level text PRIMARY KEY
);

-- Table defining which levels serve as breakpoints
INSERT INTO tblQuoAsianExpanseLevels
	(Level)
VALUES	('3'),
		('6'),
		('9'),
		('12'),
		('15'),
		('18'),
		('21'),
		('24'),
		('27'),
		('30');
  

INSERT INTO Requirements
	(RequirementId, 		RequirementType, 	Likeliness,	Inverse, 	Triggered)
SELECT	'QUO_REQ_BIOME_ARABESQUE_CITY_POP_' || tblQuoAsianExpanseLevels.Level,		'REQUIREMENT_CITY_HAS_X_POPULATION',	0,0,0
FROM tblQuoAsianExpanseLevels;


INSERT INTO RequirementArguments 
	(RequirementId,			Name, 			Type, 			Value, 				Extra, 	SecondExtra)
SELECT 	'QUO_REQ_BIOME_ARABESQUE_CITY_POP_' || tblQuoAsianExpanseLevels.Level,	'Amount',		'ARGTYPE_IDENTITY',	tblQuoAsianExpanseLevels.Level,	NULL,	NULL 	
FROM tblQuoAsianExpanseLevels;

		
INSERT INTO RequirementSets 
	(RequirementSetId, 		RequirementSetType)
SELECT 	'QUO_REQSET_BIOME_ARABESQUE_CITY_POP_' || tblQuoAsianExpanseLevels.Level, 	'REQUIREMENTSET_TEST_ALL'
FROM tblQuoAsianExpanseLevels;


INSERT INTO RequirementSetRequirements
	(RequirementSetId,	RequirementId)
SELECT 'QUO_REQSET_BIOME_ARABESQUE_CITY_POP_' || tblQuoAsianExpanseLevels.Level, 	'QUO_REQ_BIOME_ARABESQUE_CITY_POP_' || tblQuoAsianExpanseLevels.Level
FROM tblQuoAsianExpanseLevels;


INSERT INTO Modifiers 
		(ModifierId, 	ModifierType, 	RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
SELECT	'QUO_ASIAN_EXPANSE_FREE_ENGINEER_PTS_PLAYER_' || tblQuoAsianExpanseLevels.Level, 'MODIFIER_PLAYER_CITIES_ADJUST_RANGED_STRIKE', 0, 0, NULL, 'QUO_REQSET_BIOME_ARABESQUE_CITY_POP_' || tblQuoAsianExpanseLevels.Level
FROM tblQuoAsianExpanseLevels;


/*INSERT INTO Modifiers 
		(ModifierId, 	ModifierType, 	RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
SELECT	'QUO_ASIAN_EXPANSE_FREE_ENGINEER_PTS_' || tblQuoAsianExpanseLevels.Level, 'MODIFIER_PLAYER_CITIES_ADD_EXPENDED_GREAT_PERSON_TILES', 0, 0, NULL, NULL
FROM tblQuoAsianExpanseLevels;*/


/*INSERT INTO ModifierArguments
	(ModifierId, 			Name, 		Type, 			Value, 					Extra, 	SecondExtra)
SELECT	'QUO_ASIAN_EXPANSE_FREE_ENGINEER_PTS_PLAYER_' || tblQuoAsianExpanseLevels.Level, 	'ModifierId', 	'ARGTYPE_IDENTITY', 	'QUO_ASIAN_EXPANSE_FREE_ENGINEER_PTS_' || tblQuoAsianExpanseLevels.Level,		NULL, 	NULL
FROM tblQuoAsianExpanseLevels;*/

INSERT INTO ModifierArguments
	(ModifierId, 			Name, 		Type, 			Value, 					Extra, 	SecondExtra)
SELECT	'QUO_ASIAN_EXPANSE_FREE_ENGINEER_PTS_PLAYER_' || tblQuoAsianExpanseLevels.Level, 	'Amount', 	'ARGTYPE_IDENTITY', 	'3',		NULL, 	NULL 
FROM tblQuoAsianExpanseLevels;

/*INSERT INTO ModifierArguments
	(ModifierId, 			Name, 		Type, 			Value, 					Extra, 	SecondExtra)
SELECT	'QUO_ASIAN_EXPANSE_FREE_ENGINEER_PTS_' || tblQuoAsianExpanseLevels.Level, 	'GreatPersonClassType', 	'ARGTYPE_IDENTITY', 	'GREAT_PERSON_CLASS_ENGINEER',		NULL, 	NULL 
FROM tblQuoAsianExpanseLevels;*/


INSERT INTO TraitModifiers
	(TraitType, 			ModifierID)
SELECT	'QUO_TRAIT_BIOME_ASIAN_EXPANSE',	'QUO_ASIAN_EXPANSE_FREE_ENGINEER_PTS_PLAYER_' || tblQuoAsianExpanseLevels.Level
FROM tblQuoAsianExpanseLevels;

 




-- WESTERN EUROPE
UPDATE tblQuoDebug SET Message='Western Europe' WHERE DebugID='Quo_Biome_Code';


--Bonus from each luxury
CREATE TABLE tblQuoBiomeWesternEuropeLuxuries AS 
select resourcetype from resources where resourceclasstype = 'RESOURCECLASS_LUXURY';

INSERT INTO Requirements
	(RequirementId, 		RequirementType, 	Likeliness,	Inverse, 	Triggered)
SELECT	'QUO_REQ_BIOME_WEST_EUROPE_HAS_IMPROVED_' || ResourceType,		'REQUIREMENT_PLAYER_HAS_RESOURCE_IMPROVED',	0,0,0
FROM tblQuoBiomeWesternEuropeLuxuries;


INSERT INTO RequirementArguments 
	(RequirementId,			Name, 			Type, 			Value, 				Extra, 	SecondExtra)
SELECT 	'QUO_REQ_BIOME_WEST_EUROPE_HAS_IMPROVED_' || ResourceType,	'ResourceType',		'ARGTYPE_IDENTITY',	ResourceType,	NULL,	NULL 	
FROM tblQuoBiomeWesternEuropeLuxuries;

		
INSERT INTO RequirementSets 
	(RequirementSetId, 		RequirementSetType)
SELECT 	'QUO_REQSET_BIOME_WEST_EUROPE_HAS_IMPROVED_' || ResourceType, 	'REQUIREMENTSET_TEST_ALL'
FROM tblQuoBiomeWesternEuropeLuxuries;


INSERT INTO RequirementSetRequirements
	(RequirementSetId,	RequirementId)
SELECT 'QUO_REQSET_BIOME_WEST_EUROPE_HAS_IMPROVED_' || ResourceType, 	'QUO_REQ_BIOME_WEST_EUROPE_HAS_IMPROVED_' || ResourceType
FROM tblQuoBiomeWesternEuropeLuxuries;

INSERT INTO Modifiers 
		(ModifierId, 	ModifierType, 	RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
SELECT	'QUO_WESTERN_EUROPE_FREE_ENGINEER_PTS_' || tblQuoBiomeWesternEuropeLuxuries.ResourceType, 'MODIFIER_PLAYER_UNITS_ADJUST_POST_COMBAT_YIELD', 0, 0, NULL, 'QUO_REQSET_BIOME_WEST_EUROPE_HAS_IMPROVED_' || ResourceType
FROM tblQuoBiomeWesternEuropeLuxuries;


INSERT INTO ModifierArguments
	(ModifierId, 			Name, 		Type, 			Value, 					Extra, 	SecondExtra)
SELECT	'QUO_WESTERN_EUROPE_FREE_ENGINEER_PTS_' || tblQuoBiomeWesternEuropeLuxuries.ResourceType, 	'PercentDefeatedStrength', 	'ARGTYPE_IDENTITY', 	'5',		NULL, 	NULL 
FROM tblQuoBiomeWesternEuropeLuxuries;

INSERT INTO ModifierArguments
	(ModifierId, 			Name, 		Type, 			Value, 					Extra, 	SecondExtra)
SELECT	'QUO_WESTERN_EUROPE_FREE_ENGINEER_PTS_' || tblQuoBiomeWesternEuropeLuxuries.ResourceType, 	'YieldType', 	'ARGTYPE_IDENTITY', 	'YIELD_GOLD',		NULL, 	NULL 
FROM tblQuoBiomeWesternEuropeLuxuries;


INSERT INTO TraitModifiers
	(TraitType, 			ModifierID)
SELECT	'QUO_TRAIT_BIOME_WEST_EUROPE',	'QUO_WESTERN_EUROPE_FREE_ENGINEER_PTS_' || tblQuoBiomeWesternEuropeLuxuries.ResourceType
FROM tblQuoBiomeWesternEuropeLuxuries;




/* CREATE TABLE tblQuoBiomeWesternEuropeUnits AS 
select unittype, technologies.eratype from units 
inner join technologies on technologies.TechnologyType = units.PrereqTech 
where promotionclass in  ("PROMOTION_CLASS_MELEE") AND eratype not in ("ERA_ANCIENT", "ERA_CLASSICAL")

union

select unittype, civics.EraType from units 
inner join civics on civics.CivicType = units.PrereqCivic
where promotionclass in  ("PROMOTION_CLASS_MELEE") AND eratype not in ("ERA_ANCIENT", "ERA_CLASSICAL");


INSERT INTO Tags 
	(Tag, 				Vocabulary)
VALUES 	('QUO_CLASS_WESTERN_EUROPE_PROMO',	'ABILITY_CLASS'	) ;


INSERT INTO TypeTags
	(Type,					Tag)
SELECT	UnitType, 	'QUO_CLASS_WESTERN_EUROPE_PROMO' 
FROM tblQuoBiomeWesternEuropeUnits;
 */ 

-- Free promotion for Melee units
/* INSERT INTO Requirements
	(RequirementId, 		RequirementType, 	Likeliness,	Inverse, 	Triggered)
VALUES	('QUO_REQ_BIOME_WESTERN_EUROPE_IS_UNIT_PROMO', 	'REQUIREMENT_UNIT_TAG_MATCHES',	0,0,0)  ;


INSERT INTO RequirementArguments 
		(RequirementId,			Name, 			Type, 			Value, 		Extra, 	SecondExtra)
VALUES 	('QUO_REQ_BIOME_WESTERN_EUROPE_IS_UNIT_PROMO',	'Tag',		'ARGTYPE_IDENTITY',		'QUO_CLASS_WESTERN_EUROPE_PROMO',	NULL,	NULL 	)  ;


INSERT INTO RequirementSets 
	(RequirementSetId, 		RequirementSetType)
VALUES 	('QUO_REQSET_BIOME_WESTERN_EUROPE_PROMOTION', 	'REQUIREMENTSET_TEST_ANY') ;


INSERT INTO RequirementSetRequirements
	(RequirementSetId,	RequirementId)
VALUES	 ('QUO_REQSET_BIOME_WESTERN_EUROPE_PROMOTION', 	'QUO_REQ_BIOME_WESTERN_EUROPE_IS_UNIT_PROMO')    ; */


-- Requirement changed to any Melee unit constructed after the world reaches the Medieval era
CREATE TABLE tblQuoBiomeWesternEuropeUnits AS 
select unittype, technologies.eratype from units 
inner join technologies on technologies.TechnologyType = units.PrereqTech 
where promotionclass in  ("PROMOTION_CLASS_MELEE") 

union

select unittype, civics.EraType from units 
inner join civics on civics.CivicType = units.PrereqCivic
where promotionclass in  ("PROMOTION_CLASS_MELEE") ;


INSERT INTO Tags 
	(Tag, 				Vocabulary)
VALUES 	('QUO_CLASS_WESTERN_EUROPE_PROMO',	'ABILITY_CLASS'	) ;


INSERT INTO TypeTags
	(Type,					Tag)
SELECT	UnitType, 	'QUO_CLASS_WESTERN_EUROPE_PROMO' 
FROM tblQuoBiomeWesternEuropeUnits;


INSERT INTO Requirements
	(RequirementId, 		RequirementType, 	Likeliness,	Inverse, 	Triggered)
VALUES	('QUO_REQ_BIOME_WESTERN_EUROPE_UNIT_PROMO_ERA', 		'REQUIREMENT_GAME_ERA_ATLEAST_EXPANSION',	0,0,0) ,
		('QUO_REQ_BIOME_WESTERN_EUROPE_IS_UNIT_PROMO', 	'REQUIREMENT_UNIT_TAG_MATCHES',	0,0,0);


INSERT INTO RequirementArguments 
	(RequirementId,			Name, 			Type, 			Value, 				Extra, 	SecondExtra)
VALUES 	('QUO_REQ_BIOME_WESTERN_EUROPE_UNIT_PROMO_ERA',	'EraType',		'ARGTYPE_IDENTITY',	'ERA_MEDIEVAL',	NULL,	NULL 	)  ,
		('QUO_REQ_BIOME_WESTERN_EUROPE_IS_UNIT_PROMO',	'Tag',		'ARGTYPE_IDENTITY',		'QUO_CLASS_WESTERN_EUROPE_PROMO',	NULL,	NULL 	)  ;
		

INSERT INTO RequirementSets 
	(RequirementSetId, 		RequirementSetType)
VALUES 	('QUO_REQSET_BIOME_WESTERN_EUROPE_UNIT_PROMO_ERA', 	'REQUIREMENTSET_TEST_ALL')   ;


INSERT INTO RequirementSetRequirements
	(RequirementSetId,	RequirementId)
VALUES	 ('QUO_REQSET_BIOME_WESTERN_EUROPE_UNIT_PROMO_ERA', 	'QUO_REQ_BIOME_WESTERN_EUROPE_UNIT_PROMO_ERA')  ,
		('QUO_REQSET_BIOME_WESTERN_EUROPE_UNIT_PROMO_ERA', 	'QUO_REQ_BIOME_WESTERN_EUROPE_IS_UNIT_PROMO')  ;

		



INSERT INTO Modifiers
	(ModifierID, 			ModifierType, 					RunOnce, 	Permanent, 	OwnerRequirementSetId, 	SubjectRequirementSetId)
VALUES	('QUO_BIOME_WESTERN_EUROPE_FREE_XP', 	'MODIFIER_PLAYER_UNITS_ADJUST_GRANT_EXPERIENCE', 	0, 		1, 		NULL,			'QUO_REQSET_BIOME_WESTERN_EUROPE_UNIT_PROMO_ERA') ;


INSERT INTO ModifierArguments
	(ModifierID,			Name,		Type, 				Value,			Extra)
VALUES	('QUO_BIOME_WESTERN_EUROPE_FREE_XP', 	'Amount', 	'ARGTYPE_IDENTITY', 		'-1',			NULL) ;


INSERT INTO TraitModifiers
	(TraitType, 				ModifierID)
VALUES	('QUO_TRAIT_BIOME_WEST_EUROPE',	'QUO_BIOME_WESTERN_EUROPE_FREE_XP') ;




-- No benefit from trees
INSERT INTO RequirementSets 
	(RequirementSetId, 		RequirementSetType)
VALUES 	('QUO_REQSET_BIOME_WESTERN_EUROPE_TREES', 	'REQUIREMENTSET_TEST_ANY') ;


INSERT INTO RequirementSetRequirements
	(RequirementSetId,	RequirementId)
VALUES	 ('QUO_REQSET_BIOME_WESTERN_EUROPE_TREES', 	'PLOT_IS_FOREST_REQUIREMENT') ,
		('QUO_REQSET_BIOME_WESTERN_EUROPE_TREES', 	'PLOT_IS_JUNGLE_REQUIREMENT')  ;

		
INSERT INTO Modifiers 
	(ModifierId, ModifierType, RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
VALUES	('QUO_BIOME_WESTERN_EUROPE_TREES', 'MODIFIER_PLAYER_ADJUST_PLOT_YIELD', 0, 0, NULL, 'QUO_REQSET_BIOME_WESTERN_EUROPE_TREES')  ;
 
INSERT INTO ModifierArguments
		(ModifierId, 			Name, 		Type, 			Value, 			Extra, 	SecondExtra)
VALUES	('QUO_BIOME_WESTERN_EUROPE_TREES', 	'YieldType', 	'ARGTYPE_IDENTITY', 	'YIELD_PRODUCTION',			NULL, 	NULL) ,
		('QUO_BIOME_WESTERN_EUROPE_TREES', 	'Amount', 	'ARGTYPE_IDENTITY', 	'-1',			NULL, 	NULL)  ;
		
INSERT INTO TraitModifiers
		(TraitType, 			ModifierID)
VALUES	('QUO_TRAIT_BIOME_WEST_EUROPE',	'QUO_BIOME_WESTERN_EUROPE_TREES')  ;


-- Free Medieval bedrock
INSERT INTO Modifiers 
	(ModifierId, ModifierType, RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
VALUES	('QUO_BIOME_WESTERN_EUROPE_BEDROCK', 'QUO_MODTYPE_GRANT_BUILDING_IN_CITY', 1, 1, NULL, NULL) ,
		('QUO_BIOME_WESTERN_EUROPE_BEDROCK_PLAYER', 'MODIFIER_PLAYER_CITIES_ATTACH_MODIFIER', 0, 0, NULL, NULL) ;

INSERT INTO ModifierArguments
	(ModifierId, 			Name, 		Type, 			Value, 			Extra, 	SecondExtra)
VALUES	('QUO_BIOME_WESTERN_EUROPE_BEDROCK', 	'BuildingType', 	'ARGTYPE_IDENTITY', 	'QUO_BUILDING_BEDROCK_MEDIEVAL',			NULL, 	NULL) ,
		('QUO_BIOME_WESTERN_EUROPE_BEDROCK_PLAYER', 	'ModifierId', 	'ARGTYPE_IDENTITY', 	'QUO_BIOME_WESTERN_EUROPE_BEDROCK',			NULL, 	NULL) ;		

INSERT INTO TraitModifiers
		(TraitType, 			ModifierID)
VALUES	('QUO_TRAIT_BIOME_WEST_EUROPE',	'QUO_BIOME_WESTERN_EUROPE_BEDROCK_PLAYER')  ;






-- Western Europe land units have lowered vision
-- added in v7.0.9 and removed in v7.0.10 due to player feedback

/* create table tblQuoWestEuropeBlindUnits as
select unittype, technologies.eratype from units 
inner join technologies on technologies.TechnologyType = units.PrereqTech 
where units.TraitType is null and promotionclass in ("PROMOTION_CLASS_MELEE", "PROMOTION_CLASS_RANGED", "PROMOTION_CLASS_ANTI_CAVALRY", "PROMOTION_CLASS_LIGHT_CAVALRY", "PROMOTION_CLASS_HEAVY_CAVALRY") AND eratype in  ("ERA_ANCIENT","ERA_CLASSICAL") 

union

select unittype, civics.EraType from units 
inner join civics on civics.CivicType = units.PrereqCivic
where units.TraitType is null and promotionclass in ("PROMOTION_CLASS_MELEE", "PROMOTION_CLASS_RANGED", "PROMOTION_CLASS_ANTI_CAVALRY", "PROMOTION_CLASS_LIGHT_CAVALRY", "PROMOTION_CLASS_HEAVY_CAVALRY") AND Eratype in  ("ERA_ANCIENT","ERA_CLASSICAL") 

union

select unittype, "ERA_ANCIENT" from units 
where units.TraitType is null and promotionclass in ("PROMOTION_CLASS_MELEE", "PROMOTION_CLASS_RANGED", "PROMOTION_CLASS_ANTI_CAVALRY", "PROMOTION_CLASS_LIGHT_CAVALRY", "PROMOTION_CLASS_HEAVY_CAVALRY") AND units.PrereqTech is null and units.PrereqCivic is null ;


-- Create the class of units ability applies to
INSERT INTO Tags 
	(Tag, 				Vocabulary)
VALUES 	('QUO_CLASS_BIOME_WEST_EUROPE_BLIND_UNITS',	'ABILITY_CLASS'	) ;


INSERT INTO TypeTags
	(Type,				Tag)
SELECT	tblQuoWestEuropeBlindUnits.UnitType, 	'QUO_CLASS_BIOME_WEST_EUROPE_BLIND_UNITS'
FROM tblQuoWestEuropeBlindUnits;


-- Create the ability itself
INSERT INTO Types
	(Type, 				Kind)
VALUES 	('QUO_ABILITY_WEST_EUROPE_LOW_VISION',	'KIND_ABILITY'	) ;

INSERT INTO TypeTags
	(Type,					Tag)
VALUES  ('QUO_ABILITY_WEST_EUROPE_LOW_VISION', 	'QUO_CLASS_BIOME_WEST_EUROPE_BLIND_UNITS') ;


-- Create Modifiers within the ability
INSERT INTO Modifiers 
	(ModifierId, 			ModifierType, 				RunOnce, 	Permanent, 	OwnerRequirementSetId, 	SubjectRequirementSetId)
VALUES	('QUO_MOD_WEST_EUROPE_LOW_VISION', 		'MODIFIER_PLAYER_UNIT_ADJUST_SIGHT', 	0, 		0, 		NULL, 			NULL) ;


INSERT INTO ModifierArguments
	(ModifierId, 			Name, 		Type, 			Value, 		Extra, 	SecondExtra)
VALUES	('QUO_MOD_WEST_EUROPE_LOW_VISION', 		'Amount', 	'ARGTYPE_IDENTITY', 	'-1',	NULL, 	NULL) ;


INSERT INTO UnitAbilities
	(UnitAbilityType,		Name,				Description,			Inactive)
VALUES	('QUO_ABILITY_WEST_EUROPE_LOW_VISION',	'QUO_LOC_WESTERN_EUROPE_LOW_VISION',		'QUO_LOC_WESTERN_EUROPE_LOW_VISION_DESC',	"1"	) ;

INSERT INTO UnitAbilityModifiers
	(UnitAbilityType, 			ModifierId)
VALUES 	('QUO_ABILITY_WEST_EUROPE_LOW_VISION', 		'QUO_MOD_WEST_EUROPE_LOW_VISION');



-- Create the Modifiers that attach the ability to the biome
INSERT INTO Modifiers 
	(ModifierId, 			ModifierType, 				RunOnce, 	Permanent, 	OwnerRequirementSetId, 	SubjectRequirementSetId)
VALUES	('QUO_BIOME_WESTERN_EUROPE_LOW_VISION_PLAYER', 	'MODIFIER_PLAYER_UNITS_GRANT_ABILITY', 	0, 		1, 		NULL, 			NULL) ;


INSERT INTO ModifierArguments
	(ModifierId, 			Name, 		Type, 			Value, 		Extra, 	SecondExtra)
VALUES	('QUO_BIOME_WESTERN_EUROPE_LOW_VISION_PLAYER', 	'AbilityType', 	'ARGTYPE_IDENTITY', 	'QUO_ABILITY_WEST_EUROPE_LOW_VISION',	NULL, 	NULL) ;


INSERT INTO TraitModifiers
	(TraitType, 					ModifierID)
VALUES	('QUO_TRAIT_BIOME_WEST_EUROPE',			'QUO_BIOME_WESTERN_EUROPE_LOW_VISION_PLAYER') ; */


-- Cannot build Recon units
--added in v7.0.9 and removed again in v7.0.10

/* CREATE TABLE tblQuoBiomeWesternEuropeReconUnits AS 
select unittype from units 
where promotionclass in  ("PROMOTION_CLASS_RECON") AND TraitType IS NULL;


INSERT INTO Modifiers 
	(ModifierId, ModifierType, RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
SELECT 'QUO_BIOME_WESTERN_EUROPE_CANNOT_BUILD_' || tblQuoBiomeWesternEuropeReconUnits.UnitType, 'MODIFIER_PLAYER_UNIT_BUILD_DISABLED', 0, 0, NULL, NULL
	FROM tblQuoBiomeWesternEuropeReconUnits;


INSERT INTO ModifierArguments
	(ModifierId, 			Name, 		Type, 			Value, 			Extra, 	SecondExtra)
SELECT 'QUO_BIOME_WESTERN_EUROPE_CANNOT_BUILD_' || tblQuoBiomeWesternEuropeReconUnits.UnitType, 	'UnitType', 	'ARGTYPE_IDENTITY', 	tblQuoBiomeWesternEuropeReconUnits.UnitType,			NULL, 	NULL 
	FROM tblQuoBiomeWesternEuropeReconUnits;

	
INSERT INTO TraitModifiers
	(TraitType, 			ModifierID)
SELECT 'QUO_TRAIT_BIOME_WEST_EUROPE',	'QUO_BIOME_WESTERN_EUROPE_CANNOT_BUILD_' || tblQuoBiomeWesternEuropeReconUnits.UnitType
	FROM tblQuoBiomeWesternEuropeReconUnits;
 */


-- Faster walls
-- Removed in v7.0.10
/* INSERT INTO Modifiers 
	(ModifierId, ModifierType, RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
VALUES	('QUO_BIOME_WESTERN_EUROPE_FAST_WALLS', 'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_PRODUCTION', 0, 0, NULL, NULL) ;


INSERT INTO ModifierArguments
	(ModifierId, 			Name, 		Type, 			Value, 			Extra, 	SecondExtra)
VALUES	('QUO_BIOME_WESTERN_EUROPE_FAST_WALLS', 	'Amount', 	'ARGTYPE_IDENTITY', 	'50',			NULL, 	NULL) , 
	('QUO_BIOME_WESTERN_EUROPE_FAST_WALLS', 	'BuildingType', 'ARGTYPE_IDENTITY', 	'BUILDING_CASTLE',	NULL, 	NULL) ;



INSERT INTO TraitModifiers
	(TraitType, 			ModifierID)
VALUES	('QUO_TRAIT_BIOME_WEST_EUROPE',	'QUO_BIOME_WESTERN_EUROPE_FAST_WALLS'); */



-- Eastern Europe / Soviet Bloc
UPDATE tblQuoDebug SET Message='Eastern Europe' WHERE DebugID='Quo_Biome_Code';


INSERT INTO Types
	(Type, 				Kind)
VALUES 	('QUO_ABILITY_BIOME_EAST_EUROPE_MOVE_ATTACK',	'KIND_ABILITY'	) ;


INSERT INTO TypeTags
	(Type,					Tag)
VALUES  ('QUO_ABILITY_BIOME_EAST_EUROPE_MOVE_ATTACK', 		'CLASS_ANTI_CAVALRY') ;
 

INSERT INTO Modifiers 
	(ModifierId, 			ModifierType, 				RunOnce, 	Permanent, 	OwnerRequirementSetId, 	SubjectRequirementSetId)
VALUES	('QUO_UNIT_MODIFIER_MOVE_ATTACK', 		'MODIFIER_PLAYER_UNIT_ADJUST_ATTACK_AND_MOVE', 	0, 		0, 		NULL, 			NULL) ;


INSERT INTO ModifierArguments
	(ModifierId, 			Name, 		Type, 			Value, 		Extra, 	SecondExtra)
VALUES	('QUO_UNIT_MODIFIER_MOVE_ATTACK', 		'CanMove', 	'ARGTYPE_IDENTITY', 	'1',	NULL, 	NULL) ;


INSERT INTO UnitAbilities
	(UnitAbilityType,		Name,				Description,			Inactive)
VALUES	('QUO_ABILITY_BIOME_EAST_EUROPE_MOVE_ATTACK',	'QUO_LOC_BIOME_EAST_EUROPE_MOVE_ATTACK_NAME',		'QUO_LOC_BIOME_EAST_EUROPE_MOVE_ATTACK_DESC',	"1"	) ;


INSERT INTO UnitAbilityModifiers
	(UnitAbilityType, 			ModifierId)
VALUES 	('QUO_ABILITY_BIOME_EAST_EUROPE_MOVE_ATTACK', 		'QUO_UNIT_MODIFIER_MOVE_ATTACK');


INSERT INTO Modifiers 
	(ModifierId, 			ModifierType, 				RunOnce, 	Permanent, 	OwnerRequirementSetId, 	SubjectRequirementSetId)
VALUES	('QUO_BIOME_EAST_EUROPE_MOVE_ATTACK', 	'MODIFIER_PLAYER_UNITS_GRANT_ABILITY', 	0, 		1, 		NULL, 			NULL) ;


INSERT INTO ModifierArguments
	(ModifierId, 			Name, 		Type, 			Value, 		Extra, 	SecondExtra)
VALUES	('QUO_BIOME_EAST_EUROPE_MOVE_ATTACK', 	'AbilityType', 	'ARGTYPE_IDENTITY', 	'QUO_ABILITY_BIOME_EAST_EUROPE_MOVE_ATTACK',	NULL, 	NULL) ;


INSERT INTO TraitModifiers
		(TraitType, 			ModifierID)
VALUES	('QUO_TRAIT_BIOME_EAST_EUROPE',	'QUO_BIOME_EAST_EUROPE_MOVE_ATTACK')  ;



-- Anti-Cav disregard zone of control
-- Disregard Zone of Control
INSERT INTO Requirements
	(RequirementId, 		RequirementType, 	Likeliness,	Inverse, 	Triggered)
VALUES	('QUO_REQ_BIOME_EAST_EUROPE_UNIT_ANTI_CAV', 	'REQUIREMENT_UNIT_PROMOTION_CLASS_MATCHES',	0,0,0) ;


INSERT INTO RequirementArguments 
		(RequirementId,			Name, 			Type, 			Value, 		Extra, 	SecondExtra)
VALUES 	('QUO_REQ_BIOME_EAST_EUROPE_UNIT_ANTI_CAV',	'UnitType',		'ARGTYPE_IDENTITY',		'PROMOTION_CLASS_ANTI_CAVALRY',	NULL,	NULL 	) ;


INSERT INTO RequirementSets 
	(RequirementSetId, 		RequirementSetType)
VALUES 	('QUO_REQSET_BIOME_EAST_EUROPE_UNIT_ANTI_CAV', 	'REQUIREMENTSET_TEST_ANY') ;


-- reuse the existing RECON_UNITS requirement
INSERT INTO RequirementSetRequirements
	(RequirementSetId,	RequirementId)
VALUES	('QUO_REQSET_BIOME_EAST_EUROPE_UNIT_ANTI_CAV', 	'QUO_REQ_BIOME_EAST_EUROPE_UNIT_ANTI_CAV') ; 


INSERT INTO Modifiers 
	(ModifierId, 	ModifierType, 	RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
VALUES	('QUO_BIOME_EAST_EUROPE_IGNORE_ZOC', 	'MODIFIER_PLAYER_UNIT_ADJUST_IGNORE_ZOC', 0, 0, NULL, NULL) ,
	('QUO_BIOME_EAST_EUROPE_IGNORE_ZOC_GLOBAL', 	'MODIFIER_PLAYER_UNITS_ATTACH_MODIFIER', 0, 0, NULL, 'QUO_REQSET_BIOME_EAST_EUROPE_UNIT_ANTI_CAV') ;


INSERT INTO ModifierArguments
	(ModifierId, 			Name, 		Type, 			Value, 					Extra, 	SecondExtra)
VALUES	('QUO_BIOME_EAST_EUROPE_IGNORE_ZOC', 	'Ignore', 	'ARGTYPE_IDENTITY', 	'1',					NULL, 	NULL) ,	
	('QUO_BIOME_EAST_EUROPE_IGNORE_ZOC_GLOBAL', 	'ModifierId', 	'ARGTYPE_IDENTITY', 	'QUO_BIOME_EAST_EUROPE_IGNORE_ZOC',		NULL, 	NULL)  ;


INSERT INTO TraitModifiers
		(TraitType, 			ModifierID)
VALUES	('QUO_TRAIT_BIOME_EAST_EUROPE',	'QUO_BIOME_EAST_EUROPE_IGNORE_ZOC_GLOBAL')  ;



-- Cannot build Support units
CREATE TABLE tblQuoBiomeEastEuropeSupportUnits AS 
select unittype, technologies.eratype from units 
inner join technologies on technologies.TechnologyType = units.PrereqTech 
where promotionclass in  ("PROMOTION_CLASS_SUPPORT") AND BuildCharges = 0 AND TraitType IS NULL

union

select unittype, civics.EraType from units 
inner join civics on civics.CivicType = units.PrereqCivic
where promotionclass in  ("PROMOTION_CLASS_SUPPORT") AND BuildCharges = 0 AND TraitType IS NULL;



INSERT INTO Modifiers 
	(ModifierId, ModifierType, RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
SELECT 'QUO_BIOME_EAST_EUROPE_CANNOT_BUILD_' || tblQuoBiomeEastEuropeSupportUnits.UnitType, 'MODIFIER_PLAYER_UNIT_BUILD_DISABLED', 0, 0, NULL, NULL
	FROM tblQuoBiomeEastEuropeSupportUnits;


INSERT INTO ModifierArguments
	(ModifierId, 			Name, 		Type, 			Value, 			Extra, 	SecondExtra)
SELECT 'QUO_BIOME_EAST_EUROPE_CANNOT_BUILD_' || tblQuoBiomeEastEuropeSupportUnits.UnitType, 	'UnitType', 	'ARGTYPE_IDENTITY', 	tblQuoBiomeEastEuropeSupportUnits.UnitType,			NULL, 	NULL 
	FROM tblQuoBiomeEastEuropeSupportUnits;

	
INSERT INTO TraitModifiers
	(TraitType, 			ModifierID)
SELECT 'QUO_TRAIT_BIOME_EAST_EUROPE',	'QUO_BIOME_EAST_EUROPE_CANNOT_BUILD_' || tblQuoBiomeEastEuropeSupportUnits.UnitType
	FROM tblQuoBiomeEastEuropeSupportUnits;


	
-- Free Anti Cav at appropriate time
/* INSERT INTO Requirements
	(RequirementId, 		RequirementType, 	Likeliness,	Inverse, 	Triggered)
VALUES	('QUO_REQ_BIOME_EAST_EUROPE_UNLOCK_UNIT_ERA', 		'REQUIREMENT_GAME_ERA_ATLEAST_EXPANSION',	0,0,0) ;


INSERT INTO RequirementArguments 
	(RequirementId,			Name, 			Type, 			Value, 				Extra, 	SecondExtra)
VALUES 	('QUO_REQ_BIOME_EAST_EUROPE_UNLOCK_UNIT_ERA',	'EraType',		'ARGTYPE_IDENTITY',	'ERA_INDUSTRIAL',	NULL,	NULL 	)  ;		
 */

INSERT INTO RequirementSets 
	(RequirementSetId, 		RequirementSetType)
VALUES 	('QUO_REQSET_BIOME_EASTERN_EUROPE_UNLOCK_FREE_UNITS', 	'REQUIREMENTSET_TEST_ALL') ;


INSERT INTO RequirementSetRequirements
	(RequirementSetId,	RequirementId)
VALUES	('QUO_REQSET_BIOME_EASTERN_EUROPE_UNLOCK_FREE_UNITS', 	'QUO_REQ_GLOBAL_ERA_IS_ATLEAST_INDUSTRIAL') ,
		('QUO_REQSET_BIOME_EASTERN_EUROPE_UNLOCK_FREE_UNITS', 	'QUO_REQ_GLOBAL_ERA_NOT_YET_MODERN') ;
		
		
INSERT INTO Modifiers 
	(ModifierId, 	ModifierType, 	RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
VALUES	('QUO_MOD_BIOME_EASTERN_EUROPE_FREE_UNIT', 	'MODIFIER_PLAYER_CITIES_GRANT_UNIT_BY_CLASS', 0, 0, NULL, 'QUO_REQSET_BIOME_EASTERN_EUROPE_UNLOCK_FREE_UNITS') ;


INSERT INTO ModifierArguments
	(ModifierId, 			Name, 		Type, 			Value, 					Extra, 	SecondExtra)
VALUES	('QUO_MOD_BIOME_EASTERN_EUROPE_FREE_UNIT', 	'UnitPromotionClassType', 	'ARGTYPE_IDENTITY', 	'PROMOTION_CLASS_ANTI_CAVALRY',		NULL, 	NULL) ;

INSERT INTO TraitModifiers
		(TraitType, 			ModifierID)
VALUES	('QUO_TRAIT_BIOME_EAST_EUROPE',	'QUO_MOD_BIOME_EASTERN_EUROPE_FREE_UNIT')  ;





INSERT INTO Requirements
	(RequirementId, 		RequirementType, 	Likeliness,	Inverse, 	Triggered)
VALUES	('QUO_REQ_BIOME_EAST_EUROPE_UNLOCK_UNIT_POPULATION', 		'REQUIREMENT_CITY_HAS_X_POPULATION',	0,0,0) ;


INSERT INTO RequirementArguments 
	(RequirementId,			Name, 			Type, 			Value, 				Extra, 	SecondExtra)
VALUES 	('QUO_REQ_BIOME_EAST_EUROPE_UNLOCK_UNIT_POPULATION',	'Amount',		'ARGTYPE_IDENTITY',	'5',	NULL,	NULL 	)  ;


INSERT INTO RequirementSets 
	(RequirementSetId, 		RequirementSetType)
VALUES 	('QUO_REQSET_BIOME_EASTERN_EUROPE_UNLOCK_FREE_UNITS_POPULATION', 	'REQUIREMENTSET_TEST_ALL') ;


INSERT INTO RequirementSetRequirements
	(RequirementSetId,	RequirementId)
VALUES	('QUO_REQSET_BIOME_EASTERN_EUROPE_UNLOCK_FREE_UNITS_POPULATION', 	'QUO_REQ_BIOME_EAST_EUROPE_UNLOCK_UNIT_POPULATION') ;
		
		
INSERT INTO Modifiers 
	(ModifierId, 	ModifierType, 	RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
VALUES	('QUO_MOD_BIOME_EASTERN_EUROPE_FREE_UNIT_POPULATION', 	'MODIFIER_PLAYER_CITIES_GRANT_UNIT_BY_CLASS', 0, 0, NULL, 'QUO_REQSET_BIOME_EASTERN_EUROPE_UNLOCK_FREE_UNITS_POPULATION') ;


INSERT INTO ModifierArguments
	(ModifierId, 			Name, 		Type, 			Value, 					Extra, 	SecondExtra)
VALUES	('QUO_MOD_BIOME_EASTERN_EUROPE_FREE_UNIT_POPULATION', 	'UnitPromotionClassType', 	'ARGTYPE_IDENTITY', 	'PROMOTION_CLASS_ANTI_CAVALRY',		NULL, 	NULL) ;

INSERT INTO TraitModifiers
		(TraitType, 			ModifierID)
VALUES	('QUO_TRAIT_BIOME_EAST_EUROPE',	'QUO_MOD_BIOME_EASTERN_EUROPE_FREE_UNIT_POPULATION')  ;



-- Unlock Bronze Working at turn 1
INSERT INTO Modifiers 
	(ModifierId, 	ModifierType, 	RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
VALUES	('QUO_MOD_BIOME_EASTERN_EUROPE_FREE_TECH', 	'MODIFIER_PLAYER_GRANT_SPECIFIC_TECHNOLOGY', 0, 0, NULL, NULL) ;


INSERT INTO ModifierArguments
	(ModifierId, 			Name, 		Type, 			Value, 					Extra, 	SecondExtra)
VALUES	('QUO_MOD_BIOME_EASTERN_EUROPE_FREE_TECH', 	'TechType', 	'ARGTYPE_IDENTITY', 	'TECH_BRONZE_WORKING',		NULL, 	NULL) ;

INSERT INTO TraitModifiers
		(TraitType, 			ModifierID)
VALUES	('QUO_TRAIT_BIOME_EAST_EUROPE',	'QUO_MOD_BIOME_EASTERN_EUROPE_FREE_TECH')  ;





-- BRITISH ISLES
-- Added in v6.019
UPDATE tblQuoDebug SET Message='UK' WHERE DebugID='Quo_Biome_Code';

-- Ranged distance
INSERT INTO Requirements
	(RequirementId, 		RequirementType, 	Likeliness,	Inverse, 	Triggered)
VALUES	('QUO_REQ_BIOME_UK_RANGED', 	'REQUIREMENT_UNIT_PROMOTION_CLASS_MATCHES',	0,0,0)  ;

INSERT INTO RequirementArguments 
		(RequirementId,			Name, 			Type, 			Value, 		Extra, 	SecondExtra)
VALUES 	('QUO_REQ_BIOME_UK_RANGED',	'UnitPromotionClass',		'ARGTYPE_IDENTITY',		'PROMOTION_CLASS_RANGED',	NULL,	NULL 	)  ;

INSERT INTO RequirementSets 
	(RequirementSetId, 		RequirementSetType)
VALUES 	('QUO_REQSET_BIOME_UK_RANGED', 	'REQUIREMENTSET_TEST_ALL') ;

 INSERT INTO RequirementSetRequirements
	(RequirementSetId,	RequirementId)
VALUES	('QUO_REQSET_BIOME_UK_RANGED', 	'QUO_REQ_BIOME_UK_RANGED')  ,
		('QUO_REQSET_BIOME_UK_RANGED', 	'QUO_REQ_GLOBAL_ERA_IS_ATLEAST_MEDIEVAL') ,
		('QUO_REQSET_BIOME_UK_RANGED', 	'QUO_REQ_GLOBAL_ERA_NOT_YET_RENAISSANCE') ;
		

 INSERT INTO Modifiers 
	(ModifierId, 	ModifierType, 	RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
VALUES	('QUO_BIOME_UK_RANGE', 	'MODIFIER_UNIT_ADJUST_ATTACK_RANGE', 0, 0, NULL, NULL) ,
		('QUO_BIOME_UK_RANGE_PLAYER', 	'MODIFIER_PLAYER_UNITS_ATTACH_MODIFIER', 0, 0, NULL, 'QUO_REQSET_BIOME_UK_RANGED') ;

INSERT INTO ModifierArguments
	(ModifierId, 			Name, 		Type, 			Value, 					Extra, 	SecondExtra)
VALUES	('QUO_BIOME_UK_RANGE', 	'Amount', 	'ARGTYPE_IDENTITY', 	'2',					NULL, 	NULL) ,	
		('QUO_BIOME_UK_RANGE_PLAYER', 	'ModifierId', 	'ARGTYPE_IDENTITY', 	'QUO_BIOME_UK_RANGE',		NULL, 	NULL)   ;

INSERT INTO TraitModifiers
		(TraitType, 			ModifierID)
VALUES	('QUO_TRAIT_BIOME_UK',	'QUO_BIOME_UK_RANGE_PLAYER')  ;



-- Free spy, spy level up and spy slot as you progress through later eras
INSERT INTO RequirementSets 
	(RequirementSetId, 		RequirementSetType)
VALUES 	('QUO_REQSET_BIOME_UK_SPY_ERA_INDUSTRIAL', 	'REQUIREMENTSET_TEST_ALL')   ,
		('QUO_REQSET_BIOME_UK_SPY_ERA_MODERN', 	'REQUIREMENTSET_TEST_ALL')   ,
		('QUO_REQSET_BIOME_UK_SPY_ERA_ATOMIC', 	'REQUIREMENTSET_TEST_ALL')   ,
		('QUO_REQSET_BIOME_UK_SPY_ERA_INFORMATION', 	'REQUIREMENTSET_TEST_ALL')   ;



INSERT INTO RequirementSetRequirements
	(RequirementSetId,	RequirementId)
VALUES	 ('QUO_REQSET_BIOME_UK_SPY_ERA_INDUSTRIAL', 	'QUO_REQ_GLOBAL_ERA_IS_ATLEAST_INDUSTRIAL')   ,
		('QUO_REQSET_BIOME_UK_SPY_ERA_MODERN', 	'QUO_REQ_GLOBAL_ERA_IS_ATLEAST_MODERN')   ,
		('QUO_REQSET_BIOME_UK_SPY_ERA_ATOMIC', 	'QUO_REQ_GLOBAL_ERA_IS_ATLEAST_ATOMIC')   ,
		('QUO_REQSET_BIOME_UK_SPY_ERA_INFORMATION', 	'QUO_REQ_GLOBAL_ERA_IS_ATLEAST_INFORMATION')   ;
		
 
INSERT INTO Modifiers 
	(ModifierId, ModifierType, RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
VALUES	('QUO_BIOME_UK_SPY_EXTRASLOT_INDUSTRIAL', 'MODIFIER_PLAYER_GRANT_SPY', 0, 0, NULL, 'QUO_REQSET_BIOME_UK_SPY_ERA_INDUSTRIAL') ,
		('QUO_BIOME_UK_SPY_EXTRASLOT_MODERN', 'MODIFIER_PLAYER_GRANT_SPY', 0, 0, NULL, 'QUO_REQSET_BIOME_UK_SPY_ERA_MODERN') ,
		('QUO_BIOME_UK_SPY_EXTRASLOT_ATOMIC', 'MODIFIER_PLAYER_GRANT_SPY', 0, 0, NULL, 'QUO_REQSET_BIOME_UK_SPY_ERA_ATOMIC') ,
		('QUO_BIOME_UK_SPY_EXTRASLOT_INFORMATION', 'MODIFIER_PLAYER_GRANT_SPY', 0, 0, NULL, 'QUO_REQSET_BIOME_UK_SPY_ERA_INFORMATION') ,
		
		('QUO_BIOME_UK_SPY_BONUS_INDUSTRIAL', 'MODIFIER_PLAYER_ADJUST_SPY_BONUS', 0, 0, NULL, 'QUO_REQSET_BIOME_UK_SPY_ERA_INDUSTRIAL') ,
		('QUO_BIOME_UK_SPY_BONUS_MODERN', 'MODIFIER_PLAYER_ADJUST_SPY_BONUS', 0, 0, NULL, 'QUO_REQSET_BIOME_UK_SPY_ERA_MODERN') ,
		('QUO_BIOME_UK_SPY_BONUS_ATOMIC', 'MODIFIER_PLAYER_ADJUST_SPY_BONUS', 0, 0, NULL, 'QUO_REQSET_BIOME_UK_SPY_ERA_ATOMIC') ,
		('QUO_BIOME_UK_SPY_BONUS_INFORMATION', 'MODIFIER_PLAYER_ADJUST_SPY_BONUS', 0, 0, NULL, 'QUO_REQSET_BIOME_UK_SPY_ERA_INFORMATION') ,
		
		('QUO_BIOME_UK_SPY_FREE_INDUSTRIAL', 'MODIFIER_PLAYER_GRANT_UNIT_IN_CAPITAL', 1, 1, NULL, 'QUO_REQSET_BIOME_UK_SPY_ERA_INDUSTRIAL') ,
		('QUO_BIOME_UK_SPY_FREE_MODERN', 'MODIFIER_PLAYER_GRANT_UNIT_IN_CAPITAL', 1, 1, NULL, 'QUO_REQSET_BIOME_UK_SPY_ERA_MODERN') ,
		('QUO_BIOME_UK_SPY_FREE_ATOMIC', 'MODIFIER_PLAYER_GRANT_UNIT_IN_CAPITAL', 1, 1, NULL, 'QUO_REQSET_BIOME_UK_SPY_ERA_ATOMIC') ,
		('QUO_BIOME_UK_SPY_FREE_INFORMATION', 'MODIFIER_PLAYER_GRANT_UNIT_IN_CAPITAL', 1, 1, NULL, 'QUO_REQSET_BIOME_UK_SPY_ERA_INFORMATION') ;

		
		
		
INSERT INTO ModifierArguments
	(ModifierId, 			Name, 			Type, 			Value, 				Extra, 	SecondExtra)
VALUES	('QUO_BIOME_UK_SPY_EXTRASLOT_INDUSTRIAL', 	'Amount', 		'ARGTYPE_IDENTITY', 	'1',				NULL, 	NULL)  ,
		('QUO_BIOME_UK_SPY_EXTRASLOT_MODERN', 	'Amount', 		'ARGTYPE_IDENTITY', 	'1',				NULL, 	NULL)  ,
		('QUO_BIOME_UK_SPY_EXTRASLOT_ATOMIC', 	'Amount', 		'ARGTYPE_IDENTITY', 	'1',				NULL, 	NULL)  ,
		('QUO_BIOME_UK_SPY_EXTRASLOT_INFORMATION', 	'Amount', 		'ARGTYPE_IDENTITY', 	'1',				NULL, 	NULL)  ,

		('QUO_BIOME_UK_SPY_BONUS_INDUSTRIAL', 	'Amount', 		'ARGTYPE_IDENTITY', 	'1',				NULL, 	NULL)  ,
		('QUO_BIOME_UK_SPY_BONUS_INDUSTRIAL', 	'Offense', 		'ARGTYPE_IDENTITY', 	'1',				NULL, 	NULL)  ,

		('QUO_BIOME_UK_SPY_BONUS_MODERN', 	'Amount', 		'ARGTYPE_IDENTITY', 	'1',				NULL, 	NULL)  ,
		('QUO_BIOME_UK_SPY_BONUS_MODERN', 	'Offense', 		'ARGTYPE_IDENTITY', 	'1',				NULL, 	NULL)  ,
		
		('QUO_BIOME_UK_SPY_BONUS_ATOMIC', 	'Amount', 		'ARGTYPE_IDENTITY', 	'1',				NULL, 	NULL)  ,
		('QUO_BIOME_UK_SPY_BONUS_ATOMIC', 	'Offense', 		'ARGTYPE_IDENTITY', 	'1',				NULL, 	NULL)  ,
		
		('QUO_BIOME_UK_SPY_BONUS_INFORMATION', 	'Amount', 		'ARGTYPE_IDENTITY', 	'1',				NULL, 	NULL)  ,
		('QUO_BIOME_UK_SPY_BONUS_INFORMATION', 	'Offense', 		'ARGTYPE_IDENTITY', 	'1',				NULL, 	NULL)  ,
		
		('QUO_BIOME_UK_SPY_FREE_INDUSTRIAL', 	'AllowUniqueOverride', 		'ARGTYPE_IDENTITY', 	'0',				NULL, 	NULL)  ,
		('QUO_BIOME_UK_SPY_FREE_INDUSTRIAL', 	'Amount', 		'ARGTYPE_IDENTITY', 	'1',				NULL, 	NULL)  ,
		('QUO_BIOME_UK_SPY_FREE_INDUSTRIAL', 	'UnitType', 		'ARGTYPE_IDENTITY', 	'UNIT_SPY',				NULL, 	NULL)  ,

		('QUO_BIOME_UK_SPY_FREE_MODERN', 	'AllowUniqueOverride', 		'ARGTYPE_IDENTITY', 	'0',				NULL, 	NULL)  ,
		('QUO_BIOME_UK_SPY_FREE_MODERN', 	'Amount', 		'ARGTYPE_IDENTITY', 	'1',				NULL, 	NULL)  ,
		('QUO_BIOME_UK_SPY_FREE_MODERN', 	'UnitType', 		'ARGTYPE_IDENTITY', 	'UNIT_SPY',				NULL, 	NULL)  ,

		('QUO_BIOME_UK_SPY_FREE_ATOMIC', 	'AllowUniqueOverride', 		'ARGTYPE_IDENTITY', 	'0',				NULL, 	NULL)  ,
		('QUO_BIOME_UK_SPY_FREE_ATOMIC', 	'Amount', 		'ARGTYPE_IDENTITY', 	'1',				NULL, 	NULL)  ,
		('QUO_BIOME_UK_SPY_FREE_ATOMIC', 	'UnitType', 		'ARGTYPE_IDENTITY', 	'UNIT_SPY',				NULL, 	NULL)  ,

		('QUO_BIOME_UK_SPY_FREE_INFORMATION', 	'AllowUniqueOverride', 		'ARGTYPE_IDENTITY', 	'0',				NULL, 	NULL)  ,
		('QUO_BIOME_UK_SPY_FREE_INFORMATION', 	'Amount', 		'ARGTYPE_IDENTITY', 	'1',				NULL, 	NULL)  ,
		('QUO_BIOME_UK_SPY_FREE_INFORMATION', 	'UnitType', 		'ARGTYPE_IDENTITY', 	'UNIT_SPY',				NULL, 	NULL)  ;
		
		
INSERT INTO TraitModifiers
	(TraitType, 			ModifierID)
VALUES	--('QUO_TRAIT_BIOME_UK',	'QUO_BIOME_UK_SPY_EXTRASLOT_INDUSTRIAL'),
		('QUO_TRAIT_BIOME_UK',	'QUO_BIOME_UK_SPY_EXTRASLOT_MODERN'),
		--('QUO_TRAIT_BIOME_UK',	'QUO_BIOME_UK_SPY_EXTRASLOT_ATOMIC'),
		('QUO_TRAIT_BIOME_UK',	'QUO_BIOME_UK_SPY_EXTRASLOT_INFORMATION'),

		--('QUO_TRAIT_BIOME_UK',	'QUO_BIOME_UK_SPY_BONUS_INDUSTRIAL') ,
		('QUO_TRAIT_BIOME_UK',	'QUO_BIOME_UK_SPY_BONUS_MODERN') ,
		--('QUO_TRAIT_BIOME_UK',	'QUO_BIOME_UK_SPY_BONUS_ATOMIC') ,
		('QUO_TRAIT_BIOME_UK',	'QUO_BIOME_UK_SPY_BONUS_INFORMATION') ,
		
		
		--('QUO_TRAIT_BIOME_UK',	'QUO_BIOME_UK_SPY_FREE_INDUSTRIAL') ,
		('QUO_TRAIT_BIOME_UK',	'QUO_BIOME_UK_SPY_FREE_MODERN') ,
		--('QUO_TRAIT_BIOME_UK',	'QUO_BIOME_UK_SPY_FREE_ATOMIC') ,
		('QUO_TRAIT_BIOME_UK',	'QUO_BIOME_UK_SPY_FREE_INFORMATION') ;
		

-- Cities cost more gold to maintain
-- Removed in v7.0.5
/* INSERT INTO Modifiers 
	(ModifierId, ModifierType, RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
VALUES	('QUO_BIOME_UK_GOLD', 'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_CHANGE', 0, 0, NULL, NULL) ;
		

INSERT INTO ModifierArguments
	(ModifierId, 			Name, 			Type, 			Value, 				Extra, 	SecondExtra)
VALUES	('QUO_BIOME_UK_GOLD', 	'Amount', 		'ARGTYPE_IDENTITY', 	'-1',				NULL, 	NULL)  ,
		('QUO_BIOME_UK_GOLD', 	'YieldType', 		'ARGTYPE_IDENTITY', 	'YIELD_GOLD',				NULL, 	NULL)  ;

INSERT INTO TraitModifiers
	(TraitType, 			ModifierID)
VALUES ('QUO_TRAIT_BIOME_UK',	'QUO_BIOME_UK_GOLD') ;
 */

 
-- Penalty vs wounded fortified units
INSERT INTO RequirementSets 
	(RequirementSetId, 		RequirementSetType)
VALUES 	('QUO_REQSET_BIOME_UK_WOUNDED_PENALTY', 	'REQUIREMENTSET_TEST_ALL') ;

 INSERT INTO RequirementSetRequirements
	(RequirementSetId,	RequirementId)
VALUES	('QUO_REQSET_BIOME_UK_WOUNDED_PENALTY', 	'OPPONENT_IS_FORTIFIED')  ,
		('QUO_REQSET_BIOME_UK_WOUNDED_PENALTY', 	'REQUIRES_OPPONENT_IS_WOUNDED') ;

INSERT INTO Modifiers 
	(ModifierId, ModifierType, RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
VALUES	('QUO_BIOME_UK_WOUNDED_PENALTY', 'MODIFIER_PLAYER_UNITS_ADJUST_COMBAT_STRENGTH', 0, 0, NULL, 'QUO_REQSET_BIOME_UK_WOUNDED_PENALTY') ;
		

INSERT INTO ModifierArguments
	(ModifierId, 			Name, 			Type, 			Value, 				Extra, 	SecondExtra)
VALUES	('QUO_BIOME_UK_WOUNDED_PENALTY', 	'Amount', 		'ARGTYPE_IDENTITY', 	'-5',				NULL, 	NULL)  ;

INSERT INTO TraitModifiers
	(TraitType, 			ModifierID)
VALUES ('QUO_TRAIT_BIOME_UK',	'QUO_BIOME_UK_WOUNDED_PENALTY') ;

INSERT INTO ModifierStrings
	(ModifierId, 		Context, Text)
VALUES	('QUO_BIOME_UK_WOUNDED_PENALTY', 'Preview', 'QUO_LOC_BIOME_UK_WOUNDED_PENALTY') ;




-- Boosts from admirals
INSERT INTO Modifiers 
	(ModifierId, ModifierType, RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
VALUES	('QUO_BIOME_UK_ADMIRAL_BOOST', 'MODIFIER_PLAYER_GRANT_BOOST_WITH_GREAT_PERSON', 0, 0, NULL, NULL) ,
		('QUO_BIOME_UK_ADMIRAL_BOOST_CIVIC', 'MODIFIER_PLAYER_GRANT_BOOST_WITH_GREAT_PERSON', 0, 0, NULL, NULL) ;
		

INSERT INTO ModifierArguments
	(ModifierId, 			Name, 			Type, 			Value, 				Extra, 	SecondExtra)
VALUES	('QUO_BIOME_UK_ADMIRAL_BOOST', 	'OtherPlayers', 		'ARGTYPE_IDENTITY', 	'0',				NULL, 	NULL)  ,
		('QUO_BIOME_UK_ADMIRAL_BOOST', 	'GreatPersonClass', 		'ARGTYPE_IDENTITY', 	'GREAT_PERSON_CLASS_ADMIRAL',				NULL, 	NULL)  ,
		('QUO_BIOME_UK_ADMIRAL_BOOST', 	'TechBoost', 		'ARGTYPE_IDENTITY', 	'1',				NULL, 	NULL)  ,
		
		('QUO_BIOME_UK_ADMIRAL_BOOST_CIVIC', 	'OtherPlayers', 		'ARGTYPE_IDENTITY', 	'0',				NULL, 	NULL)  ,
		('QUO_BIOME_UK_ADMIRAL_BOOST_CIVIC', 	'GreatPersonClass', 		'ARGTYPE_IDENTITY', 	'GREAT_PERSON_CLASS_ADMIRAL',				NULL, 	NULL)  ,
		('QUO_BIOME_UK_ADMIRAL_BOOST_CIVIC', 	'TechBoost', 		'ARGTYPE_IDENTITY', 	'0',				NULL, 	NULL)  ;

INSERT INTO TraitModifiers
	(TraitType, 			ModifierID)
VALUES ('QUO_TRAIT_BIOME_UK',	'QUO_BIOME_UK_ADMIRAL_BOOST') ,
	('QUO_TRAIT_BIOME_UK',	'QUO_BIOME_UK_ADMIRAL_BOOST_CIVIC') ;



-- key_North_AFRICA
UPDATE tblQuoDebug SET Message='North Africa' WHERE DebugID='Quo_Biome_Code';


-- Trade routes cant be plundered
INSERT INTO Modifiers 
	(ModifierId, ModifierType, RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
VALUES	('QUO_BIOME_NORTH_AFRICA_TRADE_LAND', 'MODIFIER_PLAYER_UNIT_ADJUST_TRADE_ROUTE_PLUNDER_IMMUNITY', 0, 0, NULL, NULL)   ,
		('QUO_BIOME_NORTH_AFRICA_TRADE_LAND_PLAYER', 'MODIFIER_PLAYER_UNITS_ATTACH_MODIFIER', 0, 0, NULL, NULL) ,

		('QUO_BIOME_NORTH_AFRICA_TRADE_SEA', 'MODIFIER_PLAYER_UNIT_ADJUST_TRADE_ROUTE_PLUNDER_IMMUNITY', 0, 0, NULL, NULL)   ,
		('QUO_BIOME_NORTH_AFRICA_TRADE_SEA_PLAYER', 'MODIFIER_PLAYER_UNITS_ATTACH_MODIFIER', 0, 0, NULL, NULL) ;


INSERT INTO ModifierArguments
		(ModifierId, 			Name, 		Type, 			Value, 			Extra, 	SecondExtra)
VALUES	('QUO_BIOME_NORTH_AFRICA_TRADE_LAND', 	'DomainType', 	'ARGTYPE_IDENTITY', 	'DOMAIN_LAND',			NULL, 	NULL) ,
		('QUO_BIOME_NORTH_AFRICA_TRADE_LAND_PLAYER', 	'ModifierId', 	'ARGTYPE_IDENTITY', 	'QUO_BIOME_NORTH_AFRICA_TRADE_LAND',			NULL, 	NULL) ,

		('QUO_BIOME_NORTH_AFRICA_TRADE_SEA', 	'DomainType', 	'ARGTYPE_IDENTITY', 	'DOMAIN_SEA',			NULL, 	NULL) ,
		('QUO_BIOME_NORTH_AFRICA_TRADE_SEA_PLAYER', 	'ModifierId', 	'ARGTYPE_IDENTITY', 	'QUO_BIOME_NORTH_AFRICA_TRADE_SEA',			NULL, 	NULL) ;

INSERT INTO TraitModifiers
		(TraitType, 			ModifierID)
VALUES	('QUO_TRAIT_BIOME_NORTH_AFRICA',	'QUO_BIOME_NORTH_AFRICA_TRADE_LAND_PLAYER')  ,
		('QUO_TRAIT_BIOME_NORTH_AFRICA',	'QUO_BIOME_NORTH_AFRICA_TRADE_SEA_PLAYER')  ;


		
		
-- Penalty to ranged units
INSERT INTO Types
	(Type, 				Kind)
VALUES 	('QUO_ABILITY_BIOME_NORTH_AFRICA_NO_MOVE_AND-SHOOT',	'KIND_ABILITY'	) ;


create table tblQuoBIOME_NORTH_AFRICA_NoMoveAndShoot as
select unittype, case WHEN  
    eratype is null then 'ERA_ANCIENT' 
    else eratype 
    end xEraType
from units
left join technologies on technologies.TechnologyType = units.prereqtech
where range >= 1 
--and promotionclass in ('PROMOTION_CLASS_RANGED','PROMOTION_CLASS_MELEE','PROMOTION_CLASS_SIEGE','PROMOTION_CLASS_RECON')
and promotionclass in ('PROMOTION_CLASS_RANGED','PROMOTION_CLASS_MELEE','PROMOTION_CLASS_RECON')
and xEraType in ('ERA_ANCIENT','ERA_CLASSICAL','ERA_MEDIEVAL')
and units.UnitType not in ('UNIT_EGYPTIAN_CHARIOT_ARCHER');


INSERT INTO Tags 
	(Tag, 				Vocabulary)
VALUES 	('QUO_CLASS_NORTH_AFRICA_NO_MOVE_AND_SHOOT',	'ABILITY_CLASS'	) ;


INSERT INTO TypeTags
	(Type,					Tag)
SELECT	UnitType, 	'QUO_CLASS_NORTH_AFRICA_NO_MOVE_AND_SHOOT' 
FROM tblQuoBIOME_NORTH_AFRICA_NoMoveAndShoot;



INSERT INTO TypeTags
	(Type,					Tag)
VALUES  ('QUO_ABILITY_BIOME_NORTH_AFRICA_NO_MOVE_AND-SHOOT', 	'QUO_CLASS_NORTH_AFRICA_NO_MOVE_AND_SHOOT');
 

-- the modifier itself, including the amount of the bonus
INSERT INTO Modifiers 
	(ModifierId, 			ModifierType, 				RunOnce, 	Permanent, 	OwnerRequirementSetId, 	SubjectRequirementSetId)
VALUES	('QUO_MOD_BIOME_NORTH_AFRICA_NO_MOVE_AND-SHOOT', 		'MODIFIER_PLAYER_UNIT_ADJUST_MOVE_AND_ATTACK', 	0, 		0, 		NULL, 			NULL) ;


INSERT INTO ModifierArguments
	(ModifierId, 			Name, 		Type, 			Value, 		Extra, 	SecondExtra)
VALUES	('QUO_MOD_BIOME_NORTH_AFRICA_NO_MOVE_AND-SHOOT', 		'CanAttack', 	'ARGTYPE_IDENTITY', 	'0',	NULL, 	NULL) ;


-- the ability containing the modifier
INSERT INTO UnitAbilities
	(UnitAbilityType,		Name,				Description,			Inactive)
VALUES	('QUO_ABILITY_BIOME_NORTH_AFRICA_NO_MOVE_AND-SHOOT',	'QUO_LOC_EXTRA_VISION',		'QUO_LOC_EXTRA_VISION_DESC',	"1"	) ;


INSERT INTO UnitAbilityModifiers
	(UnitAbilityType, 			ModifierId)
VALUES 	('QUO_ABILITY_BIOME_NORTH_AFRICA_NO_MOVE_AND-SHOOT', 		'QUO_MOD_BIOME_NORTH_AFRICA_NO_MOVE_AND-SHOOT');


		
-- Associate the new ability with North africa
INSERT INTO Modifiers 
	(ModifierId, 			ModifierType, 				RunOnce, 	Permanent, 	OwnerRequirementSetId, 	SubjectRequirementSetId)
VALUES	('QUO_BIOME_NORTH_AFRICA_NO_MOVE_AND_SHOOT_PLAYER', 	'MODIFIER_PLAYER_UNITS_GRANT_ABILITY', 	0, 		1, 		NULL, 			NULL) ;


INSERT INTO ModifierArguments
	(ModifierId, 			Name, 		Type, 			Value, 		Extra, 	SecondExtra)
VALUES	('QUO_BIOME_NORTH_AFRICA_NO_MOVE_AND_SHOOT_PLAYER', 	'AbilityType', 	'ARGTYPE_IDENTITY', 	'QUO_ABILITY_BIOME_NORTH_AFRICA_NO_MOVE_AND-SHOOT',	NULL, 	NULL) ;


INSERT INTO TraitModifiers
	(TraitType, 					ModifierID)
VALUES	('QUO_TRAIT_BIOME_NORTH_AFRICA',			'QUO_BIOME_NORTH_AFRICA_NO_MOVE_AND_SHOOT_PLAYER') ;		
		

		
		
		

-- can build most Middle East and Hellenic units
-- note the specific exclusion of the War Cart because I am not crazy
-- NOTE as of v7.0.16 this table is no longer dynamic but instead cannot grow beyond the list of approved units in the final unittype IN list. this is due to 
-- players feeling this sphere became overpowered when combined with mods that add additional units. The code below still accounts for the possibility of a unit
-- being removed from the sphere it is borrowing from.
create table tblQuoBIOME_NORTH_AFRICABorrowedSphereUnits as
select units.unittype, civilizationtraits.traittype, civilizationtraits.civilizationtype
from units
left join civilizationtraits on civilizationtraits.TraitType = units.TraitType
where civilizationtraits.traittype is not null 
and civilizationtraits.CivilizationType in (select civilizationtraits.civilizationtype from civilizationtraits where traittype in ('QUO_TRAIT_BIOME_ARABESQUE','QUO_TRAIT_BIOME_ROMANESQUE'))
and unittype in ('UNIT_ARABIAN_MAMLUK', 'UNIT_GREEK_HOPLITE','UNIT_MACEDONIAN_HYPASPIST','UNIT_OTTOMAN_BARBARY_CORSAIR','UNIT_PERSIAN_IMMORTAL','UNIT_ROMAN_LEGION');


-- Only do the insert if the Biome option is enabled	

-- Egypt	
INSERT OR REPLACE INTO CivilizationTraits
	(CivilizationType, TraitType)
SELECT 'CIVILIZATION_EGYPT', TraitType
FROM tblQuoBIOME_NORTH_AFRICABorrowedSphereUnits
	WHERE EXISTS (SELECT 1 FROM tblQuoOptions WHERE OptionId='QUO_OPTION_ENABLE_BIOMES' AND Value > 0) ;

-- Phoenicia
INSERT OR REPLACE INTO CivilizationTraits
	(CivilizationType, TraitType)
SELECT 'CIVILIZATION_PHOENICIA', TraitType
FROM tblQuoBIOME_NORTH_AFRICABorrowedSphereUnits
	WHERE EXISTS (SELECT 1 FROM tblQuoOptions WHERE OptionId='QUO_OPTION_ENABLE_BIOMES' AND Value > 0) ;


	
-- combat debuff for unique units 
INSERT INTO Tags 
	(Tag, 				Vocabulary)
VALUES 	('QUO_CLASS_NORTH_AFRICA_BORROWED_SPHERE',	'ABILITY_CLASS'	) ;


INSERT INTO TypeTags
	(Type,					Tag)
SELECT	UnitType, 	'QUO_CLASS_NORTH_AFRICA_BORROWED_SPHERE' 
FROM tblQuoBIOME_NORTH_AFRICABorrowedSphereUnits;



INSERT INTO Requirements
	(RequirementId, 		RequirementType, 	Likeliness,	Inverse, 	Triggered)
VALUES	('QUO_REQ_BIOME_NORTH_AFRICA_DEBUFF_BORROWED_SPHERE', 	'REQUIREMENT_UNIT_TAG_MATCHES',	0,0,0)  ;

INSERT INTO RequirementArguments 
		(RequirementId,			Name, 			Type, 			Value, 		Extra, 	SecondExtra)
VALUES 	('QUO_REQ_BIOME_NORTH_AFRICA_DEBUFF_BORROWED_SPHERE',	'Tag',		'ARGTYPE_IDENTITY',		'QUO_CLASS_NORTH_AFRICA_BORROWED_SPHERE',	NULL,	NULL 	)  ;

INSERT INTO RequirementSets 
	(RequirementSetId, 		RequirementSetType)
VALUES 	('QUO_REQSET_BIOME_NORTH_AFRICA_DEBUFF_BORROWED_SPHERE', 	'REQUIREMENTSET_TEST_ALL') ;

 INSERT INTO RequirementSetRequirements
	(RequirementSetId,	RequirementId)
VALUES	('QUO_REQSET_BIOME_NORTH_AFRICA_DEBUFF_BORROWED_SPHERE', 	'QUO_REQ_BIOME_NORTH_AFRICA_DEBUFF_BORROWED_SPHERE')  ;



INSERT INTO Modifiers 
		(ModifierId, 	ModifierType, 	RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
VALUES	('QUO_BIOME_NORTH_AFRICA_STRENGTH', 'MODIFIER_UNIT_ADJUST_COMBAT_STRENGTH', 0, 0, NULL, NULL) ,
		('QUO_BIOME_NORTH_AFRICA_STRENGTH_PLAYER', 'MODIFIER_PLAYER_UNITS_ATTACH_MODIFIER', 0, 0, NULL, 'QUO_REQSET_BIOME_NORTH_AFRICA_DEBUFF_BORROWED_SPHERE') ;


INSERT INTO ModifierArguments
	(ModifierId, 			Name, 		Type, 			Value, 					Extra, 	SecondExtra)
VALUES	('QUO_BIOME_NORTH_AFRICA_STRENGTH', 	'Amount', 	'ARGTYPE_IDENTITY', 	'-5',		NULL, 	NULL) ,
		('QUO_BIOME_NORTH_AFRICA_STRENGTH_PLAYER', 		'ModifierId', 		'ARGTYPE_IDENTITY', 	'QUO_BIOME_NORTH_AFRICA_STRENGTH',	NULL, 	NULL)  ;
	

INSERT INTO TraitModifiers
	(TraitType, 					ModifierID)
VALUES	('QUO_TRAIT_BIOME_NORTH_AFRICA',			'QUO_BIOME_NORTH_AFRICA_STRENGTH_PLAYER') ;		
	
	
INSERT INTO ModifierStrings
	(ModifierId, 		Context, Text)
VALUES	('QUO_BIOME_NORTH_AFRICA_STRENGTH', 'Preview', 'QUO_LOC_BIOME_NORTH_AFRICA_STRENGTH') ; 


		
-- UPDATE BUG TRACKER
-- This code should go last in every file

UPDATE tblQuoDebug SET x_Close='1' WHERE DebugID='Quo_Biome_Code';