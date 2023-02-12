/*
	Slower Tech by Era
	by Gedemon (2016)
	original idea and code by alpaca
*/
 

-----------------------------------------------
-- Technology cost
-----------------------------------------------

-- Updated by Quo to mesh with MyOptions system.

INSERT INTO tblQuoDebug 
	(DebugID, 		x_Open, x_Close, 	Message)
VALUES ('Xav_SlowerTechRules_Code',	'1',	'0',		'') ;



/* UPDATE Technologies SET Cost = Cost* 1	WHERE EraType ='ERA_ANCIENT';
UPDATE Technologies SET Cost = Cost*1.2 WHERE EraType ='ERA_CLASSICAL';
UPDATE Technologies SET Cost = Cost*1.4	WHERE EraType ='ERA_MEDIEVAL';
UPDATE Technologies SET Cost = Cost*1.8	WHERE EraType ='ERA_RENAISSANCE';
UPDATE Technologies SET Cost = Cost*2.2	WHERE EraType ='ERA_INDUSTRIAL';
UPDATE Technologies SET Cost = Cost*2.5	WHERE EraType ='ERA_MODERN';
UPDATE Technologies SET Cost = Cost*3	WHERE EraType ='ERA_ATOMIC';
UPDATE Technologies SET Cost = Cost*3	WHERE EraType ='ERA_INFORMATION';
UPDATE Civics SET Cost = Cost*1.1 WHERE EraType ='ERA_CLASSICAL';
UPDATE Civics SET Cost = Cost*1.4 WHERE EraType ='ERA_MEDIEVAL';
UPDATE Civics SET Cost = Cost*1.8 WHERE EraType ='ERA_RENAISSANCE';
UPDATE Civics SET Cost = Cost*2.2 WHERE EraType ='ERA_INDUSTRIAL';
UPDATE Civics SET Cost = Cost*2.5 WHERE EraType ='ERA_MODERN';
UPDATE Civics SET Cost = Cost*3 WHERE EraType ='ERA_ATOMIC';
UPDATE Civics SET Cost = Cost*3 WHERE EraType ='ERA_INFORMATION'; */


-- Get the value for the setting from the Options files. 
UPDATE Technologies SET Cost = Cost * (1 + 0 * (SELECT Value from tblQuoOptions WHERE tblQuoOptions.OptionID ='XAV_OPTION_USE_SLOWER_TECH_SPEED')) WHERE EraType ='ERA_ANCIENT';
UPDATE Technologies SET Cost = Cost * (1 + 0.1 * (SELECT Value from tblQuoOptions WHERE tblQuoOptions.OptionID ='XAV_OPTION_USE_SLOWER_TECH_SPEED')) WHERE EraType ='ERA_CLASSICAL';
UPDATE Technologies SET Cost = Cost * (1 + 0.2 * (SELECT Value from tblQuoOptions WHERE tblQuoOptions.OptionID ='XAV_OPTION_USE_SLOWER_TECH_SPEED')) WHERE EraType ='ERA_MEDIEVAL';
UPDATE Technologies SET Cost = Cost * (1 + 0.4 * (SELECT Value from tblQuoOptions WHERE tblQuoOptions.OptionID ='XAV_OPTION_USE_SLOWER_TECH_SPEED')) WHERE EraType ='ERA_RENAISSANCE';
UPDATE Technologies SET Cost = Cost * (1 + 0.6 * (SELECT Value from tblQuoOptions WHERE tblQuoOptions.OptionID ='XAV_OPTION_USE_SLOWER_TECH_SPEED')) WHERE EraType ='ERA_INDUSTRIAL';
UPDATE Technologies SET Cost = Cost * (1 + 0.8 * (SELECT Value from tblQuoOptions WHERE tblQuoOptions.OptionID ='XAV_OPTION_USE_SLOWER_TECH_SPEED')) WHERE EraType ='ERA_MODERN';
UPDATE Technologies SET Cost = Cost * (1 + 1 * (SELECT Value from tblQuoOptions WHERE tblQuoOptions.OptionID ='XAV_OPTION_USE_SLOWER_TECH_SPEED')) WHERE EraType ='ERA_ATOMIC';
UPDATE Technologies SET Cost = Cost * (1 + 1.2 * (SELECT Value from tblQuoOptions WHERE tblQuoOptions.OptionID ='XAV_OPTION_USE_SLOWER_TECH_SPEED')) WHERE EraType ='ERA_INFORMATION';


UPDATE Civics SET Cost = Cost * (1 + 0 * (SELECT Value from tblQuoOptions WHERE tblQuoOptions.OptionID ='XAV_OPTION_USE_SLOWER_TECH_SPEED')) WHERE EraType ='ERA_ANCIENT';
UPDATE Civics SET Cost = Cost * (1 + 0.1 * (SELECT Value from tblQuoOptions WHERE tblQuoOptions.OptionID ='XAV_OPTION_USE_SLOWER_TECH_SPEED')) WHERE EraType ='ERA_CLASSICAL';
UPDATE Civics SET Cost = Cost * (1 + 0.2 * (SELECT Value from tblQuoOptions WHERE tblQuoOptions.OptionID ='XAV_OPTION_USE_SLOWER_TECH_SPEED')) WHERE EraType ='ERA_MEDIEVAL';
UPDATE Civics SET Cost = Cost * (1 + 0.4 * (SELECT Value from tblQuoOptions WHERE tblQuoOptions.OptionID ='XAV_OPTION_USE_SLOWER_TECH_SPEED')) WHERE EraType ='ERA_RENAISSANCE';
UPDATE Civics SET Cost = Cost * (1 + 0.6 * (SELECT Value from tblQuoOptions WHERE tblQuoOptions.OptionID ='XAV_OPTION_USE_SLOWER_TECH_SPEED')) WHERE EraType ='ERA_INDUSTRIAL';
UPDATE Civics SET Cost = Cost * (1 + 0.8 * (SELECT Value from tblQuoOptions WHERE tblQuoOptions.OptionID ='XAV_OPTION_USE_SLOWER_TECH_SPEED')) WHERE EraType ='ERA_MODERN';
UPDATE Civics SET Cost = Cost * (1 + 1 * (SELECT Value from tblQuoOptions WHERE tblQuoOptions.OptionID ='XAV_OPTION_USE_SLOWER_TECH_SPEED')) WHERE EraType ='ERA_ATOMIC';
UPDATE Civics SET Cost = Cost * (1 + 1.2 * (SELECT Value from tblQuoOptions WHERE tblQuoOptions.OptionID ='XAV_OPTION_USE_SLOWER_TECH_SPEED')) WHERE EraType ='ERA_INFORMATION';




UPDATE tblQuoDebug SET x_Close='1' WHERE DebugID='Xav_SlowerTechRules_Code';
