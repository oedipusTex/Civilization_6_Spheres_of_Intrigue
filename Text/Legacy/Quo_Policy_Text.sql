/*
    Created by Quo
*/
 

-- SURVEY
UPDATE LocalizedText SET Text='x2 XP for recon units. Recon units and Settlers ignore rivers and Zone Of Control.' WHERE Tag='LOC_POLICY_SURVEY_DESCRIPTION' ;


-- URBAN PLANNING
UPDATE LocalizedText SET Text=Text || ' +100% [ICON_PRODUCTION] Production toward Granaries.' WHERE Tag='LOC_POLICY_URBAN_PLANNING_DESCRIPTION' ;


-- INSULAE (Housing 1), MEDINA QUARTER (Housing 2)
UPDATE LocalizedText SET Text=' +1 [ICON_HOUSING] in all cities.' WHERE Tag='LOC_POLICY_INSULAE_DESCRIPTION' ;
UPDATE LocalizedText SET Text=' +2 [ICON_HOUSING] in all cities.' WHERE Tag='LOC_POLICY_MEDINA_QUARTER_DESCRIPTION' ;


UPDATE LocalizedText SET Text='[ICON_HOUSING] Housing 1 (Insulae)' WHERE Tag='LOC_POLICY_INSULAE_NAME' ;
UPDATE LocalizedText SET Text='[ICON_HOUSING] Housing 2 (Medina Quarter)' WHERE Tag='LOC_POLICY_MEDINA_QUARTER_NAME' ;


-- NEW DEAL
UPDATE LocalizedText SET Text='+4 [ICON_Housing] Housing, +2 [ICON_Amenities] Amenities, -8 [ICON_Gold] Gold to all cities.' WHERE Tag='LOC_POLICY_NEW_DEAL_DESCRIPTION' ;


-- CORVEE, GOTHIC ARCHITECTURE, SKYSCRAPERS
UPDATE LocalizedText SET Text='+30% [ICON_Production] Production toward wonders up to the Classical era.' WHERE Tag='LOC_POLICY_CORVEE_DESCRIPTION' ;
UPDATE LocalizedText SET Text='+30% [ICON_Production] Production toward wonders up to the Medieval era.' WHERE Tag='LOC_POLICY_GOTHIC_ARCHITECTURE_DESCRIPTION' ;
UPDATE LocalizedText SET Text='+30% [ICON_Production] Production toward all wonders.' WHERE Tag='LOC_POLICY_SKYSCRAPERS_DESCRIPTION' ;


UPDATE LocalizedText SET Text='[ICON_Production][ICON_TOURISM] Wonders 1 (Corvee)' WHERE Tag='LOC_POLICY_CORVEE_NAME' ;
UPDATE LocalizedText SET Text='[ICON_Production][ICON_TOURISM] Wonders 2 (Gothic Architecture)' WHERE Tag='LOC_POLICY_GOTHIC_ARCHITECTURE_NAME' ;
UPDATE LocalizedText SET Text='[ICON_Production][ICON_TOURISM] Wonders 3 (Skyscrapers)' WHERE Tag='LOC_POLICY_SKYSCRAPERS_NAME' ;


-- VETERANCY
UPDATE LocalizedText SET Text='+100% [ICON_PRODUCTION] Production toward Encampment districts and Buildings for that District.' WHERE Tag='LOC_POLICY_VETERANCY_DESCRIPTION' ;


-- EARLY EMPIRE
UPDATE LocalizedText SET Text='+2[ICON_CULTURE] Culture in cities without Monuments, +100%[ICON_PRODUCTION] towards Monuments.' WHERE Tag='LOC_POLICY_COLONIZATION_DESCRIPTION' ;



-- COLONIAL OFFICES

UPDATE LocalizedText SET Text='+30% faster growth for cities not on your original [ICON_Capital] continent.' WHERE Tag='LOC_POLICY_COLONIAL_OFFICES_DESCRIPTION' ;


-- BASTIONS
-- removed in v3.11.0
-- UPDATE LocalizedText SET Text='+6 City [ICON_Strength] Defense Strength. +5 City [ICON_Ranged] Ranged Strength. Cities and Encampments without walls gain an attack.' WHERE Tag='LOC_POLICY_BASTIONS_DESCRIPTION' ;



-- TIERED POLICIES


