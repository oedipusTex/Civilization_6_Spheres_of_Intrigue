/*
    Created by Quo
*/
 

-- LOGS
-- Debug
INSERT INTO tblQuoDebug 
	(DebugID, 		x_Open, x_Close, 	Message)
VALUES ('Quo_Enviro_Code',	'1',	'0',		'') ;



-- Trash Accumulation


-- Each city with at least 10 Population generates trash


/* INSERT INTO Modifiers
	(ModifierID, 			ModifierType, 					RunOnce, 	Permanent, 	OwnerRequirementSetId, 	SubjectRequirementSetId)
VALUES	('QUO_ENVIRO_TRASH_ACCUMULATION', 	'MODIFIER_PLAYER_ADJUST_PLOT_YIELD', 	0, 		0, 		NULL,			NULL)  ;


INSERT INTO ModifierArguments
	(ModifierID,			Name,		Type, 				Value,			Extra)
VALUES	('QUO_ENVIRO_TRASH_ACCUMULATION', 	'Amount', 	'ARGTYPE_IDENTITY', 		'-1',			NULL) ,
		('QUO_ENVIRO_TRASH_ACCUMULATION', 	'YieldType', 	'ARGTYPE_IDENTITY', 	'YIELD_FOOD',			NULL) ;


INSERT INTO TraitModifiers
	(TraitType, 				ModifierID)
VALUES	('TRAIT_LEADER_MAJOR_CIV',	'QUO_ENVIRO_TRASH_ACCUMULATION')  */;



-- Landfill District





-- UPDATE BUG TRACKER
-- This code should go last in every file

UPDATE tblQuoDebug SET x_Close='1' WHERE DebugID='Quo_Enviro_Code';
