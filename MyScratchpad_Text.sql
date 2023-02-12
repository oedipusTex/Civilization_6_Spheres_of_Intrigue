/*
    Created by Quo
	ABOUT THIS FILE

	This file allows you to add or modify custom text to include to the mod. 
*/

 

-- BEGIN YOUR EDITS HERE
 
 
-- Use INSERT statements to add new text. You can reference these text strings in other scratchpad files to display them in game.
INSERT OR REPLACE INTO LocalizedText 
		(Language, Text, Tag) 
VALUES ( 'en_US', 'Friends receive an extra trade route.' , 'LOC_QUO_TRAIT_FRIENDS_ICELAND_DESCRIPTION' );
 

 -- Use UPDATE statements to update existing text

--EXAMPLES:
--UPDATE LocalizedText SET Text= Text || 'This text will appear APPENDED to the German civilization.' WHERE Tag='LOC_TRAIT_LEADER_HOLY_ROMAN_EMPEROR_DESCRIPTION' ;
--UPDATE LocalizedText SET Text= 'This text will OVERWRITE the German civilization text.' WHERE Tag='LOC_TRAIT_LEADER_HOLY_ROMAN_EMPEROR_DESCRIPTION' ;
 
 


-- UPDATE BUG TRACKER
-- This code should go last in every file. Do not modify or remove.

