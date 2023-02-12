/*
    Created by Quo
*/
 


-- NOTE THAT THIS CODE ALWAYS RUNS FIRST


-- LOGS




-- Debug
INSERT INTO tblQuoDebug 
	(DebugID, 		x_Open, x_Close, 	Message)
VALUES ('Quo_Rules_Code',	'1',	'0',		'') ;





-- UNIT MOVEMENT (ROCKETBOOTS)
-- Give every unit additional move points
UPDATE Units SET BaseMoves=BaseMoves + (SELECT tblQuoOptions.Value FROM tblQuoOptions WHERE OptionID='QUO_OPTION_ROCKETBOOTS') WHERE BaseMoves >= 2;


-- Farsight
UPDATE Units SET BaseSightRange=BaseSightRange + (SELECT tblQuoOptions.Value FROM tblQuoOptions WHERE OptionID='QUO_OPTION_EXTRA_SIGHT');





-- AI FREE SETTLERS
-- AI no longer gets free Settler at higher difficulties

DELETE FROM MajorStartingUnits WHERE Unit='UNIT_SETTLER' AND Era='ERA_ANCIENT' AND AiOnly=1 AND MinDifficulty='DIFFICULTY_EMPEROR' ;





-- DISTRICTS

-- AQUEDUCT
-- Aqueducts/Baths provide Great Engineer points
INSERT INTO District_GreatPersonPoints 
	(DistrictType, 		GreatPersonClassType, 		PointsPerTurn)
VALUES	('DISTRICT_AQUEDUCT',	'GREAT_PERSON_CLASS_ENGINEER',	'1' ) ,
		('DISTRICT_BATH',	'GREAT_PERSON_CLASS_ENGINEER',	'2' ) ;




-- Note that PLOT_HAS_PLANTATION_TAG_REQUIREMENTS is changed in the setup code to apply to ALL planations, not just a subset
-- Removed in v7.0.11

/* INSERT INTO Modifiers 
	(ModifierId, ModifierType, RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
VALUES	('QUO_AQUEDUCT_FOOD', 'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD', 0, 0, NULL, 'PLOT_HAS_PLANTATION_TAG_REQUIREMENTS') ;


INSERT INTO ModifierArguments
	(ModifierId, 			Name, 		Type, 			Value, 			Extra, 	SecondExtra)
VALUES	('QUO_AQUEDUCT_FOOD', 	'Amount', 	'ARGTYPE_IDENTITY', 		'2',			NULL, 	NULL),
	('QUO_AQUEDUCT_FOOD', 	'YieldType', 	'ARGTYPE_IDENTITY', 		'YIELD_FOOD',			NULL, 	NULL) ;


INSERT INTO DistrictModifiers
		(DistrictType, 			ModifierID)
VALUES	('DISTRICT_AQUEDUCT',	'QUO_AQUEDUCT_FOOD'),
		('DISTRICT_BATH',		'QUO_AQUEDUCT_FOOD') ; 

 */
		

	


		
		
		
-- ENCAMPMENT
-- Unlocks very early. In v3.09 added a prereqCivic to prevent screamer from CQUI

-- Removed in v7.0.10 because the AI can no longer be goaded into Encampment building like before

--UPDATE Districts SET PrereqTech=NULL, PrereqCivic='CIVIC_CODE_OF_LAWS' WHERE DistrictType='DISTRICT_ENCAMPMENT' ;
--UPDATE Districts SET PrereqTech=NULL, PrereqCivic='CIVIC_CODE_OF_LAWS' WHERE DistrictType='DISTRICT_IKANDA' ;






-- Removed Palaces as a possible prereq because this somehow breaks Walls
/* INSERT INTO BuildingPrereqs 
		(Building, PrereqBuilding)
SELECT	'BUILDING_WALLS', 'BUILDING_PALACE'
FROM tblQuoOptions 
WHERE OptionID='QUO_OPTION_WALLS_HAVE_PREREQS' AND Value >= 1 ; */


-- Move the stable and barracks up a tech
--UPDATE Buildings SET PrereqTech='TECH_MINING' WHERE BuildingType='BUILDING_BARRACKS' ;
--UPDATE Buildings SET PrereqTech='TECH_ANIMAL_HUSBANDRY', Cost='80' WHERE BuildingType='BUILDING_STABLE' ;


