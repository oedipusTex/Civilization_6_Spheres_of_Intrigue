/*
    Created by Quo
*/
 


-- LOGS
-- Debug
INSERT INTO tblQuoDebug 
	(DebugID, 		x_Open, x_Close, 	Message)
VALUES ('Quo_Policies_Code',	'1',	'0',		'') ;


-- UNIT PRODUCTION SPEED POLICIES

-- All of these policies now apply retroactively to units of previous eras.

/* INSERT OR IGNORE INTO PolicyModifiers
		(PolicyType, 		ModifierId)
VALUES	-- MELEE
		-- feudal contract
		('POLICY_FEUDAL_CONTRACT',	'AGOGE_ANCIENT_MELEE_PRODUCTION') ,
		('POLICY_FEUDAL_CONTRACT',	'AGOGE_ANCIENT_RANGED_PRODUCTION') ,
		('POLICY_FEUDAL_CONTRACT',	'AGOGE_CLASSICAL_MELEE_PRODUCTION') ,
		('POLICY_FEUDAL_CONTRACT',	'AGOGE_CLASSICAL_RANGED_PRODUCTION') ,
		
		-- grand armee
		('POLICY_GRANDE_ARMEE',	'AGOGE_ANCIENT_MELEE_PRODUCTION') ,
		('POLICY_GRANDE_ARMEE',	'AGOGE_ANCIENT_RANGED_PRODUCTION') ,
		('POLICY_GRANDE_ARMEE',	'AGOGE_CLASSICAL_MELEE_PRODUCTION') ,
		('POLICY_GRANDE_ARMEE',	'AGOGE_CLASSICAL_RANGED_PRODUCTION') ,
		
		('POLICY_GRANDE_ARMEE',	'FEUDALCONTRACT_MEDIEVAL_MELEE_PRODUCTION') ,
		('POLICY_GRANDE_ARMEE',	'FEUDALCONTRACT_MEDIEVAL_RANGED_PRODUCTION') ,
		('POLICY_GRANDE_ARMEE',	'FEUDALCONTRACT_RENAISSANCE_MELEE_PRODUCTION') ,
		('POLICY_GRANDE_ARMEE',	'FEUDALCONTRACT_RENAISSANCE_RANGED_PRODUCTION') ,

		-- military first
		('POLICY_MILITARY_FIRST',	'AGOGE_ANCIENT_MELEE_PRODUCTION') ,
		('POLICY_MILITARY_FIRST',	'AGOGE_ANCIENT_RANGED_PRODUCTION') ,
		('POLICY_MILITARY_FIRST',	'AGOGE_CLASSICAL_MELEE_PRODUCTION') ,
		('POLICY_MILITARY_FIRST',	'AGOGE_CLASSICAL_RANGED_PRODUCTION') ,
		
		('POLICY_MILITARY_FIRST',	'FEUDALCONTRACT_MEDIEVAL_MELEE_PRODUCTION') ,
		('POLICY_MILITARY_FIRST',	'FEUDALCONTRACT_MEDIEVAL_RANGED_PRODUCTION') ,
		('POLICY_MILITARY_FIRST',	'FEUDALCONTRACT_RENAISSANCE_MELEE_PRODUCTION') ,
		('POLICY_MILITARY_FIRST',	'FEUDALCONTRACT_RENAISSANCE_RANGED_PRODUCTION') ,
		
		('POLICY_MILITARY_FIRST',	'GRANDEARMEE_INDUSTRIAL_MELEE_PRODUCTION') ,
		('POLICY_MILITARY_FIRST',	'GRANDEARMEE_INDUSTRIAL_RANGED_PRODUCTION') ,
		('POLICY_MILITARY_FIRST',	'GRANDEARMEE_MODERN_MELEE_PRODUCTION') ,
		('POLICY_MILITARY_FIRST',	'GRANDEARMEE_MODERN_RANGED_PRODUCTION') ,
		
		-- RIDERS
		
		-- chivalry
		('POLICY_CHIVALRY',	'MANEUVER_ANCIENT_HEAVY_CAVALRY_PRODUCTION') ,
		('POLICY_CHIVALRY',	'MANEUVER_ANCIENT_LIGHT_CAVALRY_PRODUCTION') ,
		('POLICY_CHIVALRY',	'MANEUVER_CLASSICAL_HEAVY_CAVALRY_PRODUCTION') ,
		('POLICY_CHIVALRY',	'MANEUVER_CLASSICAL_LIGHT_CAVALRY_PRODUCTION') ,
		
		-- lightning warfare
		('POLICY_LIGHTNING_WARFARE',	'MANEUVER_ANCIENT_HEAVY_CAVALRY_PRODUCTION') ,
		('POLICY_LIGHTNING_WARFARE',	'MANEUVER_ANCIENT_LIGHT_CAVALRY_PRODUCTION') ,
		('POLICY_LIGHTNING_WARFARE',	'MANEUVER_CLASSICAL_HEAVY_CAVALRY_PRODUCTION') ,
		('POLICY_LIGHTNING_WARFARE',	'MANEUVER_CLASSICAL_LIGHT_CAVALRY_PRODUCTION') ,
		
		('POLICY_LIGHTNING_WARFARE',	'CHIVALRY_INDUSTRIAL_HEAVY_CAVALRY_PRODUCTION') ,
		('POLICY_LIGHTNING_WARFARE',	'CHIVALRY_INDUSTRIAL_LIGHT_CAVALRY_PRODUCTION') ,
		('POLICY_LIGHTNING_WARFARE',	'CHIVALRY_MEDIEVAL_HEAVY_CAVALRY_PRODUCTION') ,
		('POLICY_LIGHTNING_WARFARE',	'CHIVALRY_MEDIEVAL_LIGHT_CAVALRY_PRODUCTION') ,
		('POLICY_LIGHTNING_WARFARE',	'CHIVALRY_RENAISSANCE_HEAVY_CAVALRY_PRODUCTION') ,
		('POLICY_LIGHTNING_WARFARE',	'CHIVALRY_RENAISSANCE_LIGHT_CAVALRY_PRODUCTION') ,		
		
		
		-- NAVAL
		
		-- press gangs
		('POLICY_PRESS_GANGS',	'MARITIMIEINDUSTRIES_ANCIENT_NAVAL_MELEE_PRODUCTION') ,
		('POLICY_PRESS_GANGS',	'MARITIMIEINDUSTRIES_ANCIENT_NAVAL_RAIDER_PRODUCTION') ,
		('POLICY_PRESS_GANGS',	'MARITIMIEINDUSTRIES_ANCIENT_NAVAL_RANGED_PRODUCTION') ,
		('POLICY_PRESS_GANGS',	'MARITIMIEINDUSTRIES_CLASSICAL_NAVAL_MELEE_PRODUCTION') ,
		('POLICY_PRESS_GANGS',	'MARITIMIEINDUSTRIES_CLASSICAL_NAVAL_RAIDER_PRODUCTION') ,
		('POLICY_PRESS_GANGS',	'MARITIMIEINDUSTRIES_CLASSICAL_NAVAL_RANGED_PRODUCTION') ,
		
		-- international waters
		('POLICY_INTERNATIONAL_WATERS',	'MARITIMIEINDUSTRIES_ANCIENT_NAVAL_MELEE_PRODUCTION') ,
		('POLICY_INTERNATIONAL_WATERS',	'MARITIMIEINDUSTRIES_ANCIENT_NAVAL_RAIDER_PRODUCTION') ,
		('POLICY_INTERNATIONAL_WATERS',	'MARITIMIEINDUSTRIES_ANCIENT_NAVAL_RANGED_PRODUCTION') ,
		('POLICY_INTERNATIONAL_WATERS',	'MARITIMIEINDUSTRIES_CLASSICAL_NAVAL_MELEE_PRODUCTION') ,
		('POLICY_INTERNATIONAL_WATERS',	'MARITIMIEINDUSTRIES_CLASSICAL_NAVAL_RAIDER_PRODUCTION') ,
		('POLICY_INTERNATIONAL_WATERS',	'MARITIMIEINDUSTRIES_CLASSICAL_NAVAL_RANGED_PRODUCTION') ,

		('POLICY_INTERNATIONAL_WATERS',	'PRESSGANGS_INDUSTRIAL_NAVAL_MELEE_PRODUCTION') ,
		('POLICY_INTERNATIONAL_WATERS',	'PRESSGANGS_INDUSTRIAL_NAVAL_RAIDER_PRODUCTION') ,
		('POLICY_INTERNATIONAL_WATERS',	'PRESSGANGS_INDUSTRIAL_NAVAL_RANGED_PRODUCTION') ,
		('POLICY_INTERNATIONAL_WATERS',	'PRESSGANGS_RENAISSANCE_NAVAL_MELEE_PRODUCTION') ,
		('POLICY_INTERNATIONAL_WATERS',	'PRESSGANGS_RENAISSANCE_NAVAL_RAIDER_PRODUCTION') ,
		('POLICY_INTERNATIONAL_WATERS',	'PRESSGANGS_RENAISSANCE_NAVAL_RANGED_PRODUCTION') ;
 */		
		
	
		

