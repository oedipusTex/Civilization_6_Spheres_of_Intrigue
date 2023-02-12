/*
    Created by Quo
*/
 



INSERT INTO tblQuoDebug 
	(DebugID, 		x_Open, x_Close, 	Message)
VALUES ('Quo_Civ_Text',	'1',	'0',		'') ;



-- Germany

UPDATE LocalizedText SET Text= Text || '  [ICON_CAPITAL] (Quo Mod: Cities receive +1 [ICON_PRODUCTION] Production for every district, starting with the third district built. +2[ICON_MOVEMENT]Moves for Heavy Cavalry when the world reaches the Modern era.)' WHERE Tag='LOC_TRAIT_CIVILIZATION_IMPERIAL_FREE_CITIES_DESCRIPTION' ;

--UPDATE LocalizedText SET Text= Text || '  [ICON_CAPITAL] (Quo Mod: When you capture a city, receive a [ICON_GOLD]Gold payout equal to 3 times your current [ICON_GOLD]Gold per turn.)' WHERE Tag='LOC_TRAIT_LEADER_HOLY_ROMAN_EMPEROR_DESCRIPTION' ;



-- England
--UPDATE LocalizedText SET Text= Text || '[ICON_CAPITAL] (Quo Mod: Provides +1[ICON_TradeRoute] Trade Route when constructed on a continent other than your starting continent.)' WHERE Tag='LOC_DISTRICT_ROYAL_NAVY_DOCKYARD_EXPANSION1_DESCRIPTION' ;

--UPDATE LocalizedText SET Text= '[ICON_CAPITAL] (Quo Mod: Naval units receive a free promotion. Receive a free melee unit when you settle a city on the coast or anywhere on another continent.)' WHERE Tag='LOC_TRAIT_CIVILIZATION_PAX_BRITANNICA_EXPANSION2_DESCRIPTION' ;

UPDATE LocalizedText SET Text= Text || '  [ICON_CAPITAL] (Quo Mod: Unlocks at Naval Tradition.)' WHERE Tag='LOC_UNIT_ENGLISH_SEADOG_DESCRIPTION' ;




-- Russia
UPDATE LocalizedText SET Text= Text || '  [ICON_CAPITAL] (Quo Mod: Receive 10% less [ICON_SCIENCE] and [ICON_CULTURE] boosts from Eurekas. Receive 1 extra [ICON_TradeRoute] Trade Route slot per Industrial Zone in Tundra.)' WHERE Tag='LOC_TRAIT_LEADER_GRAND_EMBASSY_DESCRIPTION' ;

UPDATE LocalizedText SET Text= Text || '[ICON_CAPITAL] (Quo Mod: Receive +1 [ICON_PRODUCTION] Production per Tundra Hill adjacent to your Industrial Zones.)' WHERE Tag='LOC_TRAIT_CIVILIZATION_MOTHER_RUSSIA_EXPANSION2_DESCRIPTION' ;



-- Japan

UPDATE LocalizedText SET Text= Text || '  [ICON_CAPITAL] (Quo Mod: This building is half normal cost.)' WHERE Tag='LOC_BUILDING_ELECTRONICS_FACTORY_EXPANSION2_DESCRIPTION' ;

UPDATE LocalizedText SET Text=  '[ICON_CAPITAL] (Quo Mod: +5[ICON_STRENGTH] Strength for naval units adjacent to land. +100%[ICON_PRODUCTION] Production toward Encampments, Holy Sites, and Theater Squares. Units take no damage from Hurricanes. Civilizations at war with Japan receive double damage from Hurricanes when within Japanese borders.)' WHERE Tag='LOC_TRAIT_LEADER_DIVINE_WIND_EXPANSION2_DESCRIPTION' ;

--UPDATE LocalizedText SET Text= Text || '  [ICON_CAPITAL] (Quo Mod: Samurais cannot be seen unless adjacent to an enemy unit.)' WHERE Tag='LOC_UNIT_JAPANESE_SAMURAI_DESCRIPTION' ;

--UPDATE LocalizedText SET Text= Text || '  [ICON_CAPITAL] (Quo Mod: Builders can construct the Fishery improvement in all cities.)' WHERE Tag='LOC_TRAIT_CIVILIZATION_ADJACENT_DISTRICTS_DESCRIPTION' ;




-- Arabia
--UPDATE LocalizedText SET Text= ' [ICON_CAPITAL] (Quo Mod: Automatically receive the last available Great Prophet. +1[ICON_SCIENCE]Science +3[ICON_GOLD]Gold per foreign city following your religion.)' WHERE Tag='LOC_TRAIT_CIVILIZATION_LAST_PROPHET_DESCRIPTION' ;

--UPDATE LocalizedText SET Text= Text || '  [ICON_CAPITAL] (Quo Mod: Cannot build Commercial Hubs. Receive [ICON_TRADEROUTE] Trade Routes from Libraries and Shrines instead of Markets and Lighthouses. +5 [ICON_GOLD] Gold in cities with both a Campus and a Holy Site.)' WHERE Tag='LOC_TRAIT_LEADER_RIGHTEOUSNESS_OF_FAITH_DESCRIPTION' ;

--UPDATE LocalizedText SET Text= Text || '  [ICON_CAPITAL] (Quo Mod: This building is half normal cost.)' WHERE Tag='LOC_BUILDING_MADRASA_DESCRIPTION' ;



-- Sumeria
UPDATE LocalizedText SET Text= '[ICON_CAPITAL] (Quo Mod: +2[ICON_SCIENCE] Science +1[ICON_CULTURE] Culture. +2[ICON_PRODUCTION] Production to adjacent Industrial Zones. +1[ICON_SCIENCE]Science to adjacent tiles without rivers. Must be built on flat land next to a River. Only one Ziggurat can be built per city.)' WHERE Tag='LOC_IMPROVEMENT_ZIGGURAT_DESCRIPTION' ;

UPDATE LocalizedText SET Text= Text || '  [ICON_CAPITAL] (Quo Mod: +10 [ICON_STRENGTH] combat strength when fighting Barbarians.)' WHERE Tag='LOC_TRAIT_CIVILIZATION_FIRST_CIVILIZATION_DESCRIPTION' ;

UPDATE LocalizedText SET Text= Text || '  [ICON_CAPITAL] (Quo Mod: Requires Foreign Trade civic to build.)' WHERE Tag='LOC_UNIT_SUMERIAN_WAR_CART_DESCRIPTION' ;

UPDATE LocalizedText SET Text= Text || '  [ICON_CAPITAL] (Quo Mod: Receive 20[ICON_CULTURE] Culture upon founding the capital, adjusted for game speed.)' WHERE Tag='LOC_TRAIT_LEADER_ADVENTURES_ENKIDU_EXPANSION1_DESCRIPTION' ;



-- China
UPDATE LocalizedText SET Text= Text || '  [ICON_CAPITAL] (Quo Mod: Receive +1 to the respective [ICON_FAITH][ICON_PRODUCTION][ICON_CULTURE][ICON_GOLD][ICON_SCIENCE] yield of any district for every two edges bordered by the Great Wall.)' WHERE Tag='LOC_IMPROVEMENT_GREAT_WALL_DESCRIPTION' ;

UPDATE LocalizedText SET Text= '  [ICON_CAPITAL] (Quo Mod: [ICON_TechBoosted]Technology and [ICON_CivicBoosted]Civic boosts are 10% stronger. Receive Ancient Bedrock in cities within 4 tiles of a length of Great Wall, establishing the pre-req for Ancient Walls without requiring an Encampment.)' WHERE Tag='LOC_TRAIT_CIVILIZATION_DYNASTIC_CYCLE_EXPANSION2_DESCRIPTION' ;


-- Greece
UPDATE LocalizedText SET Text= Text || '  [ICON_CAPITAL] (Quo Mod: The Hoplite now recieves +10 [ICON_STRENGTH] combat bonus against Infantry units, counteracting its weakness.)' WHERE Tag='LOC_UNIT_GREEK_HOPLITE_DESCRIPTION' ;

