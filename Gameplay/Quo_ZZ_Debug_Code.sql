/*
    Created by Quo
*/


-- LOGS
INSERT INTO tblQuoDebug 
	(DebugID, 		x_Open, x_Close, 	Message)
VALUES ('Quo_ZZ_Debug_Code',	'1',	'0',		'') ;

 

-- This file is used soley for test code, should be cleared before releasing the mod
-- Mr. Quo, did you clear your test data?

--UPDATE Civics SET Cost = 5, EraType='ERA_ANCIENT' WHERE CivicType = 'CIVIC_NATURAL_HISTORY';
--DELETE from CivicPrereqs WHERE Civic = 'CIVIC_NATURAL_HISTORY';


					 					  
					  




		
		
		
		
-- Walls to routes code
create table tblQuo_WallsToRoutes as
SELECT routetype, prereqera, 
case 
  when routetype = 'ROUTE_ANCIENT_ROAD' then 'QUO_REQSET_WALLS_FREE_ROADS_ANCIENT'
  when routetype = 'ROUTE_MEDIEVAL_ROAD' then 'QUO_REQSET_WALLS_FREE_ROADS_MEDIEVAL'
  when routetype = 'ROUTE_INDUSTRIAL_ROAD' then 'QUO_REQSET_WALLS_FREE_ROADS_INDUSTRIAL'
  when routetype = 'ROUTE_MODERN_ROAD' then 'QUO_REQSET_WALLS_FREE_ROADS_MODERN'
end xReqSet
FROM routes
WHERE routetype in ('ROUTE_ANCIENT_ROAD', 'ROUTE_MEDIEVAL_ROAD', 'ROUTE_INDUSTRIAL_ROAD', 'ROUTE_MODERN_ROAD');


INSERT INTO RequirementSets 
	(RequirementSetId, 		RequirementSetType)
VALUES 	('QUO_REQSET_WALLS_FREE_ROADS_ANCIENT', 	'REQUIREMENTSET_TEST_ALL') ,
		('QUO_REQSET_WALLS_FREE_ROADS_MEDIEVAL', 	'REQUIREMENTSET_TEST_ALL') ,
		('QUO_REQSET_WALLS_FREE_ROADS_INDUSTRIAL', 	'REQUIREMENTSET_TEST_ALL') ,
		('QUO_REQSET_WALLS_FREE_ROADS_MODERN', 	'REQUIREMENTSET_TEST_ALL') ;


INSERT INTO RequirementSetRequirements
	(RequirementSetId,	RequirementId)
VALUES	('QUO_REQSET_WALLS_FREE_ROADS_ANCIENT', 	'QUO_REQ_GLOBAL_ERA_NOT_YET_CLASSICAL'),

		('QUO_REQSET_WALLS_FREE_ROADS_MEDIEVAL', 	'QUO_REQ_GLOBAL_ERA_IS_ATLEAST_CLASSICAL'),
		('QUO_REQSET_WALLS_FREE_ROADS_MEDIEVAL', 	'QUO_REQ_GLOBAL_ERA_NOT_YET_INDUSTRIAL'),
		
		('QUO_REQSET_WALLS_FREE_ROADS_INDUSTRIAL', 	'QUO_REQ_GLOBAL_ERA_IS_ATLEAST_INDUSTRIAL'),
		('QUO_REQSET_WALLS_FREE_ROADS_INDUSTRIAL', 	'QUO_REQ_GLOBAL_ERA_NOT_YET_MODERN'),
		
		('QUO_REQSET_WALLS_FREE_ROADS_MODERN', 	'QUO_REQ_GLOBAL_ERA_IS_ATLEAST_MODERN') ;

		
		