-- HOLY SITE
-- Move it off the tech tree to the civic tree, in the Mysticism civic
UPDATE Districts SET PrereqTech=NULL, PrereqCivic='CIVIC_MYSTICISM' WHERE DistrictType='DISTRICT_HOLY_SITE'; 
UPDATE Districts SET PrereqTech=NULL, PreReqCivic='CIVIC_MYSTICISM' WHERE DistrictType='DISTRICT_LAVRA' ;


UPDATE Buildings SET PrereqTech=NULL, PreReqCivic='CIVIC_MYSTICISM' WHERE BuildingType='BUILDING_SHRINE' ;



-- Increase the number of GPP per turn to 3, because this mod makes getting prophets so much slower
UPDATE District_GreatPersonPoints SET PointsPerTurn='3' WHERE GreatPersonClassType='GREAT_PERSON_CLASS_PROPHET' AND DistrictType='DISTRICT_HOLY_SITE' ;
UPDATE District_GreatPersonPoints SET PointsPerTurn='4' WHERE GreatPersonClassType='GREAT_PERSON_CLASS_PROPHET' AND DistrictType='DISTRICT_LAVRA' ;



-- DISTRICT COST PROGRESSION MODEL
-- Coded out for now. For future release after fine tuning.

-- change progression model to increase based on number of previously built districts of this type
-- UPDATE Districts SET CostProgressionModel='COST_PROGRESSION_PREVIOUS_COPIES', CostProgressionParam1=20 ;

-- fix city centers
-- UPDATE Districts SET CostProgressionModel='NO_COST_PROGRESSION' WHERE DistrictType='DISTRICT_CITY_CENTER' ;



-- BUILDINGS

-- MONUMENTS
-- Because borders pop faster, the Monument is now a vital building. To balance with Rome, I cut the production cost of Monuments in half.
-- This is no longer necessary as of v3.11.6
-- UPDATE Buildings SET Cost=Cost*0.5 WHERE BuildingType='BUILDING_MONUMENT' ;	


--PALACE
--The Palace has the effect of walls
-- Removed in v6.0.3 in favor of better walls rules
--UPDATE Buildings SET OuterDefenseHitPoints='40', OuterDefenseStrength='2' WHERE BuildingType='BUILDING_PALACE' ;




-- SEWER
-- Now available at Mathematics
-- Removed in v6.0.4
--UPDATE Buildings SET PrereqTech='TECH_MATHEMATICS' WHERE BuildingType='BUILDING_SEWER' ;



-- Each building in the City Center now increases the production of Settlers by 10%
-- Removed because it does not seem to work properly. Instead, the cost of each Settler is reduced by 50%, back to levels prior to the Summer patch


-- Settlers costs half normal cost
--UPDATE Units SET Cost = Cost *0.5 WHERE UnitType='UNIT_SETTLER';


/* INSERT INTO Types 
	(Type, 					Kind)
VALUES 	('QUO_MODIFIER_SINGLE_CITY_ADJUST_UNIT_PRODUCTION', 		'KIND_MODIFIER');


INSERT INTO DynamicModifiers
		(ModifierType, CollectionType, EffectType)
VALUES	('QUO_MODIFIER_SINGLE_CITY_ADJUST_UNIT_PRODUCTION', 'COLLECTION_OWNER', 'EFFECT_ADJUST_UNIT_PRODUCTION') ;


INSERT INTO Modifiers 
		(ModifierId, ModifierType, RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
VALUES	('QUO_CITY_CENTER_SETTLER_BONUS', 'QUO_MODIFIER_SINGLE_CITY_ADJUST_UNIT_PRODUCTION', 0, 0, NULL, NULL) ;
 
INSERT INTO ModifierArguments
		(ModifierId, 			Name, 		Type, 			Value, 			Extra, 	SecondExtra)
VALUES	('QUO_CITY_CENTER_SETTLER_BONUS', 	'Amount', 	'ARGTYPE_IDENTITY', 	'10',			NULL, 	NULL)  ,
		('QUO_CITY_CENTER_SETTLER_BONUS', 	'UnitType', 	'ARGTYPE_IDENTITY', 	'UNIT_SETTLER',			NULL, 	NULL)  ;

INSERT INTO BuildingModifiers
		(BuildingType, 			ModifierID)
SELECT Buildings.BuildingType, 'QUO_CITY_CENTER_SETTLER_BONUS'
FROM Buildings WHERE Buildings.PrereqDistrict = 'DISTRICT_CITY_CENTER' ; */