UPDATE LocalizedText SET Text= Text || '  [ICON_CAPITAL] (Quo Mod: +20% [ICON_PRODUCTION]Production toward Districts when at peace with all major civs.)' WHERE Tag='LOC_TRAIT_LEADER_SURROUNDED_BY_GLORY_DESCRIPTION' ;

UPDATE LocalizedText SET Text= Text || '  [ICON_CAPITAL] (Quo Mod: +10% [ICON_CULTURE]Culture, and +5%[ICON_FOOD]Food, [ICON_PRODUCTION]Production, [ICON_GOLD]Gold, [ICON_SCIENCE]Science, and [ICON_FAITH]Faith if you have declared a Surprise War in the past 50 turns. Anti-Cavalry have +1[ICON_RANGE]Range.)' WHERE Tag='LOC_TRAIT_LEADER_THERMOPYLAE_DESCRIPTION' ;

UPDATE LocalizedText SET Text= Text || '  [ICON_CAPITAL] (Quo Mod: Players who befriend Greece receive +2 points per turn toward diplomatic tokens.)' WHERE Tag='TRAIT_CIVILIZATION_PLATOS_REPUBLIC_DESCRIPTION' ;

-- UPDATE LocalizedText SET Text= Text || '  [ICON_CAPITAL] (Quo Mod: Receive a free diplomatic token when you complete an Acropolis.)' WHERE Tag='LOC_DISTRICT_ACROPOLIS_DESCRIPTION' ;



-- Rome
-- UPDATE LocalizedText SET Text= Text || '  [ICON_CAPITAL] (Quo Mod: 45 base [ICON_STRENGTH] Strength and +10 [ICON_STRENGTH] Strength when fighting Infantry units.)' WHERE Tag='LOC_UNIT_ROMAN_LEGION_DESCRIPTION' ;

-- Note the Bath is accounted for in the general district text edits




-- Norway
--UPDATE LocalizedText SET Text= '[ICON_CAPITAL] (Quo Mod: The Stave Church is a Temple that is built in the City Center, without requiring a Holy District. The prereq building is a Monument. Allows purchase of Apostles if you founded a religion. +1[ICON_PRODUCTION] to each coastal resource in this city.)' WHERE Tag='LOC_BUILDING_STAVE_CHURCH_DESCRIPTION' ;

--UPDATE LocalizedText SET Text= Text || '  [ICON_CAPITAL] (Quo Mod: This building is half normal cost.)' WHERE Tag='LOC_BUILDING_STAVE_CHURCH_DESCRIPTION' ;

UPDATE LocalizedText SET Text= Text || '  [ICON_CAPITAL] (Quo Mod: Receive a free naval melee unit when you settle a city on the coast.)' WHERE Tag='LOC_TRAIT_LEADER_THUNDERBOLT_DESCRIPTION' ;

UPDATE LocalizedText SET Text= Text || '  [ICON_CAPITAL] (Quo Mod: Has no tech prereqs.)' WHERE Tag='LOC_UNIT_NORWEGIAN_LONGSHIP_DESCRIPTION' ;

UPDATE LocalizedText SET Text= Text || '  [ICON_CAPITAL] (Quo Mod: This unit can move and attack on the same turn.)' WHERE Tag='LOC_UNIT_NORWEGIAN_BERSERKER_DESCRIPTION' ;



-- America
--UPDATE LocalizedText SET Text= Text || '  [ICON_CAPITAL] (Quo Mod: Tiles cost 20% less to purchase with Gold.)' WHERE Tag='LOC_TRAIT_CIVILIZATION_FOUNDING_FATHERS_EXPANSION1_DESCRIPTION' ;

UPDATE LocalizedText SET Text= Text || '  [ICON_CAPITAL] (Quo Mod: In cities with a Film Studio, Builders can construct most improvements available to pre-expansion civs.)' WHERE Tag='LOC_BUILDING_FILM_STUDIO_DESCRIPTION' ;



-- Egypt
UPDATE LocalizedText SET Text= Text || '  [ICON_CAPITAL] (Quo Mod: +5 [ICON_STRENGTH] within your borders. Can attack and move on the same turn.)' WHERE Tag='LOC_UNIT_EGYPTIAN_CHARIOT_ARCHER_DESCRIPTION' ;

UPDATE LocalizedText SET Text= Text || '  [ICON_CAPITAL] (Quo Mod: At Medieval Faires, unlock +4[ICON_GreatWork_Relic] relic slots in the Capital. At Humanism, unlock 1 free [ICON_GreatWork_Relic] relic per city with an Ancient or Classical wonder.)' WHERE Tag='LOC_TRAIT_LEADER_MEDITERRANEAN_EXPANSION2_DESCRIPTION' ;

UPDATE LocalizedText SET Text= '[ICON_CAPITAL] (Quo Mod: Cities with a wonder of any era receive +20% [ICON_PRODUCTION] toward districts and wonders. Your cities are immune to the negative effects of floods.)' WHERE Tag='LOC_TRAIT_CIVILIZATION_ITERU_EXPANSION2_DESCRIPTION' ;

--UPDATE LocalizedText SET Text= Text || '  [ICON_CAPITAL] (Quo Mod: +1[ICON_FAITH]Faith +1[ICON_CULTURE]Culture to adjacent Desert tiles without floodplains.)' WHERE Tag='LOC_IMPROVEMENT_SPHINX_DESCRIPTION' ; 



-- Spain
UPDATE LocalizedText SET Text= Text || '[ICON_CAPITAL] (Quo Mod: +4[ICON_GREATPERSON]Points toward Great Prophets for each kill.)' WHERE Tag='LOC_TRAIT_LEADER_EL_ESCORIAL_EXPANSION2_DESCRIPTION' ;

--UPDATE LocalizedText SET Text= Text || '  [ICON_CAPITAL] (Quo Mod: The Mission no longer destroys Forest or Rainforest.)' WHERE Tag='LOC_IMPROVEMENT_MISSION_DESCRIPTION' ;

UPDATE LocalizedText SET Text= Text || '  [ICON_CAPITAL] (Quo Mod: Natural Wonders provide +7[ICON_GOLD]Gold adjacency bonus to Commercial Hubs.)' WHERE Tag='LOC_TRAIT_CIVILIZATION_TREASURE_FLEET_EXPANSION2_DESCRIPTION' ;


-- France
UPDATE LocalizedText SET Text= Text || '  [ICON_CAPITAL] (Quo Mod: +1 [ICON_HOUSING] Housing. Culture Bombs adjacent tiles.)' WHERE Tag='LOC_IMPROVEMENT_CHATEAU_DESCRIPTION' ;

--UPDATE LocalizedText SET Text= Text || '  [ICON_CAPITAL] (Quo Mod: Receive Renaissance Bedrock in cities within 3 tiles of a Chateau, allowing the construction of Renaissance Walls without meeting other prereqs.)' WHERE Tag='LOC_TRAIT_CIVILIZATION_WONDER_TOURISM_DESCRIPTION' ;

UPDATE LocalizedText SET Text= '[ICON_CAPITAL] (Quo Mod: +1 Diplomatic Visibility. Gain permanent visibility of other Civs capitals the turn after they discover Castles. Free Spy at Castles. New Spies gain a free promotion.)' WHERE Tag='LOC_TRAIT_LEADER_FLYING_SQUADRON_DESCRIPTION' ;

-- UPDATE LocalizedText SET Text= Text || '  [ICON_CAPITAL] (Quo Mod: Catherines extra spy is available at Astrology instead of Castles.)' WHERE Tag='LOC_TECH_CASTLES_DESCRIPTION' ;

-- UPDATE LocalizedText SET Text= Text || '  [ICON_CAPITAL] (Quo Mod: Players who befriend France can build Chateaus.)' WHERE Tag='TRAIT_CIVILIZATION_WONDER_TOURISM_DESCRIPTION' ;



-- Brazil