INSERT INTO Modifiers 
	(ModifierId, ModifierType, RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
SELECT 'QUO_WALLS_FREE_ROUTES_LVL1_' || routetype, 'MODIFIER_GRANT_ROUTE_IN_RADIUS', 1, 1, NULL, xReqSet
	FROM tblQuo_WallsToRoutes;

INSERT INTO Modifiers 
	(ModifierId, ModifierType, RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
SELECT 'QUO_WALLS_FREE_ROUTES_LVL2_' || routetype, 'MODIFIER_GRANT_ROUTE_IN_RADIUS', 1, 1, NULL, xReqSet
	FROM tblQuo_WallsToRoutes;
	
INSERT INTO Modifiers 
	(ModifierId, ModifierType, RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
SELECT 'QUO_WALLS_FREE_ROUTES_LVL3_' || routetype, 'MODIFIER_GRANT_ROUTE_IN_RADIUS', 1, 1, NULL, xReqSet
	FROM tblQuo_WallsToRoutes;

	
INSERT INTO ModifierArguments
		(ModifierId, 			Name, 		Type, 			Value, 			Extra, 	SecondExtra)
SELECT 'QUO_WALLS_FREE_ROUTES_LVL1_' || routetype, 	'RouteType', 	'ARGTYPE_IDENTITY', 	RouteType,			NULL, 	NULL
	FROM tblQuo_WallsToRoutes;
	
INSERT INTO ModifierArguments
		(ModifierId, 			Name, 		Type, 			Value, 			Extra, 	SecondExtra)
SELECT 'QUO_WALLS_FREE_ROUTES_LVL1_' || routetype, 	'Radius', 	'ARGTYPE_IDENTITY', 	'1',			NULL, 	NULL 
	FROM tblQuo_WallsToRoutes;

	
INSERT INTO ModifierArguments
		(ModifierId, 			Name, 		Type, 			Value, 			Extra, 	SecondExtra)
SELECT 'QUO_WALLS_FREE_ROUTES_LVL2_' || routetype, 	'RouteType', 	'ARGTYPE_IDENTITY', 	RouteType,			NULL, 	NULL
	FROM tblQuo_WallsToRoutes;
	
INSERT INTO ModifierArguments
		(ModifierId, 			Name, 		Type, 			Value, 			Extra, 	SecondExtra)
SELECT 'QUO_WALLS_FREE_ROUTES_LVL2_' || routetype, 	'Radius', 	'ARGTYPE_IDENTITY', 	'2',			NULL, 	NULL 
	FROM tblQuo_WallsToRoutes;

	
INSERT INTO ModifierArguments
		(ModifierId, 			Name, 		Type, 			Value, 			Extra, 	SecondExtra)
SELECT 'QUO_WALLS_FREE_ROUTES_LVL3_' || routetype, 	'RouteType', 	'ARGTYPE_IDENTITY', 	RouteType,			NULL, 	NULL
	FROM tblQuo_WallsToRoutes;
	
INSERT INTO ModifierArguments
		(ModifierId, 			Name, 		Type, 			Value, 			Extra, 	SecondExtra)
SELECT 'QUO_WALLS_FREE_ROUTES_LVL3_' || routetype, 	'Radius', 	'ARGTYPE_IDENTITY', 	'3',			NULL, 	NULL 
	FROM tblQuo_WallsToRoutes;
	

--the broadcaster
-- The level refers to the radius of the roads effect
-- This broadcaster will attach to the GameModifier table so that is affects all cities in game
INSERT INTO Requirements
		(RequirementId, 		RequirementType, 	Likeliness,	Inverse, 	Triggered)
VALUES	('QUO_REQ_WALLS_FREE_ROUTES_LVL1', 		'REQUIREMENT_CITY_HAS_X_SPECIALTY_DISTRICTS',	0,0,0) ,
		('QUO_REQ_WALLS_FREE_ROUTES_LVL2', 		'REQUIREMENT_CITY_HAS_X_SPECIALTY_DISTRICTS',	0,0,0) ,
		('QUO_REQ_WALLS_FREE_ROUTES_LVL3', 		'REQUIREMENT_CITY_HAS_X_SPECIALTY_DISTRICTS',	0,0,0) ;


-- how many districts needed to trigger effect
INSERT INTO RequirementArguments 
		(RequirementId,			Name, 			Type, 			Value, 		Extra, 	SecondExtra)		
VALUES 	('QUO_REQ_WALLS_FREE_ROUTES_LVL1',	'Amount',		'ARGTYPE_IDENTITY',	'1',	NULL,	NULL 	)   ,
		('QUO_REQ_WALLS_FREE_ROUTES_LVL2',	'Amount',		'ARGTYPE_IDENTITY',	'4',	NULL,	NULL 	)   ,
		('QUO_REQ_WALLS_FREE_ROUTES_LVL3',	'Amount',		'ARGTYPE_IDENTITY',	'7',	NULL,	NULL 	)   ;


INSERT INTO RequirementSets 
	(RequirementSetId, 				RequirementSetType)
VALUES 	('QUO_REQSET_WALLS_FREE_ROUTES_LVL1', 	'REQUIREMENTSET_TEST_ALL') ,
		('QUO_REQSET_WALLS_FREE_ROUTES_LVL2', 	'REQUIREMENTSET_TEST_ALL') ,
		('QUO_REQSET_WALLS_FREE_ROUTES_LVL3', 	'REQUIREMENTSET_TEST_ALL') ;


INSERT INTO RequirementSetRequirements
	(RequirementSetId,	RequirementId)
VALUES	('QUO_REQSET_WALLS_FREE_ROUTES_LVL1', 	'QUO_REQ_WALLS_FREE_ROUTES_LVL1') ,
		('QUO_REQSET_WALLS_FREE_ROUTES_LVL2', 	'QUO_REQ_WALLS_FREE_ROUTES_LVL2') ,
		('QUO_REQSET_WALLS_FREE_ROUTES_LVL3', 	'QUO_REQ_WALLS_FREE_ROUTES_LVL3') ;
	
	
INSERT INTO Modifiers 
	(ModifierId, ModifierType, RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
SELECT 'QUO_WALLS_FREE_ROUTES_LVL1_' || routetype || '_PLAYER', 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER', 0, 0, NULL, 'QUO_REQSET_WALLS_FREE_ROUTES_LVL1'
	FROM tblQuo_WallsToRoutes;

INSERT INTO Modifiers 
	(ModifierId, ModifierType, RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
SELECT 'QUO_WALLS_FREE_ROUTES_LVL2_' || routetype || '_PLAYER', 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER', 0, 0, NULL, 'QUO_REQSET_WALLS_FREE_ROUTES_LVL2'
	FROM tblQuo_WallsToRoutes;
	
INSERT INTO Modifiers 
	(ModifierId, ModifierType, RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
SELECT 'QUO_WALLS_FREE_ROUTES_LVL3_' || routetype || '_PLAYER', 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER', 0, 0, NULL, 'QUO_REQSET_WALLS_FREE_ROUTES_LVL3'
	FROM tblQuo_WallsToRoutes;

	
INSERT INTO ModifierArguments
		(ModifierId, 			Name, 		Type, 			Value, 			Extra, 	SecondExtra)
SELECT 'QUO_WALLS_FREE_ROUTES_LVL1_' || routetype || '_PLAYER', 'ModifierId',	'ARGTYPE_IDENTITY', 	'QUO_WALLS_FREE_ROUTES_LVL1_' || routetype,			NULL, 	NULL 
	FROM tblQuo_WallsToRoutes;

INSERT INTO ModifierArguments
		(ModifierId, 			Name, 		Type, 			Value, 			Extra, 	SecondExtra)
SELECT 'QUO_WALLS_FREE_ROUTES_LVL2_' || routetype || '_PLAYER', 'ModifierId',	'ARGTYPE_IDENTITY', 	'QUO_WALLS_FREE_ROUTES_LVL2_' || routetype,			NULL, 	NULL
	FROM tblQuo_WallsToRoutes;
	
INSERT INTO ModifierArguments
		(ModifierId, 			Name, 		Type, 			Value, 			Extra, 	SecondExtra)
SELECT 'QUO_WALLS_FREE_ROUTES_LVL3_' || routetype || '_PLAYER', 'ModifierId',	'ARGTYPE_IDENTITY', 	'QUO_WALLS_FREE_ROUTES_LVL3_' || routetype,			NULL, 	NULL 
	FROM tblQuo_WallsToRoutes;

	
INSERT INTO GameModifiers
	(ModifierId)
SELECT  'QUO_WALLS_FREE_ROUTES_LVL1_' || routetype || '_PLAYER'
	FROM tblQuo_WallsToRoutes;


INSERT INTO GameModifiers
	(ModifierId)
SELECT  'QUO_WALLS_FREE_ROUTES_LVL2_' || routetype || '_PLAYER'
	FROM tblQuo_WallsToRoutes;

	
INSERT INTO GameModifiers
	(ModifierId)
SELECT  'QUO_WALLS_FREE_ROUTES_LVL3_' || routetype || '_PLAYER'
	FROM tblQuo_WallsToRoutes;
	



--UPDATE Resources SET PrereqCivic = 'CIVIC_CODE_OF_LAWS' WHERE ResourceType='RESOURCE_ANTIQUITY_SITE';

-- UPDATE BUG TRACKER
-- This code should go last in every file

UPDATE tblQuoDebug SET x_Close='1' WHERE DebugID='Quo_ZZ_Debug_Code';