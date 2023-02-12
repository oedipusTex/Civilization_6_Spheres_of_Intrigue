/*
    Created by Quo
*/
 


-- Restored in v3.09 
-- This code is intended for use with Options available from drop-downs on the map menu. It was removed due to a conflict with other mods.


-- LOGS


-- Debug
INSERT INTO tblQuoDebug 
	(DebugID, 		x_Open, x_Close, 	Message)
VALUES ('Quo_Options_Code',	'1',	'0',		'') ;




-- Create a trait type to absolutely prevent anyone from ever building this without outside code
-- REMOVED: Although the concept is sound, this seems to cause a crash when a player takes a city from another player. 

/*--INSERT INTO Types
	(Type, 				Kind)
VALUES 	('QUO_TRAIT_NO_ONE_CAN_BUILD', 	'KIND_TRAIT') ;

INSERT INTO Traits 
	(TraitType,			Name,						Description,						InternalOnly)
VALUES ('QUO_TRAIT_NO_ONE_CAN_BUILD',	'LOC_QUO_TRAIT_NO_ONE_CAN_BUILD_NAME',		'LOC_QUO_TRAIT_NO_ONE_CAN_BUILD_DESCRIPTION',		0) ;
*/




-- BORDER EXPANSION RATE


INSERT INTO Types
	(Type, 								Kind)
VALUES 	('QUO_MODIFIERTYPE_CULTURE_BORDER_DISCOUNT_OPTION', 	'KIND_MODIFIER') ;

INSERT INTO DynamicModifiers
	(ModifierType, 						CollectionType, 		EffectType)
VALUES	('QUO_MODIFIERTYPE_CULTURE_BORDER_DISCOUNT_OPTION',	'COLLECTION_PLAYER_CITIES',	'EFFECT_ADJUST_CITY_CULTURE_BORDER_EXPANSION') ;



-- Modifier is permanent because the building is added by code and immediately deleted.
-- Users can override this option with the MyOptions file

INSERT INTO Modifiers
	(ModifierID, 					ModifierType, 				RunOnce, 	Permanent, 		OwnerRequirementSetId, 		SubjectRequirementSetId)
VALUES	('QUO_CULTURE_BORDER_DISCOUNT_OPTION',	 	'QUO_MODIFIERTYPE_CULTURE_BORDER_DISCOUNT_OPTION', 	0, 			1, 				NULL,						NULL) ;

-- Insert the modifierargument with a default Value
INSERT INTO ModifierArguments
	(ModifierID,			Name,		Type, 			Value,	Extra)
VALUES	('QUO_CULTURE_BORDER_DISCOUNT_OPTION', 'Amount', 	'ARGTYPE_IDENTITY', 	'500',	NULL) ;



-- Apply the value from MyOptions

UPDATE ModifierArguments
   SET Value = (
           SELECT tblQuoOptions.Value
             FROM tblQuoOptions
            WHERE tblQuoOptions.OptionID = 'QUO_OPTION_BORDER_SPEED_AMOUNT'
       )
 WHERE ModifierId = 'QUO_CULTURE_BORDER_DISCOUNT_OPTION' AND 
       Name = 'Amount';


INSERT INTO TraitModifiers
	(TraitType, 				ModifierID)
VALUES	('TRAIT_LEADER_MAJOR_CIV',		'QUO_CULTURE_BORDER_DISCOUNT_OPTION'); 







-- UPDATE BUG TRACKER
-- This code should go last in every file


UPDATE tblQuoDebug SET x_Close='1' WHERE DebugID='Quo_Options_Code';