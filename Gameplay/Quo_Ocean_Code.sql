/*
    Created by Quo
*/
 

-- LOGS
-- Debug
INSERT INTO tblQuoDebug 
	(DebugID, 		x_Open, x_Close, 	Message)
VALUES ('Quo_Ocean_Code',	'1',	'0',		'') ;



-- Note: Everything that was once part of this code has been removed as of Rising Storm because most of what was here has since been addressed by Firaxis.



-- FISHING BOATS
-- Add 1 gold
-- Removed in v7.0.12 because Firaxis buffed boats

--UPDATE Improvement_YieldChanges SET YieldChange='1' WHERE ImprovementType='IMPROVEMENT_FISHING_BOATS' AND YieldType='YIELD_GOLD' ;


-- SEA RESOURCES
-- Add 1 to the respective yield of each sea resource
-- removed in v7.0.12 since Firaxis buffed these resources

/* UPDATE Resource_YieldChanges SET YieldChange='2' WHERE ResourceType ='RESOURCE_FISH' AND YieldType='YIELD_FOOD' ;
UPDATE Resource_YieldChanges SET YieldChange='2' WHERE ResourceType ='RESOURCE_PEARLS' AND YieldType='YIELD_FAITH' ;
INSERT OR REPLACE INTO Resource_YieldChanges (ResourceType, YieldType, YieldChange) VALUES ('RESOURCE_WHALES', 'YIELD_FAITH', '1') ;
INSERT OR REPLACE INTO Resource_YieldChanges (ResourceType, YieldType, YieldChange) VALUES ('RESOURCE_CRABS', 'YIELD_CULTURE', '1') ;
UPDATE Resource_YieldChanges SET YieldChange='2' WHERE ResourceType ='RESOURCE_TURTLES' AND YieldType='YIELD_SCIENCE' ;
 */

-- ICE
-- Remove Ice completely from the map, to make sure the globe can be circled with boats
-- Removed in v3.14.6, because Firaxis fixed this issue in a patch
--DELETE FROM Feature_ValidTerrains WHERE FeatureType='FEATURE_ICE' ;


-- HARBOR, DOCK YARD
-- Unlock at Astrology, replacing where Holy site used to unlock. This is a little strange, but allows AI to grab this district faster.
--UPDATE Districts SET PrereqTech='TECH_ASTROLOGY' WHERE DistrictType='DISTRICT_HARBOR'; 
--UPDATE Districts SET PrereqTech='TECH_ASTROLOGY' WHERE DistrictType='DISTRICT_ROYAL_NAVY_DOCKYARD'; 

--UPDATE Buildings SET PrereqTech='TECH_ASTROLOGY' WHERE BuildingType='BUILDING_LIGHTHOUSE' ;

-- no longer update English Harbors since the purpose of that district has changed
-- UPDATE Districts SET PrereqTech='TECH_ASTROLOGY' WHERE DistrictType='DISTRICT_ROYAL_NAVY_DOCKYARD'; 


-- HARBOR ADJACENCIES


-- Add adjacency gold/hammers for city centers, unlocking at certain techs
/* INSERT INTO Adjacency_YieldChanges 
	(ID,				Description,				YieldType,		YieldChange,	TilesRequired,	OtherDistrictAdjacent,	AdjacentSeaResource,	AdjacentTerrain,	AdjacentFeature,	AdjacentRiver,	AdjacentWonder,	AdjacentNaturalWonder,	AdjacentImprovement,	AdjacentDistrict,	PrereqCivic,	PrereqTech,	ObsoleteCivic,	ObsoleteTech,	AdjacentResource)
VALUES	('QUO_SeaResource_Hammers',	'QUO_LOC_DISTRICT_SEARESOURCE_HAMMERS',	'YIELD_PRODUCTION',	2,		1,		0,			1,			NULL,			NULL,			0,		0,		0,			NULL,			NULL,			NULL,		NULL,		NULL,		NULL,		0) ,
	('QUO_Coast_Gold',		'QUO_LOC_DISTRICT_COAST_GOLD',		'YIELD_GOLD',		1,		2,		0,			0,			'TERRAIN_COAST',	NULL,			0,		0,		0,			NULL,			NULL,			NULL,		'TECH_SAILING',		NULL,		NULL,		0) ,
	('QUO_Coast_Gold_2',		'QUO_LOC_DISTRICT_COAST_GOLD',		'YIELD_GOLD',		1,		2,		0,			0,			'TERRAIN_COAST',	NULL,			0,		0,		0,			NULL,			NULL,			NULL,		'TECH_CARTOGRAPHY',		NULL,		NULL,		0) ,
	('QUO_Coast_Hammers',		'QUO_LOC_DISTRICT_COAST_HAMMERS',	'YIELD_PRODUCTION',	1,		2,		0,			0,			'TERRAIN_COAST',	NULL,			0,		0,		0,			NULL,			NULL,			NULL,		'TECH_CELESTIAL_NAVIGATION',		NULL,		NULL,		0),
	('QUO_Harbor_CityCenter',	'QUO_LOC_DISTRICT_COAST_GOLD',		'YIELD_GOLD',		2,		1,		0,			0,			 NULL,			NULL,			0,		0,		0,			NULL,			'DISTRICT_CITY_CENTER',	NULL,		NULL,		NULL,		NULL,		0) ,
	('QUO_Harbor_Dock_Yard',	'QUO_LOC_DISTRICT_COAST_GOLD',		'YIELD_GOLD',		1,		1,		0,			0,			NULL,			NULL,			0,		0,		0,			NULL,			'DISTRICT_ROYAL_NAVY_DOCKYARD',			NULL,		NULL,		NULL,		NULL,		0),
	('QUO_Dock_Yard_Harbor',	'QUO_LOC_DISTRICT_COAST_GOLD',		'YIELD_GOLD',		1,		1,		0,			0,			NULL,			NULL,			0,		0,		0,			NULL,			'DISTRICT_HARBOR',			NULL,		NULL,		NULL,		NULL,		0) ; 			
 */

-- CITY CENTER
-- Give bonuses for coast adjacencies and for docks next to each other or the city center
-- Note not all of the above are assigned. some were removed for balance purposes.

-- In the Spring patch Firaxis added Harbor to City Center adjacencies, so they have been removed here
/* INSERT INTO District_Adjacencies
	(DistrictType,			YieldChangeID)
VALUES	('DISTRICT_CITY_CENTER',	'QUO_Coast_Gold') ,
 	('DISTRICT_CITY_CENTER',	'QUO_Coast_Gold_2'),  
	('DISTRICT_CITY_CENTER',	'QUO_Coast_Hammers') ;
 */


-- UPDATE BUG TRACKER
-- This code should go last in every file

UPDATE tblQuoDebug SET x_Close='1' WHERE DebugID='Quo_Ocean_Code';


