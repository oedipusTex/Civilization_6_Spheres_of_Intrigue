/*
    Created by Quo
*/


INSERT INTO tblQuoDebug 
	(DebugID, 		x_Open, x_Close, 	Message)
VALUES ('Quo_Main_Text',	'1',	'0',		'') ;
 

-- Configuration
-- removed in v5.0
--UPDATE LocalizedText SET Text= 'Quo Basic Rules' WHERE Tag='LOC_RULESET_NAME' ;

UPDATE LocalizedText SET Text= 'Various changes to balance. See the MyOptions file in the mod folder to adjust settings.' WHERE Tag='LOC_RULESET_DESCRIPTION' ;



-- Scouts
UPDATE LocalizedText SET Text=Text || '  [ICON_CAPITAL](Quo Mod: Scouts start at level 2. This unit can embark onto coastal waters once you learn Celestial Navigation.)' WHERE Tag='LOC_UNIT_SCOUT_DESCRIPTION' ;

-- Settlers
UPDATE LocalizedText SET Text=Text || '  [ICON_CAPITAL](Quo Mod: This unit escapes to the nearest city if captured by an enemy unit.)' WHERE Tag='LOC_UNIT_SETTLER_DESCRIPTION' ;



-- Musketmen
-- UPDATE LocalizedText SET Text=Text || '  [ICON_CAPITAL](Quo Mod: This unit does not require the Niter resource.)' WHERE Tag='LOC_UNIT_MUSKETMAN_DESCRIPTION' ;


-- Encampment
-- UPDATE LocalizedText SET Text=Text || '  [ICON_CAPITAL](Quo Mod: Encampments unlock with Code of Laws. Encampments are now required to build Walls.)' WHERE Tag='LOC_DISTRICT_ENCAMPMENT_DESCRIPTION' ;


-- Siege
UPDATE LocalizedText SET Text=Text || '  [ICON_CAPITAL](Quo Mod: This unit has 3 Range, 2 Move, and can move and attack on the same turn.)' WHERE Tag='LOC_UNIT_CATAPULT_DESCRIPTION' AND (select Value from tblquooptions where optionId='QUO_OPTION_CAN_SIEGE_MOVE_AND_SHOOT') > 0;
UPDATE LocalizedText SET Text=Text || '  [ICON_CAPITAL](Quo Mod: This unit has 3 Range, 2 Move, and can move and attack on the same turn.)' WHERE Tag='LOC_UNIT_BOMBARD_DESCRIPTION' AND (select Value from tblquooptions where optionId='QUO_OPTION_CAN_SIEGE_MOVE_AND_SHOOT') > 0;
UPDATE LocalizedText SET Text=Text || '  [ICON_CAPITAL](Quo Mod: This unit has 3 Range, 2 Move, and can move and attack on the same turn.)' WHERE Tag='LOC_UNIT_ARTILLERY_DESCRIPTION' AND (select Value from tblquooptions where optionId='QUO_OPTION_CAN_SIEGE_MOVE_AND_SHOOT') > 0;
UPDATE LocalizedText SET Text=Text || '  [ICON_CAPITAL](Quo Mod: This unit can move and attack on the same turn.)' WHERE Tag='LOC_UNIT_ROCKET_ARTILLERY_DESCRIPTION' AND (select Value from tblquooptions where optionId='QUO_OPTION_CAN_SIEGE_MOVE_AND_SHOOT') > 0;


-- UPDATE LocalizedText SET Text=Text || '  [ICON_CAPITAL](Quo Mod: This unit is delayed until the Construction tech.)' WHERE Tag='LOC_UNIT_BATTERING_RAM_DESCRIPTION' ;
-- UPDATE LocalizedText SET Text=Text || '  [ICON_CAPITAL](Quo Mod: This unit is no longer available to be built.)' WHERE Tag='LOC_UNIT_SIEGE_TOWER_DESCRIPTION' ;



-- Siege Promotions
UPDATE LocalizedText SET Text='[ICON_CAPITAL](Gain +1 Movement.)' WHERE Tag='LOC_PROMOTION_EXPERT_CREW_DESCRIPTION' ;


-- Anti Cavalry promotions
UPDATE LocalizedText SET Text='[ICON_CAPITAL](+10[ICON_STRENGTH] Strength versus Calvary units.)' WHERE Tag='LOC_PROMOTION_ECHELON_DESCRIPTION' ;


-- Melee Promotions
-- UPDATE LocalizedText SET Text='[ICON_CAPITAL](+15[ICON_STRENGTH] Strength versus Anti-Calvary units.)' WHERE Tag='LOC_PROMOTION_ZWEIHANDER_DESCRIPTION' ;