UPDATE LocalizedText SET Text= Text || '  [ICON_CAPITAL] (Quo Mod: Immediately gain 1 free Population in this city. Cities owned by other civilizations lose -3 Loyalty per turn if within 6 tiles of a Street Carnival or Copacabana.)' WHERE Tag='LOC_DISTRICT_STREET_CARNIVAL_EXPANSION2_DESCRIPTION' ;
UPDATE LocalizedText SET Text= Text || '  [ICON_CAPITAL] (Quo Mod: Immediately gain 1 free Population in this city. Cities owned by other civilizations lose -3 Loyalty per turn if within 6 tiles of a Street Carnival or Copacabana.)' WHERE Tag='LOC_DISTRICT_WATER_STREET_CARNIVAL_EXPANSION2_DESCRIPTION' ;

UPDATE LocalizedText SET Text= Text || '  [ICON_CAPITAL] (Quo Mod: +2 Appeal from Rainforests. Can build the Brazilian Revolution project, which provides a huge one-time burst of [ICON_GREATPErson] Great People and unlocks the Brazilwood Camp improvement. Brazilwood Camps provide [ICON_CULTURE]Culture for each level of tile Appeal, and Tourism after Flight is discovered.)' WHERE Tag='LOC_TRAIT_CIVILIZATION_AMAZON_DESCRIPTION' ;




-- Scythia
--UPDATE LocalizedText SET Text='  [ICON_CAPITAL] (Quo Mod: Units receive +5 [ICON_STRENGTH] Strength when fighting wounded units. +25 HP when they score a kill.)' WHERE Tag='LOC_TRAIT_LEADER_KILLER_OF_CYRUS_DESCRIPTION' ;

--UPDATE LocalizedText SET Text= '[ICON_CAPITAL] (Quo Mod: Can only be built on the Mysterium resource. Provides +1[ICON_HOUSING]Housing, +1[ICON_AMENITIES]Amenity, and [ICON_FAITH]Faith based on Appeal for the city that controls this tile. +2[ICON_PRODUCTION]Production to adjacent Encampments.)' WHERE Tag='LOC_IMPROVEMENT_KURGAN_DESCRIPTION' ;


--UPDATE LocalizedText SET Text= Text || '  [ICON_CAPITAL] (Quo Mod: Can see the sacred "Mysterium" bonus resource on the map, which has unique value known only to a few ancient civilizations. )' WHERE Tag='LOC_TRAIT_CIVILIZATION_EXTRA_LIGHT_CAVALRY_DESCRIPTION' ;






-- India

--UPDATE LocalizedText SET Text= Text || '  [ICON_CAPITAL] (Quo Mod: Receive 30[ICON_FAITH] Faith upon founding the capital, adjusted for game speed.)' WHERE Tag='LOC_TRAIT_CIVILIZATION_DHARMA_DESCRIPTION' ;

--UPDATE LocalizedText SET Text= Text || '  [ICON_CAPITAL] (Quo Mod: Cities adjacent to at least 1 Stepwell have the [ICON_HOUSING] Housing bonus of coastal water.)' WHERE Tag='LOC_IMPROVEMENT_STEPWELL_DESCRIPTION' ;


--UPDATE LocalizedText SET Text= Text || '  [ICON_CAPITAL] (Quo Mod: Receive a free Settler on completing a Holy Site in the Capital, and a free Builder for each Holy Site other than in the Capital.)' WHERE Tag='LOC_TRAIT_LEADER_SATYAGRAHA_DESCRIPTION' ;



--xp2
UPDATE LocalizedText SET Text= Text || '  [ICON_CAPITAL] (Quo Mod: +1[ICON_FOOD]Food from any improvement on Tundra or Tundra Hills.)' WHERE Tag='LOC_TRAIT_LEADER_LAST_BEST_WEST_DESCRIPTION' ;


--dlc


-- AZTEC
UPDATE LocalizedText SET Text= '[ICON_CAPITAL] (Quo Mod: At Civil Service, can construct the Templo Mayor National Wonder, which creates a zone with a 15 hex radius that spreads -6 disloyalty per to turn to cities belonging to other empires, and grants [ICON_FAITH]Faith per kill to combats won inside the zone.)' WHERE Tag='LOC_TRAIT_CIVILIZATION_LEGEND_FIVE_SUNS_DESCRIPTION' ;


UPDATE LocalizedText SET Text= Text || '  [ICON_CAPITAL] (Quo Mod: Serves as a Wall, providing defense and allowing the City Center to perform an attack even if actual Walls are not present.)' WHERE Tag='LOC_BUILDING_TLACHTLI_DESCRIPTION' ;



-- Poland
UPDATE LocalizedText SET Text= Text || '  [ICON_CAPITAL] (Quo Mod: Anti-Cavalry have +1[ICON_MOVEMENT]Moves.)' WHERE Tag='LOC_TRAIT_CIVILIZATION_GOLDEN_LIBERTY_DESCRIPTION' ;

UPDATE LocalizedText SET Text= Text || '  [ICON_CAPITAL] (Quo Mod: May spend [ICON_FAITH]Faith to purchase buildings for Commercial Hubs.)' WHERE Tag='LOC_TRAIT_LEADER_LITHUANIAN_UNION_DESCRIPTION' ;


-- Khmer
UPDATE LocalizedText SET Text= Text || '[ICON_CAPITAL](Quo Mod: +100%[ICON_PRODUCTION] Production towards Aqueducts.)' WHERE Tag='LOC_TRAIT_CIVILIZATION_KHMER_BARAYS_DESCRIPTION' ;

UPDATE LocalizedText SET Text= Text || '[ICON_CAPITAL](Quo Mod: Major adjacency bonus for Holy Sites on rivers. Units disregard the cost of moving over rivers.)' WHERE Tag='LOC_TRAIT_LEADER_MONASTERIES_KING_DESCRIPTION' ;

UPDATE LocalizedText SET Text= Text || '[ICON_CAPITAL](Quo Mod: This unit has +1[ICON_MOVEMENT] Movement.)' WHERE Tag='LOC_UNIT_KHMER_DOMREY_DESCRIPTION' ;

--UPDATE LocalizedText SET Text= Text || '[ICON_CAPITAL](Quo Mod: Provides Medieval Bedrock in this city, allowing the construction of a Medieval Walls without meeting other requirements.)' WHERE Tag='LOC_BUILDING_PRASAT_DESCRIPTION' ;




-- Indonesia
--UPDATE LocalizedText SET Text= Text || '[ICON_CAPITAL](Quo Mod: Major [ICON_CULTURE][ICON_SCIENCE][ICON_FAITH][ICON_PRODUCTION] adjacency bonuses for districts next to coral reefs.)' WHERE Tag='LOC_TRAIT_CIVILIZATION_INDONESIA_NUSANTARA_DESCRIPTION' ;
--UPDATE LocalizedText SET Text= Text || '[ICON_CAPITAL](Quo Mod: When you discover Sailing, Astrology, Celestial Navigation, Shipbuilding, Cartography, Square Rigging, or Astronomy, receive free [ICON_CULTURE]Culture, adjusted for game speed.' WHERE Tag='LOC_TRAIT_LEADER_EXALTED_GODDESS_DESCRIPTION' ;


-- Cree
--UPDATE LocalizedText SET Text= Text || '[ICON_CAPITAL](Quo Mod: The ability to claim tiles with Trade units is extended to 4 tiles.)' WHERE Tag='LOC_LEADER_POUNDMAKER_ABILITY_DESCRIPTION' ;
UPDATE LocalizedText SET Text= '[ICON_CAPITAL](Quo Mod: +1[ICON_TradeRoute] Trade Route capacity and a free Trader with Pottery. Unclaimed tiles within 4 tiles of a Cree city come under Cree control when a Trader moves through them.)' WHERE Tag='LOC_TRAIT_CIVILIZATION_CREE_TRADE_GAIN_TILES_DESCRIPTION' ;

UPDATE LocalizedText SET Text= '[ICON_CAPITAL](Quo Mod: All alliance types provide shared visibility. [ICON_TRADEROUTE]Trade Routes to foreign cities provide +1[ICON_FOOD] Food +1[ICON_GOLD] Gold for Poundmaker per Camp or Pasture in the receiving city.)' WHERE Tag='LOC_LEADER_POUNDMAKER_ABILITY_DESCRIPTION' ;

