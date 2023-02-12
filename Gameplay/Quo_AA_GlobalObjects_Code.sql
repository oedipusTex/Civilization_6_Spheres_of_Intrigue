/*
    Created by Quo
*/
 


-- LOGS



INSERT INTO tblQuoDebug 
	(DebugID, 		x_Open, x_Close, 	Message)
VALUES ('Quo_AA_GlobalObjects_Code',	'1',	'0',		'') ;



-- Set up a Modifier used for bug tracking. This modifier is empty, but it keeps track of this mod for debug purposes.
-- This code is out of date and no longer used.
/* INSERT INTO Modifiers
	(ModifierID, 			ModifierType, 					RunOnce, 	Permanent, 	OwnerRequirementSetId, 	SubjectRequirementSetId)
VALUES	('QUO_AA_BUG_TRACK_DUMMY', 	'MODIFIER_PLAYER_DIPLOMACY_SIMPLE_MODIFIER', 	0, 		0, 		NULL,			NULL) ;


INSERT INTO ModifierArguments
	(ModifierID,			Name,		Type, 			Value,		Extra)
VALUES	('QUO_AA_BUG_TRACK_DUMMY', 	'Amount', 	'ARGTYPE_IDENTITY', 	'0',		NULL),
 	('QUO_AA_BUG_TRACK_DUMMY', 	'File', 	'ARGTYPE_IDENTITY', 	'', 		NULL) ; */



UPDATE ModifierArguments SET Value=Value || ', ORules' WHERE ModifierId='QUO_AA_BUG_TRACK_DUMMY' AND Name='File' ;




-- Code below ultimately maps to PLOT_HAS_PLANTATION_TAG_REQUIREMENTS, which is used throughout the game.
-- Make it refer to ALL plantations, not just a sub-set.

INSERT INTO TypeTags
	(Type, 	Tag)
VALUES	('RESOURCE_BANANAS', 'CLASS_GODDESS_OF_FESTIVALS') ,
	('RESOURCE_CITRUS', 'CLASS_GODDESS_OF_FESTIVALS') ,
	('RESOURCE_COTTON', 'CLASS_GODDESS_OF_FESTIVALS') ,
	('RESOURCE_DYES', 'CLASS_GODDESS_OF_FESTIVALS') ,
	('RESOURCE_SILK', 'CLASS_GODDESS_OF_FESTIVALS') ,
	('RESOURCE_SPICES', 'CLASS_GODDESS_OF_FESTIVALS'),
	('RESOURCE_SUGAR', 'CLASS_GODDESS_OF_FESTIVALS' ) ;




-- SPECIAL REQUIREMENT SETS

-- QUO_REQSET_MAJOR_CIV_ANYWHERE
-- Create a special requirement set for Major civs, even if player hasnt met them, since the main reqset for Major civs requires meeting them

INSERT INTO RequirementSets 
	(RequirementSetId, 		RequirementSetType)
VALUES 	('QUO_REQSET_MAJOR_CIV_ANYWHERE', 	'REQUIREMENTSET_TEST_ANY') ;


INSERT INTO RequirementSetRequirements
	(RequirementSetId,	RequirementId)
VALUES	('QUO_REQSET_MAJOR_CIV_ANYWHERE', 	'REQUIRES_MAJOR_CIV_OPPONENT') ; 




INSERT INTO Requirements
	(RequirementId, 		RequirementType, 	Likeliness,	Inverse, 	Triggered)
VALUES	('QUO_REQ_AA_GENERIC_CITY_HAS_PALACE', 		'REQUIREMENT_CITY_HAS_BUILDING',	0,0,0) ;


INSERT INTO RequirementArguments 
	(RequirementId,			Name, 			Type, 			Value, 				Extra, 	SecondExtra)
VALUES 	('QUO_REQ_AA_GENERIC_CITY_HAS_PALACE',	'BuildingType',		'ARGTYPE_IDENTITY',	'BUILDING_PALACE',	NULL,	NULL 	) ;