-- Steel Tech no longer gives Urban Defenses
UPDATE LocalizedText SET Text=Text || '  [ICON_CAPITAL](Quo Mod: No longer provides Urban Defenses.)' WHERE Tag='LOC_TECH_STEEL_DESCRIPTION' ;


-- City Center Adjacencies
UPDATE LocalizedText SET Text= '[ICON_CAPITAL] (Quo Mod: Allows Scouts to embark, and harvesting of [ICON_RESOURCE_FISH] Fish.)' WHERE Tag='LOC_TECH_CELESTIAL_NAVIGATION_DESCRIPTION' ;
--UPDATE LocalizedText SET Text=Text || '  [ICON_CAPITAL](Quo Mod: City Centers receive +1 [ICON_GOLD] Gold per 2 adjacent ocean tiles.)' WHERE Tag='LOC_TECH_SAILING_DESCRIPTION' ;
--UPDATE LocalizedText SET Text=Text || '  [ICON_CAPITAL](Quo Mod: City Centers receive +1 [ICON_GOLD] Gold per 2 adjacenct ocean tiles.)' WHERE Tag='LOC_TECH_CARTOGRAPHY_DESCRIPTION' ;



-- Harbor
-- UPDATE LocalizedText SET Text=Text || '  [ICON_CAPITAL](Quo Mod: Unlocks at Astrology.)' WHERE Tag='LOC_DISTRICT_HARBOR_DESCRIPTION' ;


-- Holy Site
UPDATE LocalizedText SET Text=Text || '  [ICON_CAPITAL](Quo Mod: Provides +2 extra [ICON_GreatPerson] Great Prophet points per turn.)' WHERE Tag='LOC_DISTRICT_HOLY_SITE_DESCRIPTION' ;
UPDATE LocalizedText SET Text=Text || '  [ICON_CAPITAL](Quo Mod: Like the Holy Site it replaces, provides +2 extra [ICON_GreatPerson] Great Prophet point per turn.)' WHERE Tag='LOC_DISTRICT_LAVRA_DESCRIPTION' ;


-- Entertainment Complex
-- UPDATE LocalizedText SET Text=Text || '  [ICON_CAPITAL](Quo Mod: +5% [ICON_FOOD], [ICON_CULTURE], [ICON_GOLD], [ICON_SCIENCE], [ICON_PRODUCTION] or [ICON_FAITH] to this city per resource Expo in the Capital. To earn an Expo you must control more copies of a Luxury resource than any other player (minimum 3).)' WHERE Tag='LOC_DISTRICT_ENTERTAINMENT_COMPLEX_DESCRIPTION' ;
-- UPDATE LocalizedText SET Text=Text || '  [ICON_CAPITAL](Quo Mod: +5% [ICON_FOOD], [ICON_CULTURE], [ICON_GOLD], [ICON_SCIENCE], [ICON_PRODUCTION] or [ICON_FAITH] to this city per resource Expo.)' WHERE Tag='LOC_DISTRICT_STREET_CARNIVAL_DESCRIPTION' ;





-- Aqueducts & Baths
UPDATE LocalizedText SET Text=Text || '  [ICON_CAPITAL](Quo Mod: Provides +1 toward [ICON_GreatPerson] Great Engineers.)' WHERE Tag='LOC_DISTRICT_AQUEDUCT_DESCRIPTION' ;
UPDATE LocalizedText SET Text=Text || '  [ICON_CAPITAL](Quo Mod: Provides +2 toward [ICON_GreatPerson] Great Engineers.)' WHERE Tag='LOC_DISTRICT_BATH_EXPANSION2_DESCRIPTION' ;


-- Walls
UPDATE LocalizedText SET Text=Text || '  [ICON_CAPITAL](Quo Mod: Provides roads to every hex within 1 tile. Requires Ancient Bedrock in the city in order to be built. Ancient Bedrock is automatically established when you build an Encampment.)' WHERE Tag='LOC_BUILDING_WALLS_DESCRIPTION' AND (select Value from tblquooptions where optionId='QUO_OPTION_WALLS_HAVE_PREREQS') > 0;

UPDATE LocalizedText SET Text=Text || '  [ICON_CAPITAL](Quo Mod: Provides roads to every hex within 2 tiles. Requires Medieval Bedrock in the city in order to be built. Medieval Bedrock is automatically established if this cities acquires Ancient Walls or a World Wonder.)' WHERE Tag='LOC_BUILDING_CASTLE_DESCRIPTION' AND (select Value from tblquooptions where optionId='QUO_OPTION_WALLS_HAVE_PREREQS') > 0;