-- Tier the bonus to production		
UPDATE ModifierArguments SET Value='30' WHERE ModifierId='AGOGE_ANCIENT_MELEE_PRODUCTION' AND Name='Value' ;
UPDATE ModifierArguments SET Value='30' WHERE ModifierId='AGOGE_ANCIENT_RANGED_PRODUCTION' AND Name='Value' ;
UPDATE ModifierArguments SET Value='30' WHERE ModifierId='AGOGE_CLASSICAL_MELEE_PRODUCTION' AND Name='Value' ;
UPDATE ModifierArguments SET Value='30' WHERE ModifierId='AGOGE_CLASSICAL_RANGED_PRODUCTION' AND Name='Value' ;

UPDATE ModifierArguments SET Value='40' WHERE ModifierId='FEUDALCONTRACT_MEDIEVAL_MELEE_PRODUCTION' AND Name='Value' ;
UPDATE ModifierArguments SET Value='40' WHERE ModifierId='FEUDALCONTRACT_MEDIEVAL_RANGED_PRODUCTION' AND Name='Value' ;
UPDATE ModifierArguments SET Value='40' WHERE ModifierId='FEUDALCONTRACT_RENAISSANCE_MELEE_PRODUCTION' AND Name='Value' ;
UPDATE ModifierArguments SET Value='40' WHERE ModifierId='FEUDALCONTRACT_RENAISSANCE_RANGED_PRODUCTION' AND Name='Value' ;



