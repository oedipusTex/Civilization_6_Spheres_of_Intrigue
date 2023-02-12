/*
	INSTRUCTIONS

	Update the Values below to customize your gameplay experience. 
	Be sure to change only the number that appears after the Value and nothing else in the code.
*/
 
-- LOGS
-- Do not edit this section. It is used for bug tracking purposes.
INSERT INTO tblQuoDebug 
	(DebugID, 		x_Open, x_Close, 	Message)
VALUES ('MyOptions',	'1',	'0',		'') ;
 




-- ====== START YOUR EDITING HERE BY ADJUSTING THE NUMBERS THAT APPEAR AFTER THE VALUE FIELD
-- ======================================================================================
-- ==                              QUO MOD OPTIONS                          ==
-- ======================================================================================

--================ 
-- REGISTER FAN MADE CIVILIZATIONS WITH A SPHERE
/* Add a fan-made civilization to a Sphere. You must identify the name of the civilization from the mod code in order to do this. Names of Biomes are:

	QUO_TRAIT_BIOME_ASIAN_STEPPE  -- Nomadic Asia 		
	QUO_TRAIT_BIOME_NATIVE_AMERICA 		
	QUO_TRAIT_BIOME_NEW_WORLD 		
	QUO_TRAIT_BIOME_BOREAL_EUROPE -- Scandinavia
	QUO_TRAIT_BIOME_ASIAN_PACIFIC 		
	QUO_TRAIT_BIOME_ROMANESQUE -- Hellenic
	QUO_TRAIT_BIOME_ARABESQUE  -- Middle East		
	QUO_TRAIT_BIOME_AFRICA  -- Sub saharan africa		
	QUO_TRAIT_BIOME_NORTH_AFRICA 		
	QUO_TRAIT_BIOME_ASIAN_EXPANSE -- Mainland Asia		
	QUO_TRAIT_BIOME_WEST_EUROPE 		
	QUO_TRAIT_BIOME_UK 	-- British Isles	
	QUO_TRAIT_BIOME_EAST_EUROPE 		
*/

-- Add additional civilizations using this format:
/*INSERT OR REPLACE INTO tblQuo_Scratchpad_FanMadeCivilizations 
		(xCivilizationType, 		xBiomeTrait)
VALUES	('CIVILIZATION_1',	'QUO_TRAIT_BIOME_BOREAL_EUROPE'),
		('CIVILIZATION_2',	'QUO_TRAIT_BIOME_ASIAN_PACIFIC'),
		('CIVILIZATION_3',	'QUO_TRAIT_BIOME_UK');*/

INSERT OR REPLACE INTO tblQuo_Option_FanMadeCivilizations 
		(xCivilizationType, 		xBiomeTrait)
VALUES	('CIVILIZATION_SUK_ICELAND',	'QUO_TRAIT_BIOME_BOREAL_EUROPE');



-- ================
-- USE OLD HARDCORE RULES FOR TECH AND CULTURE
/* Set Value to enable or disable the old Hardcore rules for science and culture. 1= Enable, 0=Disable. In this mode, you receive no free culture or science from population.
The AI receives a bonus to each district it builds, rising as it progresses through the eras.  This mode was originally created for the Vanilla version of the game, and
is no longer as needed with the Rise and Fall expansion. Recommended setting is 0 (off).*/

UPDATE tblQuoOptions
   SET Value = 0
 WHERE OptionID = 'QUO_OPTION_ENABLE_HARDCORE_SCIENCE_RULES' ;
 
 
 
  -- ================
-- HELL MODE
/* Set Value to enable or disable Hell mode. Hell mode is deliberately unfair to the human player and is considered an added level of challenge. Hell Mode is available in multiple tiers
of difficulty as described below.

	If Hell Mode is set to 1, enemy AIs receive:
      - Free Ranged unit when they found or conquer a city
	  - Leveling up does not provide healing (for anyone)
	  - Vision through trees and forests
	  
	  If Hellmode is set to 2 AIs also receive:
	  - +1 science and culture per district, rising to +2 when the game reaches the Renaissance, and +3 when the game reaches the atomic era 
	  
	  If Hellmode is set to 3 or higher AIs also receive:
	  - Reduce Loyalty of nearest city by 20 when a unit is defeated inside enemy territory
	  - AI units heal even if they moved or attacked this turn
	  */

UPDATE tblQuoOptions
   SET Value = 0
 WHERE OptionID = 'QUO_OPTION_HELL_MODE_TIER';


 
-- ================
-- SLOW GREAT PEOPLE
/* Set Value to enable or disable delayed great people. 1= Enable, 0=Disable. In this mode, Great People in later eras have higher costs, to balance them against
increase tech and culture costs. Recommended setting is 1. Setting to 0 will use Vanilla rules.*/