UPDATE LocalizedText SET Text=Text || '  [ICON_CAPITAL](Quo Mod: Provides roads to every hex within 3 tiles. Requires either Renaissance Bedrock in the city in order to be built. Renaissance Bedrock is automatically established if this cities acquires Medieval Walls or 5 deep water Ocean tiles.)' WHERE Tag='LOC_BUILDING_STAR_FORT_DESCRIPTION' AND (select Value from tblquooptions where optionId='QUO_OPTION_WALLS_HAVE_PREREQS') > 0;




INSERT OR REPLACE INTO LocalizedText
	(Language, Text, Tag)
VALUES('en_US', 'Ancient Bedrock', 'LOC_QUO_BUILDING_BEDROCK_ANCIENT_NAME'),
	('en_US', 'Medieval Bedrock', 'LOC_QUO_BUILDING_BEDROCK_MEDIEVAL_NAME'),
	('en_US', 'Renaissance Bedrock', 'LOC_QUO_BUILDING_BEDROCK_RENAISSANCE_NAME'),
	('en_US', 'The bedrock required to build Ancient Walls. This cannot be built outright, but is automatically established in the Capital and any city that acquires an Encampment.', 'LOC_QUO_BUILDING_BEDROCK_ANCIENT_DESCRIPTION'),
	('en_US', 'The bedrock required to build Medieval Walls. This cannot be built outright, but is automatically established in the Capital and any city that acquires Ancient Walls or a World Wonder.', 'LOC_QUO_BUILDING_BEDROCK_MEDIEVAL_DESCRIPTION'),
	('en_US', 'The bedrock required to build Renaissance Walls. This cannot be built outright, but is automatically established in the Capital and any city that acquires a Medieval Walls or 5 deep water Ocean tiles.', 'LOC_QUO_BUILDING_BEDROCK_RENAISSANCE_DESCRIPTION');

--



-- Regional Buildings
UPDATE LocalizedText SET Text=Text || '  [ICON_CAPITAL](Quo Mod: This building has x' || (SELECT tblQuoOptions.Value from tblQuoOptions WHERE tblQuoOptions.OptionId='QUO_OPTION_RADIAL_BUILDING_PRODUCTION_MULTIPLIER')|| ' its normal production yield output.)' WHERE Tag='LOC_BUILDING_FACTORY_DESCRIPTION' ;
UPDATE LocalizedText SET Text=Text || '  [ICON_CAPITAL](Quo Mod: This building has x' || (SELECT tblQuoOptions.Value from tblQuoOptions WHERE tblQuoOptions.OptionId='QUO_OPTION_RADIAL_BUILDING_PRODUCTION_MULTIPLIER')|| ' its normal production yield output.)' WHERE Tag='LOC_BUILDING_ELECTRONICS_FACTORY_DESCRIPTION' ;
UPDATE LocalizedText SET Text=Text || '  [ICON_CAPITAL](Quo Mod: This building provides 3 amenities.)' WHERE Tag='LOC_BUILDING_ZOO_DESCRIPTION' ;
UPDATE LocalizedText SET Text=Text || '  [ICON_CAPITAL](Quo Mod: This building has x' || (SELECT tblQuoOptions.Value from tblQuoOptions WHERE tblQuoOptions.OptionId='QUO_OPTION_RADIAL_BUILDING_PRODUCTION_MULTIPLIER')|| ' its normal production yield output.)' WHERE Tag='LOC_BUILDING_POWER_PLANT_DESCRIPTION' ;





-- Stonehenge
--UPDATE LocalizedText SET Text=Text || '  [ICON_CAPITAL](Quo Mod: This building now unlocks at Masonry.)' WHERE Tag='LOC_BUILDING_STONEHENGE_DESCRIPTION' ;

-- Hanging G
-- UPDATE LocalizedText SET Text=Text || '  [ICON_CAPITAL](Quo Mod: Also provides +1 [ICON_FOOD] Food to Rainforest tiles in the city in which it is built.)' WHERE Tag='LOC_BUILDING_HANGING_GARDENS_DESCRIPTION';