-- REGIONAL BUILDINGS
-- Increase production modifier of buildings with radial production effect by the multiplier

UPDATE Building_YieldChanges SET YieldChange=YieldChange *(SELECT tblQuoOptions.Value FROM tblQuoOptions WHERE tblQuoOptions.OptionID='QUO_OPTION_RADIAL_BUILDING_PRODUCTION_MULTIPLIER') WHERE BuildingType='BUILDING_FACTORY' ;
UPDATE Building_YieldChanges SET YieldChange=YieldChange *(SELECT tblQuoOptions.Value FROM tblQuoOptions WHERE tblQuoOptions.OptionID='QUO_OPTION_RADIAL_BUILDING_PRODUCTION_MULTIPLIER') WHERE BuildingType='BUILDING_ELECTRONICS_FACTORY' ;
UPDATE Building_YieldChanges SET YieldChange=YieldChange *(SELECT tblQuoOptions.Value FROM tblQuoOptions WHERE tblQuoOptions.OptionID='QUO_OPTION_RADIAL_BUILDING_PRODUCTION_MULTIPLIER') WHERE BuildingType='BUILDING_POWER_PLANT' ;

UPDATE Buildings SET Entertainment='3' WHERE BuildingType='BUILDING_ZOO' ;





--- TECHS


-- ASTROLOGY
-- Changed in v3.06 to allow Scouts to embark at Celestial Navigation, Traders at Astrology
UPDATE Technologies SET EmbarkUnitType='UNIT_SCOUT' WHERE TechnologyType='TECH_CELESTIAL_NAVIGATION' ;
UPDATE Technologies SET EmbarkUnitType='UNIT_TRADER', Description='QUO_LOC_TECH_ASTROLOGY_DESCRIPTION' WHERE TechnologyType='TECH_ASTROLOGY' ;


UPDATE Technologies SET Description='QUO_LOC_TECH_WRITING_DESCRIPTION' WHERE TechnologyType='TECH_WRITING' ;


-- Increase the cost of the tech somewhat given all the changes made to it
-- UPDATE Technologies SET Cost='80' WHERE TechnologyType='TECH_ASTROLOGY' ;





-- Fix the tech tree by enforcing some stronger pre-reqs
INSERT OR IGNORE INTO TechnologyPrereqs
	(Technology, PrereqTech)
VALUES	('TECH_SHIPBUILDING','TECH_CELESTIAL_NAVIGATION'),
		('TECH_CARTOGRAPHY','TECH_MILITARY_TACTICS'),
		('TECH_STIRRUPS','TECH_CASTLES'),
		('TECH_MILITARY_ENGINEERING','TECH_CASTLES'),
		('TECH_PRINTING','TECH_CASTLES'),
		('TECH_MASS_PRODUCTION','TECH_CARTOGRAPHY');
		
UPDATE Technologies SET EraType='ERA_MEDIEVAL', Cost='390' WHERE TechnologyType='TECH_CARTOGRAPHY' ;
UPDATE Technologies SET EraType='ERA_MEDIEVAL', Cost='300', UITreeRow=2 WHERE TechnologyType='TECH_CASTLES' ;
--UPDATE Technologies SET EraType='ERA_MEDIEVAL', Cost='300', UITreeRow=3 WHERE TechnologyType='TECH_MILITARY_ENGINEERING' ;

DELETE FROM TechnologyPrereqs WHERE Technology='TECH_MILITARY_ENGINEERING' AND PrereqTech='TECH_CONSTRUCTION' ;
DELETE FROM TechnologyPrereqs WHERE Technology='TECH_MASS_PRODUCTION' AND PrereqTech='TECH_SHIPBUILDING' ;



-- Civics stuff. Delete some existing prereqs and move stuff around to make the tree flow better

-- Swap prereqs of divine right and reformed church
DELETE FROM CivicPrereqs WHERE Civic='CIVIC_REFORMED_CHURCH' ;
DELETE FROM CivicPrereqs WHERE Civic='CIVIC_DIVINE_RIGHT' ;

INSERT OR IGNORE INTO CivicPrereqs
		(Civic, PrereqCivic)