UPDATE ModifierArguments SET Value='30' WHERE ModifierId='MANEUVER_ANCIENT_HEAVY_CAVALRY_PRODUCTION' AND Name='Value' ;
UPDATE ModifierArguments SET Value='30' WHERE ModifierId='MANEUVER_ANCIENT_LIGHT_CAVALRY_PRODUCTION' AND Name='Value' ;
UPDATE ModifierArguments SET Value='30' WHERE ModifierId='MANEUVER_CLASSICAL_HEAVY_CAVALRY_PRODUCTION' AND Name='Value' ;
UPDATE ModifierArguments SET Value='30' WHERE ModifierId='MANEUVER_CLASSICAL_LIGHT_CAVALRY_PRODUCTION' AND Name='Value' ;


UPDATE ModifierArguments SET Value='40' WHERE ModifierId='CHIVALRY_INDUSTRIAL_HEAVY_CAVALRY_PRODUCTION' AND Name='Value' ;
UPDATE ModifierArguments SET Value='40' WHERE ModifierId='CHIVALRY_INDUSTRIAL_LIGHT_CAVALRY_PRODUCTION' AND Name='Value' ;
UPDATE ModifierArguments SET Value='40' WHERE ModifierId='CHIVALRY_MEDIEVAL_HEAVY_CAVALRY_PRODUCTION' AND Name='Value' ;
UPDATE ModifierArguments SET Value='40' WHERE ModifierId='CHIVALRY_MEDIEVAL_LIGHT_CAVALRY_PRODUCTION' AND Name='Value' ;
UPDATE ModifierArguments SET Value='40' WHERE ModifierId='CHIVALRY_RENAISSANCE_HEAVY_CAVALRY_PRODUCTION' AND Name='Value' ;
UPDATE ModifierArguments SET Value='40' WHERE ModifierId='CHIVALRY_RENAISSANCE_LIGHT_CAVALRY_PRODUCTION' AND Name='Value' ;