UPDATE LocalizedText SET Text='[ICON_Production][ICON_RESOURCE_IRON] Troopers 1 (Agoge)' WHERE Tag='LOC_POLICY_AGOGE_NAME' ;
UPDATE LocalizedText SET Text='[ICON_Production][ICON_RESOURCE_IRON] Troopers 2 (Feudal Contract)' WHERE Tag='LOC_POLICY_FEUDAL_CONTRACT_NAME' ;
UPDATE LocalizedText SET Text='[ICON_Production][ICON_RESOURCE_IRON] Troopers 3 (Grand Armee)' WHERE Tag='LOC_POLICY_GRANDE_ARMEE_NAME' ;
UPDATE LocalizedText SET Text='[ICON_Production][ICON_RESOURCE_IRON] Troopers 4 (Military First)' WHERE Tag='LOC_POLICY_MILITARY_FIRST_NAME' ;



UPDATE LocalizedText SET Text='[ICON_Production][ICON_RESOURCE_HORSES] Riders 1 (Manuever)' WHERE Tag='LOC_POLICY_MANEUVER_NAME' ;
UPDATE LocalizedText SET Text='[ICON_Production][ICON_RESOURCE_HORSES] Riders 2 (Chivalry)' WHERE Tag='LOC_POLICY_CHIVALRY_NAME' ;
UPDATE LocalizedText SET Text='[ICON_Production][ICON_RESOURCE_HORSES] Riders 3 (Lightning Warfare)' WHERE Tag='LOC_POLICY_LIGHTNING_WARFARE_NAME' ;


UPDATE LocalizedText SET Text='[ICON_Production][ICON_RANGED] Sky Units 1 (Finest Hour)' WHERE Tag='LOC_POLICY_FINEST_HOUR_NAME' ;
UPDATE LocalizedText SET Text='[ICON_Production][ICON_RANGED] Sky Units 2 (Strategic Air Force)' WHERE Tag='LOC_POLICY_STRATEGIC_AIR_FORCE_NAME' ;


UPDATE LocalizedText SET Text='[ICON_Production][ICON_RESOURCE_WHALES] Naval 1 (Martitime Industries)' WHERE Tag='LOC_POLICY_MARITIME_INDUSTRIES_NAME' ;
UPDATE LocalizedText SET Text='[ICON_Production][ICON_RESOURCE_WHALES] Naval 2 (Press Gangs)' WHERE Tag='LOC_POLICY_PRESS_GANGS_NAME' ;
UPDATE LocalizedText SET Text='[ICON_Production][ICON_RESOURCE_WHALES] Naval 3 (International Waters)' WHERE Tag='LOC_POLICY_INTERNATIONAL_WATERS_NAME' ;


UPDATE LocalizedText SET Text='[ICON_Production][ICON_RESOURCE_WINE] Ilkum' WHERE Tag='LOC_POLICY_ILKUM_NAME' ;
UPDATE LocalizedText SET Text='[ICON_RESOURCE_WINE][ICON_RESOURCE_WINE] Serfdom' WHERE Tag='LOC_POLICY_SERFDOM_NAME' ;
UPDATE LocalizedText SET Text='[ICON_Production][ICON_RESOURCE_WINE][ICON_RESOURCE_WINE] Public Works' WHERE Tag='LOC_POLICY_PUBLIC_WORKS_NAME' ;



UPDATE LocalizedText SET Text='+30% [ICON_PRODUCTION] toward Melee and Ranged units up to the Classical era' WHERE Tag='LOC_POLICY_AGOGE_DESCRIPTION' ;
UPDATE LocalizedText SET Text='+40% [ICON_PRODUCTION] toward Melee and Ranged units up to the Rennaissance era' WHERE Tag='LOC_POLICY_FEUDAL_CONTRACT_DESCRIPTION' ;
UPDATE LocalizedText SET Text='+50% [ICON_PRODUCTION] toward Melee and Ranged units up to the Modern era' WHERE Tag='LOC_POLICY_GRANDE_ARMEE_DESCRIPTION' ;
UPDATE LocalizedText SET Text='+50% [ICON_PRODUCTION] toward Melee and Ranged units of any era' WHERE Tag='LOC_POLICY_MILITARY_FIRST_DESCRIPTION' ;