VALUES	('CIVIC_DIVINE_RIGHT','CIVIC_FEUDALISM'),
		('CIVIC_REFORMED_CHURCH','CIVIC_CIVIL_SERVICE'), 
		('CIVIC_REFORMED_CHURCH','CIVIC_THEOLOGY');


-- Update civic costs

-- Swap cost of divine right and reformed church
CREATE TEMPORARY TABLE tblQuoCivicCost
(
	QuoCivicType text,
	QuoCost text
);

INSERT INTO tblQuoCivicCost
	(QuoCivicType, 			QuoCost)
VALUES	('CIVIC_DIVINE_RIGHT',	(SELECT Cost from Civics WHERE CivicType='CIVIC_DIVINE_RIGHT') ) ,
		('CIVIC_REFORMED_CHURCH', (SELECT Cost from Civics WHERE CivicType='CIVIC_REFORMED_CHURCH') ) ;

/* UPDATE Civics SET Cost=(SELECT tblQuoCivicCost.QuoCost FROM tblQuoCivicCost WHERE tblQuoCivicCost.QuoCivicType='CIVIC_REFORMED_CHURCH'),
EraType='ERA_RENAISSANCE'
WHERE CivicType='CIVIC_DIVINE_RIGHT' ;  
 */
UPDATE Civics SET UITreeRow=0
WHERE CivicType='CIVIC_DIVINE_RIGHT' ;

UPDATE Civics SET Cost=(SELECT tblQuoCivicCost.QuoCost FROM tblQuoCivicCost WHERE tblQuoCivicCost.QuoCivicType='CIVIC_DIVINE_RIGHT'),
EraType='ERA_MEDIEVAL'
WHERE CivicType='CIVIC_REFORMED_CHURCH' ;  
		



-- WAR TYPES
-- Allow certain types of wars to unlock earlier
UPDATE DiplomaticActions SET InitiatorPrereqCivic='CIVIC_CIVIL_SERVICE' WHERE DiplomaticActionType='DIPLOACTION_DECLARE_LIBERATION_WAR' ;		
--UPDATE DiplomaticActions SET InitiatorPrereqCivic='CIVIC_CIVIL_SERVICE' WHERE DiplomaticActionType='DIPLOACTION_DECLARE_RECONQUEST_WAR' ;		
UPDATE DiplomaticActions SET InitiatorPrereqCivic='CIVIC_THEOLOGY' WHERE DiplomaticActionType='DIPLOACTION_DECLARE_HOLY_WAR' ;		
UPDATE DiplomaticActions SET InitiatorPrereqCivic='CIVIC_POLITICAL_PHILOSOPHY' WHERE DiplomaticActionType='DIPLOACTION_DECLARE_PROTECTORATE_WAR' ;


-- Allyship comes much earlier
UPDATE DiplomaticActions SET InitiatorPrereqCivic='CIVIC_EARLY_EMPIRE', TargetPrereqCivic='CIVIC_EARLY_EMPIRE' WHERE DiplomaticActionType='DIPLOACTION_ALLIANCE' ;




-- GOLDEN AGES

-- Change the difficulty of scoring the next Golden Age 
UPDATE GlobalParameters SET Value=(SELECT tblQuoOptions.Value FROM tblQuoOptions WHERE tblQuoOptions.OptionId='QUO_OPTION_THRESHOLD_SHIFT_PER_PAST_GOLDEN_AGE') 
	WHERE Name='THRESHOLD_SHIFT_PER_PAST_GOLDEN_AGE' ;
	
	
-- Change number of points required for a Golden Age	
UPDATE GlobalParameters SET Value=(SELECT tblQuoOptions.Value FROM tblQuoOptions WHERE tblQuoOptions.OptionId='QUO_OPTION_GOLDEN_AGE_SCORE_BASE_THRESHOLD') 
	WHERE Name='GOLDEN_AGE_SCORE_BASE_THRESHOLD' ;
		

-- Governor estab times		
-- Make this zero since RequirementSets cant tell difference between an established governor and a new one
-- removed - has too many unintended side effects
--UPDATE GlobalParameters SET Value='0' WHERE Name='GOVERNOR_BASE_TURNS_TO_ESTABLISH';
		
		
-- UPDATE BUG TRACKER
-- This code should go last in every file

UPDATE tblQuoDebug SET x_Close='1' WHERE DebugID='Quo_Rules_Code';