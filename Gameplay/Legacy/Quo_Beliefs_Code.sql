/*
    Created by Quo
*/

 
-- UPDATE THE LOGS
INSERT INTO tblQuoDebug 
	(DebugID, 		x_Open, x_Close, 	Message)
VALUES ('Quo_Beliefs_Code',	'1',	'0',		'') ;



-- select code for reviewing belief changes

/*
select * from beliefs
inner join beliefmodifiers on beliefmodifiers.BeliefType = beliefs.BeliefType
inner join modifierarguments as MA1 on ma1.ModifierId = beliefmodifiers.ModifierID
inner join modifiers on MA1.Value = modifiers.ModifierId
inner join modifierarguments as MA2 on MA2.ModifierId = MA1.Value
*/

/*
select * from beliefs
inner join beliefmodifiers on beliefmodifiers.BeliefType = beliefs.BeliefType
inner join modifierarguments as MA1 on ma1.ModifierId = beliefmodifiers.ModifierID
inner join modifiers on MA1.Value = modifiers.ModifierId
left join modifierarguments as Ma2 on Ma2.ModifierId = MA1.Value
left join requirementsets on requirementsets.RequirementSetId = modifiers.SubjectRequirementSetId
left join requirementsetrequirements on requirementsetrequirements.RequirementSetId = requirementsets.RequirementSetId
left join requirementarguments on requirementarguments.RequirementId = requirementsetrequirements.RequirementId 
*/



-- MONUMENT TO THE GODS

-- Increase wonder discount to 30%

/* CREATE TEMPORARY TABLE Quo_Tbl_Monument_to_the_Gods_Wonders AS SELECT DISTINCT modifierarguments.ModifierId
                                                                 FROM modifierarguments
                                                                      INNER JOIN
                                                                      beliefmodifiers ON beliefmodifiers.ModifierID = modifierarguments.ModifierId
                                                                WHERE beliefmodifiers.belieftype = 'BELIEF_MONUMENT_TO_THE_GODS' ;

UPDATE ModifierArguments
   SET Value = '30'
 WHERE ModifierArguments.ModifierId IN Quo_Tbl_Monument_to_the_Gods_Wonders AND ModifierArguments.Name='Amount'; */