-- Mapuche
UPDATE LocalizedText SET Text= Text || '[ICON_CAPITAL](Quo Mod: Any major civ at war with you loses -4 Loyalty per turn in all cities. All units disregard Zone of Control.)' WHERE Tag='LOC_TRAIT_LEADER_LAUTARO_ABILITY_DESCRIPTION_ALT' ;

--UPDATE LocalizedText SET Text= Text || '[ICON_CAPITAL](Quo Mod: Each time you research an Ancient Civic capable of boosts, reveal a [ICON_RESOURCE_IRON][ICON_RESOURCE_NITER][ICON_RESOURCE_COAL][ICON_RESOURCE_ALUMINUM][ICON_RESOURCE_OIL][ICON_RESOURCE_URANIUM]strategic resource on the map.)' WHERE Tag='LOC_TRAIT_CIVILIZATION_MAPUCHE_TOQUI_DESCRIPTION' ;



-- Georgia
UPDATE LocalizedText SET Text= Text || '[ICON_CAPITAL](Quo Mod: +1[ICON_FAITH]Faith +1[ICON_PRODUCTION]Production to tiles adjacent to a Government Plaza. With each government building you construct, the radius and/or intensity of the effect is increased.)' WHERE Tag='LOC_TRAIT_LEADER_RELIGION_CITY_STATES_DESCRIPTION' ;

UPDATE LocalizedText SET Text= Text || '[ICON_CAPITAL](Quo Mod: Has no Bedrock prerequisites. Received free in cities with Ancient Walls.)' WHERE Tag='LOC_BUILDING_TSIKHE_DESCRIPTION_XP2' ;

-- Netherlands
UPDATE LocalizedText SET Text= Text || '[ICON_CAPITAL](Quo Mod: All terrain types are considered valid adjacent terrain for polders, not just flat tiles.)' WHERE Tag='LOC_IMPROVEMENT_POLDER_DESCRIPTION' ;

-- Scotland
UPDATE LocalizedText SET Text= Text || '[ICON_CAPITAL](Quo Mod: Receive free Walls when you conquer a city, even if the city lacks the prerequisite Bedrock.)' WHERE Tag='LOC_TRAIT_LEADER_BANNOCKBURN_DESCRIPTION' ;
UPDATE LocalizedText SET Text= '[ICON_CAPITAL](Quo Mod: Happy and Ecstatic cities receive +5%[ICON_SCIENCE] Science +5%[ICON_PRODUCTION] Production, and +1[ICON_GREATPERSON] Great Person point toward Great Scientists and Engineers.)' WHERE Tag='LOC_TRAIT_CIVILIZATION_SCOTTISH_ENLIGHTENMENT_DESCRIPTION' ;



-- Mongolia
--UPDATE LocalizedText SET Text= Text || '[ICON_CAPITAL](Quo Mod: Any major civ at war with you loses -2 Loyalty per turn in all cities.)' WHERE Tag='LOC_TRAIT_LEADER_GENGHIS_KHAN_ABILITY_DESCRIPTION' ;

-- Korea
UPDATE LocalizedText SET Text= '[ICON_CAPITAL](Quo Mod: Receive 1 free governor. -10%[ICON_CULTURE] Culture and [ICON_SCIENCE]Science in cities without governors, changing to +10%[ICON_CULTURE] Culture and [ICON_SCIENCE]Science in cities with governors.)' WHERE Tag='LOC_TRAIT_LEADER_HWARANG_DESCRIPTION' ;

UPDATE LocalizedText SET Text= '[ICON_CAPITAL](Quo Mod: Start with 25[ICON_SCIENCE]Science, adjusted for game speed. Mines receive +1[ICON_FAITH] Faith if there is an adjacent Seowon district. Farms receive +1[ICON_FOOD] Food if there is an adjacent Seowon district.)' WHERE Tag='LOC_TRAIT_CIVILIZATION_THREE_KINGDOMS_DESCRIPTION' ;




-- Nubia
UPDATE LocalizedText SET Text= Text || '[ICON_CAPITAL](Quo Mod: Ranged units have +1[ICON_RANGE] Range. All land units suffer -3[ICON_STRENGTH] Combat Strength.)' WHERE Tag='LOC_TRAIT_CIVILIZATION_TA_SETI_DESCRIPTION' ;




-- Friendships
UPDATE LocalizedText SET Text= Text || '[NEWLINE][NEWLINE][ICON_CAPITAL](Quo Mod: Befriending adds +25% [ICON_PRODUCTION] toward Industrial Zones.)' WHERE Tag='LOC_AGENDA_IRON_CROWN_DESCRIPTION' ;
UPDATE LocalizedText SET Text= Text || '[NEWLINE][NEWLINE][ICON_CAPITAL](Quo Mod: Befriending allows Builders to construct Chateaus once you have learned Humanism.)' WHERE Tag='LOC_AGENDA_BLACK_QUEEN_DESCRIPTION' ;
UPDATE LocalizedText SET Text= Text || '[NEWLINE][NEWLINE][ICON_CAPITAL](Quo Mod: Befriending allows Builders to construct Sphinxes after you have learned Craftsmanship.)' WHERE Tag='LOC_AGENDA_QUEEN_OF_THE_NILE_DESCRIPTION' ;
UPDATE LocalizedText SET Text= Text || '[NEWLINE][NEWLINE][ICON_CAPITAL](Quo Mod: Befriending allows Builders to construct Stepwells once you have learned Irrigation.)' WHERE Tag='LOC_AGENDA_PEACEKEEPER_DESCRIPTION' ;
UPDATE LocalizedText SET Text= Text || '[NEWLINE][NEWLINE][ICON_CAPITAL](Quo Mod: Befriending allows Builders to construct Ziggurats.)' WHERE Tag='LOC_AGENDA_ALLY_OF_ENKIDU_DESCRIPTION' ;
UPDATE LocalizedText SET Text= Text || '[NEWLINE][NEWLINE][ICON_CAPITAL](Quo Mod: Befriending provides +2 influence points per turn toward diplomatic tokens with City States.)' WHERE Tag='LOC_AGENDA_WITH_YOUR_SHIELD_OR_ON_IT_DESCRIPTION' ;
UPDATE LocalizedText SET Text= Text || '[NEWLINE][NEWLINE][ICON_CAPITAL](Quo Mod: Befriending allows boats to heal outside of friendly borders.)' WHERE Tag='LOC_AGENDA_LAST_VIKING_KING_DESCRIPTION' ;
UPDATE LocalizedText SET Text= Text || '[NEWLINE][NEWLINE][ICON_CAPITAL](Quo Mod: Befriending adds +25% [ICON_PRODUCTION] toward Encampments.)' WHERE Tag='LOC_AGENDA_BUSHIDO_DESCRIPTION' ;
UPDATE LocalizedText SET Text= Text || '[NEWLINE][NEWLINE][ICON_CAPITAL](Quo Mod: Befriending adds +2[ICON_FOOD] in every city with a Holy Site.)' WHERE Tag='LOC_AGENDA_ENTHUSIASTIC_DISCIPLE_DESCRIPTION' ;
UPDATE LocalizedText SET Text= Text || '[NEWLINE][NEWLINE][ICON_CAPITAL](Quo Mod: Befriending adds +25% [ICON_PRODUCTION] toward Entertainment Complexes.)' WHERE Tag='LOC_AGENDA_GREAT_PERSON_OBSESSED_DESCRIPTION' ;
UPDATE LocalizedText SET Text= Text || '[NEWLINE][NEWLINE][ICON_CAPITAL](Quo Mod: Befriending provides +2 influence points per turn toward diplomatic tokens with City States.)' WHERE Tag='LOC_AGENDA_DELIAN_LEAGUE_DESCRIPTION' ;
UPDATE LocalizedText SET Text= Text || '[NEWLINE][NEWLINE][ICON_CAPITAL](Quo Mod: Befriending causes newly settled cities to grab extra tiles.)' WHERE Tag='LOC_AGENDA_WESTERNIZER_DESCRIPTION' ;
UPDATE LocalizedText SET Text= Text || '[NEWLINE][NEWLINE][ICON_CAPITAL](Quo Mod: Befriending allows Builders to construct Missions once you have learned Exploration.)' WHERE Tag='LOC_AGENDA_COUNTER_REFORMER_DESCRIPTION' ;
UPDATE LocalizedText SET Text= Text || '[NEWLINE][NEWLINE][ICON_CAPITAL](Quo Mod: Befriending grants +1 charge to Builders.)' WHERE Tag='LOC_AGENDA_WONDER_OBSESSED_DESCRIPTION' ;
UPDATE LocalizedText SET Text= Text || '[NEWLINE][NEWLINE][ICON_CAPITAL](Quo Mod: Befriending provides +5%[ICON_SCIENCE] Science in cities with a Holy Site and +2[ICON_GreatPerson] points per turn toward Great Prophets.)' WHERE Tag='LOC_AGENDA_AYYUBID_DYNASTY_DESCRIPTION' ;
UPDATE LocalizedText SET Text= Text || '[NEWLINE][NEWLINE][ICON_CAPITAL](Quo Mod: Befriending allows units to heal 10 HP when they defeat an enemy unit.)' WHERE Tag='LOC_AGENDA_BACKSTAB_AVERSE_DESCRIPTION' ;
UPDATE LocalizedText SET Text= Text || '[NEWLINE][NEWLINE][ICON_CAPITAL](Quo Mod: Befriending grants free roads when you settle a new city, if it is within trade route range.)' WHERE Tag='LOC_AGENDA_OPTIMUS_PRINCEPS_DESCRIPTION' ;
UPDATE LocalizedText SET Text= Text || '[NEWLINE][NEWLINE][ICON_CAPITAL](Quo Mod: Befriending reduces the Gold cost of tile purchases by 20%.)' WHERE Tag='LOC_AGENDA_BIG_STICK_POLICY_DESCRIPTION' ;
UPDATE LocalizedText SET Text= Text || '[NEWLINE][NEWLINE][ICON_CAPITAL](Quo Mod: Befriending adds +25% [ICON_PRODUCTION] Production toward Harbors.)' WHERE Tag='LOC_AGENDA_SUN_NEVER_SETS_DESCRIPTION' ;



