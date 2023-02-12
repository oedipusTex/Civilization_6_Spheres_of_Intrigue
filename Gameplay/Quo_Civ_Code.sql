/*
    Created by Quo
*/
 


-- LOGS

-- Debug
INSERT INTO tblQuoDebug 
	(DebugID, 		x_Open, x_Close, 	Message)
VALUES ('Quo_Civ_Code',	'1',	'0',		'') ;



-- ENGLAND


-- Make the Royal Navy Dockyard no longer a replacement for the Harbor
-- removed in v5.0.1
--DELETE FROM DistrictReplaces WHERE CivUniqueDistrictType = 'DISTRICT_ROYAL_NAVY_DOCKYARD' AND ReplacesDistrictType='DISTRICT_HARBOR' ;

--UPDATE Districts SET PrereqCivic='CIVIC_NAVAL_TRADITION', MilitaryDomain='NO_DOMAIN', RequiresPopulation='0', CostProgressionModel='COST_PROGRESSION_GAME_PROGRESS', CostProgressionParam1='1000', Housing='3' WHERE DistrictType='DISTRICT_ROYAL_NAVY_DOCKYARD' ;


-- Unlock the Sea Dog at Naval Tradition
UPDATE Units SET PrereqCivic='CIVIC_NAVAL_TRADITION' WHERE UnitType='UNIT_ENGLISH_SEADOG' ;




-- Change Vicky's unique so that we get a free melee unit from any coastal city, not just ones on another continent



/* INSERT INTO Requirements
	(RequirementId, 		RequirementType, 	Likeliness,	Inverse, 	Triggered)
VALUES	('QUO_REQ_VICKY_OTHER CONTINTENT', 	'REQUIREMENT_CITY_IS_OWNER_CAPITAL_CONTINENT',	0,1,0),
	('QUO_REQ_VICKY_CITY_ADJACENT_COAST', 	'REQUIREMENT_PLOT_ADJACENT_TO_COAST',	0,0,0) ;


INSERT INTO RequirementSets 
	(RequirementSetId, 		RequirementSetType)
VALUES 	('QUO_REQSET_VICTORIA_FREE_MELEE', 	'REQUIREMENTSET_TEST_ANY') ;



INSERT INTO RequirementSetRequirements
	(RequirementSetId,	RequirementId)
VALUES	('QUO_REQSET_VICTORIA_FREE_MELEE', 	'QUO_REQ_VICKY_OTHER CONTINTENT'),
	('QUO_REQSET_VICTORIA_FREE_MELEE', 	'QUO_REQ_VICKY_CITY_ADJACENT_COAST') ; 


UPDATE Modifiers SET SubjectRequirementSetId='QUO_REQSET_VICTORIA_FREE_MELEE' WHERE ModifierId='TRAIT_FREE_MELEE_UNIT_NON_HOME_CONTINENT' ; */



-- Free Trade Route for each RNDY on another continent
-- Removed in v7.01 due to changes to England in Gathering Storm

/* INSERT INTO Requirements
	(RequirementId, 		RequirementType, 				Likeliness,	Inverse, 	Triggered)
VALUES	('QUO_REQ_ENGLAND_CITY_HAS_RNDY', 	'REQUIREMENT_CITY_HAS_DISTRICT',	0,0,0) ;

INSERT INTO RequirementArguments 
		(RequirementId,			Name, 			Type, 			Value, 		Extra, 	SecondExtra)		
VALUES ('QUO_REQ_ENGLAND_CITY_HAS_RNDY',	'DistrictType',		'ARGTYPE_IDENTITY',	'DISTRICT_ROYAL_NAVY_DOCKYARD',	NULL,	NULL 	)   ;

INSERT INTO RequirementSets 
	(RequirementSetId, 				RequirementSetType)
VALUES 	('QUO_REQSET_ENGLAND_FREE_TRADE_ROUTE', 	'REQUIREMENTSET_TEST_ALL') ;


INSERT INTO RequirementSetRequirements
	(RequirementSetId,	RequirementId)
VALUES	('QUO_REQSET_ENGLAND_FREE_TRADE_ROUTE', 	'QUO_REQ_ENGLAND_CITY_HAS_RNDY') ,
		('QUO_REQSET_ENGLAND_FREE_TRADE_ROUTE', 	'REQUIRES_CITY_IS_NOT_OWNER_CAPITAL_CONTINENT') ; */
		
		
INSERT INTO Types
	 (Type, Kind)
VALUES("QUO_MODTYPE_PLAYER_CITIES_ENGLAND_FREE_TRADE_ROUTE", "KIND_MODIFIER");
		
		
INSERT INTO DynamicModifiers
		(ModifierType, CollectionType, EffectType)
VALUES	("QUO_MODTYPE_PLAYER_CITIES_ENGLAND_FREE_TRADE_ROUTE", "COLLECTION_PLAYER_CITIES", "EFFECT_ADJUST_TRADE_ROUTE_CAPACITY"); 


/*INSERT INTO Modifiers
	(ModifierID, 			ModifierType, 					RunOnce, 	Permanent, 	OwnerRequirementSetId, 	SubjectRequirementSetId)
VALUES	('QUO_ENGLAND_EXTRA_TRADE_ROUTE', 	'QUO_MODTYPE_PLAYER_CITIES_ENGLAND_FREE_TRADE_ROUTE', 	0, 		0, 		NULL,			'QUO_REQSET_ENGLAND_FREE_TRADE_ROUTE') ;


INSERT INTO ModifierArguments
	(ModifierID,			Name,		Type, 				Value,			Extra)
VALUES	('QUO_ENGLAND_EXTRA_TRADE_ROUTE', 	'Amount', 	'ARGTYPE_IDENTITY', 		'1',			NULL) ;


INSERT INTO TraitModifiers
	(TraitType, 				ModifierID)
VALUES	('TRAIT_CIVILIZATION_DOUBLE_ARCHAEOLOGY_SLOTS',	'QUO_ENGLAND_EXTRA_TRADE_ROUTE') ; */
		

-- New in v 6.0.11
-- Removed in v7.0.1
-- All ships start with a free promotion		
/* INSERT INTO Modifiers
	(ModifierID, 			ModifierType, 					RunOnce, 	Permanent, 	OwnerRequirementSetId, 	SubjectRequirementSetId)
VALUES	('QUO_ENGLAND_FREE_XP', 	'MODIFIER_PLAYER_UNITS_ADJUST_GRANT_EXPERIENCE', 	0, 		1, 		NULL,			'REQUIREMENTS_UNIT_SEA_DOMAIN') ;


INSERT INTO ModifierArguments
	(ModifierID,			Name,		Type, 				Value,			Extra)
VALUES	('QUO_ENGLAND_FREE_XP', 	'Amount', 	'ARGTYPE_IDENTITY', 		'-1',			NULL) ;


INSERT INTO TraitModifiers
	(TraitType, 				ModifierID)
VALUES	('TRAIT_CIVILIZATION_DOUBLE_ARCHAEOLOGY_SLOTS',	'QUO_ENGLAND_FREE_XP') ;
		 */
		
		
		

-- RUSSIA



-- delete russia's default bonus on Tundra since this is now shared with some other civs via Biome
-- restored in v6.0.19
--DELETE FROM TraitModifiers WHERE TraitType="TRAIT_CIVILIZATION_MOTHER_RUSSIA" AND ModifierId IN ('TRAIT_INCREASED_TUNDRA_FAITH', 'TRAIT_INCREASED_TUNDRA_HILLS_FAITH', 'TRAIT_INCREASED_TUNDRA_HILLS_PRODUCTION', 'TRAIT_INCREASED_TUNDRA_PRODUCTION');


-- Add adjacency bonuses for Industrial Zones in Tundra

INSERT INTO Types
	(Type, 				Kind)
VALUES 	('QUO_MODTYPE_RUSSIA_PLAYER_CITY_TERRAIN_AJACENCY',	'KIND_MODIFIER'	) ;

INSERT INTO DynamicModifiers
		(ModifierType, CollectionType, EffectType)
VALUES 	('QUO_MODTYPE_RUSSIA_PLAYER_CITY_TERRAIN_AJACENCY', 'COLLECTION_PLAYER_CITIES','EFFECT_TERRAIN_ADJACENCY');