/* UPDATE LocalizedText SET Text=Text || '  [ICON_CAPITAL](Quo Mod: This Wonder no longer requires an adjacent district.)' WHERE Tag='LOC_BUILDING_GREAT_LIGHTHOUSE_DESCRIPTION' AND (select Value from tblquooptions where optionId='QUO_OPTION_CAN_FREE_PLACE_WONDERS') > 0;
UPDATE LocalizedText SET Text=Text || '  [ICON_CAPITAL](Quo Mod: This Wonder no longer requires an adjacent district.)' WHERE Tag='LOC_BUILDING_COLOSSUS_DESCRIPTION' AND (select Value from tblquooptions where optionId='QUO_OPTION_CAN_FREE_PLACE_WONDERS') > 0;
UPDATE LocalizedText SET Text=Text || '  [ICON_CAPITAL](Quo Mod: This Wonder no longer requires an adjacent district.)' WHERE Tag='LOC_BUILDING_COLOSSEUM_DESCRIPTION' AND (select Value from tblquooptions where optionId='QUO_OPTION_CAN_FREE_PLACE_WONDERS') > 0;
UPDATE LocalizedText SET Text=Text || '  [ICON_CAPITAL](Quo Mod: This Wonder no longer requires an adjacent district.)' WHERE Tag='LOC_BUILDING_GREAT_LIBRARY_DESCRIPTION' AND (select Value from tblquooptions where optionId='QUO_OPTION_CAN_FREE_PLACE_WONDERS') > 0;
UPDATE LocalizedText SET Text=Text || '  [ICON_CAPITAL](Quo Mod: This Wonder no longer requires an adjacent district.)' WHERE Tag='LOC_BUILDING_MAHABODHI_TEMPLE_DESCRIPTION' AND (select Value from tblquooptions where optionId='QUO_OPTION_CAN_FREE_PLACE_WONDERS') > 0;
UPDATE LocalizedText SET Text=Text || '  [ICON_CAPITAL](Quo Mod: This Wonder no longer requires an adjacent district.)' WHERE Tag='LOC_BUILDING_TERRACOTTA_ARMY_DESCRIPTION' AND (select Value from tblquooptions where optionId='QUO_OPTION_CAN_FREE_PLACE_WONDERS') > 0;
UPDATE LocalizedText SET Text=Text || '  [ICON_CAPITAL](Quo Mod: This Wonder no longer requires an adjacent district.)' WHERE Tag='LOC_BUILDING_HAGIA_SOPHIA_DESCRIPTION' AND (select Value from tblquooptions where optionId='QUO_OPTION_CAN_FREE_PLACE_WONDERS') > 0;
UPDATE LocalizedText SET Text=Text || '  [ICON_CAPITAL](Quo Mod: This Wonder no longer requires an adjacent district.)' WHERE Tag='LOC_BUILDING_ALHAMBRA_DESCRIPTION' AND (select Value from tblquooptions where optionId='QUO_OPTION_CAN_FREE_PLACE_WONDERS') > 0;
UPDATE LocalizedText SET Text=Text || '  [ICON_CAPITAL](Quo Mod: This Wonder no longer requires an adjacent district.)' WHERE Tag='LOC_BUILDING_VENETIAN_ARSENAL_DESCRIPTION' AND (select Value from tblquooptions where optionId='QUO_OPTION_CAN_FREE_PLACE_WONDERS') > 0;
UPDATE LocalizedText SET Text=Text || '  [ICON_CAPITAL](Quo Mod: This Wonder no longer requires an adjacent district.)' WHERE Tag='LOC_BUILDING_GREAT_ZIMBABWE_DESCRIPTION' AND (select Value from tblquooptions where optionId='QUO_OPTION_CAN_FREE_PLACE_WONDERS') > 0;
UPDATE LocalizedText SET Text=Text || '  [ICON_CAPITAL](Quo Mod: This Wonder no longer requires an adjacent district.)' WHERE Tag='LOC_BUILDING_FORBIDDEN_CITY_DESCRIPTION' AND (select Value from tblquooptions where optionId='QUO_OPTION_CAN_FREE_PLACE_WONDERS') > 0;
UPDATE LocalizedText SET Text=Text || '  [ICON_CAPITAL](Quo Mod: This Wonder no longer requires an adjacent district.)' WHERE Tag='LOC_BUILDING_RUHR_VALLEY_DESCRIPTION' AND (select Value from tblquooptions where optionId='QUO_OPTION_CAN_FREE_PLACE_WONDERS') > 0;
UPDATE LocalizedText SET Text=Text || '  [ICON_CAPITAL](Quo Mod: This Wonder no longer requires an adjacent district.)' WHERE Tag='LOC_BUILDING_BOLSHOI_THEATRE_DESCRIPTION' AND (select Value from tblquooptions where optionId='QUO_OPTION_CAN_FREE_PLACE_WONDERS') > 0;
UPDATE LocalizedText SET Text=Text || '  [ICON_CAPITAL](Quo Mod: This Wonder no longer requires an adjacent district.)' WHERE Tag='LOC_BUILDING_OXFORD_UNIVERSITY_DESCRIPTION' AND (select Value from tblquooptions where optionId='QUO_OPTION_CAN_FREE_PLACE_WONDERS') > 0;
UPDATE LocalizedText SET Text=Text || '  [ICON_CAPITAL](Quo Mod: This Wonder no longer requires an adjacent district.)' WHERE Tag='LOC_BUILDING_BIG_BEN_DESCRIPTION' AND (select Value from tblquooptions where optionId='QUO_OPTION_CAN_FREE_PLACE_WONDERS') > 0;
UPDATE LocalizedText SET Text=Text || '  [ICON_CAPITAL](Quo Mod: This Wonder no longer requires an adjacent district.)' WHERE Tag='LOC_BUILDING_EIFFEL_TOWER_DESCRIPTION' AND (select Value from tblquooptions where optionId='QUO_OPTION_CAN_FREE_PLACE_WONDERS') > 0;
UPDATE LocalizedText SET Text=Text || '  [ICON_CAPITAL](Quo Mod: This Wonder no longer requires an adjacent district.)' WHERE Tag='LOC_BUILDING_BROADWAY_DESCRIPTION' AND (select Value from tblquooptions where optionId='QUO_OPTION_CAN_FREE_PLACE_WONDERS') > 0;
UPDATE LocalizedText SET Text=Text || '  [ICON_CAPITAL](Quo Mod: This Wonder no longer requires an adjacent district.)' WHERE Tag='LOC_BUILDING_ESTADIO_DO_MARACANA_DESCRIPTION' AND (select Value from tblquooptions where optionId='QUO_OPTION_CAN_FREE_PLACE_WONDERS') > 0;
UPDATE LocalizedText SET Text=Text || '  [ICON_CAPITAL](Quo Mod: This Wonder no longer requires an adjacent district.)' WHERE Tag='LOC_BUILDING_SYDNEY_OPERA_HOUSE_DESCRIPTION' AND (select Value from tblquooptions where optionId='QUO_OPTION_CAN_FREE_PLACE_WONDERS') > 0;
 */
