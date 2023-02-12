/*
    Created by Quo
*/
 

-- Debug
INSERT INTO tblQuoDebug 
	(DebugID, 		x_Open, x_Close, 	Message)
VALUES ('Quo_New_Buildings_Code',	'1',	'0',		'') ;


-- FOREIGN BUREAU

INSERT INTO Types
	(Type, 				Kind)
VALUES 	('QUO_BUILDING_AMBASSADOR_SUITE',	'KIND_BUILDING'	) ;



INSERT INTO Buildings 
	(BuildingType,Name,PrereqTech,PrereqCivic,Cost,MaxPlayerInstances,MaxWorldInstances,Capital,PrereqDistrict,AdjacentDistrict,Description,RequiresPlacement,RequiresRiver,OuterDefenseHitPoints,Housing,Entertainment,AdjacentResource,Coast,EnabledByReligion,AllowsHolyCity,PurchaseYield,MustPurchase,Maintenance,IsWonder,TraitType,OuterDefenseStrength,CitizenSlots,MustBeLake,MustNotBeLake,RegionalRange,AdjacentToMountain,ObsoleteEra,RequiresReligion,GrantFortification,DefenseModifier,InternalOnly,RequiresAdjacentRiver,Quote,QuoteAudio,MustBeAdjacentLand,AdvisorType)
VALUES	('QUO_BUILDING_AMBASSADOR_SUITE','QUO_LOC_BUILDING_AMBASSADOR_SUITE_NAME',NULL,'CIVIC_MASS_MEDIA',303,-1,-1,0,'DISTRICT_ENTERTAINMENT_COMPLEX',NULL,NULL,0,0,NULL,0,1,NULL,NULL,0,0,'YIELD_GOLD',0,1,0,NULL,0,NULL,0,0,0,0,'NO_ERA',0,0,0,0,0,NULL,NULL,0,'ADVISOR_GENERIC') ;


UPDATE Buildings SET Maintenance=0 WHERE Buildings.BuildingType='QUO_BUILDING_AMBASSADOR_SUITE' ;
UPDATE Buildings SET Description='QUO_LOC_BUILDING_AMBASSADOR_SUITE_DESCRIPTION' WHERE Buildings.BuildingType='QUO_BUILDING_AMBASSADOR_SUITE' ;



INSERT INTO BuildingPrereqs
	(Building, PrereqBuilding)
VALUES	('QUO_BUILDING_AMBASSADOR_SUITE','BUILDING_ARENA'),
	('BUILDING_STADIUM','QUO_BUILDING_AMBASSADOR_SUITE') ;


INSERT INTO MutuallyExclusiveBuildings
	(Building, MutuallyExclusiveBuilding)
VALUES	('BUILDING_ZOO','QUO_BUILDING_AMBASSADOR_SUITE'),
	('QUO_BUILDING_AMBASSADOR_SUITE', 'BUILDING_ZOO') ;


-- Building a Suite awards a free City State envoy

INSERT INTO Modifiers
	(ModifierID, 			ModifierType, 					RunOnce, 	Permanent, 	OwnerRequirementSetId, 	SubjectRequirementSetId)
VALUES	('QUO_AMBASSADOR_SUITE_FREE_ENVOY', 'MODIFIER_PLAYER_GRANT_INFLUENCE_TOKEN', 	1, 		1, 		NULL,			NULL) ;


INSERT INTO ModifierArguments
	(ModifierID,			Name,			Type, 			Value,			Extra)
VALUES	('QUO_AMBASSADOR_SUITE_FREE_ENVOY', 	'Amount', 	'ARGTYPE_IDENTITY', 	'1',		NULL) ;


INSERT INTO BuildingModifiers 
	(BuildingType,	ModifierId)
VALUES	('QUO_BUILDING_AMBASSADOR_SUITE', 'QUO_AMBASSADOR_SUITE_FREE_ENVOY') ;







-- UPDATE BUG TRACKER
-- This code should go last in every file

UPDATE tblQuoDebug SET x_Close='1' WHERE DebugID='Quo_New_Buildings_Code';
