/*
    Created by Quo
	ABOUT THIS FILE

	The Scratchpad is intended for players who want to seize extra control of their games. It allows you to write custom code, 
	with some suggested ideas included.
	
	This file is always loaded last, AFTER all files in Quo's Combined Tweaks mods. Thus, any values you edit here will be based
	on values determined by the mod.

	The values in this Scraptchpad are meant to be edited as you see fit. Comment out lines that arent useful for your game, and add lines where 
	necessary. Once you have saved a game with this mod active, you can continue to edit this file and (for the most part) any changes you make
	here will appear in your game. 
*/

-- Create an entry in the debug table for bug tracking purposes
INSERT INTO tblQuoDebug 
	(DebugID, 		x_Open, x_Close, 	Message)
VALUES ('MyScratchpad',	'1',	'0',		'') ;
 

 
 
--======== BEGIN YOUR CUSTOM EDITS HERE
 

 

-- Lower the cost of war mongering by era. This used to be part of the core code. Uncomment below to re-enable. 
/* UPDATE Eras SET WarmongerPoints ='1', WarmongerLevelDescription='LOC_WARMONGER_LEVEL_LIGHT' WHERE EraType='ERA_CLASSICAL' ;
UPDATE Eras SET WarmongerPoints ='1', WarmongerLevelDescription='LOC_WARMONGER_LEVEL_LIGHT' WHERE EraType='ERA_MEDIEVAL' ;
UPDATE Eras SET WarmongerPoints ='2', WarmongerLevelDescription='LOC_WARMONGER_LEVEL_MODERATE' WHERE EraType='ERA_RENAISSANCE' ;
UPDATE Eras SET WarmongerPoints ='2', WarmongerLevelDescription='LOC_WARMONGER_LEVEL_MODERATE' WHERE EraType='ERA_INDUSTRIAL' ;
UPDATE Eras SET WarmongerPoints ='2', WarmongerLevelDescription='LOC_WARMONGER_LEVEL_MODERATE' WHERE EraType='ERA_MODERN' ;
UPDATE Eras SET WarmongerPoints ='4', WarmongerLevelDescription='LOC_WARMONGER_LEVEL_HEAVY' WHERE EraType='ERA_ATOMIC' ;
UPDATE Eras SET WarmongerPoints ='4', WarmongerLevelDescription='LOC_WARMONGER_LEVEL_HEAVY' WHERE EraType='ERA_INFORMATION' ; */
 

 
 




 
/*  INSERT INTO Building_ValidTerrains
	(BuildingType, TerrainType)
VALUES('BUILDING_PETRA', 'TERRAIN_DESERT_HILLS') ;
 */  
 
 
-- RELATIONS

-- To make other civs really friendly or really unfriendly play with numbers here
-- UPDATE ModifierArguments SET Value='100' WHERE Name='InitialValue' AND ModifierId LIKE '%DIPLO%' ;



-- UNITS 

-- Super Sight for all units
-- UPDATE Units SET BaseSightRange=5 ;	


-- Make every unit cost x hammers. Add a WHERE tag if you only want to affect certain units.
-- UPDATE Units SET Cost=1 ;


-- Tech/civic doesn't make units go obsolete
-- UPDATE Units SET MandatoryObsoleteTech=NULL ;
-- UPDATE Units SET ObsoleteTech=NULL ;
-- UPDATE Units SET MandatoryObsoleteCivic=NULL ;
-- UPDATE Units SET ObsoleteTech=NULL ;

-- DELETE FROM UnitUpgrades ;




-- Remove tech and civic pre-reqs from all units

-- UPDATE Units SET PrereqTech=NULL ;
-- UPDATE Units Set PrereqCivic=NULL ;

-- UPDATE Units SET PrereqTech=NULL, StrategicResource=NULL WHERE UnitType='UNIT_JET_FIGHTER' ;



-- Give Builder-type units extra xX Build charges
-- UPDATE Units SET BuildCharges=BuildCharges*3 ;


-- Build Settlers even with 1 population
-- UPDATE Units SET PopulationCost='0', PrereqPopulation='1' WHERE UnitType='UNIT_SETTLER' ;



-- Optional Unit Settings
-- The settings below are provided in case you need them. Just remove the -- comment marker to activate. Be careful, as not as all are tested.

-- All units start at level 5 (good for testing promotions)
-- UPDATE Units SET InitialLevel='5' ;


-- Purchase any unit with gold. Careful with this--not tested. If you want to exclude units bought with Faith from this update, add   WHERE PurchaseYield=NULL
-- UPDATE Units SET PurchaseYield='YIELD_GOLD' ;


-- GOVERNMENTS
-- Make them all available from turn 1
-- UPDATE Governments SET PrereqCivic=NULL;



-- TECHS

-- Change tech rate. If you want to increase costs, make the number below a number larger than 1
-- UPDATE Technologies SET Cost=Cost*.1 ;



-- CIVICS

-- Change civic rate. If you want to increase costs, make the number below a number larger than 1
-- UPDATE Civics SET Cost=Cost*.1 ;