-- SPECIAL MODIFIERS

INSERT INTO Types
	(Type, Kind)
VALUES('QUO_MODIFIER_PLAYER_DISTRICTS_ATTACH_MODIFIER', 'KIND_MODIFIER');
	

	   
INSERT INTO DynamicModifiers
		(ModifierType, CollectionType, EffectType)
VALUES	('QUO_MODIFIER_PLAYER_DISTRICTS_ATTACH_MODIFIER', 'COLLECTION_PLAYER_DISTRICTS', 'EFFECT_ATTACH_MODIFIER') ;



-- Grant a Building in a particular city
INSERT INTO Types
	(Type, 				Kind)
VALUES 	('QUO_MODTYPE_GRANT_BUILDING_IN_CITY',	'KIND_MODIFIER'	) ; 
 
INSERT INTO DynamicModifiers
		(ModifierType, CollectionType, EffectType)
VALUES 	('QUO_MODTYPE_GRANT_BUILDING_IN_CITY', 'COLLECTION_OWNER','EFFECT_GRANT_BUILDING_IN_CITY_IGNORE');




-- Global requirements for common functions
INSERT INTO Requirements
	(RequirementId, 		RequirementType, 	Likeliness,	Inverse, 	Triggered)
VALUES	('QUO_REQ_GLOBAL_ERA_IS_ATLEAST_ANCIENT', 	'REQUIREMENT_GAME_ERA_ATLEAST_EXPANSION',	0,0,0)  ,
		('QUO_REQ_GLOBAL_ERA_IS_ATLEAST_CLASSICAL', 	'REQUIREMENT_GAME_ERA_ATLEAST_EXPANSION',	0,0,0)  ,
		('QUO_REQ_GLOBAL_ERA_IS_ATLEAST_MEDIEVAL', 	'REQUIREMENT_GAME_ERA_ATLEAST_EXPANSION',	0,0,0)  ,
		('QUO_REQ_GLOBAL_ERA_IS_ATLEAST_RENAISSANCE', 	'REQUIREMENT_GAME_ERA_ATLEAST_EXPANSION',	0,0,0)  ,
		('QUO_REQ_GLOBAL_ERA_IS_ATLEAST_INDUSTRIAL', 	'REQUIREMENT_GAME_ERA_ATLEAST_EXPANSION',	0,0,0)  ,
		('QUO_REQ_GLOBAL_ERA_IS_ATLEAST_MODERN', 	'REQUIREMENT_GAME_ERA_ATLEAST_EXPANSION',	0,0,0)  ,
		('QUO_REQ_GLOBAL_ERA_IS_ATLEAST_ATOMIC', 	'REQUIREMENT_GAME_ERA_ATLEAST_EXPANSION',	0,0,0)  ,
		('QUO_REQ_GLOBAL_ERA_IS_ATLEAST_INFORMATION', 	'REQUIREMENT_GAME_ERA_ATLEAST_EXPANSION',	0,0,0)  ,
		
		('QUO_REQ_GLOBAL_ERA_NOT_YET_ANCIENT', 	'REQUIREMENT_GAME_ERA_ATLEAST_EXPANSION',	0,1,0)  ,
		('QUO_REQ_GLOBAL_ERA_NOT_YET_CLASSICAL', 	'REQUIREMENT_GAME_ERA_ATLEAST_EXPANSION',	0,1,0)  ,
		('QUO_REQ_GLOBAL_ERA_NOT_YET_MEDIEVAL', 	'REQUIREMENT_GAME_ERA_ATLEAST_EXPANSION',	0,1,0)  ,
		('QUO_REQ_GLOBAL_ERA_NOT_YET_RENAISSANCE', 	'REQUIREMENT_GAME_ERA_ATLEAST_EXPANSION',	0,1,0)  ,
		('QUO_REQ_GLOBAL_ERA_NOT_YET_INDUSTRIAL', 	'REQUIREMENT_GAME_ERA_ATLEAST_EXPANSION',	0,1,0)  ,
		('QUO_REQ_GLOBAL_ERA_NOT_YET_MODERN', 	'REQUIREMENT_GAME_ERA_ATLEAST_EXPANSION',	0,1,0)  ,
		('QUO_REQ_GLOBAL_ERA_NOT_YET_ATOMIC', 	'REQUIREMENT_GAME_ERA_ATLEAST_EXPANSION',	0,1,0)  ,
		('QUO_REQ_GLOBAL_ERA_NOT_YET_INFORMATION', 	'REQUIREMENT_GAME_ERA_ATLEAST_EXPANSION',	0,1,0)  ;
		
		