-- wonder era names
UPDATE LocalizedText SET Text= Text || ' (Ancient)' WHERE Tag='LOC_BUILDING_HANGING_GARDENS_NAME' ;
UPDATE LocalizedText SET Text= Text || ' (Ancient)' WHERE Tag='LOC_BUILDING_ORACLE_NAME' ;
UPDATE LocalizedText SET Text= Text || ' (Ancient)' WHERE Tag='LOC_BUILDING_PYRAMIDS_NAME' ;
UPDATE LocalizedText SET Text= Text || ' (Ancient)' WHERE Tag='LOC_BUILDING_STONEHENGE_NAME' ;
UPDATE LocalizedText SET Text= Text || ' (Atomic)' WHERE Tag='LOC_BUILDING_ESTADIO_DO_MARACANA_NAME' ;
UPDATE LocalizedText SET Text= Text || ' (Atomic)' WHERE Tag='LOC_BUILDING_SYDNEY_OPERA_HOUSE_NAME' ;
UPDATE LocalizedText SET Text= Text || ' (Classical)' WHERE Tag='LOC_BUILDING_COLOSSEUM_NAME' ;
UPDATE LocalizedText SET Text= Text || ' (Classical)' WHERE Tag='LOC_BUILDING_COLOSSUS_NAME' ;
UPDATE LocalizedText SET Text= Text || ' (Classical)' WHERE Tag='LOC_BUILDING_GREAT_LIBRARY_NAME' ;
UPDATE LocalizedText SET Text= Text || ' (Classical)' WHERE Tag='LOC_BUILDING_GREAT_LIGHTHOUSE_NAME' ;
UPDATE LocalizedText SET Text= Text || ' (Classical)' WHERE Tag='LOC_BUILDING_MAHABODHI_TEMPLE_NAME' ;
UPDATE LocalizedText SET Text= Text || ' (Classical)' WHERE Tag='LOC_BUILDING_PETRA_NAME' ;
UPDATE LocalizedText SET Text= Text || ' (Classical)' WHERE Tag='LOC_BUILDING_TERRACOTTA_ARMY_NAME' ;
UPDATE LocalizedText SET Text= Text || ' (Industrial)' WHERE Tag='LOC_BUILDING_BIG_BEN_NAME' ;
UPDATE LocalizedText SET Text= Text || ' (Industrial)' WHERE Tag='LOC_BUILDING_BOLSHOI_THEATRE_NAME' ;
UPDATE LocalizedText SET Text= Text || ' (Industrial)' WHERE Tag='LOC_BUILDING_HERMITAGE_NAME' ;
UPDATE LocalizedText SET Text= Text || ' (Industrial)' WHERE Tag='LOC_BUILDING_OXFORD_UNIVERSITY_NAME' ;
UPDATE LocalizedText SET Text= Text || ' (Industrial)' WHERE Tag='LOC_BUILDING_RUHR_VALLEY_NAME' ;
UPDATE LocalizedText SET Text= Text || ' (Medieval)' WHERE Tag='LOC_BUILDING_ALHAMBRA_NAME' ;
UPDATE LocalizedText SET Text= Text || ' (Medieval)' WHERE Tag='LOC_BUILDING_CHICHEN_ITZA_NAME' ;
UPDATE LocalizedText SET Text= Text || ' (Medieval)' WHERE Tag='LOC_BUILDING_HAGIA_SOPHIA_NAME' ;
UPDATE LocalizedText SET Text= Text || ' (Medieval)' WHERE Tag='LOC_BUILDING_HUEY_TEOCALLI_NAME' ;
UPDATE LocalizedText SET Text= Text || ' (Medieval)' WHERE Tag='LOC_BUILDING_MONT_ST_MICHEL_NAME' ;
UPDATE LocalizedText SET Text= Text || ' (Modern)' WHERE Tag='LOC_BUILDING_BROADWAY_NAME' ;
UPDATE LocalizedText SET Text= Text || ' (Modern)' WHERE Tag='LOC_BUILDING_CRISTO_REDENTOR_NAME' ;
UPDATE LocalizedText SET Text= Text || ' (Modern)' WHERE Tag='LOC_BUILDING_EIFFEL_TOWER_NAME' ;
UPDATE LocalizedText SET Text= Text || ' (Renaissance)' WHERE Tag='LOC_BUILDING_FORBIDDEN_CITY_NAME' ;
UPDATE LocalizedText SET Text= Text || ' (Renaissance)' WHERE Tag='LOC_BUILDING_GREAT_ZIMBABWE_NAME' ;
UPDATE LocalizedText SET Text= Text || ' (Renaissance)' WHERE Tag='LOC_BUILDING_POTALA_PALACE_NAME' ;
UPDATE LocalizedText SET Text= Text || ' (Renaissance)' WHERE Tag='LOC_BUILDING_VENETIAN_ARSENAL_NAME' ;