INSERT INTO Modifiers 
	(ModifierId, ModifierType, RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
VALUES	('QUO_PANTHEON_FREE_RELIC_PLAYER', 'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER', 1, 1, NULL, 'PLAYER_HAS_PANTHEON_REQUIREMENTS') ,
		('QUO_PANTHEON_FREE_RELIC',			'MODIFIER_PLAYER_GRANT_RELIC',	 	0,			0,			NULL, NULL) ;

INSERT INTO ModifierArguments
	(ModifierId, 			Name, 		Type, 			Value, 			Extra, 	SecondExtra)
VALUES	('QUO_PANTHEON_FREE_RELIC_PLAYER', 		'ModifierId', 	'ARGTYPE_IDENTITY', 		'QUO_PANTHEON_FREE_RELIC',			NULL, 	NULL) ,
		('QUO_PANTHEON_FREE_RELIC', 		'Amount', 	'ARGTYPE_IDENTITY', 		'1',			NULL, 	NULL) ;

INSERT INTO BeliefModifiers
	(BeliefType, 			ModifierID)
VALUES	('BELIEF_MONUMENT_TO_THE_GODS',	'QUO_PANTHEON_FREE_RELIC_PLAYER')  ;
 
 

-- GOD OF THE SEA

-- Increase yield from Fishing Boats to +2
-- Coded out for balance reasons
-- UPDATE ModifierArguments SET Value='2' WHERE ModifierId='GOD_OF_THE_SEA_FISHINGBOATS_PRODUCTION_MODIFIER' AND Name='Amount' ;


-- Increase production of Harbors 
INSERT INTO Modifiers 
	(ModifierId, ModifierType, RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
VALUES	('QUO_GOD_OF_THE_SEA_BONUS_HARBOR', 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER', 0, 0, NULL, 'CITY_FOLLOWS_PANTHEON_REQUIREMENTS'),
		('QUO_GOD_OF_THE_SEA_BONUS_HARBOR_2', 'MODIFIER_SINGLE_CITY_ADJUST_DISTRICT_PRODUCTION_MODIFIER', 0, 0, NULL, NULL) ;


INSERT INTO ModifierArguments
	(ModifierId, 			Name, 			Type, 			Value, 				Extra, 	SecondExtra)
VALUES	('QUO_GOD_OF_THE_SEA_BONUS_HARBOR', 	'ModifierId', 		'ARGTYPE_IDENTITY', 	'QUO_GOD_OF_THE_SEA_BONUS_HARBOR_2',	NULL, 	NULL) ,
	('QUO_GOD_OF_THE_SEA_BONUS_HARBOR_2', 	'Amount', 		'ARGTYPE_IDENTITY', 	'20',				NULL, 	NULL) ,  
	('QUO_GOD_OF_THE_SEA_BONUS_HARBOR_2', 	'DistrictType', 	'ARGTYPE_IDENTITY', 	'DISTRICT_HARBOR',	NULL, 	NULL)  ;



INSERT INTO BeliefModifiers
	(BeliefType, 			ModifierID)
VALUES	('BELIEF_GOD_OF_THE_SEA',	'QUO_GOD_OF_THE_SEA_BONUS_HARBOR');






-- GODDESS OF THE HUNT

-- Ranged units receive 25% more experience


INSERT INTO RequirementSets 
	(RequirementSetId, 		RequirementSetType)
VALUES 	('QUO_REQSET_BELIEF_GODDESS_HUNT_RANGED', 	'REQUIREMENTSET_TEST_ALL') ;

INSERT INTO RequirementSetRequirements
	(RequirementSetId,	RequirementId)
VALUES	('QUO_REQSET_BELIEF_GODDESS_HUNT_RANGED', 	'REQUIREMENT_UNIT_IS_RANGED') ;


INSERT INTO Modifiers 
	(ModifierId, ModifierType, RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
VALUES	('QUO_GODDESS_HUNT', 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER', 0, 0, NULL, 'CITY_FOLLOWS_PANTHEON_REQUIREMENTS'),
	('QUO_GODDESS_HUNT_2', 'MODIFIER_CITY_TRAINED_UNITS_ADJUST_XP_BONUS', 0, 0, NULL, 'QUO_REQSET_BELIEF_GODDESS_HUNT_RANGED') ;


INSERT INTO ModifierArguments
	(ModifierId, 			Name, 			Type, 			Value, 				Extra, 	SecondExtra)
VALUES	('QUO_GODDESS_HUNT', 	'ModifierId', 		'ARGTYPE_IDENTITY', 	'QUO_GODDESS_HUNT_2',		NULL, 	NULL) ,
	('QUO_GODDESS_HUNT_2', 	'Amount', 		'ARGTYPE_IDENTITY', 	'25',				NULL, 	NULL)  ;
	


INSERT INTO BeliefModifiers
	(BeliefType, 			ModifierID)
VALUES	('BELIEF_GODDESS_OF_THE_HUNT',	'QUO_GODDESS_HUNT');




-- GOD OF CRAFTSMEN

-- Increase yield

UPDATE ModifierArguments SET Value='2' WHERE ModifierId='GOD_OF_CRAFTSMEN_STRATEGIC_MINE_PRODUCTION_MODIFIER' AND Name='Amount' ;


-- Reveal Iron and Niter

INSERT INTO Modifiers 
	(ModifierId, ModifierType, RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
VALUES	('QUO_PANTHEON_REVEAL_IRON', 	'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER', 	0, 		0, 		NULL,			'PLAYER_HAS_PANTHEON_REQUIREMENTS'),
	('QUO_PANTHEON_REVEAL_IRON_2',	 'MODIFIER_PLAYER_GRANT_FREE_RESOURCE_VISIBILITY', 1, 1, NULL, NULL) ,
	('QUO_PANTHEON_REVEAL_NITER', 	'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER', 	0, 		0, 		NULL,			'PLAYER_HAS_PANTHEON_REQUIREMENTS'),
	('QUO_PANTHEON_REVEAL_NITER_2',	 'MODIFIER_PLAYER_GRANT_FREE_RESOURCE_VISIBILITY', 1, 1, NULL, NULL);


INSERT INTO ModifierArguments
	(ModifierId, 			Name, 			Type, 			Value, 		Extra, 	SecondExtra)
VALUES	('QUO_PANTHEON_REVEAL_IRON', 	'ModifierId', 	'ARGTYPE_IDENTITY', 	'QUO_PANTHEON_REVEAL_IRON_2',		NULL, 	NULL),
	('QUO_PANTHEON_REVEAL_IRON_2', 	'ResourceType', 'ARGTYPE_IDENTITY', 	'RESOURCE_IRON',		NULL, 	NULL) ,
	('QUO_PANTHEON_REVEAL_NITER', 	'ModifierId', 	'ARGTYPE_IDENTITY', 	'QUO_PANTHEON_REVEAL_NITER_2',		NULL, 	NULL),
	('QUO_PANTHEON_REVEAL_NITER_2', 	'ResourceType', 'ARGTYPE_IDENTITY', 	'RESOURCE_NITER',		NULL, 	NULL) ;


INSERT INTO BeliefModifiers
	(BeliefType, 			ModifierID)
VALUES	('BELIEF_GOD_OF_CRAFTSMEN',	'QUO_PANTHEON_REVEAL_IRON') ,
	('BELIEF_GOD_OF_CRAFTSMEN',	'QUO_PANTHEON_REVEAL_NITER') ;




-- RELIGIOUS IDOLS	

-- Receive free gold

INSERT INTO Modifiers 
	(ModifierId, ModifierType, RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
VALUES	('QUO_FREE_PANTHEON_GOLD', 	'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER', 	1, 		1, 		NULL,			'PLAYER_HAS_PANTHEON_REQUIREMENTS'),
	('QUO_FREE_PANTHEON_GOLD_2', 'MODIFIER_PLAYER_GRANT_YIELD', 0, 0, NULL, NULL) ;


INSERT INTO ModifierArguments
	(ModifierId, 			Name, 			Type, 			Value, 		Extra, 	SecondExtra)
VALUES	('QUO_FREE_PANTHEON_GOLD', 	'ModifierId', 	'ARGTYPE_IDENTITY', 	'QUO_FREE_PANTHEON_GOLD_2',		NULL, 	NULL),
	('QUO_FREE_PANTHEON_GOLD_2', 	'Amount', 	'ScaleByGameSpeed', 	'400',		NULL, 	NULL),
	('QUO_FREE_PANTHEON_GOLD_2', 	'YieldType', 	'ARGTYPE_IDENTITY', 	'YIELD_GOLD',	NULL, 	NULL)  ;


INSERT INTO BeliefModifiers
	(BeliefType, 			ModifierID)
VALUES	('BELIEF_RELIGIOUS_IDOLS',	'QUO_FREE_PANTHEON_GOLD')  ;








-- RELIGIOUS SETTLEMENTS


-- Increase speed of border pops 
UPDATE ModifierArguments SET Value='150' WHERE ModifierID='RELIGIOUS_SETTLEMENTS_CULTUREBORDER' AND Name='Amount';


-- Add a Trade Route

INSERT INTO Modifiers
	(ModifierID, 			ModifierType, 					RunOnce, 	Permanent, 	OwnerRequirementSetId, 	SubjectRequirementSetId)
VALUES	('QUO_BELIEF_EXTRA_TRADERS', 	'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER', 	0, 		0, 		NULL,			'PLAYER_HAS_PANTHEON_REQUIREMENTS'),
	('QUO_BELIEF_EXTRA_TRADERS_2', 	'MODIFIER_PLAYER_ADJUST_TRADE_ROUTE_CAPACITY', 	1, 		1, 		NULL,			NULL)  ;


INSERT INTO ModifierArguments
	(ModifierID,			Name,		Type, 				Value,				Extra)
VALUES	('QUO_BELIEF_EXTRA_TRADERS', 	'ModifierId', 	'ARGTYPE_IDENTITY', 		'QUO_BELIEF_EXTRA_TRADERS_2',	NULL) ,
	('QUO_BELIEF_EXTRA_TRADERS_2', 	'Amount', 	'ARGTYPE_IDENTITY', 		'1',				NULL) ;


INSERT INTO BeliefModifiers
	(BeliefType, 				ModifierID)
VALUES	('BELIEF_RELIGIOUS_SETTLEMENTS',	'QUO_BELIEF_EXTRA_TRADERS') ;





-- RIVER GODDESS




-- Updated in v5.0.8 

-- Require a city center instead of a Holy Site, removed in v5.0.8 
--DELETE FROM RequirementSetRequirements WHERE RequirementSetId='PLOT_HAS_HOLY_SITE_RIVER_REQUIREMENTS' AND RequirementId='REQUIRES_PLOT_HAS_HOLY_SITE' ;


/* INSERT INTO Requirements
	(RequirementId, 		RequirementType, 	Likeliness,		Inverse, 	Triggered)
VALUES	('QUO_REQ_PLOT_HAS_CITY_CENTER', 	'REQUIREMENT_PLOT_DISTRICT_TYPE_MATCHES',	0,0,0) ;


INSERT INTO RequirementArguments 
	(RequirementId,			Name, 			Type, 			Value, 				Extra, 	SecondExtra)
VALUES 	('QUO_REQ_PLOT_HAS_CITY_CENTER',	'DistrictType',		'ARGTYPE_IDENTITY',	'DISTRICT_CITY_CENTER',	NULL,	NULL 	) ;


INSERT INTO RequirementSetRequirements
	(RequirementSetId, 				RequirementId)
VALUES	('PLOT_HAS_HOLY_SITE_RIVER_REQUIREMENTS', 	'QUO_REQ_PLOT_HAS_CITY_CENTER') ;
 */
 
 


 

-- Add a minor adjacency bonus for Holy Sites on rivers
INSERT INTO Modifiers 
	(ModifierId, 	ModifierType, 	RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
VALUES		('QUO_BELIEF_RIVER_HOLY_SITE_ALL', 	'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER', 	0, 		0, 		NULL,			'PLAYER_HAS_PANTHEON_REQUIREMENTS'),
			('QUO_BELIEF_RIVER_HOLY_SITE', 	'MODIFIER_PLAYER_CITIES_RIVER_ADJACENCY', 0, 0, NULL, NULL) ;


-- Note this just reuses the text for the Khmer river adjacenc, since they are the same
INSERT INTO ModifierArguments
	(ModifierId, 			Name, 		Type, 			Value, 					Extra, 	SecondExtra)
VALUES	 ('QUO_BELIEF_RIVER_HOLY_SITE_ALL', 	'ModifierId', 	'ARGTYPE_IDENTITY', 		'QUO_BELIEF_RIVER_HOLY_SITE',	NULL, NULL) ,
('QUO_BELIEF_RIVER_HOLY_SITE', 	'Amount', 	'ARGTYPE_IDENTITY', 	'1',					NULL, 	NULL) ,	
	('QUO_BELIEF_RIVER_HOLY_SITE', 	'Description', 	'ARGTYPE_IDENTITY', 	'QUO_KHMER_RIVER_HOLY_ADJ',		NULL, 	NULL) ,
	('QUO_BELIEF_RIVER_HOLY_SITE', 	'DistrictType', 	'ARGTYPE_IDENTITY', 	'DISTRICT_HOLY_SITE',		NULL, 	NULL) ,
	('QUO_BELIEF_RIVER_HOLY_SITE', 	'YieldType', 	'ARGTYPE_IDENTITY', 	'YIELD_FAITH',		NULL, 	NULL) ;
 
INSERT INTO BeliefModifiers
	(BeliefType, 				ModifierID)
VALUES	('BELIEF_RIVER_GODDESS',	'QUO_BELIEF_RIVER_HOLY_SITE_ALL') ;
 
 
 


-- GODDESS OF FESTIVALS AND ORAL TRADITION
-- Give the bonus to any Plantation rather than the short list

-- Code below is commented out because it has moved to the Rules file so it can be used with Aqueducts as well
/*
INSERT INTO TypeTags
	(Type, 	Tag)
VALUES	('RESOURCE_BANANAS', 'CLASS_GODDESS_OF_FESTIVALS') ,
	('RESOURCE_CITRUS', 'CLASS_GODDESS_OF_FESTIVALS') ,
	('RESOURCE_COTTON', 'CLASS_GODDESS_OF_FESTIVALS') ,
	('RESOURCE_DYES', 'CLASS_GODDESS_OF_FESTIVALS') ,
	('RESOURCE_SILK', 'CLASS_GODDESS_OF_FESTIVALS') ,
	('RESOURCE_SPICES', 'CLASS_GODDESS_OF_FESTIVALS'),
	('RESOURCE_SUGAR', 'CLASS_GODDESS_OF_FESTIVALS' ) ;
*/


-- Update Goddess of Festivals to read from the list of all plantations rather than a subset

UPDATE RequirementArguments SET Value='CLASS_GODDESS_OF_FESTIVALS' WHERE Name='Tag' AND RequirementId='REQUIRES_PLOT_HAS_TAG_ORAL_TRADITION' ;

-- Coded out for balance reasons
-- UPDATE ModifierArguments SET Value='2' WHERE ModifierId='GODDESS_OF_FESTIVALS_PLANTATION_TAG_FOOD_MODIFIER' AND Name='Amount' ;


-- Boost Oral Tradition to +2 cult, removed in v3.1
-- UPDATE ModifierArguments SET Value='2' WHERE ModifierId='ORAL_TRADITION_PLANTATION_TAG_CULTURE_MODIFIER' AND Name='Amount' ;


INSERT INTO Modifiers 
	(ModifierId, ModifierType, RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
VALUES 	('QUO_ORAL_TRADITION_BONUS_TILES', 	'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER', 0, 0, NULL, 'PLAYER_HAS_PANTHEON_REQUIREMENTS'),
	('QUO_ORAL_TRADITION_BONUS_TILES_2', 'MODIFIER_PLAYER_ADJUST_CITY_TILES', 0, 0, NULL, NULL) ;


INSERT INTO ModifierArguments
	(ModifierId, 			Name, 	Type,	 	Value, 			Extra, 	SecondExtra)
VALUES	('QUO_ORAL_TRADITION_BONUS_TILES', 	'ModifierId', 	'ARGTYPE_IDENTITY', 	'QUO_ORAL_TRADITION_BONUS_TILES_2',	NULL, 	NULL) ,
	('QUO_ORAL_TRADITION_BONUS_TILES_2', 	'Amount', 	'ARGTYPE_IDENTITY', 	'3',		NULL, 	NULL) ;


INSERT INTO BeliefModifiers
	(BeliefType, 			ModifierID)
VALUES	('BELIEF_ORAL_TRADITION',	'QUO_ORAL_TRADITION_BONUS_TILES') ;



-- Oral Tradition increases value of boosts by a small amount
-- Doesnt seem to like boost amounts lower than 5, which is a bummer. Coded out and replaced with tile bursting on founding a city.

/*
INSERT INTO Modifiers 
	(ModifierId, ModifierType, RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
VALUES	('QUO_ORAL_TRADITION_BOOST_CIVIC', 	'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER', 0, 0, NULL, 'PLAYER_HAS_PANTHEON_REQUIREMENTS'),
	('QUO_ORAL_TRADITION_BOOST_CIVIC_2',	 'MODIFIER_PLAYER_ADJUST_CIVIC_BOOST', 0, 0, NULL, NULL) ;


INSERT INTO ModifierArguments
	(ModifierId, 			Name, 		Type, 			Value, 			Extra, 	SecondExtra)
VALUES	('QUO_ORAL_TRADITION_BOOST_CIVIC', 	'ModifierId', 	'ARGTYPE_IDENTITY', 	'QUO_ORAL_TRADITION_BOOST_CIVIC_2',	NULL, 	NULL) ,
	('QUO_ORAL_TRADITION_BOOST_CIVIC_2', 	'Amount',	 'ARGTYPE_IDENTITY', 	'3',			NULL, 	NULL) ;


INSERT INTO BeliefModifiers
	(BeliefType, 			ModifierID)
VALUES	('BELIEF_ORAL_TRADITION',	'QUO_ORAL_TRADITION_BOOST_CIVIC') ;
*/



-- Goddess of Festivals also increases production speed of entertainment districts

INSERT INTO Modifiers 
	(ModifierId, ModifierType, RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
VALUES	('QUO_GODDESS_OF_FESTIVALS_ENTERTAIN', 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER', 0, 0, NULL, 'CITY_FOLLOWS_PANTHEON_REQUIREMENTS'),
	('QUO_GODDESS_OF_FESTIVALS_ENTERTAIN_2', 'MODIFIER_SINGLE_CITY_ADJUST_DISTRICT_PRODUCTION_MODIFIER', 0, 0, NULL, NULL),
	('QUO_GODDESS_OF_FESTIVALS_CARNIVAL', 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER', 0, 0, NULL, 'CITY_FOLLOWS_PANTHEON_REQUIREMENTS'),
	('QUO_GODDESS_OF_FESTIVALS_CARNIVAL_2', 'MODIFIER_SINGLE_CITY_ADJUST_DISTRICT_PRODUCTION_MODIFIER', 0, 0, NULL, NULL) ;


INSERT INTO ModifierArguments
	(ModifierId, 			Name, 			Type, 			Value, 				Extra, 	SecondExtra)
VALUES	('QUO_GODDESS_OF_FESTIVALS_ENTERTAIN', 		'ModifierId', 		'ARGTYPE_IDENTITY', 	'QUO_GODDESS_OF_FESTIVALS_ENTERTAIN_2',	NULL, 	NULL) ,
	('QUO_GODDESS_OF_FESTIVALS_ENTERTAIN_2', 	'Amount', 		'ARGTYPE_IDENTITY', 	'40',				NULL, 	NULL) ,  
	('QUO_GODDESS_OF_FESTIVALS_ENTERTAIN_2', 	'DistrictType', 	'ARGTYPE_IDENTITY', 	'DISTRICT_ENTERTAINMENT_COMPLEX',	NULL, 	NULL) ,
	('QUO_GODDESS_OF_FESTIVALS_CARNIVAL', 		'ModifierId', 		'ARGTYPE_IDENTITY', 	'QUO_GODDESS_OF_FESTIVALS_CARNIVAL_2',	NULL, 	NULL) ,
	('QUO_GODDESS_OF_FESTIVALS_CARNIVAL_2', 	'Amount', 		'ARGTYPE_IDENTITY', 	'40',				NULL, 	NULL) ,  
	('QUO_GODDESS_OF_FESTIVALS_CARNIVAL_2', 	'DistrictType', 	'ARGTYPE_IDENTITY', 	'DISTRICT_STREET_CARNIVAL',	NULL, 	NULL) ;






INSERT INTO BeliefModifiers
	(BeliefType, 			ModifierID)
VALUES	('BELIEF_GODDESS_OF_FESTIVALS',	'QUO_GODDESS_OF_FESTIVALS_ENTERTAIN'),
	('BELIEF_GODDESS_OF_FESTIVALS',	'QUO_GODDESS_OF_FESTIVALS_CARNIVAL') ;





-- GOD OF OPEN SKY

-- Allow Scouts to enter closed borders


-- Modifier for the unit

-- Changed to +25% xp for light cavalry in R&F
/* INSERT INTO Modifiers 
	(ModifierId, 	ModifierType, 	RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
VALUES	('QUO_MOD_SCOUTS_IGNORE_BORDERS_UNIT', 	'MODIFIER_PLAYER_UNIT_ADJUST_ENTER_FOREIGN_LANDS', 0, 0, NULL, NULL) ;


INSERT INTO ModifierArguments
	(ModifierId, 			Name, 		Type, 			Value, 			Extra, 	SecondExtra)
VALUES	('QUO_MOD_SCOUTS_IGNORE_BORDERS_UNIT', 	'Enter', 	'ARGTYPE_IDENTITY', 	'1',			NULL, 	NULL) ;



-- Modifiers for the belief
INSERT INTO Modifiers 
	(ModifierId, 	ModifierType, 	RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
VALUES	('QUO_MOD_SCOUTS_IGNORE_BORDERS', 	'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER', 0, 0, NULL, 'PLAYER_HAS_PANTHEON_REQUIREMENTS') ,
	('QUO_MOD_SCOUTS_IGNORE_BORDERS_2', 	'MODIFIER_PLAYER_UNITS_ATTACH_MODIFIER', 0, 0, NULL, 'SURVEY_RECONUNITEXPERIENCE_REQUIREMENTS') ;


INSERT INTO ModifierArguments
	(ModifierId, 			Name, 		Type, 			Value, 			Extra, 	SecondExtra)
VALUES	('QUO_MOD_SCOUTS_IGNORE_BORDERS', 	'ModifierId', 	'ARGTYPE_IDENTITY', 	'QUO_MOD_SCOUTS_IGNORE_BORDERS_2',			NULL, 	NULL),
	('QUO_MOD_SCOUTS_IGNORE_BORDERS_2', 	'ModifierId', 	'ARGTYPE_IDENTITY', 	'QUO_MOD_SCOUTS_IGNORE_BORDERS_UNIT',			NULL, 	NULL) ;



INSERT INTO BeliefModifiers
	(BeliefType, 		ModifierId)
VALUES	('BELIEF_GOD_OF_THE_OPEN_SKY',	'QUO_MOD_SCOUTS_IGNORE_BORDERS') ; */

INSERT INTO RequirementSets 
	(RequirementSetId, 		RequirementSetType)
VALUES 	('QUO_REQSET_BELIEF_GOD_OPEN_SKY_CAVALRY', 	'REQUIREMENTSET_TEST_ALL') ;

INSERT INTO RequirementSetRequirements
	(RequirementSetId,	RequirementId)
VALUES	('QUO_REQSET_BELIEF_GOD_OPEN_SKY_CAVALRY', 	'REQUIREMENT_UNIT_IS_SIEGE') ;


INSERT INTO Modifiers 
	(ModifierId, ModifierType, RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
VALUES	('QUO_GOD_OPEN_SKY', 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER', 0, 0, NULL, 'CITY_FOLLOWS_PANTHEON_REQUIREMENTS'),
	('QUO_GOD_OPEN_SKY_2', 'MODIFIER_CITY_TRAINED_UNITS_ADJUST_XP_BONUS', 0, 0, NULL, 'QUO_REQSET_BELIEF_GOD_OPEN_SKY_CAVALRY') ;


INSERT INTO ModifierArguments
	(ModifierId, 			Name, 			Type, 			Value, 				Extra, 	SecondExtra)
VALUES	('QUO_GOD_OPEN_SKY', 	'ModifierId', 		'ARGTYPE_IDENTITY', 	'QUO_GOD_OPEN_SKY_2',		NULL, 	NULL) ,
	('QUO_GOD_OPEN_SKY_2', 	'Amount', 		'ARGTYPE_IDENTITY', 	'25',				NULL, 	NULL)  ;
	


INSERT INTO BeliefModifiers
	(BeliefType, 			ModifierID)
VALUES	('BELIEF_GOD_OF_THE_OPEN_SKY',	'QUO_GOD_OPEN_SKY');





-- FERTILITY RITES

-- Free food in the Capital

INSERT INTO Modifiers
	(ModifierID, 				ModifierType, 					RunOnce, 	Permanent, 	OwnerRequirementSetId, 	SubjectRequirementSetId)
VALUES	('QUO_BELIEF_EXTRA_FOOD_IN_CAPITAL', 	'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER', 	0, 		0, 		NULL,		'PLAYER_HAS_PANTHEON_REQUIREMENTS'),
	('QUO_BELIEF_EXTRA_FOOD_IN_CAPITAL_2', 	'MODIFIER_PLAYER_CAPITAL_CITY_ADJUST_CITY_YIELD_CHANGE', 	0, 		0, 		NULL,			NULL)  ;


INSERT INTO ModifierArguments
	(ModifierID,			Name,		Type, 				Value,				Extra)
VALUES	('QUO_BELIEF_EXTRA_FOOD_IN_CAPITAL', 	'ModifierId', 	'ARGTYPE_IDENTITY', 		'QUO_BELIEF_EXTRA_FOOD_IN_CAPITAL_2',	NULL) ,
	('QUO_BELIEF_EXTRA_FOOD_IN_CAPITAL_2', 	'YieldType', 	'ARGTYPE_IDENTITY', 		'YIELD_FOOD',		NULL) ,
	('QUO_BELIEF_EXTRA_FOOD_IN_CAPITAL_2', 	'Amount', 	'ARGTYPE_IDENTITY', 		'2',				NULL) ;


INSERT INTO BeliefModifiers
	(BeliefType, 				ModifierId)
VALUES	('BELIEF_FERTILITY_RITES',		'QUO_BELIEF_EXTRA_FOOD_IN_CAPITAL') ;




-- STONE CIRCLES

-- Build Stonehenge super fast

-- Removed in R&F. Provides free Ancient Bedrock. See the Siege file for relevant code.

/* INSERT INTO Modifiers 
	(ModifierId, ModifierType, RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
VALUES	('QUO_STONE_CIRCLES_STONEHENGE',	'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER', 0, 0, NULL, 'PLAYER_HAS_PANTHEON_REQUIREMENTS'),
	('QUO_STONE_CIRCLES_STONEHENGE_2', 	'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_PRODUCTION', 0, 0, NULL, NULL) ;


INSERT INTO ModifierArguments
	(ModifierId, 			Name, 			Type, 			Value, 				Extra, 	SecondExtra)
VALUES	('QUO_STONE_CIRCLES_STONEHENGE', 	'ModifierId', 		'ARGTYPE_IDENTITY', 	'QUO_STONE_CIRCLES_STONEHENGE_2',				NULL, 	NULL) ,
	('QUO_STONE_CIRCLES_STONEHENGE_2', 	'Amount', 		'ARGTYPE_IDENTITY', 	'200',				NULL, 	NULL) ,  
	('QUO_STONE_CIRCLES_STONEHENGE_2', 	'BuildingType', 	'ARGTYPE_IDENTITY', 	'BUILDING_STONEHENGE',	NULL, 	NULL) ;



INSERT INTO BeliefModifiers
	(BeliefType, 			ModifierId)
VALUES	('BELIEF_STONE_CIRCLES',	'QUO_STONE_CIRCLES_STONEHENGE'); */

/* INSERT INTO Modifiers 
	(ModifierId, ModifierType, RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
VALUES	('QUO_BELIEF_STONE_CIRCLES_GRASS',	'MODIFIER_ALL_CITIES_TERRAIN_ADJACENCY', 0, 0, NULL, 'CITY_FOLLOWS_PANTHEON_REQUIREMENTS') ,	
		('QUO_BELIEF_STONE_CIRCLES_PLAINS',	'MODIFIER_ALL_CITIES_TERRAIN_ADJACENCY', 0, 0, NULL, 'CITY_FOLLOWS_PANTHEON_REQUIREMENTS') ,
		('QUO_BELIEF_STONE_CIRCLES_DESERT',	'MODIFIER_ALL_CITIES_TERRAIN_ADJACENCY', 0, 0, NULL, 'CITY_FOLLOWS_PANTHEON_REQUIREMENTS') ,
		('QUO_BELIEF_STONE_CIRCLES_TUNDRA',	'MODIFIER_ALL_CITIES_TERRAIN_ADJACENCY', 0, 0, NULL, 'CITY_FOLLOWS_PANTHEON_REQUIREMENTS') ,
		('QUO_BELIEF_STONE_CIRCLES_SNOW',	'MODIFIER_ALL_CITIES_TERRAIN_ADJACENCY', 0, 0, NULL, 'CITY_FOLLOWS_PANTHEON_REQUIREMENTS') ;
		

INSERT INTO ModifierArguments
	(ModifierId, 			Name, 			Type, 			Value, 				Extra, 	SecondExtra)
VALUES	('QUO_BELIEF_STONE_CIRCLES_GRASS', 	'YieldType', 		'ARGTYPE_IDENTITY', 	'YIELD_FAITH',				NULL, 	NULL) ,
	('QUO_BELIEF_STONE_CIRCLES_GRASS', 	'Amount', 		'ARGTYPE_IDENTITY', 	'1',				NULL, 	NULL) ,  
	('QUO_BELIEF_STONE_CIRCLES_GRASS', 	'Description', 	'ARGTYPE_IDENTITY', 	'LOC_DISTRICT_TUNDRA_FAITH',	NULL, 	NULL) ,
	('QUO_BELIEF_STONE_CIRCLES_GRASS', 	'DistrictType', 	'ARGTYPE_IDENTITY', 	'DISTRICT_CITY_CENTER',	NULL, 	NULL) ,
	('QUO_BELIEF_STONE_CIRCLES_GRASS', 	'TerrainType', 	'ARGTYPE_IDENTITY', 	'TERRAIN_GRASS_MOUNTAIN',	NULL, 	NULL) ,

('QUO_BELIEF_STONE_CIRCLES_PLAINS', 	'YieldType', 		'ARGTYPE_IDENTITY', 	'YIELD_FAITH',				NULL, 	NULL) ,
	('QUO_BELIEF_STONE_CIRCLES_PLAINS', 	'Amount', 		'ARGTYPE_IDENTITY', 	'1',				NULL, 	NULL) ,  
	('QUO_BELIEF_STONE_CIRCLES_PLAINS', 	'Description', 	'ARGTYPE_IDENTITY', 	'LOC_DISTRICT_TUNDRA_FAITH',	NULL, 	NULL) ,
	('QUO_BELIEF_STONE_CIRCLES_PLAINS', 	'DistrictType', 	'ARGTYPE_IDENTITY', 	'DISTRICT_CITY_CENTER',	NULL, 	NULL) ,
	('QUO_BELIEF_STONE_CIRCLES_PLAINS', 	'TerrainType', 	'ARGTYPE_IDENTITY', 	'TERRAIN_PLAINS_MOUNTAIN',	NULL, 	NULL) ,

('QUO_BELIEF_STONE_CIRCLES_DESERT', 	'YieldType', 		'ARGTYPE_IDENTITY', 	'YIELD_FAITH',				NULL, 	NULL) ,
	('QUO_BELIEF_STONE_CIRCLES_DESERT', 	'Amount', 		'ARGTYPE_IDENTITY', 	'1',				NULL, 	NULL) ,  
	('QUO_BELIEF_STONE_CIRCLES_DESERT', 	'Description', 	'ARGTYPE_IDENTITY', 	'LOC_DISTRICT_TUNDRA_FAITH',	NULL, 	NULL) ,
	('QUO_BELIEF_STONE_CIRCLES_DESERT', 	'DistrictType', 	'ARGTYPE_IDENTITY', 	'DISTRICT_CITY_CENTER',	NULL, 	NULL) ,
	('QUO_BELIEF_STONE_CIRCLES_DESERT', 	'TerrainType', 	'ARGTYPE_IDENTITY', 	'TERRAIN_DESERT_MOUNTAIN',	NULL, 	NULL) ,

('QUO_BELIEF_STONE_CIRCLES_TUNDRA', 	'YieldType', 		'ARGTYPE_IDENTITY', 	'YIELD_FAITH',				NULL, 	NULL) ,
	('QUO_BELIEF_STONE_CIRCLES_TUNDRA', 	'Amount', 		'ARGTYPE_IDENTITY', 	'1',				NULL, 	NULL) ,  
	('QUO_BELIEF_STONE_CIRCLES_TUNDRA', 	'Description', 	'ARGTYPE_IDENTITY', 	'LOC_DISTRICT_TUNDRA_FAITH',	NULL, 	NULL) ,
	('QUO_BELIEF_STONE_CIRCLES_TUNDRA', 	'DistrictType', 	'ARGTYPE_IDENTITY', 	'DISTRICT_CITY_CENTER',	NULL, 	NULL) ,
	('QUO_BELIEF_STONE_CIRCLES_TUNDRA', 	'TerrainType', 	'ARGTYPE_IDENTITY', 	'TERRAIN_TUNDRA_MOUNTAIN',	NULL, 	NULL) ,

('QUO_BELIEF_STONE_CIRCLES_SNOW', 	'YieldType', 		'ARGTYPE_IDENTITY', 	'YIELD_FAITH',				NULL, 	NULL) ,
	('QUO_BELIEF_STONE_CIRCLES_SNOW', 	'Amount', 		'ARGTYPE_IDENTITY', 	'1',				NULL, 	NULL) ,  
	('QUO_BELIEF_STONE_CIRCLES_SNOW', 	'Description', 	'ARGTYPE_IDENTITY', 	'LOC_DISTRICT_TUNDRA_FAITH',	NULL, 	NULL) ,
	('QUO_BELIEF_STONE_CIRCLES_SNOW', 	'DistrictType', 	'ARGTYPE_IDENTITY', 	'DISTRICT_CITY_CENTER',	NULL, 	NULL) ,
	('QUO_BELIEF_STONE_CIRCLES_SNOW', 	'TerrainType', 	'ARGTYPE_IDENTITY', 	'TERRAIN_SNOW_MOUNTAIN',	NULL, 	NULL) ;


INSERT INTO BeliefModifiers
	(BeliefType, 			ModifierId)
VALUES	('BELIEF_STONE_CIRCLES',	'QUO_BELIEF_STONE_CIRCLES_GRASS'),
('BELIEF_STONE_CIRCLES',	'QUO_BELIEF_STONE_CIRCLES_PLAINS'),
('BELIEF_STONE_CIRCLES',	'QUO_BELIEF_STONE_CIRCLES_DESERT'),
('BELIEF_STONE_CIRCLES',	'QUO_BELIEF_STONE_CIRCLES_TUNDRA'),
('BELIEF_STONE_CIRCLES',	'QUO_BELIEF_STONE_CIRCLES_SNOW'); */




-- LADY OF REEDS AND MARSHES

-- Add Rice as a viable location for reeds
INSERT OR IGNORE INTO RequirementSetRequirements
	(RequirementSetId,	RequirementId)
VALUES ('PLOT_HAS_REEDS_REQUIREMENTS', 'REQUIRES_RICE_IN_PLOT'),
('PLOT_HAS_REEDS_REQUIREMENTS', 'REQUIRES_WHEAT_IN_PLOT');


-- EARTH GODDESS

-- Nerf Earth Goddess so it requires a Breathtaking tile. Not sure WTF Firaxis was thinking with original balance on this.
INSERT INTO Requirements
		(RequirementId, 		RequirementType, 	Likeliness,	Inverse, 	Triggered)
VALUES	('QUO_REQ_PLOT_APPEAL_BREATHTAKING', 		'REQUIREMENT_PLOT_IS_APPEAL_BETWEEN',	0,0,0)  ;


INSERT INTO RequirementArguments 
		(RequirementId,			Name, 			Type, 			Value, 				Extra, 	SecondExtra)
VALUES 	('QUO_REQ_PLOT_APPEAL_BREATHTAKING',	'MinimumAppeal',		'ARGTYPE_IDENTITY',	'4',	NULL,	NULL 	) ;


INSERT INTO RequirementSets 
	(RequirementSetId, 		RequirementSetType)
VALUES 	('QUO_REQSET_PLOT_APPEAL_BREATHTAKING', 	'REQUIREMENTSET_TEST_ALL')  ;

INSERT INTO RequirementSetRequirements
		(RequirementSetId,	RequirementId)
VALUES	 ('QUO_REQSET_PLOT_APPEAL_BREATHTAKING', 	'QUO_REQ_PLOT_APPEAL_BREATHTAKING')  ;
		
		
UPDATE Modifiers SET SubjectRequirementSetId='QUO_REQSET_PLOT_APPEAL_BREATHTAKING' WHERE ModifierId='EARTH_GODDESS_APPEAL_FAITH_MODIFIER' ;



-- SACRED PATH

-- Add Forest adjacencies

INSERT INTO Modifiers 
	(ModifierId, ModifierType, RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
VALUES	('QUO_BELIEF_SACRED_PATH_FOREST',	'MODIFIER_ALL_CITIES_FEATURE_ADJACENCY', 0, 0, NULL, 'CITY_FOLLOWS_PANTHEON_REQUIREMENTS') ;


INSERT INTO ModifierArguments
	(ModifierId, 			Name, 			Type, 			Value, 				Extra, 	SecondExtra)
VALUES	('QUO_BELIEF_SACRED_PATH_FOREST', 	'YieldType', 		'ARGTYPE_IDENTITY', 	'YIELD_FAITH',				NULL, 	NULL) ,
	('QUO_BELIEF_SACRED_PATH_FOREST', 	'Amount', 		'ARGTYPE_IDENTITY', 	'1',				NULL, 	NULL) ,  
	('QUO_BELIEF_SACRED_PATH_FOREST', 	'Description', 	'ARGTYPE_IDENTITY', 	'LOC_DISTRICT_JUNGLE_FAITH',	NULL, 	NULL) ,
	('QUO_BELIEF_SACRED_PATH_FOREST', 	'DistrictType', 	'ARGTYPE_IDENTITY', 	'DISTRICT_HOLY_SITE',	NULL, 	NULL) ,
	('QUO_BELIEF_SACRED_PATH_FOREST', 	'FeatureType', 	'ARGTYPE_IDENTITY', 	'FEATURE_FOREST',	NULL, 	NULL) ;



INSERT INTO BeliefModifiers
	(BeliefType, 			ModifierId)
VALUES	('BELIEF_SACRED_PATH',	'QUO_BELIEF_SACRED_PATH_FOREST');






-- GOD OF THE FORGE
--new in v7.0.10
INSERT INTO Requirements
	(RequirementId, 		RequirementType, 	Likeliness,	Inverse, 	Triggered)
VALUES	('QUO_REQ_BELIEF_GOD_OF_THE_FORGE_ADJ_VOLCANO', 		'REQUIREMENT_PLOT_ADJACENT_FEATURE_TYPE_MATCHES',	0,0,0)  ;


INSERT INTO RequirementArguments 
	(RequirementId,			Name, 			Type, 			Value, 				Extra, 	SecondExtra)
VALUES 	('QUO_REQ_BELIEF_GOD_OF_THE_FORGE_ADJ_VOLCANO',	'FeatureType',		'ARGTYPE_IDENTITY',	'FEATURE_VOLCANO',	NULL,	NULL 	)  ;

		
INSERT INTO RequirementSets 
	(RequirementSetId, 		RequirementSetType)
VALUES 	('QUO_REQSET_BELIEF_GOD_OF_THE_FORGE_ADJACENCIES', 	'REQUIREMENTSET_TEST_ANY') ;


INSERT INTO RequirementSetRequirements
	(RequirementSetId,	RequirementId)
VALUES	 ('QUO_REQSET_BELIEF_GOD_OF_THE_FORGE_ADJACENCIES', 	'QUO_REQ_BELIEF_GOD_OF_THE_FORGE_ADJ_VOLCANO') ;


INSERT INTO Modifiers 
	(ModifierId, ModifierType, RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
VALUES	('QUO_BELIEF_GOD_OF_THE_FORGE_PLAYER', 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER', 0, 0, NULL, 'CITY_FOLLOWS_PANTHEON_REQUIREMENTS')   ,
		('QUO_BELIEF_GOD_OF_THE_FORGE_ADJ', 'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD', 0, 0, NULL, 'QUO_REQSET_BELIEF_GOD_OF_THE_FORGE_ADJACENCIES')   ;
 
INSERT INTO ModifierArguments
		(ModifierId, 			Name, 		Type, 			Value, 			Extra, 	SecondExtra)
VALUES	('QUO_BELIEF_GOD_OF_THE_FORGE_PLAYER', 	'ModiferId', 	'ARGTYPE_IDENTITY', 	'QUO_BELIEF_GOD_OF_THE_FORGE_ADJ',			NULL, 	NULL) ,
		('QUO_BELIEF_GOD_OF_THE_FORGE_ADJ', 	'YieldType', 	'ARGTYPE_IDENTITY', 	'YIELD_CULTURE',			NULL, 	NULL) ,
		('QUO_BELIEF_GOD_OF_THE_FORGE_ADJ', 	'Amount', 	'ARGTYPE_IDENTITY', 	'1',			NULL, 	NULL) ,
		('QUO_BELIEF_GOD_OF_THE_FORGE_ADJ',	'MaxDistance',	'ARGTYPE_IDENTITY',	'2',	NULL,	NULL 	) ,
		('QUO_BELIEF_GOD_OF_THE_FORGE_ADJ',	'MinDistance',	'ARGTYPE_IDENTITY',	'1',	NULL,	NULL 	) ;
		
INSERT INTO BeliefModifiers
		(BeliefType, 			ModifierID)
VALUES	('BELIEF_GOD_OF_THE_FORGE',	'QUO_BELIEF_GOD_OF_THE_FORGE_PLAYER')  ;


/* INSERT INTO Types
	(Type, 				Kind)
VALUES 	('QUO_BELIEF_PANTHEON_LAKES',	'KIND_BELIEF'	) ;

INSERT INTO Beliefs
		(BeliefType, Name, Description, BeliefClassType)
VALUES	("QUO_BELIEF_PANTHEON_LAKES", "LOC_QUO_BELIEF_PANTHEON_LAKES_NAME", "LOC_QUO_BELIEF_PANTHEON_LAKES_DESCRIPTION", "BELIEF_CLASS_PANTHEON");
 

 
 -- Removed because it may be related to a crash to desktop
/* INSERT INTO Modifiers 
	(ModifierId, ModifierType, RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
VALUES	('QUO_BELIEF_PANTHEON_LAKES_MODIFIER',	'MODIFIER_ALL_CITIES_ATTACH_MODIFIER', 0, 0, NULL, 'CITY_FOLLOWS_RELIGION_REQUIREMENTS'),
		('QUO_BELIEF_PANTHEON_LAKES_MODIFIER_2', 	'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD', 0, 0, NULL, 'PRODUCTIONHUEY_PLOT_IS_LAKE_REQUIREMENTS') ;

	
INSERT INTO ModifierArguments
	(ModifierId, 			Name, 			Type, 			Value, 				Extra, 	SecondExtra)
VALUES	('QUO_BELIEF_PANTHEON_LAKES_MODIFIER', 	'ModifierId', 		'ARGTYPE_IDENTITY', 	'QUO_BELIEF_PANTHEON_LAKES_MODIFIER_2',				NULL, 	NULL) ,
	('QUO_BELIEF_PANTHEON_LAKES_MODIFIER_2', 	'Amount', 		'ARGTYPE_IDENTITY', 	'2',				NULL, 	NULL) ,  
	('QUO_BELIEF_PANTHEON_LAKES_MODIFIER_2', 	'YieldType', 	'ARGTYPE_IDENTITY', 	'YIELD_FAITH',	NULL, 	NULL) ; 
	
	
INSERT INTO BeliefModifiers
	(BeliefType, ModifierId)
VALUES	("BELIEF_RELIGIOUS_COMMUNITY", "QUO_BELIEF_PANTHEON_LAKES_MODIFIER") ;  */






-- UPDATE BUG TRACKER
-- This code should go last in every file

UPDATE tblQuoDebug SET x_Close='1' WHERE DebugID='Quo_Beliefs_Code';