INSERT INTO RequirementArguments 
		(RequirementId,			Name, 			Type, 			Value, 		Extra, 	SecondExtra)
VALUES 	
		('QUO_REQ_GLOBAL_ERA_IS_ATLEAST_ANCIENT',	'EraType',		'ARGTYPE_IDENTITY',	'ERA_ANCIENT',	NULL,	NULL 	) ,
		('QUO_REQ_GLOBAL_ERA_IS_ATLEAST_CLASSICAL',	'EraType',		'ARGTYPE_IDENTITY',	'ERA_CLASSICAL',	NULL,	NULL 	) ,
		('QUO_REQ_GLOBAL_ERA_IS_ATLEAST_MEDIEVAL',	'EraType',		'ARGTYPE_IDENTITY',	'ERA_MEDIEVAL',	NULL,	NULL 	) ,
		('QUO_REQ_GLOBAL_ERA_IS_ATLEAST_RENAISSANCE',	'EraType',		'ARGTYPE_IDENTITY',	'ERA_RENAISSANCE',	NULL,	NULL 	) ,
		('QUO_REQ_GLOBAL_ERA_IS_ATLEAST_INDUSTRIAL',	'EraType',		'ARGTYPE_IDENTITY',	'ERA_INDUSTRIAL',	NULL,	NULL 	) ,
		('QUO_REQ_GLOBAL_ERA_IS_ATLEAST_MODERN',	'EraType',		'ARGTYPE_IDENTITY',	'ERA_MODERN',	NULL,	NULL 	) ,
		('QUO_REQ_GLOBAL_ERA_IS_ATLEAST_ATOMIC',	'EraType',		'ARGTYPE_IDENTITY',	'ERA_ATOMIC',	NULL,	NULL 	) ,
		('QUO_REQ_GLOBAL_ERA_IS_ATLEAST_INFORMATION',	'EraType',		'ARGTYPE_IDENTITY',	'ERA_INFORMATION',	NULL,	NULL 	) ,
		
		--('QUO_REQ_GLOBAL_ERA_NOT_YET_ANCIENT',	'EraType',		'ARGTYPE_IDENTITY',	'ERA_ANCIENT',	NULL,	NULL 	) ,
		('QUO_REQ_GLOBAL_ERA_NOT_YET_CLASSICAL',	'EraType',		'ARGTYPE_IDENTITY',	'ERA_CLASSICAL',	NULL,	NULL 	) ,
		('QUO_REQ_GLOBAL_ERA_NOT_YET_MEDIEVAL',	'EraType',		'ARGTYPE_IDENTITY',	'ERA_MEDIEVAL',	NULL,	NULL 	) ,
		('QUO_REQ_GLOBAL_ERA_NOT_YET_RENAISSANCE',	'EraType',		'ARGTYPE_IDENTITY',	'ERA_RENAISSANCE',	NULL,	NULL 	) ,
		('QUO_REQ_GLOBAL_ERA_NOT_YET_INDUSTRIAL',	'EraType',		'ARGTYPE_IDENTITY',	'ERA_INDUSTRIAL',	NULL,	NULL 	) ,
		('QUO_REQ_GLOBAL_ERA_NOT_YET_MODERN',	'EraType',		'ARGTYPE_IDENTITY',	'ERA_MODERN',	NULL,	NULL 	) ,
		('QUO_REQ_GLOBAL_ERA_NOT_YET_ATOMIC',	'EraType',		'ARGTYPE_IDENTITY',	'ERA_ATOMIC',	NULL,	NULL 	) ,
		('QUO_REQ_GLOBAL_ERA_NOT_YET_INFORMATION',	'EraType',		'ARGTYPE_IDENTITY',	'ERA_INFORMATION',	NULL,	NULL 	) ;




