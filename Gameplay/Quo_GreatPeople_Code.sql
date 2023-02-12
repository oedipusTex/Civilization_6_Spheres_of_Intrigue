/*
    Created by Quo
*/


-- LOGS
INSERT INTO tblQuoDebug 
	(DebugID, 		x_Open, x_Close, 	Message)
VALUES ('Quo_GreatPeople_Code',	'1',	'0',		'') ;

 
-- Increase the cost of acquiring great people to account for higher tech and civic costs
UPDATE Eras SET GreatPersonBaseCost = GreatPersonBaseCost*1 WHERE EraType = 'ERA_ANCIENT' AND (SELECT tblquoOptions.Value FROM tblQuoOptions WHERE tblQuoOptions.OptionID='QUO_OPTION_SLOW_GREAT_PEOPLE') >0 ;
UPDATE Eras SET GreatPersonBaseCost = GreatPersonBaseCost*1.2 WHERE EraType = 'ERA_CLASSICAL'AND (SELECT tblquoOptions.Value FROM tblQuoOptions WHERE tblQuoOptions.OptionID='QUO_OPTION_SLOW_GREAT_PEOPLE') >0 ;
UPDATE Eras SET GreatPersonBaseCost = GreatPersonBaseCost*1.3 WHERE EraType = 'ERA_MEDIEVAL' AND (SELECT tblquoOptions.Value FROM tblQuoOptions WHERE tblQuoOptions.OptionID='QUO_OPTION_SLOW_GREAT_PEOPLE') >0 ;
UPDATE Eras SET GreatPersonBaseCost = GreatPersonBaseCost*1.4 WHERE EraType = 'ERA_RENAISSANCE' AND (SELECT tblquoOptions.Value FROM tblQuoOptions WHERE tblQuoOptions.OptionID='QUO_OPTION_SLOW_GREAT_PEOPLE') >0 ;
UPDATE Eras SET GreatPersonBaseCost = GreatPersonBaseCost*1.5 WHERE EraType = 'ERA_INDUSTRIAL' AND (SELECT tblquoOptions.Value FROM tblQuoOptions WHERE tblQuoOptions.OptionID='QUO_OPTION_SLOW_GREAT_PEOPLE') >0 ;
UPDATE Eras SET GreatPersonBaseCost = GreatPersonBaseCost*1.6 WHERE EraType = 'ERA_MODERN' AND (SELECT tblquoOptions.Value FROM tblQuoOptions WHERE tblQuoOptions.OptionID='QUO_OPTION_SLOW_GREAT_PEOPLE') >0 ;
UPDATE Eras SET GreatPersonBaseCost = GreatPersonBaseCost*1.7 WHERE EraType = 'ERA_ATOMIC' AND (SELECT tblquoOptions.Value FROM tblQuoOptions WHERE tblQuoOptions.OptionID='QUO_OPTION_SLOW_GREAT_PEOPLE') >0 ;
UPDATE Eras SET GreatPersonBaseCost = GreatPersonBaseCost*1.8 WHERE EraType = 'ERA_INFORMATION' AND (SELECT tblquoOptions.Value FROM tblQuoOptions WHERE tblQuoOptions.OptionID='QUO_OPTION_SLOW_GREAT_PEOPLE') >0 ;



-- UPDATE BUG TRACKER
-- This code should go last in every file

UPDATE tblQuoDebug SET x_Close='1' WHERE DebugID='Quo_GreatPeople_Code';