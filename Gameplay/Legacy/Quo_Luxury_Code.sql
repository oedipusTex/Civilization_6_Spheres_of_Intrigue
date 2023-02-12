-- =============================================================================================================

-- The Resource Victory


INSERT INTO Types
		(Type, 				Kind)
VALUES 	('QUO_RESOURCE_VICTORY',		'KIND_VICTORY'	) ,
		('QUO_RESOURCE_ULTIMA',			'KIND_RESOURCE'	) ,
		('QUO_CIVIC_ULTIMA',			'KIND_CIVIC'	) ,  
		('QUO_PROJECT_RESOURCE_VICTORY',	'KIND_PROJECT'	) ;

		
		
-- Resource Victory building. Only added to cities using Lua.
INSERT INTO Types
        (Type, 					Kind)
VALUES 	('QUO_BUILDING_RESOURCE_VICTORY_WIN', 	'KIND_BUILDING' );


INSERT INTO Buildings
		(BuildingType, 				Name,						EnabledByReligion, 	Cost, 	PurchaseYield,  PrereqDistrict,			ObsoleteEra,	TraitType, 	MustPurchase)
VALUES 		('QUO_BUILDING_RESOURCE_VICTORY_WIN',	'LOC_QUO_BUILDING_RESOURCE_VICTORY_WIN_NAME', 	1,			99999,	NULL, 		'DISTRICT_CITY_CENTER', 	'NO_ERA', 	NULL, 		1 );



-- Create a Requirement for every resource 
-- No longer needed, because the Requirements system isn't flexible enough to count the number of requirements met. Combined with the fact that not all
-- Luxuries are loaded every game, we have to handle this differently.

/*
INSERT INTO Requirements
		(RequirementId, 																RequirementType, 					Likeliness,	Inverse, 	Triggered)
SELECT 	'QUO_REQ_CITY_HAS_EXPO_' || tbl_quoMonopolyResource_YieldChanges.ResourceType, 	'REQUIREMENT_CITY_HAS_BUILDING', 	0,			0,			0 
FROM 	tbl_quoMonopolyResource_YieldChanges;


INSERT INTO RequirementArguments 
		(RequirementId,																	Name, 				Type, 				Value, 																			Extra, 	SecondExtra)
SELECT 	'QUO_REQ_CITY_HAS_EXPO_' || tbl_quoMonopolyResource_YieldChanges.ResourceType,	'BuildingType',		'ARGTYPE_IDENTITY',	'QUO_BUILDING_MONOPOLY_' || tbl_quoMonopolyResource_YieldChanges.ResourceType,	NULL,	NULL 	
FROM 	tbl_quoMonopolyResource_YieldChanges;


INSERT INTO RequirementSets 
		(RequirementSetId, 			RequirementSetType)
VALUES 		('QUO_REQSET_EXPOS', 		'REQUIREMENTSET_TEST_ALL') ;
*/



-- Create a Resource called Ultima, which will be what enables players to build the Project that ends the game
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
                          LakeEligible
                      )
                      VALUES (
                        'QUO_RESOURCE_ULTIMA' -- 'ResourceType',
                        , 'LOC_QUO_RESOURCE_ULTIMA_NAME' --'Name',
                        , 'RESOURCECLASS_LUXURY' -- 'ResourceClassType',
                        , '20' -- 'Happiness',
                        , '0'-- 'NoRiver',
                        , '0'-- 'RequiresRiver',
                        , '0'-- 'Frequency',
                        , '0'-- 'Clumped',
                        , NULL-- 'PrereqTech',
                        , NULL-- 'PrereqCivic',
                        , 'NO_ERA'-- 'PeakEra',
                        , 1-- 'RevealedEra',
                        , 1-- 'LakeEligible'
                      );


					  
