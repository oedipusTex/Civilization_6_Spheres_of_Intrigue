/*
    Created by Quo
	
	Contains support for various features. Loads after most other files in the mod and is generally associated with clean-up functions.
*/


-- LOGS
INSERT INTO tblQuoDebug 
	(DebugID, 		x_Open, x_Close, 	Message)
VALUES ('Quo_ZY_Closeout_Code',	'1',	'0',		'') ;

 

 -- =========== Support for MyScratchpad =========================
 /*
 FOR FUTURE DEVELOPMENT. This code performs some functions necessary for the MyScratchpad to function correctly. It's located here rather than the actual Scratchpad file 
 so that players dont accidentally edit and break it.
 */


 -- Create a dummy Modifier that exists solely so we have a place to store strings. 
/* INSERT INTO Modifiers 
		(ModifierId, ModifierType, RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
VALUES	('QUO_MYSCRATCHPAD_DUMMY_MODIFIER', 'MODIFIER_PLAYER_DIPLOMACY_SIMPLE_MODIFIER', 0, 0, NULL, NULL) ;
 

INSERT OR IGNORE INTO ModifierStrings
	(ModifierID, Context, Text)
	SELECT 'QUO_MYSCRATCHPAD_DUMMY_MODIFIER', tblScratchNotes.NoteId, tblScratchNotes.Message)
	FROM tblScratchNotes ;
	
	
INSERT INTO tblScratchNotes
	(NoteId, Message)
VALUES ('Note_1', 'This message will appear in the Scratch Notes window when the mod loads.') ; */
 
 

-- UPDATE BUG TRACKER
-- This code should go last in every file

UPDATE tblQuoDebug SET x_Close='1' WHERE DebugID='Quo_ZY_Closeout_Code';