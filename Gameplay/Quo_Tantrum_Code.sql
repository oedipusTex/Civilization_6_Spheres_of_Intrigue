/*
    Created by Quo
*/
 

-- Debug
INSERT INTO tblQuoDebug 
	(DebugID, 		x_Open, x_Close, 	Message)
VALUES ('Quo_Tantrum_Code',	'1',	'0',		'') ;




-- SUMMER PATCH FIXER
-- This hopefully temporary code is here to try to fix some of the crazy in Firaxis' Summer patch that
-- results in an AI love fest
UPDATE DiplomaticStateTransitions SET AllowTransitionMin=15 WHERE BaseState='DIPLO_STATE_FRIENDLY' AND TransitionState='DIPLO_STATE_DECLARED_FRIEND' ;
UPDATE DiplomaticStateTransitions SET AllowTransitionMin=5 WHERE BaseState='DIPLO_STATE_NEUTRAL' AND TransitionState='DIPLO_STATE_FRIENDLY' ;



-- DIPLO TIMERS
-- Moved from the Hardcore file, now controlled by MyOptions
-- Increase duration of the various diplomacy relationships

-- Globals
UPDATE GlobalParameters SET Value=(SELECT tblQuoOptions.Value FROM tblQuoOptions WHERE OptionID='QUO_OPTION_DIPLOMACY_TIMER_DURATION') WHERE Name='LEVY_MILITARY_TURN_DURATION' ;
UPDATE GlobalParameters SET Value=(SELECT tblQuoOptions.Value FROM tblQuoOptions WHERE OptionID='QUO_OPTION_DIPLOMACY_TIMER_DURATION') WHERE Name='DIPLOMACY_DECLARED_FRIENDSHIP_TIME_LIMIT' ;
UPDATE GlobalParameters SET Value=(SELECT tblQuoOptions.Value FROM tblQuoOptions WHERE OptionID='QUO_OPTION_DIPLOMACY_TIMER_DURATION') WHERE Name='DIPLOMACY_DEFENSIVE_PACT_TIME_LIMIT' ;
UPDATE GlobalParameters SET Value=(SELECT tblQuoOptions.Value FROM tblQuoOptions WHERE OptionID='QUO_OPTION_DIPLOMACY_TIMER_DURATION') WHERE Name='DIPLOMACY_DENOUNCE_TIME_LIMIT' ;
UPDATE GlobalParameters SET Value=(SELECT tblQuoOptions.Value FROM tblQuoOptions WHERE OptionID='QUO_OPTION_DIPLOMACY_TIMER_DURATION') WHERE Name='DIPLOMACY_ALLIANCE_TIME_LIMIT' ;



-- Diplo Actions table
UPDATE DiplomaticActions SET Duration=(SELECT tblQuoOptions.Value FROM tblQuoOptions WHERE OptionID='QUO_OPTION_DIPLOMACY_TIMER_DURATION') WHERE DiplomaticActionType='DIPLOACTION_DEFENSIVE_PACT' ;
UPDATE DiplomaticActions SET Duration=(SELECT tblQuoOptions.Value FROM tblQuoOptions WHERE OptionID='QUO_OPTION_DIPLOMACY_TIMER_DURATION') WHERE DiplomaticActionType='DIPLOACTION_ALLIANCE' ;


-- Coded out for now because a lot of players may not like this
-- UPDATE DiplomaticStateActions SET Duration=(SELECT tblQuoOptions.Value FROM tblQuoOptions WHERE OptionID='QUO_OPTION_DIPLOMACY_TIMER_DURATION') WHERE DiplomaticActionType='DIPLOACTION_OPEN_BORDERS' ;