-- The resource Building provides free Ultima resource
INSERT INTO Modifiers 
	(ModifierId, ModifierType, RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
VALUES	('QUO_MOD_FREE_ULTIMA', 'MODIFIER_PLAYER_ADJUST_FREE_RESOURCE_IMPORT', 0, 0, NULL, NULL) ;


INSERT INTO ModifierArguments
	(ModifierId, 				Name, 			Type, 			Value, 			Extra, 	SecondExtra)
VALUES	('QUO_MOD_FREE_ULTIMA', 		'Amount', 		'ARGTYPE_IDENTITY', 	'1',			NULL, 	NULL) , 
	('QUO_MOD_FREE_ULTIMA', 		'ResourceType', 	'ARGTYPE_IDENTITY', 	'QUO_RESOURCE_ULTIMA',	NULL, 	NULL) ;

INSERT INTO BuildingModifiers
		(BuildingType, 			ModifierID)
VALUES	('QUO_BUILDING_RESOURCE_VICTORY_WIN', 'QUO_MOD_FREE_ULTIMA') ;
					  

					  
-- The Project
INSERT INTO Projects (
                         ProjectType,
                         Name,
                         ShortName,
                         Description,
                         PopupText,
                         Cost,
                         CostProgressionModel,
                         CostProgressionParam1,
                         PrereqTech,
                         PrereqCivic,
                         PrereqDistrict,
                         VisualBuildingType,
                         SpaceRace,
                         OuterDefenseRepair,
                         MaxPlayerInstances,
                         AmenitiesWhileActive,
                         PrereqResource,
                         AdvisorType
                     )
                     VALUES (
                         'QUO_PROJECT_RESOURCE_VICTORY' -- 'ProjectType',
                        , 'LOC_QUO_PROJECT_RESOURCE_VICTORY_NAME' -- 'Name',
                        , 'LOC_QUO_PROJECT_RESOURCE_VICTORY_NAME_SHORT' -- 'ShortName',
                        , 'LOC_QUO_PROJECT_RESOURCE_VICTORY_DESCRIPTION' -- 'Description',
                        , NULL -- 'PopupText',
                        , '10' -- 'Cost',
                        , 'NO_PROGRESSION_MODEL'  -- 'CostProgressionModel',
                        , 0 -- 'CostProgressionParam1',
                        , NULL -- 'PrereqTech',
                        , NULL -- 'PrereqCivic',
                        , NULL -- 'PrereqDistrict',
                        , NULL  -- 'VisualBuildingType',
                        , 0 -- 'SpaceRace',
                        , 0 -- 'OuterDefenseRepair',
                        , NULL -- 'MaxPlayerInstances',
                        , 0 -- 'AmenitiesWhileActive',
                        , 'QUO_RESOURCE_ULTIMA' -- 'PrereqResource',
                        , 'ADVISOR_GENERIC' -- 'AdvisorType'
                     );
                     
					 
					 
					  
-- Win requirements 
-- Ideally, this would be set up in a way that allows Teams to win instead of individual Players, 
-- but the way to accomplish that is beyond my ability to currently code or test					  
INSERT INTO Requirements
		(RequirementId, 										RequirementType, 					Likeliness,	Inverse, 	Triggered, Persistent)
VALUES 	('QUO_RESOURCE_VICTORY_PROJECT_COMPLETE', 				'REQUIREMENT_PLAYER_HAS_COMPLETED_PROJECT', 	0,			0,			0, 1) ,
		('QUO_RESOURCE_VICTORY_PER_TEAM_REQUIREMENTS_MET', 		'REQUIREMENT_COLLECTION_ANY_MET', 	0,			0,			0, 0) ;


		
INSERT INTO RequirementArguments 
		(RequirementId,								Name, 						Type, 				Value, 	Extra, 	SecondExtra)
VALUES	('QUO_RESOURCE_VICTORY_PER_TEAM_REQUIREMENTS_MET',	'CollectionType',		'ARGTYPE_IDENTITY',	'COLLECTION_TEAM_PLAYERS',	NULL,	NULL 	),
		('QUO_RESOURCE_VICTORY_PER_TEAM_REQUIREMENTS_MET',	'RequirementSetId',		'ARGTYPE_IDENTITY',	'QUO_REQSET_RESOURCE_VICTORY_PER_TEAM',	NULL,	NULL 	),
		('QUO_RESOURCE_VICTORY_PROJECT_COMPLETE',	'MinimumCompletions',		'ARGTYPE_IDENTITY',	'1',	NULL,	NULL 	),
		('QUO_RESOURCE_VICTORY_PROJECT_COMPLETE',	'ProjectType',				'ARGTYPE_IDENTITY',	'QUO_PROJECT_RESOURCE_VICTORY',	NULL,	NULL 	);
		
		

INSERT INTO RequirementSets 
		(RequirementSetId, 							RequirementSetType)
VALUES 	('QUO_REQSET_RESOURCE_VICTORY', 			'REQUIREMENTSET_TEST_ALL'),
		('QUO_REQSET_RESOURCE_VICTORY_PER_TEAM', 	'REQUIREMENTSET_TEST_ALL') ;
					  

INSERT INTO RequirementSetRequirements
		(RequirementSetId,	RequirementId)
VALUES	('QUO_REQSET_RESOURCE_VICTORY', 	'VICTORY_MIN_MAJOR_TEAMS') , 
		('QUO_REQSET_RESOURCE_VICTORY', 	'QUO_RESOURCE_VICTORY_PER_TEAM_REQUIREMENTS_MET') ,
		('QUO_REQSET_RESOURCE_VICTORY_PER_TEAM', 	'QUO_RESOURCE_VICTORY_PROJECT_COMPLETE') ;
;
					  
					  

INSERT INTO Victories (
                          VictoryType,
                          Name,
                          Blurb,
                          RequirementSetId,
                          EnabledByDefault,
                          Description,
                          Icon
                      )
                      VALUES (
                         'QUO_RESOURCE_VICTORY' -- 'VictoryType'
                         , 'LOC_QUO_RESOURCE_VICTORY_NAME' -- 'Name'
                         , 'LOC_QUO_RESOURCE_VICTORY_BLURB' -- 'Blurb'
                         , 'QUO_REQSET_RESOURCE_VICTORY' -- 'RequirementSetId'
                         , '1' -- 'EnabledByDefault'
                         , NULL -- 'Description'
                         , NULL -- 'Icon'
                      );


					  
-- This doesn't work at all due to how the Civics tree automatically displays any Civic.
/*			  
INSERT INTO Civics (
                       CivicType,
                       Name,
                       Cost,
                       Repeatable,
                       Description,
                       EraType,
                       BarbarianFree,
                       UITreeRow,
                       AdvisorType
                   )
                   VALUES (
                   'QUO_CIVIC_ULTIMA'    -- 'CivicType',
                    , 'LOC_QUO_CIVIC_ULTIMA_NAME'  -- 'Name',
                    , '999999'   -- 'Cost',
                    , '0'   -- 'Repeatable',
                    , 'LOC_QUO_CIVIC_ULTIMA_NAME'   -- 'Description',
                    , 'ERA_INFORMATION'   -- 'EraType',
                    , '0'   -- 'BarbarianFree',
                    , '-2'   -- 'UITreeRow',
                    , 'ADVISOR_GENERIC'   -- 'AdvisorType'
                   );

*/



-- MONOPOLY BUILDINGS



-- create a list of resources
CREATE TEMPORARY TABLE tbl_quoMonopolyResources AS SELECT ResourceType
                                                   FROM Resources
                                                  WHERE ResourceClassType = 'RESOURCECLASS_LUXURY' AND 
                                                        Frequency > 0;
														

														
-- Expo buildings. Each one gets a concat name, similar to QUO_BUILDING_MONOPOLY_RESOURCE_CITRUS
-- This building is unbuildable using ordinary means. It is only applied and taken away using Lua.


INSERT INTO Types
        (Type, 				Kind)
SELECT 'QUO_BUILDING_MONOPOLY_' || tbl_quoMonopolyResources.ResourceType, 	'KIND_BUILDING' 
FROM tbl_quoMonopolyResources ;


INSERT INTO Buildings
		(BuildingType, 									Name,						EnabledByReligion, 			Cost, 	PurchaseYield,  PrereqDistrict,				ObsoleteEra,	TraitType, MustPurchase)
SELECT 	'QUO_BUILDING_MONOPOLY_' || tbl_quoMonopolyResources.ResourceType ,			'LOC_QUO_BUILDING_MONOPOLY_' || tbl_quoMonopolyResources.ResourceType, 	1,							99999,	NULL, 			'DISTRICT_CITY_CENTER', 	'NO_ERA', NULL, 1 
FROM tbl_quoMonopolyResources ;







/*
CREATE TEMPORARY TABLE tbl_quoMonopolyResource_YieldChanges AS 
SELECT Resources.ResourceType, Resource_YieldChanges.YieldType, Resource_YieldChanges.YieldChange
FROM Resource_YieldChanges
LEFT JOIN Resources on Resources.ResourceType = Resource_YieldChanges.ResourceType
WHERE ResourceClassType = 'RESOURCECLASS_LUXURY' 
AND Frequency > 0 ;
*/


-- Deal with resources that have multiple yields


/*
create temporary table tbl_Quo_2_Up as 
SELECT Resources.ResourceType, Resource_YieldChanges.YieldType, Resource_YieldChanges.YieldChange
FROM Resource_YieldChanges
LEFT JOIN Resources on Resources.ResourceType = Resource_YieldChanges.ResourceType
WHERE ResourceClassType = 'RESOURCECLASS_LUXURY' AND 
Frequency > 0 AND
resource_yieldchanges.YieldChange >= 2 ;


create temporary table tbl_Quo_3_Up as 
SELECT Resources.ResourceType, Resource_YieldChanges.YieldType, Resource_YieldChanges.YieldChange
FROM Resource_YieldChanges
LEFT JOIN Resources on Resources.ResourceType = Resource_YieldChanges.ResourceType
WHERE ResourceClassType = 'RESOURCECLASS_LUXURY' AND 
Frequency > 0 AND
resource_yieldchanges.YieldChange >= 3 ;

INSERT INTO tbl_quoMonopolyResource_YieldChanges
SELECT * FROM  tbl_Quo_2_Up ;


INSERT INTO tbl_quoMonopolyResource_YieldChanges
SELECT * FROM  tbl_Quo_3_Up ;
*/

CREATE TEMPORARY TABLE tbl_quoMonopolyResource_YieldChanges 
	(ResourceType, YieldType) ;


-- Bonuses are now hard-coded instead of based on database lookups
	
-- Dont delete this table, it is used again further down to establish Victory conditions
INSERT INTO tbl_quoMonopolyResource_YieldChanges 
		(ResourceType, YieldType) 
VALUES ('RESOURCE_CITRUS', 'YIELD_FOOD') ,
 ('RESOURCE_COCOA', 'YIELD_GOLD'),
 ('RESOURCE_COFFEE', 'YIELD_CULTURE') ,
 ('RESOURCE_COTTON', 'YIELD_GOLD') ,
 ('RESOURCE_DIAMONDS', 'YIELD_GOLD') ,
 ('RESOURCE_DYES', 'YIELD_FAITH') ,
 ('RESOURCE_FURS', 'YIELD_GOLD') ,
 ('RESOURCE_GYPSUM', 'YIELD_PRODUCTION') ,
 ('RESOURCE_INCENSE', 'YIELD_FAITH') ,
 ('RESOURCE_IVORY', 'YIELD_PRODUCTION') ,
 ('RESOURCE_JADE', 'YIELD_CULTURE') ,
 ('RESOURCE_MARBLE', 'YIELD_CULTURE') ,
 ('RESOURCE_MERCURY', 'YIELD_SCIENCE') ,
 ('RESOURCE_PEARLS', 'YIELD_FAITH'),
 ('RESOURCE_SALT', 'YIELD_FOOD'),
 ('RESOURCE_SILK', 'YIELD_CULTURE') ,
 ('RESOURCE_SILVER', 'YIELD_GOLD') ,
 ('RESOURCE_SPICES', 'YIELD_FOOD') ,
 ('RESOURCE_SUGAR', 'YIELD_FOOD') ,
 ('RESOURCE_TEA', 'YIELD_SCIENCE') ,
 ('RESOURCE_TOBACCO', 'YIELD_FAITH') ,
 ('RESOURCE_TRUFFLES', 'YIELD_GOLD') ,
 ('RESOURCE_WHALES', 'YIELD_FAITH') ,
 ('RESOURCE_WINE', 'YIELD_FOOD') ;


	
INSERT INTO Requirements
		(RequirementId, 								RequirementType, 				Likeliness,	Inverse, 	Triggered)
VALUES	('QUO_REQ_CITY_HAS_ENTERTAINMENT_COMPLEX', 	'REQUIREMENT_CITY_HAS_DISTRICT',	0,0,0) ;

INSERT INTO RequirementArguments 
	(RequirementId,			Name, 			Type, 			Value, 				Extra, 	SecondExtra)
VALUES 	('QUO_REQ_CITY_HAS_ENTERTAINMENT_COMPLEX',	'DistrictType',		'ARGTYPE_IDENTITY',	'DISTRICT_ENTERTAINMENT_COMPLEX',	NULL,	NULL 	) ;


INSERT INTO RequirementSets 
	(RequirementSetId, 				RequirementSetType)
VALUES 	('QUO_REQSET_CITY_CAN_HOST_FESTIVAL', 	'REQUIREMENTSET_TEST_ALL') ;


INSERT INTO RequirementSetRequirements
	(RequirementSetId,	RequirementId)
VALUES	('QUO_REQSET_CITY_CAN_HOST_FESTIVAL', 	'QUO_REQ_CITY_HAS_ENTERTAINMENT_COMPLEX') ;

INSERT INTO Modifiers 
		(ModifierId, ModifierType, RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
VALUES	('QUO_MONOPOLY_CULTURE', 'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_MODIFIER', 0, 0, NULL, 'QUO_REQSET_CITY_CAN_HOST_FESTIVAL') ,
		('QUO_MONOPOLY_GOLD', 'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_MODIFIER', 0, 0, NULL, 'QUO_REQSET_CITY_CAN_HOST_FESTIVAL') ,
		('QUO_MONOPOLY_FAITH', 'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_MODIFIER', 0, 0, NULL, 'QUO_REQSET_CITY_CAN_HOST_FESTIVAL') ,
		('QUO_MONOPOLY_SCIENCE', 'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_MODIFIER', 0, 0, NULL, 'QUO_REQSET_CITY_CAN_HOST_FESTIVAL') ,
		('QUO_MONOPOLY_FOOD', 'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_MODIFIER', 0, 0, NULL, 'QUO_REQSET_CITY_CAN_HOST_FESTIVAL') , 
		('QUO_MONOPOLY_PRODUCTION', 'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_MODIFIER', 0, 0, NULL, 'QUO_REQSET_CITY_CAN_HOST_FESTIVAL') ;


INSERT INTO ModifierArguments
		(ModifierId, 				Name, 		Type, 					Value, 			Extra, 	SecondExtra)
VALUES	('QUO_MONOPOLY_CULTURE', 	'Amount', 	'ARGTYPE_IDENTITY', 	'5',			NULL, 	NULL) , 
		('QUO_MONOPOLY_CULTURE', 	'YieldType', 	'ARGTYPE_IDENTITY', 	'YIELD_CULTURE',			NULL, 	NULL) ,
		('QUO_MONOPOLY_GOLD', 	'Amount', 	'ARGTYPE_IDENTITY', 	'5',			NULL, 	NULL) , 
		('QUO_MONOPOLY_GOLD', 	'YieldType', 	'ARGTYPE_IDENTITY', 	'YIELD_GOLD',			NULL, 	NULL) ,
		('QUO_MONOPOLY_FAITH', 	'Amount', 	'ARGTYPE_IDENTITY', 	'5',			NULL, 	NULL) , 
		('QUO_MONOPOLY_FAITH', 	'YieldType', 	'ARGTYPE_IDENTITY', 	'YIELD_FAITH',			NULL, 	NULL) ,
		('QUO_MONOPOLY_SCIENCE', 	'Amount', 	'ARGTYPE_IDENTITY', 	'5',			NULL, 	NULL) , 
		('QUO_MONOPOLY_SCIENCE', 	'YieldType', 	'ARGTYPE_IDENTITY', 	'YIELD_SCIENCE',			NULL, 	NULL) ,
		('QUO_MONOPOLY_FOOD', 	'Amount', 	'ARGTYPE_IDENTITY', 	'5',			NULL, 	NULL) , 
		('QUO_MONOPOLY_FOOD', 	'YieldType', 	'ARGTYPE_IDENTITY', 	'YIELD_FOOD',			NULL, 	NULL) ,
		('QUO_MONOPOLY_PRODUCTION', 	'Amount', 	'ARGTYPE_IDENTITY', 	'5',			NULL, 	NULL) , 
		('QUO_MONOPOLY_PRODUCTION', 	'YieldType', 	'ARGTYPE_IDENTITY', 	'YIELD_PRODUCTION',			NULL, 	NULL) ;
		
INSERT INTO BuildingModifiers
		(BuildingType, ModifierId)
SELECT 	'QUO_BUILDING_MONOPOLY_' || ResourceType, 'QUO_MONOPOLY_CULTURE'
FROM 	tbl_quoMonopolyResource_YieldChanges where YieldType = 'YIELD_CULTURE' ;

INSERT INTO BuildingModifiers
		(BuildingType, ModifierId)
SELECT 	'QUO_BUILDING_MONOPOLY_' || ResourceType, 'QUO_MONOPOLY_GOLD'
FROM 	tbl_quoMonopolyResource_YieldChanges where YieldType = 'YIELD_GOLD' ;

INSERT INTO BuildingModifiers
		(BuildingType, ModifierId)
SELECT 	'QUO_BUILDING_MONOPOLY_' || ResourceType, 'QUO_MONOPOLY_FAITH'
FROM 	tbl_quoMonopolyResource_YieldChanges where YieldType = 'YIELD_FAITH' ;

INSERT INTO BuildingModifiers
		(BuildingType, ModifierId)
SELECT 	'QUO_BUILDING_MONOPOLY_' || ResourceType, 'QUO_MONOPOLY_SCIENCE'
FROM 	tbl_quoMonopolyResource_YieldChanges where YieldType = 'YIELD_SCIENCE' ;

INSERT INTO BuildingModifiers
		(BuildingType, ModifierId)
SELECT 	'QUO_BUILDING_MONOPOLY_' || ResourceType, 'QUO_MONOPOLY_FOOD'
FROM 	tbl_quoMonopolyResource_YieldChanges where YieldType = 'YIELD_FOOD' ;

INSERT INTO BuildingModifiers
		(BuildingType, ModifierId)
SELECT 	'QUO_BUILDING_MONOPOLY_' || ResourceType, 'QUO_MONOPOLY_PRODUCTION'
FROM 	tbl_quoMonopolyResource_YieldChanges where YieldType = 'YIELD_PRODUCTION' ;



-- Notifications
-- Doesn't actually work yet...

INSERT INTO EventPopupData (
                               Type,
                               Title,
                               Description,
                               BackgroundImage,
                               ForegroundImage,
                               Effects,
                               ImageText,
                               FilterCondition,
                               EffectType
                           )
                           VALUES (
                               'QUO_MONOPOLY_POPUP',
                               'LOC_QUO_MONOPOLY_NOTICE_TITLE',
                               'LOC_QUO_MONOPOLY_NOTICE_DESC',
                               'AustraliaScenario_EventBG_AusPolitic',
                               '',
                               NULL,
                               'ImageText',
                               'ANY',
                               NULL
                           );