UPDATE LocalizedText SET Text='+30% [ICON_PRODUCTION] toward Calvary units up to the Classical era' WHERE Tag='LOC_POLICY_MANEUVER_DESCRIPTION' ;
UPDATE LocalizedText SET Text='+40% [ICON_PRODUCTION] toward Calvary units up to the Industrial era' WHERE Tag='LOC_POLICY_CHIVALRY_DESCRIPTION' ;
UPDATE LocalizedText SET Text='+50% [ICON_PRODUCTION] toward all Calvary units' WHERE Tag='LOC_POLICY_LIGHTNING_WARFARE_DESCRIPTION' ;


UPDATE LocalizedText SET Text='+100% [ICON_PRODUCTION] toward Naval units up to the Classical era' WHERE Tag='LOC_POLICY_MARITIME_INDUSTRIES_DESCRIPTION' ;
UPDATE LocalizedText SET Text='+100% [ICON_PRODUCTION] toward Naval units up to the Industrial era' WHERE Tag='LOC_POLICY_PRESS_GANGS_DESCRIPTION' ;
UPDATE LocalizedText SET Text='+100% [ICON_PRODUCTION] toward all Naval units except Carriers' WHERE Tag='LOC_POLICY_INTERNATIONAL_WATERS_DESCRIPTION' ;



-- ADDITIONAL COMBAT CARDS

-- support
UPDATE LocalizedText SET Text='[ICON_Production][ICON_RESOURCE_MERCURY]Patriotic War' WHERE Tag='LOC_POLICY_PATRIOTIC_WAR_NAME' ;


-- movement
UPDATE LocalizedText SET Text='+1[ICON_MOVEMENT] ' || Text  WHERE Tag='LOC_POLICY_LOGISTICS_NAME' ;
UPDATE LocalizedText SET Text='[ICON_MOVEMENT][ICON_RESOURCE_DEER] ' || Text  WHERE Tag='LOC_POLICY_SURVEY_NAME' ;


-- happy or war weary
UPDATE LocalizedText SET Text='[ICON_STRENGTH][ICON_AMENITIES] ' || Text  WHERE Tag='LOC_POLICY_DEFENSE_OF_MOTHERLAND_NAME' ;
UPDATE LocalizedText SET Text='[ICON_STRENGTH][ICON_AMENITIES] ' || Text  WHERE Tag='LOC_POLICY_MARTIAL_LAW_NAME' ;
UPDATE LocalizedText SET Text='[ICON_STRENGTH][ICON_AMENITIES] ' || Text  WHERE Tag='LOC_POLICY_PROPAGANDA_NAME' ;
UPDATE LocalizedText SET Text='[ICON_STRENGTH]=[ICON_AMENITIES] ' || Text  WHERE Tag='LOC_POLICY_RETAINERS_NAME' ;


-- relations between gold and combat units
UPDATE LocalizedText SET Text='-[ICON_GOLD][ICON_STRENGTH] ' || Text  WHERE Tag='LOC_POLICY_LEVEE_EN_MASSE_NAME' ;
UPDATE LocalizedText SET Text='-[ICON_GOLD][ICON_STRENGTH] ' || Text  WHERE Tag='LOC_POLICY_CONSCRIPTION_NAME' ;
UPDATE LocalizedText SET Text='[ICON_STRENGTH]=[ICON_GOLD] ' || Text  WHERE Tag='LOC_POLICY_NATIVE_CONQUEST_NAME' ;



-- pillaging
UPDATE LocalizedText SET Text='[ICON_BOMBARD][ICON_GOLD] ' || Text  WHERE Tag='LOC_POLICY_RAID_NAME' ;
UPDATE LocalizedText SET Text='[ICON_BOMBARD][ICON_GOLD] ' || Text  WHERE Tag='LOC_POLICY_SACK_NAME' ;
UPDATE LocalizedText SET Text='[ICON_BOMBARD][ICON_GOLD] ' || Text  WHERE Tag='LOC_POLICY_TOTAL_WAR_NAME' ;


-- city strength
UPDATE LocalizedText SET Text='[ICON_RANGED] ' || Text  WHERE Tag='LOC_POLICY_BASTIONS_NAME' ;
UPDATE LocalizedText SET Text='[ICON_PRODUCTION][ICON_BOLT] ' || Text  WHERE Tag='LOC_POLICY_LIMES_NAME' ;
UPDATE LocalizedText SET Text='[ICON_PRODUCTION][ICON_RANGE] ' || Text  WHERE Tag='LOC_POLICY_VETERANCY_NAME' ;


