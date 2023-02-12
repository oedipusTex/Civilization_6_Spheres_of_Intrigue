/*
    Created by Quo
	ABOUT THIS FILE

	This file is allows you to add your own custom text to the Character Select screen. To do this, you will need to create a new row for every civilization/leader combo the text should apply to. 
	Examine the Config\Quo_Config.sql file to see examples of how to configure a Biome/Sphere description.
*/
 

-- BEGIN YOUR EDITS HERE

-- SPHERES
-- Use this statement to insert Biome/Spheres to the player select screen for player-made civilizations.  
INSERT INTO PlayerItems 
		(Domain,CivilizationType,LeaderType,Type,Name,Description,Icon,SortIndex)
VALUES ('Players:Expansion2_Players', 'CIVILIZATION_SUK_ICELAND', 'LEADER_SUK_INGOLFUR', 'QUO_TRAIT_BIOME_BOREAL_EUROPE', 'LOC_QUO_TRAIT_BIOME_BOREAL_EUROPE_NAME', 'LOC_QUO_TRAIT_BIOME_BOREAL_EUROPE_DESCRIPTION', 'ICON_UNIT_NORWEGIAN_BERSERKER', 5);

-- FRIENDSHIP GIFTS
-- Use this Insert statement to add Friendship gifts descriptions to the player select screen for player-made civilizations
INSERT INTO PlayerItems 
		(Domain,CivilizationType,LeaderType,Type,Name,Description,Icon,SortIndex)
VALUES ('Players:Expansion2_Players', 'CIVILIZATION_SUK_ICELAND', 'LEADER_SUK_INGOLFUR', 'QUO_TRAIT_FRIENDS_ICELAND', 'LOC_QUO_TRAIT_FRIEND_GIFT_NAME', 'LOC_QUO_TRAIT_FRIENDS_ICELAND_DESCRIPTION', 'ICON_UNIT_SUMERIAN_WAR_CART', 5) ;


-- GOVERNORS
INSERT INTO PlayerItems 
		(Domain,CivilizationType,LeaderType,Type,Name,Description,Icon,SortIndex)
VALUES	('Players:Expansion2_Players', 'CIVILIZATION_SUK_ICELAND', 'LEADER_SUK_INGOLFUR', 'QUO_TRAIT_BIOME_BOREAL_EUROPE_GOV', 'LOC_QUO_TRAIT_BIOME_GOVERNORS_NAME', 'LOC_QUO_TRAIT_BIOME_BOREAL_EUROPE_GOV_DESCRIPTION', 'ICON_UNIT_NORWEGIAN_BERSERKER', 5) ;

 