-- Auto inserts for BUILDINGS
INSERT INTO Requirements
        (RequirementId, 		RequirementType, 	Likeliness,	Inverse, 	Triggered)
SELECT 'QUO_REQ_AUTO_CITY_HAS_' || Buildings.BuildingType, 'REQUIREMENT_CITY_HAS_BUILDING', 0, 0, 0
FROM Buildings;

INSERT INTO RequirementArguments
    (RequirementId,			Name, 			Type, 			Value, 		Extra, 	SecondExtra)
SELECT 'QUO_REQ_AUTO_CITY_HAS_' || Buildings.BuildingType,	'BuildingType',		'ARGTYPE_IDENTITY',	BuildingType,	NULL,	NULL 	
FROM Buildings;

		
		
		


-- SPECIAL BUILDINGS

-- City State only buildings. Note that the building they get is identical to the building Germany's capital gets. This is a workaround that exists mainly due to 
-- difficulty with locking out the building of a particular building without causing game crashes when a city is captured.
/* INSERT INTO Types
	(Type, Kind)
VALUES('QUO_BUILDING_PALACE_ANNEX', 'KIND_BUILDING');


INSERT INTO Buildings 
	(BuildingType,Name,PrereqTech,PrereqCivic,Cost,MaxPlayerInstances,MaxWorldInstances,Capital,PrereqDistrict,AdjacentDistrict,Description,RequiresPlacement,RequiresRiver,OuterDefenseHitPoints,Housing,Entertainment,AdjacentResource,Coast,EnabledByReligion,AllowsHolyCity,PurchaseYield,MustPurchase,Maintenance,IsWonder,TraitType,OuterDefenseStrength,CitizenSlots,MustBeLake,MustNotBeLake,RegionalRange,AdjacentToMountain,ObsoleteEra,RequiresReligion,GrantFortification,DefenseModifier,InternalOnly,RequiresAdjacentRiver,Quote,QuoteAudio,MustBeAdjacentLand,AdvisorType)
VALUES	('QUO_BUILDING_PALACE_ANNEX','LOC_QUO_BUILDING_PALACE_ANNEX_NAME',NULL,NULL,5,-1,-1,0,'DISTRICT_CITY_CENTER',NULL,NULL,0,0,NULL,0,1,NULL,NULL,0,0,'YIELD_GOLD',0,1,0,NULL,0,NULL,0,0,0,0,'NO_ERA',0,0,0,0,0,NULL,NULL,0,'ADVISOR_GENERIC') ;


INSERT INTO BuildingPrereqs
	(Building, PrereqBuilding)
VALUES	('QUO_BUILDING_PALACE_ANNEX','BUILDING_PALACE'); */
 


 
 -- Give the annex to all city states and capitals automatically
/* INSERT INTO Requirements
	(RequirementId, 		RequirementType, 	Likeliness,	Inverse, 	Triggered)
VALUES	('QUO_REQ_GLOBAL_CITY_HAS_PALACE', 		'REQUIREMENT_CITY_HAS_BUILDING',	0,0,0) ;


INSERT INTO RequirementArguments 
	(RequirementId,			Name, 			Type, 			Value, 				Extra, 	SecondExtra)
VALUES 	('QUO_REQ_GLOBAL_CITY_HAS_PALACE',	'BuildingType',		'ARGTYPE_IDENTITY',	'BUILDING_PALACE',	NULL,	NULL 	) ;


INSERT INTO RequirementSets 
	(RequirementSetId, 		RequirementSetType)
VALUES 	('QUO_REQSET_GLOBAL_CITY_HAS_PALACE', 	'REQUIREMENTSET_TEST_ALL')  ;


INSERT INTO RequirementSetRequirements
	(RequirementSetId,	RequirementId)
VALUES	 ('QUO_REQSET_GLOBAL_CITY_HAS_PALACE', 	'QUO_REQ_GLOBAL_CITY_HAS_PALACE')  ; */

 
 