-- early policies
UPDATE LocalizedText SET Text='[ICON_CAPITAL][ICON_GOLD][ICON_FAITH] ' || Text  WHERE Tag='LOC_POLICY_GOD_KING_NAME' ;
UPDATE LocalizedText SET Text='[ICON_PRODUCTION] ' || Text  WHERE Tag='LOC_POLICY_URBAN_PLANNING_NAME' ;
UPDATE LocalizedText SET Text='[ICON_STRENGTH] ' || Text  WHERE Tag='LOC_POLICY_DISCIPLINE_NAME' ;


-- combat injuries
UPDATE LocalizedText SET Text='[ICON_STRENGTH][ICON_STRENGTH] ' || Text  WHERE Tag='LOC_POLICY_NATIONAL_IDENTITY_NAME' ;


-- settlers
UPDATE LocalizedText SET Text='[ICON_CULTURE] ' || Text  WHERE Tag='LOC_POLICY_COLONIZATION_NAME' ;
UPDATE LocalizedText SET Text='[ICON_PRODUCTION][ICON_RESOURCE_TEA] ' || Text  WHERE Tag='LOC_POLICY_EXPROPRIATION_NAME' ;



UPDATE LocalizedText SET Text='[ICON_STRENGTH]^[ICON_GOLD] ' || Text  WHERE Tag='LOC_POLICY_PROFESSIONAL_ARMY_NAME' ;


-- adjacencies

UPDATE LocalizedText SET Text='[ICON_CULTURE][ICON_CULTURE] ' || Text  WHERE Tag='LOC_POLICY_AESTHETICS_NAME' ;
UPDATE LocalizedText SET Text='[ICON_Production][ICON_Production] ' || Text  WHERE Tag='LOC_POLICY_CRAFTSMEN_NAME' ;
UPDATE LocalizedText SET Text='[ICON_GOLD][ICON_GOLD][ICON_RESOURCE_CRABS][ICON_RESOURCE_CRABS] ' || Text  WHERE Tag='LOC_POLICY_ECONOMIC_UNION_NAME' ;
UPDATE LocalizedText SET Text='[ICON_SCIENCE][ICON_SCIENCE][ICON_Production][ICON_Production] ' || Text  WHERE Tag='LOC_POLICY_FIVE_YEAR_PLAN_NAME' ;
UPDATE LocalizedText SET Text='[ICON_SCIENCE][ICON_SCIENCE] ' || Text  WHERE Tag='LOC_POLICY_NATURAL_PHILOSOPHY_NAME' ;
UPDATE LocalizedText SET Text='[ICON_RESOURCE_CRABS][ICON_RESOURCE_CRABS] ' || Text  WHERE Tag='LOC_POLICY_NAVAL_INFRASTRUCTURE_NAME' ;
UPDATE LocalizedText SET Text='[ICON_FAITH][ICON_FAITH] ' || Text WHERE Tag='LOC_POLICY_SCRIPTURE_NAME' ;
UPDATE LocalizedText SET Text='[ICON_CULTURE][ICON_CULTURE] ' || Text  WHERE Tag='LOC_POLICY_GRAND_OPERA_NAME' ;
UPDATE LocalizedText SET Text='[ICON_CULTURE][ICON_CULTURE] ' || Text  WHERE Tag='LOC_POLICY_SPORTS_MEDIA_NAME' ;
UPDATE LocalizedText SET Text='[ICON_GOLD][ICON_GOLD] ' || Text  WHERE Tag='LOC_POLICY_TOWN_CHARTERS_NAME' ;