-- dlc

UPDATE LocalizedText SET Text= Text || ' (Ancient)' WHERE Tag='LOC_BUILDING_BASILIKOI_PAIDES_DESCRIPTION' ;
UPDATE LocalizedText SET Text= Text || ' (Classical)' WHERE Tag='LOC_BUILDING_APADANA_DESCRIPTION' ;
UPDATE LocalizedText SET Text= Text || ' (Medieval)' WHERE Tag='LOC_BUILDING_HALICARNASSUS_MAUSOLEUM_DESCRIPTION' ;



-- Beliefs

/* UPDATE LocalizedText SET Text='[ICON_CAPITAL](Quo Mod: +1[ICON_PRODUCTION] Production from Fishing Boats. +20%[ICON_PRODUCTION] Production toward Harbors.)' WHERE Tag='LOC_BELIEF_GOD_OF_THE_SEA_DESCRIPTION' ;

UPDATE LocalizedText SET Text='[ICON_CAPITAL](Quo Mod: +1[ICON_CULTURE] Culture from Pastures. Siege units receive +25% experience.)' WHERE Tag='LOC_BELIEF_GOD_OF_THE_OPEN_SKY_DESCRIPTION' ;

UPDATE LocalizedText SET Text='[ICON_CAPITAL](Quo Mod: +1[ICON_CULTURE] Culture from all Plantations and immediately obtain 3 extra tiles when you found a city.)' WHERE Tag='LOC_BELIEF_ORAL_TRADITION_DESCRIPTION' ;

UPDATE LocalizedText SET Text='[ICON_CAPITAL](Quo Mod: +1[ICON_FOOD] Food from all Plantations. +40%[ICON_PRODUCTION] Production towards Entertainment Districts.)' WHERE Tag='LOC_BELIEF_GODDESS_OF_FESTIVALS_DESCRIPTION' ;

UPDATE LocalizedText SET Text='[ICON_CAPITAL](Quo Mod: +2[ICON_PRODUCTION] from Mines over Strategic Resources. Reveals Iron and Niter on the map.)' WHERE Tag='LOC_BELIEF_GOD_OF_CRAFTSMEN_DESCRIPTION' ;

UPDATE LocalizedText SET Text='[ICON_CAPITAL](Quo Mod: +1[ICON_FOOD] Food from camps and +25% Experience for Ranged units of any era.)' WHERE Tag='LOC_BELIEF_GODDESS_OF_THE_HUNT_DESCRIPTION' ;

UPDATE LocalizedText SET Text='[ICON_CAPITAL](Quo Mod: +2[ICON_Faith] Faith from Quarries. Receive Ancient Bedrock in all cities without requiring an Encampment.)' WHERE Tag='LOC_BELIEF_STONE_CIRCLES_DESCRIPTION' ;

UPDATE LocalizedText SET Text='[ICON_CAPITAL](Quo Mod: Border expansion rate is 150% higher. +1[ICON_TRADEROUTE] max Trade Route capacity.)' WHERE Tag='LOC_BELIEF_RELIGIOUS_SETTLEMENTS_DESCRIPTION' ;

UPDATE LocalizedText SET Text='[ICON_CAPITAL](Quo Mod: +15%[ICON_PRODUCTION] Production toward Ancient and Classical Wonders, and immediately receive a free relic.)' WHERE Tag='LOC_BELIEF_MONUMENT_TO_THE_GODS_DESCRIPTION' ;

UPDATE LocalizedText SET Text='[ICON_CAPITAL](Quo Mod: +1[ICON_AMENITIES] Amenity to Holy Sites on rivers. Minor adjacency bonus for Holy Sites on rivers.)' WHERE Tag='LOC_BELIEF_RIVER_GODDESS_DESCRIPTION' ;

UPDATE LocalizedText SET Text='[ICON_CAPITAL](Quo Mod: +1[ICON_FAITH] from Mines over Luxury and Bonus resources. Immediately receive 400[ICON_GOLD] Gold, adjusted for game speed.)' WHERE Tag='LOC_BELIEF_RELIGIOUS_IDOLS_DESCRIPTION' ;

UPDATE LocalizedText SET Text='[ICON_CAPITAL](Quo Mod: City growth rate of all cities is +10% higher. +2[ICON_FOOD] Food in the capital.)' WHERE Tag='LOC_BELIEF_FERTILITY_RITES_DESCRIPTION' ;

UPDATE LocalizedText SET Text='[ICON_CAPITAL](Quo Mod: +1[ICON_PRODUCTION] Production from Oases, Marshes, Rice, Wheat, and Desert Flood Plains.)' WHERE Tag='LOC_BELIEF_LADY_OF_THE_REEDS_AND_MARSHES_EXPANSION2_DESCRIPTION' ;

UPDATE LocalizedText SET Text='[ICON_CAPITAL](Quo Mod: +1[ICON_FAITH] Faith on tiles with Breathtaking appeal.)' WHERE Tag='LOC_BELIEF_EARTH_GODDESS_DESCRIPTION' ;

UPDATE LocalizedText SET Text='[ICON_CAPITAL](Quo Mod: Holy Site districts get +1[ICON_FAITH] Faith from adjacent Forest and Rainforest.)' WHERE Tag='LOC_BELIEF_SACRED_PATH_DESCRIPTION' ;

UPDATE LocalizedText SET Text='[ICON_CAPITAL](Quo Mod: +25% [ICON_PRODUCTION] Production towards Ancient and Classical military units. +1[ICON_CULTURE] Culture on tiles adjacent to Volcanoes.)' WHERE Tag='LOC_BELIEF_GOD_OF_THE_FORGE_DESCRIPTION' ; */