-- Expansion 1
UPDATE LocalizedText SET Text= Text || '[NEWLINE][NEWLINE][ICON_CAPITAL](Quo Mod: Befriending provides +3 Loyalty per turn to the origin city for each domestic trade route.)' WHERE Tag='LOC_AGENDA_BILLIONAIRE_DESCRIPTION' ;
UPDATE LocalizedText SET Text= Text || '[NEWLINE][NEWLINE][ICON_CAPITAL](Quo Mod: Befriending provides +5%[ICON_SCIENCE] in cities with a Governor.)' WHERE Tag='LOC_AGENDA_CHEOMSEONGDAE_DESCRIPTION' ;
UPDATE LocalizedText SET Text= Text || '[NEWLINE][NEWLINE][ICON_CAPITAL](Quo Mod: Befriending provides +5%[ICON_PRODUCTION] Production in cities that are Ecstatic.)' WHERE Tag='LOC_AGENDA_FLOWER_OF_SCOTLAND_DESCRIPTION' ;
UPDATE LocalizedText SET Text= Text || '[NEWLINE][NEWLINE][ICON_CAPITAL](Quo Mod: Befriending provides +3[ICON_STRENGTH] to Cavalry units.)' WHERE Tag='LOC_AGENDA_HORSE_LORD_DESCRIPTION' ;
UPDATE LocalizedText SET Text= Text || '[NEWLINE][NEWLINE][ICON_CAPITAL](Quo Mod: Befriending provides an additional [ICON_TRADEROUTE] Trade Route.)' WHERE Tag='LOC_AGENDA_IRON_CONFEDERACY_DESCRIPTION' ;
UPDATE LocalizedText SET Text= Text || '[NEWLINE][NEWLINE][ICON_CAPITAL](Quo Mod: Befriending provides +3 Loyalty per turn in cities with a garrison.)' WHERE Tag='LOC_AGENDA_HORN_CHEST_LOINS_DESCRIPTION' ;
UPDATE LocalizedText SET Text= Text || '[NEWLINE][NEWLINE][ICON_CAPITAL](Quo Mod: Befriending allows Builders to construct Stepwells once you have learned Irrigation.)' WHERE Tag='LOC_AGENDA_MAURYA_EMPIRE_DESCRIPTION' ;
UPDATE LocalizedText SET Text= Text || '[NEWLINE][NEWLINE][ICON_CAPITAL](Quo Mod: Befriending provides +10 defense to all cities.)' WHERE Tag='LOC_AGENDA_NARIKALA_FORTRESS_DESCRIPTION' ;
UPDATE LocalizedText SET Text= Text || '[NEWLINE][NEWLINE][ICON_CAPITAL](Quo Mod: Befriending provides +7[ICON_STRENGTH] Strength against civilizations in a Golden Age.)' WHERE Tag='LOC_AGENDA_SPIRIT_OF_TUCAPEL_DESCRIPTION' ;


-- dlc
UPDATE LocalizedText SET Text= Text || '[NEWLINE][NEWLINE][ICON_CAPITAL](Quo Mod: Befriending adds +2 [ICON_STRENGTH] Strength to all units.)' WHERE Tag='LOC_AGENDA_TLATOANI_DESCRIPTION' ;
UPDATE LocalizedText SET Text= Text || '[NEWLINE][NEWLINE][ICON_CAPITAL](Quo Mod: Befriending allows you to culture bomb with Encampments.)' WHERE Tag='LOC_AGENDA_SAINT_DESCRIPTION' ;
UPDATE LocalizedText SET Text= Text || '[NEWLINE][NEWLINE][ICON_CAPITAL](Quo Mod: Befriending allows Builders to construct Outback Stations once you have learned Guilds.)' WHERE Tag='LOC_AGENDA_PERPETUALLY_ON_GUARD_DESCRIPTION' ;

UPDATE LocalizedText SET Text= Text || '[NEWLINE][NEWLINE][ICON_CAPITAL](Quo Mod: Befriending reduces War Weariness in cities by 50%.)' WHERE Tag='LOC_AGENDA_SHORT_LIFE_GLORY_DESCRIPTION' ;
UPDATE LocalizedText SET Text= Text || '[NEWLINE][NEWLINE][ICON_CAPITAL](Quo Mod: Befriending provides +2[ICON_GOLD] Gold to internal trade routes.)' WHERE Tag='LOC_AGENDA_BACKSTABBER_DESCRIPTION' ;

UPDATE LocalizedText SET Text= Text || '[NEWLINE][NEWLINE][ICON_CAPITAL](Quo Mod: Befriending provides Archery units with +50% XP.)' WHERE Tag='LOC_AGENDA_CITY_PLANNER_DESCRIPTION' ;

UPDATE LocalizedText SET Text= Text || '[NEWLINE][NEWLINE][ICON_CAPITAL](Quo Mod: Befriending provides +100%[ICON_PRODUCTION] Production towards Aqueducts.)' WHERE Tag='LOC_AGENDA_END_TO_SUFFERING_DESCRIPTION' ;

UPDATE LocalizedText SET Text= Text || '[NEWLINE][NEWLINE][ICON_CAPITAL](Quo Mod: Befriending provides +1[ICON_FAITH] Faith per City Centers adjacent a coast or lake.)' WHERE Tag='LOC_AGENDA_ARCHIPELAGIC_STATE_DESCRIPTION' ;