UPDATE LocalizedText SET Text='[ICON_TRADEROUTE][ICON_GOLD] ' || Text WHERE Tag='LOC_POLICY_CARAVANSARIES_NAME' ;
UPDATE LocalizedText SET Text='[ICON_TRADEROUTE][ICON_GOLD][ICON_FAITH] ' || Text  WHERE Tag='LOC_POLICY_TRIANGULAR_TRADE_NAME' ;
UPDATE LocalizedText SET Text='[ICON_TRADEROUTE][ICON_GOLD][ICON_CULTURE][ICON_SCIENCE] ' || Text  WHERE Tag='LOC_POLICY_MARKET_ECONOMY_NAME' ;
UPDATE LocalizedText SET Text='[ICON_TRADEROUTE][ICON_CULTURE][ICON_SCIENCE] ' || Text  WHERE Tag='LOC_POLICY_TRADE_CONFEDERATION_NAME' ;
UPDATE LocalizedText SET Text='[ICON_TRADEROUTE][ICON_FOOD] ' || Text WHERE Tag='LOC_POLICY_COLLECTIVIZATION_NAME' ;
UPDATE LocalizedText SET Text='[ICON_TRADEROUTE][ICON_GOLD][ICON_PRODUCTION] ' || Text WHERE Tag='LOC_POLICY_ECOMMERCE_NAME' ;
UPDATE LocalizedText SET Text='[ICON_TRADEROUTE][ICON_FOOD][ICON_PRODUCTION] ' || Text  WHERE Tag='LOC_POLICY_ARSENAL_OF_DEMOCRACY_NAME' ;



-- increases to buildings

UPDATE LocalizedText SET Text='[ICON_BOLT][ICON_SCIENCE] Rationalism' WHERE Tag='LOC_POLICY_RATIONALISM_NAME' ;
UPDATE LocalizedText SET Text='[ICON_BOLT][ICON_FAITH] Colonial Taxes' WHERE Tag='LOC_POLICY_SIMULTANEUM_NAME' ;
UPDATE LocalizedText SET Text='[ICON_BOLT][ICON_GOLD] ' || Text WHERE Tag='LOC_POLICY_FREE_MARKET_NAME' ;

UPDATE LocalizedText SET Text='[ICON_BOLT][ICON_SCIENCE] ' || Text WHERE Tag='LOC_POLICY_MILITARY_RESEARCH_NAME' ;


-- shorten this descript because it is too long
UPDATE LocalizedText SET Text='+1 [ICON_Gold] Gold per improved Luxury and Strategic resource for international [ICON_TRADEroute]. +2 [ICON_Culture] Culture and +2 [ICON_Science] Science. ' WHERE Tag='LOC_POLICY_MARKET_ECONOMY_DESCRIPTION' ;


-- tourism
UPDATE LocalizedText SET Text='[ICON_TRADEROUTE][ICON_TOURISM] ' || Text WHERE Tag='LOC_POLICY_ONLINE_COMMUNITIES_NAME' ;
UPDATE LocalizedText SET Text='[ICON_TOURISM][ICON_GreatWork_Portrait][ICON_GreatWork_Artifact] ' || Text WHERE Tag='LOC_POLICY_HERITAGE_TOURISM_NAME' ;
UPDATE LocalizedText SET Text='[ICON_TOURISM][ICON_greatwork_music] ' || Text WHERE Tag='LOC_POLICY_SATELLITE_BROADCASTS_NAME' ;


-- mixed cases
UPDATE LocalizedText SET Text='[ICON_GOLD][ICON_SCIENCE] ' || Text WHERE Tag='LOC_POLICY_THIRD_ALTERNATIVE_NAME' ;
UPDATE LocalizedText SET Text='[ICON_FOOD]>[ICON_GOLD] ' || Text WHERE Tag='LOC_POLICY_PUBLIC_TRANSPORT_NAME' ;


-- double resources
UPDATE LocalizedText SET Text='[ICON_RESOURCE_IRON][ICON_RESOURCE_IRON] ' || Text WHERE Tag='LOC_POLICY_RESOURCE_MANAGEMENT_NAME' ;


-- religion
UPDATE LocalizedText SET Text='[ICON_RELIGION][ICON_STRENGTH] ' || Text WHERE Tag='LOC_POLICY_RELIGIOUS_ORDERS_NAME' ;
UPDATE LocalizedText SET Text='[ICON_RELIGION][ICON_STRENGTH] ' || Text WHERE Tag='LOC_POLICY_WARS_OF_RELIGION_NAME' ;


-- colonial 
UPDATE LocalizedText SET Text='[ICON_CAPITAL][ICON_FOOD] ' || Text WHERE Tag='LOC_POLICY_COLONIAL_OFFICES_NAME' ;
UPDATE LocalizedText SET Text='[ICON_CAPITAL][ICON_GOLD] ' || Text WHERE Tag='LOC_POLICY_COLONIAL_TAXES_NAME' ;