-- religion
--UPDATE LocalizedText SET Text= Text || '[ICON_CAPITAL](Quo Mod: +2[ICON_FAITH] Faith from Lake tiles.)' WHERE Tag='LOC_BELIEF_RELIGIOUS_COMMUNITY_DESCRIPTION' ;



-- Governments
-- This text was moved to the New file, and the original government text overwritten, to differentiate between Policy cards and Governments
/* UPDATE LocalizedText SET Text='+1 to all Yields per govt building. +1[ICON_FAITH] to each tile adjacent to a Wonder.' WHERE Tag='LOC_GOVT_INHERENT_BONUS_AUTOCRACY_XP1' ;
UPDATE LocalizedText SET Text='Cities with a district receive +1[ICON_AMENITIES] +1[ICON_HOUSING]. Settlers have +3[ICON_MOVEMENT]Moves and Stealth.' WHERE Tag='LOC_GOVT_INHERENT_BONUS_CLASSREP_XP1' ;
UPDATE LocalizedText SET Text='+4[ICON_STRENGTH] for melee, anti-cavalary, melee ships. Land units have +1[ICON_MOVEMENT] in unclaimed hexes.' WHERE Tag='LOC_GOVT_INHERENT_BONUS_OLIGARCHY_XP1' ;


UPDATE LocalizedText SET Text='Religious units +5[ICON_STRENGTH]. +0.5[ICON_FAITH]/citizen from governors. +2[ICON_FAITH]+2[ICON_CULTURE]+1[ICON_PRODUCTION] from Temples.' WHERE Tag='LOC_GOVT_INHERENT_BONUS_THEOCRACY_XP1' ;
UPDATE LocalizedText SET Text='+1[ICON_HOUSING] Housing per level of walls. +1[ICON_CULTURE] to Farms 2 tiles from an Encampment.' WHERE Tag='LOC_GOVT_INHERENT_BONUS_MONARCHY_XP1' ;
UPDATE LocalizedText SET Text='+10%[ICON_GOLD] in cities with governors. +6[ICON_GOLD]Gold +3[ICON_CULTURE]Culture from Oases.' WHERE Tag='LOC_GOVT_INHERENT_BONUS_MERCHREP_XP1' ;


UPDATE LocalizedText SET Text='+7[ICON_STRENGTH]for all units. Ranged and Anti-Cavalry units have +2[ICON_RANGE]Range.' WHERE Tag='LOC_GOVT_INHERENT_BONUS_FASCISM_XP1' ;
UPDATE LocalizedText SET Text='Governors provide +0.4%[ICON_PRODUCTION] per citizen. Cities gain Urban Defenses.' WHERE Tag='LOC_GOVT_INHERENT_BONUS_COMMUNISM_XP1' ;
UPDATE LocalizedText SET Text='+2[ICON_PRODUCTION], +1[ICON_HOUSING] per district. All districts culture bomb.' WHERE Tag='LOC_GOVT_INHERENT_BONUS_DEMOCRACY_XP1' ;
 */

 