-- dlc 2
UPDATE LocalizedText SET Text= Text || '[NEWLINE][NEWLINE][ICON_CAPITAL](Quo Mod: Befriending allows Builders to contruct Open Air Museums after you have discovered Nationalism.)' WHERE Tag='LOC_AGENDA_PATRON_OF_ARTS_DESCRIPTION' ;
UPDATE LocalizedText SET Text= Text || '[NEWLINE][NEWLINE][ICON_CAPITAL](Quo Mod: Befriending provides +3 Housing in the capital.)' WHERE Tag='LOC_AGENDA_KAITIAKITANGA_DESCRIPTION' ;
UPDATE LocalizedText SET Text= Text || '[NEWLINE][NEWLINE][ICON_CAPITAL](Quo Mod: Befriending provides +25% production towards Commercial Hubs.)' WHERE Tag='LOC_AGENDA_LORD_OF_MINES_DESCRIPTION' ;
UPDATE LocalizedText SET Text= Text || '[NEWLINE][NEWLINE][ICON_CAPITAL](Quo Mod: Befriending provides +5% production towards districts.)' WHERE Tag='LOC_AGENDA_RAVEN_BANNER_DESCRIPTION' ;
UPDATE LocalizedText SET Text= Text || '[NEWLINE][NEWLINE][ICON_CAPITAL](Quo Mod: Befriending provides Siege units with +5[ICON_STRENGTH] Strength against district defenses.)' WHERE Tag='LOC_AGENDA_LAWGIVER_DESCRIPTION' ;
UPDATE LocalizedText SET Text= Text || '[NEWLINE][NEWLINE][ICON_CAPITAL](Quo Mod: Befriending allows Builders to construct Hockey Rinks after you have discovered Colonialism.)' WHERE Tag='LOC_AGENDA_CANADIAN_EXPEDITIONARY_DESCRIPTION' ;
UPDATE LocalizedText SET Text= Text || '[NEWLINE][NEWLINE][ICON_CAPITAL](Quo Mod: Befriending provides +25% production toward Harbor districts if Eleanor is leading England, or the ability for Builders to construct Chateaus if Eleanor is leading France.)' WHERE Tag='LOC_AGENDA_ANGEVIN_EMPIRE_DESCRIPTION' ;
UPDATE LocalizedText SET Text= Text || '[NEWLINE][NEWLINE][ICON_CAPITAL](Quo Mod: Befriending provides +15% production to districts the city with a Government Plaza district.)' WHERE Tag='LOC_AGENDA_SICILIAN_WARS_DESCRIPTION' ;
UPDATE LocalizedText SET Text= Text || '[NEWLINE][NEWLINE][ICON_CAPITAL](Quo Mod: Befriending allows Builders to construct Qhpac Nan (tunnels) after you have discovered Foreign Trade.)' WHERE Tag='LOC_AGENDA_SAPA_INCA_DESCRIPTION' ;



-- CONFIG SCREEN
INSERT OR REPLACE INTO LocalizedText 
		(Language, Text, Tag) 
VALUES ('en_US', 'Friends receive +25% [ICON_PRODUCTION] toward Industrial Zones.', 'LOC_QUO_TRAIT_FRIENDS_GERMANY_DESCRIPTION' ),
 ( 'en_US', 'Friends can construct Chateaus once they have learned Humanism.' , 'LOC_QUO_TRAIT_FRIENDS_FRANCE_DESCRIPTION' ),
 ( 'en_US', 'Friends can construct Sphinxes after they have learned Craftsmanship.' , 'LOC_QUO_TRAIT_FRIENDS_EGYPT_DESCRIPTION' ),
 ( 'en_US', 'Friends can construct Stepwells once they have learned Irrigation.' , 'LOC_QUO_TRAIT_FRIENDS_INDIA_DESCRIPTION' ),
 ( 'en_US', 'Friends can construct Ziggurats.' , 'LOC_QUO_TRAIT_FRIENDS_SUMERIA_DESCRIPTION' ),
 ( 'en_US', 'Friends receive +2 influence points per turn toward diplomatic tokens with City States.' , 'LOC_QUO_TRAIT_FRIENDS_GREECE_DESCRIPTION' ),
 ( 'en_US', 'Friends with boats can heal outside of friendly borders.' , 'LOC_QUO_TRAIT_FRIENDS_NORWAY_DESCRIPTION' ),
 ( 'en_US', 'Friends receive +25% [ICON_PRODUCTION] toward Encampments.' , 'LOC_QUO_TRAIT_FRIENDS_JAPAN_DESCRIPTION' ),
 ( 'en_US', 'Friends receive +2[ICON_FOOD] in every city with a Holy Site.' , 'LOC_QUO_TRAIT_FRIENDS_KONGO_DESCRIPTION' ),
 ( 'en_US', 'Friends receive +25%[ICON_PRODUCTION] Production toward Entertainment Complexes.' , 'LOC_QUO_TRAIT_FRIENDS_BRAZIL_DESCRIPTION' ),
 ( 'en_US', 'Friends grab extra tiles when they found a city.' , 'LOC_QUO_TRAIT_FRIENDS_RUSSIA_DESCRIPTION' ),
 ( 'en_US', 'Friends can construct Missions once they have learned Exploration.' , 'LOC_QUO_TRAIT_FRIENDS_SPAIN_DESCRIPTION' ),
 ( 'en_US', 'Friends receive +1 charge to Builders.' , 'LOC_QUO_TRAIT_FRIENDS_CHINA_DESCRIPTION' ),
 ( 'en_US', 'Friends receive +5%[ICON_SCIENCE] Science in cities with a Holy Site and +2[ICON_GreatPerson] points per turn toward Great Prophets.' , 'LOC_QUO_TRAIT_FRIENDS_ARABIA_DESCRIPTION' ),
 ( 'en_US', 'Friends heal 10 HP when their units defeat an enemy unit.' , 'LOC_QUO_TRAIT_FRIENDS_SCYTHIA_DESCRIPTION' ),
 ( 'en_US', 'Friends recieve free roads when they settle a new city, if it is within trade route range.' , 'LOC_QUO_TRAIT_FRIENDS_ROME_DESCRIPTION' ),
 ( 'en_US', 'Friends receive 20% lowered cost to purchase tiles.' , 'LOC_QUO_TRAIT_FRIENDS_AMERICA_DESCRIPTION' ),
 ( 'en_US', 'Friends receive +25% [ICON_PRODUCTION] Production toward Harbors.' , 'LOC_QUO_TRAIT_FRIENDS_ENGLAND_DESCRIPTION' ),



-- Expansion 1
 ( 'en_US', 'Friends receive +3 Loyalty per turn to the origin city for each domestic trade route.' , 'LOC_QUO_TRAIT_FRIENDS_NETHERLANDS_DESCRIPTION' ),
 ( 'en_US', 'Friends receive +5%[ICON_SCIENCE] in cities with a Governor.' , 'LOC_QUO_TRAIT_FRIENDS_KOREA_DESCRIPTION' ),
 ( 'en_US', 'Friends receive +5%[ICON_PRODUCTION] Production in cities that are Ecstatic.' , 'LOC_QUO_TRAIT_FRIENDS_SCOTLAND_DESCRIPTION' ),
 ( 'en_US', 'Friends receive +3[ICON_STRENGTH] to Cavalry units.' , 'LOC_QUO_TRAIT_FRIENDS_MONGOLIA_DESCRIPTION' ),
 ( 'en_US', 'Friends receive an additional [ICON_TRADEROUTE] Trade Route.' , 'LOC_QUO_TRAIT_FRIENDS_CREE_DESCRIPTION' ),
 ( 'en_US', 'Friends receive +3 Loyalty per turn in cities with a garrison.' , 'LOC_QUO_TRAIT_FRIENDS_ZULU_DESCRIPTION' ),
 ( 'en_US', 'Friends receive +10 defense to all cities.' , 'LOC_QUO_TRAIT_FRIENDS_GEORGIA_DESCRIPTION' ),
 ( 'en_US', 'Friends receive +7[ICON_STRENGTH] Strength against civilizations in a Golden Age.' , 'LOC_QUO_TRAIT_FRIENDS_MAPUCHE_DESCRIPTION' ),


