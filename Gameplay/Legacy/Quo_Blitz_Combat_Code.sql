/*
    Created by Quo
*/
 

-- RULES FOR BLITZ ONLY

-- Debug
INSERT INTO tblQuoDebug 
	(DebugID, 		x_Open, x_Close, 	Message)
VALUES ('Quo_Blitz_Code',	'1',	'0',		'') ;



-- Units have significantly less HP in Blitz, but are cheaper to build.
UPDATE GlobalParameters SET Value='60' WHERE Name='COMBAT_MAX_HIT_POINTS' ;

UPDATE GlobalParameters SET Value='10' WHERE Name='EXPERIENCE_PROMOTE_HEALED' ;




-- Update the Cost of all units. 

UPDATE Units SET Cost = Round(Cost * 0.5, 0) WHERE FormationClass NOT IN ('FORMATION_CLASS_CIVILIAN','FORMATION_CLASS_SUPPORT') ;



-- Lower the damage that Ranged units do  

UPDATE Units SET RangedCombat = Round((RangedCombat * 0.6)-7, 0) WHERE RangedCombat > 7;



-- Make Corps unlock right away
-- Doesn't seem to be a way to do this for armies. Code still exists below, but is not applied.


INSERT INTO Modifiers 
	(ModifierId, ModifierType, RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
VALUES	('QUO_BLITZ_CORPS_UNLOCK', 'MODIFIER_PLAYER_CORPS_ARMY_PREREQ', 0, 0, NULL, NULL) ,
	('QUO_BLITZ_ARMY_UNLOCK', 'MODIFIER_PLAYER_CORPS_ARMY_PREREQ', 0, 0, NULL, NULL) ;



INSERT INTO ModifierArguments
	(ModifierId, 			Name, 		Type, 			Value, 			Extra, 	SecondExtra)
VALUES	('QUO_BLITZ_CORPS_UNLOCK', 	'Corps', 	'ARGTYPE_IDENTITY', 	'True',			NULL, 	NULL) ,  
	('QUO_BLITZ_CORPS_UNLOCK', 	'Domain', 	'ARGTYPE_IDENTITY', 	'DOMAIN_LAND',		NULL, 	NULL) ,
	('QUO_BLITZ_CORPS_UNLOCK', 	'CivicType', 	'ARGTYPE_IDENTITY', 	'CIVIC_MILITARY_TRADITION',		NULL, 	NULL) ,
	('QUO_BLITZ_ARMY_UNLOCK', 	'Army', 	'ARGTYPE_IDENTITY', 	'True',			NULL, 	NULL) ,
	('QUO_BLITZ_ARMY_UNLOCK', 	'Domain', 	'ARGTYPE_IDENTITY', 	'DOMAIN_LAND',		NULL, 	NULL) ,
	('QUO_BLITZ_ARMY_UNLOCK', 	'CivicType', 	'ARGTYPE_IDENTITY', 	'CIVIC_MILITARY_TRADITION',		NULL, 	NULL) ;



INSERT INTO TraitModifiers
	(TraitType, 				ModifierID)
VALUES	('TRAIT_LEADER_MAJOR_CIV',		'QUO_BLITZ_CORPS_UNLOCK') ;
	-- ('TRAIT_LEADER_MAJOR_CIV',		'QUO_BLITZ_ARMY_UNLOCK')	;





-- UPDATE BUG TRACKER
-- This code should go last in every file

UPDATE tblQuoDebug SET x_Close='1' WHERE DebugID='Quo_Blitz_Code';