-- GREAT PEOPLE POLICIES
-- Convert each of these to a Diplomatic Policy
UPDATE Policies SET GovernmentSlotType='SLOT_DIPLOMATIC' WHERE GovernmentSlotType='SLOT_GREAT_PERSON' AND (SELECT tblQuoOptions.Value FROM tblQuoOptions WHERE tblQuoOptions.OptionID='QUO_OPTION_CONVERT_GP_POLICIES_TO_DIPLO') >0; 


		
		
-- SURVEY
-- Allow Scouts to ignore rivers and ZOC

-- In v3.10.3, added Settlers to units affected by this policy


INSERT INTO Requirements
	(RequirementId, 		RequirementType, 	Likeliness,	Inverse, 	Triggered)
VALUES	('QUO_REQ_SURVEY_SETTLER', 	'REQUIREMENT_UNIT_TYPE_MATCHES',	0,0,0) ;


INSERT INTO RequirementArguments 
		(RequirementId,			Name, 			Type, 			Value, 		Extra, 	SecondExtra)
VALUES 	('QUO_REQ_SURVEY_SETTLER',	'UnitType',		'ARGTYPE_IDENTITY',		'UNIT_SETTLER',	NULL,	NULL 	) ;


INSERT INTO RequirementSets 
	(RequirementSetId, 		RequirementSetType)
VALUES 	('QUO_REQSET_POLICY_SURVEY', 	'REQUIREMENTSET_TEST_ANY') ;


-- reuse the existing RECON_UNITS requirement
INSERT INTO RequirementSetRequirements
	(RequirementSetId,	RequirementId)
VALUES	('QUO_REQSET_POLICY_SURVEY', 	'QUO_REQ_SURVEY_SETTLER'),
		('QUO_REQSET_POLICY_SURVEY', 	'RECON_UNITS') ; 