-- dlc
 ( 'en_US', 'Friends receive +2[ICON_STRENGTH] Strength to all units.' , 'LOC_QUO_TRAIT_FRIENDS_AZTEC_DESCRIPTION' ),
 ( 'en_US', 'Friends can culture bomb with Encampments.' , 'LOC_QUO_TRAIT_FRIENDS_POLAND_DESCRIPTION' ),
 ( 'en_US', 'Friends can construct Outback Stations once they have learned Guilds.' , 'LOC_QUO_TRAIT_FRIENDS_AUSTRALIA_DESCRIPTION' ),

 ( 'en_US', 'Friends experience 50% less War Weariness in their cities.' , 'LOC_QUO_TRAIT_FRIENDS_MACEDON_DESCRIPTION' ),
 ( 'en_US', 'Friends receive +2[ICON_GOLD] Gold to internal trade routes.' , 'LOC_QUO_TRAIT_FRIENDS_PERSIA_DESCRIPTION' ),

 ( 'en_US', 'Friends receive +50% XP for Archery units.' , 'LOC_QUO_TRAIT_FRIENDS_NUBIA_DESCRIPTION' ),

 ( 'en_US', 'Friends receive +100%[ICON_PRODUCTION] Production towards Aqueducts.' , 'LOC_QUO_TRAIT_FRIENDS_KHMER_DESCRIPTION' ),

 ( 'en_US', 'Friends receive +1[ICON_FAITH] Faith per City Centers adjacent a coast or lake.' , 'LOC_QUO_TRAIT_FRIENDS_INDONESIA_DESCRIPTION' ),
 
 ( 'en_US', 'Friends can build the Hacienda improvement after discovering Mercantalism.' , 'LOC_QUO_TRAIT_FRIENDS_GRAN_COLOMBIA_DESCRIPTION' ),
 ( 'en_US', 'Friends units receive +6[ICON_STRENGTH]Combat Strength when within 6 tiles of their capital city.' , 'LOC_QUO_TRAIT_FRIENDS_MAYA_DESCRIPTION' ),
 ( 'en_US', 'Friends can build the Rock Hewn Church improvement after discovering Drama and Poetry.' , 'LOC_QUO_TRAIT_FRIENDS_ETHIOPIA_DESCRIPTION' ),


-- xp 2
 ( 'en_US', 'Friends can contruct Open Air Museums after they have discovered Nationalism.' , 'LOC_QUO_TRAIT_FRIENDS_SWEDEN_DESCRIPTION' ),
 ( 'en_US', 'Friends receive +3[ICON_HOUSING] Housing in the capital.' , 'LOC_QUO_TRAIT_FRIENDS_MAORI_DESCRIPTION' ),
 ( 'en_US', 'Friends receive +25% production towards Commercial Hubs.' , 'LOC_QUO_TRAIT_FRIENDS_MALI_DESCRIPTION' ),
 ( 'en_US', 'Friends receive +5% production towards constructing districts.' , 'LOC_QUO_TRAIT_FRIENDS_HUNGARY_DESCRIPTION' ),
 ( 'en_US', 'Friends receive +5[ICON_STRENGTH] Strength against district defenses to Siege units.' , 'LOC_QUO_TRAIT_FRIENDS_OTTOMAN_DESCRIPTION' ),
 ( 'en_US', 'Friends can construct Hockey Rinks after they have discovered Colonialism.' , 'LOC_QUO_TRAIT_FRIENDS_CANADA_DESCRIPTION' ),
-- ( 'en_US', 'Friends receive +50% production toward Harbor districts if Eleanor is leading England, or the ability for Builders to construct Chateaus if Eleanor is leading France.' , 'LOC_QUO_TRAIT_FRIENDS_AMERICA_DESCRIPTION' ),
 ( 'en_US', 'Friends receive +15% production to districts in the city with a Government Plaza district.' , 'LOC_QUO_TRAIT_FRIENDS_PHOENICIA_DESCRIPTION' ),
 ( 'en_US', 'Friends can construct Qhpac Nan (tunnels) after they have discovered Foreign Trade.' , 'LOC_QUO_TRAIT_FRIENDS_INCA_DESCRIPTION' ) ;

  -- downloadable mods
  -- now handled in Scratchpad files
 --( 'en_US', 'Friends receive an extra trade route.' , 'LOC_QUO_TRAIT_FRIENDS_ICELAND_DESCRIPTION' );






-- Biomes
INSERT OR REPLACE INTO LocalizedText
	(Language, Text, Tag)