-- Coded out actions for now because not sure what these do in practical terms
-- UPDATE DiplomaticStateActions SET Duration=(SELECT tblQuoOptions.Value FROM tblQuoOptions WHERE OptionID='QUO_OPTION_DIPLOMACY_TIMER_DURATION') WHERE DiplomaticActionType='DIPLOACTION_JOINT_WAR' ;
-- UPDATE DiplomaticStateActions SET Duration=(SELECT tblQuoOptions.Value FROM tblQuoOptions WHERE OptionID='QUO_OPTION_DIPLOMACY_TIMER_DURATION') WHERE DiplomaticActionType='DIPLOACTION_MAKE_PEACE' ;





-- AI TIMERS

-- Increase 10 turns ago requirement

UPDATE RequirementArguments SET Value='15' WHERE RequirementId='REQUIRES_MET_10_TURNS_AGO' AND Name='TurnsAgo' ;


-- Increase timer on some of the leaders that were originally set to just 10

UPDATE Modifiers SET SubjectRequirementSetId='PLAYER_IS_MAJOR_CIV_KNOWN_30_TURNS' WHERE ModifierId='AGENDA_LAST_VIKING_KING' ;
UPDATE Modifiers SET SubjectRequirementSetId='PLAYER_IS_MAJOR_CIV_KNOWN_30_TURNS' WHERE ModifierId='AGENDA_OPTIMUS_PRINCEPS' ;
UPDATE Modifiers SET SubjectRequirementSetId='PLAYER_IS_MAJOR_CIV_KNOWN_30_TURNS' WHERE ModifierId='AGENDA_QUEEN_OF_NILE' ;
UPDATE Modifiers SET SubjectRequirementSetId='PLAYER_IS_MAJOR_CIV_KNOWN_30_TURNS' WHERE ModifierId='AGENDA_BUSHIDO' ;
UPDATE Modifiers SET SubjectRequirementSetId='PLAYER_IS_MAJOR_CIV_KNOWN_30_TURNS' WHERE ModifierId='AGENDA_BLACK_QUEEN' ;




-- Lower warmonger points by era

-- Moved to Scratchpad in v6.0.14
/* 
UPDATE Eras SET WarmongerPoints ='1', WarmongerLevelDescription='LOC_WARMONGER_LEVEL_LIGHT' WHERE EraType='ERA_CLASSICAL' ;
UPDATE Eras SET WarmongerPoints ='1', WarmongerLevelDescription='LOC_WARMONGER_LEVEL_LIGHT' WHERE EraType='ERA_MEDIEVAL' ;
UPDATE Eras SET WarmongerPoints ='2', WarmongerLevelDescription='LOC_WARMONGER_LEVEL_MODERATE' WHERE EraType='ERA_RENAISSANCE' ;
UPDATE Eras SET WarmongerPoints ='2', WarmongerLevelDescription='LOC_WARMONGER_LEVEL_MODERATE' WHERE EraType='ERA_INDUSTRIAL' ;
UPDATE Eras SET WarmongerPoints ='2', WarmongerLevelDescription='LOC_WARMONGER_LEVEL_MODERATE' WHERE EraType='ERA_MODERN' ;
UPDATE Eras SET WarmongerPoints ='4', WarmongerLevelDescription='LOC_WARMONGER_LEVEL_HEAVY' WHERE EraType='ERA_ATOMIC' ;
UPDATE Eras SET WarmongerPoints ='4', WarmongerLevelDescription='LOC_WARMONGER_LEVEL_HEAVY' WHERE EraType='ERA_INFORMATION' ; */






-- ATTITUDES

-- Pedro
-- Lower his hatred for players with more Great People.
UPDATE ModifierArguments SET Value='-1' WHERE ModifierId='AGENDA_MODIFIER_LEADS_GREAT_PEOPLE' AND Name='InitialValue' ; 


-- Saladin (and Philip?)
-- Lower his hatred for rival religions.
UPDATE ModifierArguments SET Value='-3' WHERE ModifierId='AGENDA_MODIFIER_ENCROACHING_RELIGION' AND Name='InitialValue' ; 


