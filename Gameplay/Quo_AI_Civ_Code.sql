/*
    Created by Quo
	
	This file is used to for writing AI changes specific this mod. It is allowed to reference changes made in the Quo_Civ_Code file and assumes that
	file is always loaded prior to this file.
*/
 


-- LOGS

-- Debug
INSERT INTO tblQuoDebug 
	(DebugID, 		x_Open, x_Close, 	Message)
VALUES ('Quo_CivAI_Code',	'1',	'0',		'') ;



-- BRAZIL
INSERT INTO AIListTypes
	(ListType)
VALUES ('Quo_PedroProjects');

INSERT INTO AILists
	(ListType, LeaderType, System, MinDifficulty, MaxDifficulty)
VALUES('Quo_PedroProjects', 'AGENDA_GREAT_PERSON_OBSESSED', 'Projects', NULL, NULL); 


INSERT OR IGNORE INTO AIFavoredItems
		(ListType, Item, Favored, Value, StringVal, MinDifficulty, MaxDifficulty)
SELECT 'Quo_PedroProjects', 'QUO_PROJECT_BRAZILWOOD', 1, 0, NULL, NULL, NULL
FROM Leaders
WHERE Leaders.LeaderType = 'LEADER_PEDRO' ;



-- SPHERES
INSERT INTO AIListTypes
	(ListType)
VALUES ('Quo_BiomeAsianSteppe_Projects');


INSERT INTO Agendas 
		(AgendaType, OperationList, Name, Description)
VALUES	('QUO_AGENDA_BIOME_ASIAN_EXPANSE', NULL, 'LOC_QUO_AGENDA_BIOME_ASIAN_EXPANSE_NAME','LOC_QUO_AGENDA_BIOME_ASIAN_EXPANSE_DESCRIPTION');

INSERT INTO AgendaTraits
		(AgendaType, TraitType)
VALUES ('QUO_AGENDA_BIOME_ASIAN_EXPANSE', 'QUO_TRAIT_BIOME_ASIAN_STEPPE');


INSERT INTO AILists
	(ListType, LeaderType, System, MinDifficulty, MaxDifficulty)
VALUES('Quo_BiomeAsianSteppe_Projects', 'QUO_AGENDA_BIOME_ASIAN_EXPANSE', 'Projects', NULL, NULL); 


INSERT OR IGNORE INTO AIFavoredItems
		(ListType, Item, Favored, Value, StringVal, MinDifficulty, MaxDifficulty)
VALUES ('Quo_BiomeAsianSteppe_Projects', 'QUO_PROJECT_BIOME_ASIAN_EXPANSE_MOVE_CAPITAL', 1, 0, NULL, NULL, NULL);



-- General
--UPDATE AIOperationDefs SET MinOddsOfSuccess='0.2' WHERE OperationName='Attack Walled City';


-- DLC 

-- MONTEZUMA
INSERT OR IGNORE INTO AIFavoredItems
		(ListType, Item, Favored, Value, StringVal, MinDifficulty, MaxDifficulty)
SELECT 'MontezumaWonders', 'QUO_BUILDING_TEMPLO_MAYOR', 1, 0, NULL, NULL, NULL
FROM Leaders
WHERE Leaders.LeaderType = 'LEADER_MONTEZUMA' ;





	

-- The global debuff

/*
INSERT INTO Modifiers 
	(ModifierId, ModifierType, RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
VALUES	('QUO_AZTEC_SACRIFICE_GLOBAL', 'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER', 0, 0, NULL, 'PLAYER_SAME_HOME_CONTINENT') ,
	('QUO_AZTEC_SACRIFICE_DEBUFF', 'MODIFIER_PLAYER_UNITS_ADJUST_BUILDER_CHARGES', 0, 0, NULL, NULL) ;
*/



-- UPDATE BUG TRACKER
-- This code should go last in every file
UPDATE tblQuoDebug SET x_Close='1' WHERE DebugID='Quo_CivAI_Code';

