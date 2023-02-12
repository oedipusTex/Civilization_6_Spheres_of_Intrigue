/*
    Created by Quo
*/
 


-- NOTE THAT THIS CODE ALWAYS RUNS FIRST.
-- AS OF VERSION 3.11.06 THIS CODE NOW LOADS IN BOTH THE GAMEPLAY AND TEXT DATABASES.


-- LOGS


-- Create a table that is used to store game options
CREATE TABLE tblQuoOptions 
(
	OptionID text PRIMARY KEY,
	Value text,
	OptionClass text
);

-- Create a listing for every option players can customize in the MyOptions file
-- Note that whatever is entered for the Value here doesn't matter at all, because it gets overwritten by stuff in MyOptions.
INSERT INTO tblQuoOptions
	(OptionID, 			Value, 	OptionClass)
VALUES	('QUO_OPTION_BORDER_SPEED_AMOUNT',	'-99', 'QUO'),
	('QUO_OPTION_MAX_BARB_CAMPS_PER_PLAYER',	'-99', 'QUO'),
	('QUO_OPTION_BARB_XP_SOFTCAP',	'-99', 'QUO'),
	('QUO_OPTION_MIN_DISTANCE_TO_BARB_CAMPS',	'-99', 'QUO'),	
	('QUO_OPTION_REBELLION_CHANCE_PER_POINT',	'-99', 'QUO'),	
	('QUO_OPTION_SLOW_BARBARIAN_SCOUTS',	'-99', 'QUO'),
	('QUO_OPTION_NUM_FREE_TOKENS_MEET_CITY_STATE',	'-99', 'QUO'),	
	('QUO_OPTION_ENABLE_HARDCORE_SCIENCE_RULES',	'-99', 'QUO'),	
	('QUO_OPTION_DIPLOMACY_TIMER_DURATION',	'-99', 'QUO'),	
	('QUO_OPTION_ROCKETBOOTS',	'-99', 'QUO'),
	('QUO_OPTION_EXTRA_SIGHT',	'-99', 'QUO'),
	('QUO_OPTION_CAN_SIEGE_MOVE_AND_SHOOT',	'-99', 'QUO'),	
	('QUO_OPTION_ARE_ANTI_CAV_RANGED',	'-99', 'QUO'),
	('QUO_OPTION_ARE_MELEE_SHIPS_RANGED',	'-99', 'QUO'),
	('QUO_OPTION_WALLS_HAVE_PREREQS',	'-99', 'QUO'),	
	('QUO_OPTION_SLOW_GREAT_PEOPLE',	'-99', 'QUO'),
	('QUO_OPTION_CAN_FREE_PLACE_WONDERS',	'-99', 'QUO'),
	('QUO_OPTION_CAN_WONDERS_CULTURE_BOMB',	'-99', 'QUO'),
	('QUO_OPTION_NUM_FREE_TOKENS_WONDER_BUILT',	'-99', 'QUO'),
	('QUO_OPTION_RADIAL_BUILDING_PRODUCTION_MULTIPLIER',	'-99', 'QUO'),	
	('QUO_OPTION_CONVERT_GP_POLICIES_TO_DIPLO',	'-99', 'QUO'),
	('QUO_OPTION_MIN_NUM_RESOURCE_FOR_PRODUCTION_ANYWHERE',	'-99', 'QUO'),
	('QUO_OPTION_SETTLERS_ESCAPE',	'-99', 'QUO'),
	('QUO_OPTION_ENABLE_BIOMES',	'-99', 'QUO'),
	('QUO_OPTION_ENABLE_FRIEND_BONUSES_FOR_MOD_CIVS',	'-99', 'QUO'),
	('QUO_OPTION_THRESHOLD_SHIFT_PER_PAST_GOLDEN_AGE',	'-99', 'QUO'),
	('QUO_OPTION_GOLDEN_AGE_SCORE_BASE_THRESHOLD',	'-99', 'QUO'),
	('QUO_OPTION_ENABLE_WELCOME_SCREEN',	'-99', 'QUO'),
	--('QUO_OPTION_SB_DIPLOMACY_BONUS_AMOUNT',	'-99', 'QUO'),
	--('QUO_OPTION_SB_FREE_GOLD_PER_TURN_AMOUNT',	'-99', 'QUO'),
	('XAV_OPTION_BOOST_PENALTY',	'-99', 'XAV'), 
	('XAV_OPTION_USE_SLOWER_TECH_SPEED',	'-99', 'XAV') , 
	('XAV_OPTION_CAN_BUILDERS_RUSH_DISTRICTS',	'-99', 'XAV') ,
	('QUO_OPTION_HELL_MODE_TIER',	'-99', 'HELL') ;



-- Create a table for debugging
CREATE TABLE tblQuoDebug 
(
	DebugID text -- ID for the table,
	, x_Open text -- did the file open?
	, x_Close text -- did the file close?
	, Message text -- optional place for adding a message
);


-- Create table for MyScratchpad support
CREATE TABLE tblScratchNotes 
(
	NoteID text -- ID for the table,
	, Message text -- optional place for adding a message
);



INSERT INTO tblQuoDebug 
	(DebugID, 		x_Open, x_Close, 	Message)
VALUES ('Quo_AA_Setup_Code',	'1',	'0',		'') ;


-- A table for registering fan-made civilizations
CREATE TABLE tblQuo_Option_FanMadeCivilizations 
(
	xCivilizationType text -- Civilization type,
	, xLeaderType -- Leadertype, used on config /character select screens
	, xBiomeTrait text -- name of the Biome
);





-- UPDATE BUG TRACKER
-- This code should go last in every file

UPDATE tblQuoDebug SET x_Close='1' WHERE DebugID='Quo_AA_Setup_Code';