/* INSERT INTO Types
	(Type, 				Kind)
VALUES 	('QUO_MODTYPE_GRANT_BUILDING_IN_CITY',	'KIND_MODIFIER'	) ; 
 
INSERT INTO DynamicModifiers
		(ModifierType, CollectionType, EffectType)
VALUES 	('QUO_MODTYPE_GRANT_BUILDING_IN_CITY', 'COLLECTION_OWNER','EFFECT_GRANT_BUILDING_IN_CITY_IGNORE');


INSERT INTO Modifiers 
	(ModifierId, ModifierType, RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
VALUES	('QUO_GLOBAL_ANNEX_IDENTIFIER', 'QUO_MODTYPE_GRANT_BUILDING_IN_CITY', 1, 1, NULL, NULL) ,
		('QUO_GLOBAL_ANNEX_IDENTIFIER_PLAYER', 'MODIFIER_PLAYER_CITIES_ATTACH_MODIFIER', 0, 0, NULL, 'QUO_REQSET_GLOBAL_CITY_HAS_PALACE') ;

INSERT INTO ModifierArguments
	(ModifierId, 			Name, 		Type, 			Value, 			Extra, 	SecondExtra)
VALUES	('QUO_GLOBAL_ANNEX_IDENTIFIER', 	'BuildingType', 	'ARGTYPE_IDENTITY', 	'QUO_BUILDING_PALACE_ANNEX',			NULL, 	NULL) ,
		('QUO_GLOBAL_ANNEX_IDENTIFIER_PLAYER', 	'ModifierId', 	'ARGTYPE_IDENTITY', 	'QUO_GLOBAL_ANNEX_IDENTIFIER',			NULL, 	NULL) ;


INSERT INTO TraitModifiers
	(TraitType, 			ModifierID)
VALUES	('MINOR_CIV_DEFAULT_TRAIT',	'QUO_GLOBAL_ANNEX_IDENTIFIER_PLAYER')  ,
		('TRAIT_LEADER_MAJOR_CIV',	'QUO_GLOBAL_ANNEX_IDENTIFIER_PLAYER')  ; */



-- breathtaking plot appeal
INSERT INTO Requirements
		(RequirementId, 		RequirementType, 	Likeliness,	Inverse, 	Triggered)
VALUES	('QUO_REQ_PLOT_APPEAL_BREATHTAKING', 		'REQUIREMENT_PLOT_IS_APPEAL_BETWEEN',	0,0,0)  ;


INSERT INTO RequirementArguments 
		(RequirementId,			Name, 			Type, 			Value, 				Extra, 	SecondExtra)
VALUES 	('QUO_REQ_PLOT_APPEAL_BREATHTAKING',	'MinimumAppeal',		'ARGTYPE_IDENTITY',	'4',	NULL,	NULL 	) ;


INSERT INTO RequirementSets 
	(RequirementSetId, 		RequirementSetType)
VALUES 	('QUO_REQSET_PLOT_APPEAL_BREATHTAKING', 	'REQUIREMENTSET_TEST_ALL')  ;

INSERT INTO RequirementSetRequirements
		(RequirementSetId,	RequirementId)
VALUES	 ('QUO_REQSET_PLOT_APPEAL_BREATHTAKING', 	'QUO_REQ_PLOT_APPEAL_BREATHTAKING')  ;


		

-- UPDATE BUG TRACKER
-- This code should go last in every file

UPDATE tblQuoDebug SET x_Close='1' WHERE DebugID='Quo_AA_GlobalObjects_Code';