-- POLICIES
-- Unlock all policies from Turn 1
-- UPDATE Policies SET PrereqCivic=NULL ;

-- DELETE FROM ObsoletePolicies ;



--RESOURCES

-- Reveal everything on start of the game
-- UPDATE Resources SET PrereqTech= NULL ;
-- UPDATE Resources SET PrereqCivic= NULL ;
-- UPDATE Resources SET RevealedEra= 1 ; 



-- IMPROVEMENTS

-- Build improvements even if you don't have the tech
-- UPDATE Improvements SET PrereqTech= NULL ;
-- UPDATE Improvements SET PrereqCivic= NULL ;




-- BUILDINGS

-- Build any building even if you don't have the tech/civic
-- UPDATE Buildings SET PrereqTech= NULL ;
-- UPDATE Buildings SET PrereqCivic= NULL ;


-- Buildings cost x Hammers
-- UPDATE Buildings SET Cost= 1 ;




-- DISTRICTS
-- Unlock all districts and buildings 
-- UPDATE Districts SET PrereqTech= NULL ;
-- UPDATE Districts SET PrereqCivic= NULL ;

--UPDATE Districts SET PrereqTech=NULL WHERE DistrictType='DISTRICT_AERODROME' ;

-- Districts cost x Hammers
-- UPDATE Districts SET Cost= 1 ;


-- Districts dont require population
-- UPDATE Districts SET RequiresPopulation=0 ;


-- PROJECTS

-- Make all Projects available
-- UPDATE Projects SET Cost=1 ;
-- UPDATE Projects SET PrereqTech=NULL ;
-- UPDATE Projects SET PrereqCivic=NULL ;



-- STARTING UNIT

-- Set starting units
/*
INSERT INTO MajorStartingUnits
	(Unit, Era, District, Quantity, NotStartTile, AiOnly)
VALUES	('UNIT_HELICOPTER', 'ERA_ANCIENT', 'DISTRICT_CITY_CENTER', 1, 1, 0) ,
	('UNIT_MODERN_AT', 'ERA_ANCIENT', 'DISTRICT_CITY_CENTER', 1, 1, 0) ;
*/



-- CITY CENTER

-- Give x housing and x Entertainment to all cities
-- UPDATE Districts SET Housing=100 WHERE DistrictType='DISTRICT_CITY_CENTER' ;
-- UPDATE Districts SET Entertainment=100 WHERE DistrictType='DISTRICT_CITY_CENTER' ;



-- PALACE

-- Palace gives extra Gold per turn. Modify as needed. Can also change to YIELD_CULTURE, YIELD_SCIENCE, YIELD_FAITH etc
-- UPDATE Building_YieldChanges SET YieldChange=200 WHERE BuildingType='BUILDING_PALACE' AND YieldType='YIELD_GOLD' ; 

-- Give a pool of Gold on starting
/*
INSERT INTO Modifiers 
	(ModifierId, ModifierType, RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
VALUES	('QUO_FREE_GOLD', 'MODIFIER_PLAYER_GRANT_YIELD', 1, 1, NULL, NULL) ;


INSERT INTO ModifierArguments
	(ModifierId, 			Name, 			Type, 			Value, 		Extra, 	SecondExtra)
VALUES	('QUO_FREE_GOLD', 	'Amount', 	'ARGTYPE_IDENTITY', 	'60000',		NULL, 	NULL),
	('QUO_FREE_GOLD', 	'YieldType', 	'ARGTYPE_IDENTITY', 	'YIELD_GOLD',	NULL, 	NULL)  ;


INSERT INTO TraitModifiers
	(TraitType, 			ModifierID)
VALUES	('TRAIT_LEADER_MAJOR_CIV',	'QUO_FREE_GOLD')  ;
*/


-- Give a pool of Faith on starting
/*
INSERT INTO Modifiers 
	(ModifierId, ModifierType, RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
VALUES	('QUO_FREE_STARTING_FAITH', 'MODIFIER_PLAYER_GRANT_YIELD', 1, 1, NULL, NULL) ;


INSERT INTO ModifierArguments
	(ModifierId, 			Name, 			Type, 			Value, 		Extra, 	SecondExtra)
VALUES	('QUO_FREE_STARTING_FAITH', 	'Amount', 	'ScaleByGameSpeed', 	'0',		NULL, 	NULL),
	('QUO_FREE_STARTING_FAITH', 	'YieldType', 	'ARGTYPE_IDENTITY', 	'YIELD_FAITH',	NULL, 	NULL)  ;


INSERT INTO TraitModifiers
	(TraitType, 			ModifierID)
VALUES	('TRAIT_LEADER_MAJOR_CIV',	'QUO_FREE_STARTING_FAITH')  ;
*/



-- ============ END EDITS


-- UPDATE BUG TRACKER
-- This code should go last in every file. Do not modify or remove.

UPDATE tblQuoDebug SET x_Close='1' WHERE DebugID='MyScratchpad';