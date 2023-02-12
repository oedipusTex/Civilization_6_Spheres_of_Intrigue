/*
    Created by Quo
*/
 

-- LOGS
-- Debug
INSERT INTO tblQuoDebug 
	(DebugID, 		x_Open, x_Close, 	Message)
VALUES ('Quo_Oasis_Code',	'1',	'0',		'') ;


-- OASIS
-- Make the area adjacent to an Oasis worth settling, can result in some amazing locations if you get lucky
INSERT OR REPLACE INTO Feature_AdjacentYields (FeatureType, YieldType, YieldChange) VALUES ('FEATURE_OASIS', 'YIELD_FOOD', '1') ;
INSERT OR REPLACE INTO Feature_AdjacentYields (FeatureType, YieldType, YieldChange) VALUES ('FEATURE_OASIS', 'YIELD_GOLD', '1') ;


-- Adjust which tiles can appear next to the oasis
INSERT OR REPLACE INTO Feature_NotAdjacentTerrains
	(FeatureType,		TerrainType)
VALUES	('FEATURE_OASIS',	'TERRAIN_GRASS_HILLS'),
	('FEATURE_OASIS',	'TERRAIN_PLAINS_HILLS') ;



-- Make the Oasis appear in Snow, as a Hotspot
INSERT OR REPLACE INTO Feature_ValidTerrains 
	(FeatureType,		TerrainType)
VALUES	('FEATURE_OASIS',	'TERRAIN_SNOW') ;





-- Eventually we will roll in a new Oasis asset for Snow, but this requires organizing some additional visual resources

/*
INSERT INTO Types
	(Type, 				Kind)
VALUES 	('QUO_FEATURE_HOTSPOT',		'KIND_FEATURE'	) ;

INSERT INTO Features 
    SELECT 'QUO_FEATURE_HOTSPOT',Name,Description,Quote,Coast,NoCoast,NoRiver,NoAdjacentFeatures,RequiresRiver,MovementChange,SightThroughModifier,Impassable,NaturalWonder,RemoveTech,Removable,AddCivic,DefenseModifier,AddsFreshWater,Appeal,MinDistanceLand,MaxDistanceLand,NotNearFeature,Lake,Tiles,Adjacent,NoResource,DoubleAdjacentTerrainYield,NotCliff,MinDistanceNW,CustomPlacement,Forest,AntiquityPriority,QuoteAudio,Settlement
    FROM Features where FeatureType='FEATURE_OASIS' ;

INSERT INTO Feature_ValidTerrains 
	(FeatureType,		TerrainType)
VALUES	('QUO_FEATURE_HOTSPOT',	'TERRAIN_TUNDRA') ;
*/



-- UPDATE BUG TRACKER
-- This code should go last in every file

UPDATE tblQuoDebug SET x_Close='1' WHERE DebugID='Quo_Oasis_Code';
