/*
    Created by Quo
*/
 

-- This file handles most, but not all units.


-- LOGS


-- Debug
INSERT INTO tblQuoDebug 
	(DebugID, 		x_Open, x_Close, 	Message)
VALUES ('Quo_Units_Code',	'1',	'0',		'') ;


-- MACHINE GUNS
-- Tried to add knockback to Machine Guns, but it doesnt work in game.

/*
-- Machine guns push units back
INSERT INTO TypeTags
	(Type,				Tag)
VALUES  ('UNIT_MACHINE_GUN', 		'CLASS_PUSHBACK') ;
*/



-- NAVAL MELEE
-- New in v3.08.3


UPDATE Units SET Range = Range+1 WHERE PromotionClass = 'PROMOTION_CLASS_NAVAL_RANGED' AND Range <= 1 
	AND EXISTS (SELECT tblQuoOptions.Value FROM tblQuoOptions WHERE tblQuoOptions.OptionID='QUO_OPTION_ARE_MELEE_SHIPS_RANGED' AND tblQuoOptions.Value >= 1);

UPDATE Units SET Range = 1, RangedCombat = Combat * 0.7 WHERE PromotionClass = 'PROMOTION_CLASS_NAVAL_MELEE' 
	AND EXISTS (SELECT tblQuoOptions.Value FROM tblQuoOptions WHERE tblQuoOptions.OptionID='QUO_OPTION_ARE_MELEE_SHIPS_RANGED' AND tblQuoOptions.Value >= 1);


