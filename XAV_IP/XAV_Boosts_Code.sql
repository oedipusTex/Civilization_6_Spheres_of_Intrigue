/* slows down boosts by 1/2 (so 25%)*/


-- Updated by Quo for merger to work with the MyOptions system

-- debug
INSERT INTO tblQuoDebug 
	(DebugID, 		x_Open, x_Close, 	Message)
VALUES ('Xav_Boosts_Code',	'1',	'0',		'') ;


-- update the effects of the boost
-- value is moderated by user option in the MyOptions file
UPDATE Boosts SET Boost = Round(Boost * (SELECT tblQuoOptions.Value from tblquoOptions where tblquooptions.OptionID='XAV_OPTION_BOOST_PENALTY'),0) ;


-- debug
UPDATE tblQuoDebug SET x_Close='1' WHERE DebugID='Xav_Boosts_Code';