-- new deal weirdness
UPDATE LocalizedText SET Text='[ICON_HOUSING][ICON_AMENITIES]--[ICON_GOLD] ' || Text WHERE Tag='LOC_POLICY_NEW_DEAL_NAME' ;


-- meritocracy
UPDATE LocalizedText SET Text='[ICON_CULTURE]/[ICON_BULLET] ' || Text WHERE Tag='LOC_POLICY_MERITOCRACY_NAME' ;



-- amenities
UPDATE LocalizedText SET Text='[ICON_AMENITIES] ' || Text WHERE Tag='LOC_POLICY_LIBERALISM_NAME' ;


-- envoys

UPDATE LocalizedText SET Text='[ICON_ENVOY][ICON_SCIENCE][ICON_CULTURE][ICON_GOLD][ICON_FAITH] ' || Text WHERE Tag='LOC_POLICY_RAJ_NAME' ;
UPDATE LocalizedText SET Text='[ICON_ENVOY]+4 ' || Text WHERE Tag='LOC_POLICY_GUNBOAT_DIPLOMACY_NAME' ;
UPDATE LocalizedText SET Text='[ICON_ENVOY][ICON_GOLD] ' || Text WHERE Tag='LOC_POLICY_MERCHANT_CONFEDERATION_NAME' ;
UPDATE LocalizedText SET Text='[ICON_ENVOY][ICON_CULTURE] ' || Text WHERE Tag='LOC_POLICY_COLLECTIVE_ACTIVISM_NAME' ;
UPDATE LocalizedText SET Text='[ICON_ENVOY][ICON_SCIENCE] ' || Text WHERE Tag='LOC_POLICY_INTERNATIONAL_SPACE_AGENCY_NAME' ;
UPDATE LocalizedText SET Text='[ICON_ENVOY]x2 ' || Text WHERE Tag='LOC_POLICY_CONTAINMENT_NAME' ;
UPDATE LocalizedText SET Text='[ICON_ENVOY]+2 ' || Text WHERE Tag='LOC_POLICY_CHARISMATIC_LEADER_NAME' ;


-- spies
UPDATE LocalizedText SET Text='[ICON_RESOURCE_INCENSE]+-[ICON_RESOURCE_INCENSE] ' || Text WHERE Tag='LOC_POLICY_CRYPTOGRAPHY_NAME' ;
UPDATE LocalizedText SET Text='[ICON_RESOURCE_INCENSE][ICON_SCIENCE] ' || Text WHERE Tag='LOC_POLICY_NUCLEAR_ESPIONAGE_NAME' ;
UPDATE LocalizedText SET Text='[ICON_RESOURCE_INCENSE][ICON_PRODUCTION] ' || Text WHERE Tag='LOC_POLICY_MACHIAVELLIANISM_NAME' ;
UPDATE LocalizedText SET Text='[ICON_RESOURCE_INCENSE]--[ICON_AMENITIES] ' || Text WHERE Tag='LOC_POLICY_POLICE_STATE_NAME' ;



-- CIVICS

-- civics that award envoys
UPDATE LocalizedText SET Text=Text || ' [ICON_ENVOY]' WHERE Tag='LOC_CIVIC_MYSTICISM_NAME' ;
UPDATE LocalizedText SET Text=Text || ' [ICON_ENVOY]' WHERE Tag='LOC_CIVIC_MILITARY_TRAINING_NAME' ;
UPDATE LocalizedText SET Text=Text || ' [ICON_ENVOY]' WHERE Tag='LOC_CIVIC_THEOLOGY_NAME' ;
UPDATE LocalizedText SET Text=Text || ' [ICON_ENVOY]' WHERE Tag='LOC_CIVIC_NAVAL_TRADITION_NAME' ;
UPDATE LocalizedText SET Text=Text || ' [ICON_ENVOY]' WHERE Tag='LOC_CIVIC_MERCENARIES_NAME' ;
UPDATE LocalizedText SET Text=Text || ' [ICON_ENVOY]' WHERE Tag='LOC_CIVIC_CONSERVATION_NAME' ;
UPDATE LocalizedText SET Text=Text || ' [ICON_ENVOY]' WHERE Tag='LOC_CIVIC_CULTURAL_HERITAGE_NAME' ;
UPDATE LocalizedText SET Text=Text || ' [ICON_ENVOY]' WHERE Tag='LOC_CIVIC_COLONIALISM_NAME' ;
UPDATE LocalizedText SET Text=Text || ' [ICON_ENVOY]' WHERE Tag='LOC_CIVIC_OPERA_BALLET_NAME' ;
UPDATE LocalizedText SET Text=Text || ' [ICON_ENVOY]' WHERE Tag='LOC_CIVIC_SCORCHED_EARTH_NAME' ;
UPDATE LocalizedText SET Text=Text || ' [ICON_ENVOY]' WHERE Tag='LOC_CIVIC_NATURAL_HISTORY_NAME' ;