UPDATE tblQuoOptions
   SET Value = 1
 WHERE OptionID = 'QUO_OPTION_SLOW_GREAT_PEOPLE' ; 
 
 
-- ================
-- CAN FREE PLACE WONDERS (Ignore districts)
/* Set Value to enable or disable district adjacency requirements for Wonders. 1= Enable, 0=Disable. When this is turned on, Wonders no longer require district adjacencies. They may still require
specific terrain or buildings/districts to exist in the city, but will not require the wonder to be placed adjacent. NOTE: This setting no longer removes adjacency requirements for Harbor districts, 
in order to avoid game-breaking bugs. Recommended setting is 1. Setting to 0 will use Vanilla rules.*/

UPDATE tblQuoOptions
   SET Value = 1
 WHERE OptionID = 'QUO_OPTION_CAN_FREE_PLACE_WONDERS' ; 
 
 
 -- ================
-- CAN WONDERS CULTURE BOMB
/* Set Value to enable or disable culture bombs from wonders. 1= Enable, 0=Disable. When this is turned on, completing a wonder will grab tiles up to 3 tiles away from the city center, even
if owned by another player. Recommended setting is 1. Setting to 0 will use Vanilla rules.*/

UPDATE tblQuoOptions
   SET Value = 1
 WHERE OptionID = 'QUO_OPTION_CAN_WONDERS_CULTURE_BOMB' ; 
 
 
 -- ================
-- NUMBER OF FREE TOKENS FROM WONDER BUILT
/* Set Value to indicate the number of free city state tokens players receive for completing a Wonder. Recommended setting as of the Rise and Fall expansion is 0. 
0 will provide 0 tokens (as in the unmodded game), 1 will provide 1, etc. Do not set a negative value.*/

UPDATE tblQuoOptions
   SET Value = 0
 WHERE OptionID = 'QUO_OPTION_NUM_FREE_TOKENS_WONDER_BUILT' ; 
 
 
 -- =================
-- BORDER SPEED
-- Change the Value below to adjust the border speed discount. The default value for the mod as of Gathering Storm is 0, for an 0% increase. Larger number produce faster border pops.
-- A value of 0 indicates no discount (i.e. use Unmodded rules).

UPDATE tblQuoOptions
   SET Value = 0
 WHERE OptionID = 'QUO_OPTION_BORDER_SPEED_AMOUNT' ;
 
 
 -- =================
-- ROCKETBOOTS
-- Change the Value below to the number of extra Base Move points units receive. This value will apply to all units with a Base Move of at least 2, except for Siege units. A value
-- of 0 means no change. Recommended value: 1.

UPDATE tblQuoOptions
   SET Value = 1
 WHERE OptionID = 'QUO_OPTION_ROCKETBOOTS' ;
 
 
 -- =================
-- FARSIGHT
-- Change the Value below to the number of extra Sight range units receive. This setting may help the AI by giving longer sight range to targets. 
-- A value of 0 indicates no extra sight. 

UPDATE tblQuoOptions
   SET Value = 0
 WHERE OptionID = 'QUO_OPTION_EXTRA_SIGHT' ; 
 

 -- =================
-- WALLS HAVE PREREQS
-- Change the Value below to indicate whether Walls require Bedrock in the city before they can be built. 1=Required, 0= Not Required.
-- Recommended setting: 1.

UPDATE tblQuoOptions
   SET Value = 1
 WHERE OptionID = 'QUO_OPTION_WALLS_HAVE_PREREQS' ;
 

-- =================
-- QUO_OPTION_CAN_SIEGE_MOVE_AND_SHOOT
-- Change the Value below to indicate whether Siege units can move and shoot on the same turn. 1=Enable move and shoot, 0=Unit cannot move and shoot. Recommended setting: 1.

UPDATE tblQuoOptions
   SET Value = 1
 WHERE OptionID = 'QUO_OPTION_CAN_SIEGE_MOVE_AND_SHOOT' ;


-- =================
-- RANGED ANTI-CAVALRY RULES
-- Change the Value below to indicate whether Anti-Calvary units should use Ranged rules. If this is Enabled, Anti Calvary receive a Range 1 attack
-- equal to their Combat strength. As of Gathering Storm, the default for this setting is 0 (off).
-- 1 = Enabled, 0 = Disable. Recommend setting: 1

UPDATE tblQuoOptions
   SET Value = 0
 WHERE OptionID = 'QUO_OPTION_ARE_ANTI_CAV_RANGED' ; 
 
 
 
 
 -- =================
