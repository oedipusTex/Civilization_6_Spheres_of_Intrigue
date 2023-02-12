/*
    Created by Quo
*/
 

-- LOGS

-- Debug
INSERT INTO tblQuoDebug 
	(DebugID, 		x_Open, x_Close, 	Message)
VALUES ('Quo_Patron_Code',	'1',	'0',		'') ;



-- CITY STATES
-- No longer receive free tokens for being first to meet a city state


-- UPDATE GlobalParameters SET Value='0' WHERE Name='INFLUENCE_TOKENS_FREE_FOR_FIRST_PLAYER_MEET' ;


-- Now uses values from MyOptions
UPDATE GlobalParameters
   SET Value = (
           SELECT tblQuoOptions.Value
             FROM tblQuoOptions
            WHERE OptionID = 'QUO_OPTION_NUM_FREE_TOKENS_MEET_CITY_STATE'
       )
 WHERE Name = 'INFLUENCE_TOKENS_FREE_FOR_FIRST_PLAYER_MEET';

 
-- UPDATE BUG TRACKER
-- This code should go last in every file

UPDATE tblQuoDebug SET x_Close='1' WHERE DebugID='Quo_Patron_Code';