-- Governors
UPDATE LocalizedText SET Text= Text || '[ICON_CAPITAL](Quo Mod: This governor exerts double normal loyalty pressure.)' WHERE Tag='LOC_GOVERNOR_PROMOTION_REDOUBT_DESCRIPTION' ;

UPDATE LocalizedText SET Text= '[ICON_CAPITAL](Quo Mod: +30% yields from plot harvests and feature removals in this city.)' WHERE Tag='LOC_GOVERNOR_PROMOTION_RESOURCE_MANAGER_GROUNDBREAKER_DESCRIPTION' ;
 
UPDATE LocalizedText SET Text= '[ICON_CAPITAL](Quo Mod: +0.75 [ICON_CULTURE] Culture per turn per citizen in this city.)' WHERE Tag='LOC_GOVERNOR_PROMOTION_EDUCATOR_CONNOISSEUR_DESCRIPTION' ;
UPDATE LocalizedText SET Text= '[ICON_CAPITAL](Quo Mod: +0.75 [ICON_SCIENCE] Science per turn per citizen in this city.)' WHERE Tag='LOC_GOVERNOR_PROMOTION_EDUCATOR_RESEARCHER_DESCRIPTION' ;

  

-- ================ COMPLEX DATABASE READBACKS

-- MyOptions read back
CREATE TABLE quo_T
(
	txt text
);

INSERT INTO quo_T 
		(txt)
VALUES ('This screen confirms your current Quos Combined Tweaks MyOptions settings. To update these settings for future games, go to the mod folder and update the MyOptions.sql file. Be careful not to change MyOption settings mid-game or between saves.');


-- Use a group_concat to scoop up values for each MyOption setting

-- Quo Settings
UPDATE quo_T SET txt = txt || '[NEWLINE][NEWLINE[NEWLINE]Main Settings:' ;

UPDATE quo_T
SET txt = txt || 
	(SELECT group_concat(rez,' ')
		FROM
			(SELECT '[NEWLINE][ICON_BOLT]' || substr(tblQuoOptions.OptionID,12) || ': ' ||tblQuoOptions.Value
			AS rez 
			FROM tblQuoOptions
			WHERE tblQuoOptions.OptionClass ='QUO'
			) );

-- Xav Settings
UPDATE quo_T SET txt = txt || '[NEWLINE][NEWLINE]Improvements Patch Settings:' ;

UPDATE quo_T
SET txt = txt || 
	(SELECT group_concat(rez,' ')
		FROM
			(SELECT '[NEWLINE][ICON_BOLT]' || substr(tblQuoOptions.OptionID,12) || ': ' ||tblQuoOptions.Value
			AS rez 
			FROM tblQuoOptions
			WHERE tblQuoOptions.OptionClass ='XAV'
			) );
			
UPDATE quo_T SET txt = txt || '[NEWLINE][NEWLINE]Hell Mode Settings:' ;

UPDATE quo_T
SET txt = txt || 
	(SELECT group_concat(rez,' ')
		FROM
			(SELECT '[NEWLINE][ICON_BOLT]' || substr(tblQuoOptions.OptionID,12) || ': ' ||tblQuoOptions.Value
			AS rez 
			FROM tblQuoOptions
			WHERE tblQuoOptions.OptionClass ='HELL'
			) );	
			

INSERT INTO LocalizedText
		(Tag, Text, Language)
SELECT 	'LOC_QUO_MYOPTIONS_CONFIRM', quo_T.txt, 'en_US'
FROM quo_T ;




-- DEBUG
UPDATE tblQuoDebug SET x_Close='1' WHERE DebugID='Quo_Main_Text';