-- RANGED SHIP RULES
-- Change the Value below to indicate whether Melee ships should use Ranged rules. If this is Enabled, Melee Ships receive a Range 1 attack that is 70% of Combat Strength.
-- Ranged ships with a Range of 1 receive +1 Range. Note that the AI may struggle to take cities by sea if this option is enabled.
-- 1 = Enabled, 0 = Disable. 

UPDATE tblQuoOptions
   SET Value = 0
 WHERE OptionID = 'QUO_OPTION_ARE_MELEE_SHIPS_RANGED' ; 
 
 

-- ================
-- MAX BARBARIAN CAMPS PER PLAYER
/*
Change the value below to adjust the maximum number of Barbarian camps allowed per player. In the unmodded game, this
value is 3. The recommended value is 3. A higher number allows more camps per player.
*/

UPDATE tblQuoOptions
   SET Value = 3
 WHERE OptionID = 'QUO_OPTION_MAX_BARB_CAMPS_PER_PLAYER' ;



-- ================
-- MIN DISTANCE TO BARBARIAN CAMPS 
/* Change the value below to adjust the minimum distance in tiles that a Barbarian camp can appear. Note that the game engine 
reduces this distance based on game difficulty. Unmodded value is 4. Recommended value is 6. */

UPDATE tblQuoOptions
   SET Value = 6
 WHERE OptionID = 'QUO_OPTION_MIN_DISTANCE_TO_BARB_CAMPS' ;



 -- ================
-- BARBARIAN XP SOFTCAP
/* Set the Value to the max level you can obtain from fighting Barbarians. Vanilla value is 1. Recommended value is 2. */

UPDATE tblQuoOptions
   SET Value = 2
 WHERE OptionID = 'QUO_OPTION_BARB_XP_SOFTCAP' ;



-- ================
-- REBELLION CHANCE PER POINT OF UNHAPPINESS
/* Set the percent change per point of Happiness of a rebellion happening each turn. Default value is 2. Recommended value is 0.2. 
A higher number means a higher chance of rebellion per turn. */

UPDATE tblQuoOptions
   SET Value = 0.2
 WHERE OptionID = 'QUO_OPTION_REBELLION_CHANCE_PER_POINT' ;
 

 
-- ================
-- SLOW BARBARIAN SCOUTS
/* Set 1 or 0 to enable or disable slowed Barbarian scouts. Barbarian scouts cannot move as many tiles per turn as normal. 1= Enable 0 = Disable.
Recommended setting: 1. */

UPDATE tblQuoOptions
   SET Value = 1
 WHERE OptionID = 'QUO_OPTION_SLOW_BARBARIAN_SCOUTS' ;
 
 

-- ================
-- NUM FREE TOKENS FOR MEETING CITY STATE
/* Set the number of free tokens a player recieves if they are first to meet a city state. Unmodded value is 1. Recommended value is 0. */

UPDATE tblQuoOptions
   SET Value = 0
 WHERE OptionID = 'QUO_OPTION_NUM_FREE_TOKENS_MEET_CITY_STATE' ;
 

 
-- ================
-- DIPLOMACY TIMERS
/* Set Value to the duration that diplomatic actions, such as denouncements, friend pacts, defense pacts, etc should last.
This setting does not affect the duration of trade agreements or open borders, and does not take game speed into account.
The unmodded value is 30. Recommended value for standard speed as of the Rise and Fall expansion is 40. */

UPDATE tblQuoOptions
   SET Value = 40
 WHERE OptionID = 'QUO_OPTION_DIPLOMACY_TIMER_DURATION' ;
 
 
-- ================
-- CONVERT GREAT PERSON POLICIES TO DIPLOMATIC
/* When enabled, this feature converts all Great Person ("purple") policy cards to Diplomatic ("green") Cards, allowing them to be played in either
the Wildcard or Diplomatic slot. 1= Enable 0=Disable.  */

UPDATE tblQuoOptions
   SET Value = 1
 WHERE OptionID = 'QUO_OPTION_CONVERT_GP_POLICIES_TO_DIPLO' ;
 
 
 
-- ================
-- RADIAL BUILDING PRODUCTION INCREASE
/* Set Value equal to the Multiplier applied to buildings with a radial Production effect, like Factories. The recommended value is 2. The unmodded game value is 1.
Setting to zero will eliminate Production from these buildings altogether. */

UPDATE tblQuoOptions
   SET Value = 2
 WHERE OptionID = 'QUO_OPTION_RADIAL_BUILDING_PRODUCTION_MULTIPLIER' ;
 
 
 -- ================
-- STRATEGIC_RESOURCE_MINIMUM_FOR_PRODUCTION_ANYWHERE
/* Set Value equal to the minimum number of copies of a strategic resource needed to build or purchase a unit in a city without an Encampment. The recommended value is 1. The 
unmodded game value is 2. */

