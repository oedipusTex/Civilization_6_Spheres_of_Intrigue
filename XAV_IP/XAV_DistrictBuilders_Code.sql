/*
    Created by Quo based on code by Xav
*/
 


-- LOGS


INSERT INTO tblQuoDebug 
	(DebugID, 		x_Open, x_Close, 	Message)
VALUES ('Xav_DistrictBuilders_Code',	'1',	'0',		'') ;





-- All Players can now rush Districts. This method builds on the original implementation in the Improvements Patch.
-- Players can control whether this is active or not using MyOptions.
-- Added the "OR IGNORE" tag since now this setting also appears in the Improvements Patch proper 
INSERT OR IGNORE INTO Modifiers 
	(ModifierId, ModifierType, RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
VALUES	('XAV_BUILDER_DISTRICT_PERCENT_ALLCIVS_2', 'MODIFIER_PLAYER_ADJUST_UNIT_DISTRICT_PERCENT', 0, 0, NULL, NULL) ;


INSERT OR IGNORE INTO ModifierArguments
	(ModifierId, 			Name, 		Type, 			Value, 		Extra, 	SecondExtra)
VALUES	('XAV_BUILDER_DISTRICT_PERCENT_ALLCIVS_2', 	'Amount', 	'ARGTYPE_IDENTITY', 	'20',	NULL, 	NULL) ;

INSERT OR IGNORE INTO TraitModifiers
		(TraitType, ModifierId)
SELECT 'TRAIT_LEADER_MAJOR_CIV','XAV_BUILDER_DISTRICT_PERCENT_ALLCIVS_2'
  FROM tblQuoOptions
 WHERE tblQuoOptions.OptionID = 'XAV_OPTION_CAN_BUILDERS_RUSH_DISTRICTS' AND 
       tblQuoOptions.Value = '1';






-- UPDATE BUG TRACKER
-- This code should go last in every file



UPDATE tblQuoDebug SET x_Close='1' WHERE DebugID='Xav_DistrictBuilders_Code';