INSERT INTO Modifiers 
	(ModifierId, ModifierType, RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
VALUES	('QUO_RUSSIA_IZ_ADJACENCY', 'QUO_MODTYPE_RUSSIA_PLAYER_CITY_TERRAIN_AJACENCY', 0, 0, NULL, NULL) ;


INSERT INTO ModifierArguments
	(ModifierId, 			Name, 		Type, 			Value, 			Extra, 	SecondExtra)
VALUES	('QUO_RUSSIA_IZ_ADJACENCY', 	'Amount', 	'ARGTYPE_IDENTITY', 	'1',			NULL, 	NULL) ,  
	('QUO_RUSSIA_IZ_ADJACENCY', 	'Description', 	'ARGTYPE_IDENTITY', 	'QUO_LOC_RUSSIA_IZ_ADJACENCY',			NULL, 	NULL) , 
	('QUO_RUSSIA_IZ_ADJACENCY', 	'DistrictType', 'ARGTYPE_IDENTITY', 	'DISTRICT_INDUSTRIAL_ZONE',			NULL, 	NULL) ,
	('QUO_RUSSIA_IZ_ADJACENCY', 	'TerrainType', 	'ARGTYPE_IDENTITY', 	'TERRAIN_TUNDRA_HILLS',			NULL, 	NULL) ,
	('QUO_RUSSIA_IZ_ADJACENCY', 	'YieldType', 	'ARGTYPE_IDENTITY', 	'YIELD_PRODUCTION',			NULL, 	NULL) ;



INSERT INTO TraitModifiers
	(TraitType, 			ModifierID)
VALUES	('TRAIT_CIVILIZATION_MOTHER_RUSSIA',	'QUO_RUSSIA_IZ_ADJACENCY') ;



-- Reduce how much Peter gets from Eurekas

INSERT INTO Modifiers 
	(ModifierId, ModifierType, RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
VALUES	('QUO_RUSSIA_LOW_BOOST_TECH', 'MODIFIER_PLAYER_ADJUST_CIVIC_BOOST', 0, 0, NULL, NULL), 
	('QUO_RUSSIA_LOW_BOOST_CIV', 'MODIFIER_PLAYER_ADJUST_TECHNOLOGY_BOOST', 0, 0, NULL, NULL) ;


INSERT INTO ModifierArguments
	(ModifierId, 			Name, 		Type, 			Value, 			Extra, 	SecondExtra)
VALUES	('QUO_RUSSIA_LOW_BOOST_TECH', 	'Amount', 	'ARGTYPE_IDENTITY', 	'-10',			NULL, 	NULL) , 
	('QUO_RUSSIA_LOW_BOOST_CIV', 	'Amount',	 'ARGTYPE_IDENTITY', 	'-10',			NULL, 	NULL) ;


INSERT INTO TraitModifiers
	(TraitType, 			ModifierID)
VALUES	('TRAIT_LEADER_GRAND_EMBASSY',	'QUO_RUSSIA_LOW_BOOST_TECH') ,
	('TRAIT_LEADER_GRAND_EMBASSY',	'QUO_RUSSIA_LOW_BOOST_CIV') ;





-- Give Peter an extra trade route for every Industrial Zone in Tundra.
-- Since Tundra is different from Tundra Hills we have to make sure to handle both


-- Is this an Industrial Zone?
INSERT INTO Requirements
	(RequirementId, 		RequirementType, 	Likeliness,	Inverse, 	Triggered)
VALUES	('QUO_REQ_INDUSTRIAL_ZONE', 	'REQUIREMENT_PLOT_DISTRICT_TYPE_MATCHES',	0,0,0) ;


INSERT INTO RequirementArguments 
	(RequirementId,			Name, 			Type, 			Value, 				Extra, 	SecondExtra)
VALUES 	('QUO_REQ_INDUSTRIAL_ZONE',	'DistrictType',		'ARGTYPE_IDENTITY',	'DISTRICT_INDUSTRIAL_ZONE',	NULL,	NULL 	) ;


INSERT INTO RequirementSets 
	(RequirementSetId, 		RequirementSetType)
VALUES 	('QUO_REQSET_INDUSTRIAL_ZONE', 	'REQUIREMENTSET_TEST_ALL') ,
	('QUO_REQSET_INDUSTRIAL_ZONE_HILL', 	'REQUIREMENTSET_TEST_ALL') ;


INSERT INTO RequirementSetRequirements
	(RequirementSetId,	RequirementId)
VALUES	('QUO_REQSET_INDUSTRIAL_ZONE', 	'QUO_REQ_INDUSTRIAL_ZONE'),
	('QUO_REQSET_INDUSTRIAL_ZONE', 	'REQUIRES_PLOT_HAS_TUNDRA'),
	('QUO_REQSET_INDUSTRIAL_ZONE_HILL', 	'QUO_REQ_INDUSTRIAL_ZONE'), 
	('QUO_REQSET_INDUSTRIAL_ZONE_HILL', 	'REQUIRES_PLOT_HAS_TUNDRA_HILLS') ; 



INSERT INTO Modifiers 
	(ModifierId, ModifierType, RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
VALUES	('QUO_RUSSIA_TRADE_PER_INDUSTRIAL_ZONE', 'MODIFIER_PLAYER_DISTRICTS_ADJUST_TRADE_ROUTE_CAPACITY', 0, 0, NULL, 'QUO_REQSET_INDUSTRIAL_ZONE'),
	('QUO_RUSSIA_TRADE_PER_INDUSTRIAL_ZONE_HILL', 'MODIFIER_PLAYER_DISTRICTS_ADJUST_TRADE_ROUTE_CAPACITY', 0, 0, NULL, 'QUO_REQSET_INDUSTRIAL_ZONE_HILL') ;


INSERT INTO ModifierArguments
	(ModifierId, 			Name, 		Type, 			Value, 			Extra, 	SecondExtra)
VALUES	('QUO_RUSSIA_TRADE_PER_INDUSTRIAL_ZONE', 	'Amount', 	'ARGTYPE_IDENTITY', 		'1',			NULL, 	NULL),
	('QUO_RUSSIA_TRADE_PER_INDUSTRIAL_ZONE_HILL', 	'Amount', 	'ARGTYPE_IDENTITY', 		'1',			NULL, 	NULL) ;


INSERT INTO TraitModifiers
	(TraitType, 			ModifierID)
VALUES	('TRAIT_LEADER_GRAND_EMBASSY',	'QUO_RUSSIA_TRADE_PER_INDUSTRIAL_ZONE'),
	('TRAIT_LEADER_GRAND_EMBASSY',	'QUO_RUSSIA_TRADE_PER_INDUSTRIAL_ZONE_HILL') ;

	
	
-- Russia automatically receives Uranium 
-- in v5.0.3 this was updated for Rise and Fall to use global game eras instead of Russia's current era

-- Removed in v7.0.4 due to changes made in Gathering Storm

/* INSERT INTO Requirements
	(RequirementId, 		RequirementType, 	Likeliness,	Inverse, 	Triggered)
VALUES	('QUO_REQ_RUSSIA_IS_ERA_ATOMIC', 		'REQUIREMENT_GAME_ERA_ATLEAST_EXPANSION',	0,0,0) ;
				
				

INSERT INTO RequirementArguments 
	(RequirementId,			Name, 			Type, 			Value, 				Extra, 	SecondExtra)
VALUES 	('QUO_REQ_RUSSIA_IS_ERA_ATOMIC',	'EraType',		'ARGTYPE_IDENTITY',	'ERA_ATOMIC',	NULL,	NULL 	) ;


INSERT INTO RequirementSets 
	(RequirementSetId, 		RequirementSetType)
VALUES 	('QUO_REQSET_RUSSIA_ATOMIC', 	'REQUIREMENTSET_TEST_ALL')  ;

INSERT INTO RequirementSetRequirements
	(RequirementSetId,	RequirementId)
VALUES	('QUO_REQSET_RUSSIA_ATOMIC', 	'QUO_REQ_RUSSIA_IS_ERA_ATOMIC'); 



INSERT INTO Modifiers 
	(ModifierId, ModifierType, RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
VALUES	('QUO_MOD_RUSSIA_FREE_URANIUM', 'MODIFIER_PLAYER_ADJUST_FREE_RESOURCE_IMPORT', 0, 0, NULL, 'QUO_REQSET_RUSSIA_ATOMIC') ;


INSERT INTO ModifierArguments
	(ModifierId, 				Name, 			Type, 			Value, 			Extra, 	SecondExtra)
VALUES	('QUO_MOD_RUSSIA_FREE_URANIUM', 		'Amount', 		'ARGTYPE_IDENTITY', 	'2',			NULL, 	NULL) , 
	('QUO_MOD_RUSSIA_FREE_URANIUM', 		'ResourceType', 	'ARGTYPE_IDENTITY', 	'RESOURCE_URANIUM',	NULL, 	NULL) ;

INSERT INTO TraitModifiers
	(TraitType, 			ModifierID)
VALUES	('TRAIT_CIVILIZATION_MOTHER_RUSSIA',	'QUO_MOD_RUSSIA_FREE_URANIUM') ;

 */



-- ARABIA


-- Half off Madrassas, removed in v2.9
-- UPDATE Buildings SET Cost=Cost*0.5 WHERE BuildingType='BUILDING_MADRASA' ;



-- Give Arabia 50% discount on building Shrines and Temples, so they have better synergy with their cheaper faith building
-- Removed in v2.9

/*
INSERT INTO Modifiers 
	(ModifierId, ModifierType, RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
VALUES	('QUO_ARABIA_CHEAP_SHRINE', 'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_PRODUCTION', 0, 0, NULL, NULL), 
	('QUO_ARABIA_CHEAP_TEMPLE', 'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_PRODUCTION', 0, 0, NULL, NULL) ;


INSERT INTO ModifierArguments
	(ModifierId, 			Name, 		Type, 			Value, 			Extra, 	SecondExtra)
VALUES	('QUO_ARABIA_CHEAP_SHRINE', 	'Amount', 	'ARGTYPE_IDENTITY', 	'50',			NULL, 	NULL) , 
	('QUO_ARABIA_CHEAP_SHRINE', 	'BuildingType', 'ARGTYPE_IDENTITY', 	'BUILDING_SHRINE',	NULL, 	NULL) ,
	('QUO_ARABIA_CHEAP_TEMPLE', 	'Amount', 	'ARGTYPE_IDENTITY', 	'50',			NULL, 	NULL) , 
	('QUO_ARABIA_CHEAP_TEMPLE', 	'BuildingType', 'ARGTYPE_IDENTITY', 	'BUILDING_TEMPLE',	NULL, 	NULL) ;



INSERT INTO TraitModifiers
	(TraitType, 			ModifierID)
VALUES	('TRAIT_CIVILIZATION_LAST_PROPHET',	'QUO_ARABIA_CHEAP_SHRINE'),
	('TRAIT_CIVILIZATION_LAST_PROPHET',	'QUO_ARABIA_CHEAP_TEMPLE') ;
*/


-- Update the amount of Science per foreign city following Arabia's religion
-- Removed in v3.13.4 in favor of providing extra Gold 
--UPDATE ModifierArguments SET Value='2' WHERE ModifierId='TRAIT_SCIENCE_PER_FOREIGN_CITY_FOLLOWING_RELIGION' AND Name='Amount' ;


-- Arabia gets an extra +1 sci +3 gold per foriegn city following religion
/*INSERT INTO Modifiers 
	(ModifierId, ModifierType, RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
VALUES	('QUO_ARABIA_GOLD_PER_FOREIGN_CITY_FOLLOWING', 'MODIFIER_PLAYER_RELIGION_ADD_PLAYER_BELIEF_YIELD', 0, 0, NULL, NULL)  ;


INSERT INTO ModifierArguments
	(ModifierId, 			Name, 		Type, 			Value, 			Extra, 	SecondExtra)
VALUES	('QUO_ARABIA_GOLD_PER_FOREIGN_CITY_FOLLOWING', 	'Amount', 	'ARGTYPE_IDENTITY', 		'3',			NULL, 	NULL) ,
	('QUO_ARABIA_GOLD_PER_FOREIGN_CITY_FOLLOWING', 	'YieldType', 	'ARGTYPE_IDENTITY', 		'YIELD_GOLD',			NULL, 	NULL) ,
	('QUO_ARABIA_GOLD_PER_FOREIGN_CITY_FOLLOWING', 	'PerXItems', 	'ARGTYPE_IDENTITY', 		'1',			NULL, 	NULL) ,
	('QUO_ARABIA_GOLD_PER_FOREIGN_CITY_FOLLOWING', 	'BeliefYieldType', 	'ARGTYPE_IDENTITY', 		'BELIEF_YIELD_PER_FOREIGN_CITY',			NULL, 	NULL) ;

INSERT INTO TraitModifiers
	(TraitType, 			ModifierID)
VALUES	('TRAIT_CIVILIZATION_LAST_PROPHET',	'QUO_ARABIA_GOLD_PER_FOREIGN_CITY_FOLLOWING') ;




-- Lower the number of trade routes Arabia gets from Commercial Sites, get routes from Holy Sites instead
-- Updated in v6.0.19 to clean up code and use Auto code defined in Global settings
INSERT INTO RequirementSets 
	(RequirementSetId, 		RequirementSetType)
VALUES 	('QUO_REQSET_LIGHTHOUSE_OR_MARKET', 	'REQUIREMENTSET_TEST_ANY') ,
	('QUO_REQSET_SHRINE_OR_LIBRARY', 	'REQUIREMENTSET_TEST_ANY') ;

INSERT INTO RequirementSetRequirements
	(RequirementSetId,	RequirementId)
VALUES	('QUO_REQSET_LIGHTHOUSE_OR_MARKET', 	'QUO_REQ_AUTO_CITY_HAS_BUILDING_LIGHTHOUSE'),
		('QUO_REQSET_LIGHTHOUSE_OR_MARKET', 	'QUO_REQ_AUTO_CITY_HAS_BUILDING_MARKET'),
		('QUO_REQSET_SHRINE_OR_LIBRARY', 	'QUO_REQ_AUTO_CITY_HAS_BUILDING_LIBRARY'),
		('QUO_REQSET_SHRINE_OR_LIBRARY', 	'QUO_REQ_AUTO_CITY_HAS_BUILDING_SHRINE') ;

-- NOTE: This effect re-uses the modifiertype established for England
INSERT INTO Modifiers
		(ModifierID, 			ModifierType, 					RunOnce, 	Permanent, 	OwnerRequirementSetId, 	SubjectRequirementSetId)
VALUES	('QUO_ARABIA_EXTRA_TRADERS', 	'QUO_MODTYPE_PLAYER_CITIES_ENGLAND_FREE_TRADE_ROUTE', 	0, 		0, 		NULL,			'QUO_REQSET_SHRINE_OR_LIBRARY') ,
		('QUO_ARABIA_REMOVE_TRADERS', 	'QUO_MODTYPE_PLAYER_CITIES_ENGLAND_FREE_TRADE_ROUTE', 	0, 		0, 		NULL,			'QUO_REQSET_LIGHTHOUSE_OR_MARKET') ;

INSERT INTO ModifierArguments
	(ModifierID,			Name,		Type, 				Value,			Extra)
VALUES	('QUO_ARABIA_EXTRA_TRADERS', 	'Amount', 	'ARGTYPE_IDENTITY', 		'1',			NULL) ,
		('QUO_ARABIA_REMOVE_TRADERS', 	'Amount', 	'ARGTYPE_IDENTITY', 		'-1',			NULL) ;

INSERT INTO TraitModifiers
	(TraitType, 				ModifierID)
VALUES	('TRAIT_LEADER_RIGHTEOUSNESS_OF_FAITH',	'QUO_ARABIA_EXTRA_TRADERS') ,
		('TRAIT_LEADER_RIGHTEOUSNESS_OF_FAITH',	'QUO_ARABIA_REMOVE_TRADERS') ;





-- Restrict Commercial Sites
INSERT INTO ExcludedDistricts 
	(DistrictType,			TraitType)
VALUES ('DISTRICT_COMMERCIAL_HUB',	'TRAIT_LEADER_RIGHTEOUSNESS_OF_FAITH') ;





-- Give Arabia +5 gold in cities with both a Holy Site and a Campus
-- new in v3.08.1 
INSERT INTO Requirements
	(RequirementId, 		RequirementType, 				Likeliness,	Inverse, 	Triggered)
VALUES	('QUO_REQ_HAS_HOLY_SITE', 	'REQUIREMENT_CITY_HAS_DISTRICT',	0,0,0) , 
	('QUO_REQ_HAS_CAMPUS', 		'REQUIREMENT_CITY_HAS_DISTRICT',	0,0,0) ;

INSERT INTO RequirementArguments 
	(RequirementId,			Name, 			Type, 			Value, 				Extra, 	SecondExtra)
VALUES 	('QUO_REQ_HAS_HOLY_SITE',	'DistrictType',		'ARGTYPE_IDENTITY',	'DISTRICT_HOLY_SITE',	NULL,	NULL 	) ,
	('QUO_REQ_HAS_CAMPUS',		'DistrictType',		'ARGTYPE_IDENTITY',	'DISTRICT_CAMPUS',	NULL,	NULL 	) ;

INSERT INTO RequirementSets 
	(RequirementSetId, 				RequirementSetType)
VALUES 	('QUO_REQSET_HAS_HOLY_SITE_AND_CAMPUS', 	'REQUIREMENTSET_TEST_ALL') ;

INSERT INTO RequirementSetRequirements
	(RequirementSetId,	RequirementId)
VALUES	('QUO_REQSET_HAS_HOLY_SITE_AND_CAMPUS', 	'QUO_REQ_HAS_HOLY_SITE'),
	('QUO_REQSET_HAS_HOLY_SITE_AND_CAMPUS', 	'QUO_REQ_HAS_CAMPUS') ;


INSERT INTO Modifiers 
	(ModifierId, ModifierType, RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
VALUES	('QUO_ARABIA_GOLD_FROM_TWO_DISTRICTS', 'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_CHANGE', 0, 0, NULL, 'QUO_REQSET_HAS_HOLY_SITE_AND_CAMPUS') ;


INSERT INTO ModifierArguments
	(ModifierId, 			Name, 		Type, 			Value, 			Extra, 	SecondExtra)
VALUES	('QUO_ARABIA_GOLD_FROM_TWO_DISTRICTS', 	'Amount', 	'ARGTYPE_IDENTITY', 	'5',			NULL, 	NULL) , 
	('QUO_ARABIA_GOLD_FROM_TWO_DISTRICTS', 	'YieldType',	 'ARGTYPE_IDENTITY', 	'YIELD_GOLD',	NULL, 	NULL) ;


INSERT INTO TraitModifiers
	(TraitType, 			ModifierID)
VALUES	('TRAIT_LEADER_RIGHTEOUSNESS_OF_FAITH',	'QUO_ARABIA_GOLD_FROM_TWO_DISTRICTS') ;


-- Forbid Arabia from buying Great Merchants since they have no commercial zones to expend them in
INSERT INTO ExcludedGreatPersonClasses
	(GreatPersonClassType, TraitType)
VALUES('GREAT_PERSON_CLASS_MERCHANT', 'TRAIT_LEADER_RIGHTEOUSNESS_OF_FAITH') ;*/





-- SUMERIA
-- The Ziggurat now provides adjacency bonuses to Industrial Zones as if it were a mine or quarry

INSERT INTO Adjacency_YieldChanges 
	(ID,				Description,				YieldType,		YieldChange,	TilesRequired,	OtherDistrictAdjacent,	AdjacentSeaResource,	AdjacentTerrain,	AdjacentFeature,	AdjacentRiver,	AdjacentWonder,	AdjacentNaturalWonder,	AdjacentImprovement,		AdjacentDistrict,	PrereqCivic,	PrereqTech,	ObsoleteCivic,	ObsoleteTech,	AdjacentResource)
VALUES	('QUO_Zig_Ham',			'QUO_LOC_ZIG_ADJ',			'YIELD_PRODUCTION',	2,		1,		0,			0,			NULL,			NULL,			0,		0,		0,			'IMPROVEMENT_ZIGGURAT',		NULL,			NULL,		NULL,		NULL,		NULL,		0) ;

INSERT INTO District_Adjacencies
	(DistrictType,	YieldChangeId)
VALUES	('DISTRICT_INDUSTRIAL_ZONE', 'QUO_Zig_Ham') ; 



-- Ziggurat can only be built on rivers
UPDATE Improvements SET RequiresRiver=1, SameAdjacentValid=0, OnePerCity=1 WHERE ImprovementType='IMPROVEMENT_ZIGGURAT' ;


-- Give the Ziggurat a radial bonus to tiles not also adjacent the river

INSERT INTO Requirements
		(RequirementId, 		RequirementType, 	Likeliness,	Inverse, 	Triggered)
VALUES	('QUO_REQ_ZIGGURAT_ADJ_BONUS', 	'REQUIREMENT_PLOT_ADJACENT_IMPROVEMENT_TYPE_MATCHES',	0,0,0) ,
		('QUO_REQ_ZIGGURAT_ADJ_RIVER', 	'REQUIREMENT_PLOT_ADJACENT_TO_RIVER',	0,1,0) ;
		

INSERT INTO RequirementArguments 
		(RequirementId,			Name, 			Type, 			Value, 		Extra, 	SecondExtra)
VALUES 	('QUO_REQ_ZIGGURAT_ADJ_BONUS',	'ImprovementType',		'ARGTYPE_IDENTITY',		'IMPROVEMENT_ZIGGURAT',	NULL,	NULL 	)  ;

		
INSERT INTO RequirementSets 
		(RequirementSetId, 		RequirementSetType)
VALUES	('QUO_REQSET_ZIGGURAT_ADJ_BONUS', 	'REQUIREMENTSET_TEST_ALL') ;

INSERT INTO RequirementSetRequirements
	(RequirementSetId,	RequirementId)
VALUES	('QUO_REQSET_ZIGGURAT_ADJ_BONUS', 	'QUO_REQ_ZIGGURAT_ADJ_BONUS') ,
		('QUO_REQSET_ZIGGURAT_ADJ_BONUS', 	'QUO_REQ_ZIGGURAT_ADJ_RIVER') ;
		

INSERT INTO Modifiers 
	(ModifierId, ModifierType, RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
VALUES	('QUO_ZIGGURAT_ADJACENCY_SCIENCE', 'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD', 0, 0, NULL, 'QUO_REQSET_ZIGGURAT_ADJ_BONUS') ,
		('QUO_ZIGGURAT_ADJACENCY_SCIENCE_PLAYER', 	'MODIFIER_PLAYER_CITIES_ATTACH_MODIFIER', 0, 0, NULL, NULL) ;
 
INSERT INTO ModifierArguments
		(ModifierId, 			Name, 		Type, 			Value, 			Extra, 	SecondExtra)
VALUES	('QUO_ZIGGURAT_ADJACENCY_SCIENCE', 	'Amount', 	'ARGTYPE_IDENTITY', 	'1',			NULL, 	NULL),
		('QUO_ZIGGURAT_ADJACENCY_SCIENCE', 	'YieldType', 	'ARGTYPE_IDENTITY', 	'YIELD_SCIENCE',			NULL, 	NULL) ,
		('QUO_ZIGGURAT_ADJACENCY_SCIENCE_PLAYER', 	'ModifierId', 	'ARGTYPE_IDENTITY', 	'QUO_ZIGGURAT_ADJACENCY_SCIENCE',		NULL, 	NULL)  ;

		
INSERT INTO TraitModifiers
		(TraitType, 			ModifierID)
VALUES	('TRAIT_LEADER_MAJOR_CIV',	'QUO_ZIGGURAT_ADJACENCY_SCIENCE_PLAYER') ;





-- Give Sumeria a permanent +10 bonus to fighting Barbarians
INSERT INTO Modifiers 
	(ModifierId, ModifierType, RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
VALUES	('QUO_SUMERIA_BARBARIANS', 'MODIFIER_PLAYER_UNITS_ADJUST_BARBARIAN_COMBAT', 0, 0, NULL, NULL) ;


INSERT INTO ModifierArguments
	(ModifierId, 			Name, 		Type, 			Value, 		Extra, 	SecondExtra)
VALUES	('QUO_SUMERIA_BARBARIANS', 	'Amount', 	'ARGTYPE_IDENTITY', 	'10',		NULL, 	NULL) ;



INSERT INTO TraitModifiers
	(TraitType, 					ModifierID)
VALUES	('TRAIT_CIVILIZATION_FIRST_CIVILIZATION',	'QUO_SUMERIA_BARBARIANS') ;



-- Nerf the War Cart by delaying it 
UPDATE Units SET PrereqTech=NULL, PrereqCivic='CIVIC_FOREIGN_TRADE' WHERE UnitType='UNIT_SUMERIAN_WAR_CART' ; 



-- Give Sumeria a burst of Culture
-- Changed to a new method for v6.0.1 to prevent issues with the tutorial system introduced in Rise and Fall
/* INSERT INTO Modifiers 
	(ModifierId, ModifierType, RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
VALUES	('QUO_SUMERIA_FREE_STARTING_CULTURE', 'MODIFIER_PLAYER_GRANT_YIELD', 1, 1, NULL, NULL) ;


INSERT INTO ModifierArguments
	(ModifierId, 			Name, 			Type, 			Value, 		Extra, 	SecondExtra)
VALUES	('QUO_SUMERIA_FREE_STARTING_CULTURE', 	'Amount', 	'ScaleByGameSpeed', 	'20',		NULL, 	NULL),
	('QUO_SUMERIA_FREE_STARTING_CULTURE', 	'YieldType', 	'ARGTYPE_IDENTITY', 	'YIELD_CULTURE',	NULL, 	NULL)  ;


INSERT INTO TraitModifiers
	(TraitType, 			ModifierID)
VALUES	('TRAIT_CIVILIZATION_FIRST_CIVILIZATION',	'QUO_SUMERIA_FREE_STARTING_CULTURE')  ; */


INSERT INTO Requirements
	(RequirementId, 		RequirementType, 	Likeliness,	Inverse, 	Triggered)
VALUES	('QUO_REQ_SUMERIA_CITY_HAS_PALACE', 		'REQUIREMENT_CITY_HAS_BUILDING',	0,0,0) ;


INSERT INTO RequirementArguments 
	(RequirementId,			Name, 			Type, 			Value, 				Extra, 	SecondExtra)
VALUES 	('QUO_REQ_SUMERIA_CITY_HAS_PALACE',	'BuildingType',		'ARGTYPE_IDENTITY',	'BUILDING_PALACE',	NULL,	NULL 	)  ;


INSERT INTO RequirementSets 
	(RequirementSetId, 		RequirementSetType)
VALUES 	('QUO_REQSET_SUMERIA_FREE_CULTURE_UNLOCK', 	'REQUIREMENTSET_TEST_ALL') ;


INSERT INTO RequirementSetRequirements
	(RequirementSetId,	RequirementId)
VALUES	 ('QUO_REQSET_SUMERIA_FREE_CULTURE_UNLOCK', 	'QUO_REQ_SUMERIA_CITY_HAS_PALACE')  ; 



INSERT INTO Modifiers 
	(ModifierId, ModifierType, RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
VALUES	('QUO_SUMERIA_FREE_STARTING_CULTURE', 'MODIFIER_PLAYER_GRANT_YIELD', 1, 1, NULL, NULL) ,
		('QUO_SUMERIA_FREE_STARTING_CULTURE_PLAYER', 'MODIFIER_PLAYER_CITIES_ATTACH_MODIFIER', 0, 0, NULL, 	'QUO_REQSET_SUMERIA_FREE_CULTURE_UNLOCK') ;


INSERT INTO ModifierArguments
	(ModifierId, 			Name, 			Type, 			Value, 		Extra, 	SecondExtra)
VALUES	('QUO_SUMERIA_FREE_STARTING_CULTURE', 	'Amount', 	'ScaleByGameSpeed', 	'19',		NULL, 	NULL),
		('QUO_SUMERIA_FREE_STARTING_CULTURE', 	'YieldType', 	'ARGTYPE_IDENTITY', 	'YIELD_CULTURE',	NULL, 	NULL)  ,
		('QUO_SUMERIA_FREE_STARTING_CULTURE_PLAYER', 	'ModifierId', 	'ARGTYPE_IDENTITY', 	'QUO_SUMERIA_FREE_STARTING_CULTURE',	NULL, 	NULL)  ;
	

INSERT INTO TraitModifiers
	(TraitType, 			ModifierID)
VALUES	('TRAIT_CIVILIZATION_FIRST_CIVILIZATION',	'QUO_SUMERIA_FREE_STARTING_CULTURE_PLAYER')  ;




-- CHINA
-- Great Wall now gives +0.5 as an adjacency bonus to districts it borders

INSERT INTO Adjacency_YieldChanges 
	(ID,				Description,				YieldType,		YieldChange,	TilesRequired,	OtherDistrictAdjacent,	AdjacentSeaResource,	AdjacentTerrain,	AdjacentFeature,	AdjacentRiver,	AdjacentWonder,	AdjacentNaturalWonder,	AdjacentImprovement,		AdjacentDistrict,	PrereqCivic,	PrereqTech,	ObsoleteCivic,	ObsoleteTech,	AdjacentResource)
VALUES	('QUO_GreatWall_Ham',		'QUO_LOC_GREATWALL_ADJ',		'YIELD_PRODUCTION',	1,		2,		0,			0,			NULL,			NULL,			0,		0,		0,			'IMPROVEMENT_GREAT_WALL',	NULL,			NULL,		NULL,		NULL,		NULL,		0), 
	('QUO_GreatWall_Cul',		'QUO_LOC_GREATWALL_ADJ',		'YIELD_CULTURE',	1,		2,		0,			0,			NULL,			NULL,			0,		0,		0,			'IMPROVEMENT_GREAT_WALL',	NULL,			NULL,		NULL,		NULL,		NULL,		0), 
	('QUO_GreatWall_Fai',		'QUO_LOC_GREATWALL_ADJ',		'YIELD_FAITH',	1,		2,		0,			0,			NULL,			NULL,			0,		0,		0,			'IMPROVEMENT_GREAT_WALL',	NULL,			NULL,		NULL,		NULL,		NULL,		0), 
	('QUO_GreatWall_Sci',		'QUO_LOC_GREATWALL_ADJ',		'YIELD_SCIENCE',	1,		2,		0,			0,			NULL,			NULL,			0,		0,		0,			'IMPROVEMENT_GREAT_WALL',	NULL,			NULL,		NULL,		NULL,		NULL,		0), 
	('QUO_GreatWall_Gold',		'QUO_LOC_GREATWALL_ADJ',		'YIELD_GOLD',	1,		2,		0,			0,			NULL,			NULL,			0,		0,		0,			'IMPROVEMENT_GREAT_WALL',	NULL,			NULL,		NULL,		NULL,		NULL,		0) ;

INSERT INTO District_Adjacencies
	(DistrictType,	YieldChangeId)
VALUES	('DISTRICT_HOLY_SITE', 'QUO_GreatWall_Fai'), 
	('DISTRICT_THEATER', 'QUO_GreatWall_Cul'),
	('DISTRICT_COMMERCIAL_HUB', 'QUO_GreatWall_Gold'),
	('DISTRICT_INDUSTRIAL_ZONE', 'QUO_GreatWall_Ham'),
	('DISTRICT_CAMPUS', 'QUO_GreatWall_Sci') ; 
	
	
	
-- New for Rise and Fall, the Great Wall slows movements
-- Not yet ready for release
--UPDATE Improvements SET MovementChange = '2', CanBuildOutsideTerritory='1' WHERE ImprovementType='IMPROVEMENT_GREAT_WALL' ;
	
	

-- Make China immune to their own Great Wall improvement
/*INSERT INTO Requirements
	(RequirementId, 		RequirementType, 	Likeliness,	Inverse, 	Triggered)
VALUES	('QUO_REQ_CHINA_AVOID_GREAT_WALL', 	'REQUIREMENT_PLOT_IMPROVEMENT_TYPE_MATCHES', 0,0,0)  ;


INSERT INTO RequirementArguments 
		(RequirementId,			Name, 			Type, 			Value, 		Extra, 	SecondExtra)
VALUES 	('QUO_REQ_CHINA_AVOID_GREAT_WALL',	'ImprovementType',		'ARGTYPE_IDENTITY',		'IMPROVEMENT_GREAT_WALL',	NULL,	NULL 	)  ;


INSERT INTO RequirementSets 
	(RequirementSetId, 		RequirementSetType)
VALUES 	('QUO_REQSET_CHINA_AVOID_GREAT_WALL', 	'REQUIREMENTSET_TEST_ALL') ;



INSERT INTO RequirementSetRequirements
	(RequirementSetId,	RequirementId)
VALUES	('QUO_REQSET_CHINA_AVOID_GREAT_WALL', 	'QUO_REQ_CHINA_AVOID_GREAT_WALL')  ;
		
		
INSERT INTO Modifiers 
	(ModifierId, 	ModifierType, 	RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
VALUES	('QUO_CHINA_TROOP_MOVEMENT', 	'MODIFIER_PLAYER_UNIT_ADJUST_MOVEMENT', 0, 0, NULL, 'QUO_REQSET_CHINA_AVOID_GREAT_WALL')  ,
('QUO_CHINA_TROOP_MOVEMENT_PLAYER', 	'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER', 0, 0, NULL, NULL)  ;

INSERT INTO ModifierArguments
	(ModifierId, 			Name, 		Type, 			Value, 					Extra, 	SecondExtra)
VALUES	('QUO_CHINA_TROOP_MOVEMENT', 	'Amount', 	'ARGTYPE_IDENTITY', 	'-2',					NULL, 	NULL) ,	
		('QUO_CHINA_TROOP_MOVEMENT_PLAYER', 	'ModifierId', 	'ARGTYPE_IDENTITY', 	'QUO_CHINA_TROOP_MOVEMENT',		NULL, 	NULL)  ;


INSERT INTO TraitModifiers
		(TraitType, 		ModifierId)
VALUES 	('TRAIT_CIVILIZATION_DYNASTIC_CYCLE',	'QUO_CHINA_TROOP_MOVEMENT_PLAYER');*/




	

-- GREECE

-- Hoplites
-- Create a new ability that damages melee units


-- Is this a melee unit we are attacking?
INSERT INTO Requirements
	(RequirementId, 	RequirementType, 	Likeliness,	Inverse, 	Triggered)
VALUES	('QUO_REQ_OPPONENT_MELEE', 	'REQUIREMENT_OPPONENT_UNIT_PROMOTION_CLASS_MATCHES',	0,0,0) ;


INSERT INTO RequirementArguments 
	(RequirementId,			Name, 			Type, 			Value, 				Extra, 	SecondExtra)
VALUES 	('QUO_REQ_OPPONENT_MELEE',	'UnitPromotionClass',	'ARGTYPE_IDENTITY',	'PROMOTION_CLASS_MELEE',	NULL,	NULL 	) ;


INSERT INTO RequirementSets 
	(RequirementSetId, 	RequirementSetType)
VALUES 	('QUO_REQSET_OPPONENT_MELEE', 'REQUIREMENTSET_TEST_ALL') ;


INSERT INTO RequirementSetRequirements
	(RequirementSetId,	RequirementId)
VALUES	('QUO_REQSET_OPPONENT_MELEE', 'QUO_REQ_OPPONENT_MELEE') ;


-- The modifier
INSERT INTO Modifiers 
	(ModifierId, ModifierType, RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
VALUES	('QUO_MOD_ANTI_MELEE', 'MODIFIER_UNIT_ADJUST_COMBAT_STRENGTH', 0, 0, NULL, 'QUO_REQSET_OPPONENT_MELEE') ;


INSERT INTO ModifierArguments
	(ModifierId, 			Name, 		Type, 			Value, 		Extra, 	SecondExtra)
VALUES	('QUO_MOD_ANTI_MELEE', 		'Amount', 	'ARGTYPE_IDENTITY', 	'10',		NULL, 	NULL) ;


-- Create the ability
INSERT INTO Types
	(Type, 				Kind)
VALUES 	('QUO_ABI_ANTI_MELEE',		'KIND_ABILITY'	) ;


INSERT INTO UnitAbilities
	(UnitAbilityType, 	Name, 				Description, 					Inactive)
VALUES 	('QUO_ABI_ANTI_MELEE', 	'QUO_LOC_ABI_ANTI_MELEE',	'QUO_LOC_ABILITY_ANTI_CAVALRY_DESCRIPTION', 	0) ;


INSERT INTO UnitAbilityModifiers
	(UnitAbilityType, 	ModifierId)
VALUES 	('QUO_ABI_ANTI_MELEE',	'QUO_MOD_ANTI_MELEE') ;	 



-- Tie the ability to the unit
INSERT INTO TypeTags
	(Type,					Tag)
VALUES  ('QUO_ABI_ANTI_MELEE', 			'CLASS_HOPLITE') ;



-- Add a string to describe the ability in combat previews
INSERT INTO ModifierStrings
	(ModifierId, 		Context, Text)
VALUES	('QUO_MOD_ANTI_MELEE', 'Preview', 'QUO_LOC_ABILITY_ANTI_MELEE_MODIFIER_DESCRIPTION') ;



-- Buff the Acropolis
-- Add a Diplomacy Token after every wonder built
-- Removed due to being overpowered
/* INSERT INTO Modifiers
		(ModifierID, 			ModifierType, 					RunOnce, 	Permanent, 	OwnerRequirementSetId, 	SubjectRequirementSetId)
VALUES	('QUO_GREECE_ACROPOLIS_TOKEN', 	            'MODIFIER_PLAYER_GRANT_INFLUENCE_TOKEN', 	1, 		1, 		NULL,			NULL);


INSERT INTO ModifierArguments
		(ModifierID,			Name,		Type, 			Value,	Extra, SecondExtra)
VALUES	('QUO_GREECE_ACROPOLIS_TOKEN', 	            'Amount', 	'ARGTYPE_IDENTITY', 	1,	NULL, NULL) ;


INSERT INTO DistrictModifiers
		(DistrictType,		ModifierID)
VALUES	('DISTRICT_ACROPOLIS', 'QUO_GREECE_ACROPOLIS_TOKEN') ;
 */





-- Pericles only
-- Let Pericles accumulate influence points when not at war
INSERT INTO Requirements
	(RequirementId, 	RequirementType, 	Likeliness,	Inverse, 	Triggered)
VALUES	('QUO_REQ_AT_WAR_WITH_MAJOR', 	'REQUIREMENT_PLAYER_IS_AT_PEACE_WITH_ALL_MAJORS',	0,1,0) ;


INSERT INTO RequirementSets 
	(RequirementSetId, 	RequirementSetType)
VALUES 	('QUO_REQSET_AT_WAR_WITH_MAJOR', 	'REQUIREMENTSET_TEST_ALL') ;


INSERT INTO RequirementSetRequirements
	(RequirementSetId,	RequirementId)
VALUES	('QUO_REQSET_AT_WAR_WITH_MAJOR', 	'QUO_REQ_AT_WAR_WITH_MAJOR') ;


-- Pericles has bonus production when not at war and a penalty when warring
INSERT INTO Modifiers
	(ModifierID, 				ModifierType, 						RunOnce, 	Permanent, 	OwnerRequirementSetId, 	SubjectRequirementSetId)
VALUES	('QUO_PERICLES_FAST_DISTRICTS', 	'MODIFIER_PLAYER_CITIES_ADJUST_ALL_DISTRICTS_PRODUCTION', 	0, 		0, 		NULL,			'PLAYER_IS_AT_PEACE_WITH_ALL_MAJORS') ,
		('QUO_PERICLES_SLOW_DISTRICTS', 	'MODIFIER_PLAYER_CITIES_ADJUST_ALL_DISTRICTS_PRODUCTION', 	0, 		0, 		NULL,			'QUO_REQSET_AT_WAR_WITH_MAJOR') ;

INSERT INTO ModifierArguments
	(ModifierID,				Name,		Type, 				Value,			Extra)
VALUES	('QUO_PERICLES_FAST_DISTRICTS', 	'Amount', 	'ARGTYPE_IDENTITY', 		'20',			NULL) ,
		('QUO_PERICLES_SLOW_DISTRICTS', 	'Amount', 	'ARGTYPE_IDENTITY', 		'-10',			NULL) ;

INSERT INTO TraitModifiers
	(TraitType, 				ModifierID)
VALUES	('TRAIT_LEADER_SURROUNDED_BY_GLORY',	'QUO_PERICLES_FAST_DISTRICTS') ;
	--	('TRAIT_LEADER_SURROUNDED_BY_GLORY',	'QUO_PERICLES_SLOW_DISTRICTS') ;





-- Gorgo only



-- Receive bonus culture after declaring war 
INSERT INTO Modifiers
	(ModifierID, 				ModifierType, 						RunOnce, 	Permanent, 	OwnerRequirementSetId, 	SubjectRequirementSetId)
VALUES	('QUO_GORGO_WAR_REWARD_CULT', 	'MODIFIER_PLAYER_ADD_DIPLOMATIC_YIELD_MODIFIER', 	0, 		0, 		NULL,		NULL) ,
('QUO_GORGO_WAR_REWARD_FAITH', 	'MODIFIER_PLAYER_ADD_DIPLOMATIC_YIELD_MODIFIER', 	0, 		0, 		NULL,		NULL) ,
('QUO_GORGO_WAR_REWARD_SCIENCE', 	'MODIFIER_PLAYER_ADD_DIPLOMATIC_YIELD_MODIFIER', 	0, 		0, 		NULL,		NULL) ,
('QUO_GORGO_WAR_REWARD_FOOD', 	'MODIFIER_PLAYER_ADD_DIPLOMATIC_YIELD_MODIFIER', 	0, 		0, 		NULL,		NULL) ,
('QUO_GORGO_WAR_REWARD_GOLD', 	'MODIFIER_PLAYER_ADD_DIPLOMATIC_YIELD_MODIFIER', 	0, 		0, 		NULL,		NULL) ,
('QUO_GORGO_WAR_REWARD_PROD', 	'MODIFIER_PLAYER_ADD_DIPLOMATIC_YIELD_MODIFIER', 	0, 		0, 		NULL,		NULL) ;

INSERT INTO ModifierArguments
	(ModifierID,				Name,		Type, 				Value,			Extra)
VALUES	('QUO_GORGO_WAR_REWARD_CULT', 	'DiplomaticYieldSource', 	'ARGTYPE_IDENTITY', 		'SURPRISE_WAR_INITIATED',			NULL) ,
		('QUO_GORGO_WAR_REWARD_CULT', 	'TurnsActive', 	'ARGTYPE_IDENTITY', 		'50',			NULL) ,
		('QUO_GORGO_WAR_REWARD_CULT', 	'YieldType', 	'ARGTYPE_IDENTITY', 		'YIELD_CULTURE',			NULL) ,
		('QUO_GORGO_WAR_REWARD_CULT', 	'Amount', 	'ARGTYPE_IDENTITY', 			'10',			NULL) ,
		('QUO_GORGO_WAR_REWARD_FAITH', 	'DiplomaticYieldSource', 	'ARGTYPE_IDENTITY', 		'SURPRISE_WAR_INITIATED',			NULL) ,
		('QUO_GORGO_WAR_REWARD_FAITH', 	'TurnsActive', 	'ARGTYPE_IDENTITY', 		'50',			NULL) ,
		('QUO_GORGO_WAR_REWARD_FAITH', 	'YieldType', 	'ARGTYPE_IDENTITY', 		'YIELD_FAITH',			NULL) ,
		('QUO_GORGO_WAR_REWARD_FAITH', 	'Amount', 	'ARGTYPE_IDENTITY', 			'5',			NULL) ,
		('QUO_GORGO_WAR_REWARD_SCIENCE', 	'DiplomaticYieldSource', 	'ARGTYPE_IDENTITY', 		'SURPRISE_WAR_INITIATED',			NULL) ,
		('QUO_GORGO_WAR_REWARD_SCIENCE', 	'TurnsActive', 	'ARGTYPE_IDENTITY', 		'50',			NULL) ,
		('QUO_GORGO_WAR_REWARD_SCIENCE', 	'YieldType', 	'ARGTYPE_IDENTITY', 		'YIELD_SCIENCE',			NULL) ,
		('QUO_GORGO_WAR_REWARD_SCIENCE', 	'Amount', 	'ARGTYPE_IDENTITY', 			'5',			NULL) ,
		('QUO_GORGO_WAR_REWARD_FOOD', 	'DiplomaticYieldSource', 	'ARGTYPE_IDENTITY', 		'SURPRISE_WAR_INITIATED',			NULL) ,
		('QUO_GORGO_WAR_REWARD_FOOD', 	'TurnsActive', 	'ARGTYPE_IDENTITY', 		'50',			NULL) ,
		('QUO_GORGO_WAR_REWARD_FOOD', 	'YieldType', 	'ARGTYPE_IDENTITY', 		'YIELD_FOOD',			NULL) ,
		('QUO_GORGO_WAR_REWARD_FOOD', 	'Amount', 	'ARGTYPE_IDENTITY', 			'5',			NULL) ,
		('QUO_GORGO_WAR_REWARD_GOLD', 	'DiplomaticYieldSource', 	'ARGTYPE_IDENTITY', 		'SURPRISE_WAR_INITIATED',			NULL) ,
		('QUO_GORGO_WAR_REWARD_GOLD', 	'TurnsActive', 	'ARGTYPE_IDENTITY', 		'50',			NULL) ,
		('QUO_GORGO_WAR_REWARD_GOLD', 	'YieldType', 	'ARGTYPE_IDENTITY', 		'YIELD_GOLD',			NULL) ,
		('QUO_GORGO_WAR_REWARD_GOLD', 	'Amount', 	'ARGTYPE_IDENTITY', 			'5',			NULL) ,
		('QUO_GORGO_WAR_REWARD_PROD', 	'DiplomaticYieldSource', 	'ARGTYPE_IDENTITY', 		'SURPRISE_WAR_INITIATED',			NULL) ,
		('QUO_GORGO_WAR_REWARD_PROD', 	'TurnsActive', 	'ARGTYPE_IDENTITY', 		'50',			NULL) ,
		('QUO_GORGO_WAR_REWARD_PROD', 	'YieldType', 	'ARGTYPE_IDENTITY', 		'YIELD_PRODUCTION',			NULL) ,
		('QUO_GORGO_WAR_REWARD_PROD', 	'Amount', 	'ARGTYPE_IDENTITY', 			'5',			NULL) ;
		

INSERT INTO TraitModifiers
	(TraitType, 				ModifierID)
VALUES	('CULTURE_KILLS_TRAIT',	'QUO_GORGO_WAR_REWARD_CULT') ,
		('CULTURE_KILLS_TRAIT',	'QUO_GORGO_WAR_REWARD_FAITH') ,	
		('CULTURE_KILLS_TRAIT',	'QUO_GORGO_WAR_REWARD_SCIENCE') ,
		('CULTURE_KILLS_TRAIT',	'QUO_GORGO_WAR_REWARD_FOOD') ,
		('CULTURE_KILLS_TRAIT',	'QUO_GORGO_WAR_REWARD_GOLD') ,
		('CULTURE_KILLS_TRAIT',	'QUO_GORGO_WAR_REWARD_PROD') ;





-- Gorgo provides Anti-Cavalry with additional range
INSERT INTO Requirements
	(RequirementId, 		RequirementType, 	Likeliness,	Inverse, 	Triggered)
VALUES	('QUO_REQ_GREECE_ANTI_CALV', 	'REQUIREMENT_UNIT_PROMOTION_CLASS_MATCHES',	0,0,0) ;


INSERT INTO RequirementArguments 
		(RequirementId,			Name, 			Type, 			Value, 		Extra, 	SecondExtra)
VALUES 	('QUO_REQ_GREECE_ANTI_CALV',	'UnitPromotionClass',		'ARGTYPE_IDENTITY',		'PROMOTION_CLASS_ANTI_CAVALRY',	NULL,	NULL 	) ;


INSERT INTO RequirementSets 
	(RequirementSetId, 		RequirementSetType)
VALUES 	('QUO_REQSET_GREECE_ANTI_CALV', 	'REQUIREMENTSET_TEST_ANY') ;

 INSERT INTO RequirementSetRequirements
	(RequirementSetId,	RequirementId)
VALUES	('QUO_REQSET_GREECE_ANTI_CALV', 	'QUO_REQ_GREECE_ANTI_CALV') ; 


 INSERT INTO Modifiers 
	(ModifierId, 	ModifierType, 	RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
VALUES	('QUO_GORGO_ANTI_CAV_RANGE', 	'MODIFIER_UNIT_ADJUST_ATTACK_RANGE', 0, 0, NULL, NULL) ,
		('QUO_GORGO_ANTI_CAV_RANGE_PLAYER', 	'MODIFIER_PLAYER_UNITS_ATTACH_MODIFIER', 0, 0, NULL, 'QUO_REQSET_GREECE_ANTI_CALV') ;


INSERT INTO ModifierArguments
	(ModifierId, 			Name, 		Type, 			Value, 					Extra, 	SecondExtra)
VALUES	('QUO_GORGO_ANTI_CAV_RANGE', 	'Amount', 	'ARGTYPE_IDENTITY', 	'1',					NULL, 	NULL) ,	
		('QUO_GORGO_ANTI_CAV_RANGE_PLAYER', 	'ModifierId', 	'ARGTYPE_IDENTITY', 	'QUO_GORGO_ANTI_CAV_RANGE',		NULL, 	NULL)  ;


-- Only do this if the ranged option is enabled for Anti Cav
INSERT INTO TraitModifiers
		(TraitType, 		ModifierId)
SELECT 	'CULTURE_KILLS_TRAIT',	'QUO_GORGO_ANTI_CAV_RANGE_PLAYER'
FROM	tblQuoOptions WHERE tblQuoOptions.OptionID='QUO_OPTION_ARE_ANTI_CAV_RANGED' AND Value>= 1 ;




-- ROME
-- Slightly boost Roman legions since Swordsmen got buffed, and give them the Anti-Melee ability 
-- Removed after players felt it was overpowered

-- Anti-Melee ability
-- Removed for balance reasons

/* INSERT INTO Tags 
	(Tag, 				Vocabulary)
VALUES 	('QUO_CLASS_ROMAN_LEGION',	'ABILITY_CLASS'	) ;


INSERT INTO TypeTags
	(Type,				Tag)
VALUES	('UNIT_ROMAN_LEGION', 		'QUO_CLASS_ROMAN_LEGION') ;


INSERT INTO TypeTags
	(Type,				Tag)
VALUES  ('QUO_ABI_ANTI_MELEE', 		'QUO_CLASS_ROMAN_LEGION') ;
 */

 
 
 
 

-- NORWAY

--Start near Tundra
INSERT OR IGNORE INTO StartBiasTerrains
	(CivilizationType, TerrainType, Tier)
VALUES ('CIVILIZATION_NORWAY', 'TERRAIN_TUNDRA', 3),
		('CIVILIZATION_NORWAY', 'TERRAIN_TUNDRA_HILLS', 3);


-- Half off Stave Churches, removed in v2.9
-- UPDATE Buildings SET Cost=Cost*0.5 WHERE BuildingType='BUILDING_STAVE_CHURCH' ;


-- Norway now builds Stave Churches (temple replacement) in the city center, without needing a Holy District. Prereq is now the Monument.

-- removed in v3.14.4 in favor of using Firaxis' updated building


/* UPDATE Buildings SET PrereqDistrict='DISTRICT_CITY_CENTER' WHERE BuildingType='BUILDING_STAVE_CHURCH' ;

UPDATE BuildingPrereqs SET PrereqBuilding='BUILDING_MONUMENT' WHERE Building='BUILDING_STAVE_CHURCH' ;

-- Update the Stave Church so the extra faith is derived from the city center rather than Holy district
-- removed, since it doesn't work predictably
-- UPDATE ModifierArguments SET Value='DISTRICT_CITY_CENTER' WHERE Name='DistrictType' AND ModifierId='STAVE_CHURCH_FAITHWOODSADJACENCY' ;


-- Change the yields of the building
UPDATE Building_YieldChanges SET YieldChange='2' WHERE YieldType='YIELD_FAITH' AND BuildingType='BUILDING_STAVE_CHURCH' ;

INSERT INTO Building_YieldChanges (
                                      BuildingType,
                                      YieldType,
                                      YieldChange
                                  )
                                  VALUES (
                                      'BUILDING_STAVE_CHURCH',
                                      'YIELD_CULTURE',
                                      '1'
                                  );



INSERT INTO Building_YieldChanges (
                                      BuildingType,
                                      YieldType,
                                      YieldChange
                                  )
                                  VALUES (
                                      'BUILDING_STAVE_CHURCH',
                                      'YIELD_PRODUCTION',
                                      '1'
                                  );
 */

-- Allow Norway to violate Closed Borders with any ship

-- Removed because Rise and Fall broke the ability to send units into enemy territory without a war declaration

/* INSERT INTO Modifiers 
	(ModifierId, 	ModifierType, 	RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
VALUES	('QUO_MOD_BOATS_IGNORE_BORDERS', 	'MODIFIER_PLAYER_UNIT_ADJUST_ENTER_FOREIGN_LANDS', 0, 0, NULL, NULL) ;


INSERT INTO ModifierArguments
	(ModifierId, 			Name, 		Type, 			Value, 			Extra, 	SecondExtra)
VALUES	('QUO_MOD_BOATS_IGNORE_BORDERS', 	'Enter', 	'ARGTYPE_IDENTITY', 	'1',			NULL, 	NULL) ;

-- Modifier 2 for the application
INSERT INTO Modifiers 
	(ModifierId, 	ModifierType, 	RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
VALUES	('QUO_MOD_BOATS_IGNORE_BORDERS_2', 	'MODIFIER_PLAYER_UNITS_ATTACH_MODIFIER', 0, 0, NULL, 'REQUIREMENTS_UNIT_SEA_DOMAIN') ;


INSERT INTO ModifierArguments
	(ModifierId, 			Name, 		Type, 			Value, 			Extra, 	SecondExtra)
VALUES	('QUO_MOD_BOATS_IGNORE_BORDERS_2', 	'ModifierId', 	'ARGTYPE_IDENTITY', 	'QUO_MOD_BOATS_IGNORE_BORDERS',			NULL, 	NULL) ;


INSERT INTO TraitModifiers
	(TraitType, 			ModifierID)
VALUES	('TRAIT_LEADER_MELEE_COASTAL_RAIDS',	'QUO_MOD_BOATS_IGNORE_BORDERS_2') ; */



-- Remove prereqs for Viking Longship

UPDATE Units SET PrereqTech=NULL WHERE UnitType='UNIT_NORWEGIAN_LONGSHIP' ;



-- Give Norway a free boat when settling on Oceans
INSERT INTO Requirements
	(RequirementId, 		RequirementType, 	Likeliness,	Inverse, 	Triggered)
VALUES	('QUO_REQ_NORWAY_CITY_ADJACENT_COAST', 	'REQUIREMENT_PLOT_ADJACENT_TO_COAST',	0,0,0) ;


INSERT INTO RequirementSets 
	(RequirementSetId, 			RequirementSetType)
VALUES 	('QUO_REQSET_NORWAY_FREE_BOAT', 	'REQUIREMENTSET_TEST_ALL') ;


-- NOTE: Uses the new city founded by settler requirement introduced in R&F
INSERT INTO RequirementSetRequirements
	(RequirementSetId,	RequirementId)
VALUES	('QUO_REQSET_NORWAY_FREE_BOAT', 	'QUO_REQ_NORWAY_CITY_ADJACENT_COAST') ,
		('QUO_REQSET_NORWAY_FREE_BOAT', 	'CITY_FOUNDED_BY_SETTLER_REQUIREMENT') ;



INSERT INTO Modifiers 
	(ModifierId, 	ModifierType, 	RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
VALUES	('QUO_MOD_NORWAY_FREE_BOAT', 	'MODIFIER_PLAYER_CITIES_GRANT_UNIT_BY_CLASS', 0, 0, NULL, 'QUO_REQSET_NORWAY_FREE_BOAT') ;


INSERT INTO ModifierArguments
	(ModifierId, 			Name, 		Type, 			Value, 					Extra, 	SecondExtra)
VALUES	('QUO_MOD_NORWAY_FREE_BOAT', 	'UnitPromotionClassType', 	'ARGTYPE_IDENTITY', 	'PROMOTION_CLASS_NAVAL_MELEE',		NULL, 	NULL) ;


INSERT INTO TraitModifiers
	(TraitType, 				ModifierID)
VALUES	('TRAIT_LEADER_MELEE_COASTAL_RAIDS',	'QUO_MOD_NORWAY_FREE_BOAT') ;



-- Use old code for Pikemen for the Berzerker. Units adjacent to a Berzerker lose a point of movement. This stacks and can
-- deplete a unit's ability to move completely.

-- Removed to avoid dragging down the game

/* INSERT INTO Requirements
	(RequirementId, 		RequirementType, 	Likeliness,	Inverse, 	Triggered)
VALUES	('QUO_REQ_BERZERKER_ADJACENT', 	'REQUIREMENT_PLOT_ADJACENT_TO_OWNER_AT_WAR',	0,0,0) ;


INSERT INTO RequirementArguments 
	(RequirementId,			Name, 			Type, 			Value, 				Extra, 	SecondExtra)
VALUES 	('QUO_REQ_BERZERKER_ADJACENT',	'MaxDistance',	'ARGTYPE_IDENTITY',	'1',	NULL,	NULL 	) ,
	('QUO_REQ_BERZERKER_ADJACENT',	'MinDistance',	'ARGTYPE_IDENTITY',	'1',	NULL,	NULL 	) ;


INSERT INTO RequirementSets 
	(RequirementSetId, 		RequirementSetType)
VALUES 	('QUO_REQSET_BERZERKER_ADJACENT', 	'REQUIREMENTSET_TEST_ALL') ;
 

INSERT INTO RequirementSetRequirements
	(RequirementSetId,	RequirementId)
VALUES	('QUO_REQSET_BERZERKER_ADJACENT', 	'QUO_REQ_BERZERKER_ADJACENT') ;


INSERT INTO Modifiers 
	(ModifierId, ModifierType, RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
VALUES	('QUO_MOD_BERZERKER_DEBUFF', 'MODIFIER_ALL_UNITS_ATTACH_MODIFIER', 0, 0, NULL, 'QUO_REQSET_BERZERKER_ADJACENT') ,
	('QUO_MOD_BERZERKER_DEBUFF_2', 'MODIFIER_PLAYER_UNIT_ADJUST_MOVEMENT', 0, 0, NULL, NULL) ;


INSERT INTO ModifierArguments
	(ModifierId, 			Name, 		Type, 			Value, 		Extra, 	SecondExtra)
VALUES	('QUO_MOD_BERZERKER_DEBUFF', 	'ModifierId', 	'ARGTYPE_IDENTITY', 	'QUO_MOD_BERZERKER_DEBUFF_2',		NULL, 	NULL) ,
	('QUO_MOD_BERZERKER_DEBUFF_2', 		'Amount', 	'ARGTYPE_IDENTITY', 	'-1',		NULL, 	NULL) ;

	
INSERT INTO Types
	(Type, 				Kind)
VALUES 	('QUO_ABI_BERZERKER_DEBUFF',	'KIND_ABILITY'	) ;


INSERT INTO UnitAbilities
	(UnitAbilityType, 		Name, 					Description, 					Inactive)
VALUES 	('QUO_ABI_BERZERKER_DEBUFF', 	'LOC_QUO_ABI_BERZERKER_DEBUFF_NAME',	'LOC_QUO_ABI_BERZERKER_DEBUFF_DESCRIPTION', 	0) ;


INSERT INTO UnitAbilityModifiers
	(UnitAbilityType, 	ModifierId)
VALUES 	('QUO_ABI_BERZERKER_DEBUFF',	'QUO_MOD_BERZERKER_DEBUFF') ;
 */


 -- In v6.0.5 changed to an extra attack
INSERT INTO Modifiers 
	(ModifierId, ModifierType, RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
VALUES	('QUO_MOD_BERZERKER_EXTRA_ATTACK', 'MODIFIER_PLAYER_UNIT_ADJUST_ATTACK_AND_MOVE', 0, 0, NULL, NULL) ;


INSERT INTO ModifierArguments
	(ModifierId, 			Name, 		Type, 			Value, 		Extra, 	SecondExtra)
VALUES	('QUO_MOD_BERZERKER_EXTRA_ATTACK', 	'CanMove', 	'ARGTYPE_IDENTITY', 	'1',		NULL, 	NULL) ;

	
INSERT INTO Types
	(Type, 				Kind)
VALUES 	('QUO_ABI_BERZERKER_EXTRA_ATTACK',	'KIND_ABILITY'	) ;


INSERT INTO UnitAbilities
	(UnitAbilityType, 		Name, 					Description, 					Inactive)
VALUES 	('QUO_ABI_BERZERKER_EXTRA_ATTACK', 	'LOC_QUO_ABI_BERZERKER_DEBUFF_NAME',	'LOC_QUO_ABI_BERZERKER_DEBUFF_DESCRIPTION', 	0) ;


INSERT INTO UnitAbilityModifiers
	(UnitAbilityType, 	ModifierId)
VALUES 	('QUO_ABI_BERZERKER_EXTRA_ATTACK',	'QUO_MOD_BERZERKER_EXTRA_ATTACK') ;
 
 

INSERT INTO Tags 
	(Tag, 				Vocabulary)
VALUES 	('QUO_CLASS_BERZERKER',	'ABILITY_CLASS'	) ;


INSERT INTO TypeTags
	(Type,					Tag)
VALUES	('UNIT_NORWEGIAN_BERSERKER', 	'QUO_CLASS_BERZERKER') ;


INSERT INTO TypeTags
	(Type,					Tag)
VALUES  ('QUO_ABI_BERZERKER_EXTRA_ATTACK', 		'QUO_CLASS_BERZERKER') ;



-- AMERICA

-- Half off film studios, removed in v2.9
-- UPDATE Buildings SET Cost=Cost*0.5 WHERE BuildingType='BUILDING_FILM_STUDIO' ;



-- Lower the cost of purchasing tiles

/* INSERT INTO Modifiers 
	(ModifierId, ModifierType, RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
VALUES	('QUO_AMERICA_PLOTPURCHASECOST', 'MODIFIER_PLAYER_CITIES_ADJUST_PLOT_PURCHASE_COST', 0, 0, NULL, NULL) ;


INSERT INTO ModifierArguments
	(ModifierId, 			Name, 		Type, 			Value, 		Extra, 	SecondExtra)
VALUES	('QUO_AMERICA_PLOTPURCHASECOST', 'Amount', 	'ARGTYPE_IDENTITY', 	'-20',	NULL, 	NULL) ;


INSERT INTO TraitModifiers
	(TraitType, 			ModifierID)
VALUES	('TRAIT_CIVILIZATION_FOUNDING_FATHERS',	'QUO_AMERICA_PLOTPURCHASECOST') ; */




-- Give American units extra vision
-- Removed in the Rise and Fall expansion because America is already very strong. This ability is now associated with the Mapuche.
/*
-- Types and tag types to tell us which units will eventually get this ability
INSERT INTO Types
	(Type, 				Kind)
VALUES 	('QUO_ABILITY_EXTRA_VISION',	'KIND_ABILITY'	) ;


INSERT INTO TypeTags
	(Type,					Tag)
VALUES  ('QUO_ABILITY_EXTRA_VISION', 		'CLASS_RECON'), 
	('QUO_ABILITY_EXTRA_VISION', 		'CLASS_MELEE'), 
	('QUO_ABILITY_EXTRA_VISION', 		'CLASS_RANGED'),
	('QUO_ABILITY_EXTRA_VISION', 		'CLASS_SIEGE'),
 	('QUO_ABILITY_EXTRA_VISION', 		'CLASS_HEAVY_CAVALRY'),
	('QUO_ABILITY_EXTRA_VISION', 		'CLASS_RANGED_CAVALRY'),
	('QUO_ABILITY_EXTRA_VISION', 		'CLASS_ANTI_CAVALRY') ;
 

-- the vision modifier itself, including the amount of the bonus
INSERT INTO Modifiers 
	(ModifierId, 			ModifierType, 				RunOnce, 	Permanent, 	OwnerRequirementSetId, 	SubjectRequirementSetId)
VALUES	('QUO_SPYGLASS', 		'MODIFIER_PLAYER_UNIT_ADJUST_SIGHT', 	0, 		0, 		NULL, 			NULL) ;


INSERT INTO ModifierArguments
	(ModifierId, 			Name, 		Type, 			Value, 		Extra, 	SecondExtra)
VALUES	('QUO_SPYGLASS', 		'Amount', 	'ARGTYPE_IDENTITY', 	'1',	NULL, 	NULL) ;





-- the ability containing the vision modifier
INSERT INTO UnitAbilities
	(UnitAbilityType,		Name,				Description,			Inactive)
VALUES	('QUO_ABILITY_EXTRA_VISION',	'QUO_LOC_EXTRA_VISION',		'QUO_LOC_EXTRA_VISION_DESC',	"1"	) ;


INSERT INTO UnitAbilityModifiers
	(UnitAbilityType, 			ModifierId)
VALUES 	('QUO_ABILITY_EXTRA_VISION', 		'QUO_SPYGLASS');




-- Associate the new ability with America
INSERT INTO Modifiers 
	(ModifierId, 			ModifierType, 				RunOnce, 	Permanent, 	OwnerRequirementSetId, 	SubjectRequirementSetId)
VALUES	('QUO_AMERICA_ABILITY', 	'MODIFIER_PLAYER_UNITS_GRANT_ABILITY', 	0, 		1, 		NULL, 			NULL) ;


INSERT INTO ModifierArguments
	(ModifierId, 			Name, 		Type, 			Value, 		Extra, 	SecondExtra)
VALUES	('QUO_AMERICA_ABILITY', 	'AbilityType', 	'ARGTYPE_IDENTITY', 	'QUO_ABILITY_EXTRA_VISION',	NULL, 	NULL) ;



INSERT INTO TraitModifiers
	(TraitType, 					ModifierID)
VALUES	('TRAIT_CIVILIZATION_FOUNDING_FATHERS',			'QUO_AMERICA_ABILITY') ;
*/	



-- After building a film studio, America can build most improvements available to other civs
-- In Rise and Fall we changed this so it is local to the city, no longer global to the whole civ

INSERT INTO Modifiers 
	(ModifierId, 			ModifierType, 				RunOnce, 	Permanent, 	OwnerRequirementSetId, 	SubjectRequirementSetId)
VALUES	('QUO_AMERICA_ENABLE_FAKE_SPHINX', 	'MODIFIER_CITY_ADJUST_ALLOWED_IMPROVEMENT', 	0, 		0, 		NULL, 			NULL),
	('QUO_AMERICA_ENABLE_FAKE_MISSION', 	'MODIFIER_CITY_ADJUST_ALLOWED_IMPROVEMENT', 	0, 		0, 		NULL, 			NULL) ,
	('QUO_AMERICA_ENABLE_FAKE_CHATEAU', 	'MODIFIER_CITY_ADJUST_ALLOWED_IMPROVEMENT', 	0, 		0, 		NULL, 			NULL) ,
	('QUO_AMERICA_ENABLE_FAKE_GREAT_WALL', 	'MODIFIER_CITY_ADJUST_ALLOWED_IMPROVEMENT', 	0, 		0, 		NULL, 			NULL) ,
	('QUO_AMERICA_ENABLE_FAKE_STEPWELL', 	'MODIFIER_CITY_ADJUST_ALLOWED_IMPROVEMENT', 	0, 		0, 		NULL, 			NULL) ,
	('QUO_AMERICA_ENABLE_FAKE_ZIGGURAT', 	'MODIFIER_CITY_ADJUST_ALLOWED_IMPROVEMENT', 	0, 		0, 		NULL, 			NULL) , 
	('QUO_AMERICA_ENABLE_FAKE_KURGAN', 	'MODIFIER_CITY_ADJUST_ALLOWED_IMPROVEMENT', 	0, 		0, 		NULL, 			NULL) , 
	('QUO_AMERICA_ENABLE_FAKE_COLOSSAL_HEAD', 'MODIFIER_CITY_ADJUST_ALLOWED_IMPROVEMENT', 	0, 		0, 		NULL, 			NULL) ;



INSERT INTO ModifierArguments
	(ModifierId, 				Name, 			Type, 			Value, 				Extra, 	SecondExtra)
VALUES	('QUO_AMERICA_ENABLE_FAKE_SPHINX', 	'ImprovementType', 	'ARGTYPE_IDENTITY', 	'IMPROVEMENT_SPHINX',		NULL, 	NULL) ,
	('QUO_AMERICA_ENABLE_FAKE_MISSION', 	'ImprovementType', 	'ARGTYPE_IDENTITY', 	'IMPROVEMENT_MISSION',		NULL, 	NULL),
	('QUO_AMERICA_ENABLE_FAKE_CHATEAU', 	'ImprovementType', 	'ARGTYPE_IDENTITY', 	'IMPROVEMENT_CHATEAU',		NULL, 	NULL) ,
	('QUO_AMERICA_ENABLE_FAKE_GREAT_WALL', 	'ImprovementType', 	'ARGTYPE_IDENTITY', 	'IMPROVEMENT_GREAT_WALL',	NULL, 	NULL) ,
	('QUO_AMERICA_ENABLE_FAKE_STEPWELL', 	'ImprovementType', 	'ARGTYPE_IDENTITY', 	'IMPROVEMENT_STEPWELL',		NULL, 	NULL) ,
	('QUO_AMERICA_ENABLE_FAKE_ZIGGURAT', 	'ImprovementType', 	'ARGTYPE_IDENTITY', 	'IMPROVEMENT_ZIGGURAT',		NULL, 	NULL) ,
	('QUO_AMERICA_ENABLE_FAKE_KURGAN', 	'ImprovementType', 	'ARGTYPE_IDENTITY', 	'IMPROVEMENT_KURGAN',		NULL, 	NULL) ,
	('QUO_AMERICA_ENABLE_FAKE_COLOSSAL_HEAD', 'ImprovementType', 	'ARGTYPE_IDENTITY', 	'IMPROVEMENT_COLOSSAL_HEAD',	NULL, 	NULL) ;



INSERT INTO BuildingModifiers
	(BuildingType, 					ModifierID)
VALUES	('BUILDING_FILM_STUDIO',			'QUO_AMERICA_ENABLE_FAKE_SPHINX') ,
 	('BUILDING_FILM_STUDIO',			'QUO_AMERICA_ENABLE_FAKE_MISSION') , 
 	('BUILDING_FILM_STUDIO',			'QUO_AMERICA_ENABLE_FAKE_CHATEAU') , 
 	('BUILDING_FILM_STUDIO',			'QUO_AMERICA_ENABLE_FAKE_GREAT_WALL') , 
 	('BUILDING_FILM_STUDIO',			'QUO_AMERICA_ENABLE_FAKE_STEPWELL') , 
 	('BUILDING_FILM_STUDIO',			'QUO_AMERICA_ENABLE_FAKE_ZIGGURAT') , 
 	('BUILDING_FILM_STUDIO',			'QUO_AMERICA_ENABLE_FAKE_KURGAN') , 
 	('BUILDING_FILM_STUDIO',			'QUO_AMERICA_ENABLE_FAKE_COLOSSAL_HEAD') ;








-- EGYPT


-- Give Cleo extra maximum Traders
-- Removed in later versions of the modifier

/* INSERT INTO Modifiers
	(ModifierID, 			ModifierType, 					RunOnce, 	Permanent, 	OwnerRequirementSetId, 	SubjectRequirementSetId)
VALUES	('QUO_EGYPT_EXTRA_TRADERS', 	'MODIFIER_PLAYER_ADJUST_TRADE_ROUTE_CAPACITY', 	0, 		0, 		NULL,			NULL) ;


INSERT INTO ModifierArguments
	(ModifierID,			Name,		Type, 				Value,			Extra)
VALUES	('QUO_EGYPT_EXTRA_TRADERS', 	'Amount', 	'ARGTYPE_IDENTITY', 		'2',			NULL) ;


INSERT INTO TraitModifiers
	(TraitType, 				ModifierID)
VALUES	('TRAIT_LEADER_MEDITERRANEAN',	'QUO_EGYPT_EXTRA_TRADERS') ;
 */
 
 
UPDATE tblQuoDebug SET Message = 'EGYPT 1' WHERE DebugId='Quo_Civ_Code' ;

		
		
-- SPHINX
		
-- Make the Sphinx provide adjacencies for Holy and Theater districts
-- in v3.11.1 removed this in favor of a change to adjacent desert tiles
/* INSERT INTO Adjacency_YieldChanges 
	(ID,				Description,				YieldType,		YieldChange,	TilesRequired,	OtherDistrictAdjacent,	AdjacentSeaResource,	AdjacentTerrain,	AdjacentFeature,	AdjacentRiver,	AdjacentWonder,	AdjacentNaturalWonder,	AdjacentImprovement,		AdjacentDistrict,	PrereqCivic,	PrereqTech,	ObsoleteCivic,	ObsoleteTech,	AdjacentResource)
VALUES	('QUO_Sphinx_Cult',		'QUO_LOC_SPHINX_CULT_ADJ',		'YIELD_CULTURE',	1,		1,		0,			0,			NULL,			NULL,			0,		0,		0,			'IMPROVEMENT_SPHINX',		NULL,			NULL,		NULL,		NULL,		NULL,		0) ,
		('QUO_Sphinx_Fai',		'QUO_LOC_SPHINX_FAI_ADJ',		'YIELD_FAITH',		1,		1,		0,			0,			NULL,			NULL,			0,		0,		0,			'IMPROVEMENT_SPHINX',		NULL,			NULL,		NULL,		NULL,		NULL,		0) ;


INSERT INTO District_Adjacencies
	(DistrictType,	YieldChangeId)
VALUES	('DISTRICT_HOLY_SITE', 'QUO_Sphinx_Fai') , 
		('DISTRICT_THEATER', 'QUO_Sphinx_Cult') ;  */

		

-- Sphinx provides culture and faith to nearby desert tiles
-- Note that this is accomplished by adding a modifier to civilizations, not part of the improvement itself

-- Removed in 7.0.10 because Sphinxes were buffed by Firaxis

/* INSERT INTO Requirements
		(RequirementId, 		RequirementType, 	Likeliness,	Inverse, 	Triggered)
VALUES	('QUO_REQ_SPHINX_ADJ_BONUS', 	'REQUIREMENT_PLOT_ADJACENT_IMPROVEMENT_TYPE_MATCHES',	0,0,0) ,
		('QUO_REQ_SPHINX_ADJ_BONUS_HILL', 	'REQUIREMENT_PLOT_ADJACENT_IMPROVEMENT_TYPE_MATCHES',	0,0,0) ,
		('QUO_REQ_SPHINX_NO_FLOODPLAINS', 	'REQUIREMENT_PLOT_FEATURE_TYPE_MATCHES',	0,1,0) ;
		

INSERT INTO RequirementArguments 
		(RequirementId,			Name, 			Type, 			Value, 		Extra, 	SecondExtra)
VALUES 	('QUO_REQ_SPHINX_ADJ_BONUS',	'ImprovementType',		'ARGTYPE_IDENTITY',		'IMPROVEMENT_SPHINX',	NULL,	NULL 	)  ,
		('QUO_REQ_SPHINX_ADJ_BONUS_HILL',	'ImprovementType',		'ARGTYPE_IDENTITY',		'IMPROVEMENT_SPHINX',	NULL,	NULL 	)  ,
		('QUO_REQ_SPHINX_NO_FLOODPLAINS',	'FeatureType',		'ARGTYPE_IDENTITY',		'FEATURE_FLOODPLAINS',	NULL,	NULL 	)  ;

		
INSERT INTO RequirementSets 
		(RequirementSetId, 		RequirementSetType)
VALUES 	('QUO_REQSET_SPHINX_ADJ_BONUS', 	'REQUIREMENTSET_TEST_ALL') ,
		('QUO_REQSET_SPHINX_ADJ_BONUS_HILL', 	'REQUIREMENTSET_TEST_ALL') ;

 INSERT INTO RequirementSetRequirements
	(RequirementSetId,	RequirementId)
VALUES	('QUO_REQSET_SPHINX_ADJ_BONUS', 	'QUO_REQ_SPHINX_ADJ_BONUS') ,
		('QUO_REQSET_SPHINX_ADJ_BONUS', 	'REQUIRES_PLOT_HAS_DESERT') , 
		('QUO_REQSET_SPHINX_ADJ_BONUS', 	'QUO_REQ_SPHINX_NO_FLOODPLAINS') ,
		('QUO_REQSET_SPHINX_ADJ_BONUS_HILL', 	'QUO_REQ_SPHINX_ADJ_BONUS_HILL') ,
		('QUO_REQSET_SPHINX_ADJ_BONUS_HILL', 	'REQUIRES_PLOT_HAS_DESERT_HILLS') ,
		('QUO_REQSET_SPHINX_ADJ_BONUS_HILL', 	'QUO_REQ_SPHINX_NO_FLOODPLAINS') ;
		


		
INSERT INTO Modifiers 
		(ModifierId, ModifierType, RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
VALUES	('QUO_SPHINX_ADJACENCY_FAITH', 'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD', 0, 0, NULL, 'QUO_REQSET_SPHINX_ADJ_BONUS') ,
		('QUO_SPHINX_ADJACENCY_CULTURE', 'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD', 0, 0, NULL, 'QUO_REQSET_SPHINX_ADJ_BONUS') ,
		('QUO_SPHINX_ADJACENCY_FAITH_HILL', 'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD', 0, 0, NULL, 'QUO_REQSET_SPHINX_ADJ_BONUS_HILL') ,
		('QUO_SPHINX_ADJACENCY_CULTURE_HILL', 'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD', 0, 0, NULL, 'QUO_REQSET_SPHINX_ADJ_BONUS_HILL') ,
		
		('QUO_SPHINX_ADJACENCY_FAITH_PLAYER', 	'MODIFIER_PLAYER_CITIES_ATTACH_MODIFIER', 0, 0, NULL, NULL) ,
		('QUO_SPHINX_ADJACENCY_CULTURE_PLAYER', 	'MODIFIER_PLAYER_CITIES_ATTACH_MODIFIER', 0, 0, NULL, NULL) ,
		('QUO_SPHINX_ADJACENCY_FAITH_PLAYER_HILL', 	'MODIFIER_PLAYER_CITIES_ATTACH_MODIFIER', 0, 0, NULL, NULL) ,
		('QUO_SPHINX_ADJACENCY_CULTURE_PLAYER_HILL', 	'MODIFIER_PLAYER_CITIES_ATTACH_MODIFIER', 0, 0, NULL, NULL) ;
 
INSERT INTO ModifierArguments
		(ModifierId, 			Name, 		Type, 			Value, 			Extra, 	SecondExtra)
VALUES	('QUO_SPHINX_ADJACENCY_FAITH', 	'Amount', 	'ARGTYPE_IDENTITY', 	'1',			NULL, 	NULL),
		('QUO_SPHINX_ADJACENCY_FAITH', 	'YieldType', 	'ARGTYPE_IDENTITY', 	'YIELD_FAITH',			NULL, 	NULL) ,
		('QUO_SPHINX_ADJACENCY_FAITH_HILL', 	'Amount', 	'ARGTYPE_IDENTITY', 	'1',			NULL, 	NULL),
		('QUO_SPHINX_ADJACENCY_FAITH_HILL', 	'YieldType', 	'ARGTYPE_IDENTITY', 	'YIELD_FAITH',			NULL, 	NULL) ,
		('QUO_SPHINX_ADJACENCY_FAITH_PLAYER', 	'ModifierId', 	'ARGTYPE_IDENTITY', 	'QUO_SPHINX_ADJACENCY_FAITH',		NULL, 	NULL)  ,
		('QUO_SPHINX_ADJACENCY_FAITH_PLAYER_HILL', 	'ModifierId', 	'ARGTYPE_IDENTITY', 	'QUO_SPHINX_ADJACENCY_FAITH_HILL',		NULL, 	NULL)  ,
		
		('QUO_SPHINX_ADJACENCY_CULTURE', 	'Amount', 	'ARGTYPE_IDENTITY', 	'1',			NULL, 	NULL),
		('QUO_SPHINX_ADJACENCY_CULTURE', 	'YieldType', 	'ARGTYPE_IDENTITY', 	'YIELD_CULTURE',			NULL, 	NULL) ,
		('QUO_SPHINX_ADJACENCY_CULTURE_HILL', 	'Amount', 	'ARGTYPE_IDENTITY', 	'1',			NULL, 	NULL),
		('QUO_SPHINX_ADJACENCY_CULTURE_HILL', 	'YieldType', 	'ARGTYPE_IDENTITY', 	'YIELD_CULTURE',			NULL, 	NULL) ,
		('QUO_SPHINX_ADJACENCY_CULTURE_PLAYER', 	'ModifierId', 	'ARGTYPE_IDENTITY', 	'QUO_SPHINX_ADJACENCY_CULTURE',		NULL, 	NULL)  ,
		('QUO_SPHINX_ADJACENCY_CULTURE_PLAYER_HILL', 	'ModifierId', 	'ARGTYPE_IDENTITY', 	'QUO_SPHINX_ADJACENCY_CULTURE_HILL',		NULL, 	NULL)  ;

-- as of v5.0.4 apply this to all leaders since they can all in theory build a Sphinx
INSERT INTO TraitModifiers
		(TraitType, 			ModifierID)
VALUES	('TRAIT_LEADER_MAJOR_CIV',	'QUO_SPHINX_ADJACENCY_FAITH_PLAYER')  ,
		('TRAIT_LEADER_MAJOR_CIV',	'QUO_SPHINX_ADJACENCY_CULTURE_PLAYER') , 
		('TRAIT_LEADER_MAJOR_CIV',	'QUO_SPHINX_ADJACENCY_FAITH_PLAYER_HILL')  ,
		('TRAIT_LEADER_MAJOR_CIV',	'QUO_SPHINX_ADJACENCY_CULTURE_PLAYER_HILL') ; */
		

-- DEBUG
UPDATE tblQuoDebug SET Message = 'EGYPT 3' WHERE DebugId='Quo_Civ_Code' ;
		
		
-- Bonus wonder production in cities that already have a wonder. This replaces Egypt's trash bonus 
-- to building on rivers, which just ends up destroying the best tiles.

-- start by deleting Egypts preexisting crappy bonus
DELETE FROM TraitModifiers WHERE TraitType = 'TRAIT_CIVILIZATION_ITERU' AND ModifierId='TRAIT_RIVER_FASTER_BUILDTIME_DISTRICT' ;
DELETE FROM TraitModifiers WHERE TraitType = 'TRAIT_CIVILIZATION_ITERU' AND ModifierId='TRAIT_RIVER_FASTER_BUILDTIME_WONDER' ;



-- FREE RELIC WHEN YOU COMPLETE AN ANCIENT OR CLASSICAL WONDER


-- Create a table of ancient and classical wonders
CREATE TABLE tblQuoAncientClassicalWonders AS 
SELECT BuildingType from Buildings
INNER JOIN Civics on Buildings.PrereqCivic = Civics.CivicType
WHERE Buildings.IsWonder =1 AND Civics.EraType IN ('ERA_ANCIENT', 'ERA_CLASSICAL') 

UNION

SELECT BuildingType from Buildings
INNER JOIN Technologies on Buildings.PrereqTech = Technologies.TechnologyType
WHERE Buildings.IsWonder =1 AND Technologies.EraType IN ('ERA_ANCIENT', 'ERA_CLASSICAL')  ;


-- The requirements
INSERT INTO Requirements
	(RequirementId, 		RequirementType, 	Likeliness,	Inverse, 	Triggered)
SELECT	'QUO_REQ_EGYPT_WONDER_' || tblQuoAncientClassicalWonders.BuildingType, 	'REQUIREMENT_CITY_HAS_BUILDING',	0,0,0
FROM tblQuoAncientClassicalWonders ;


INSERT INTO RequirementArguments 
		(RequirementId,			Name, 			Type, 			Value, 				Extra, 	SecondExtra)
SELECT 	'QUO_REQ_EGYPT_WONDER_' || tblQuoAncientClassicalWonders.BuildingType,	'BuildingType',		'ARGTYPE_IDENTITY',	tblQuoAncientClassicalWonders.BuildingType,	NULL,	NULL 	
FROM tblQuoAncientClassicalWonders ;


INSERT INTO RequirementSets 
	(RequirementSetId, 		RequirementSetType)
VALUES 	('QUO_REQSET_EGYPT_CITY_HAS_A_C_WONDER', 	'REQUIREMENTSET_TEST_ANY') ;


INSERT INTO RequirementSetRequirements
	(RequirementSetId,	RequirementId)
SELECT	'QUO_REQSET_EGYPT_CITY_HAS_A_C_WONDER', 	'QUO_REQ_EGYPT_WONDER_' || tblQuoAncientClassicalWonders.BuildingType
FROM tblQuoAncientClassicalWonders ;		




INSERT INTO Requirements
	(RequirementId, 		RequirementType, 	Likeliness,	Inverse, 	Triggered)
VALUES	('QUO_REQ_EGYPT_A_C_WONDER_IS_MET_WRAPPER', 		'REQUIREMENT_REQUIREMENTSET_IS_MET',	0,0,0) ,
		('QUO_REQ_EGYPT_A_C_WONDER_HAS_CIVIC', 		'REQUIREMENT_PLAYER_HAS_CIVIC',	0,0,0) ,
		('QUO_REQ_EGYPT_RELIC_SLOT_UNLOCK_HAS_CIVIC', 		'REQUIREMENT_PLAYER_HAS_CIVIC',	0,0,0) ;


INSERT INTO RequirementArguments 
	(RequirementId,			Name, 			Type, 			Value, 				Extra, 	SecondExtra)
VALUES 	('QUO_REQ_EGYPT_A_C_WONDER_IS_MET_WRAPPER',	'RequirementSetId',		'ARGTYPE_IDENTITY',	'QUO_REQSET_EGYPT_CITY_HAS_A_C_WONDER',	NULL,	NULL 	) ,
		('QUO_REQ_EGYPT_A_C_WONDER_HAS_CIVIC',	'CivicType',		'ARGTYPE_IDENTITY',	'CIVIC_HUMANISM',	NULL,	NULL 	) ,
		('QUO_REQ_EGYPT_RELIC_SLOT_UNLOCK_HAS_CIVIC',	'CivicType',		'ARGTYPE_IDENTITY',	'CIVIC_MEDIEVAL_FAIRES',	NULL,	NULL 	) ;


INSERT INTO RequirementSets 
	(RequirementSetId, 		RequirementSetType)
VALUES 	('QUO_REQSET_EGYPT_A_C_WONDER_IS_MET_WRAPPER', 	'REQUIREMENTSET_TEST_ALL') ,
		('QUO_REQSET_EGYPT_HAS_RELIC_SLOT_UNLOCK', 	'REQUIREMENTSET_TEST_ALL') ;


INSERT INTO RequirementSetRequirements
	(RequirementSetId,	RequirementId)
VALUES	('QUO_REQSET_EGYPT_A_C_WONDER_IS_MET_WRAPPER', 	'QUO_REQ_EGYPT_A_C_WONDER_IS_MET_WRAPPER'),
		('QUO_REQSET_EGYPT_A_C_WONDER_IS_MET_WRAPPER', 	'QUO_REQ_EGYPT_A_C_WONDER_HAS_CIVIC') , 
		('QUO_REQSET_EGYPT_HAS_RELIC_SLOT_UNLOCK', 	'QUO_REQ_EGYPT_RELIC_SLOT_UNLOCK_HAS_CIVIC') ; 






DROP TABLE tblQuoAncientClassicalWonders;
		

-- Modifiers for relic creation. 
INSERT INTO Modifiers 
	(ModifierId, ModifierType, RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
VALUES	('QUO_EGYPT_WONDER_RELIC_PLAYER', 'MODIFIER_PLAYER_CITIES_ATTACH_MODIFIER', 0, 0, NULL, 'QUO_REQSET_EGYPT_A_C_WONDER_IS_MET_WRAPPER') ,
		('QUO_EGYPT_WONDER_RELIC',			'MODIFIER_PLAYER_GRANT_RELIC',	 	1,			1,			NULL, NULL) ;

INSERT INTO ModifierArguments
	(ModifierId, 			Name, 		Type, 			Value, 			Extra, 	SecondExtra)
VALUES	('QUO_EGYPT_WONDER_RELIC_PLAYER', 		'ModifierId', 	'ARGTYPE_IDENTITY', 		'QUO_EGYPT_WONDER_RELIC',			NULL, 	NULL) ,
		('QUO_EGYPT_WONDER_RELIC', 		'Amount', 	'ARGTYPE_IDENTITY', 		'1',			NULL, 	NULL) ;

INSERT INTO TraitModifiers
	(TraitType, 			ModifierID)
VALUES	('TRAIT_LEADER_MEDITERRANEAN',	'QUO_EGYPT_WONDER_RELIC_PLAYER') ; 



-- Give Egypt extra relic slots one civic prior to unlocking their big burst of relics. This is to make sure the game doesnt crash by trying to add relics at the same
-- time we add relic slots.
INSERT INTO Modifiers
		(ModifierId,											ModifierType,												Permanent,	RunOnce,	OwnerRequirementSetId, SubjectRequirementSetId)
VALUES	('QUO_EGYPT_WONDER_RELIC_EXTRA_SLOTS',					'MODIFIER_PLAYER_CITIES_ADJUST_EXTRA_GREAT_WORK_SLOTS',	 	0,			0,			NULL, 'QUO_REQSET_EGYPT_HAS_RELIC_SLOT_UNLOCK');


INSERT INTO ModifierArguments
		(ModifierId,											Name,						Value)
VALUES	('QUO_EGYPT_WONDER_RELIC_EXTRA_SLOTS',					'GreatWorkSlotType',		'GREATWORKSLOT_RELIC'),
		('QUO_EGYPT_WONDER_RELIC_EXTRA_SLOTS',					'BuildingType',				'BUILDING_PALACE'),
		('QUO_EGYPT_WONDER_RELIC_EXTRA_SLOTS',					'Amount',					4);

INSERT INTO TraitModifiers
	(TraitType, 			ModifierID)
VALUES	('TRAIT_LEADER_MEDITERRANEAN',	'QUO_EGYPT_WONDER_RELIC_EXTRA_SLOTS') ; 



-- BONUS PRODUCTION IN CITIES WITH A WONDER

INSERT INTO Requirements
	(RequirementId, 		RequirementType, 	Likeliness,	Inverse, 	Triggered)
SELECT	'QUO_REQ_EGYPT_WONDER_ANY_' || Buildings.BuildingType, 	'REQUIREMENT_CITY_HAS_BUILDING',	0,0,0
FROM Buildings WHERE Buildings.IsWonder =1  ;


INSERT INTO RequirementArguments 
		(RequirementId,			Name, 			Type, 			Value, 				Extra, 	SecondExtra)
SELECT 	'QUO_REQ_EGYPT_WONDER_ANY_' || Buildings.BuildingType,	'BuildingType',		'ARGTYPE_IDENTITY',	Buildings.BuildingType,	NULL,	NULL 	
FROM Buildings WHERE Buildings.IsWonder =1  ;


INSERT INTO RequirementSets 
	(RequirementSetId, 		RequirementSetType)
VALUES 	('QUO_REQSET_EGYPT_CITY_HAS_ANY_WONDER', 	'REQUIREMENTSET_TEST_ANY') ;


INSERT INTO RequirementSetRequirements
		(RequirementSetId,	RequirementId)
SELECT	'QUO_REQSET_EGYPT_CITY_HAS_ANY_WONDER', 	'QUO_REQ_EGYPT_WONDER_ANY_' || Buildings.BuildingType	
FROM Buildings WHERE Buildings.IsWonder =1  ;


		
-- bonus wonder speed
INSERT INTO Modifiers
	(ModifierID, 			ModifierType, 					RunOnce, 	Permanent, 	OwnerRequirementSetId, 	SubjectRequirementSetId)
VALUES	('QUO_EGYPT_WONDER_SPEED', 	'MODIFIER_PLAYER_CITIES_ADJUST_WONDER_PRODUCTION', 	0, 		0, 		NULL,			'QUO_REQSET_EGYPT_CITY_HAS_ANY_WONDER') ;

INSERT INTO ModifierArguments
	(ModifierID,			Name,		Type, 				Value,			Extra)
VALUES	('QUO_EGYPT_WONDER_SPEED', 	'Amount', 	'ARGTYPE_IDENTITY', 		'20',			NULL) ;


INSERT INTO TraitModifiers
	(TraitType, 				ModifierID)
VALUES	('TRAIT_CIVILIZATION_ITERU',	'QUO_EGYPT_WONDER_SPEED') ;		
		
-- bonus district speed
INSERT INTO Modifiers
		(ModifierID, 			ModifierType, 					RunOnce, 	Permanent, 	OwnerRequirementSetId, 	SubjectRequirementSetId)
SELECT	'QUO_EGYPT_SPEED_' || Districts.DistrictType, 	'MODIFIER_PLAYER_CITIES_ADJUST_DISTRICT_PRODUCTION', 	0, 		0, 		NULL,			'QUO_REQSET_EGYPT_CITY_HAS_ANY_WONDER' 
FROM Districts WHERE CityCenter=0 AND TraitType IS NULL AND DistrictType != 'DISTRICT_WONDER' ;
		
INSERT INTO ModifierArguments
	(ModifierID,			Name,		Type, 				Value,			Extra)
SELECT	'QUO_EGYPT_SPEED_' || Districts.DistrictType, 	'Amount', 	'ARGTYPE_IDENTITY', 		'20',			NULL
FROM Districts WHERE CityCenter=0 AND TraitType IS NULL AND DistrictType != 'DISTRICT_WONDER' ;

INSERT INTO ModifierArguments
	(ModifierID,			Name,		Type, 				Value,			Extra)
SELECT	'QUO_EGYPT_SPEED_' || Districts.DistrictType, 	'DistrictType', 	'ARGTYPE_IDENTITY', 		Districts.DistrictType,			NULL
FROM Districts WHERE CityCenter=0 AND TraitType IS NULL AND DistrictType != 'DISTRICT_WONDER' ;


INSERT INTO TraitModifiers
	(TraitType, 				ModifierID)
SELECT	'TRAIT_CIVILIZATION_ITERU',	'QUO_EGYPT_SPEED_' || Districts.DistrictType
FROM Districts WHERE CityCenter=0 AND TraitType IS NULL AND DistrictType != 'DISTRICT_WONDER' ;







-- DEBUG
UPDATE tblQuoDebug SET Message = 'EGYPT 4' WHERE DebugId='Quo_Civ_Code' ;


-- Very sloppy naming conventions below due to multiple attempts to balance this ability. Perhaps clean up in future edit.


-- Note that below we define a required technology type to unlock this ability, but it is not actually applied. Left code in place
-- in case is useful in future. Instead this ability is unlocked by constructing a wonder in the city.
/* INSERT INTO Requirements
		(RequirementId, 		RequirementType, 	Likeliness,	Inverse, 	Triggered)
VALUES	--('QUO_REQ_EGYPT_CITY_CENTER_ON_RIVER', 	'REQUIREMENT_PLOT_ADJACENT_DISTRICT_TYPE_MATCHES',	0,0,0) ,
		('QUO_REQ_EGYPT_TECH_NEEDED', 	'REQUIREMENT_PLAYER_HAS_TECHNOLOGY',	0,0,0) ;


INSERT INTO RequirementArguments 
		(RequirementId,			Name, 			Type, 			Value, 				Extra, 	SecondExtra)
VALUES 	--('QUO_REQ_EGYPT_CITY_CENTER_ON_RIVER',	'DistrictType',		'ARGTYPE_IDENTITY',	'DISTRICT_CITY_CENTER',	NULL,	NULL 	)  ,
		('QUO_REQ_EGYPT_TECH_NEEDED',	'TechnologyType',		'ARGTYPE_IDENTITY',	'TECH_MATHEMATICS',	NULL,	NULL 	)  ;

INSERT INTO RequirementSets 
	(RequirementSetId, 		RequirementSetType)
VALUES 	('QUO_REQSET_EGYPT_CITY_CENTER_ON_RIVER', 	'REQUIREMENTSET_TEST_ALL') ,
		('QUO_REQSET_EGYPT_TECH_NEEDED', 	'REQUIREMENTSET_TEST_ALL') ;

INSERT INTO RequirementSetRequirements
		(RequirementSetId,	RequirementId)
VALUES	('QUO_REQSET_EGYPT_CITY_CENTER_ON_RIVER', 	'REQUIRES_PLOT_HAS_FARM') ,
		('QUO_REQSET_EGYPT_CITY_CENTER_ON_RIVER', 	'REQUIRES_PLOT_ADJACENT_TO_RIVER') ,
		('QUO_REQSET_EGYPT_TECH_NEEDED', 	'QUO_REQ_EGYPT_TECH_NEEDED') ; */
/* 
INSERT INTO Modifiers 
		(ModifierId, ModifierType, RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
VALUES	('QUO_EGYPT_RIVER_CULTURE', 'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD', 0, 0, NULL, 'QUO_REQSET_EGYPT_CITY_CENTER_ON_RIVER') ,
		('QUO_EGYPT_RIVER_CULTURE_PLAYER', 	'MODIFIER_PLAYER_CITIES_ATTACH_MODIFIER', 0, 0, NULL, 'QUO_REQSET_EGYPT_CITY_HAS_A_C_WONDER') ;


INSERT INTO ModifierArguments
		(ModifierId, 			Name, 		Type, 			Value, 			Extra, 	SecondExtra)
VALUES	('QUO_EGYPT_RIVER_CULTURE', 	'Amount', 	'ARGTYPE_IDENTITY', 		'1',			NULL, 	NULL) ,
		('QUO_EGYPT_RIVER_CULTURE', 	'YieldType', 	'ARGTYPE_IDENTITY', 	'YIELD_PRODUCTION',			NULL, 	NULL) ,
		('QUO_EGYPT_RIVER_CULTURE_PLAYER', 	'ModifierId', 	'ARGTYPE_IDENTITY', 	'QUO_EGYPT_RIVER_CULTURE',		NULL, 	NULL)  ;


INSERT INTO TraitModifiers
		(TraitType, 			ModifierID)
VALUES	('TRAIT_LEADER_MEDITERRANEAN',	'QUO_EGYPT_RIVER_CULTURE_PLAYER') ;
 */


-- DEBUG
UPDATE tblQuoDebug SET Message = 'EGYPT 5' WHERE DebugId='Quo_Civ_Code' ;


	
	
-- Lower cost of Chariot Archer
UPDATE Units SET Cost='80' WHERE UnitType='UNIT_EGYPTIAN_CHARIOT_ARCHER' ;


-- Update the Chariot Archer so that it can move and attack, like a Cossack

INSERT INTO Tags 
	(Tag, 				Vocabulary)
VALUES 	('QUO_CLASS_EGYPT_CHARIOT',	'ABILITY_CLASS'	) ;


INSERT INTO TypeTags
	(Type,					Tag)
VALUES	('UNIT_EGYPTIAN_CHARIOT_ARCHER', 	'QUO_CLASS_EGYPT_CHARIOT') ;


INSERT INTO TypeTags
	(Type,					Tag)
VALUES	('ABILITY_COSSACK', 			'QUO_CLASS_EGYPT_CHARIOT') ;


-- Lower its attack power because otherwise it is way too strong
UPDATE Units SET Combat='15', RangedCombat='26' WHERE UnitType='UNIT_EGYPTIAN_CHARIOT_ARCHER' ;





-- FRANCE

UPDATE tblQuoDebug SET Message = 'FRANCE' WHERE DebugId='Quo_Civ_Code' ;

-- No longer unlock the Chateau early. It is plenty strong now and no longer needs this buff.

-- CHATEAU: Change pre-req civic to Drama and Poetry. +1 Housing. Tourism bonus now unlocks with Humanism.
-- UPDATE Improvements SET PrereqCivic='CIVIC_DRAMA_POETRY', Housing='1' WHERE ImprovementType='IMPROVEMENT_CHATEAU' ;


-- UPDATE Improvement_Tourism SET PREREQTECH=NULL, PREREQCIVIC='CIVIC_HUMANISM' WHERE ImprovementType='IMPROVEMENT_CHATEAU' ;


-- Update the tech that unlocks Spies
-- UPDATE RequirementArguments SET Value='TECH_ASTROLOGY' WHERE RequirementId='REQUIRES_TECHNOLOGY_CASTLES' AND Name='TechnologyType' ;




-- Make the Chateau a Culture Bomb

INSERT INTO Modifiers
	(ModifierID, 			ModifierType, 					RunOnce, 	Permanent, 	OwnerRequirementSetId, 	SubjectRequirementSetId)
VALUES	('QUO_CHATEAU_CULTURE_BOMB', 	'MODIFIER_PLAYER_ADD_CULTURE_BOMB_TRIGGER', 	0, 		0, 		NULL,			NULL) ;


INSERT INTO ModifierArguments
	(ModifierID,			Name,			Type, 			Value,			Extra)
VALUES	('QUO_CHATEAU_CULTURE_BOMB', 	'ImprovementType', 	'ARGTYPE_IDENTITY', 	'IMPROVEMENT_CHATEAU',	NULL) ;


INSERT INTO TraitModifiers
	(TraitType, 				ModifierID)
VALUES	('TRAIT_LEADER_MAJOR_CIV',		'QUO_CHATEAU_CULTURE_BOMB') ;



-- Lower cost of spies

-- Removed for Rise and Fall since Cathy is already buffed in other ways
/* INSERT INTO Modifiers 
	(ModifierId, ModifierType, RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
VALUES	('QUO_FRANCE_CHEAP_SPY', 'MODIFIER_PLAYER_CITIES_ADJUST_UNIT_PRODUCTION', 0, 0, NULL, NULL) ;


INSERT INTO ModifierArguments
	(ModifierId, 			Name, 		Type, 			Value, 			Extra, 	SecondExtra)
VALUES	('QUO_FRANCE_CHEAP_SPY', 	'Amount', 	'ARGTYPE_IDENTITY', 	'100',			NULL, 	NULL) , 
	('QUO_FRANCE_CHEAP_SPY', 	'UnitType', 	'ARGTYPE_IDENTITY', 	'UNIT_SPY',	NULL, 	NULL) ;


INSERT INTO TraitModifiers
	(TraitType, 			ModifierID)
VALUES	('FLYING_SQUADRON_TRAIT',	'QUO_FRANCE_CHEAP_SPY') ; */




-- SPAIN

UPDATE tblQuoDebug SET Message = 'SPAIN' WHERE DebugId='Quo_Civ_Code' ;


-- MISSION: Make this unlock earlier. Now buildable on forest or jungle. Science bonus now starts at 1 and improves by 1 at the respective tech

-- Back to its original unlock position as of v3.11.08
--UPDATE Improvements SET PrereqCivic='CIVIC_THEOLOGY' WHERE ImprovementType='IMPROVEMENT_MISSION' ;


-- removed in v6.0.6
--UPDATE Improvement_BonusYieldChanges SET BonusYieldChange='1' WHERE ImprovementType='IMPROVEMENT_MISSION' AND YieldType='YIELD_SCIENCE' ;
--UPDATE Improvement_YieldChanges SET YieldChange='1' WHERE ImprovementType='IMPROVEMENT_MISSION' AND YieldType = 'YIELD_SCIENCE' ;


-- Removed in v7.0.6
/* INSERT INTO Improvement_ValidFeatures
	(	ImprovementType, 	FeatureType)  	
VALUES	(	'IMPROVEMENT_MISSION', 	'FEATURE_FOREST') ,
	(	'IMPROVEMENT_MISSION',	'FEATURE_JUNGLE') ;
 */

-- Give Spain a discount on Holy districts
-- Removed in v3.13.4 in favor of giving Spain something more violent
/* INSERT INTO TraitModifiers
	(TraitType, 			ModifierID)
VALUES	('TRAIT_LEADER_EL_ESCORIAL',	'TRAIT_BOOST_HOLY_SITE_PRODUCTION') ; */


-- Free great prophet points for each kill
INSERT INTO Modifiers 
	(ModifierId, ModifierType, RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
VALUES	('QUO_SPAIN_GPP_UNIT', 'MODIFIER_PLAYER_UNIT_ADJUST_GREAT_PEOPLE_POINTS_PER_KILL', 0, 0, NULL, NULL) ,
		('QUO_SPAIN_GPP_PLAYER', 'MODIFIER_PLAYER_UNITS_ATTACH_MODIFIER', 0, 0, NULL, NULL) ;

INSERT INTO ModifierArguments
	(ModifierId, 			Name, 		Type, 			Value, 			Extra, 	SecondExtra)
VALUES	('QUO_SPAIN_GPP_UNIT', 	'Amount', 	'ARGTYPE_IDENTITY', 	'4',			NULL, 	NULL) ,
		('QUO_SPAIN_GPP_UNIT', 	'GreatPersonClassType', 	'ARGTYPE_IDENTITY', 	'GREAT_PERSON_CLASS_PROPHET',			NULL, 	NULL) ,
		('QUO_SPAIN_GPP_PLAYER', 	'ModifierId', 	'ARGTYPE_IDENTITY', 	'QUO_SPAIN_GPP_UNIT',			NULL, 	NULL) ;

INSERT INTO TraitModifiers
	(TraitType, 			ModifierID)
VALUES	('TRAIT_LEADER_EL_ESCORIAL',	'QUO_SPAIN_GPP_PLAYER') ;










-- Cities of Gold
-- Give an adjacency bonus for Commercial Zones next to Natural Wonders
-- We don't know what Natural Wonders the player may have installed from DLC, so we have to scan the database and dynamically add them
-- Each modifier will receive a concat name based on its Feature type, e.g. QUO_SPAIN_ADJACENCY_COM_FEATURE_BARRIER_REEF



INSERT INTO Modifiers
	(ModifierID, 			ModifierType, 					RunOnce, 	Permanent, 	OwnerRequirementSetId, 	SubjectRequirementSetId)
SELECT	'QUO_SPAIN_ADJACENCY_COM_' || FeatureType, 	            'MODIFIER_PLAYER_CITIES_FEATURE_ADJACENCY', 	0, 		0, 		NULL,			NULL
	FROM Features WHERE Features.NaturalWonder=1 ;


INSERT INTO ModifierArguments
	(ModifierId, 						Name, 		Type, 			Value, 			Extra, 	SecondExtra)
SELECT	'QUO_SPAIN_ADJACENCY_COM_' || FeatureType, 		'Amount', 	'ARGTYPE_IDENTITY', 	'7',			NULL, 	NULL
	FROM Features WHERE Features.NaturalWonder=1 ;


INSERT INTO ModifierArguments
	(ModifierId, 						Name, 		Type, 			Value, 			Extra, 	SecondExtra)
SELECT	'QUO_SPAIN_ADJACENCY_COM_' || FeatureType, 		'Description', 	'ARGTYPE_IDENTITY', 	'QUO_LOC_SPAIN_ADJACENCY_COM',			NULL, 	NULL
	FROM Features WHERE Features.NaturalWonder=1 ;


INSERT INTO ModifierArguments
	(ModifierId, 						Name, 		Type, 			Value, 			Extra, 	SecondExtra)
SELECT	'QUO_SPAIN_ADJACENCY_COM_' || FeatureType, 		'DistrictType', 	'ARGTYPE_IDENTITY', 	'DISTRICT_COMMERCIAL_HUB',		NULL, 	NULL
	FROM Features WHERE Features.NaturalWonder=1 ;


INSERT INTO ModifierArguments
	(ModifierId, 						Name, 		Type, 			Value, 			Extra, 	SecondExtra)
SELECT	'QUO_SPAIN_ADJACENCY_COM_' || FeatureType, 		'FeatureType', 	'ARGTYPE_IDENTITY', 	Features.FeatureType,		NULL, 	NULL
	FROM Features WHERE Features.NaturalWonder=1 ;


INSERT INTO ModifierArguments
	(ModifierId, 						Name, 		Type, 			Value, 			Extra, 	SecondExtra)
SELECT	'QUO_SPAIN_ADJACENCY_COM_' || FeatureType, 		'YieldType', 	'ARGTYPE_IDENTITY', 	'YIELD_GOLD',		NULL, 	NULL
	FROM Features WHERE Features.NaturalWonder=1 ;


INSERT INTO TraitModifiers
	(TraitType, 			ModifierID)
SELECT  'TRAIT_CIVILIZATION_TREASURE_FLEET', 'QUO_SPAIN_ADJACENCY_COM_' || FeatureType
	FROM Features WHERE Features.NaturalWonder=1 ;


	
-- +1 movement for Siege units near enemy religious cities
-- Removed in R&F
/* INSERT INTO Requirements
	(RequirementId, 		RequirementType, 	Likeliness,	Inverse, 	Triggered)
VALUES	('QUO_REQ_SPAIN_FOUNDED_RELIGION', 		'REQUIREMENT_NEAR_RELIGIOUS_CITY',	0,0,0) ,
		('QUO_REQ_SPAIN_UNIT_NEAR_ENEMY_RELIGIOUS_CITY', 		'REQUIREMENT_PLAYER_IS_RELIGION_FOUNDER',	0,0,0) ;


INSERT INTO RequirementArguments 
	(RequirementId,			Name, 			Type, 			Value, 				Extra, 	SecondExtra)
VALUES 	('QUO_REQ_SPAIN_UNIT_NEAR_ENEMY_RELIGIOUS_CITY',	'FriendlyCity',		'ARGTYPE_IDENTITY',	'0',	NULL,	NULL 	) ;


INSERT INTO RequirementSets 
	(RequirementSetId, 		RequirementSetType)
VALUES 	('QUO_REQSET_SPAIN_MOVEMENT', 	'REQUIREMENTSET_TEST_ALL') ;


INSERT INTO RequirementSetRequirements
	(RequirementSetId,	RequirementId)
VALUES	('QUO_REQSET_SPAIN_MOVEMENT', 	'QUO_REQ_SPAIN_FOUNDED_RELIGION'),
		('QUO_REQSET_SPAIN_MOVEMENT', 	'QUO_REQ_SPAIN_UNIT_NEAR_ENEMY_RELIGIOUS_CITY')  , 
		('QUO_REQSET_SPAIN_MOVEMENT', 	'REQUIREMENT_UNIT_IS_SIEGE')  ;


INSERT INTO Modifiers 
	(ModifierId, 	ModifierType, 	RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
VALUES	('QUO_SPAIN_SPEED_UP', 	'MODIFIER_PLAYER_UNIT_ADJUST_MOVEMENT', 0, 0, NULL, NULL) ,
		('QUO_SPAIN_SPEED_UP_GLOBAL', 	'MODIFIER_PLAYER_UNITS_ATTACH_MODIFIER', 0, 0, NULL, 'QUO_REQSET_SPAIN_MOVEMENT') ;


INSERT INTO ModifierArguments
	(ModifierId, 			Name, 		Type, 			Value, 					Extra, 	SecondExtra)
VALUES	('QUO_SPAIN_SPEED_UP', 	'Amount', 	'ARGTYPE_IDENTITY', 	'1',					NULL, 	NULL) ,	
		('QUO_SPAIN_SPEED_UP_GLOBAL', 	'ModifierId', 	'ARGTYPE_IDENTITY', 	'QUO_SPAIN_SPEED_UP',		NULL, 	NULL)  ;


INSERT INTO TraitModifiers
		(TraitType, 		ModifierId)
VALUES ('TRAIT_LEADER_EL_ESCORIAL',	'QUO_SPAIN_SPEED_UP_GLOBAL') ; */


-- Give Spain a huge chunk of Gold when they build a Commercial zone next to a Natural Wonder


-- Create a requirement for each natural wonder. If any of these natural wonders is adjacent, trigger the bonus.
-- I loved this feature, but pulled it from the mod because of the overhead in performance

/* INSERT INTO Requirements
	(RequirementId, 		RequirementType, 	Likeliness,	Inverse, 	Triggered)
SELECT	'QUO_REQ_SPAIN_ADJACENT_' || Features.FeatureType, 	'REQUIREMENT_PLOT_ADJACENT_FEATURE_TYPE_MATCHES',	0,0,0
FROM Features WHERE Features.NaturalWonder=1 ;


INSERT INTO RequirementArguments 
		(RequirementId,			Name, 			Type, 			Value, 				Extra, 	SecondExtra)
SELECT 	'QUO_REQ_SPAIN_ADJACENT_' || Features.FeatureType,	'FeatureType',		'ARGTYPE_IDENTITY',	Features.FeatureType,	NULL,	NULL 	
FROM Features WHERE Features.NaturalWonder=1 ;


INSERT INTO RequirementSets 
	(RequirementSetId, 		RequirementSetType)
VALUES 	('QUO_REQSET_SPAIN_ADJACENCIES', 	'REQUIREMENTSET_TEST_ANY') ;


INSERT INTO RequirementSetRequirements
	(RequirementSetId,	RequirementId)
SELECT	'QUO_REQSET_SPAIN_ADJACENCIES', 	'QUO_REQ_SPAIN_ADJACENT_' || Features.FeatureType
FROM Features WHERE Features.NaturalWonder=1 ;		


-- Create a wrapper for above requirement set and tie everything together.
INSERT INTO Requirements
	(RequirementId, 		RequirementType, 	Likeliness,	Inverse, 	Triggered)
VALUES	('QUO_REQ_SPAIN_COMM_ZONE', 	'REQUIREMENT_PLOT_DISTRICT_TYPE_MATCHES',	0,0,0) ,
		('QUO_REQ_SPAIN_ADJACENCIES_IS_MET_WRAPPER', 		'REQUIREMENT_REQUIREMENTSET_IS_MET',	0,0,0) ,
		('QUO_REQ_SPAIN_IS_ERA_CLASSICAL', 		'REQUIREMENT_PLAYER_ERA_AT_LEAST',	0,0,0) ,
		('QUO_REQ_SPAIN_IS_ERA_RENAISSANCE', 		'REQUIREMENT_PLAYER_ERA_AT_LEAST',	0,0,0) ,
		('QUO_REQ_SPAIN_IS_ERA_MODERN', 		'REQUIREMENT_PLAYER_ERA_AT_LEAST',	0,0,0) ,
		('QUO_REQ_SPAIN_IS_ERA_INFORMATION', 		'REQUIREMENT_PLAYER_ERA_AT_LEAST',	0,0,0) ;
				
				

INSERT INTO RequirementArguments 
	(RequirementId,			Name, 			Type, 			Value, 				Extra, 	SecondExtra)
VALUES 	('QUO_REQ_SPAIN_COMM_ZONE',	'DistrictType',		'ARGTYPE_IDENTITY',	'DISTRICT_COMMERCIAL_HUB',	NULL,	NULL 	) ,
		('QUO_REQ_SPAIN_ADJACENCIES_IS_MET_WRAPPER',	'RequirementSetId',		'ARGTYPE_IDENTITY',	'QUO_REQSET_SPAIN_ADJACENCIES',	NULL,	NULL 	) ,
		('QUO_REQ_SPAIN_IS_ERA_CLASSICAL',	'EraType',		'ARGTYPE_IDENTITY',	'ERA_CLASSICAL',	NULL,	NULL 	) ,
		('QUO_REQ_SPAIN_IS_ERA_RENAISSANCE',	'EraType',		'ARGTYPE_IDENTITY',	'ERA_RENAISSANCE',	NULL,	NULL 	) ,
		('QUO_REQ_SPAIN_IS_ERA_MODERN',	'EraType',		'ARGTYPE_IDENTITY',	'ERA_MODERN',	NULL,	NULL 	) ,
		('QUO_REQ_SPAIN_IS_ERA_INFORMATION',	'EraType',		'ARGTYPE_IDENTITY',	'ERA_INFORMATION',	NULL,	NULL 	) ;


INSERT INTO RequirementSets 
	(RequirementSetId, 		RequirementSetType)
VALUES 	('QUO_REQSET_SPAIN_COMM_ZONE_ADJ_CLASSICAL', 	'REQUIREMENTSET_TEST_ALL') ,
		('QUO_REQSET_SPAIN_COMM_ZONE_ADJ_RENAISSANCE', 	'REQUIREMENTSET_TEST_ALL') ,
		('QUO_REQSET_SPAIN_COMM_ZONE_ADJ_MODERN', 	'REQUIREMENTSET_TEST_ALL') ,
		('QUO_REQSET_SPAIN_COMM_ZONE_ADJ_INFORMATION', 	'REQUIREMENTSET_TEST_ALL') ;
	
INSERT INTO RequirementSetRequirements
	(RequirementSetId,	RequirementId)
VALUES	('QUO_REQSET_SPAIN_COMM_ZONE_ADJ_CLASSICAL', 	'QUO_REQ_SPAIN_COMM_ZONE') ,
		('QUO_REQSET_SPAIN_COMM_ZONE_ADJ_CLASSICAL', 	'QUO_REQ_SPAIN_ADJACENCIES_IS_MET_WRAPPER') ,
		('QUO_REQSET_SPAIN_COMM_ZONE_ADJ_CLASSICAL', 	'QUO_REQ_SPAIN_IS_ERA_CLASSICAL') ,
		('QUO_REQSET_SPAIN_COMM_ZONE_ADJ_RENAISSANCE', 	'QUO_REQ_SPAIN_COMM_ZONE') ,
		('QUO_REQSET_SPAIN_COMM_ZONE_ADJ_RENAISSANCE', 	'QUO_REQ_SPAIN_ADJACENCIES_IS_MET_WRAPPER') ,
		('QUO_REQSET_SPAIN_COMM_ZONE_ADJ_RENAISSANCE', 	'QUO_REQ_SPAIN_IS_ERA_RENAISSANCE') ,
		('QUO_REQSET_SPAIN_COMM_ZONE_ADJ_MODERN', 	'QUO_REQ_SPAIN_COMM_ZONE') ,
		('QUO_REQSET_SPAIN_COMM_ZONE_ADJ_MODERN', 	'QUO_REQ_SPAIN_ADJACENCIES_IS_MET_WRAPPER') ,
		('QUO_REQSET_SPAIN_COMM_ZONE_ADJ_MODERN', 	'QUO_REQ_SPAIN_IS_ERA_MODERN') ,
		('QUO_REQSET_SPAIN_COMM_ZONE_ADJ_INFORMATION', 	'QUO_REQ_SPAIN_COMM_ZONE') ,
		('QUO_REQSET_SPAIN_COMM_ZONE_ADJ_INFORMATION', 	'QUO_REQ_SPAIN_ADJACENCIES_IS_MET_WRAPPER') ,
		('QUO_REQSET_SPAIN_COMM_ZONE_ADJ_INFORMATION', 	'QUO_REQ_SPAIN_IS_ERA_INFORMATION') ;



-- Attach the modifier to the player and then to all cities. 
-- Note that this ability uses QUO_MODIFIER_PLAYER_DISTRICTS_ATTACH_MODIFIER which is defined in setup files.
INSERT INTO Modifiers 
	(ModifierId, ModifierType, RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
VALUES	('QUO_SPAIN_GOLD_EXPLOSION_PLAYER_1', 'QUO_MODIFIER_PLAYER_DISTRICTS_ATTACH_MODIFIER', 0, 0, NULL, 'QUO_REQSET_SPAIN_COMM_ZONE_ADJ_CLASSICAL') ,
		('QUO_SPAIN_GOLD_EXPLOSION_1',			'MODIFIER_PLAYER_GRANT_YIELD',	 	1,			1,			NULL,NULL) ,
		('QUO_SPAIN_GOLD_EXPLOSION_PLAYER_2', 'QUO_MODIFIER_PLAYER_DISTRICTS_ATTACH_MODIFIER', 0, 0, NULL, 'QUO_REQSET_SPAIN_COMM_ZONE_ADJ_RENAISSANCE') ,
		('QUO_SPAIN_GOLD_EXPLOSION_2',			'MODIFIER_PLAYER_GRANT_YIELD',	 	1,			1,			NULL,NULL) ,
		('QUO_SPAIN_GOLD_EXPLOSION_PLAYER_3', 'QUO_MODIFIER_PLAYER_DISTRICTS_ATTACH_MODIFIER', 0, 0, NULL, 'QUO_REQSET_SPAIN_COMM_ZONE_ADJ_MODERN') ,
		('QUO_SPAIN_GOLD_EXPLOSION_3',			'MODIFIER_PLAYER_GRANT_YIELD',	 	1,			1,			NULL,NULL) ,
		('QUO_SPAIN_GOLD_EXPLOSION_PLAYER_4', 'QUO_MODIFIER_PLAYER_DISTRICTS_ATTACH_MODIFIER', 0, 0, NULL, 'QUO_REQSET_SPAIN_COMM_ZONE_ADJ_INFORMATION') ,
		('QUO_SPAIN_GOLD_EXPLOSION_4',			'MODIFIER_PLAYER_GRANT_YIELD',	 	1,			1,			NULL,NULL) ;

INSERT INTO ModifierArguments
	(ModifierId, 			Name, 		Type, 			Value, 			Extra, 	SecondExtra)
VALUES	('QUO_SPAIN_GOLD_EXPLOSION_PLAYER_1', 		'ModifierId', 	'ARGTYPE_IDENTITY', 		'QUO_SPAIN_GOLD_EXPLOSION_1',			NULL, 	NULL) ,
		('QUO_SPAIN_GOLD_EXPLOSION_1', 		'Amount', 	'ScaleByGameSpeed', 		'200',			NULL, 	NULL) ,
		('QUO_SPAIN_GOLD_EXPLOSION_1', 		'YieldType', 	'ARGTYPE_IDENTITY', 		'YIELD_GOLD',			NULL, 	NULL) ,
		('QUO_SPAIN_GOLD_EXPLOSION_PLAYER_2', 		'ModifierId', 	'ARGTYPE_IDENTITY', 		'QUO_SPAIN_GOLD_EXPLOSION_2',			NULL, 	NULL) ,
		('QUO_SPAIN_GOLD_EXPLOSION_2', 		'Amount', 	'ScaleByGameSpeed', 		'400',			NULL, 	NULL) ,
		('QUO_SPAIN_GOLD_EXPLOSION_2', 		'YieldType', 	'ARGTYPE_IDENTITY', 		'YIELD_GOLD',			NULL, 	NULL) ,
		('QUO_SPAIN_GOLD_EXPLOSION_PLAYER_3', 		'ModifierId', 	'ARGTYPE_IDENTITY', 		'QUO_SPAIN_GOLD_EXPLOSION_3',			NULL, 	NULL) ,
		('QUO_SPAIN_GOLD_EXPLOSION_3', 		'Amount', 	'ScaleByGameSpeed', 		'600',			NULL, 	NULL) ,
		('QUO_SPAIN_GOLD_EXPLOSION_3', 		'YieldType', 	'ARGTYPE_IDENTITY', 		'YIELD_GOLD',			NULL, 	NULL) ,
		('QUO_SPAIN_GOLD_EXPLOSION_PLAYER_4', 		'ModifierId', 	'ARGTYPE_IDENTITY', 		'QUO_SPAIN_GOLD_EXPLOSION_4',			NULL, 	NULL) ,
		('QUO_SPAIN_GOLD_EXPLOSION_4', 		'Amount', 	'ScaleByGameSpeed', 		'800',			NULL, 	NULL) ,
		('QUO_SPAIN_GOLD_EXPLOSION_4', 		'YieldType', 	'ARGTYPE_IDENTITY', 		'YIELD_GOLD',			NULL, 	NULL) ;

INSERT INTO TraitModifiers
	(TraitType, 			ModifierID)
VALUES	('TRAIT_CIVILIZATION_TREASURE_FLEET',	'QUO_SPAIN_GOLD_EXPLOSION_PLAYER_1') ,  
		('TRAIT_CIVILIZATION_TREASURE_FLEET',	'QUO_SPAIN_GOLD_EXPLOSION_PLAYER_2') , 
		('TRAIT_CIVILIZATION_TREASURE_FLEET',	'QUO_SPAIN_GOLD_EXPLOSION_PLAYER_3') , 
		('TRAIT_CIVILIZATION_TREASURE_FLEET',	'QUO_SPAIN_GOLD_EXPLOSION_PLAYER_4') ; */



-- BRAZIL 

UPDATE tblQuoDebug SET Message = 'BRAZIL' WHERE DebugId='Quo_Civ_Code' ;

-- Increase city population by 1 when the Street Carnival is built
-- Enabled in v3.11.8 after numerous implementation attempts

INSERT INTO Types
	(Type, 				Kind)
VALUES 	('QUO_MODTYPE_BRAZIL_FREE_POPULATION',	'KIND_MODIFIER'	) ;

INSERT INTO DynamicModifiers
		(ModifierType, CollectionType, EffectType)
VALUES 	('QUO_MODTYPE_BRAZIL_FREE_POPULATION', 'COLLECTION_OWNER','EFFECT_ADJUST_CITY_POPULATION');

INSERT INTO Modifiers 
	(ModifierId, ModifierType, RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
VALUES	('QUO_BRAZIL_FREE_POPULATION', 'QUO_MODTYPE_BRAZIL_FREE_POPULATION', 1, 1, NULL, NULL) ;


INSERT INTO ModifierArguments
	(ModifierId, 			Name, 		Type, 			Value, 		Extra, 	SecondExtra)
VALUES	('QUO_BRAZIL_FREE_POPULATION', 	'Amount', 	'ARGTYPE_IDENTITY', 	'1',		NULL, 	NULL) ;


INSERT INTO DistrictModifiers
	(DistrictType, 			ModifierID)
VALUES	('DISTRICT_STREET_CARNIVAL',	'QUO_BRAZIL_FREE_POPULATION') ,
		('DISTRICT_WATER_STREET_CARNIVAL',	'QUO_BRAZIL_FREE_POPULATION') ; -- in v3.0.5 added brazils water district as well






-- Each Street Carnival built increases total Growth % by +3
-- Finally removed in v3.11.8, in favor of an immediate free point of population

/* INSERT INTO Modifiers 
	(ModifierId, ModifierType, RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
VALUES	('QUO_CARNIVAL_GROWTH', 'MODIFIER_PLAYER_CITIES_ADJUST_CITY_GROWTH', 0, 0, NULL, NULL) ;


INSERT INTO ModifierArguments
	(ModifierId, 			Name, 			Type, 			Value, 		Extra, 	SecondExtra)
VALUES	('QUO_CARNIVAL_GROWTH', 	'Amount', 		'ARGTYPE_IDENTITY', 	'3',		NULL, 	NULL)  ;


INSERT INTO DistrictModifiers
	(DistrictType, 			ModifierID)
VALUES	('DISTRICT_STREET_CARNIVAL',	'QUO_CARNIVAL_GROWTH')  ; */



-- Brazilwood camp

-- Note that the trait QUO_TRAIT_CAN_BUILD_BRAZILWOOD_CAMP is never directly assigned to Brazil--exists to stop people from building this improvement without the project
INSERT INTO Types 
	(Type, 						Kind)
VALUES 	('QUO_IMPROVEMENT_BRAZILWOOD_CAMP', 		'KIND_IMPROVEMENT') , 
	('QUO_TRAIT_CAN_BUILD_BRAZILWOOD_CAMP', 	'KIND_TRAIT') ;


INSERT INTO Traits 
	(TraitType,				Name,							Description,						InternalOnly)
VALUES ('QUO_TRAIT_CAN_BUILD_BRAZILWOOD_CAMP',	'LOC_QUO_TRAIT_CAN_BUILD_BRAZILWOOD_CAMP',		'LOC_QUO_TRAIT_CAN_BUILD_BRAZILWOOD_CAMP_DESCRIPTION',	0) ;


INSERT INTO Improvements
	(ImprovementType, 			Name, 						Buildable, 	Description, 						PlunderType, 	PlunderAmount, 	Icon, 				TraitType,	Appeal, YieldFromAppeal)
VALUES 	('QUO_IMPROVEMENT_BRAZILWOOD_CAMP',	'QUO_LOC_IMPROVEMENT_BRAZILWOOD_CAMP_NAME',	1,		'QUO_LOC_IMPROVEMENT_BRAZILWOOD_CAMP_DESCRIPTION',	'PLUNDER_GOLD',	'50',		'ICON_IMPROVEMENT_CAMP',	'QUO_TRAIT_CAN_BUILD_BRAZILWOOD_CAMP',		0, 'YIELD_CULTURE') ;


INSERT INTO Improvement_ValidFeatures
	(	ImprovementType, 			FeatureType)  	
VALUES	(	'QUO_IMPROVEMENT_BRAZILWOOD_CAMP',	'FEATURE_JUNGLE') ;


INSERT INTO Improvement_ValidBuildUnits
	(	ImprovementType, 			UnitType)  	
VALUES	(	'QUO_IMPROVEMENT_BRAZILWOOD_CAMP',	'UNIT_BUILDER') ;


-- Yield is now based on appeal of the tile
/* INSERT INTO Improvement_YieldChanges 
	(ImprovementType,			YieldType,		YieldChange)
VALUES  ('QUO_IMPROVEMENT_BRAZILWOOD_CAMP',	'YIELD_GOLD',		'2') ,
		('QUO_IMPROVEMENT_BRAZILWOOD_CAMP',	'YIELD_CULTURE',	'2') ; */

		
INSERT INTO Improvement_Tourism
	(ImprovementType,TourismSource,PrereqCivic,PrereqTech,ScalingFactor)
VALUES ('QUO_IMPROVEMENT_BRAZILWOOD_CAMP', 'TOURISMSOURCE_CULTURE', NULL, 'TECH_FLIGHT', 100); 



-- The Brazilwood project
-- Give access to the Brazilwood improvement 


INSERT INTO Types 
	(Type, 					Kind)
VALUES 	('QUO_PROJECT_BRAZILWOOD', 		'KIND_PROJECT') ;


INSERT INTO Projects
	(ProjectType, 			Name,				ShortName,				Description,					Cost,	PrereqTech,		MaxPlayerInstances,	PrereqDistrict)
VALUES ('QUO_PROJECT_BRAZILWOOD',	'QUO_PROJECT_BRAZILWOOD_NAME',	'QUO_PROJECT_BRAZILWOOD_SHORT_NAME',	'QUO_PROJECT_BRAZILWOOD_DESCRIPTION',		400,	'TECH_PRINTING',	1,			'DISTRICT_STREET_CARNIVAL');


-- provide a huge burst of Great People Points
INSERT INTO Project_GreatPersonPoints (
                                          PointProgressionParam1,
                                          PointProgressionModel,
                                          Points,
                                          GreatPersonClassType,
                                          ProjectType
                                      )
                                      VALUES (
                                          800,
                                          'COST_PROGRESSION_GAME_PROGRESS',
                                          110,
                                          'GREAT_PERSON_CLASS_ENGINEER',
                                          'QUO_PROJECT_BRAZILWOOD'
                                      ),
                                      (
                                          800,
                                          'COST_PROGRESSION_GAME_PROGRESS',
                                          110,
                                          'GREAT_PERSON_CLASS_MERCHANT',
                                          'QUO_PROJECT_BRAZILWOOD'
                                      ),
                                      (
                                          800,
                                          'COST_PROGRESSION_GAME_PROGRESS',
                                          110,
                                          'GREAT_PERSON_CLASS_WRITER',
                                          'QUO_PROJECT_BRAZILWOOD'
                                      ),
                                      (
                                          800,
                                          'COST_PROGRESSION_GAME_PROGRESS',
                                          110,
                                          'GREAT_PERSON_CLASS_ARTIST',
                                          'QUO_PROJECT_BRAZILWOOD'
                                      ),
                                      (
                                          800,
                                          'COST_PROGRESSION_GAME_PROGRESS',
                                          110,
                                          'GREAT_PERSON_CLASS_MUSICIAN',
                                          'QUO_PROJECT_BRAZILWOOD'
                                      );



INSERT INTO Modifiers 
	(ModifierId, ModifierType, RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
VALUES	('QUO_MODIFIER_BRAZILWOOD_PROJECT_COMPLETE', 'MODIFIER_PLAYER_ADJUST_VALID_IMPROVEMENT', 0, 0, NULL, NULL) ,	
	('QUO_MODIFIER_BRAZILWOOD_PROJECT_COMPLETE_WAR_SLOT', 'MODIFIER_PLAYER_CULTURE_REPLACE_GOVERNMENT_SLOTS', 0, 0, NULL, NULL) ,
	('QUO_MODIFIER_BRAZILWOOD_PROJECT_COMPLETE_ECON_SLOT', 'MODIFIER_PLAYER_CULTURE_REPLACE_GOVERNMENT_SLOTS', 0, 0, NULL, NULL) ,
	('QUO_MODIFIER_BRAZILWOOD_PROJECT_COMPLETE_DIPLO_SLOT', 'MODIFIER_PLAYER_CULTURE_REPLACE_GOVERNMENT_SLOTS', 0, 0, NULL, NULL) ;


INSERT INTO ModifierArguments
	(ModifierId, 					Name, 			Type, 			Value, 	Extra, 	SecondExtra)
VALUES	('QUO_MODIFIER_BRAZILWOOD_PROJECT_COMPLETE', 	'ImprovementType', 	'ARGTYPE_IDENTITY', 	'QUO_IMPROVEMENT_BRAZILWOOD_CAMP',	NULL, 	NULL) ,
	('QUO_MODIFIER_BRAZILWOOD_PROJECT_COMPLETE_WAR_SLOT', 	'AddedGovernmentSlotType', 	'ARGTYPE_IDENTITY', 	'SLOT_WILDCARD',	NULL, 	NULL) ,
	('QUO_MODIFIER_BRAZILWOOD_PROJECT_COMPLETE_WAR_SLOT', 	'ReplacedGovernmentSlotType', 	'ARGTYPE_IDENTITY', 	'SLOT_MILITARY',	NULL, 	NULL) ,	
	('QUO_MODIFIER_BRAZILWOOD_PROJECT_COMPLETE_ECON_SLOT', 	'AddedGovernmentSlotType', 	'ARGTYPE_IDENTITY', 	'SLOT_WILDCARD',	NULL, 	NULL) ,
	('QUO_MODIFIER_BRAZILWOOD_PROJECT_COMPLETE_ECON_SLOT', 	'ReplacedGovernmentSlotType', 	'ARGTYPE_IDENTITY', 	'SLOT_ECONOMIC',	NULL, 	NULL) ,	
	('QUO_MODIFIER_BRAZILWOOD_PROJECT_COMPLETE_DIPLO_SLOT', 	'AddedGovernmentSlotType', 	'ARGTYPE_IDENTITY', 	'SLOT_WILDCARD',	NULL, 	NULL) ,
	('QUO_MODIFIER_BRAZILWOOD_PROJECT_COMPLETE_DIPLO_SLOT', 	'ReplacedGovernmentSlotType', 	'ARGTYPE_IDENTITY', 	'SLOT_DIPLOMATIC',	NULL, 	NULL) ;


-- slots are suppressed for now until I decide what to do with them
INSERT INTO ProjectCompletionModifiers
	(ProjectType, 			ModifierID)
VALUES	('QUO_PROJECT_BRAZILWOOD',	'QUO_MODIFIER_BRAZILWOOD_PROJECT_COMPLETE') ;
	-- ('QUO_PROJECT_BRAZILWOOD',	'QUO_MODIFIER_BRAZILWOOD_PROJECT_COMPLETE_WAR_SLOT') ,
	-- ('QUO_PROJECT_BRAZILWOOD',	'QUO_MODIFIER_BRAZILWOOD_PROJECT_COMPLETE_ECON_SLOT') ,
	-- ('QUO_PROJECT_BRAZILWOOD',	'QUO_MODIFIER_BRAZILWOOD_PROJECT_COMPLETE_DIPLO_SLOT') ;




-- Brazilian Government Penalty
-- Brazil gets one fewer Government policy than other players until they complete their special project. 
-- To do this, take one slot away from all governments in the game and give each player a bonus everyone except Brazil gets.
-- Has to be Wildcard because this is the only slot type every government provides.

-- This feature was removed because there is no way to remove slots with a modifier, only add them. The workaround implemented
-- below resulted in oddness on the Government screens.

/*
UPDATE Government_SlotCounts SET NumSlots=NumSlots-1 WHERE GovernmentSlotType='SLOT_WILDCARD' AND NumSlots <=1 ;

INSERT INTO Modifiers 
	(ModifierId, ModifierType, RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
VALUES	('QUO_MODIFIER_RESTORE_LOST_CARD', 'MODIFIER_PLAYER_CULTURE_ADJUST_GOVERNMENT_SLOTS_MODIFIER', 0, 0, NULL, NULL) ;


INSERT INTO ModifierArguments
	(ModifierId, 				Name, 			Type, 			Value, 			Extra, 	SecondExtra)
VALUES	('QUO_MODIFIER_RESTORE_LOST_CARD', 	'GovernmentSlotType', 	'ARGTYPE_IDENTITY', 	'SLOT_WILDCARD',	NULL, 	NULL) ;
*/


-- This works at least as of the Australia patch. May need to keep an eye on how custom civs are made. There is a chance this could fail
-- if a bunch of civs are given more than one Trait with attached Modifiers. Ideally we should at least check to be sure all civs are 
-- included and none are duplicated.


/*
CREATE TEMPORARY TABLE tbl_Quo_LeaderTraits AS SELECT DISTINCT Traits.Traittype
   	FROM Traits
                                                      INNER JOIN
                                                      Civilizationtraits ON Civilizationtraits.TraitType = Traits.TraitType
                                                      INNER JOIN
                                                      Civilizations ON Civilizationtraits.CivilizationType = Civilizations.CivilizationType
                                                      INNER JOIN
                                                      TraitModifiers ON TraitModifiers.TraitType = Traits.TraitType
                                                WHERE Civilizations.StartingCivilizationLevelType = 'CIVILIZATION_LEVEL_FULL_CIV';



-- remove Brazil from the list before doing the insert
DELETE FROM tbl_Quo_LeaderTraits WHERE TraitType='TRAIT_CIVILIZATION_AMAZON' ;


INSERT INTO TraitModifiers
	(TraitType, 				ModifierID)
SELECT   tbl_Quo_LeaderTraits.TraitType, 	'QUO_MODIFIER_RESTORE_LOST_CARD' 
FROM     tbl_Quo_LeaderTraits ;
*/

INSERT INTO Requirements
	(RequirementId, 		RequirementType, 	Likeliness,	Inverse, 	Triggered)
VALUES	('QUO_REQ_BRAZIL_ADJACENT_CARNIVAL', 		'REQUIREMENT_PLOT_ADJACENT_DISTRICT_TYPE_MATCHES',	0,0,0) ,	
		('QUO_REQ_BRAZIL_ADJACENT_COPACABANA', 		'REQUIREMENT_PLOT_ADJACENT_DISTRICT_TYPE_MATCHES',	0,0,0) ,
		('QUO_REQ_BRAZIL_MET_TURNS_AGO', 		'REQUIREMENT_PLAYER_MET_X_TURNS_AGO',	0,0,0) ;



INSERT INTO RequirementArguments 
	(RequirementId,			Name, 			Type, 			Value, 				Extra, 	SecondExtra)
VALUES 	('QUO_REQ_BRAZIL_ADJACENT_COPACABANA',	'DistrictType',		'ARGTYPE_IDENTITY',	'DISTRICT_WATER_STREET_CARNIVAL',	NULL,	NULL 	)  ,
		('QUO_REQ_BRAZIL_ADJACENT_COPACABANA',	'MaxRange',		'ARGTYPE_IDENTITY',	'6',	NULL,	NULL 	)  ,
		('QUO_REQ_BRAZIL_ADJACENT_COPACABANA',	'MinRange',		'ARGTYPE_IDENTITY',	'0',	NULL,	NULL 	)  ,
		
		('QUO_REQ_BRAZIL_ADJACENT_CARNIVAL',	'DistrictType',		'ARGTYPE_IDENTITY',	'DISTRICT_STREET_CARNIVAL',	NULL,	NULL 	)  ,
		('QUO_REQ_BRAZIL_ADJACENT_CARNIVAL',	'MaxRange',		'ARGTYPE_IDENTITY',	'6',	NULL,	NULL 	)  ,
		('QUO_REQ_BRAZIL_ADJACENT_CARNIVAL',	'MinRange',		'ARGTYPE_IDENTITY',	'0',	NULL,	NULL 	)  ,
		
		('QUO_REQ_BRAZIL_MET_TURNS_AGO',	'TurnsAgo',		'ARGTYPE_IDENTITY',	'1',	NULL,	NULL 	)  ;
		

INSERT INTO RequirementSets 
	(RequirementSetId, 		RequirementSetType)
VALUES 	('QUO_REQSET_BRAZIL_CARNIVAL_ADJ', 	'REQUIREMENTSET_TEST_ANY')    ,	
		('QUO_REQSET_BRAZIL_CARNIVAL_BROADCAST', 	'REQUIREMENTSET_TEST_ALL')    ;

INSERT INTO RequirementSetRequirements
	(RequirementSetId,	RequirementId)
VALUES	 ('QUO_REQSET_BRAZIL_CARNIVAL_ADJ', 	'QUO_REQ_BRAZIL_ADJACENT_CARNIVAL')   ,
		('QUO_REQSET_BRAZIL_CARNIVAL_ADJ', 	'QUO_REQ_BRAZIL_ADJACENT_COPACABANA')   ,
		('QUO_REQSET_BRAZIL_CARNIVAL_BROADCAST', 	'QUO_REQ_BRAZIL_MET_TURNS_AGO')   ;



INSERT INTO Modifiers 
	(ModifierId, ModifierType, RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
VALUES	('QUO_BRAZIL_LOYALTY', 'MODIFIER_PLAYER_CITIES_ADJUST_IDENTITY_PER_TURN', 0, 0, NULL, 'QUO_REQSET_BRAZIL_CARNIVAL_ADJ') ,
		('QUO_BRAZIL_LOYALTY_GLOBAL', 'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER', 0, 0, NULL, 'QUO_REQSET_BRAZIL_CARNIVAL_BROADCAST') ;

		
INSERT INTO ModifierArguments
	(ModifierId, 			Name, 		Type, 			Value, 			Extra, 	SecondExtra)
VALUES	('QUO_BRAZIL_LOYALTY', 	'Amount', 	'ARGTYPE_IDENTITY', 	'-4',			NULL, 	NULL) ,
		('QUO_BRAZIL_LOYALTY_GLOBAL', 	'ModifierId', 	'ARGTYPE_IDENTITY', 	'QUO_BRAZIL_LOYALTY',			NULL, 	NULL) ;	

		
INSERT INTO TraitModifiers
		(TraitType, 			ModifierID)
VALUES	('TRAIT_CIVILIZATION_AMAZON',	'QUO_BRAZIL_LOYALTY_GLOBAL')  ;







-- INDIA

UPDATE tblQuoDebug SET Message = 'INDIA' WHERE DebugId='Quo_Civ_Code' ;





-- Stepwells provide Ocean Water to Indian cities. 
/*INSERT INTO Requirements
		(RequirementId, 		RequirementType, 	Likeliness,	Inverse, 	Triggered)
VALUES	('QUO_REQ_INDIA_STEPWELL_WATER', 	'REQUIREMENT_PLOT_ADJACENT_IMPROVEMENT_TYPE_MATCHES',	0,0,0) ;

INSERT INTO RequirementArguments 
		(RequirementId,			Name, 			Type, 			Value, 		Extra, 	SecondExtra)
VALUES 	('QUO_REQ_INDIA_STEPWELL_WATER',	'ImprovementType',		'ARGTYPE_IDENTITY',	'IMPROVEMENT_STEPWELL',	NULL,	NULL 	)   ;

		
INSERT INTO RequirementSets 
		(RequirementSetId, 		RequirementSetType)
VALUES 	('QUO_REQSET_INDIA_STEPWELL_WATER', 	'REQUIREMENTSET_TEST_ANY') ;

 INSERT INTO RequirementSetRequirements
	(RequirementSetId,	RequirementId)
VALUES	('QUO_REQSET_INDIA_STEPWELL_WATER', 	'QUO_REQ_INDIA_STEPWELL_WATER') ;
		

INSERT INTO Modifiers 
		(ModifierId, ModifierType, RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
VALUES	('QUO_INDIA_STEPWELL_WATER', 'MODIFIER_PLAYER_CITIES_ADJUST_WATER_HOUSING', 0, 0, NULL, 'QUO_REQSET_INDIA_STEPWELL_WATER') ;
 
INSERT INTO ModifierArguments
		(ModifierId, 			Name, 		Type, 			Value, 			Extra, 	SecondExtra)
VALUES	('QUO_INDIA_STEPWELL_WATER', 	'Amount', 	'ARGTYPE_IDENTITY', 	'1',			NULL, 	NULL)  ;


-- Assigned to all civs since they can build this improvement too
INSERT INTO TraitModifiers
		(TraitType, 			ModifierID)
VALUES	('TRAIT_LEADER_MAJOR_CIV',	'QUO_INDIA_STEPWELL_WATER')  ;



-- Receive a free Settler when you build a Holy Site in the Capital. Receive a free Builder for each Holy Site built in a city other than the capital.

INSERT INTO Requirements
	(RequirementId, 		RequirementType, 	Likeliness,	Inverse, 	Triggered)
VALUES	('QUO_REQ_INDIA_CITY_HAS_PALACE', 		'REQUIREMENT_CITY_HAS_BUILDING',	0,0,0) ,
		('QUO_REQ_INDIA_CITY_NOT_HAS_PALACE', 		'REQUIREMENT_CITY_HAS_BUILDING',	0,1,0) ,
		('QUO_REQ_INDIA_CITY_HAS_HOLY_SITE', 		'REQUIREMENT_CITY_HAS_DISTRICT',	0,0,0) ;


INSERT INTO RequirementArguments 
	(RequirementId,			Name, 			Type, 			Value, 				Extra, 	SecondExtra)
VALUES 	('QUO_REQ_INDIA_CITY_HAS_PALACE',	'BuildingType',		'ARGTYPE_IDENTITY',	'BUILDING_PALACE',	NULL,	NULL 	) ,
('QUO_REQ_INDIA_CITY_NOT_HAS_PALACE',	'BuildingType',		'ARGTYPE_IDENTITY',	'BUILDING_PALACE',	NULL,	NULL 	) ,
('QUO_REQ_INDIA_CITY_HAS_HOLY_SITE',	'DistrictType',		'ARGTYPE_IDENTITY',	'DISTRICT_HOLY_SITE',	NULL,	NULL 	) ;


INSERT INTO RequirementSets 
	(RequirementSetId, 		RequirementSetType)
VALUES 	('QUO_REQSET_INDIA_BUILDER_UNLOCK', 	'REQUIREMENTSET_TEST_ALL') ,
('QUO_REQSET_INDIA_SETTLER_UNLOCK', 	'REQUIREMENTSET_TEST_ALL') ;


INSERT INTO RequirementSetRequirements
	(RequirementSetId,	RequirementId)
VALUES	 ('QUO_REQSET_INDIA_BUILDER_UNLOCK', 	'QUO_REQ_INDIA_CITY_NOT_HAS_PALACE') ,
('QUO_REQSET_INDIA_BUILDER_UNLOCK', 	'QUO_REQ_INDIA_CITY_HAS_HOLY_SITE') ,
('QUO_REQSET_INDIA_SETTLER_UNLOCK', 	'QUO_REQ_INDIA_CITY_HAS_PALACE') ,
('QUO_REQSET_INDIA_SETTLER_UNLOCK', 	'QUO_REQ_INDIA_CITY_HAS_HOLY_SITE') ;


 
INSERT INTO Modifiers 
	(ModifierId, ModifierType, RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
VALUES	('QUO_INDIA_FREE_BUILDER', 'MODIFIER_SINGLE_CITY_GRANT_UNIT_IN_CITY', 1, 1, NULL, NULL) ,
		('QUO_INDIA_FREE_BUILDER_PLAYER', 'MODIFIER_PLAYER_CITIES_ATTACH_MODIFIER', 0, 0, NULL, 	'QUO_REQSET_INDIA_BUILDER_UNLOCK') ,
		('QUO_INDIA_FREE_SETTLER', 'MODIFIER_SINGLE_CITY_GRANT_UNIT_IN_CITY', 1, 1, NULL, NULL) ,
		('QUO_INDIA_FREE_SETTLER_PLAYER', 'MODIFIER_PLAYER_CITIES_ATTACH_MODIFIER', 0, 0, NULL, 	'QUO_REQSET_INDIA_SETTLER_UNLOCK') ;


INSERT INTO ModifierArguments
	(ModifierId, 			Name, 		Type, 			Value, 					Extra, 	SecondExtra)
VALUES	('QUO_INDIA_FREE_BUILDER', 	'Amount', 'ARGTYPE_IDENTITY', 	'1',	NULL, 	NULL) ,  
	('QUO_INDIA_FREE_BUILDER', 	'UnitType', 	'ARGTYPE_IDENTITY', 	'UNIT_BUILDER',		NULL, 	NULL) ,
	('QUO_INDIA_FREE_BUILDER_PLAYER', 		'ModifierId', 		'ARGTYPE_IDENTITY', 	'QUO_INDIA_FREE_BUILDER',	NULL, 	NULL) ,
	('QUO_INDIA_FREE_SETTLER', 	'Amount', 'ARGTYPE_IDENTITY', 	'1',	NULL, 	NULL) ,  
	('QUO_INDIA_FREE_SETTLER', 	'UnitType', 	'ARGTYPE_IDENTITY', 	'UNIT_SETTLER',		NULL, 	NULL) ,
	('QUO_INDIA_FREE_SETTLER_PLAYER', 		'ModifierId', 		'ARGTYPE_IDENTITY', 	'QUO_INDIA_FREE_SETTLER',	NULL, 	NULL) ;
	
	
INSERT INTO TraitModifiers
	(TraitType, 			ModifierID)
VALUES	('TRAIT_LEADER_SATYAGRAHA',	'QUO_INDIA_FREE_BUILDER_PLAYER' ),
('TRAIT_LEADER_SATYAGRAHA',	'QUO_INDIA_FREE_SETTLER_PLAYER' );



-- India starts with free faith, scaled by game speed

-- Replaced in v6.0.1 with a new method that insures fewer conflicts with the tutorial system
/* INSERT INTO Modifiers 
	(ModifierId, ModifierType, RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
VALUES	('QUO_INDIA_FREE_STARTING_FAITH', 'MODIFIER_PLAYER_GRANT_YIELD', 1, 1, NULL, NULL) ;


INSERT INTO ModifierArguments
	(ModifierId, 			Name, 			Type, 			Value, 		Extra, 	SecondExtra)
VALUES	('QUO_INDIA_FREE_STARTING_FAITH', 	'Amount', 	'ScaleByGameSpeed', 	'30',		NULL, 	NULL),
	('QUO_INDIA_FREE_STARTING_FAITH', 	'YieldType', 	'ARGTYPE_IDENTITY', 	'YIELD_FAITH',	NULL, 	NULL)  ;


INSERT INTO TraitModifiers
	(TraitType, 			ModifierID)
VALUES	('TRAIT_CIVILIZATION_DHARMA',	'QUO_INDIA_FREE_STARTING_FAITH')  ; 



INSERT INTO RequirementSets 
	(RequirementSetId, 		RequirementSetType)
VALUES 	('QUO_REQSET_INDIA_FREE_FAITH_UNLOCK', 	'REQUIREMENTSET_TEST_ALL') ;

-- Reuses QUO_REQ_INDIA_CITY_HAS_PALACE from above
INSERT INTO RequirementSetRequirements
	(RequirementSetId,	RequirementId)
VALUES	 ('QUO_REQSET_INDIA_FREE_FAITH_UNLOCK', 	'QUO_REQ_INDIA_CITY_HAS_PALACE')  ; 


INSERT INTO Modifiers 
	(ModifierId, ModifierType, RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
VALUES	('QUO_INDIA_FREE_STARTING_FAITH', 'MODIFIER_PLAYER_GRANT_YIELD', 1, 1, NULL, NULL) ,
		('QUO_INDIA_FREE_STARTING_FAITH_PLAYER', 'MODIFIER_PLAYER_CITIES_ATTACH_MODIFIER', 0, 0, NULL, 	'QUO_REQSET_INDIA_FREE_FAITH_UNLOCK') ;


INSERT INTO ModifierArguments
	(ModifierId, 			Name, 			Type, 			Value, 		Extra, 	SecondExtra)
VALUES	('QUO_INDIA_FREE_STARTING_FAITH', 	'Amount', 	'ScaleByGameSpeed', 	'30',		NULL, 	NULL),
		('QUO_INDIA_FREE_STARTING_FAITH', 	'YieldType', 	'ARGTYPE_IDENTITY', 	'YIELD_FAITH',	NULL, 	NULL)  ,
		('QUO_INDIA_FREE_STARTING_FAITH_PLAYER', 	'ModifierId', 	'ARGTYPE_IDENTITY', 	'QUO_INDIA_FREE_STARTING_FAITH',	NULL, 	NULL)  ;
	

INSERT INTO TraitModifiers
	(TraitType, 			ModifierID)
VALUES	('TRAIT_CIVILIZATION_DHARMA',	'QUO_INDIA_FREE_STARTING_FAITH_PLAYER')  ;


-- Broadcast ability
-- For future expansion possibly
/* INSERT INTO RequirementSets 
		(RequirementSetId, 		RequirementSetType)
VALUES 	('QUO_REQSET_INDIA_RELATIONS', 	'REQUIREMENTSET_TEST_ANY') ;


INSERT INTO RequirementSetRequirements
	(RequirementSetId,	RequirementId)
VALUES	('QUO_REQSET_INDIA_RELATIONS', 	'REQUIRES_PLAYER_DECLARED_FRIEND') ,
		('QUO_REQSET_INDIA_RELATIONS', 	'REQUIRES_PLAYER_DENOUNCED') ,
		('QUO_REQSET_INDIA_RELATIONS', 	'REQUIRES_AT_WAR_AND_HAS_MET') ;
		
INSERT INTO Modifiers
	(ModifierID, 				ModifierType, 						RunOnce, 	Permanent, 	OwnerRequirementSetId, 	SubjectRequirementSetId)
VALUES	('QUO_INDIA_WAR_DEBUFF', 	'MODIFIER_PLAYER_ADD_DIPLOMATIC_YIELD_MODIFIER', 	0, 		0, 		NULL,		NULL) ,
		('QUO_INDIA_BROADCAST_NEG', 'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER', 0, 0, NULL, 'QUO_REQSET_INDIA_RELATIONS') ;
		
	
INSERT INTO ModifierArguments
	(ModifierID,				Name,		Type, 				Value,			Extra)
VALUES	('QUO_INDIA_WAR_DEBUFF', 	'DiplomaticYieldSource', 	'ARGTYPE_IDENTITY', 		'SURPRISE_WAR_INITIATED',			NULL) ,
		('QUO_INDIA_WAR_DEBUFF', 	'TurnsActive', 	'ARGTYPE_IDENTITY', 		'3',			NULL) ,
		('QUO_INDIA_WAR_DEBUFF', 	'YieldType', 	'ARGTYPE_IDENTITY', 		'YIELD_PRODUCTION',			NULL) ,
		('QUO_INDIA_WAR_DEBUFF', 	'Amount', 	'ARGTYPE_IDENTITY', 			'-100',			NULL)  ,
		('QUO_INDIA_BROADCAST_NEG',  'ModifierId',  'ARGTYPE_IDENTITY',  'QUO_INDIA_WAR_DEBUFF',   NULL)  ;

INSERT INTO TraitModifiers
	(TraitType, 				ModifierID)
VALUES	('TRAIT_LEADER_SATYAGRAHA',	'QUO_INDIA_BROADCAST_NEG') ; */




-- JAPAN

UPDATE tblQuoDebug SET Message = 'JAPAN' WHERE DebugId='Quo_Civ_Code' ;

-- Delete combat bonus on land's edge
DELETE FROM  TraitModifiers WHERE TraitType='TRAIT_LEADER_DIVINE_WIND' AND  ModifierId = 'TRAIT_COMBAT_BONUS_LAND_ON_COAST';


-- Half off electronics factories
UPDATE Buildings SET Cost=Cost*0.5 WHERE BuildingType='BUILDING_ELECTRONICS_FACTORY' ;


-- Build fisheries
-- Removed in v6.0.11 and made into a biome trait
/* INSERT INTO Modifiers 
	(ModifierId, 			ModifierType, 				RunOnce, 	Permanent, 	OwnerRequirementSetId, 	SubjectRequirementSetId)
VALUES	('QUO_JAPAN_ENABLE_FISHERY', 	'MODIFIER_PLAYER_ADJUST_VALID_IMPROVEMENT', 	0, 		0, 		NULL, 			NULL) ;


INSERT INTO ModifierArguments
	(ModifierId, 				Name, 			Type, 			Value, 				Extra, 	SecondExtra)
VALUES	('QUO_JAPAN_ENABLE_FISHERY', 	'ImprovementType', 	'ARGTYPE_IDENTITY', 	'IMPROVEMENT_FISHERY',		NULL, 	NULL) ;


INSERT INTO TraitModifiers
	(TraitType, 					ModifierID)
VALUES	('TRAIT_CIVILIZATION_ADJACENT_DISTRICTS',			'QUO_JAPAN_ENABLE_FISHERY') ; */




-- Building one of your discounted districts adds bonus GPP toward Great Generals
/* INSERT INTO Modifiers 
	(ModifierId, ModifierType, RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
VALUES	('QUO_JAPAN_THEATER_GLOBAL', 'MODIFIER_PLAYER_CITIES_ATTACH_MODIFIER', 0, 0, NULL, NULL) ,
	('QUO_JAPAN_HOLY_SITE_GLOBAL', 'MODIFIER_PLAYER_CITIES_ATTACH_MODIFIER', 0, 0, NULL, NULL) ,
	('QUO_JAPAN_ENCAMPMENT_GLOBAL', 'MODIFIER_PLAYER_CITIES_ATTACH_MODIFIER', 0, 0, NULL, NULL) ,
	('QUO_JAPAN_THEATER_GENERAL', 'MODIFIER_SINGLE_CITY_DISTRICTS_ADJUST_GREAT_PERSON_POINTS', 0, 0, NULL, 'DISTRICT_IS_THEATER'),
	('QUO_JAPAN_HOLY_SITE_GENERAL', 'MODIFIER_SINGLE_CITY_DISTRICTS_ADJUST_GREAT_PERSON_POINTS', 0, 0, NULL, 'DISTRICT_IS_HOLY_SITE'),
	('QUO_JAPAN_ENCAMPMENT_GENERAL', 'MODIFIER_SINGLE_CITY_DISTRICTS_ADJUST_GREAT_PERSON_POINTS', 0, 0, NULL, 'DISTRICT_IS_ENCAMPMENT') ;


INSERT INTO ModifierArguments
	(ModifierId, 				Name, 			Type, 			Value, 		Extra, 	SecondExtra)
VALUES	('QUO_JAPAN_THEATER_GLOBAL', 		'ModifierId', 		'ARGTYPE_IDENTITY', 	'QUO_JAPAN_THEATER_GENERAL',	NULL, 	NULL) ,	
	('QUO_JAPAN_HOLY_SITE_GLOBAL', 		'ModifierId', 		'ARGTYPE_IDENTITY', 	'QUO_JAPAN_HOLY_SITE_GENERAL',	NULL, 	NULL) ,
	('QUO_JAPAN_ENCAMPMENT_GLOBAL', 	'ModifierId', 		'ARGTYPE_IDENTITY', 	'QUO_JAPAN_ENCAMPMENT_GENERAL',	NULL, 	NULL) ,
	('QUO_JAPAN_THEATER_GENERAL', 		'Amount', 		'ARGTYPE_IDENTITY', 	'1',		NULL, 	NULL) , 
	('QUO_JAPAN_THEATER_GENERAL', 		'GreatPersonClassType', 'ARGTYPE_IDENTITY', 	'GREAT_PERSON_CLASS_GENERAL',		NULL, 	NULL) , 
	('QUO_JAPAN_HOLY_SITE_GENERAL', 	'Amount', 		'ARGTYPE_IDENTITY', 	'1',		NULL, 	NULL) , 
	('QUO_JAPAN_HOLY_SITE_GENERAL', 	'GreatPersonClassType', 'ARGTYPE_IDENTITY', 	'GREAT_PERSON_CLASS_GENERAL',		NULL, 	NULL) , 
	('QUO_JAPAN_ENCAMPMENT_GENERAL', 	'Amount', 		'ARGTYPE_IDENTITY', 	'1',		NULL, 	NULL) , 
	('QUO_JAPAN_ENCAMPMENT_GENERAL', 	'GreatPersonClassType', 'ARGTYPE_IDENTITY', 	'GREAT_PERSON_CLASS_GENERAL',		NULL, 	NULL) ;


INSERT INTO TraitModifiers
	(TraitType, 			ModifierID)
VALUES	('TRAIT_LEADER_DIVINE_WIND',	'QUO_JAPAN_THEATER_GLOBAL') ,
	('TRAIT_LEADER_DIVINE_WIND',	'QUO_JAPAN_HOLY_SITE_GLOBAL') ,
	('TRAIT_LEADER_DIVINE_WIND',	'QUO_JAPAN_ENCAMPMENT_GLOBAL') ;
 */


-- Give Samurai units Stealth
-- Originally this was to only work on Coastal tiles. However, requirements don't seem to work properly with stealth, so just give it to the unit all of the time

INSERT INTO Requirements
	(RequirementId, 		RequirementType, 	Likeliness,	Inverse, 	Triggered)
VALUES	('QUO_REQ_JAPAN_UNSTEALTH', 	'REQUIREMENT_UNIT_ON_COAST',	0,1,0) ;


INSERT INTO RequirementSets 
	(RequirementSetId, 		RequirementSetType)
VALUES 	('QUO_REQSET_JAPAN_UNSTEALTH', 	'REQUIREMENTSET_TEST_ALL') ;



INSERT INTO RequirementSetRequirements
	(RequirementSetId,	RequirementId)
VALUES	('QUO_REQSET_JAPAN_UNSTEALTH', 	'QUO_REQ_JAPAN_UNSTEALTH') ; 



INSERT INTO Modifiers 
	(ModifierId, ModifierType, RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
VALUES	('QUO_SAMURAI_STEALTH', 'MODIFIER_PLAYER_UNIT_ADJUST_HIDDEN_VISIBILITY', 0, 0, NULL, NULL) ,
	('QUO_SAMURAI_UNSTEALTH', 'MODIFIER_PLAYER_UNIT_ADJUST_HIDDEN_VISIBILITY', 0, 0, NULL, 'QUO_REQSET_JAPAN_UNSTEALTH') ;


INSERT INTO ModifierArguments
	(ModifierId, 				Name, 			Type, 			Value, 		Extra, 	SecondExtra)
VALUES	('QUO_SAMURAI_STEALTH', 		'Hidden', 		'ARGTYPE_IDENTITY', 	'1',	NULL, 	NULL) ,
	('QUO_SAMURAI_UNSTEALTH', 		'Hidden', 		'ARGTYPE_IDENTITY', 	'0',	NULL, 	NULL) ;

INSERT INTO UnitAbilityModifiers
	(UnitAbilityType,	ModifierId)
VALUES	('ABILITY_SAMURAI', 	'QUO_SAMURAI_STEALTH') ;
	--	('ABILITY_SAMURAI', 	'QUO_SAMURAI_UNSTEALTH') ;



-- GERMANY

UPDATE tblQuoDebug SET Message = 'GERMANY' WHERE DebugId='Quo_Civ_Code' ;

-- Germany gets +1 production per district after the third district. To make this work, we deduct 2 points from production, then re-add it.


-- +1 production per district constructed, only applies starting with third district  built

INSERT INTO Modifiers 
	(ModifierId, ModifierType, RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
VALUES	('QUO_GERMANY_HAMMERS_PER_DISTRICT', 'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_PER_DISTRICT', 0, 0, NULL, 'CITY_HAS_2_SPECIALTY_DISTRICTS_REQUIREMENTS') ;



INSERT INTO ModifierArguments
	(ModifierId, 			Name, 		Type, 			Value, 			Extra, 	SecondExtra)
VALUES	('QUO_GERMANY_HAMMERS_PER_DISTRICT', 	'Amount', 	'ARGTYPE_IDENTITY', 	'1',			NULL, 	NULL) , 
	('QUO_GERMANY_HAMMERS_PER_DISTRICT', 	'YieldType',	 'ARGTYPE_IDENTITY', 	'YIELD_PRODUCTION',	NULL, 	NULL) ;


INSERT INTO TraitModifiers
	(TraitType, 			ModifierID)
VALUES	('TRAIT_CIVILIZATION_IMPERIAL_FREE_CITIES',	'QUO_GERMANY_HAMMERS_PER_DISTRICT') ;



-- -2 production in all cities to balance out the bonus above


INSERT INTO Modifiers 
	(ModifierId, ModifierType, RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
VALUES	('QUO_GERMANY_LOST_HAMMERS', 'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_CHANGE', 0, 0, NULL, 'CITY_HAS_2_SPECIALTY_DISTRICTS_REQUIREMENTS') ;


INSERT INTO ModifierArguments
	(ModifierId, 			Name, 		Type, 			Value, 			Extra, 	SecondExtra)
VALUES	('QUO_GERMANY_LOST_HAMMERS', 	'Amount', 	'ARGTYPE_IDENTITY', 	'-2',			NULL, 	NULL) , 
	('QUO_GERMANY_LOST_HAMMERS', 	'YieldType',	 'ARGTYPE_IDENTITY', 	'YIELD_PRODUCTION',	NULL, 	NULL) ;


INSERT INTO TraitModifiers
	(TraitType, 			ModifierID)
VALUES	('TRAIT_CIVILIZATION_IMPERIAL_FREE_CITIES',	'QUO_GERMANY_LOST_HAMMERS') ;




-- This has been some of the most ellusive code in this mod. The intent is to give Germany a bonus on capturing a City State. However
-- it is very difficult to ID a former city state or any of their units. So most of that code is disabled, and, for now, GERMANY
-- just gets bonus Gold for taking any city.

/* INSERT INTO Requirements
	(RequirementId, 		RequirementType, 	Likeliness,	Inverse, 	Triggered)
VALUES	('QUO_REQ_GERMANY_CAPTURED_HAS_ANNEX', 	'REQUIREMENT_CITY_HAS_BUILDING',	0,0,0) ;


INSERT INTO RequirementArguments 
		(RequirementId,			Name, 			Type, 			Value, 		Extra, 	SecondExtra)
VALUES 	('QUO_REQ_GERMANY_CAPTURED_HAS_ANNEX',	'BuildingType',		'ARGTYPE_IDENTITY',	'QUO_BUILDING_CITY_STATE_ANNEX',	NULL,	NULL 	)   ;


INSERT INTO RequirementSets 
	(RequirementSetId, 		RequirementSetType)
VALUES 	('QUO_REQSET_GERMANY_CAPTURE_CITY_STATE', 	'REQUIREMENTSET_TEST_ALL') ;


INSERT INTO RequirementSetRequirements
	(RequirementSetId,	RequirementId)
VALUES	('QUO_REQSET_GERMANY_CAPTURE_CITY_STATE', 	'QUO_REQ_GERMANY_CAPTURED_HAS_ANNEX') ;  */

		

-- Another removed ability for Germany. Sigh
/* INSERT INTO Modifiers 
	(ModifierId, ModifierType, RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
VALUES	('QUO_GERMANY_CITY_CAPTURE', 'MODIFIER_PLAYER_GRANT_YIELD_BASED_ON_CURRENT_YIELD_RATE', 1, 1, NULL, NULL) ,
		('QUO_GERMANY_CITY_CAPTURE_PLAYER', 'MODIFIER_PLAYER_CAPTURED_CITY_ATTACH_MODIFIER', 0, 0, NULL, NULL) ;

		
INSERT INTO ModifierArguments
	(ModifierId, 			Name, 		Type, 			Value, 			Extra, 	SecondExtra)
VALUES	('QUO_GERMANY_CITY_CAPTURE', 	'Multiplier', 	'ARGTYPE_IDENTITY', 	'3',			NULL, 	NULL) ,
		('QUO_GERMANY_CITY_CAPTURE', 	'YieldToBaseOn', 	'ARGTYPE_IDENTITY', 	'YIELD_GOLD',			NULL, 	NULL) ,
		('QUO_GERMANY_CITY_CAPTURE', 	'YieldToGrant', 	'ARGTYPE_IDENTITY', 	'YIELD_GOLD',			NULL, 	NULL) ,
		('QUO_GERMANY_CITY_CAPTURE_PLAYER', 	'ModifierId', 	'ARGTYPE_IDENTITY', 	'QUO_GERMANY_CITY_CAPTURE',			NULL, 	NULL) ;

		
INSERT INTO TraitModifiers
	(TraitType, 			ModifierID)
VALUES	('TRAIT_LEADER_HOLY_ROMAN_EMPEROR',	'QUO_GERMANY_CITY_CAPTURE_PLAYER') ;   */
 

 
-- give Germany gold for killing units near city states 
INSERT INTO Requirements
	(RequirementId, 		RequirementType, 	Likeliness,	Inverse, 	Triggered)
VALUES	('QUO_REQ_GERMANY_KILL_MINOR', 	'REQUIREMENT_OPPONENT_IS_MINOR_CIV',	0,1,0) ;

-- no arguments

INSERT INTO RequirementSets 
	(RequirementSetId, 		RequirementSetType)
VALUES 	('QUO_REQSET_GERMANY_KILL_MINOR', 	'REQUIREMENTSET_TEST_ALL') ;


INSERT INTO RequirementSetRequirements
	(RequirementSetId,	RequirementId)
VALUES	('QUO_REQSET_GERMANY_KILL_MINOR', 	'QUO_REQ_GERMANY_KILL_MINOR') ; 


INSERT INTO Modifiers 
	(ModifierId, ModifierType, RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
VALUES	('QUO_GERMANY_GOLD_ON_KILL', 'MODIFIER_PLAYER_UNITS_ADJUST_POST_COMBAT_YIELD', 1, 1, NULL, NULL) ;

		
INSERT INTO ModifierArguments
	(ModifierId, 			Name, 		Type, 			Value, 			Extra, 	SecondExtra)
VALUES	('QUO_GERMANY_GOLD_ON_KILL', 	'PercentDefeatedStrength', 	'ARGTYPE_IDENTITY', 	'50',			NULL, 	NULL) ,
		('QUO_GERMANY_GOLD_ON_KILL', 	'YieldType', 	'ARGTYPE_IDENTITY', 	'YIELD_GOLD',			NULL, 	NULL) ;

		
INSERT INTO TraitModifiers
	(TraitType, 			ModifierID)
VALUES	('TRAIT_LEADER_HOLY_ROMAN_EMPEROR',	'QUO_GERMANY_GOLD_ON_KILL') ;  




-- extra movement for heavy cavalry in late game
-- updated in v5.0.3 for Rise and Fall to use global game eras
INSERT INTO Requirements
	(RequirementId, 		RequirementType, 	Likeliness,	Inverse, 	Triggered)
VALUES	('QUO_REQ_GERMANY_HEAVY_CALVARY', 	'REQUIREMENT_UNIT_PROMOTION_CLASS_MATCHES',	0,0,0)  ,
		('QUO_REQ_GERMANY_IS_ERA_AT_LEAST', 		'REQUIREMENT_GAME_ERA_ATLEAST_EXPANSION',	0,0,0) ;


INSERT INTO RequirementArguments 
	(RequirementId,			Name, 			Type, 			Value, 				Extra, 	SecondExtra)
VALUES 	('QUO_REQ_GERMANY_HEAVY_CALVARY',	'UnitPromotionClass',	'ARGTYPE_IDENTITY',	'PROMOTION_CLASS_HEAVY_CAVALRY',	NULL,	NULL 	) ,
		('QUO_REQ_GERMANY_IS_ERA_AT_LEAST',	'EraType',		'ARGTYPE_IDENTITY',	'ERA_MODERN',	NULL,	NULL 	) ;


INSERT INTO RequirementSets 
	(RequirementSetId, 		RequirementSetType)
VALUES 	('QUO_REQSET_GERMANY_SPEED_UP', 	'REQUIREMENTSET_TEST_ALL') ;

INSERT INTO RequirementSetRequirements
	(RequirementSetId,	RequirementId)
VALUES	('QUO_REQSET_GERMANY_SPEED_UP', 	'QUO_REQ_GERMANY_HEAVY_CALVARY') ,
		('QUO_REQSET_GERMANY_SPEED_UP', 	'QUO_REQ_GERMANY_IS_ERA_AT_LEAST') ;

INSERT INTO Modifiers 
	(ModifierId, 	ModifierType, 	RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
VALUES	('QUO_GERMANY_SPEED_UP', 	'MODIFIER_PLAYER_UNIT_ADJUST_MOVEMENT', 0, 0, NULL, NULL) ,
		('QUO_GERMANY_SPEED_UP_GLOBAL', 	'MODIFIER_PLAYER_UNITS_ATTACH_MODIFIER', 0, 0, NULL, 'QUO_REQSET_GERMANY_SPEED_UP') ;


INSERT INTO ModifierArguments
	(ModifierId, 			Name, 		Type, 			Value, 					Extra, 	SecondExtra)
VALUES	('QUO_GERMANY_SPEED_UP', 	'Amount', 	'ARGTYPE_IDENTITY', 	'2',					NULL, 	NULL) ,	
		('QUO_GERMANY_SPEED_UP_GLOBAL', 	'ModifierId', 	'ARGTYPE_IDENTITY', 	'QUO_GERMANY_SPEED_UP',		NULL, 	NULL)  ;

INSERT INTO TraitModifiers
	(TraitType, 			ModifierID)
VALUES	('TRAIT_CIVILIZATION_IMPERIAL_FREE_CITIES',	'QUO_GERMANY_SPEED_UP_GLOBAL') ;





-- Scythia

UPDATE tblQuoDebug SET Message = 'SCYTHIA' WHERE DebugId='Quo_Civ_Code' ;

-- Make the Kurgan a strange unique only buildable on the Mysterium resource
--UPDATE Improvements SET Appeal=1, Housing=1, YieldFromAppeal="YIELD_FAITH" WHERE ImprovementType='IMPROVEMENT_KURGAN' ;


-- Removed in v7.0.12

/* INSERT INTO Types
	(Type, 				Kind)
VALUES 	('RESOURCE_QUO_SCYTHIAN_MYSTERIUM',	'KIND_RESOURCE'	) ;

INSERT INTO Resources (
                          ResourceType,
                          Name,
                          ResourceClassType,
                          Happiness,
                          NoRiver,
                          RequiresRiver,
                          Frequency,
                          Clumped,
                          PrereqTech,
                          PrereqCivic,
                          PeakEra,
                          RevealedEra,
                          LakeEligible,
                          AdjacentToLand,
                          SeaFrequency
                      )
                      VALUES (
                          "RESOURCE_QUO_SCYTHIAN_MYSTERIUM"  -- 'ResourceType',
                          , "LOC_RESOURCE_QUO_SCYTHIAN_MYSTERIUM_NAME" -- 'Name',
                          , "RESOURCECLASS_BONUS" -- 'ResourceClassType',
                          , 0 -- 'Happiness',
                          , 0 -- 'NoRiver',
                          , 0 -- 'RequiresRiver',
                          , 5 -- 'Frequency',
                          , 0 -- 'Clumped',
                          , NULL -- 'PrereqTech',
                          , "CIVIC_FUTURE_CIVIC" -- 'PrereqCivic',
                          , "NO_ERA"-- 'PeakEra',
                          , 1 -- 'RevealedEra',
                          , 0 -- 'LakeEligible',
                          , 0 -- 'AdjacentToLand',
                          , 0 -- 'SeaFrequency'
                      );


INSERT INTO Modifiers 
		(ModifierId, 	ModifierType, 	RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
VALUES ('QUO_SCYTHIA_REVEAL_MYSTERIUM',	 'MODIFIER_PLAYER_GRANT_FREE_RESOURCE_VISIBILITY', 1, 1, NULL, NULL) ;


INSERT INTO ModifierArguments
	(ModifierId, 			Name, 			Type, 			Value, 		Extra, 	SecondExtra)
VALUES	('QUO_SCYTHIA_REVEAL_MYSTERIUM', 	'ResourceType', 	'ARGTYPE_IDENTITY', 	'RESOURCE_QUO_SCYTHIAN_MYSTERIUM',		NULL, 	NULL) ;


INSERT INTO TraitModifiers
	(TraitType, 			ModifierID)
VALUES	('TRAIT_CIVILIZATION_EXTRA_LIGHT_CAVALRY',	'QUO_SCYTHIA_REVEAL_MYSTERIUM') ;


-- Increase Kurgan amenities
INSERT INTO Modifiers 
		(ModifierId, 	ModifierType, 	RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
VALUES ('QUO_SCYTHIA_KURGAN_AMENITIES',	 'MODIFIER_SINGLE_CITY_ADJUST_IMPROVEMENT_AMENITY', 1, 1, NULL, NULL) ;


INSERT INTO ModifierArguments
	(ModifierId, 			Name, 			Type, 			Value, 		Extra, 	SecondExtra)
VALUES	('QUO_SCYTHIA_KURGAN_AMENITIES', 	'Amount', 	'ARGTYPE_IDENTITY', 	'1',		NULL, 	NULL) ;


INSERT INTO ImprovementModifiers
	(ImprovementType, 			ModifierID)
VALUES	('IMPROVEMENT_KURGAN',	'QUO_SCYTHIA_KURGAN_AMENITIES') ;




INSERT INTO Resource_ValidTerrains
		(ResourceType, TerrainType)
VALUES ("RESOURCE_QUO_SCYTHIAN_MYSTERIUM","TERRAIN_DESERT"),
		("RESOURCE_QUO_SCYTHIAN_MYSTERIUM","TERRAIN_PLAINS"),
		("RESOURCE_QUO_SCYTHIAN_MYSTERIUM","TERRAIN_TUNDRA"),
		("RESOURCE_QUO_SCYTHIAN_MYSTERIUM","TERRAIN_GRASS");

		
INSERT INTO Resource_Harvests 
    (ResourceType, YieldType, Amount, Prereqtech)
VALUES ('RESOURCE_QUO_SCYTHIAN_MYSTERIUM', 'YIELD_CULTURE', 100, "TECH_CHEMISTRY")  ;


		
INSERT INTO StartBiasResources
	(CivilizationType, ResourceType, Tier)
VALUES	("CIVILIZATION_SCYTHIA","RESOURCE_QUO_SCYTHIAN_MYSTERIUM", 3);
	
	

DELETE FROM Improvement_ValidTerrains WHERE ImprovementType ="IMPROVEMENT_KURGAN";


INSERT INTO Improvement_ValidResources
		(ImprovementType, ResourceType, MustRemoveFeature)
VALUES	("IMPROVEMENT_KURGAN", "RESOURCE_QUO_SCYTHIAN_MYSTERIUM", 0); 
	


	
INSERT INTO Adjacency_YieldChanges 
	(ID,				Description,				YieldType,		YieldChange,	TilesRequired,	OtherDistrictAdjacent,	AdjacentSeaResource,	AdjacentTerrain,	AdjacentFeature,	AdjacentRiver,	AdjacentWonder,	AdjacentNaturalWonder,	AdjacentImprovement,		AdjacentDistrict,	PrereqCivic,	PrereqTech,	ObsoleteCivic,	ObsoleteTech,	AdjacentResource)
VALUES	('QUO_KURGAN_ENCAMP',	'QUO_LOC_KURGAN_ADJ',	'YIELD_PRODUCTION',	2,		1,		0,			0,			NULL,			NULL,			0,		0,		0,			'IMPROVEMENT_KURGAN',	NULL,			NULL,		NULL,		NULL,		NULL,		0)  ;

INSERT INTO District_Adjacencies
	(DistrictType,	YieldChangeId)
VALUES	('DISTRICT_ENCAMPMENT', 'QUO_KURGAN_ENCAMP');  */
	


-- ==================================================== RISE AND FALL CIVS


-- MAPUCHE


UPDATE tblQuoDebug SET Message = 'MAPUCHE' WHERE DebugId='Quo_Civ_Code' ;


-- Extra sight for all units
-- Note that this was originally used for the American civilization. Moved to the Mapuche after the release of Rise and Fall.
/* INSERT INTO Types
	(Type, 				Kind)
VALUES 	('QUO_ABILITY_EXTRA_VISION',	'KIND_ABILITY'	) ;


INSERT INTO TypeTags
	(Type,					Tag)
VALUES  ('QUO_ABILITY_EXTRA_VISION', 	'CLASS_RECON'), 
	('QUO_ABILITY_EXTRA_VISION', 		'CLASS_MELEE'), 
	('QUO_ABILITY_EXTRA_VISION', 		'CLASS_RANGED'),
	('QUO_ABILITY_EXTRA_VISION', 		'CLASS_SIEGE'),
 	('QUO_ABILITY_EXTRA_VISION', 		'CLASS_HEAVY_CAVALRY'),
	('QUO_ABILITY_EXTRA_VISION', 		'CLASS_RANGED_CAVALRY'),
	('QUO_ABILITY_EXTRA_VISION', 		'CLASS_ANTI_CAVALRY') ;
 

INSERT INTO Modifiers 
	(ModifierId, 			ModifierType, 				RunOnce, 	Permanent, 	OwnerRequirementSetId, 	SubjectRequirementSetId)
VALUES	('QUO_SPYGLASS', 		'MODIFIER_PLAYER_UNIT_ADJUST_SIGHT', 	0, 		0, 		NULL, 			NULL) ;


INSERT INTO ModifierArguments
	(ModifierId, 			Name, 		Type, 			Value, 		Extra, 	SecondExtra)
VALUES	('QUO_SPYGLASS', 		'Amount', 	'ARGTYPE_IDENTITY', 	'1',	NULL, 	NULL) ;


INSERT INTO UnitAbilities
	(UnitAbilityType,		Name,				Description,			Inactive)
VALUES	('QUO_ABILITY_EXTRA_VISION',	'QUO_LOC_EXTRA_VISION',		'QUO_LOC_EXTRA_VISION_DESC',	"1"	) ;


INSERT INTO UnitAbilityModifiers
	(UnitAbilityType, 			ModifierId)
VALUES 	('QUO_ABILITY_EXTRA_VISION', 		'QUO_SPYGLASS');


INSERT INTO Modifiers 
	(ModifierId, 			ModifierType, 				RunOnce, 	Permanent, 	OwnerRequirementSetId, 	SubjectRequirementSetId)
VALUES	('QUO_MAPUCHE_EXTRA_SIGHT', 	'MODIFIER_PLAYER_UNITS_GRANT_ABILITY', 	0, 		1, 		NULL, 			NULL) ;


INSERT INTO ModifierArguments
	(ModifierId, 			Name, 		Type, 			Value, 		Extra, 	SecondExtra)
VALUES	('QUO_MAPUCHE_EXTRA_SIGHT', 	'AbilityType', 	'ARGTYPE_IDENTITY', 	'QUO_ABILITY_EXTRA_VISION',	NULL, 	NULL) ;


INSERT INTO TraitModifiers
	(TraitType, 					ModifierID)
VALUES	('TRAIT_LEADER_LAUTARO_ABILITY',			'QUO_MAPUCHE_EXTRA_SIGHT') ; */


-- Cities flip instantly to the Mapuche
-- Tried it out -- doesn't work
/* INSERT INTO Modifiers 
	(ModifierId, 	ModifierType, 	RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
VALUES	('QUO_MAPUCHE_SKIP_FREE_CITY', 	'MODIFIER_PLAYER_ADJUST_SKIP_FREE_CITY_STEP', 0, 0, NULL, NULL) ;


INSERT INTO ModifierArguments
	(ModifierId, 			Name, 		Type, 			Value, 					Extra, 	SecondExtra)
VALUES	('QUO_MAPUCHE_SKIP_FREE_CITY', 	'Skip', 	'ARGTYPE_IDENTITY', 	'1',					NULL, 	NULL) ;


INSERT INTO TraitModifiers
	(TraitType, 		ModifierId)
VALUES ('TRAIT_LEADER_LAUTARO_ABILITY',	'QUO_MAPUCHE_SKIP_FREE_CITY'  );*/



-- Disregard Zone of Control
INSERT INTO Modifiers 
	(ModifierId, 	ModifierType, 	RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
VALUES	('QUO_MAPUCHE_IGNORE_ZOC', 	'MODIFIER_PLAYER_UNIT_ADJUST_IGNORE_ZOC', 0, 0, NULL, NULL) ,
	('QUO_MAPUCHE_IGNORE_ZOC_GLOBAL', 	'MODIFIER_PLAYER_UNITS_ATTACH_MODIFIER', 0, 0, NULL, NULL) ;


INSERT INTO ModifierArguments
	(ModifierId, 			Name, 		Type, 			Value, 					Extra, 	SecondExtra)
VALUES	('QUO_MAPUCHE_IGNORE_ZOC', 	'Ignore', 	'ARGTYPE_IDENTITY', 	'1',					NULL, 	NULL) ,	
	('QUO_MAPUCHE_IGNORE_ZOC_GLOBAL', 	'ModifierId', 	'ARGTYPE_IDENTITY', 	'QUO_MAPUCHE_IGNORE_ZOC',		NULL, 	NULL)  ;


INSERT INTO TraitModifiers
	(TraitType, 		ModifierId)
VALUES ('TRAIT_LEADER_LAUTARO_ABILITY',	'QUO_MAPUCHE_IGNORE_ZOC_GLOBAL' );
 


-- Loyalty penalty for enemies you are facing
INSERT INTO Requirements
	(RequirementId, 		RequirementType, 	Likeliness,	Inverse, 	Triggered)
VALUES	('QUO_REQ_MAPUCHE_AT_WAR', 		'REQUIREMENT_PLAYER_IS_AT_PEACE',	0,1,0) ,
		('QUO_REQ_MAPUCHE_HAS_MET', 		'REQUIREMENT_PLAYER_HAS_MET',	0,0,0) ;

-- no arguments
INSERT INTO RequirementSets 
	(RequirementSetId, 		RequirementSetType)
VALUES 	('QUO_REQSET_MAPUCHE_DEBUFF', 	'REQUIREMENTSET_TEST_ALL')    ;

INSERT INTO RequirementSetRequirements
	(RequirementSetId,	RequirementId)
VALUES	 ('QUO_REQSET_MAPUCHE_DEBUFF', 	'QUO_REQ_MAPUCHE_AT_WAR')  ,
		('QUO_REQSET_MAPUCHE_DEBUFF', 	'QUO_REQ_MAPUCHE_HAS_MET')   ;
 
 
INSERT INTO Modifiers 
	(ModifierId, ModifierType, RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
VALUES	('QUO_MAPUCHE_LOYALTY', 'MODIFIER_PLAYER_CITIES_ADJUST_IDENTITY_PER_TURN', 0, 0, NULL, NULL) ,
		('QUO_MAPUCHE_LOYALTY_GLOBAL', 'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER', 0, 0, NULL, 'QUO_REQSET_MAPUCHE_DEBUFF') ;

INSERT INTO ModifierArguments
	(ModifierId, 			Name, 		Type, 			Value, 			Extra, 	SecondExtra)
VALUES	('QUO_MAPUCHE_LOYALTY', 	'Amount', 	'ARGTYPE_IDENTITY', 	'-4',			NULL, 	NULL) ,
		('QUO_MAPUCHE_LOYALTY_GLOBAL', 	'ModifierId', 	'ARGTYPE_IDENTITY', 	'QUO_MAPUCHE_LOYALTY',			NULL, 	NULL) ;	

INSERT INTO TraitModifiers
	(TraitType, 			ModifierID)
VALUES	('TRAIT_LEADER_LAUTARO_ABILITY',	'QUO_MAPUCHE_LOYALTY_GLOBAL') ;   


-- All Strategic resources are visible 
-- The generated modifier will have a name such as QUO_MAPUCHE_CAN_SEE_RESOURCE_IRON

-- Moved to the Africa biome

/* CREATE TABLE IF NOT EXISTS tblQuoMapucheStrategics AS 
	SELECT ResourceType FROM Resources 
	WHERE ResourceClassType="RESOURCECLASS_STRATEGIC" AND PrereqTech IS NOT NULL ;

ALTER TABLE tblQuoMapucheStrategics
    ADD CivicType text;

UPDATE tblQuoMapucheStrategics SET CivicType =    
    (SELECT Civics.CivicType FROM Civics WHERE Civics.RowId = tblQuoMapucheStrategics.RowId +1)   ;


	
INSERT INTO Requirements
		(RequirementId, 		RequirementType, 	Likeliness,	Inverse, 	Triggered)
SELECT  "QUO_REQ_MAPUCHE_UNLOCK_" || ResourceType, "REQUIREMENT_PLAYER_HAS_CIVIC", 0, 0, 0  
	FROM  tblQuoMapucheStrategics;


INSERT INTO RequirementArguments 
	(RequirementId,			Name, 			Type, 			Value, 				Extra, 	SecondExtra)
SELECT 	"QUO_REQ_MAPUCHE_UNLOCK_" || ResourceType, 'CivicType', 'ARGTYPE_IDENTITY', CivicType, NULL, NULL
	FROM  tblQuoMapucheStrategics ;


INSERT INTO RequirementSets 
	(RequirementSetId, 		RequirementSetType)
SELECT "QUO_REQSET_MAPUCHE_UNLOCK_" || ResourceType, 	'REQUIREMENTSET_TEST_ALL'
	FROM  tblQuoMapucheStrategics ;

INSERT INTO RequirementSetRequirements
	(RequirementSetId,	RequirementId)
SELECT	"QUO_REQSET_MAPUCHE_UNLOCK_" || ResourceType, 	"QUO_REQ_MAPUCHE_UNLOCK_" || ResourceType 
	FROM  tblQuoMapucheStrategics ;
	
	



INSERT INTO Modifiers 
	(ModifierId, 	ModifierType, 	RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
SELECT	'QUO_MAPUCHE_CAN_SEE' || tblQuoMapucheStrategics.ResourceType, 	'MODIFIER_PLAYER_GRANT_FREE_RESOURCE_VISIBILITY', 0, 0, NULL, "QUO_REQSET_MAPUCHE_UNLOCK_" || ResourceType
	FROM tblQuoMapucheStrategics;


INSERT INTO ModifierArguments
	(ModifierId, 			Name, 		Type, 			Value, 					Extra, 	SecondExtra)
SELECT 'QUO_MAPUCHE_CAN_SEE' || tblQuoMapucheStrategics.ResourceType, 	'ResourceType', 	'ARGTYPE_IDENTITY', 	tblQuoMapucheStrategics.ResourceType,					NULL, 	NULL 	
	FROM tblQuoMapucheStrategics;

	
INSERT INTO TraitModifiers
	(TraitType, 		ModifierId)
SELECT 'TRAIT_CIVILIZATION_MAPUCHE_TOQUI',	'QUO_MAPUCHE_CAN_SEE' || tblQuoMapucheStrategics.ResourceType 
	FROM tblQuoMapucheStrategics;
 */





-- CREE


UPDATE tblQuoDebug SET Message = 'CREE' WHERE DebugId='Quo_Civ_Code' ;

-- Increase the gain tile radius for trade routes
UPDATE ModifierArguments SET Value = 4 WHERE ModifierId='TRAIT_TRADE_GAIN_TILES_EN_ROUTE' AND Name='GainTileRadius';



-- Cree cities are always loyal
-- in v6.0.11 this is now a Biome modifier
/* INSERT INTO Modifiers 
	(ModifierId, 	ModifierType, 	RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
VALUES	('QUO_CREE_ALWAYS_LOYAL', 	'MODIFIER_PLAYER_CITIES_ADJUST_ALWAYS_LOYAL', 0, 0, NULL, NULL)  ;


INSERT INTO ModifierArguments
	(ModifierId, 			Name, 		Type, 			Value, 					Extra, 	SecondExtra)
VALUES	('QUO_CREE_ALWAYS_LOYAL', 	'AlwaysLoyal', 	'ARGTYPE_IDENTITY', 	'1',					NULL, 	NULL) ;


INSERT INTO TraitModifiers
	(TraitType, 		ModifierId)
VALUES ('TRAIT_CIVILIZATION_CREE_TRADE_GAIN_TILES',	'QUO_CREE_ALWAYS_LOYAL' );
 */



-- Bonus movement. Was adjusted a few times. Now provides +3 moves inside other civs territory as long as you are at peace with all major civs

-- Removed, since it did not work properly
/* INSERT INTO Requirements
	(RequirementId, 		RequirementType, 	Likeliness,	Inverse, 	Triggered)
VALUES	('QUO_REQ_CREE_NOT_OWN', 	'REQUIREMENT_UNIT_IN_ENEMY_TERRITORY',	0,1,0) ,
		('QUO_REQ_CREE_ENEMY_TERR', 	'REQUIREMENT_UNIT_IN_ENEMY_TERRITORY',	0,0,0) ,
		('QUO_REQ_CREE_AT_PEACE', 	'REQUIREMENT_PLAYER_IS_AT_PEACE_WITH_ALL_MAJORS',	0,0,0) ;


-- no requirement arguments needed
INSERT INTO RequirementSets 
	(RequirementSetId, 		RequirementSetType)
VALUES 	('QUO_REQSET_CREE_TERRITORY', 	'REQUIREMENTSET_TEST_ALL') ,
('QUO_REQSET_CREE_PEACE', 	'REQUIREMENTSET_TEST_ALL') ;

INSERT INTO RequirementSetRequirements
	(RequirementSetId,	RequirementId)
VALUES	--('QUO_REQSET_CREE_TERRITORY', 	'QUO_REQ_CREE_NOT_OWN') , 
		('QUO_REQSET_CREE_TERRITORY', 	'QUO_REQ_CREE_ENEMY_TERR') ,
		('QUO_REQSET_CREE_TERRITORY', 	'REQUIRES_LAND_UNIT') ,
		('QUO_REQSET_CREE_PEACE', 	'QUO_REQ_CREE_AT_PEACE') ;
		
		
INSERT INTO Modifiers 
	(ModifierId, 	ModifierType, 	RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
VALUES	('QUO_CREE_TROOP_MOVEMENT', 	'MODIFIER_PLAYER_UNIT_ADJUST_MOVEMENT', 0, 0, NULL, 'QUO_REQSET_CREE_TERRITORY') ,
		('QUO_CREE_TROOP_MOVEMENT_PLAYER', 	'MODIFIER_PLAYER_UNITS_ATTACH_MODIFIER', 0, 0, NULL, 'QUO_REQSET_CREE_PEACE') ;


INSERT INTO ModifierArguments
	(ModifierId, 			Name, 		Type, 			Value, 					Extra, 	SecondExtra)
VALUES	('QUO_CREE_TROOP_MOVEMENT', 	'Amount', 	'ARGTYPE_IDENTITY', 	'3',					NULL, 	NULL) ,	
		('QUO_CREE_TROOP_MOVEMENT_PLAYER', 	'ModifierId', 	'ARGTYPE_IDENTITY', 	'QUO_CREE_TROOP_MOVEMENT',		NULL, 	NULL)  ;


INSERT INTO TraitModifiers
		(TraitType, 		ModifierId)
VALUES 	('TRAIT_LEADER_ALLIANCE_AND_TRADE',	'QUO_CREE_TROOP_MOVEMENT_PLAYER'); */



-- GEORGIA


UPDATE tblQuoDebug SET Message = 'GEORGIA' WHERE DebugId='Quo_Civ_Code' ;

-- Buy government buildings with Faith
-- Does not work, due to inner workings of governments
/*INSERT INTO Modifiers 
	(ModifierId, 	ModifierType, 	RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
VALUES	('QUO_GEORGIA_FAITH_BUYS_GOVT', 	'MODIFIER_CITY_ENABLE_BUILDING_FAITH_PURCHASE', 0, 0, NULL, NULL) ,
('QUO_GEORGIA_FAITH_BUYS_GOVT_PLAYER', 	'MODIFIER_PLAYER_CITIES_ATTACH_MODIFIER', 0, 0, NULL, NULL) ;

INSERT INTO ModifierArguments
	(ModifierId, 			Name, 		Type, 			Value, 					Extra, 	SecondExtra)
VALUES	('QUO_GEORGIA_FAITH_BUYS_GOVT', 	'DistrictType', 	'ARGTYPE_IDENTITY', 	'DISTRICT_COMMERCIAL_HUB',					NULL, 	NULL) ,
('QUO_GEORGIA_FAITH_BUYS_GOVT_PLAYER', 	'ModifierId', 	'ARGTYPE_IDENTITY', 	'QUO_GEORGIA_FAITH_BUYS_GOVT',					NULL, 	NULL) ;


INSERT INTO TraitModifiers
	(TraitType, 		ModifierId)
VALUES ('TRAIT_LEADER_RELIGION_CITY_STATES',	'QUO_GEORGIA_FAITH_BUYS_GOVT') ;*/



DELETE FROM BuildingPrereqs WHERE Building='BUILDING_TSIKHE' AND PrereqBuilding='BUILDING_CASTLE' ;


-- Extra Faith to tiles surrounding a government district
INSERT INTO Requirements
	(RequirementId, 		RequirementType, 	Likeliness,	Inverse, 	Triggered)
VALUES	('QUO_REQ_GEORGIA_ADJ_GOVT_DIST', 	'REQUIREMENT_PLOT_ADJACENT_DISTRICT_TYPE_MATCHES',	0,0,0)  ,
		('QUO_REQ_GEORGIA_ADJ_GOVT_DIST_TIER2', 	'REQUIREMENT_PLOT_ADJACENT_DISTRICT_TYPE_MATCHES',	0,0,0)  ,
		('QUO_REQ_GEORGIA_ADJ_GOVT_DIST_TIER3', 	'REQUIREMENT_PLOT_ADJACENT_DISTRICT_TYPE_MATCHES',	0,0,0)  ,
		('QUO_REQ_GEORGIA_ADJ_GOVT_DIST_TIER4', 	'REQUIREMENT_PLOT_ADJACENT_DISTRICT_TYPE_MATCHES',	0,0,0)  ;

INSERT INTO RequirementArguments 
	(RequirementId,			Name, 			Type, 			Value, 				Extra, 	SecondExtra)
VALUES 	('QUO_REQ_GEORGIA_ADJ_GOVT_DIST',	'DistrictType',	'ARGTYPE_IDENTITY',	'DISTRICT_GOVERNMENT',	NULL,	NULL 	) ,
		('QUO_REQ_GEORGIA_ADJ_GOVT_DIST',	'MaxRange',		'ARGTYPE_IDENTITY',		'1',	NULL,	NULL 	) ,
		('QUO_REQ_GEORGIA_ADJ_GOVT_DIST',	'MinRange',		'ARGTYPE_IDENTITY',		'1',	NULL,	NULL 	) ,
		
		-- extend the radius
		('QUO_REQ_GEORGIA_ADJ_GOVT_DIST_TIER2',	'DistrictType',	'ARGTYPE_IDENTITY',	'DISTRICT_GOVERNMENT',	NULL,	NULL 	) ,
		('QUO_REQ_GEORGIA_ADJ_GOVT_DIST_TIER2',	'MaxRange',		'ARGTYPE_IDENTITY',		'2',	NULL,	NULL 	) ,
		('QUO_REQ_GEORGIA_ADJ_GOVT_DIST_TIER2',	'MinRange',		'ARGTYPE_IDENTITY',		'2',	NULL,	NULL 	) ,	 
		
		-- extend the radius and increase intensity
		('QUO_REQ_GEORGIA_ADJ_GOVT_DIST_TIER3',	'DistrictType',	'ARGTYPE_IDENTITY',	'DISTRICT_GOVERNMENT',	NULL,	NULL 	) ,
		('QUO_REQ_GEORGIA_ADJ_GOVT_DIST_TIER3',	'MaxRange',		'ARGTYPE_IDENTITY',		'3',	NULL,	NULL 	) ,
		('QUO_REQ_GEORGIA_ADJ_GOVT_DIST_TIER3',	'MinRange',		'ARGTYPE_IDENTITY',		'2',	NULL,	NULL 	) ,
		
		-- extend the radius and increase intensity
		('QUO_REQ_GEORGIA_ADJ_GOVT_DIST_TIER4',	'DistrictType',	'ARGTYPE_IDENTITY',	'DISTRICT_GOVERNMENT',	NULL,	NULL 	) ,
		('QUO_REQ_GEORGIA_ADJ_GOVT_DIST_TIER4',	'MaxRange',		'ARGTYPE_IDENTITY',		'4',	NULL,	NULL 	) ,
		('QUO_REQ_GEORGIA_ADJ_GOVT_DIST_TIER4',	'MinRange',		'ARGTYPE_IDENTITY',		'3',	NULL,	NULL 	) ;


INSERT INTO RequirementSets 
	(RequirementSetId, 		RequirementSetType)
VALUES 	('QUO_REQSET_GEORGIA_ADJ_GOVT_DIST', 	'REQUIREMENTSET_TEST_ALL') ,

		('QUO_REQSET_GEORGIA_ADJ_GOVT_DIST_TIER2', 	'REQUIREMENTSET_TEST_ALL') ,
		('QUO_REQSET_GEORGIA_ADJ_GOVT_DIST_TIER2_BROADCAST', 	'REQUIREMENTSET_TEST_ANY') ,
		
		('QUO_REQSET_GEORGIA_ADJ_GOVT_DIST_TIER3', 	'REQUIREMENTSET_TEST_ALL') ,
		('QUO_REQSET_GEORGIA_ADJ_GOVT_DIST_TIER3_BROADCAST', 	'REQUIREMENTSET_TEST_ANY') ,
		
		('QUO_REQSET_GEORGIA_ADJ_GOVT_DIST_TIER4', 	'REQUIREMENTSET_TEST_ALL') ,
		('QUO_REQSET_GEORGIA_ADJ_GOVT_DIST_TIER4_BROADCAST', 	'REQUIREMENTSET_TEST_ANY') ;

		
INSERT INTO RequirementSetRequirements
	(RequirementSetId,	RequirementId)
VALUES	('QUO_REQSET_GEORGIA_ADJ_GOVT_DIST', 	'QUO_REQ_GEORGIA_ADJ_GOVT_DIST') ,

		('QUO_REQSET_GEORGIA_ADJ_GOVT_DIST_TIER2', 	'QUO_REQ_GEORGIA_ADJ_GOVT_DIST_TIER2') ,
		('QUO_REQSET_GEORGIA_ADJ_GOVT_DIST_TIER2_BROADCAST', 	'PLAYER_HAS_GOV_BUILDING_TALL_REQUIREMENT') ,
		('QUO_REQSET_GEORGIA_ADJ_GOVT_DIST_TIER2_BROADCAST', 	'PLAYER_HAS_GOV_BUILDING_WIDE_REQUIREMENT') ,
		('QUO_REQSET_GEORGIA_ADJ_GOVT_DIST_TIER2_BROADCAST', 	'PLAYER_HAS_GOV_BUILDING_CONQUEST_REQUIREMENT') ,

		('QUO_REQSET_GEORGIA_ADJ_GOVT_DIST_TIER3', 	'QUO_REQ_GEORGIA_ADJ_GOVT_DIST_TIER3') ,
		('QUO_REQSET_GEORGIA_ADJ_GOVT_DIST_TIER3_BROADCAST', 	'PLAYER_HAS_GOV_BUILDING_CITYSTATES_REQUIREMENT') ,
		('QUO_REQSET_GEORGIA_ADJ_GOVT_DIST_TIER3_BROADCAST', 	'PLAYER_HAS_GOV_BUILDING_FAITH_REQUIREMENT') ,
		('QUO_REQSET_GEORGIA_ADJ_GOVT_DIST_TIER3_BROADCAST', 	'PLAYER_HAS_GOV_BUILDING_SPIES_REQUIREMENT') ,
		
		('QUO_REQSET_GEORGIA_ADJ_GOVT_DIST_TIER4', 	'QUO_REQ_GEORGIA_ADJ_GOVT_DIST_TIER4') ,
		('QUO_REQSET_GEORGIA_ADJ_GOVT_DIST_TIER4_BROADCAST', 	'PLAYER_HAS_GOV_BUILDING_MILITARY_REQUIREMENT') ,
		('QUO_REQSET_GEORGIA_ADJ_GOVT_DIST_TIER4_BROADCAST', 	'PLAYER_HAS_GOV_BUILDING_SCIENCE_REQUIREMENT') ,
		('QUO_REQSET_GEORGIA_ADJ_GOVT_DIST_TIER4_BROADCAST', 	'PLAYER_HAS_GOV_BUILDING_CULTURE_REQUIREMENT') ;
		
		
	

INSERT INTO Modifiers 
		(ModifierId, ModifierType, RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
VALUES	('QUO_GEORGIA_PLAZA', 'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD', 0, 0, NULL, 'QUO_REQSET_GEORGIA_ADJ_GOVT_DIST') ,
		('QUO_GEORGIA_PLAZA_PLAYER', 	'MODIFIER_PLAYER_CITIES_ATTACH_MODIFIER', 0, 0, NULL, NULL) ,
		('QUO_GEORGIA_PLAZA_PROD', 'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD', 0, 0, NULL, 'QUO_REQSET_GEORGIA_ADJ_GOVT_DIST') ,
		('QUO_GEORGIA_PLAZA_PROD_PLAYER', 	'MODIFIER_PLAYER_CITIES_ATTACH_MODIFIER', 0, 0, NULL, NULL) ,
		
		('QUO_GEORGIA_PLAZA_TIER2', 'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD', 0, 0, NULL, 'QUO_REQSET_GEORGIA_ADJ_GOVT_DIST_TIER2') ,
		('QUO_GEORGIA_PLAZA_PLAYER_TIER2', 	'MODIFIER_PLAYER_CITIES_ATTACH_MODIFIER', 0, 0, NULL, 'QUO_REQSET_GEORGIA_ADJ_GOVT_DIST_TIER2_BROADCAST') ,
		('QUO_GEORGIA_PLAZA_PROD_TIER2', 'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD', 0, 0, NULL, 'QUO_REQSET_GEORGIA_ADJ_GOVT_DIST_TIER2') ,
		('QUO_GEORGIA_PLAZA_PROD_PLAYER_TIER2', 	'MODIFIER_PLAYER_CITIES_ATTACH_MODIFIER', 0, 0, NULL, 'QUO_REQSET_GEORGIA_ADJ_GOVT_DIST_TIER2_BROADCAST') ,
		
		('QUO_GEORGIA_PLAZA_TIER3', 'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD', 0, 0, NULL, 'QUO_REQSET_GEORGIA_ADJ_GOVT_DIST_TIER3') ,
		('QUO_GEORGIA_PLAZA_PLAYER_TIER3', 	'MODIFIER_PLAYER_CITIES_ATTACH_MODIFIER', 0, 0, NULL, 'QUO_REQSET_GEORGIA_ADJ_GOVT_DIST_TIER3_BROADCAST') ,
		('QUO_GEORGIA_PLAZA_PROD_TIER3', 'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD', 0, 0, NULL, 'QUO_REQSET_GEORGIA_ADJ_GOVT_DIST_TIER3') ,
		('QUO_GEORGIA_PLAZA_PROD_PLAYER_TIER3', 	'MODIFIER_PLAYER_CITIES_ATTACH_MODIFIER', 0, 0, NULL, 'QUO_REQSET_GEORGIA_ADJ_GOVT_DIST_TIER3_BROADCAST') ,
		
		('QUO_GEORGIA_PLAZA_TIER4', 'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD', 0, 0, NULL, 'QUO_REQSET_GEORGIA_ADJ_GOVT_DIST_TIER4') ,
		('QUO_GEORGIA_PLAZA_PLAYER_TIER4', 	'MODIFIER_PLAYER_CITIES_ATTACH_MODIFIER', 0, 0, NULL, 'QUO_REQSET_GEORGIA_ADJ_GOVT_DIST_TIER4_BROADCAST') ,
		('QUO_GEORGIA_PLAZA_PROD_TIER4', 'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD', 0, 0, NULL, 'QUO_REQSET_GEORGIA_ADJ_GOVT_DIST_TIER4') ,
		('QUO_GEORGIA_PLAZA_PROD_PLAYER_TIER4', 	'MODIFIER_PLAYER_CITIES_ATTACH_MODIFIER', 0, 0, NULL, 'QUO_REQSET_GEORGIA_ADJ_GOVT_DIST_TIER4_BROADCAST') ;
		
 
INSERT INTO ModifierArguments
		(ModifierId, 			Name, 		Type, 			Value, 			Extra, 	SecondExtra)
VALUES	('QUO_GEORGIA_PLAZA', 	'Amount', 	'ARGTYPE_IDENTITY', 	'1',			NULL, 	NULL),
		('QUO_GEORGIA_PLAZA', 	'YieldType', 	'ARGTYPE_IDENTITY', 	'YIELD_FAITH',			NULL, 	NULL) ,
		('QUO_GEORGIA_PLAZA_PLAYER', 	'ModifierId', 	'ARGTYPE_IDENTITY', 	'QUO_GEORGIA_PLAZA',		NULL, 	NULL)  ,
		('QUO_GEORGIA_PLAZA_PROD', 	'Amount', 	'ARGTYPE_IDENTITY', 	'1',			NULL, 	NULL),
		('QUO_GEORGIA_PLAZA_PROD', 	'YieldType', 	'ARGTYPE_IDENTITY', 	'YIELD_PRODUCTION',			NULL, 	NULL) ,
		('QUO_GEORGIA_PLAZA_PROD_PLAYER', 	'ModifierId', 	'ARGTYPE_IDENTITY', 	'QUO_GEORGIA_PLAZA_PROD',		NULL, 	NULL)  ,
		
		('QUO_GEORGIA_PLAZA_TIER2', 	'Amount', 	'ARGTYPE_IDENTITY', 	'1',			NULL, 	NULL),
		('QUO_GEORGIA_PLAZA_TIER2', 	'YieldType', 	'ARGTYPE_IDENTITY', 	'YIELD_FAITH',			NULL, 	NULL) ,
		('QUO_GEORGIA_PLAZA_PLAYER_TIER2', 	'ModifierId', 	'ARGTYPE_IDENTITY', 	'QUO_GEORGIA_PLAZA_TIER2',		NULL, 	NULL)  ,
		('QUO_GEORGIA_PLAZA_PROD_TIER2', 	'Amount', 	'ARGTYPE_IDENTITY', 	'1',			NULL, 	NULL),
		('QUO_GEORGIA_PLAZA_PROD_TIER2', 	'YieldType', 	'ARGTYPE_IDENTITY', 	'YIELD_PRODUCTION',			NULL, 	NULL) ,
		('QUO_GEORGIA_PLAZA_PROD_PLAYER_TIER2', 	'ModifierId', 	'ARGTYPE_IDENTITY', 	'QUO_GEORGIA_PLAZA_PROD_TIER2',		NULL, 	NULL)  ,		
		
		('QUO_GEORGIA_PLAZA_TIER3', 	'Amount', 	'ARGTYPE_IDENTITY', 	'1',			NULL, 	NULL),
		('QUO_GEORGIA_PLAZA_TIER3', 	'YieldType', 	'ARGTYPE_IDENTITY', 	'YIELD_FAITH',			NULL, 	NULL) ,
		('QUO_GEORGIA_PLAZA_PLAYER_TIER3', 	'ModifierId', 	'ARGTYPE_IDENTITY', 	'QUO_GEORGIA_PLAZA_TIER3',		NULL, 	NULL)  ,
		('QUO_GEORGIA_PLAZA_PROD_TIER3', 	'Amount', 	'ARGTYPE_IDENTITY', 	'1',			NULL, 	NULL),
		('QUO_GEORGIA_PLAZA_PROD_TIER3', 	'YieldType', 	'ARGTYPE_IDENTITY', 	'YIELD_PRODUCTION',			NULL, 	NULL) ,
		('QUO_GEORGIA_PLAZA_PROD_PLAYER_TIER3', 	'ModifierId', 	'ARGTYPE_IDENTITY', 	'QUO_GEORGIA_PLAZA_PROD_TIER3',		NULL, 	NULL)  ,
		
		('QUO_GEORGIA_PLAZA_TIER4', 	'Amount', 	'ARGTYPE_IDENTITY', 	'1',			NULL, 	NULL),
		('QUO_GEORGIA_PLAZA_TIER4', 	'YieldType', 	'ARGTYPE_IDENTITY', 	'YIELD_FAITH',			NULL, 	NULL) ,
		('QUO_GEORGIA_PLAZA_PLAYER_TIER4', 	'ModifierId', 	'ARGTYPE_IDENTITY', 	'QUO_GEORGIA_PLAZA_TIER4',		NULL, 	NULL)  ,
		('QUO_GEORGIA_PLAZA_PROD_TIER4', 	'Amount', 	'ARGTYPE_IDENTITY', 	'1',			NULL, 	NULL),
		('QUO_GEORGIA_PLAZA_PROD_TIER4', 	'YieldType', 	'ARGTYPE_IDENTITY', 	'YIELD_PRODUCTION',			NULL, 	NULL) ,
		('QUO_GEORGIA_PLAZA_PROD_PLAYER_TIER4', 	'ModifierId', 	'ARGTYPE_IDENTITY', 	'QUO_GEORGIA_PLAZA_PROD_TIER4',		NULL, 	NULL)  ;
		
		
		
	
INSERT INTO TraitModifiers
		(TraitType, 			ModifierID)
VALUES	('TRAIT_LEADER_RELIGION_CITY_STATES',	'QUO_GEORGIA_PLAZA_PLAYER')  ,
		('TRAIT_LEADER_RELIGION_CITY_STATES',	'QUO_GEORGIA_PLAZA_PROD_PLAYER')  ,
		('TRAIT_LEADER_RELIGION_CITY_STATES',	'QUO_GEORGIA_PLAZA_PLAYER_TIER2')  ,
		('TRAIT_LEADER_RELIGION_CITY_STATES',	'QUO_GEORGIA_PLAZA_PROD_PLAYER_TIER2')  ,
		('TRAIT_LEADER_RELIGION_CITY_STATES',	'QUO_GEORGIA_PLAZA_PLAYER_TIER3')  ,
		('TRAIT_LEADER_RELIGION_CITY_STATES',	'QUO_GEORGIA_PLAZA_PROD_PLAYER_TIER3')  ,
		('TRAIT_LEADER_RELIGION_CITY_STATES',	'QUO_GEORGIA_PLAZA_PLAYER_TIER4')  ,
		('TRAIT_LEADER_RELIGION_CITY_STATES',	'QUO_GEORGIA_PLAZA_PROD_PLAYER_TIER4')  ;

 
 
-- Georgias special building comes free once you build Walls
INSERT INTO Requirements
	(RequirementId, 		RequirementType, 	Likeliness,	Inverse, 	Triggered)
VALUES	('QUO_REQ_GEORGIA_CITY_HAS_WALLS', 		'REQUIREMENT_CITY_HAS_BUILDING',	0,0,0) ,
('QUO_REQ_GEORGIA_HAS_TECH', 		'REQUIREMENT_PLAYER_HAS_TECHNOLOGY',	0,0,0) ;


INSERT INTO RequirementArguments 
	(RequirementId,			Name, 			Type, 			Value, 				Extra, 	SecondExtra)
VALUES 	('QUO_REQ_GEORGIA_CITY_HAS_WALLS',	'BuildingType',		'ARGTYPE_IDENTITY',	'BUILDING_WALLS',	NULL,	NULL 	) ,
		('QUO_REQ_GEORGIA_HAS_TECH',	'TechnologyType',		'ARGTYPE_IDENTITY',	'TECH_SIEGE_TACTICS',	NULL,	NULL 	) ;



INSERT INTO RequirementSets 
	(RequirementSetId, 		RequirementSetType)
VALUES 	('QUO_REQSET_GEORGIA_CITY_GETS_TSIKHE', 	'REQUIREMENTSET_TEST_ALL')    ;

INSERT INTO RequirementSetRequirements
	(RequirementSetId,	RequirementId)
VALUES	 ('QUO_REQSET_GEORGIA_CITY_GETS_TSIKHE', 	'QUO_REQ_GEORGIA_CITY_HAS_WALLS')  ,
 ('QUO_REQSET_GEORGIA_CITY_GETS_TSIKHE', 	'QUO_REQ_GEORGIA_HAS_TECH')  ;

 
 
-- Note: Uses the QUO_MODTYPE_GRANT_BUILDING_IN_CITY type of Modifier, established in global setup code
INSERT INTO Modifiers 
	(ModifierId, ModifierType, RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
VALUES	('QUO_GEORGIA_FREE_TSIKHE', 'QUO_MODTYPE_GRANT_BUILDING_IN_CITY', 1, 1, NULL, NULL) ,
		('QUO_GEORGIA_FREE_TSIKHE_PLAYER', 'MODIFIER_PLAYER_CITIES_ATTACH_MODIFIER', 0, 0, NULL, 'QUO_REQSET_GEORGIA_CITY_GETS_TSIKHE') ;

INSERT INTO ModifierArguments
	(ModifierId, 			Name, 		Type, 			Value, 			Extra, 	SecondExtra)
VALUES	('QUO_GEORGIA_FREE_TSIKHE', 	'BuildingType', 	'ARGTYPE_IDENTITY', 	'BUILDING_TSIKHE',			NULL, 	NULL) ,
		('QUO_GEORGIA_FREE_TSIKHE_PLAYER', 	'ModifierId', 	'ARGTYPE_IDENTITY', 	'QUO_GEORGIA_FREE_TSIKHE',			NULL, 	NULL) ;


INSERT INTO TraitModifiers
	(TraitType, 			ModifierID)
VALUES	('TRAIT_CIVILIZATION_GOLDEN_AGE_QUESTS',	'QUO_GEORGIA_FREE_TSIKHE_PLAYER')  ;  



-- Tested adding new beliefs for Georgia. Does not work yet--break the UI
/* INSERT INTO Modifiers 
	(ModifierId, ModifierType, RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
VALUES	('QUO_GEORGIA_FREE_BELIEF', 'MODIFIER_PLAYER_ADD_BELIEF', 1, 1, NULL, NULL)  ;

-- There is no evidence in the database that an Amount value is needed, adding here as guess work
INSERT INTO ModifierArguments
	(ModifierId, 			Name, 		Type, 			Value, 			Extra, 	SecondExtra)
VALUES	('QUO_GEORGIA_FREE_BELIEF', 	'Amount', 	'ARGTYPE_IDENTITY', 	'1',			NULL, 	NULL)  ;


INSERT INTO TraitModifiers
	(TraitType, 			ModifierID)
VALUES	('TRAIT_CIVILIZATION_GOLDEN_AGE_QUESTS',	'QUO_GEORGIA_FREE_BELIEF')  ;   */




-- NETHERLANDS

UPDATE tblQuoDebug SET Message = 'NETHERLANDS' WHERE DebugId='Quo_Civ_Code' ;

INSERT OR IGNORE INTO StartBiasTerrains
	(CivilizationType, TerrainType, Tier)
VALUES ('CIVILIZATION_NETHERLANDS', 'TERRAIN_TUNDRA', 3),
		('CIVILIZATION_NETHERLANDS', 'TERRAIN_TUNDRA_HILLS', 3);

--UPDATE Improvements SET ValidAdjacentTerrainAmount =2 WHERE ImprovementType='IMPROVEMENT_POLDER' ;

-- Make hills valid terrain for polders
INSERT OR IGNORE INTO Improvement_ValidAdjacentTerrains
	(ImprovementType, TerrainType)
VALUES ('IMPROVEMENT_POLDER', 'TERRAIN_DESERT_HILLS'),
		('IMPROVEMENT_POLDER', 'TERRAIN_GRASS_HILLS'),
		('IMPROVEMENT_POLDER', 'TERRAIN_PLAINS_HILLS'),
		('IMPROVEMENT_POLDER', 'TERRAIN_TUNDRA_HILLS') ,
		('IMPROVEMENT_POLDER', 'TERRAIN_SNOW_HILLS') ,
		('IMPROVEMENT_POLDER', 'TERRAIN_GRASS_MOUNTAIN') ,
		('IMPROVEMENT_POLDER', 'TERRAIN_PLAINS_MOUNTAIN') ,
		('IMPROVEMENT_POLDER', 'TERRAIN_DESERT_MOUNTAIN') ,
		('IMPROVEMENT_POLDER', 'TERRAIN_TUNDRA_MOUNTAIN') ,
		('IMPROVEMENT_POLDER', 'TERRAIN_SNOW_MOUNTAIN') ;
								

		
 
 
-- SCOTLAND

UPDATE tblQuoDebug SET Message = 'SCOTLAND' WHERE DebugId='Quo_Civ_Code' ;

-- Free walls when you conquer a city, even if the city does not have an Encampment
INSERT INTO Modifiers 
	(ModifierId, ModifierType, RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
VALUES	('QUO_SCOTLAND_CITY_CAPTURE', 'QUO_MODTYPE_GRANT_BUILDING_IN_CITY', 1, 1, NULL, NULL) ,
		('QUO_SCOTLAND_CITY_CAPTURE_PLAYER', 'MODIFIER_PLAYER_CAPTURED_CITY_ATTACH_MODIFIER', 0, 0, NULL, NULL) ;

		
INSERT INTO ModifierArguments
	(ModifierId, 			Name, 		Type, 			Value, 			Extra, 	SecondExtra)
VALUES	('QUO_SCOTLAND_CITY_CAPTURE', 	'BuildingType', 	'ARGTYPE_IDENTITY', 	'BUILDING_WALLS',			NULL, 	NULL)  ,
		('QUO_SCOTLAND_CITY_CAPTURE_PLAYER', 	'ModifierId', 	'ARGTYPE_IDENTITY', 	'QUO_SCOTLAND_CITY_CAPTURE',			NULL, 	NULL) ;

		
INSERT INTO TraitModifiers
	(TraitType, 			ModifierID)
VALUES	('TRAIT_LEADER_BANNOCKBURN',	'QUO_SCOTLAND_CITY_CAPTURE_PLAYER') ;   
 
 
-- Nerf free Production and Science for Ecastatic cities
UPDATE ModifierArguments SET Value='5' WHERE ModifierID='TRAIT_PRODUCTION_ECSTATIC' AND Name='Amount' ;
UPDATE ModifierArguments SET Value='5' WHERE ModifierID='TRAIT_SCIENCE_ECSTATIC' AND Name='Amount' ;
UPDATE ModifierArguments SET Value='1' WHERE ModifierID='TRAIT_ENGINEER_ECSTATIC' AND Name='Amount' ;
UPDATE ModifierArguments SET Value='1' WHERE ModifierID='TRAIT_SCIENTIST_ECSTATIC' AND Name='Amount' ;




 
 
 
-- MONGOLIA 

UPDATE tblQuoDebug SET Message = 'MONGOLIA' WHERE DebugId='Quo_Civ_Code' ;


/* 
-- Anyone at war with Genghis Khan loses -2 loyalty per turn in all cities

--In v7.0.10 this ability moved to the Mapuche

INSERT INTO Requirements
	(RequirementId, 		RequirementType, 	Likeliness,	Inverse, 	Triggered)
VALUES	('QUO_REQ_MONGOLIA_AT_WAR', 		'REQUIREMENT_PLAYER_IS_AT_PEACE',	0,1,0) ,
		('QUO_REQ_MONGOLIA_HAS_MET', 		'REQUIREMENT_PLAYER_HAS_MET',	0,0,0) ;

-- no arguments

INSERT INTO RequirementSets 
	(RequirementSetId, 		RequirementSetType)
VALUES 	('QUO_REQSET_MONGOLIA_DEBUFF', 	'REQUIREMENTSET_TEST_ALL')    ;

INSERT INTO RequirementSetRequirements
	(RequirementSetId,	RequirementId)
VALUES	 ('QUO_REQSET_MONGOLIA_DEBUFF', 	'QUO_REQ_MONGOLIA_AT_WAR')  ,
		('QUO_REQSET_MONGOLIA_DEBUFF', 	'QUO_REQ_MONGOLIA_HAS_MET')   ;
 
 
 

INSERT INTO Modifiers 
	(ModifierId, ModifierType, RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
VALUES	('QUO_MONGOLIA_LOYALTY', 'MODIFIER_PLAYER_CITIES_ADJUST_IDENTITY_PER_TURN', 0, 0, NULL, NULL) ,
		('QUO_MONGOLIA_LOYALTY_GLOBAL', 'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER', 0, 0, NULL, 'QUO_REQSET_MONGOLIA_DEBUFF') ;

INSERT INTO ModifierArguments
	(ModifierId, 			Name, 		Type, 			Value, 			Extra, 	SecondExtra)
VALUES	('QUO_MONGOLIA_LOYALTY', 	'Amount', 	'ARGTYPE_IDENTITY', 	'-2',			NULL, 	NULL) ,
		('QUO_MONGOLIA_LOYALTY_GLOBAL', 	'ModifierId', 	'ARGTYPE_IDENTITY', 	'QUO_MONGOLIA_LOYALTY',			NULL, 	NULL) ;	

INSERT INTO TraitModifiers
	(TraitType, 			ModifierID)
VALUES	('TRAIT_LEADER_GENGHIS_KHAN_ABILITY',	'QUO_MONGOLIA_LOYALTY_GLOBAL') ;   

 
UPDATE tblQuoDebug SET Message = 'START DLC' WHERE DebugId='Quo_Civ_Code' ;

*/


-- KOREA

UPDATE tblQuoDebug SET Message = 'START KOREA' WHERE DebugId='Quo_Civ_Code' ;


-- Korea has 10% less science and culture in cities without Governors, rising to +10% when they have Governors 
UPDATE ModifierArguments SET Value='20' WHERE ModifierID='TRAIT_ADJUST_CITY_CULTURE_MODIFIER' AND Name='Amount' ;
UPDATE ModifierArguments SET Value='20' WHERE ModifierID='TRAIT_ADJUST_CITY_SCIENCE_MODIFIER' AND Name='Amount' ;

INSERT INTO Modifiers 
	(ModifierId, ModifierType, RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
VALUES	('QUO_KOREA_SCIENCE_PENALTY', 'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_MODIFIER', 0, 0, NULL, NULL) ,
		('QUO_KOREA_CULTURE_PENALTY', 'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_MODIFIER', 0, 0, NULL, NULL) ;

INSERT INTO ModifierArguments
	(ModifierId, 			Name, 		Type, 			Value, 			Extra, 	SecondExtra)
VALUES	('QUO_KOREA_SCIENCE_PENALTY', 	'Amount', 	'ARGTYPE_IDENTITY', 	'-10',			NULL, 	NULL)  ,
		('QUO_KOREA_CULTURE_PENALTY', 	'Amount', 	'ARGTYPE_IDENTITY', 	'-10',			NULL, 	NULL) ;	

INSERT INTO TraitModifiers
	(TraitType, 			ModifierID)
VALUES	('TRAIT_LEADER_HWARANG',	'QUO_KOREA_SCIENCE_PENALTY') ,
('TRAIT_LEADER_HWARANG',	'QUO_KOREA_CULTURE_PENALTY') ;

 
 
-- Change science bonus to Mines to Faith

UPDATE ModifierArguments SET Value='YIELD_FAITH' WHERE ModifierID='TRAIT_MINES_SCIENCE_SEOWON' AND Value='YIELD_SCIENCE' ;
 
 
 
-- Free Governor
INSERT INTO Modifiers 
	(ModifierId, ModifierType, RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
VALUES	('QUO_KOREA_FREE_GOVERNOR', 'MODIFIER_PLAYER_ADJUST_GOVERNOR_POINTS', 0, 0, NULL, NULL) ;

INSERT INTO ModifierArguments
	(ModifierId, 			Name, 		Type, 			Value, 			Extra, 	SecondExtra)
VALUES	('QUO_KOREA_FREE_GOVERNOR', 	'Delta', 	'ARGTYPE_IDENTITY', 	'1',			NULL, 	NULL)   ;	

INSERT INTO TraitModifiers
	(TraitType, 			ModifierID)
VALUES	('TRAIT_LEADER_HWARANG',	'QUO_KOREA_FREE_GOVERNOR')  ;



-- Free starting science
-- Give Korea a burst of Science
-- We cant get just give them the science directly like we can with other yields, need to make sure there is a palace first 
INSERT INTO Requirements
	(RequirementId, 		RequirementType, 	Likeliness,	Inverse, 	Triggered)
VALUES	('QUO_REQ_KOREA_CITY_HAS_PALACE', 		'REQUIREMENT_CITY_HAS_BUILDING',	0,0,0) ;


INSERT INTO RequirementArguments 
	(RequirementId,			Name, 			Type, 			Value, 				Extra, 	SecondExtra)
VALUES 	('QUO_REQ_KOREA_CITY_HAS_PALACE',	'BuildingType',		'ARGTYPE_IDENTITY',	'BUILDING_PALACE',	NULL,	NULL 	)  ;


INSERT INTO RequirementSets 
	(RequirementSetId, 		RequirementSetType)
VALUES 	('QUO_REQSET_KOREA_FREE_SCIENCE_UNLOCK', 	'REQUIREMENTSET_TEST_ALL') ;


INSERT INTO RequirementSetRequirements
	(RequirementSetId,	RequirementId)
VALUES	 ('QUO_REQSET_KOREA_FREE_SCIENCE_UNLOCK', 	'QUO_REQ_KOREA_CITY_HAS_PALACE')  ; 


INSERT INTO Modifiers 
	(ModifierId, ModifierType, RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
VALUES	('QUO_KOREA_FREE_STARTING_SCIENCE', 'MODIFIER_PLAYER_GRANT_YIELD', 1, 1, NULL, NULL) ,
		('QUO_KOREA_FREE_STARTING_SCIENCE_PLAYER', 'MODIFIER_PLAYER_CITIES_ATTACH_MODIFIER', 0, 0, NULL, 	'QUO_REQSET_KOREA_FREE_SCIENCE_UNLOCK') ;


INSERT INTO ModifierArguments
	(ModifierId, 			Name, 			Type, 			Value, 		Extra, 	SecondExtra)
VALUES	('QUO_KOREA_FREE_STARTING_SCIENCE', 	'Amount', 	'ScaleByGameSpeed', 	'25',		NULL, 	NULL),
		('QUO_KOREA_FREE_STARTING_SCIENCE', 	'YieldType', 	'ARGTYPE_IDENTITY', 	'YIELD_SCIENCE',	NULL, 	NULL)  ,
		('QUO_KOREA_FREE_STARTING_SCIENCE_PLAYER', 	'ModifierId', 	'ARGTYPE_IDENTITY', 	'QUO_KOREA_FREE_STARTING_SCIENCE',	NULL, 	NULL)  ;
	


INSERT INTO TraitModifiers
	(TraitType, 			ModifierID)
VALUES	('TRAIT_CIVILIZATION_THREE_KINGDOMS',	'QUO_KOREA_FREE_STARTING_SCIENCE_PLAYER')  ;

 
 
 
 


-- ================================= DLC CIVS
UPDATE tblQuoDebug SET Message = 'AZTEC' WHERE DebugId='Quo_Civ_Code' ;

-- AZTEC


-- As of R&F, delete the super broken ability to instantly build districts with Builders
DELETE FROM TraitModifiers WHERE TraitType="TRAIT_CIVILIZATION_LEGEND_FIVE_SUNS" AND ModifierId="TRAIT_BUILDER_DISTRICT_PERCENT" ;



-- Tlachtli gives the City Center walls
-- Add the description tag to the game, bc Firaxis left it off in the gameplay database even tho it is in the config

UPDATE Buildings SET OuterDefenseStrength=2, OuterDefenseHitPoints=40, Description='LOC_BUILDING_TLACHTLI_DESCRIPTION' WHERE BuildingType='BUILDING_TLACHTLI' ;



-- Allow the Aztecs to build the Templo Mayor

INSERT INTO Types 
	(Type, 						Kind)
VALUES 	('QUO_TRAIT_CAN_BUILD_TEMPLO_MAYOR', 		'KIND_TRAIT') ;


INSERT INTO Traits 
	(TraitType,				Name,							Description,						InternalOnly)
VALUES ('QUO_TRAIT_CAN_BUILD_TEMPLO_MAYOR',	'LOC_QUO_TRAIT_CAN_BUILD_TEMPLO_MAYOR_NAME',		'LOC_QUO_TRAIT_CAN_BUILD_TEMPLO_MAYOR_DESCRIPTION',	0) ;


INSERT INTO CivilizationTraits 
	(CivilizationType, 		TraitType)
SELECT 	'CIVILIZATION_AZTEC',	'QUO_TRAIT_CAN_BUILD_TEMPLO_MAYOR'
	FROM Civilizations WHERE Civilizations.CivilizationType = 'CIVILIZATION_AZTEC' ;


INSERT INTO Types
	(Type, 				Kind)
VALUES 	('QUO_BUILDING_TEMPLO_MAYOR',	'KIND_BUILDING'	) ;


-- so I should probably have just put all the right values in here in the first-go round, but this took a while so was lazy and just inserted wrong data and then corrected it below
INSERT INTO Buildings 
	(BuildingType,Name,PrereqTech,PrereqCivic,Cost,MaxPlayerInstances,MaxWorldInstances,Capital,PrereqDistrict,AdjacentDistrict,Description,RequiresPlacement,RequiresRiver,OuterDefenseHitPoints,Housing,Entertainment,AdjacentResource,Coast,EnabledByReligion,AllowsHolyCity,PurchaseYield,MustPurchase,Maintenance,IsWonder,TraitType,OuterDefenseStrength,CitizenSlots,MustBeLake,MustNotBeLake,RegionalRange,AdjacentToMountain,ObsoleteEra,RequiresReligion,GrantFortification,DefenseModifier,InternalOnly,RequiresAdjacentRiver,Quote,QuoteAudio,MustBeAdjacentLand,AdvisorType)
VALUES( 'QUO_BUILDING_TEMPLO_MAYOR','QUO_LOC_TEMPLO_MAYOR_NAME',NULL,'CIVIC_CIVIL_SERVICE',710,-1,-1,0,NULL,NULL,NULL,0,0,NULL,0,1,NULL,NULL,0,0,NULL,0,1,0,NULL,0,NULL,0,0,0,0,'NO_ERA',0,0,0,0,0,NULL,NULL,0,'ADVISOR_GENERIC');


UPDATE Buildings SET MaxPlayerInstances='1' WHERE BuildingType='QUO_BUILDING_TEMPLO_MAYOR' ;
UPDATE Buildings SET IsWonder='1' WHERE BuildingType='QUO_BUILDING_TEMPLO_MAYOR' ;
UPDATE Buildings SET RequiresPlacement='1' WHERE BuildingType='QUO_BUILDING_TEMPLO_MAYOR' ;
UPDATE Buildings SET Description='QUO_LOC_TEMPLO_MAYOR_DESCRIPTION' WHERE BuildingType='QUO_BUILDING_TEMPLO_MAYOR' ;
UPDATE Buildings SET TraitType='QUO_TRAIT_CAN_BUILD_TEMPLO_MAYOR' WHERE BuildingType='QUO_BUILDING_TEMPLO_MAYOR' ;
UPDATE Buildings SET AllowsHolyCity='1' WHERE BuildingType='QUO_BUILDING_TEMPLO_MAYOR' ;




-- Half off the Aztec unique building after building the main temple
-- Removed in R&F
/* INSERT INTO Modifiers 
	(ModifierId, ModifierType, RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
VALUES	('QUO_AZTEC_CHEAP_TLACHTLI', 'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_PRODUCTION', 0, 0, NULL, NULL) ;


INSERT INTO ModifierArguments
	(ModifierId, 			Name, 		Type, 			Value, 			Extra, 	SecondExtra)
VALUES	('QUO_AZTEC_CHEAP_TLACHTLI', 	'Amount', 	'ARGTYPE_IDENTITY', 	'50',			NULL, 	NULL) , 
	('QUO_AZTEC_CHEAP_TLACHTLI', 	'BuildingType', 'ARGTYPE_IDENTITY', 	'BUILDING_TLACHTLI',	NULL, 	NULL) ;


INSERT INTO BuildingModifiers
	(BuildingType, 			ModifierID)
VALUES	('QUO_BUILDING_TEMPLO_MAYOR',	'QUO_AZTEC_CHEAP_TLACHTLI') ;
 */


-- Receive a free Builder when you complete an Entertainment District, after Templo Mayor is built
-- Removed in R&F
/* INSERT INTO Modifiers 
	(ModifierId, ModifierType, RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
VALUES	('QUO_AZTEC_FREE_UNIT', 'MODIFIER_PLAYER_DISTRICT_CREATE_UNIT', 0, 0, NULL, NULL) ;


INSERT INTO ModifierArguments
	(ModifierId, 			Name, 		Type, 			Value, 					Extra, 	SecondExtra)
VALUES	('QUO_AZTEC_FREE_UNIT', 	'DistrictType', 'ARGTYPE_IDENTITY', 	'DISTRICT_ENTERTAINMENT_COMPLEX',	NULL, 	NULL) ,  
	('QUO_AZTEC_FREE_UNIT', 	'UnitType', 	'ARGTYPE_IDENTITY', 	'UNIT_BUILDER',		NULL, 	NULL) ;

INSERT INTO BuildingModifiers
	(BuildingType, 			ModifierID)
SELECT	'QUO_BUILDING_TEMPLO_MAYOR',	'QUO_AZTEC_FREE_UNIT'
FROM Civilizations WHERE Civilizations.CivilizationType = 'CIVILIZATION_AZTEC' ; */



-- The Tribute unit
-- Removed in place of just lowering the number of charges that Builders get, which avoids a whole host of issues.
-- Assets still exist in other files in case this can be reused somewhere.

/*
INSERT INTO Types
	(Type, 				Kind)
VALUES 	('QUO_UNIT_TRIBUTE',		'KIND_UNIT'	) ;


INSERT INTO Units
	(UnitType,Name,BaseSightRange,BaseMoves,Combat,RangedCombat,Range,Bombard,Domain,FormationClass,Cost,PopulationCost,FoundCity,FoundReligion,MakeTradeRoute,EvangelizeBelief,LaunchInquisition,RequiresInquisition,BuildCharges,ReligiousStrength,ReligionEvictPercent,SpreadCharges,ExtractsArtifacts,Description,Flavor,CanCapture,CanRetreatWhenCaptured,TraitType,AllowBarbarians,CostProgressionModel,CostProgressionParam1,PromotionClass,InitialLevel,NumRandomChoices,PrereqTech,PrereqCivic,PrereqDistrict,PrereqPopulation,LeaderType,CanTrain,StrategicResource,PurchaseYield,MustPurchase,Maintenance,Stackable,AirSlots,CanTargetAir,PseudoYieldType,ZoneOfControl,AntiAirCombat,Spy,WMDCapable,ParkCharges,IgnoreMoves,TeamVisibility,ObsoleteTech,ObsoleteCivic,MandatoryObsoleteTech,MandatoryObsoleteCivic,AdvisorType)
VALUES	('QUO_UNIT_TRIBUTE','QUO_LOC_UNIT_TRIBUTE_NAME',5,10,0,0,0,0,'DOMAIN_LAND','FORMATION_CLASS_CIVILIAN',1,NULL,0,0,0,0,0,0,0,100,0,3,0,'QUO_LOC_UNIT_TRIBUTE_DESCRIPTION',NULL,0,0,NULL,0,'COST_PROGRESSION_PREVIOUS_COPIES',6,NULL,1,0,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,1,0,0,0,0,'PSEUDOYIELD_UNIT_RELIGIOUS',0,0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL) ;
*/


-- 

INSERT INTO Modifiers 
	(ModifierId, ModifierType, RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
VALUES	('QUO_AZTEC_BUILDER_NERF', 'MODIFIER_PLAYER_UNITS_ADJUST_BUILDER_CHARGES', 0, 0, NULL, NULL) ,
	('QUO_AZTEC_BUILDER_NERF_UNDO', 'MODIFIER_PLAYER_UNITS_ADJUST_BUILDER_CHARGES', 0, 0, NULL, NULL);


INSERT INTO ModifierArguments
	(ModifierId, 			Name, 		Type, 				Value, 		Extra, 	SecondExtra)
VALUES	('QUO_AZTEC_BUILDER_NERF', 	'Amount', 	'ARGTYPE_IDENTITY', 		'-1',		NULL, 	NULL) , 
	('QUO_AZTEC_BUILDER_NERF_UNDO', 	'Amount', 	'ARGTYPE_IDENTITY', 	'1',	NULL, 	NULL);

-- The nerf no longer applies in R&F
/* INSERT INTO TraitModifiers
	(TraitType, 			ModifierID)
SELECT 'TRAIT_CIVILIZATION_LEGEND_FIVE_SUNS',	'QUO_AZTEC_BUILDER_NERF' 
	FROM Civilizations WHERE Civilizations.CivilizationType = 'CIVILIZATION_AZTEC' ; */


/* INSERT INTO BuildingModifiers
	(BuildingType, 			ModifierID)
SELECT 'QUO_BUILDING_TEMPLO_MAYOR',	'QUO_AZTEC_BUILDER_NERF_UNDO' 
	FROM Civilizations WHERE Civilizations.CivilizationType = 'CIVILIZATION_AZTEC' ;  */


/* INSERT INTO Building_YieldChanges
	(BuildingType,			YieldType, 	YieldChange)
SELECT 'QUO_BUILDING_TEMPLO_MAYOR', 	'YIELD_FOOD',	-4	
FROM Civilizations WHERE Civilizations.CivilizationType = 'CIVILIZATION_AZTEC' ;  */




-- Forbid the Aztecs from building Cavalry
 
-- Create a table of forbidden units
-- Table of units to forbid, grab up to Industrial era and not any with a TraitType


-- removed in v6.0.11 in order to become a general trait of all Native American civs

/* CREATE TABLE tblQuoAztecsHorseUnits AS 
select unittype, technologies.eratype from units 
inner join technologies on technologies.TechnologyType = units.PrereqTech 
where promotionclass in  ("PROMOTION_CLASS_HEAVY_CAVALRY","PROMOTION_CLASS_LIGHT_CAVALRY") AND EraType in ("ERA_ANCIENT", "ERA_CLASSICAL", "ERA_MEDIEVAL", "ERA_RENAISSANCE", "ERA_INDUSTRIAL") AND TraitType IS NULL

union

select unittype, civics.EraType from units 
inner join civics on civics.CivicType = units.PrereqCivic
where promotionclass in  ("PROMOTION_CLASS_HEAVY_CAVALRY","PROMOTION_CLASS_LIGHT_CAVALRY") AND EraType in ("ERA_ANCIENT", "ERA_CLASSICAL", "ERA_MEDIEVAL", "ERA_RENAISSANCE", "ERA_INDUSTRIAL") AND TraitType IS NULL;



INSERT INTO Modifiers 
	(ModifierId, ModifierType, RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
SELECT 'QUO_AZTECS_CANNOT_BUILD_' || tblQuoAztecsHorseUnits.UnitType, 'MODIFIER_PLAYER_UNIT_BUILD_DISABLED', 0, 0, NULL, NULL
	FROM tblQuoAztecsHorseUnits;


INSERT INTO ModifierArguments
	(ModifierId, 			Name, 		Type, 			Value, 			Extra, 	SecondExtra)
SELECT 'QUO_AZTECS_CANNOT_BUILD_' || tblQuoAztecsHorseUnits.UnitType, 	'UnitType', 	'ARGTYPE_IDENTITY', 	tblQuoAztecsHorseUnits.UnitType,			NULL, 	NULL 
	FROM tblQuoAztecsHorseUnits;

	
INSERT INTO TraitModifiers
	(TraitType, 			ModifierID)
SELECT 'TRAIT_CIVILIZATION_LEGEND_FIVE_SUNS',	'QUO_AZTECS_CANNOT_BUILD_' || tblQuoAztecsHorseUnits.UnitType
	FROM tblQuoAztecsHorseUnits
		WHERE EXISTS (SELECT Civilizations.CivilizationType FROM Civilizations WHERE Civilizations.CivilizationType = 'CIVILIZATION_AZTEC' ) ;
	 */



-- Aztecs get free Faith on kill after building Templo Mayor, added in R&F
/* INSERT INTO Requirements
	(RequirementId, 		RequirementType, 	Likeliness,	Inverse, 	Triggered)
VALUES	('QUO_REQ_AZTEC_PLAYER_HAS_TEMPLO_MAYOR', 		'REQUIREMENT_PLAYER_HAS_BUILDING',	0,0,0) ;


INSERT INTO RequirementArguments 
	(RequirementId,			Name, 			Type, 			Value, 				Extra, 	SecondExtra)
VALUES 	('QUO_REQ_AZTEC_PLAYER_HAS_TEMPLO_MAYOR',	'BuildingType',		'ARGTYPE_IDENTITY',	'QUO_BUILDING_TEMPLO_MAYOR',	NULL,	NULL 	)  ;


INSERT INTO RequirementSets 
	(RequirementSetId, 		RequirementSetType)
VALUES 	('QUO_REQSET_AZTEC_PLAYER_FAITH_ON_KILL', 	'REQUIREMENTSET_TEST_ALL')    ;


INSERT INTO RequirementSetRequirements
	(RequirementSetId,	RequirementId)
VALUES	 ('QUO_REQSET_AZTEC_PLAYER_FAITH_ON_KILL', 	'QUO_REQ_AZTEC_PLAYER_HAS_TEMPLO_MAYOR')   ; */



INSERT INTO Requirements
	(RequirementId, 		RequirementType, 	Likeliness,	Inverse, 	Triggered)
VALUES	('QUO_REQ_AZTEC_ADJACENT_TEMPLO_MAYOR', 		'REQUIREMENT_PLOT_ADJACENT_BUILDING_TYPE_MATCHES',	0,0,0) ,
		('QUO_REQ_AZTEC_MET_TURNS_AGO', 		'REQUIREMENT_PLAYER_MET_X_TURNS_AGO',	0,0,0) ;


INSERT INTO RequirementArguments 
	(RequirementId,			Name, 			Type, 			Value, 				Extra, 	SecondExtra)
VALUES 	('QUO_REQ_AZTEC_ADJACENT_TEMPLO_MAYOR',	'BuildingType',		'ARGTYPE_IDENTITY',	'QUO_BUILDING_TEMPLO_MAYOR',	NULL,	NULL 	)  ,
		('QUO_REQ_AZTEC_ADJACENT_TEMPLO_MAYOR',	'MaxRange',		'ARGTYPE_IDENTITY',	'15',	NULL,	NULL 	)  ,
		('QUO_REQ_AZTEC_ADJACENT_TEMPLO_MAYOR',	'MinRange',		'ARGTYPE_IDENTITY',	'0',	NULL,	NULL 	)  ,
		('QUO_REQ_AZTEC_MET_TURNS_AGO',	'TurnsAgo',		'ARGTYPE_IDENTITY',	'1',	NULL,	NULL 	)  ;
		


INSERT INTO RequirementSets 
	(RequirementSetId, 		RequirementSetType)
VALUES 	('QUO_REQSET_AZTEC_TEMPLO_MAYOR_ADJACENCIES', 	'REQUIREMENTSET_TEST_ALL')    ,	
		('QUO_REQSET_AZTEC_TEMPLO_MAYOR_BROADCAST', 	'REQUIREMENTSET_TEST_ALL')    ;

INSERT INTO RequirementSetRequirements
	(RequirementSetId,	RequirementId)
VALUES	 ('QUO_REQSET_AZTEC_TEMPLO_MAYOR_ADJACENCIES', 	'QUO_REQ_AZTEC_ADJACENT_TEMPLO_MAYOR')   ,
		('QUO_REQSET_AZTEC_TEMPLO_MAYOR_BROADCAST', 	'QUO_REQ_AZTEC_MET_TURNS_AGO')   ;



-- Free Faith when killing a unit near the Templo Mayor
INSERT INTO Modifiers 
	(ModifierId, ModifierType, RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
VALUES	('QUO_AZTECS_FAITH_ON_KILL', 'MODIFIER_PLAYER_UNITS_ADJUST_POST_COMBAT_YIELD', 0, 0, NULL, 'QUO_REQSET_AZTEC_TEMPLO_MAYOR_ADJACENCIES') ;

		
INSERT INTO ModifierArguments
	(ModifierId, 			Name, 		Type, 			Value, 			Extra, 	SecondExtra)
VALUES	('QUO_AZTECS_FAITH_ON_KILL', 	'PercentDefeatedStrength', 	'ARGTYPE_IDENTITY', 	'100',			NULL, 	NULL) ,
		('QUO_AZTECS_FAITH_ON_KILL', 	'YieldType', 	'ARGTYPE_IDENTITY', 	'YIELD_FAITH',			NULL, 	NULL) ;

		
INSERT INTO TraitModifiers
	(TraitType, 			ModifierID)
SELECT	'TRAIT_CIVILIZATION_LEGEND_FIVE_SUNS',	'QUO_AZTECS_FAITH_ON_KILL'
FROM Civilizations WHERE Civilizations.CivilizationType = 'CIVILIZATION_AZTEC' ;



-- Loyalty debuff for nearby neighboring cities
-- This works by broadcasting the Modifier from the Aztecs to other players
INSERT INTO Modifiers 
	(ModifierId, ModifierType, RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
VALUES	('QUO_AZTEC_LOYALTY', 'MODIFIER_PLAYER_CITIES_ADJUST_IDENTITY_PER_TURN', 0, 0, NULL, 'QUO_REQSET_AZTEC_TEMPLO_MAYOR_ADJACENCIES') ,
		('QUO_AZTEC_LOYALTY_GLOBAL', 'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER', 0, 0, NULL, 'QUO_REQSET_AZTEC_TEMPLO_MAYOR_BROADCAST') ;

		
INSERT INTO ModifierArguments
	(ModifierId, 			Name, 		Type, 			Value, 			Extra, 	SecondExtra)
VALUES	('QUO_AZTEC_LOYALTY', 	'Amount', 	'ARGTYPE_IDENTITY', 	'-6',			NULL, 	NULL) ,
		('QUO_AZTEC_LOYALTY_GLOBAL', 	'ModifierId', 	'ARGTYPE_IDENTITY', 	'QUO_AZTEC_LOYALTY',			NULL, 	NULL) ;	

		
INSERT INTO TraitModifiers
	(TraitType, 			ModifierID)
SELECT	'TRAIT_CIVILIZATION_LEGEND_FIVE_SUNS',	'QUO_AZTEC_LOYALTY_GLOBAL'
FROM Civilizations WHERE Civilizations.CivilizationType = 'CIVILIZATION_AZTEC' ;  





/* REQUIREMENT_PLOT_ADJACENT_DISTRICT_TYPE_MATCHES
DistrictType
MaxRange
MinRange */


/* INSERT INTO Modifiers 
	(ModifierId, ModifierType, RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
VALUES	('QUO_AZTEC_LOYALTY', 'MODIFIER_PLAYER_DISTRICTS_ADJUST_YIELD_CHANGE', 1, 1, NULL, NULL) ,
		('QUO_AZTEC_LOYALTY_GLOBAL', 'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER', 0, 0, NULL, NULL) ;

INSERT INTO ModifierArguments
	(ModifierId, 			Name, 		Type, 			Value, 			Extra, 	SecondExtra)
VALUES	('QUO_AZTEC_LOYALTY', 	'Amount', 	'ARGTYPE_IDENTITY', 	'-200',			NULL, 	NULL) ,
		('QUO_AZTEC_LOYALTY_GLOBAL', 	'ModifierId', 	'ARGTYPE_IDENTITY', 	'QUO_AZTEC_LOYALTY',			NULL, 	NULL) ;	

INSERT INTO TraitModifiers
	(TraitType, 			ModifierID)
SELECT	'TRAIT_CIVILIZATION_LEGEND_FIVE_SUNS',	'QUO_AZTEC_LOYALTY_GLOBAL'
FROM Civilizations WHERE Civilizations.CivilizationType = 'CIVILIZATION_AZTEC' ; */




-- POLAND
-- Poland is DLC so be sure to check for existence in records before assigning anything to a trait, modifier, building or unit it installs
UPDATE tblQuoDebug SET Message = 'POLAND' WHERE DebugId='Quo_Civ_Code' ;


INSERT INTO RequirementSets 
	(RequirementSetId, 		RequirementSetType)
VALUES 	('QUO_REQSET_POLAND_SPEED_UP', 	'REQUIREMENTSET_TEST_ALL') ;

INSERT INTO RequirementSetRequirements
	(RequirementSetId,	RequirementId)
VALUES	('QUO_REQSET_POLAND_SPEED_UP', 	'REQUIREMENT_UNIT_IS_ANTI_CAV') ;

INSERT INTO Modifiers 
	(ModifierId, 	ModifierType, 	RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
VALUES	('QUO_POLAND_SPEED_UP', 	'MODIFIER_PLAYER_UNIT_ADJUST_MOVEMENT', 0, 0, NULL, NULL) ,
		('QUO_POLAND_SPEED_UP_GLOBAL', 	'MODIFIER_PLAYER_UNITS_ATTACH_MODIFIER', 0, 0, NULL, 'QUO_REQSET_POLAND_SPEED_UP') ;


INSERT INTO ModifierArguments
	(ModifierId, 			Name, 		Type, 			Value, 					Extra, 	SecondExtra)
VALUES	('QUO_POLAND_SPEED_UP', 	'Amount', 	'ARGTYPE_IDENTITY', 	'1',					NULL, 	NULL) ,	
		('QUO_POLAND_SPEED_UP_GLOBAL', 	'ModifierId', 	'ARGTYPE_IDENTITY', 	'QUO_POLAND_SPEED_UP',		NULL, 	NULL)  ;


-- Only apply the modifier if the player has Poland DLC
INSERT INTO TraitModifiers
	(TraitType, 		ModifierId)
SELECT 'TRAIT_CIVILIZATION_GOLDEN_LIBERTY',	'QUO_POLAND_SPEED_UP_GLOBAL' 
FROM Civilizations 
WHERE Civilizations.CivilizationType='CIVILIZATION_POLAND' ;




-- Can buy Commercial buildings with Faith
INSERT INTO Modifiers 
	(ModifierId, 	ModifierType, 	RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
VALUES	('QUO_POLAND_FAITH_BUYS_COMMERCE', 	'MODIFIER_CITY_ENABLE_BUILDING_FAITH_PURCHASE', 0, 0, NULL, NULL) ,
('QUO_POLAND_FAITH_BUYS_COMMERCE_PLAYER', 	'MODIFIER_PLAYER_CITIES_ATTACH_MODIFIER', 0, 0, NULL, NULL) ;

INSERT INTO ModifierArguments
	(ModifierId, 			Name, 		Type, 			Value, 					Extra, 	SecondExtra)
VALUES	('QUO_POLAND_FAITH_BUYS_COMMERCE', 	'DistrictType', 	'ARGTYPE_IDENTITY', 	'DISTRICT_COMMERCIAL_HUB',					NULL, 	NULL) ,
('QUO_POLAND_FAITH_BUYS_COMMERCE_PLAYER', 	'ModifierId', 	'ARGTYPE_IDENTITY', 	'QUO_POLAND_FAITH_BUYS_COMMERCE',					NULL, 	NULL) ;


-- Only apply the modifier if the player has Poland DLC
INSERT INTO TraitModifiers
	(TraitType, 		ModifierId)
SELECT 'TRAIT_LEADER_LITHUANIAN_UNION',	'QUO_POLAND_FAITH_BUYS_COMMERCE_PLAYER' 
FROM Civilizations 
WHERE Civilizations.CivilizationType='CIVILIZATION_POLAND' ;



-- Anti-Cav can move after attacking
-- This moved to the Biome level
/* INSERT INTO Types
	(Type, 				Kind)
VALUES 	('QUO_ABILITY_POLAND_MOVE_ATTACK',	'KIND_ABILITY'	) ;


INSERT INTO TypeTags
	(Type,					Tag)
VALUES  ('QUO_ABILITY_POLAND_MOVE_ATTACK', 		'CLASS_ANTI_CAVALRY') ;
 

INSERT INTO Modifiers 
	(ModifierId, 			ModifierType, 				RunOnce, 	Permanent, 	OwnerRequirementSetId, 	SubjectRequirementSetId)
VALUES	('QUO_UNIT_MODIFIER_MOVE_ATTACK', 		'MODIFIER_PLAYER_UNIT_ADJUST_ATTACK_AND_MOVE', 	0, 		0, 		NULL, 			NULL) ;


INSERT INTO ModifierArguments
	(ModifierId, 			Name, 		Type, 			Value, 		Extra, 	SecondExtra)
VALUES	('QUO_UNIT_MODIFIER_MOVE_ATTACK', 		'CanMove', 	'ARGTYPE_IDENTITY', 	'1',	NULL, 	NULL) ;


INSERT INTO UnitAbilities
	(UnitAbilityType,		Name,				Description,			Inactive)
VALUES	('QUO_ABILITY_POLAND_MOVE_ATTACK',	'QUO_LOC_POLAND_MOVE_ATTACK_NAME',		'QUO_LOC_POLAND_MOVE_ATTACK_DESC',	"1"	) ;


INSERT INTO UnitAbilityModifiers
	(UnitAbilityType, 			ModifierId)
VALUES 	('QUO_ABILITY_POLAND_MOVE_ATTACK', 		'QUO_UNIT_MODIFIER_MOVE_ATTACK');


INSERT INTO Modifiers 
	(ModifierId, 			ModifierType, 				RunOnce, 	Permanent, 	OwnerRequirementSetId, 	SubjectRequirementSetId)
VALUES	('QUO_NATION_POLAND_MOVE_ATTACK', 	'MODIFIER_PLAYER_UNITS_GRANT_ABILITY', 	0, 		1, 		NULL, 			NULL) ;


INSERT INTO ModifierArguments
	(ModifierId, 			Name, 		Type, 			Value, 		Extra, 	SecondExtra)
VALUES	('QUO_NATION_POLAND_MOVE_ATTACK', 	'AbilityType', 	'ARGTYPE_IDENTITY', 	'QUO_ABILITY_POLAND_MOVE_ATTACK',	NULL, 	NULL) ;


INSERT INTO TraitModifiers
	(TraitType, 		ModifierId)
SELECT 'TRAIT_CIVILIZATION_GOLDEN_LIBERTY',	'QUO_NATION_POLAND_MOVE_ATTACK' 
FROM Civilizations 
WHERE Civilizations.CivilizationType='CIVILIZATION_POLAND' ;



-- Anti-Cav disregard zone of control
-- Disregard Zone of Control
INSERT INTO Requirements
	(RequirementId, 		RequirementType, 	Likeliness,	Inverse, 	Triggered)
VALUES	('QUO_REQ_POLAND_UNIT_ANTI_CAV', 	'REQUIREMENT_UNIT_PROMOTION_CLASS_MATCHES',	0,0,0) ;


INSERT INTO RequirementArguments 
		(RequirementId,			Name, 			Type, 			Value, 		Extra, 	SecondExtra)
VALUES 	('QUO_REQ_POLAND_UNIT_ANTI_CAV',	'UnitType',		'ARGTYPE_IDENTITY',		'PROMOTION_CLASS_ANTI_CAVALRY',	NULL,	NULL 	) ;


INSERT INTO RequirementSets 
	(RequirementSetId, 		RequirementSetType)
VALUES 	('QUO_REQSET_POLAND_UNIT_ANTI_CAV', 	'REQUIREMENTSET_TEST_ANY') ;


-- reuse the existing RECON_UNITS requirement
INSERT INTO RequirementSetRequirements
	(RequirementSetId,	RequirementId)
VALUES	('QUO_REQSET_POLAND_UNIT_ANTI_CAV', 	'QUO_REQ_POLAND_UNIT_ANTI_CAV') ; 


INSERT INTO Modifiers 
	(ModifierId, 	ModifierType, 	RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
VALUES	('QUO_POLAND_IGNORE_ZOC', 	'MODIFIER_PLAYER_UNIT_ADJUST_IGNORE_ZOC', 0, 0, NULL, NULL) ,
	('QUO_POLAND_IGNORE_ZOC_GLOBAL', 	'MODIFIER_PLAYER_UNITS_ATTACH_MODIFIER', 0, 0, NULL, 'QUO_REQSET_POLAND_UNIT_ANTI_CAV') ;


INSERT INTO ModifierArguments
	(ModifierId, 			Name, 		Type, 			Value, 					Extra, 	SecondExtra)
VALUES	('QUO_POLAND_IGNORE_ZOC', 	'Ignore', 	'ARGTYPE_IDENTITY', 	'1',					NULL, 	NULL) ,	
	('QUO_POLAND_IGNORE_ZOC_GLOBAL', 	'ModifierId', 	'ARGTYPE_IDENTITY', 	'QUO_POLAND_IGNORE_ZOC',		NULL, 	NULL)  ;


INSERT INTO TraitModifiers
	(TraitType, 		ModifierId)
SELECT 'TRAIT_CIVILIZATION_GOLDEN_LIBERTY',	'QUO_POLAND_IGNORE_ZOC_GLOBAL' 
FROM Civilizations 
WHERE Civilizations.CivilizationType='CIVILIZATION_POLAND' ; */



-- KHMER
UPDATE tblQuoDebug SET Message = 'KHMER' WHERE DebugId='Quo_Civ_Code' ;

-- Removed in v7.0.10

/* INSERT INTO Types 
	(Type, 					Kind)
VALUES 	('QUO_TRAIT_KHMER_SANGHA_MONK', 		'KIND_TRAIT') ;

INSERT INTO Traits 
	(TraitType,			Name,						Description,						InternalOnly)
VALUES ('QUO_TRAIT_KHMER_SANGHA_MONK',	'LOC_QUO_TRAIT_KHMER_SANGHA_MONK_NAME',		NULL,		0) ;

INSERT INTO CivilizationTraits 
	(CivilizationType, 		TraitType)
SELECT 'CIVILIZATION_KHMER',	'QUO_TRAIT_KHMER_SANGHA_MONK' 
FROM Civilizations 
WHERE Civilizations.CivilizationType='CIVILIZATION_KHMER' ;
 */



-- Deep clone the Warrior Monk unit and turn it into a unique unit for Khmer
-- Removed in v7.0.10

/* INSERT INTO Types
	(Type, 				Kind)
VALUES 	('UNIT_QUO_INDONESIA_WARRIOR_MONK',		'KIND_UNIT'	) ;

INSERT INTO Units (
                      UnitType,
                      Name,
                      BaseSightRange,
                      BaseMoves,
                      Combat,
                      RangedCombat,
                      Range,
                      Bombard,
                      Domain,
                      FormationClass,
                      Cost,
                      PopulationCost,
                      FoundCity,
                      FoundReligion,
                      MakeTradeRoute,
                      EvangelizeBelief,
                      LaunchInquisition,
                      RequiresInquisition,
                      BuildCharges,
                      ReligiousStrength,
                      ReligionEvictPercent,
                      SpreadCharges,
                      ReligiousHealCharges,
                      ExtractsArtifacts,
                      Description,
                      Flavor,
                      CanCapture,
                      CanRetreatWhenCaptured,
                      TraitType,
                      AllowBarbarians,
                      CostProgressionModel,
                      CostProgressionParam1,
                      PromotionClass,
                      InitialLevel,
                      NumRandomChoices,
                      PrereqTech,
                      PrereqCivic,
                      PrereqDistrict,
                      PrereqPopulation,
                      LeaderType,
                      CanTrain,
                      StrategicResource,
                      PurchaseYield,
                      MustPurchase,
                      Maintenance,
                      Stackable,
                      AirSlots,
                      CanTargetAir,
                      PseudoYieldType,
                      ZoneOfControl,
                      AntiAirCombat,
                      Spy,
                      WMDCapable,
                      ParkCharges,
                      IgnoreMoves,
                      TeamVisibility,
                      ObsoleteTech,
                      ObsoleteCivic,
                      MandatoryObsoleteTech,
                      MandatoryObsoleteCivic,
                      AdvisorType,
                      EnabledByReligion,
                      TrackReligion
                  )
                  SELECT
                      'UNIT_QUO_INDONESIA_WARRIOR_MONK',
                      'LOC_QUO_UNIT_INDONESIA_WARRIOR_MONK_NAME',
                      BaseSightRange,
                      BaseMoves,
                      32, -- Combat
                      RangedCombat,
                      Range,
                      Bombard,
                      Domain,
                      FormationClass,
                      Cost,
                      PopulationCost,
                      FoundCity,
                      FoundReligion,
                      MakeTradeRoute,
                      EvangelizeBelief,
                      LaunchInquisition,
                      RequiresInquisition,
                      BuildCharges,
                      ReligiousStrength,
                      ReligionEvictPercent,
                      SpreadCharges,
                      ReligiousHealCharges,
                      ExtractsArtifacts,
                      'LOC_QUO_UNIT_INDONESIA_WARRIOR_MONK_DESCRIPTION',
                      Flavor,
                      CanCapture,
                      CanRetreatWhenCaptured,
                      'QUO_TRAIT_KHMER_SANGHA_MONK', -- TraitType
                      AllowBarbarians,
                      CostProgressionModel,
                      CostProgressionParam1,
                      PromotionClass,
                      InitialLevel,
                      NumRandomChoices,
                      PrereqTech,
                      PrereqCivic,
                      PrereqDistrict,
                      PrereqPopulation,
                      LeaderType,
                      CanTrain,
                      StrategicResource,
                      NULL, --PurchaseYield,
                      MustPurchase,
                      Maintenance,
                      Stackable,
                      AirSlots,
                      CanTargetAir,
                      PseudoYieldType,
                      ZoneOfControl,
                      AntiAirCombat,
                      Spy,
                      WMDCapable,
                      ParkCharges,
                      IgnoreMoves,
                      TeamVisibility,
                      ObsoleteTech,
                      ObsoleteCivic,
                      MandatoryObsoleteTech,
                      MandatoryObsoleteCivic,
                      AdvisorType,
                      EnabledByReligion,
                      TrackReligion
                  FROM Units WHERE Units.UnitType = 'UNIT_WARRIOR_MONK';


-- Create a unique tag for the new unit
INSERT INTO Tags 
	(Tag, 				Vocabulary)
VALUES 	('QUO_CLASS_SANGHA_MONK',	'ABILITY_CLASS'	) ;


INSERT INTO TypeTags
	(Type,				Tag)
VALUES	('UNIT_QUO_INDONESIA_WARRIOR_MONK', 		'QUO_CLASS_SANGHA_MONK') ;
 */

				  
				  
-- Free Sangha Monk when you build an Aqueduct
-- Removed in v7.0.10

/* INSERT INTO Modifiers 
	(ModifierId, 	ModifierType, 	RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
VALUES	('QUO_KHMER_FREE_SANGHA_MONK', 	'MODIFIER_PLAYER_DISTRICT_CREATE_UNIT', 0, 0, NULL, NULL)  ;

INSERT INTO ModifierArguments
	(ModifierId, 			Name, 		Type, 			Value, 					Extra, 	SecondExtra)
VALUES	('QUO_KHMER_FREE_SANGHA_MONK', 	'DistrictType', 	'ARGTYPE_IDENTITY', 	'DISTRICT_AQUEDUCT',					NULL, 	NULL) ,
		('QUO_KHMER_FREE_SANGHA_MONK', 	'UnitType', 	'ARGTYPE_IDENTITY', 	'UNIT_QUO_INDONESIA_WARRIOR_MONK',					NULL, 	NULL) ;

INSERT INTO TraitModifiers
	(TraitType, 		ModifierId)
SELECT 'TRAIT_CIVILIZATION_KHMER_BARAYS',	'QUO_KHMER_FREE_SANGHA_MONK' 
FROM Civilizations 
WHERE Civilizations.CivilizationType='CIVILIZATION_KHMER' ;
 */

-- Bonus to building Aqueducts
INSERT INTO Modifiers 
	(ModifierId, 	ModifierType, 	RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
VALUES 	('QUO_KHMER_FAST_AQUEDUCT', 'MODIFIER_PLAYER_CITIES_ADJUST_DISTRICT_PRODUCTION', 0, 0, NULL, NULL) ; 


INSERT INTO ModifierArguments
	(ModifierId, 			Name, 		Type, 			Value, 					Extra, 	SecondExtra)
VALUES	('QUO_KHMER_FAST_AQUEDUCT', 	'Amount', 		'ARGTYPE_IDENTITY', 	'100',				NULL, 	NULL) ,  
		('QUO_KHMER_FAST_AQUEDUCT', 	'DistrictType', 	'ARGTYPE_IDENTITY', 	'DISTRICT_AQUEDUCT',	NULL, 	NULL) ;
	
INSERT INTO TraitModifiers
	(TraitType, 		ModifierId)
SELECT 'TRAIT_CIVILIZATION_KHMER_BARAYS',	'QUO_KHMER_FAST_AQUEDUCT' 
FROM Civilizations 
WHERE Civilizations.CivilizationType='CIVILIZATION_KHMER' ;
	


-- Increase movement of unique unit
UPDATE Units SET BaseMoves=BaseMoves+1 WHERE UnitType='UNIT_KHMER_DOMREY' ;


-- Increase the Strength of all Warrior Monks for each Aqueduct
-- Removed in v7.0.10
/* INSERT INTO Requirements
		(RequirementId, 		RequirementType, 	Likeliness,	Inverse, 	Triggered)
VALUES	('QUO_REQ_KHMER_CITY_HAS_AQUEDUCT', 		'REQUIREMENT_CITY_HAS_DISTRICT',	0,0,0) ,
		('QUO_REQ_KHMER_UNIT_IS_WARRIOR_MONK', 	'REQUIREMENT_UNIT_TAG_MATCHES',	0,0,0) ;


INSERT INTO RequirementArguments 
		(RequirementId,			Name, 			Type, 			Value, 				Extra, 	SecondExtra)
VALUES 	('QUO_REQ_KHMER_CITY_HAS_AQUEDUCT',	'DistrictType',		'ARGTYPE_IDENTITY',	'DISTRICT_AQUEDUCT',	NULL,	NULL 	) ,
		('QUO_REQ_KHMER_UNIT_IS_WARRIOR_MONK',	'Tag',		'ARGTYPE_IDENTITY',		'QUO_CLASS_SANGHA_MONK',	NULL,	NULL 	) ;


INSERT INTO RequirementSets 
	(RequirementSetId, 		RequirementSetType)
VALUES 	('QUO_REQSET_KHMER_STRENGTH_UP', 	'REQUIREMENTSET_TEST_ALL') ,
		('QUO_REQSET_KHMER_UNIT_IS_WARRIOR_MONK', 	'REQUIREMENTSET_TEST_ANY') ;

INSERT INTO RequirementSetRequirements
		(RequirementSetId,	RequirementId)
VALUES	 ('QUO_REQSET_KHMER_STRENGTH_UP', 	'QUO_REQ_KHMER_CITY_HAS_AQUEDUCT') ,
		('QUO_REQSET_KHMER_UNIT_IS_WARRIOR_MONK', 	'QUO_REQ_KHMER_UNIT_IS_WARRIOR_MONK') ;


INSERT INTO Modifiers 
		(ModifierId, 	ModifierType, 	RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
VALUES	('QUO_KHMER_WARRIOR_MONK_STRENGTH', 'MODIFIER_UNIT_ADJUST_COMBAT_STRENGTH', 0, 0, NULL, NULL) ,
		('QUO_KHMER_WARRIOR_MONK_STRENGTH_CITY', 'MODIFIER_PLAYER_CITIES_ATTACH_MODIFIER', 0, 0, NULL, 	'QUO_REQSET_KHMER_STRENGTH_UP') ,
		('QUO_KHMER_WARRIOR_MONK_STRENGTH_PLAYER', 'MODIFIER_PLAYER_UNITS_ATTACH_MODIFIER', 0, 0, NULL, 'QUO_REQSET_KHMER_UNIT_IS_WARRIOR_MONK') ;


INSERT INTO ModifierArguments
	(ModifierId, 			Name, 		Type, 			Value, 					Extra, 	SecondExtra)
VALUES	('QUO_KHMER_WARRIOR_MONK_STRENGTH', 	'Amount', 	'ARGTYPE_IDENTITY', 	'2',		NULL, 	NULL) ,
		('QUO_KHMER_WARRIOR_MONK_STRENGTH_CITY', 		'ModifierId', 		'ARGTYPE_IDENTITY', 	'QUO_KHMER_WARRIOR_MONK_STRENGTH_PLAYER',	NULL, 	NULL) ,
		('QUO_KHMER_WARRIOR_MONK_STRENGTH_PLAYER', 		'ModifierId', 		'ARGTYPE_IDENTITY', 	'QUO_KHMER_WARRIOR_MONK_STRENGTH',	NULL, 	NULL)  ;


INSERT INTO TraitModifiers
	(TraitType, 		ModifierId)
SELECT 'TRAIT_CIVILIZATION_KHMER_BARAYS',	'QUO_KHMER_WARRIOR_MONK_STRENGTH_CITY' 
FROM Civilizations 
WHERE Civilizations.CivilizationType='CIVILIZATION_KHMER' ;
 */


/* INSERT INTO ModifierStrings
	(ModifierId, 		Context, Text)
VALUES	('QUO_KHMER_WARRIOR_MONK_STRENGTH', 'Preview', 'QUO_LOC_KHMER_GLOBAL_COMBAT_DESCRIPTION') ;  */



-- All units ignore rivers
INSERT INTO Modifiers 
	(ModifierId, 	ModifierType, 	RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
VALUES		('QUO_KHMER_IGNORE_RIV', 	'MODIFIER_PLAYER_UNIT_ADJUST_IGNORE_RIVERS', 0, 0, NULL, NULL) ,
			('QUO_KHMER_IGNORE_RIV_GLOBAL', 	'MODIFIER_PLAYER_UNITS_ATTACH_MODIFIER', 0, 0, NULL, NULL) ;



INSERT INTO ModifierArguments
	(ModifierId, 			Name, 		Type, 			Value, 					Extra, 	SecondExtra)
VALUES	 ('QUO_KHMER_IGNORE_RIV', 	'Ignore', 	'ARGTYPE_IDENTITY', 	'1',					NULL, 	NULL) ,	
	('QUO_KHMER_IGNORE_RIV_GLOBAL', 	'ModifierId', 	'ARGTYPE_IDENTITY', 	'QUO_KHMER_IGNORE_RIV',		NULL, 	NULL) ;

	
INSERT INTO TraitModifiers
	(TraitType, 		ModifierId)
SELECT 'TRAIT_LEADER_MONASTERIES_KING',	'QUO_KHMER_IGNORE_RIV_GLOBAL' 
FROM Civilizations 
WHERE Civilizations.CivilizationType='CIVILIZATION_KHMER' ;
	

	
-- Update start bonus so more likely to start near Wheat or Rice

INSERT INTO StartBiasResources
(CivilizationType, ResourceType, Tier)
SELECT 'CIVILIZATION_KHMER', 'RESOURCE_WHEAT', 2
FROM Civilizations WHERE Civilizations.CivilizationType = 'CIVILIZATION_KHMER' ;

INSERT INTO StartBiasResources
(CivilizationType, ResourceType, Tier)
SELECT 'CIVILIZATION_KHMER', 'RESOURCE_RICE', 2
FROM Civilizations WHERE Civilizations.CivilizationType = 'CIVILIZATION_KHMER' ;




-- Give Khmer a major adjacency bonus for Holy Sites rivers so this ability doesnt suck
INSERT INTO Modifiers 
	(ModifierId, 	ModifierType, 	RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
VALUES		('QUO_KHMER_RIVER_HOLY_SITE', 	'MODIFIER_PLAYER_CITIES_RIVER_ADJACENCY', 0, 0, NULL, NULL) ;


INSERT INTO ModifierArguments
	(ModifierId, 			Name, 		Type, 			Value, 					Extra, 	SecondExtra)
VALUES	 ('QUO_KHMER_RIVER_HOLY_SITE', 	'Amount', 	'ARGTYPE_IDENTITY', 	'2',					NULL, 	NULL) ,	
	('QUO_KHMER_RIVER_HOLY_SITE', 	'Description', 	'ARGTYPE_IDENTITY', 	'QUO_KHMER_RIVER_HOLY_ADJ',		NULL, 	NULL) ,
	('QUO_KHMER_RIVER_HOLY_SITE', 	'DistrictType', 	'ARGTYPE_IDENTITY', 	'DISTRICT_HOLY_SITE',		NULL, 	NULL) ,
	('QUO_KHMER_RIVER_HOLY_SITE', 	'YieldType', 	'ARGTYPE_IDENTITY', 	'YIELD_FAITH',		NULL, 	NULL) ;

	
INSERT INTO TraitModifiers
	(TraitType, 		ModifierId)
SELECT 'TRAIT_LEADER_MONASTERIES_KING',	'QUO_KHMER_RIVER_HOLY_SITE' 
FROM Civilizations 
WHERE Civilizations.CivilizationType='CIVILIZATION_KHMER' ;







-- PERSIA





-- INDONESIA


UPDATE tblQuoDebug SET Message = 'START INDONESIA' WHERE DebugId='Quo_Civ_Code' ;


-- In Rise and Fall, attempted to add a feature adjacency bonus for reefs
-- Removed, because the game does not check the ocean for feature adjacency against land tiles
/* INSERT INTO Modifiers 
	(ModifierId, ModifierType, RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
VALUES	('QUO_INDONESIA_REEF_CAMPUS_ADJ', 'MODIFIER_PLAYER_CITIES_FEATURE_ADJACENCY', 1, 1, NULL, NULL) ,
		('QUO_INDONESIA_REEF_THEATER_ADJ', 'MODIFIER_PLAYER_CITIES_FEATURE_ADJACENCY', 1, 1, NULL, NULL) ,
		('QUO_INDONESIA_REEF_IZ_ADJ', 'MODIFIER_PLAYER_CITIES_FEATURE_ADJACENCY', 1, 1, NULL, NULL) ,
		('QUO_INDONESIA_REEF_HOLY_ADJ', 'MODIFIER_PLAYER_CITIES_FEATURE_ADJACENCY', 1, 1, NULL, NULL) ;

		
INSERT INTO ModifierArguments
	(ModifierId, 			Name, 			Type, 			Value, 		Extra, 	SecondExtra)
VALUES	('QUO_INDONESIA_REEF_CAMPUS_ADJ', 	'Amount', 	'ARGTYPE_IDENTITY', 	'2',		NULL, 	NULL),
	('QUO_INDONESIA_REEF_CAMPUS_ADJ', 	'Description', 	'ARGTYPE_IDENTITY', 	'LOC_DISTRICT_JUNGLE_2_SCIENCE',	NULL, 	NULL)  ,
	('QUO_INDONESIA_REEF_CAMPUS_ADJ', 	'DistrictType', 	'ARGTYPE_IDENTITY', 	'DISTRICT_HARBOR',		NULL, 	NULL),
	('QUO_INDONESIA_REEF_CAMPUS_ADJ', 	'FeatureType', 	'ARGTYPE_IDENTITY', 	'FEATURE_REEF',		NULL, 	NULL),
	('QUO_INDONESIA_REEF_CAMPUS_ADJ', 	'YieldType', 	'ARGTYPE_IDENTITY', 	'YIELD_GOLD',		NULL, 	NULL),
	
	
	('QUO_INDONESIA_REEF_THEATER_ADJ', 	'Amount', 	'ARGTYPE_IDENTITY', 	'1',		NULL, 	NULL),
	('QUO_INDONESIA_REEF_THEATER_ADJ', 	'Description', 	'ARGTYPE_IDENTITY', 	'LOC_DISTRICT_JUNGLE_2_SCIENCE',	NULL, 	NULL)  ,
	('QUO_INDONESIA_REEF_THEATER_ADJ', 	'DistrictType', 	'ARGTYPE_IDENTITY', 	'DISTRICT_THEATER',		NULL, 	NULL),
	('QUO_INDONESIA_REEF_THEATER_ADJ', 	'FeatureType', 	'ARGTYPE_IDENTITY', 	'FEATURE_REEF',		NULL, 	NULL),
	('QUO_INDONESIA_REEF_THEATER_ADJ', 	'YieldType', 	'ARGTYPE_IDENTITY', 	'YIELD_CULTURE',		NULL, 	NULL),
	
	('QUO_INDONESIA_REEF_IZ_ADJ', 	'Amount', 	'ARGTYPE_IDENTITY', 	'1',		NULL, 	NULL),
	('QUO_INDONESIA_REEF_IZ_ADJ', 	'Description', 	'ARGTYPE_IDENTITY', 	'LOC_DISTRICT_JUNGLE_2_SCIENCE',	NULL, 	NULL)  ,
	('QUO_INDONESIA_REEF_IZ_ADJ', 	'DistrictType', 	'ARGTYPE_IDENTITY', 	'DISTRICT_INDUSTRIAL_ZONE',		NULL, 	NULL),
	('QUO_INDONESIA_REEF_IZ_ADJ', 	'FeatureType', 	'ARGTYPE_IDENTITY', 	'FEATURE_REEF',		NULL, 	NULL),
	('QUO_INDONESIA_REEF_IZ_ADJ', 	'YieldType', 	'ARGTYPE_IDENTITY', 	'YIELD_PRODUCTION',		NULL, 	NULL),
	
	('QUO_INDONESIA_REEF_HOLY_ADJ', 	'Amount', 	'ARGTYPE_IDENTITY', 	'1',		NULL, 	NULL),
	('QUO_INDONESIA_REEF_HOLY_ADJ', 	'Description', 	'ARGTYPE_IDENTITY', 	'LOC_DISTRICT_JUNGLE_2_SCIENCE',	NULL, 	NULL)  ,
	('QUO_INDONESIA_REEF_HOLY_ADJ', 	'DistrictType', 	'ARGTYPE_IDENTITY', 	'DISTRICT_HOLY_SITE',		NULL, 	NULL),
	('QUO_INDONESIA_REEF_HOLY_ADJ', 	'FeatureType', 	'ARGTYPE_IDENTITY', 	'FEATURE_REEF',		NULL, 	NULL),
	('QUO_INDONESIA_REEF_HOLY_ADJ', 	'YieldType', 	'ARGTYPE_IDENTITY', 	'YIELD_FAITH',		NULL, 	NULL) ;
	
INSERT INTO TraitModifiers
	(TraitType, 			ModifierID)
SELECT	'TRAIT_CIVILIZATION_INDONESIA_NUSANTARA',	'QUO_INDONESIA_REEF_CAMPUS_ADJ' 
FROM Civilizations 
WHERE Civilizations.CivilizationType='CIVILIZATION_INDONESIA' ;
	
INSERT INTO TraitModifiers
	(TraitType, 			ModifierID)
SELECT	'TRAIT_CIVILIZATION_INDONESIA_NUSANTARA',	'QUO_INDONESIA_REEF_THEATER_ADJ' 
FROM Civilizations 
WHERE Civilizations.CivilizationType='CIVILIZATION_INDONESIA' ;

INSERT INTO TraitModifiers
	(TraitType, 			ModifierID)
SELECT	'TRAIT_CIVILIZATION_INDONESIA_NUSANTARA',	'QUO_INDONESIA_REEF_IZ_ADJ' 
FROM Civilizations 
WHERE Civilizations.CivilizationType='CIVILIZATION_INDONESIA' ;

INSERT INTO TraitModifiers
	(TraitType, 			ModifierID)
SELECT	'TRAIT_CIVILIZATION_INDONESIA_NUSANTARA',	'QUO_INDONESIA_REEF_HOLY_ADJ' 
FROM Civilizations 
WHERE Civilizations.CivilizationType='CIVILIZATION_INDONESIA' ;  */


-- Free culture on researching naval techs
/*INSERT INTO Requirements
		(RequirementId, 		RequirementType, 	Likeliness,	Inverse, 	Triggered)
VALUES	('QUO_REQ_INDONESIA_HAS_SAILING', 	'REQUIREMENT_PLAYER_HAS_TECHNOLOGY',	0,0,0) ,
('QUO_REQ_INDONESIA_HAS_ASTROLOGY', 	'REQUIREMENT_PLAYER_HAS_TECHNOLOGY',	0,0,0) ,
('QUO_REQ_INDONESIA_HAS_CELEST', 	'REQUIREMENT_PLAYER_HAS_TECHNOLOGY',	0,0,0) ,
('QUO_REQ_INDONESIA_HAS_SHIPBUILDING', 	'REQUIREMENT_PLAYER_HAS_TECHNOLOGY',	0,0,0) ,
('QUO_REQ_INDONESIA_HAS_CARTOGRAPHY', 	'REQUIREMENT_PLAYER_HAS_TECHNOLOGY',	0,0,0) ,
('QUO_REQ_INDONESIA_HAS_SQUARE', 	'REQUIREMENT_PLAYER_HAS_TECHNOLOGY',	0,0,0) ,
('QUO_REQ_INDONESIA_HAS_ASTRONOMY', 	'REQUIREMENT_PLAYER_HAS_TECHNOLOGY',	0,0,0) ;

INSERT INTO RequirementArguments 
		(RequirementId,			Name, 			Type, 			Value, 		Extra, 	SecondExtra)
VALUES 	('QUO_REQ_INDONESIA_HAS_SAILING',	'TechnologyType',		'ARGTYPE_IDENTITY',	'TECH_SAILING',	NULL,	NULL 	)   ,
('QUO_REQ_INDONESIA_HAS_ASTROLOGY',	'TechnologyType',		'ARGTYPE_IDENTITY',	'TECH_ASTROLOGY',	NULL,	NULL 	)   ,
('QUO_REQ_INDONESIA_HAS_CELEST',	'TechnologyType',		'ARGTYPE_IDENTITY',	'TECH_CELESTIAL_NAVIGATION',	NULL,	NULL 	)   ,
('QUO_REQ_INDONESIA_HAS_SHIPBUILDING',	'TechnologyType',		'ARGTYPE_IDENTITY',	'TECH_SHIPBUILDING',	NULL,	NULL 	)   ,
('QUO_REQ_INDONESIA_HAS_CARTOGRAPHY',	'TechnologyType',		'ARGTYPE_IDENTITY',	'TECH_CARTOGRAPHY',	NULL,	NULL 	)   ,
('QUO_REQ_INDONESIA_HAS_SQUARE',	'TechnologyType',		'ARGTYPE_IDENTITY',	'TECH_SQUARE_RIGGING',	NULL,	NULL 	)   ,
('QUO_REQ_INDONESIA_HAS_ASTRONOMY',	'TechnologyType',		'ARGTYPE_IDENTITY',	'TECH_ASTRONOMY',	NULL,	NULL 	)   ;
		
INSERT INTO RequirementSets 
		(RequirementSetId, 		RequirementSetType)
VALUES 	('QUO_REQSET_INDONESIA_SAILING', 	'REQUIREMENTSET_TEST_ALL') ,
('QUO_REQSET_INDONESIA_HAS_ASTROLOGY', 	'REQUIREMENTSET_TEST_ALL') ,
('QUO_REQSET_INDONESIA_HAS_CELEST', 	'REQUIREMENTSET_TEST_ALL') ,
('QUO_REQSET_INDONESIA_HAS_SHIPBUILDING', 	'REQUIREMENTSET_TEST_ALL') ,
('QUO_REQSET_INDONESIA_HAS_CARTOGRAPHY', 	'REQUIREMENTSET_TEST_ALL') ,
('QUO_REQSET_INDONESIA_HAS_SQUARE', 	'REQUIREMENTSET_TEST_ALL') ,
('QUO_REQSET_INDONESIA_HAS_ASTRONOMY', 	'REQUIREMENTSET_TEST_ALL') ;

 INSERT INTO RequirementSetRequirements
	(RequirementSetId,	RequirementId)
VALUES	('QUO_REQSET_INDONESIA_SAILING', 	'QUO_REQ_INDONESIA_HAS_SAILING') ,
('QUO_REQSET_INDONESIA_HAS_ASTROLOGY', 	'QUO_REQ_INDONESIA_HAS_ASTROLOGY') ,
('QUO_REQSET_INDONESIA_HAS_CELEST', 	'QUO_REQ_INDONESIA_HAS_CELEST') ,
('QUO_REQSET_INDONESIA_HAS_SHIPBUILDING', 	'QUO_REQ_INDONESIA_HAS_SHIPBUILDING') ,
('QUO_REQSET_INDONESIA_HAS_CARTOGRAPHY', 	'QUO_REQ_INDONESIA_HAS_CARTOGRAPHY') ,
('QUO_REQSET_INDONESIA_HAS_SQUARE', 	'QUO_REQ_INDONESIA_HAS_SQUARE') ,
('QUO_REQSET_INDONESIA_HAS_ASTRONOMY', 	'QUO_REQ_INDONESIA_HAS_ASTRONOMY') ;



INSERT INTO Modifiers 
	(ModifierId, ModifierType, RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
VALUES	('QUO_INDONESIA_SAILING', 'MODIFIER_PLAYER_GRANT_YIELD', 1, 1, NULL, 'QUO_REQSET_INDONESIA_SAILING') ,
('QUO_INDONESIA_ASTROLOGY', 'MODIFIER_PLAYER_GRANT_YIELD', 1, 1, NULL, 'QUO_REQSET_INDONESIA_HAS_ASTROLOGY') ,
('QUO_INDONESIA_CELEST', 'MODIFIER_PLAYER_GRANT_YIELD', 1, 1, NULL, 'QUO_REQSET_INDONESIA_HAS_CELEST') ,
('QUO_INDONESIA_SHIPBUILDING', 'MODIFIER_PLAYER_GRANT_YIELD', 1, 1, NULL, 'QUO_REQSET_INDONESIA_HAS_SHIPBUILDING') ,
('QUO_INDONESIA_CARTOGRAPHY', 'MODIFIER_PLAYER_GRANT_YIELD', 1, 1, NULL, 'QUO_REQSET_INDONESIA_HAS_CARTOGRAPHY') ,
('QUO_INDONESIA_SQUARE', 'MODIFIER_PLAYER_GRANT_YIELD', 1, 1, NULL, 'QUO_REQSET_INDONESIA_HAS_SQUARE') ,
('QUO_INDONESIA_ASTRONOMY', 'MODIFIER_PLAYER_GRANT_YIELD', 1, 1, NULL, 'QUO_REQSET_INDONESIA_HAS_ASTRONOMY') ;

INSERT INTO ModifierArguments
	(ModifierId, 			Name, 			Type, 			Value, 		Extra, 	SecondExtra)
VALUES	('QUO_INDONESIA_SAILING', 	'Amount', 	'ScaleByGameSpeed', 	'15',		NULL, 	NULL),
	('QUO_INDONESIA_SAILING', 	'YieldType', 	'ARGTYPE_IDENTITY', 	'YIELD_CULTURE',	NULL, 	NULL)  ,
	('QUO_INDONESIA_ASTROLOGY', 	'Amount', 	'ScaleByGameSpeed', 	'15',		NULL, 	NULL),
	('QUO_INDONESIA_ASTROLOGY', 	'YieldType', 	'ARGTYPE_IDENTITY', 	'YIELD_CULTURE',	NULL, 	NULL)  ,
	('QUO_INDONESIA_CELEST', 	'Amount', 	'ScaleByGameSpeed', 	'25',		NULL, 	NULL),
	('QUO_INDONESIA_CELEST', 	'YieldType', 	'ARGTYPE_IDENTITY', 	'YIELD_CULTURE',	NULL, 	NULL)  ,
	('QUO_INDONESIA_SHIPBUILDING', 	'Amount', 	'ScaleByGameSpeed', 	'40',		NULL, 	NULL),
	('QUO_INDONESIA_SHIPBUILDING', 	'YieldType', 	'ARGTYPE_IDENTITY', 	'YIELD_CULTURE',	NULL, 	NULL)  ,
	('QUO_INDONESIA_CARTOGRAPHY', 	'Amount', 	'ScaleByGameSpeed', 	'80',		NULL, 	NULL),
	('QUO_INDONESIA_CARTOGRAPHY', 	'YieldType', 	'ARGTYPE_IDENTITY', 	'YIELD_CULTURE',	NULL, 	NULL)  ,
	('QUO_INDONESIA_SQUARE', 	'Amount', 	'ScaleByGameSpeed', 	'120',		NULL, 	NULL),
	('QUO_INDONESIA_SQUARE', 	'YieldType', 	'ARGTYPE_IDENTITY', 	'YIELD_CULTURE',	NULL, 	NULL)  ,
	('QUO_INDONESIA_ASTRONOMY', 	'Amount', 	'ScaleByGameSpeed', 	'120',		NULL, 	NULL),
	('QUO_INDONESIA_ASTRONOMY', 	'YieldType', 	'ARGTYPE_IDENTITY', 	'YIELD_CULTURE',	NULL, 	NULL)  ;

	
INSERT INTO TraitModifiers
	(TraitType, 			ModifierID)
SELECT	'TRAIT_LEADER_EXALTED_GODDESS',	'QUO_INDONESIA_SAILING' 
FROM Civilizations 
WHERE Civilizations.CivilizationType='CIVILIZATION_INDONESIA' ;

INSERT INTO TraitModifiers
	(TraitType, 			ModifierID)
SELECT	'TRAIT_LEADER_EXALTED_GODDESS',	'QUO_INDONESIA_ASTROLOGY' 
FROM Civilizations 
WHERE Civilizations.CivilizationType='CIVILIZATION_INDONESIA' ;

INSERT INTO TraitModifiers
	(TraitType, 			ModifierID)
SELECT	'TRAIT_LEADER_EXALTED_GODDESS',	'QUO_INDONESIA_CELEST' 
FROM Civilizations 
WHERE Civilizations.CivilizationType='CIVILIZATION_INDONESIA' ;

INSERT INTO TraitModifiers
	(TraitType, 			ModifierID)
SELECT	'TRAIT_LEADER_EXALTED_GODDESS',	'QUO_INDONESIA_SHIPBUILDING' 
FROM Civilizations 
WHERE Civilizations.CivilizationType='CIVILIZATION_INDONESIA' ;


INSERT INTO TraitModifiers
	(TraitType, 			ModifierID)
SELECT	'TRAIT_LEADER_EXALTED_GODDESS',	'QUO_INDONESIA_CARTOGRAPHY' 
FROM Civilizations 
WHERE Civilizations.CivilizationType='CIVILIZATION_INDONESIA' ;


INSERT INTO TraitModifiers
	(TraitType, 			ModifierID)
SELECT	'TRAIT_LEADER_EXALTED_GODDESS',	'QUO_INDONESIA_SQUARE' 
FROM Civilizations 
WHERE Civilizations.CivilizationType='CIVILIZATION_INDONESIA' ;


INSERT INTO TraitModifiers
	(TraitType, 			ModifierID)
SELECT	'TRAIT_LEADER_EXALTED_GODDESS',	'QUO_INDONESIA_ASTRONOMY' 
FROM Civilizations 
WHERE Civilizations.CivilizationType='CIVILIZATION_INDONESIA' ; */




-- Free Settler on settling first city
-- Removed in Rise and Fall
/* INSERT INTO Requirements
	(RequirementId, 		RequirementType, 	Likeliness,	Inverse, 	Triggered)
VALUES	('QUO_REQ_INDONESIA_CITY_HAS_PALACE', 		'REQUIREMENT_CITY_HAS_BUILDING',	0,0,0) ;


INSERT INTO RequirementArguments 
	(RequirementId,			Name, 			Type, 			Value, 				Extra, 	SecondExtra)
VALUES 	('QUO_REQ_INDONESIA_CITY_HAS_PALACE',	'BuildingType',		'ARGTYPE_IDENTITY',	'BUILDING_PALACE',	NULL,	NULL 	)  ;


INSERT INTO RequirementSets 
	(RequirementSetId, 		RequirementSetType)
VALUES 	('QUO_REQSET_INDONESIA_UNIT_UNLOCK', 	'REQUIREMENTSET_TEST_ALL')  ;


INSERT INTO RequirementSetRequirements
	(RequirementSetId,	RequirementId)
VALUES	 ('QUO_REQSET_INDONESIA_UNIT_UNLOCK', 	'QUO_REQ_INDONESIA_CITY_HAS_PALACE') ;


 
INSERT INTO Modifiers 
	(ModifierId, ModifierType, RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
VALUES	('QUO_INDONESIA_FREE_UNIT', 'MODIFIER_SINGLE_CITY_GRANT_UNIT_IN_CITY', 1, 1, NULL, NULL) ,
		('QUO_INDONESIA_FREE_UNIT_PLAYER', 'MODIFIER_PLAYER_CITIES_ATTACH_MODIFIER', 0, 0, NULL, 	'QUO_REQSET_INDONESIA_UNIT_UNLOCK') ;


INSERT INTO ModifierArguments
	(ModifierId, 			Name, 		Type, 			Value, 					Extra, 	SecondExtra)
VALUES	('QUO_INDONESIA_FREE_UNIT', 	'Amount', 'ARGTYPE_IDENTITY', 	'1',	NULL, 	NULL) ,  
	('QUO_INDONESIA_FREE_UNIT', 	'UnitType', 	'ARGTYPE_IDENTITY', 	'UNIT_SETTLER',		NULL, 	NULL) ,
	('QUO_INDONESIA_FREE_UNIT_PLAYER', 		'ModifierId', 		'ARGTYPE_IDENTITY', 	'QUO_INDONESIA_FREE_UNIT',	NULL, 	NULL)  ;
	
	
INSERT INTO TraitModifiers
	(TraitType, 			ModifierID)
SELECT	'TRAIT_LEADER_EXALTED_GODDESS',	'QUO_INDONESIA_FREE_UNIT_PLAYER' 
FROM Civilizations 
WHERE Civilizations.CivilizationType='CIVILIZATION_INDONESIA' ;
 */


-- Increase the normal adjacency bonuses for each adjacency to Ocean or Lake
-- UPDATE ModifierArguments SET Value ='1' WHERE ModifierId='TRAIT_NUSANTARA_COAST_CAMPUS' AND Name='TilesRequired' ;
-- UPDATE ModifierArguments SET Value ='1' WHERE ModifierId='TRAIT_NUSANTARA_COAST_HOLY_SITE' AND Name='TilesRequired' ;
--UPDATE ModifierArguments SET Value ='1' WHERE ModifierId='TRAIT_NUSANTARA_COAST_INDUSTRIAL_ZONE' AND Name='TilesRequired' ;
--UPDATE ModifierArguments SET Value ='1' WHERE ModifierId='TRAIT_NUSANTARA_COAST_THEATER' AND Name='TilesRequired' ;




-- NUBIA
/* INSERT INTO Requirements
		(RequirementId, 		RequirementType, 	Likeliness,	Inverse, 	Triggered)
VALUES	('QUO_REQ_NUBIA_HAS_5_DISTRICTS', 		'REQUIREMENT_CITY_HAS_X_SPECIALTY_DISTRICTS',	0,0,0) ;


INSERT INTO RequirementArguments 
		(RequirementId,			Name, 			Type, 			Value, 		Extra, 	SecondExtra)		
VALUES 	('QUO_REQ_NUBIA_HAS_5_DISTRICTS',	'Amount',		'ARGTYPE_IDENTITY',	'5',	NULL,	NULL 	)   ;


INSERT INTO RequirementSets 
	(RequirementSetId, 				RequirementSetType)
VALUES 	('QUO_REQSET_NUBIA_FREE_POPULATION', 	'REQUIREMENTSET_TEST_ALL') ;


INSERT INTO RequirementSetRequirements
	(RequirementSetId,	RequirementId)
VALUES	('QUO_REQSET_NUBIA_FREE_POPULATION', 	'QUO_REQ_NUBIA_HAS_5_DISTRICTS') ;



-- Reuse the modifiertype used by Brazil
INSERT INTO Modifiers 
		(ModifierId, 	ModifierType, 	RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
VALUES	('QUO_NUBIA_FREE_POPULATION', 'QUO_MODTYPE_BRAZIL_FREE_POPULATION', 0, 0, NULL, NULL) 
		('QUO_NUBIA_FREE_POPULATION_PLAYER', 'MODIFIER_PLAYER_CITIES_ATTACH_MODIFIER', 0, 0, NULL, NULL) ;


INSERT INTO ModifierArguments
	(ModifierId, 			Name, 		Type, 			Value, 					Extra, 	SecondExtra)
VALUES	('QUO_NUBIA_FREE_POPULATION', 	'Amount', 	'ARGTYPE_IDENTITY', 	'1',		NULL, 	NULL) ,
		('QUO_NUBIA_FREE_POPULATION_PLAYER', 		'ModifierId', 		'ARGTYPE_IDENTITY', 	'QUO_NUBIA_FREE_POPULATION',	NULL, 	'QUO_REQSET_NUBIA_FREE_POPULATION') ;


INSERT INTO TraitModifiers
	(TraitType, 		ModifierId)
SELECT 'TRAIT_CIVILIZATION_TA_SETI',	'QUO_NUBIA_FREE_POPULATION_PLAYER' 
FROM Civilizations 
WHERE Civilizations.CivilizationType='CIVILIZATION_NUBIA' ;
 */

-- Ranged distance
INSERT INTO Requirements
	(RequirementId, 		RequirementType, 	Likeliness,	Inverse, 	Triggered)
VALUES	('QUO_REQ_NUBIA_RANGED', 	'REQUIREMENT_UNIT_PROMOTION_CLASS_MATCHES',	0,0,0)  ;

INSERT INTO RequirementArguments 
		(RequirementId,			Name, 			Type, 			Value, 		Extra, 	SecondExtra)
VALUES 	('QUO_REQ_NUBIA_RANGED',	'UnitPromotionClass',		'ARGTYPE_IDENTITY',		'PROMOTION_CLASS_RANGED',	NULL,	NULL 	)  ;

INSERT INTO RequirementSets 
	(RequirementSetId, 		RequirementSetType)
VALUES 	('QUO_REQSET_NUBIA_RANGED', 	'REQUIREMENTSET_TEST_ANY') ;

 INSERT INTO RequirementSetRequirements
	(RequirementSetId,	RequirementId)
VALUES	('QUO_REQSET_NUBIA_RANGED', 	'QUO_REQ_NUBIA_RANGED')  ;

 INSERT INTO Modifiers 
	(ModifierId, 	ModifierType, 	RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
VALUES	('QUO_NUBIA_RANGE', 	'MODIFIER_UNIT_ADJUST_ATTACK_RANGE', 0, 0, NULL, NULL) ,
		('QUO_NUBIA_RANGE_PLAYER', 	'MODIFIER_PLAYER_UNITS_ATTACH_MODIFIER', 0, 0, NULL, 'QUO_REQSET_NUBIA_RANGED') ;

INSERT INTO ModifierArguments
	(ModifierId, 			Name, 		Type, 			Value, 					Extra, 	SecondExtra)
VALUES	('QUO_NUBIA_RANGE', 	'Amount', 	'ARGTYPE_IDENTITY', 	'1',					NULL, 	NULL) ,	
		('QUO_NUBIA_RANGE_PLAYER', 	'ModifierId', 	'ARGTYPE_IDENTITY', 	'QUO_NUBIA_RANGE',		NULL, 	NULL)   ;

INSERT INTO TraitModifiers
	(TraitType, 		ModifierId)
SELECT 'TRAIT_CIVILIZATION_TA_SETI',	'QUO_NUBIA_RANGE_PLAYER' 
FROM Civilizations 
WHERE Civilizations.CivilizationType='CIVILIZATION_NUBIA' ;
 
 
 
-- Attack strength debuff
INSERT INTO Modifiers 
		(ModifierId, 	ModifierType, 	RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
VALUES	('QUO_NUBIA_STRENGTH', 'MODIFIER_UNIT_ADJUST_COMBAT_STRENGTH', 0, 0, NULL, NULL) ,
		('QUO_NUBIA_STRENGTH_PLAYER', 'MODIFIER_PLAYER_UNITS_ATTACH_MODIFIER', 0, 0, NULL, 'UNIT_IS_DOMAIN_LAND') ;


INSERT INTO ModifierArguments
	(ModifierId, 			Name, 		Type, 			Value, 					Extra, 	SecondExtra)
VALUES	('QUO_NUBIA_STRENGTH', 	'Amount', 	'ARGTYPE_IDENTITY', 	'-3',		NULL, 	NULL) ,
		('QUO_NUBIA_STRENGTH_PLAYER', 		'ModifierId', 		'ARGTYPE_IDENTITY', 	'QUO_NUBIA_STRENGTH',	NULL, 	NULL)  ;
	

INSERT INTO TraitModifiers
	(TraitType, 		ModifierId)
SELECT 'TRAIT_CIVILIZATION_TA_SETI',	'QUO_NUBIA_STRENGTH_PLAYER' 
FROM Civilizations 
WHERE Civilizations.CivilizationType='CIVILIZATION_NUBIA' ;	
	
INSERT INTO ModifierStrings
	(ModifierId, 		Context, Text)
VALUES	('QUO_NUBIA_STRENGTH', 'Preview', 'QUO_LOC_NUBIA_STRENGTH') ; 




-- 

-- SWEDEN
INSERT INTO StartBiasTerrains
	(CivilizationType, TerrainType, Tier)
VALUES ('CIVILIZATION_SWEDEN', 'TERRAIN_TUNDRA_HILLS', 1),
		('CIVILIZATION_SWEDEN', 'TERRAIN_TUNDRA', 1);




-- UPDATE BUG TRACKER
-- This code should go last in every file
UPDATE tblQuoDebug SET x_Close='1' WHERE DebugID='Quo_Civ_Code';