-- civics that unlock ruins
UPDATE LocalizedText SET Text=Text || ' [ICON_RESOURCE_ANTIQUITY_SITE]' WHERE Tag='LOC_CIVIC_NATURAL_HISTORY_NAME' ;
UPDATE LocalizedText SET Text=Text || ' [ICON_RESOURCE_SHIPWRECK][ICON_GreatWork_Artifact]' WHERE Tag='LOC_CIVIC_CULTURAL_HERITAGE_NAME' ;


-- combat bonuses
UPDATE LocalizedText SET Text=Text || ' [ICON_STRENGTH]' WHERE Tag='LOC_CIVIC_MILITARY_TRADITION_NAME' ;


-- spies
UPDATE LocalizedText SET Text=Text || ' [ICON_RESOURCE_INCENSE]' WHERE Tag='LOC_CIVIC_DIPLOMATIC_SERVICE_NAME' ;
UPDATE LocalizedText SET Text=Text || ' [ICON_RESOURCE_INCENSE][ICON_STRENGTH]' WHERE Tag='LOC_CIVIC_NATIONALISM_NAME' ;
UPDATE LocalizedText SET Text=Text || ' [ICON_RESOURCE_INCENSE]' WHERE Tag='LOC_CIVIC_IDEOLOGY_NAME' ;
UPDATE LocalizedText SET Text=Text || ' [ICON_RESOURCE_INCENSE]' WHERE Tag='LOC_CIVIC_COLD_WAR_NAME' ;


-- anti-religious tourism
UPDATE LocalizedText SET Text=Text || ' [ICON_RELIGION]' WHERE Tag='LOC_CIVIC_THE_ENLIGHTENMENT_NAME' ;


-- resource bonuses
UPDATE LocalizedText SET Text=Text || ' [ICON_RESOURCE_SHEEP][ICON_FOOD]' WHERE Tag='LOC_CIVIC_EXPLORATION_NAME' ;
UPDATE LocalizedText SET Text=Text || ' [ICON_RESOURCE_FURS][ICON_GOLD]' WHERE Tag='LOC_CIVIC_MERCANTILISM_NAME' ;
UPDATE LocalizedText SET Text=Text || ' [ICON_RESOURCE_CITRUS][ICON_GOLD]' WHERE Tag='LOC_CIVIC_GLOBALIZATION_NAME' ;



-- assorted
UPDATE LocalizedText SET Text=Text || ' [ICON_STRENGTH]' WHERE Tag='LOC_CIVIC_MOBILIZATION_NAME' ;

UPDATE LocalizedText SET Text=Text || ' [ICON_TURN]' WHERE Tag='LOC_CIVIC_RAPID_DEPLOYMENT_NAME' ;






-- TECHS