-- Naval melee units receive +8 combat versus districts
-- Fear the seas!
INSERT INTO Modifiers 
	(ModifierId, ModifierType, RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
VALUES	('QUO_MOD_MELEE_NAVAL_VS_DISTRICTS', 'MODIFIER_UNIT_ADJUST_COMBAT_STRENGTH', 0, 0, NULL, 'UNIT_ATTACKING_DISTRICT_REQUIREMENTS') ;


INSERT INTO ModifierArguments
	(ModifierId, 			Name, 		Type, 			Value, 		Extra, 	SecondExtra)
VALUES	('QUO_MOD_MELEE_NAVAL_VS_DISTRICTS', 	'Amount', 	'ARGTYPE_IDENTITY', 	'8',		NULL, 	NULL) ;


-- Add a string to describe the ability in combat previews
-- No longer needed, but kept for posterity
INSERT INTO ModifierStrings
	(ModifierId, 		Context, Text)
VALUES	('QUO_MOD_MELEE_NAVAL_VS_DISTRICTS', 'Preview', 'QUO_LOC_MOD_MELEE_NAVAL_VS_DISTRICTS_PREVIEW') ;


-- Create the ability
INSERT INTO Types
	(Type, 				Kind)
VALUES 	('QUO_ABI_MELEE_NAVAL_VS_DISTRICTS',	'KIND_ABILITY'	) ;


INSERT INTO UnitAbilities
	(UnitAbilityType, 		Name, 					Description, 					Inactive)
VALUES 	('QUO_ABI_MELEE_NAVAL_VS_DISTRICTS', 	'LOC_QUO_ABI_MELEE_NAVAL_VS_DISTRICTS_NAME',	'LOC_QUO_ABI_MELEE_NAVAL_VS_DISTRICTS_DESCRIPTION', 	0) ;


INSERT INTO UnitAbilityModifiers
	(UnitAbilityType, 	ModifierId)
VALUES 	('QUO_ABI_MELEE_NAVAL_VS_DISTRICTS',	'QUO_MOD_MELEE_NAVAL_VS_DISTRICTS') ;


INSERT INTO TypeTags
	(Type,					Tag)
VALUES  ('QUO_ABI_MELEE_NAVAL_VS_DISTRICTS', 		'CLASS_NAVAL_MELEE') ;



-- Quadrimeme

UPDATE Units SET PrereqTech = 'TECH_CELESTIAL_NAVIGATION' WHERE UnitType='UNIT_QUADRIREME';


-- ANTI-CAV


-- Pikemen/Anti Cav remove 1 Move Point from any Light or Heavy Calvary unit that begins its turn next to them

-- Removed in v3.13.4 due to concerns about game performance. 

/* INSERT INTO Requirements
	(RequirementId, 		RequirementType, 	Likeliness,	Inverse, 	Triggered)
VALUES	('QUO_REQ_PIKEMAN_ADJACENT', 	'REQUIREMENT_PLOT_ADJACENT_TO_OWNER_AT_WAR',	0,0,0)  ,
	('QUO_REQ_OPPONENT_HEAVY_CALVARY', 	'REQUIREMENT_OPPONENT_UNIT_PROMOTION_CLASS_MATCHES',	0,0,0) ,
	('QUO_REQ_OPPONENT_LIGHT_CALVARY', 	'REQUIREMENT_OPPONENT_UNIT_PROMOTION_CLASS_MATCHES',	0,0,0) ,
	('QUO_REQ_OWNER_HEAVY_CALVARY', 	'REQUIREMENT_UNIT_PROMOTION_CLASS_MATCHES',	0,0,0) ,
	('QUO_REQ_OWNER_LIGHT_CALVARY', 	'REQUIREMENT_UNIT_PROMOTION_CLASS_MATCHES',	0,0,0) ;


INSERT INTO RequirementArguments 
	(RequirementId,			Name, 			Type, 			Value, 				Extra, 	SecondExtra)
VALUES 	('QUO_REQ_PIKEMAN_ADJACENT',	'MaxDistance',	'ARGTYPE_IDENTITY',	'1',	NULL,	NULL 	) ,
	('QUO_REQ_PIKEMAN_ADJACENT',	'MinDistance',	'ARGTYPE_IDENTITY',	'2',	NULL,	NULL 	) ,
	('QUO_REQ_OWNER_HEAVY_CALVARY',	'UnitPromotionClass',	'ARGTYPE_IDENTITY',	'PROMOTION_CLASS_HEAVY_CAVALRY',	NULL,	NULL 	) ,
	('QUO_REQ_OWNER_LIGHT_CALVARY',	'UnitPromotionClass',	'ARGTYPE_IDENTITY',	'PROMOTION_CLASS_LIGHT_CAVALRY',	NULL,	NULL 	);


INSERT INTO RequirementSets 
	(RequirementSetId, 		RequirementSetType)
VALUES 	('QUO_REQSET_PIKEMAN_ADJACENT', 	'REQUIREMENTSET_TEST_ALL') ,
	('QUO_REQSET_OWNER_IS_CALVARY', 	'REQUIREMENTSET_TEST_ANY') ;
 

INSERT INTO RequirementSetRequirements
	(RequirementSetId,	RequirementId)
VALUES	('QUO_REQSET_PIKEMAN_ADJACENT', 	'QUO_REQ_PIKEMAN_ADJACENT') ,
	('QUO_REQSET_OWNER_IS_CALVARY', 	'QUO_REQ_OWNER_HEAVY_CALVARY') ,
	('QUO_REQSET_OWNER_IS_CALVARY', 	'QUO_REQ_OWNER_LIGHT_CALVARY') ;


INSERT INTO Modifiers 
	(ModifierId, ModifierType, RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
VALUES	('QUO_MOD_PIKEMAN_DEBUFF', 'MODIFIER_ALL_UNITS_ATTACH_MODIFIER', 0, 0, NULL, 'QUO_REQSET_PIKEMAN_ADJACENT') ,
	('QUO_MOD_PIKEMAN_DEBUFF_2', 'MODIFIER_PLAYER_UNIT_ADJUST_MOVEMENT', 0, 0, NULL, 'QUO_REQSET_OWNER_IS_CALVARY') ;


INSERT INTO ModifierArguments
	(ModifierId, 			Name, 		Type, 			Value, 		Extra, 	SecondExtra)
VALUES	('QUO_MOD_PIKEMAN_DEBUFF', 	'ModifierId', 	'ARGTYPE_IDENTITY', 	'QUO_MOD_PIKEMAN_DEBUFF_2',		NULL, 	NULL) ,
	('QUO_MOD_PIKEMAN_DEBUFF_2', 		'Amount', 	'ARGTYPE_IDENTITY', 	'-1',		NULL, 	NULL) ;


-- Add a string to describe the ability in combat previews
-- No longer needed, but kept for posterity
INSERT INTO ModifierStrings
	(ModifierId, 		Context, Text)
VALUES	('QUO_MOD_PIKEMAN_DEBUFF_2', 'Preview', 'QUO_LOC_QUO_ABI_PIKEMAN_DEBUFF_PREVIEW') ;
 */



-- Create the ability
/* INSERT INTO Types
	(Type, 				Kind)
VALUES 	('QUO_ABI_PIKEMAN_DEBUFF',	'KIND_ABILITY'	) ;


INSERT INTO UnitAbilities
	(UnitAbilityType, 		Name, 					Description, 					Inactive)
VALUES 	('QUO_ABI_PIKEMAN_DEBUFF', 	'LOC_QUO_ABI_PIKEMAN_DEBUFF_NAME',	'LOC_QUO_ABI_PIKEMAN_DEBUFF_DESCRIPTION', 	0) ;


INSERT INTO UnitAbilityModifiers
	(UnitAbilityType, 	ModifierId)
VALUES 	('QUO_ABI_PIKEMAN_DEBUFF',	'QUO_MOD_PIKEMAN_DEBUFF') ;


INSERT INTO TypeTags
	(Type,					Tag)
VALUES  ('QUO_ABI_PIKEMAN_DEBUFF', 		'CLASS_ANTI_CAVALRY') ;
 */


-- =============== Ranged Anti-Cav units ===============
-- This code gives Anti-Cavary units ranged attacks

UPDATE Units SET Range=1, RangedCombat = Combat + 5, Combat = Combat +1
	WHERE  PromotionClass = 'PROMOTION_CLASS_ANTI_CAVALRY' 
	AND EXISTS (SELECT tblQuoOptions.Value FROM tblQuoOptions WHERE tblQuoOptions.OptionID='QUO_OPTION_ARE_ANTI_CAV_RANGED' AND tblQuoOptions.Value >= 1);
	

-- Update the Echelon ability so it provides +10 versus Calvary
UPDATE ModifierArguments SET Value='10' WHERE Name='Amount' AND ModifierId='ECHELON_ADDITIONAL_CAVALRY_BONUS' ;

-- Update the Melee ability Zweihander to make Melee units handily defeat Anti-Cavalry
-- Removed in v7.0.12
--UPDATE ModifierArguments SET Value='15' WHERE Name='Amount' AND ModifierId='ZWEIHANDER_BONUS_VS_ANTI_CAVALRY' ;
 

-- INDIVIDUAL UNITS


-- SUPPORT UNITS
-- Cut cost of Support units in half
-- Removed in v3.11.0 in favor of this being a government ability 
-- UPDATE Units SET Cost=Cost*0.5 WHERE FormationClass='FORMATION_CLASS_SUPPORT' ;


-- SWORDSMEN
-- Make Swordsmen somewhat better compared to horse units by giving them +5 Combat
-- removed in v3.06 since Swordsmen were buffed in the core code
-- added back in v3.08.2 since Swordsmen were nerfed again
-- Removed again in v3.11.0 due to this causing too many balance issues.
/* UPDATE Units SET Combat='40' WHERE UnitType='UNIT_SWORDSMAN' ;

-- Update any units that derive from the Swordsman. If the total would be more than 50, don't do the update
UPDATE Units
   SET Combat = Combat + 5
 WHERE Units.UnitType IN (
    SELECT CivUniqueUnitType
      FROM UnitReplaces
     WHERE ReplacesUnitType = 'UNIT_SWORDSMAN' AND 
           Units.Combat < 50
);
 */



-- MUSKETMEN
-- Musketmen no longer require Niter, because this destroys the AI
-- Removed in v7.0.14

--UPDATE Units SET StrategicResource=NULL WHERE UnitType='UNIT_MUSKETMAN' ;





-- SCOUTS
-- Scouts start at level 2 instead of level 1

-- in v5.0.6 this applies to all units derived from a unit that is a Recon unit

UPDATE Units
   SET InitialLevel = InitialLevel + 1
 WHERE Units.PromotionClass = 'PROMOTION_CLASS_RECON' ;






-- Scouts can build Roads
-- UPDATE Route_ValidBuildUnits SET UnitType='UNIT_SCOUT' ;
-- UPDATE Units SET BuildCharges=8 WHERE UnitType='UNIT_SCOUT' ;




--SETTLER STEALING
-- Settler escapes on contact
UPDATE Units SET CanRetreatWhenCaptured='1' WHERE UnitType='UNIT_SETTLER' AND (SELECT tblQuoOptions.Value FROM tblQuoOptions WHERE tblQuoOptions.OptionID='QUO_OPTION_SETTLERS_ESCAPE') > 0;



-- AIR UNITS
-- Aerodrome no longer required to build air units
-- Removed in v7.0.14

--UPDATE Units SET PrereqDistrict = NULL WHERE PrereqDistrict="DISTRICT_AERODROME" ;




-- UPDATE BUG TRACKER
-- This code should go last in every file

UPDATE tblQuoDebug SET x_Close='1' WHERE DebugID='Quo_Units_Code';