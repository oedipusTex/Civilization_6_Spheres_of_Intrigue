/*
    Created by Quo
*/
 

-- Debug
INSERT INTO tblQuoDebug 
	(DebugID, 		x_Open, x_Close, 	Message)
VALUES ('Quo_GloryEra_Code',	'1',	'0',		'') ;



UPDATE tblQuoDebug SET x_Close='1' WHERE DebugID='Quo_GloryEra_Code';