UPDATE LocalizedText SET Text=Text || ' [ICON_RESOURCE_WHEAT][ICON_RESOURCE_RICE]' WHERE Tag='LOC_TECH_POTTERY_NAME' ;
UPDATE LocalizedText SET Text=Text || ' [ICON_RESOURCE_CATTLE][ICON_RESOURCE_SHEEP]' WHERE Tag='LOC_TECH_ANIMAL_HUSBANDRY_NAME' ; 
UPDATE LocalizedText SET Text=Text || ' [ICON_RESOURCE_COPPER]' WHERE Tag='LOC_TECH_MINING_NAME' ; 
UPDATE LocalizedText SET Text=Text || ' [ICON_GOLD][ICON_MOVEMENT]' WHERE Tag='LOC_TECH_SAILING_NAME' ; 
UPDATE LocalizedText SET Text=Text || ' [ICON_MOVEMENT]' WHERE Tag='LOC_TECH_ASTROLOGY_NAME' ;
UPDATE LocalizedText SET Text=Text || ' [ICON_FOOD]' WHERE Tag='LOC_TECH_IRRIGATION_NAME' ; 
UPDATE LocalizedText SET Text=Text || ' [ICON_RESOURCE_FISH][ICON_PRODUCTION]' WHERE Tag='LOC_TECH_CELESTIAL_NAVIGATION_NAME' ; 
UPDATE LocalizedText SET Text=Text || ' [ICON_RESOURCE_STONE]' WHERE Tag='LOC_TECH_MASONRY_NAME' ; 
UPDATE LocalizedText SET Text=Text || ' [ICON_RESOURCE_IRON]' WHERE Tag='LOC_TECH_BRONZE_WORKING_NAME' ; 
UPDATE LocalizedText SET Text=Text || ' [ICON_MOVEMENT]' WHERE Tag='LOC_TECH_SHIPBUILDING_NAME' ; 
UPDATE LocalizedText SET Text=Text || ' [ICON_MOVEMENT]' WHERE Tag='LOC_TECH_MATHEMATICS_NAME' ; 
UPDATE LocalizedText SET Text=Text || ' [ICON_PRODUCTION]' WHERE Tag='LOC_TECH_APPRENTICESHIP_NAME' ;
UPDATE LocalizedText SET Text=Text || ' [ICON_RESOURCE_FISH][ICON_GOLD][ICON_MOVEMENT]' WHERE Tag='LOC_TECH_CARTOGRAPHY_NAME' ;
UPDATE LocalizedText SET Text=Text || ' [ICON_TOURISM][ICON_GreatWork_Writing]' WHERE Tag='LOC_TECH_PRINTING_NAME' ;
UPDATE LocalizedText SET Text=Text || ' [ICON_RESOURCE_MARBLE][ICON_GOLD]' WHERE Tag='LOC_TECH_BANKING_NAME' ;
UPDATE LocalizedText SET Text=Text || ' [ICON_PRODUCTION]' WHERE Tag='LOC_TECH_INDUSTRIALIZATION_NAME' ;
UPDATE LocalizedText SET Text=Text || ' [ICON_RESOURCE_CITRUS][ICON_FOOD]' WHERE Tag='LOC_TECH_SCIENTIFIC_THEORY_NAME' ;
UPDATE LocalizedText SET Text=Text || ' [ICON_MOVEMENT]' WHERE Tag='LOC_TECH_STEAM_POWER_NAME' ;
UPDATE LocalizedText SET Text=Text || ' [ICON_TOURISM]' WHERE Tag='LOC_TECH_FLIGHT_NAME' ;
UPDATE LocalizedText SET Text=Text || ' [ICON_FOOD]' WHERE Tag='LOC_TECH_REPLACEABLE_PARTS_NAME' ;
UPDATE LocalizedText SET Text=Text || ' [ICON_PRODUCTION]' WHERE Tag='LOC_TECH_STEEL_NAME' ;
UPDATE LocalizedText SET Text=Text || ' [ICON_MOVEMENT]' WHERE Tag='LOC_TECH_COMBUSTION_NAME' ;
UPDATE LocalizedText SET Text=Text || ' [ICON_RESOURCE_STONE][ICON_PRODUCTION]' WHERE Tag='LOC_TECH_ROCKETRY_NAME' ;
UPDATE LocalizedText SET Text=Text || ' [ICON_RESOURCE_FISH][ICON_FOOD]' WHERE Tag='LOC_TECH_PLASTICS_NAME' ;
UPDATE LocalizedText SET Text=Text || ' [ICON_RESOURCE_INCENSE][ICON_TOURISM]' WHERE Tag='LOC_TECH_COMPUTERS_NAME' ;
UPDATE LocalizedText SET Text=Text || ' [ICON_RESOURCE_FURS][ICON_GOLD]' WHERE Tag='LOC_TECH_SYNTHETIC_MATERIALS_NAME' ;
UPDATE LocalizedText SET Text=Text || ' [ICON_RESOURCE_SHEEP][ICON_PRODUCTION]' WHERE Tag='LOC_TECH_ROBOTICS_NAME' ;