-- Mvemba
-- Lower his anger over not receiving player's religion.
UPDATE ModifierArguments SET Value='-2' WHERE ModifierId='AGENDA_MODIFIER_RELIGION_NOT_RECEIVED' AND Name='InitialValue' ; 


-- Pericles
-- Lower his anger from competing with him for a city state.
UPDATE ModifierArguments SET Value='-2' WHERE ModifierId='AGENDA_MODIFIER_DELIAN_COMPETING_MINORS' AND Name='InitialValue' ; 


-- Make the extremes of the Exploration random agenda less ridiculous since player nearly always violates this
UPDATE ModifierArguments SET Value='-2' WHERE ModifierID= 'AGENDA_HIGH_EXPLORATION' AND Name='InitialValue' ;
UPDATE ModifierArguments SET Value='2' WHERE ModifierID= 'AGENDA_LOW_EXPLORATION' AND Name='InitialValue' ;


-- Lower anger from different governments for Ideologues 
UPDATE ModifierArguments SET Value='-2' WHERE ModifierID='AGENDA_DIFFERENT_GOVERNMENT' AND Name='InitialValue' ;


-- Lower all whining about troops near borders
UPDATE ModifierArguments SET Value='-1' WHERE ModifierID= 'STANDARD_DIPLOMATIC_NEAR_BORDER_WARNING' AND Name='ReductionValue' ;
UPDATE ModifierArguments SET Value='0' WHERE ModifierID= 'STANDARD_DIPLOMATIC_NEAR_BORDER_WARNING' AND Name='InitialValue' ;
UPDATE ModifierArguments SET Value='1' WHERE ModifierID= 'STANDARD_DIPLOMATIC_NEAR_BORDER_WARNING' AND Name='ReductionTurns' ;


-- Make first impressions decay faster
UPDATE ModifierArguments SET Value='-1' WHERE ModifierID= 'STANDARD_DIPLOMACY_RANDOM' AND Name='ReductionValue' ;
UPDATE ModifierArguments SET Value='5' WHERE ModifierID= 'STANDARD_DIPLOMACY_RANDOM' AND Name='ReductionTurns' ;


-- Make breaking a promise less punishing
UPDATE ModifierArguments SET Value='5' WHERE ModifierID= 'STANDARD_DIPLOMACY_RANDOM' AND Name='ReductionTurns' ;
UPDATE ModifierArguments SET Value='-1' WHERE ModifierID= 'STANDARD_DIPLOMACY_RANDOM' AND Name='ReductionValue' ;
UPDATE ModifierArguments SET Value='-2' WHERE ModifierID= 'STANDARD_DIPLOMACY_RANDOM' AND Name='ModifierPerTransgression' ;


-- Remove all bitching about rival governments until the final 3
-- Note that the line below zeroes out ALL intolerance, even from mods that add new governments
UPDATE Governments SET OtherGovernmentIntolerance='0' ; 

UPDATE Governments SET OtherGovernmentIntolerance='-5' WHERE GovernmentType='GOVERNMENT_FASCISM' ;
UPDATE Governments SET OtherGovernmentIntolerance='-6' WHERE GovernmentType='GOVERNMENT_COMMUNISM' ;
UPDATE Governments SET OtherGovernmentIntolerance='-3' WHERE GovernmentType='GOVERNMENT_DEMOCRACY' ;


-- DLC


-- Make Cyrus much less upset when you don't declare a surprise war, because this keeps him perma-mad at everyone
-- Also extend the timer before this triggers

UPDATE ModifierArguments SET Value='-1' WHERE ModifierID= 'AGENDA_BACKSTABBER' AND Name='NeverSurpriseWarPenalty' ;
UPDATE Modifiers SET SubjectRequirementSetId='PLAYER_IS_MAJOR_CIV_KNOWN_30_TURNS' WHERE ModifierId='AGENDA_BACKSTABBER' ;




-- UPDATE BUG TRACKER
-- This code should go last in every file


UPDATE tblQuoDebug SET x_Close='1' WHERE DebugID='Quo_Tantrum_Code';