INSERT INTO Modifiers 
	(ModifierId, 	ModifierType, 	RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
VALUES	('QUO_SCOUTS_IGNORE_ZOC', 	'MODIFIER_PLAYER_UNIT_ADJUST_IGNORE_ZOC', 0, 0, NULL, NULL) ,
	('QUO_SCOUTS_IGNORE_RIV', 	'MODIFIER_PLAYER_UNIT_ADJUST_IGNORE_RIVERS', 0, 0, NULL, NULL) ,
	('QUO_SCOUTS_IGNORE_ZOC_2', 	'MODIFIER_PLAYER_UNITS_ATTACH_MODIFIER', 0, 0, NULL, 'QUO_REQSET_POLICY_SURVEY') ,
	('QUO_SCOUTS_IGNORE_RIV_2', 	'MODIFIER_PLAYER_UNITS_ATTACH_MODIFIER', 0, 0, NULL, 'QUO_REQSET_POLICY_SURVEY') ;



INSERT INTO ModifierArguments
	(ModifierId, 			Name, 		Type, 			Value, 					Extra, 	SecondExtra)
VALUES	('QUO_SCOUTS_IGNORE_ZOC', 	'Ignore', 	'ARGTYPE_IDENTITY', 	'1',					NULL, 	NULL) ,	
	('QUO_SCOUTS_IGNORE_ZOC_2', 	'ModifierId', 	'ARGTYPE_IDENTITY', 	'QUO_SCOUTS_IGNORE_ZOC',		NULL, 	NULL) , 
	('QUO_SCOUTS_IGNORE_RIV', 	'Ignore', 	'ARGTYPE_IDENTITY', 	'1',					NULL, 	NULL) ,	
	('QUO_SCOUTS_IGNORE_RIV_2', 	'ModifierId', 	'ARGTYPE_IDENTITY', 	'QUO_SCOUTS_IGNORE_RIV',		NULL, 	NULL) ;


INSERT INTO PolicyModifiers
	(PolicyType, 		ModifierId)
VALUES	('POLICY_SURVEY',	'QUO_SCOUTS_IGNORE_ZOC_2') ,
	('POLICY_SURVEY',	'QUO_SCOUTS_IGNORE_RIV_2') ;

	
	
	
	
-- URBAN PLANNING

-- Make Granaries cheaper

INSERT INTO Modifiers 
	(ModifierId, ModifierType, RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
VALUES	('QUO_CHEAP_GRANARY', 'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_PRODUCTION', 0, 0, NULL, NULL) ;


INSERT INTO ModifierArguments
	(ModifierId, 			Name, 		Type, 			Value, 			Extra, 	SecondExtra)
VALUES	('QUO_CHEAP_GRANARY', 	'Amount', 	'ARGTYPE_IDENTITY', 	'100',			NULL, 	NULL) , 
	('QUO_CHEAP_GRANARY', 	'BuildingType', 'ARGTYPE_IDENTITY', 	'BUILDING_GRANARY',	NULL, 	NULL) ;


INSERT INTO PolicyModifiers
	(PolicyType, 			ModifierId)
VALUES	('POLICY_URBAN_PLANNING',	'QUO_CHEAP_GRANARY') ;



-- POLICY_DIPLOMATIC_LEAGUE (Each envoy you send counts as 2)
-- Unlock at State Workforce
UPDATE Policies SET PrereqCivic='CIVIC_STATE_WORKFORCE' WHERE PolicyType='POLICY_DIPLOMATIC_LEAGUE' ;



-- COLONIZATION
-- Colonization now provides +2 Culture in cities without a Monument, and +100% production towards Monuments
-- The Food bonus was removed in version 4.0.0 for balance reasons

DELETE FROM PolicyModifiers WHERE PolicyType='POLICY_COLONIZATION' ;

INSERT INTO Requirements
	(RequirementId, 		RequirementType, 	Likeliness,	Inverse, 	Triggered)
VALUES	('QUO_REQ_COLONIZATION_NO_MONUMENT', 	'REQUIREMENT_CITY_HAS_BUILDING',	0,1,0) ,
		('QUO_REQ_COLONIZATION_HAS_MONUMENT', 	'REQUIREMENT_CITY_HAS_BUILDING',	0,0,0) ;

INSERT INTO RequirementArguments 
		(RequirementId,			Name, 			Type, 			Value, 		Extra, 	SecondExtra)
VALUES 	('QUO_REQ_COLONIZATION_NO_MONUMENT',	'BuildingType',		'ARGTYPE_IDENTITY',		'BUILDING_MONUMENT',	NULL,	NULL 	) ,
		('QUO_REQ_COLONIZATION_HAS_MONUMENT',	'BuildingType',		'ARGTYPE_IDENTITY',		'BUILDING_MONUMENT',	NULL,	NULL 	) ;


INSERT INTO RequirementSets 
	(RequirementSetId, 		RequirementSetType)
VALUES 	('QUO_REQSET_COLONIZATION', 	'REQUIREMENTSET_TEST_ALL') ,
		('QUO_REQSET_COLONIZATION_HAS', 	'REQUIREMENTSET_TEST_ALL') ;
		
INSERT INTO RequirementSetRequirements
	(RequirementSetId,	RequirementId)
VALUES	('QUO_REQSET_COLONIZATION', 	'QUO_REQ_COLONIZATION_NO_MONUMENT') ,
		('QUO_REQSET_COLONIZATION_HAS', 	'QUO_REQ_COLONIZATION_HAS_MONUMENT') ;


INSERT INTO Modifiers 
		(ModifierId, ModifierType, RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
VALUES	('QUO_POLICY_COLONIZATION_FREE_CULTURE', 'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_CHANGE', 0, 0, NULL, 'QUO_REQSET_COLONIZATION') ,
		('QUO_POLICY_COLONIZATION_FREE_FOOD', 'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_CHANGE', 0, 0, NULL, 'QUO_REQSET_COLONIZATION_HAS') ;

INSERT INTO ModifierArguments
		(ModifierId, 			Name, 		Type, 			Value, 			Extra, 	SecondExtra)
VALUES	('QUO_POLICY_COLONIZATION_FREE_CULTURE', 	'Amount', 	'ARGTYPE_IDENTITY', 	'1',			NULL, 	NULL),
		('QUO_POLICY_COLONIZATION_FREE_CULTURE', 	'YieldType', 	'ARGTYPE_IDENTITY', 	'YIELD_CULTURE',			NULL, 	NULL) ,
		('QUO_POLICY_COLONIZATION_FREE_FOOD', 	'Amount', 	'ARGTYPE_IDENTITY', 	'2',			NULL, 	NULL),
		('QUO_POLICY_COLONIZATION_FREE_FOOD', 	'YieldType', 	'ARGTYPE_IDENTITY', 	'YIELD_FOOD',			NULL, 	NULL) ;

INSERT INTO PolicyModifiers
		(PolicyType, 			ModifierID)
VALUES	('POLICY_COLONIZATION',	'QUO_POLICY_COLONIZATION_FREE_CULTURE') ;
	--	('POLICY_COLONIZATION',	'QUO_POLICY_COLONIZATION_FREE_FOOD') ;



INSERT INTO Modifiers 
	(ModifierId, ModifierType, RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
VALUES	('QUO_CHEAP_MONUMENT', 'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_PRODUCTION', 0, 0, NULL, NULL) ;


INSERT INTO ModifierArguments
	(ModifierId, 			Name, 		Type, 			Value, 			Extra, 	SecondExtra)
VALUES	('QUO_CHEAP_MONUMENT', 	'Amount', 	'ARGTYPE_IDENTITY', 	'100',			NULL, 	NULL) , 
	('QUO_CHEAP_MONUMENT', 	'BuildingType', 'ARGTYPE_IDENTITY', 	'BUILDING_MONUMENT',	NULL, 	NULL) ;


INSERT INTO PolicyModifiers
	(PolicyType, 			ModifierId)
VALUES	('POLICY_COLONIZATION',	'QUO_CHEAP_MONUMENT') ;

	

-- Swap location of Colonization and Urban Planning
-- Nice experiment, but I'm slightly uncomfortable with this change, so switching it back.

-- UPDATE Policies SET PrereqCivic='CIVIC_CODE_OF_LAWS' WHERE PolicyType='POLICY_COLONIZATION' ;
-- UPDATE Policies SET PrereqCivic='CIVIC_EARLY_EMPIRE' WHERE PolicyType='POLICY_URBAN_PLANNING' ;




-- SACK, RAID, AND TOTAL WAR

-- Eliminate Sack and Raid and just make Total War replace them entirely
-- Don't want to delete them because unsure what references there are to these objects. Instead just make them obsolete.



-- work in progress
/*
UPDATE ObsoletePolicies SET ObsoletePolicy='POLICY_DISCIPLINE' WHERE PolicyType='POLICY_RAID' ;
UPDATE ObsoletePolicies SET ObsoletePolicy='POLICY_DISCIPLINE' WHERE PolicyType='POLICY_SACK' ;

UPDATE Policies SET PrereqCivic='CIVIC_MILITARY_TRAINING' WHERE PolicyType='POLICY_TOTAL_WAR' ;
*/



-- Swap Veterancy and Strategos

UPDATE Policies SET PrereqCivic='CIVIC_MILITARY_TRADITION' WHERE PolicyType='POLICY_VETERANCY' ;
UPDATE Policies SET PrereqCivic='CIVIC_MILITARY_TRAINING' WHERE PolicyType='POLICY_STRATEGOS' ;


-- Increase Veterancy bonus
UPDATE ModifierArguments SET Value='100' WHERE ModifierId='VETERANCY_ARMORY_PRODUCTION' AND Name='Amount' ;
UPDATE ModifierArguments SET Value='100' WHERE ModifierId='VETERANCY_BARRACKS_PRODUCTION' AND Name='Amount' ;
UPDATE ModifierArguments SET Value='100' WHERE ModifierId='VETERANCY_ENCAMPMENT_PRODUCTION' AND Name='Amount' ;
UPDATE ModifierArguments SET Value='100' WHERE ModifierId='VETERANCY_MILITARY_ACADEMY_PRODUCTION' AND Name='Amount' ;
UPDATE ModifierArguments SET Value='100' WHERE ModifierId='VETERANCY_STABLE_PRODUCTION' AND Name='Amount' ;



-- INSULAE, MEDINA QUARTER, NEW DEAL
-- Remove District requirements

UPDATE Modifiers SET SubjectRequirementSetId=NULL WHERE ModifierId='INSULAE_SPECIALTYHOUSING' ;
UPDATE Modifiers SET SubjectRequirementSetId=NULL WHERE ModifierId='MEDINAQUARTER_SPECIALTYHOUSING' ;
UPDATE Modifiers SET SubjectRequirementSetId=NULL WHERE ModifierId='NEWDEAL_SPECIALTYHOUSING' ;



-- WONDER BUILDING POLICIES

-- CORVEE, GOTHIC ARCHITECTURE, SKYSCRAPERS
-- Because we don't know if the player has installed DLC, we have to scan the database and find any wonders they might be able to build that these policies should boost


-- Create a temp table of every modifier tied to a policy known to affect wonder costs


-- In Rise and Fall this is handled differently, so we no longer need to use this complex process
/* CREATE TEMPORARY TABLE Quo_Tbl_Modifier_Wonders AS SELECT Modifiers.ModifierId
                                                     FROM Buildings
                                                          INNER JOIN
                                                          ModifierArguments ON Buildings.BuildingType = ModifierArguments.Value
                                                          INNER JOIN
                                                          Modifiers ON ModifierArguments.ModifierId = Modifiers.Modifierid
                                                          INNER JOIN
                                                          PolicyModifiers ON Modifiers.ModifierId = PolicyModifiers.ModifierId
                                                    WHERE (Buildings.IsWonder = '1' AND 
                                                           Modifiers.ModifierType = 'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_PRODUCTION') AND 
                                                          (PolicyModifiers.PolicyType = 'POLICY_CORVEE' OR 
                                                           PolicyModifiers.PolicyType = 'POLICY_GOTHIC_ARCHITECTURE' OR 
                                                           PolicyModifiers.PolicyType = 'POLICY_SKYSCRAPERS');

-- Update the arguments for each of the modifiers

UPDATE ModifierArguments
   SET Value = '30'
 WHERE ModifierArguments.ModifierId IN Quo_Tbl_Modifier_Wonders AND ModifierArguments.Name='Amount';


DROP TABLE Quo_Tbl_Modifier_Wonders;



-- Make wonder policies retroactive for wonders from previous eras
-- Aka the least fun a programmer can have on a Sunday morning :) 

-- tier 2
CREATE TEMPORARY TABLE tblQuoTier2Wonders AS SELECT Modifiers.ModifierId
                                                     FROM Buildings
                                                          INNER JOIN
                                                          ModifierArguments ON Buildings.BuildingType = ModifierArguments.Value
                                                          INNER JOIN
                                                          Modifiers ON ModifierArguments.ModifierId = Modifiers.Modifierid
                                                          INNER JOIN
                                                          PolicyModifiers ON Modifiers.ModifierId = PolicyModifiers.ModifierId
                                                    WHERE (Buildings.IsWonder = '1' AND 
                                                           Modifiers.ModifierType = 'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_PRODUCTION') AND 
                                                          (PolicyModifiers.PolicyType = 'POLICY_CORVEE');

INSERT OR IGNORE INTO PolicyModifiers
                (PolicyType, ModifierId)
SELECT	'POLICY_GOTHIC_ARCHITECTURE', tblQuoTier2Wonders.ModifierId
FROM tblQuoTier2Wonders;

INSERT OR IGNORE INTO PolicyModifiers
                (PolicyType, ModifierId)
SELECT	'POLICY_SKYSCRAPERS', tblQuoTier2Wonders.ModifierId
FROM tblQuoTier2Wonders;

-- tier 3
CREATE TEMPORARY TABLE tblQuoTier3Wonders AS SELECT Modifiers.ModifierId
                                                     FROM Buildings
                                                          INNER JOIN
                                                          ModifierArguments ON Buildings.BuildingType = ModifierArguments.Value
                                                          INNER JOIN
                                                          Modifiers ON ModifierArguments.ModifierId = Modifiers.Modifierid
                                                          INNER JOIN
                                                          PolicyModifiers ON Modifiers.ModifierId = PolicyModifiers.ModifierId
                                                    WHERE (Buildings.IsWonder = '1' AND 
                                                           Modifiers.ModifierType = 'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_PRODUCTION') AND 
                                                          (PolicyModifiers.PolicyType = 'POLICY_GOTHIC_ARCHITECTURE');
														  
INSERT OR IGNORE INTO PolicyModifiers
                (PolicyType, ModifierId)
SELECT	'POLICY_SKYSCRAPERS', tblQuoTier3Wonders.ModifierId
FROM tblQuoTier3Wonders;											  
														  
 */

 
UPDATE ModifierArguments SET Value=30 WHERE ModifierID='CORVEE_ANCIENTCLASSICALWONDER' AND Name='Amount' ; 

UPDATE ModifierArguments SET Value=30 WHERE ModifierID='GOTHICARCHITECTURE_MEDIEVALRENAISSANCEWONDER' AND Name='Amount' ;
--UPDATE ModifierArguments SET Value='ERA_ANCIENT' WHERE ModifierID='GOTHICARCHITECTURE_MEDIEVALRENAISSANCEWONDER' AND Name='StartEra' ;

UPDATE ModifierArguments SET Value=30 WHERE ModifierID='SKYSCRAPERS_INDUSTRIALINFORMATION' AND Name='Amount' ;
--UPDATE ModifierArguments SET Value='ERA_ANCIENT' WHERE ModifierID='SKYSCRAPERS_INDUSTRIALINFORMATION' AND Name='StartEra' ;

 


-- COLONIAL OFFICES

-- Increase the bonus for foreign continent growth from 15 to 30

UPDATE ModifierArguments SET Value='30' WHERE ModifierId='COLONIALOFFICES_FOREIGNGROWTH' AND Name='Amount' ;




-- BASTIONS



-- Bastions policy grants Urban Defenses
-- Removed in v3.11.0 in favor of this being part of the Communism government

/* INSERT INTO Modifiers 
	(ModifierId, ModifierType, RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
VALUES	('QUO_BASTIONS_URBAN_DEFENSES', 'MODIFIER_PLAYER_GRANT_CITIES_URBAN_DEFENSES', 0, 0, NULL, NULL) ;


INSERT INTO ModifierArguments
	(ModifierId, 				Name, 			Type, 			Value, 		Extra, 	SecondExtra)
VALUES	('QUO_BASTIONS_URBAN_DEFENSES', 	'DefenseValue', 	'ARGTYPE_IDENTITY', 	'10',		NULL, 	NULL) ;


INSERT INTO PolicyModifiers
	(PolicyType, 			ModifierID)
VALUES	('POLICY_BASTIONS',		'QUO_BASTIONS_URBAN_DEFENSES') ;



-- This used to be a Hardcore rule, but now Bastions appears much later for all players
UPDATE Policies SET PrereqCivic='CIVIC_TOTALITARIANISM' WHERE PolicyType='POLICY_BASTIONS' ;
 */





-- UPDATE BUG TRACKER
-- This code should go last in every file


UPDATE tblQuoDebug SET x_Close='1' WHERE DebugID='Quo_Policies_Code';