/*
    Created by Quo
*/

-- This file is not currently used by the mod

-- LOGS
INSERT INTO tblQuoDebug 
	(DebugID, 		x_Open, x_Close, 	Message)
VALUES ('Quo_Sandbox_Code',	'1',	'0',		'') ;

 

-- Give bonus to diplo interactions
UPDATE ModifierArguments SET Value=Value +(SELECT tblQuoOptions.Value FROM tblQuoOptions WHERE tblQuoOptions.OptionID='QUO_OPTION_SB_DIPLOMACY_BONUS_AMOUNT') WHERE Name='InitialValue' AND ModifierId LIKE '%DIPLO%' ;




-- Free Gold per turn
UPDATE Building_YieldChanges SET YieldChange= YieldChange +(SELECT tblQuoOptions.Value FROM tblQuoOptions WHERE tblQuoOptions.OptionID='QUO_OPTION_SB_FREE_GOLD_PER_TURN_AMOUNT') 
WHERE BuildingType='BUILDING_PALACE' AND YieldType='YIELD_GOLD' ; 



-- UPDATE BUG TRACKER
-- This code should go last in every file

UPDATE tblQuoDebug SET x_Close='1' WHERE DebugID='Quo_Sandbox_Code';