UPDATE tblQuoOptions
   SET Value = 1
 WHERE OptionID = 'QUO_OPTION_MIN_NUM_RESOURCE_FOR_PRODUCTION_ANYWHERE' ;
 
 
 
 -- ================
-- SETTLERS ESCAPE ON CAPTURE
/* Set Value to enable or disable Settlers from escaping back to the nearest city when captured. 1 = Enable 0= Disable. Recommended setting: 1. */

UPDATE tblQuoOptions
   SET Value = 1
 WHERE OptionID = 'QUO_OPTION_SETTLERS_ESCAPE' ;
 


 -- ================
-- ENABLE BIOMES
/* Set Value to enable or disable Biomes for each civilization. Biomes are extra traits that are shared among civilizations of similar culture, geography, or era. 
NOTE: When this is disabled, the Biome will still display on the character select screen, just not be applied when the game is actually started.
1 = Enable 0= Disable. Recommended setting: 1. */

UPDATE tblQuoOptions
   SET Value = 1
 WHERE OptionID = 'QUO_OPTION_ENABLE_BIOMES' ;
 
 
 
  -- ================
-- THRESHOLD_SHIFT_PER_PAST_GOLDEN_AGE
/* Set Value to the increase in difficulty of scoring a Golden Age after scoring a previous Golden Age. Higher numbers indicate increased difficulty.
The unmodded value is 5. Recommended value: 5. Do not set a negative number.*/

UPDATE tblQuoOptions
   SET Value = 5
 WHERE OptionID = 'QUO_OPTION_THRESHOLD_SHIFT_PER_PAST_GOLDEN_AGE' ;
 
 
 
  -- ================
-- GOLDEN_AGE_SCORE_BASE_THRESHOLD
/* Set Value to the base number of era score points required to score a Golden Age. Higher numbers indicate more era score points needed. The unmodded value is 24. 
Recommended value: 24. */

UPDATE tblQuoOptions
   SET Value = 24
 WHERE OptionID = 'QUO_OPTION_GOLDEN_AGE_SCORE_BASE_THRESHOLD' ;

 
 
 

 -- ================
-- ENABLE BONUSES FOR MOD CIVS
/* Set Value to enable or disable modded civs automatically receiving a Friendship bonus of: Provides +1 Trade route to friends. Civs without
friendship bonuses would include any you have downloaded by other modders, and any new DLC Civs created by Firaxis that this mod does not
yet provide with a personalized bonus. */

UPDATE tblQuoOptions
   SET Value = 1
 WHERE OptionID = 'QUO_OPTION_ENABLE_FRIEND_BONUSES_FOR_MOD_CIVS';



 -- ================
-- ENABLE WELCOME SCREEN
/* Set Value to enable or disable the Welcome Screen that appears when you start a game with this mod loaded. */

UPDATE tblQuoOptions
   SET Value = 1
 WHERE OptionID = 'QUO_OPTION_ENABLE_WELCOME_SCREEN'; 
 

 
 
-- ======================================================================================
-- ==                              IMPROVEMENTS PATCH OPTIONS                          ==
-- ======================================================================================


-- =================
-- EUREKA AND INSPIRATION BOOST MULTIPLIER
-- Change the Value below to increase or lower the amount of boost that eurekas and inspirations give.
-- The default value for this mod is 0.7, which lowers boost the amount by about 30%
-- A value of zero will eliminate boosts entirely. A value of 1 will use the unmodded Vanilla value.

UPDATE tblQuoOptions
   SET Value = .7
 WHERE OptionID = 'XAV_OPTION_BOOST_PENALTY' ;



-- =================
-- TECH AND CIVIC RESEARCH SPEED
/* Change the Value below to indicate whether to use the slower tech speeds from the 
Improvements Patch mod. Turning this on will slightly increase the cost of early techs, and greatly
increase the cost of late techs. 0= Disable. 1= Enable.*/ 

UPDATE tblQuoOptions
   SET Value = 1
 WHERE OptionID = 'XAV_OPTION_USE_SLOWER_TECH_SPEED' ;



-- =================
-- DISTRICT BUILDERS
/*  This setting controls whether Builders are capable of rushing Districts. As of the Rise and Fall expansion, the recommended setting is
0, because there are new features that explicitly grant this ability.
1 = Enable, 0 = Disable */
UPDATE tblQuoOptions
   SET Value = 0
 WHERE OptionID = 'XAV_OPTION_CAN_BUILDERS_RUSH_DISTRICTS' ;
 
 
 
 
 
UPDATE tblQuoDebug SET x_Close='1' WHERE DebugID='MyOptions';