VALUES('en_US', 'Sphere: Nomadic Asia', 'LOC_QUO_TRAIT_BIOME_ASIAN_STEPPE_NAME'),
	('en_US', 'Sphere: Native America', 'LOC_QUO_TRAIT_BIOME_NATIVE_AMERICA_NAME'),
	('en_US', 'Sphere: New World', 'LOC_QUO_TRAIT_BIOME_NEW_WORLD_NAME'),
	('en_US', 'Sphere: Nordic', 'LOC_QUO_TRAIT_BIOME_BOREAL_EUROPE_NAME'),
	('en_US', 'Sphere: Asian Pacific', 'LOC_QUO_TRAIT_BIOME_ASIAN_PACIFIC_NAME'),
	('en_US', 'Sphere: Hellenic', 'LOC_QUO_TRAIT_BIOME_ROMANESQUE_NAME'),
	('en_US', 'Sphere: Middle East', 'LOC_QUO_TRAIT_BIOME_ARABESQUE_NAME'),
	('en_US', 'Sphere: Sub-Saharan Africa', 'LOC_QUO_TRAIT_BIOME_AFRICA_NAME'),
	('en_US', 'Sphere: Mainland Asia', 'LOC_QUO_TRAIT_BIOME_ASIAN_EXPANSE_NAME'),
	('en_US', 'Sphere: Western Europe', 'LOC_QUO_TRAIT_BIOME_WEST_EUROPE_NAME'),
	('en_US', 'Sphere: British Isles', 'LOC_QUO_TRAIT_BIOME_UK_NAME'),
	('en_US', 'Sphere: Eastern Europe', 'LOC_QUO_TRAIT_BIOME_EAST_EUROPE_NAME'),
	('en_US', 'Sphere: North Africa', 'LOC_QUO_TRAIT_BIOME_NORTH_AFRICA_NAME'),
	
	('en_US', 'Available Governors', 'LOC_QUO_TRAIT_BIOME_GOVERNORS_NAME'),
	('en_US', 'Cookie', 'LOC_QUO_GOVERNOR_COOK_NAME'),
	('en_US', 'The Cookiest', 'LOC_QUO_GOVERNOR_COOK_DESCRIPTION'),
	('en_US', 'The Cooker', 'LOC_QUO_GOVERNOR_COOK_TITLE'),
	('en_US', 'The Cook', 'LOC_QUO_GOVERNOR_COOK_TITLE_SHORT'),
	
	('en_US', 'Rictor', 'QUO_LOC_GOVERNOR_THE_DEFENDER_NAME'),
	('en_US', 'Umani', 'QUO_LOC_GOVERNOR_THE_AMBASSADOR_NAME'),
	('en_US', 'Woksha', 'QUO_LOC_GOVERNOR_THE_CARDINAL_NAME'),
	('en_US', 'Wagnus', 'QUO_LOC_GOVERNOR_THE_RESOURCE_MANAGER_NAME'),
	('en_US', 'Ziang', 'QUO_LOC_GOVERNOR_THE_BUILDER_NAME'),
	('en_US', 'Zingala', 'QUO_LOC_GOVERNOR_THE_EDUCATOR_NAME'),
	('en_US', 'Leyna', 'QUO_LOC_GOVERNOR_THE_MERCHANT_NAME'),
	('en_US', 'Ubrahim', 'QUO_LOC_GOVERNOR_IBRAHIM_NAME'),
	('en_US', 'Zookie', 'QUO_LOC_QUO_GOVERNOR_COOK_NAME'),
		
	
	('en_US', 'Castellan x2, Druid, Steward, Surveyor, Vizier', 'LOC_QUO_TRAIT_BIOME_ASIAN_STEPPE_GOV_DESCRIPTION'),
	('en_US', 'Druid x2, Ambassador, Educator, Merchant, Surveyor', 'LOC_QUO_TRAIT_BIOME_NATIVE_AMERICA_GOV_DESCRIPTION'),
	('en_US', 'New Worlds civs have access to one copy of all Governor types.', 'LOC_QUO_TRAIT_BIOME_NEW_WORLD_GOV_DESCRIPTION'),
	('en_US', 'Ambassador x2, Educator x2, Mariner, Steward', 'LOC_QUO_TRAIT_BIOME_BOREAL_EUROPE_GOV_DESCRIPTION'),
	('en_US', 'Mariner x2, Merchant, Druid, Educator, Steward', 'LOC_QUO_TRAIT_BIOME_ASIAN_PACIFIC_GOV_DESCRIPTION'),
	('en_US', 'Ambassador x2, Educator, Merchant, Surveyor, Steward', 'LOC_QUO_TRAIT_BIOME_ROMANESQUE_GOV_DESCRIPTION'),
	('en_US', 'Cardinal x2, Druid, Merchant, Educator, Vizier', 'LOC_QUO_TRAIT_BIOME_ARABESQUE_GOV_DESCRIPTION'),
	('en_US', 'Castellan, Druid, Educator, Merchant, Surveyor, Steward', 'LOC_QUO_TRAIT_BIOME_AFRICA_GOV_DESCRIPTION'),
	('en_US', 'Surveyor x2, x2 Cardinal, x2 Druid, x2 Educator, x2 Merchant', 'LOC_QUO_TRAIT_BIOME_ASIAN_EXPANSE_GOV_DESCRIPTION'),
	('en_US', 'Castellan, Cardinal, Educator, Mariner, Merchant, Steward', 'LOC_QUO_TRAIT_BIOME_WEST_EUROPE_GOV_DESCRIPTION'),
	('en_US', 'Mariner x2, Ambassador, Castellan, Educator, Steward', 'LOC_QUO_TRAIT_BIOME_UK_GOV_DESCRIPTION'),
	('en_US', 'Cardinal x2, Steward x2, Castellan, Educator', 'LOC_QUO_TRAIT_BIOME_EAST_EUROPE_GOV_DESCRIPTION'),
	('en_US', 'Merchant x2, Cardinal, Educator, Mariner, Vizier', 'LOC_QUO_TRAIT_BIOME_NORTH_AFRICA_GOV_DESCRIPTION'),
	
	
	('en_US', 'Cannot build Government Plazas.[NEWLINE][NEWLINE]Free Governor promotion with each Civic that provides 2 or more Diplomatic Tokens. On plains and grass tiles, the yield between hills and flat tiles is reversed. Can build a project to move the Capital to a new city, establishing free Walls and Bedrock. In cities with all 3 types of Bedrock, improved Luxury resources provide +2[ICON_GOLD][ICON_CULTURE][ICON_SCIENCE] or [ICON_FAITH].', 'LOC_QUO_TRAIT_BIOME_ASIAN_STEPPE_DESCRIPTION') ,
	('en_US', 'Cannot build Cavalry units prior to the Modern era, with the exception of unique units.[NEWLINE][NEWLINE]Native American cities are always loyal and cannot be culture flipped by other civilizations. Settlers have +3[ICON_MOVEMENT] Movement and Stealth. From the Medieval era onward, Recon, Ranged, and Anti-Cavalry units have Stealth.', 'LOC_QUO_TRAIT_BIOME_NATIVE_AMERICA_DESCRIPTION') ,
	('en_US', '[ICON_RESOURCE_URANIUM]Uranium is not unveiled until you research Future Tech.[NEWLINE][NEWLINE]Land Infantry, Cavalry, and Recon units have a chance to knock enemies out of position. Free Military Engineer with each Civic that unlocks a Governor point. Can build Canal and Dam districts after researching Shipbuilding.', 'LOC_QUO_TRAIT_BIOME_BOREAL_EUROPE_DESCRIPTION') ,
	('en_US', 'Governors provide no Loyalty.[NEWLINE][NEWLINE]Founding a city creates Medieval Road through every tile within 3 hexes. Population does not limit how many districts you can build in the city with the Government Plaza. Unlock the ability to construct each district type when you discover the prereq to the technology or civic that is normally required to build it.', 'LOC_QUO_TRAIT_BIOME_ROMANESQUE_DESCRIPTION') ,
	('en_US', 'Cannot send delegations or propose trade deals until the Industrial era.[NEWLINE][NEWLINE]Start the game with closed borders. Combat [ICON_STRENGTH]Strength of units is raised or lowered based on tile Appeal. Siphon [ICON_FAITH]Faith and health based on the Appeal of tiles on which enemies are defeated. +3 Appeal on tiles adjacent to Volcanoes.', 'LOC_QUO_TRAIT_BIOME_ASIAN_PACIFIC_DESCRIPTION') ,
	('en_US', '-10[ICON_STRENGTH] Strength versus civs in a Golden Age.[NEWLINE][NEWLINE]Conquering a city with a military unit converts it to your religion. Cities start with a minimum 4[ICON_HOUSING] Housing from Water no matter where they are founded. Unlock the visibility of Strategic resources at the start of each appropriate era even if you lack the required technology. The base stockpile cap for all Strategic resources is increased x4.', 'LOC_QUO_TRAIT_BIOME_ARABESQUE_DESCRIPTION') ,
	('en_US', 'Navy is limited to Raider class units.[NEWLINE][NEWLINE]Movement is not hindered by Forest or Rainforest. Rainforests have a chance to appear within 3 hexes of your cities and convey +2 Appeal. Build the speciality district available to other Sub-Saharan African leaders instead of the normal district, but [ICON_PRODUCTION] Production costs are increased.', 'LOC_QUO_TRAIT_BIOME_AFRICA_DESCRIPTION') ,
	('en_US', 'Forest and Rainforest provide no bonus [ICON_PRODUCTION]Production.[NEWLINE][NEWLINE]Receive 1[ICON_GOLD]Gold per improved luxury resource in your empire each time you kill an enemy unit. Free Medieval Bedrock in all cities, enabling the construction of Medieval Walls without meeting the normal pre-reqs. Infantry units built during the Medieval era or later begin with a free promotion.', 'LOC_QUO_TRAIT_BIOME_WEST_EUROPE_DESCRIPTION') ,
	('en_US', 'Siege units have -1[ICON_RANGE]Range.[NEWLINE][NEWLINE]Prior to the dawn of the Renaissance, acquire up to 8 hexes when a Great Person is expended in a city. Can double up on any of the Governor types available to the sphere. Every 3 population in a city increases its ranged strike strength by +3. In the Industrial era and later, cities with established governors receive +2[ICON_POWER]Power per governor title.', 'LOC_QUO_TRAIT_BIOME_ASIAN_EXPANSE_DESCRIPTION') ,
	('en_US', 'Receive 2 Settlers free when the world reaches the Classical era, but you cannot build Settlers prior to this time.[NEWLINE][NEWLINE]Free Anti-Air Gun in every city when the world reaches the Atomic era. Tiles cost 20% less to purchase with [ICON_GOLD]Gold, and all of your districts culture bomb. All units disregard Rivers and Zone of Control in their [ICON_MOVEMENT] movement costs.', 'LOC_QUO_TRAIT_BIOME_NEW_WORLD_DESCRIPTION') ,
	('en_US', '-5[ICON_STRENGTH] Strength against wounded units that are Fortified.[NEWLINE][NEWLINE]During the Medieval and Renaissance eras, Ranged units have +2[ICON_RANGE] Range. In the Modern era and again in the Information era, receive a free Spy slot, a free Spy unit, and all Spies conduct offensive missions as if they were 1 level higher.', 'LOC_QUO_TRAIT_BIOME_UK_DESCRIPTION'),
	('en_US', 'Cannot build Support units, with the exception of Support units that have Charges (e.g. Military Engineers).[NEWLINE][NEWLINE]Begin with Bronze Working unlocked. Anti-Cavalry ignore zone of control, and can move after attacking. Receive a free Anti-Cavalary unit when a city reaches 5 Population. On the dawn of the Industrial era, receive a second free Anti-Cavalry in every city.', 'LOC_QUO_TRAIT_BIOME_EAST_EUROPE_DESCRIPTION') ,
	('en_US', 'Ranged units cannot fire after moving unless they are on horseback or are unlocked by Renaissance or later era technologies.[NEWLINE][NEWLINE]Land and sea trade routes are immune to plunder. Constructs most unique units available to Hellenic or Middle Eastern civilizations instead of standard units, but these borrowed-sphere units fight with -5[ICON_STRENGTH] Strength.', 'LOC_QUO_TRAIT_BIOME_NORTH_AFRICA_DESCRIPTION') ;
	
	
	
	
	
	
	
	







-- DEBUG
UPDATE tblQuoDebug SET x_Close='1' WHERE DebugID='Quo_Civ_Text';
