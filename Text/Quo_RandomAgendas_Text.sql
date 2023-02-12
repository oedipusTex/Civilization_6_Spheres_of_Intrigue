/*
[NEWLINE][NEWLINE][NEWLINE][NEWLINE]Created by Quo
*/
 



/* INSERT INTO tblQuoDebug 
	(DebugID, 		x_Open, x_Close, 	Message)
VALUES ('Quo_RandomAgendas_Text',	'1',	'0',		'') ; */


-- =========== BENIGN =================



	
	
	
	
CREATE TEMPORARY TABLE tblQuoSecretBonusDescriptions(
	AgendaID text PRIMARY KEY,
	OriginalTextKey text,
	OriginalDesc text,
	OriginalName text,
	BonusDescription text, 
	MalusDescription text
);

INSERT INTO tblQuoSecretBonusDescriptions
		(AgendaID, OriginalTextKey, BonusDescription, MalusDescription)
VALUES	('AIRPOWER', 'LOC_AGENDA_AIRPOWER_DESCRIPTION' 
			, '+12 to the Ranged Strike capability of cities.' 
			, '-1[ICON_PRODUCTION] Production in cities with at least 5 districts but no Aerodrome.'),
			
		('CITY_STATE_ALLY', 'LOC_AGENDA_CITY_STATE_ALLY_DESCRIPTION'
			, '+10[ICON_GOLD] Gold for each city state you are Suzerain of.'
			, '-1 Loyalty per turn in cities without governors.'),
		
		('CITY_STATE_PROTECTOR', 'LOC_AGENDA_CITY_STATE_PROTECTOR_DESCRIPTION'
			, '+3 influence points towards city state tokens per turn.'
			, '-1 Loyalty per turn in cities without governors.'),
		
		('CIVILIZED', 'LOC_AGENDA_CIVILIZED_DESCRIPTION'
			, '+1[ICON_TRADEROUTE] Trade Routes slots.'
			, '-1[ICON_GOLD] Gold in cities with at least 2 districts but no Commercial Hub.'),
		
		('CULTURED', 'LOC_AGENDA_CULTURED_DESCRIPTION' 
			, '+2[ICON_CULTURE] Culture in cities with Theater Squares.'
			, '-1[ICON_CULTURE] Culture in cities with at least 2 districts but no Theater Square.'),
			
		('DARWINIST', 'LOC_AGENDA_DARWINIST_DESCRIPTION'
			, '2 points toward Great Generals with every kill.'
			, '-1[ICON_PRODUCTION] Production in cities with at least 2 districts but no Encampment.'),
		
		('DEVOUT', 'LOC_AGENDA_DEVOUT_DESCRIPTION'
			, '+5[ICON_STRENGTH] for Religious units in theological combat.'
			, '-1[ICON_FAITH] Faith in cities with at least 2 districts but no Holy Site.'),
		
		('ENVIRONMENTALIST', 'LOC_AGENDA_ENVIRONMENTALIST_DESCRIPTION'
			, '+2[ICON_FAITH] Faith from Camps.'
			, '-1[ICON_FAITH] Faith in cities that contain an Industrial Zone.'),
			
		('EXPLOITATIVE', 'LOC_AGENDA_EXPLOITATIVE_DESCRIPTION'
			, '+1 charge for Builders.'
			, '-1[ICON_Production] Production in cities with at least 2 districts but no Industrial Zone.'),
			
		('EXPLORER', 'LOC_AGENDA_EXPLORER_DESCRIPTION'
			, '+10%[ICON_PRODUCTION] Production in cities on continents other than your capital.'
			, '-1[ICON_GOLD] Gold in cities with at least 2 districts but no Harbor.'),
					
		('FUN_LOVING', 'LOC_AGENDA_FUN_LOVING_DESCRIPTION'
			, '1 copy of the [ICON_RESOURCE_TOYS] Toys luxury resource.'
			, '-1[ICON_AMENITIES] Amenity in cities with at least 2 districts but no Entertainment Complex or Water Park.'),
			
		('GREAT_PERSON_ADVOCATE', 'LOC_AGENDA_GREAT_PERSON_OBSESSED_DESCRIPTION'
			, '+1[ICON_CULTURE] Culture from Great Works of Writing.'
			, '-1 offensive capability for Spies.'),
					
		('IDEOLOGUE', 'LOC_AGENDA_IDEOLOGUE_DESCRIPTION'
			, '+1[ICON_CULTURE] Culture to each tile adjacent to a Government Plaza.'
			, '-1 Loyalty per turn in cities without governors.'),
			
		('INDUSTRIALIST', 'LOC_AGENDA_INDUSTRIALIST_DESCRIPTION'
			, '+2[ICON_PRODUCTION] Production in cities with an Industrial Zone.'
			, '-1[ICON_Production] Production in cities with at least 2 districts but no Industrial Zone.'),
			
		('MONEY_GRUBBER', 'LOC_AGENDA_MONEY_GRUBBER_DESCRIPTION'
			, '+4[ICON_GOLD] Gold in cities with a Commercial Hub.'
			, '-1[ICON_GOLD] Gold in cities with at least 2 districts but no Commercial Zone.'),		
			
		('NUKE_LOVER', 'LOC_AGENDA_NUKE_LOVER_DESCRIPTION'
			, ' +5[ICON_SCIENCE] Science from mines over strategic resources.'
			, '-1[ICON_GOLD] Gold in cities with at least 5 districts but no Aerodrome.'),
					
		('PARANOID', 'LOC_AGENDA_PARANOID_DESCRIPTION'
			, '+1 to the offensive capabilities of Spies.'
			, '-1 to the defensive capabilities for Spies.'),
			
		('POPULOUS', 'LOC_AGENDA_POPULOUS_DESCRIPTION'
			, '+2[ICON_FOOD] in cities with a Neighborhood.'
			, '-1[ICON_FOOD] Food in cities with at least 5 districts but no Neighborhood.'),
			
		('STANDING_ARMY', 'LOC_AGENDA_STANDING_ARMY_DESCRIPTION'
			, '+2[ICON_FOOD] Food in cities with an Encampment.'
			, '-1[ICON_Production] Production in cities with at least 2 districts but no Industrial Zone.'),
			
		('TECHNOPHILE', 'LOC_AGENDA_TECHNOPHILE_DESCRIPTION'
			, '+2[ICON_SCIENCE] Science in cities with a Campus.'
			, '-1[ICON_SCIENCE] Science in cities with at least 2 districts but no Campus.'),
		
		('WONDER_ADVOCATE', 'LOC_AGENDA_WONDER_OBSESSED_DESCRIPTION'
			, '+10%[ICON_PRODUCTION] Production towards World Wonders.'
			, '-1[ICON_CULTURE] Culture in cities without at least one World Wonder.') ;


UPDATE tblQuoSecretBonusDescriptions SET OriginalDesc = (SELECT Text FROM LocalizedText WHERE Tag = OriginalTextKey AND Language='en_US') ;

UPDATE tblQuoSecretBonusDescriptions SET OriginalName = (SELECT Text FROM LocalizedText WHERE Tag = "LOC_AGENDA_" || AgendaID || "_NAME" AND Language='en_US') ;
		
		

INSERT INTO LocalizedText
		(Language, Text, Tag)
VALUES ("en_US", "They are annoyed that you have exploited their agenda", "LOC_QUO_SECRET_ANNOYED_DESCRIPTION") ,
		("en_US", "They are pleased that you have advanced their agenda", "LOC_QUO_SECRET_PLEASED_DESCRIPTION") ,
		("en_US", "We are annoyed that you have exploited our agenda.", "LOC_QUO_SECRET_ANNOYED_REASON") ,
		("en_US", "We are pleased that you have advanced our agenda.", "LOC_QUO_SECRET_PLEASED_REASON") ;
		
		
-- Dotard
INSERT OR REPLACE INTO LocalizedText
	(Language, Text, Tag)
SELECT "en_US", OriginalName || " (Dotard)", "LOC_QUO_AGENDA_" || AgendaID || "_DOTARD_NAME"
FROM tblQuoSecretBonusDescriptions ;

INSERT OR REPLACE INTO LocalizedText
	(Language, Text, Tag)
SELECT "en_US", OriginalDesc || "[NEWLINE][NEWLINE][ICON_CAPITAL]This leader's countrymen are eager to assist you in revolution. [NEWLINE][ICON_BOLT]To exploit this agenda: Declare war on them while you have the same form of government they do.[NEWLINE][ICON_BOLT]Reward: " 
	|| BonusDescription, "LOC_QUO_AGENDA_" || AgendaID || "_DOTARD_DESCRIPTION"
FROM tblQuoSecretBonusDescriptions ;
	
	
	
-- Comrade
INSERT OR REPLACE INTO LocalizedText
	(Language, Text, Tag)
SELECT "en_US", OriginalName || " (Comrade)", "LOC_QUO_AGENDA_" || AgendaID || "_COMRADE_NAME"
FROM tblQuoSecretBonusDescriptions ;

INSERT OR REPLACE INTO LocalizedText
	(Language, Text, Tag)
SELECT "en_US", OriginalDesc || '[NEWLINE][NEWLINE][ICON_CAPITAL]This leader shares rewards with comrades.[NEWLINE][ICON_BOLT]To exploit this agenda: Form an alliance with them while while at peace with their neighbors.[NEWLINE][ICON_BOLT]Reward: ' 
	|| BonusDescription, "LOC_QUO_AGENDA_" || AgendaID || "_COMRADE_DESCRIPTION"
FROM tblQuoSecretBonusDescriptions ;
	
	
-- Weasel
INSERT OR REPLACE INTO LocalizedText
	(Language, Text, Tag)
SELECT "en_US", OriginalName || " (Weasel)", "LOC_QUO_AGENDA_" || AgendaID || "_WEASEL_NAME"
FROM tblQuoSecretBonusDescriptions ;

INSERT OR REPLACE INTO LocalizedText
	(Language, Text, Tag)
SELECT "en_US", OriginalDesc || '[NEWLINE][NEWLINE][ICON_CAPITAL]This leader achieves goals by stirring drama and controversy.[NEWLINE][ICON_BOLT]To exploit this agenda: Form an alliance with them while at war with their neighbors.[NEWLINE][ICON_BOLT]Reward: ' 
	|| BonusDescription, "LOC_QUO_AGENDA_" || AgendaID || "_WEASEL_DESCRIPTION"
FROM tblQuoSecretBonusDescriptions ;
	
	


-- Paragon 
-- Do this one last to make sure other agendas are copying good original text
INSERT OR REPLACE INTO LocalizedText
	(Language, Text, Tag)
SELECT "en_US", OriginalDesc || '[NEWLINE][NEWLINE][ICON_CAPITAL]This leader has high expectations for success... and low tolerance for dragging feet.[NEWLINE][ICON_BOLT]To exploit this agenda: Form and maintain an alliance despite the downsides.[NEWLINE][ICON_BOLT]Reward: ' 
	|| BonusDescription || "[NEWLINE][ICON_BOLT]Penalty: " || MalusDescription, OriginalTextKey 
FROM tblQuoSecretBonusDescriptions ;		
	
	
-- Name
-- Still uses old method for now
UPDATE LocalizedText SET Text = Text || '[ICON_CAPITAL](Paragon)' 
	WHERE Tag IN (
	'LOC_AGENDA_AIRPOWER_NAME',
	'LOC_AGENDA_CITY_STATE_ALLY_NAME',
	'LOC_AGENDA_CITY_STATE_PROTECTOR_NAME',
	'LOC_AGENDA_CIVILIZED_NAME',
	'LOC_AGENDA_CULTURED_NAME',
	'LOC_AGENDA_DARWINIST_NAME',
	'LOC_AGENDA_DEVOUT_NAME',
	'LOC_AGENDA_ENVIRONMENTALIST_NAME',
	'LOC_AGENDA_EXPLOITATIVE_NAME',
	'LOC_AGENDA_EXPLORER_NAME',
	'LOC_AGENDA_FUN_LOVING_NAME',
	'LOC_AGENDA_GREAT_PERSON_ADVOCATE_NAME',
	'LOC_AGENDA_IDEOLOGUE_NAME',
	'LOC_AGENDA_INDUSTRIALIST_NAME',
	'LOC_AGENDA_MONEY_GRUBBER_NAME',
	'LOC_AGENDA_NUKE_LOVER_NAME',
	'LOC_AGENDA_PARANOID_NAME',
	'LOC_AGENDA_POPULOUS_NAME',
	'LOC_AGENDA_STANDING_ARMY_NAME',
	'LOC_AGENDA_TECHNOPHILE_NAME',
	'LOC_AGENDA_WONDER_ADVOCATE_NAME') ;

-- descriptions
/* UPDATE LocalizedText SET Text= Text || '[NEWLINE][NEWLINE][ICON_CAPITAL] Allying will provide +2 [ICON_PRODUCTION] in cities with an Aerodrome. Cities with at least 2 districts but no Aerodrome have -1[ICON_PRODUCTION] Production.' 
	WHERE Tag='LOC_AGENDA_AIRPOWER_DESCRIPTION' ;

UPDATE LocalizedText SET Text= Text || '[NEWLINE][NEWLINE][ICON_CAPITAL] Allying will provide +1 points towards city state tokens per turn. Cities have -1 defense against spy missions.'
	WHERE Tag='LOC_AGENDA_CITY_STATE_ALLY_DESCRIPTION' ;

UPDATE LocalizedText SET Text= Text || '[NEWLINE][NEWLINE][ICON_CAPITAL] Allying will provide +1 points towards city state tokens per turn. Cities have -1 defense against spy missions.' 
	WHERE Tag='LOC_AGENDA_CITY_STATE_PROTECTOR_DESCRIPTION' ;
	
UPDATE LocalizedText SET Text= Text || '[NEWLINE][NEWLINE][ICON_CAPITAL] Allying will provide +1 Trade Routes, but reduce Eurekas from Culture by 5%.'
	WHERE Tag='LOC_AGENDA_CIVILIZED_DESCRIPTION' ;

UPDATE LocalizedText SET Text= Text || '[NEWLINE][NEWLINE][ICON_CAPITAL] Allying will increase Cultural Eurekas by 5%, but reduce Scientific Eurekas by 5%.'
	WHERE Tag='LOC_AGENDA_CULTURED_DESCRIPTION' ;	
	
UPDATE LocalizedText SET Text= Text || '[NEWLINE][NEWLINE][ICON_CAPITAL] Allying will grant 1 point toward a Great General with every kill. Cities with at least 2 districts but no Encampment have -1 [ICON_FOOD] Food.'
	WHERE Tag='LOC_AGENDA_DARWINIST_DESCRIPTION' ;
	
UPDATE LocalizedText SET Text= Text || '[NEWLINE][NEWLINE][ICON_CAPITAL] Allying will provide +2[ICON_FAITH]Faith from Holy Sites. Cities with at least 2 districts but no Holy Site have -1 [ICON_FAITH] Faith.'
	WHERE Tag='LOC_AGENDA_DEVOUT_DESCRIPTION' ;
	
UPDATE LocalizedText SET Text= Text || '[NEWLINE][NEWLINE][ICON_CAPITAL] Allying will provide +1[ICON_CULTURE] from Camps. Cities with at least 2 districts but no Holy Site have -1 [ICON_FAITH] Faith.'
	WHERE Tag='LOC_AGENDA_ENVIRONMENTALIST_DESCRIPTION' ;
	
UPDATE LocalizedText SET Text= Text || '[NEWLINE][NEWLINE][ICON_CAPITAL] Allying will provide Builders with +1 charge. Cities with at least 2 districts but no Industrial Complex have -1 [ICON_PRODUCTION] Production.'
	WHERE Tag='LOC_AGENDA_EXPLOITATIVE_DESCRIPTION' ;
	
UPDATE LocalizedText SET Text= Text || '[NEWLINE][NEWLINE][ICON_CAPITAL] Allying will provide +1 movement to Recon units. Cities have -1 defense against spy missions.'
	WHERE Tag='LOC_AGENDA_EXPLORER_DESCRIPTION' ;
	
UPDATE LocalizedText SET Text= Text || '[NEWLINE][NEWLINE][ICON_CAPITAL] Allying will provide +1 amenity to cities with an Entertainment Complex. -1 amenity in cities with at least 2 districts but no Entertainment Complex.'
	WHERE Tag='LOC_AGENDA_FUN_LOVING_DESCRIPTION' ;
	
UPDATE LocalizedText SET Text= Text || '[NEWLINE][NEWLINE][ICON_CAPITAL] Allying will provide +1 charge to Great Engineers, but reduce cultural Eurekas by 5%.'
	WHERE Tag='LOC_AGENDA_GREAT_PERSON_OBSESSED_DESCRIPTION' ;
	
UPDATE LocalizedText SET Text= Text || '[NEWLINE][NEWLINE][ICON_CAPITAL] Allying will provide an extra city state token when the current suzerain has an opposing government, but reduce culture Eurekas by 5%.'
	WHERE Tag='LOC_AGENDA_IDEOLOGUE_DESCRIPTION' ;
	
UPDATE LocalizedText SET Text= Text || '[NEWLINE][NEWLINE][ICON_CAPITAL] Allying will provide +2[ICON_PRODUCTION] Production to cities with an Industrial Zone. Cities with at least 2 districts but no Industrial Complex have -1[ICON_PRODUCTION] Production.'
	WHERE Tag='LOC_AGENDA_INDUSTRIALIST_DESCRIPTION' ;
		
UPDATE LocalizedText SET Text= Text || '[NEWLINE][NEWLINE][ICON_CAPITAL] Allying will provide +2[ICON_GOLD] Gold to cities with a Commercial Hub. Cities with at least 2 districts but no Commercial Hub have -1[ICON_GOLD] Gold.'
	WHERE Tag='LOC_AGENDA_MONEY_GRUBBER_DESCRIPTION' ;
	
UPDATE LocalizedText SET Text= Text || '[NEWLINE][NEWLINE][ICON_CAPITAL] Allying will allow you to purchase Nuclear Submarines with [ICON_FAITH]Faith, but reduce Eurekas from Culture by 5%.'
	WHERE Tag='LOC_AGENDA_NUKE_LOVER_DESCRIPTION' ;

UPDATE LocalizedText SET Text= Text || '[NEWLINE][NEWLINE][ICON_CAPITAL] Allying will raise the abilities of friendly spies by 1 level, but also reduce local defenses by 1 level.'
	WHERE Tag='LOC_AGENDA_PARANOID_DESCRIPTION' ;

UPDATE LocalizedText SET Text= Text || '[NEWLINE][NEWLINE][ICON_CAPITAL] Allying will provide +2[ICON_FOOD] to cities with a Neighborhood. Cities with at least 2 districts but no Neighbhorhood have -1[ICON_FOOD] Food.'
	WHERE Tag='LOC_AGENDA_POPULOUS_DESCRIPTION' ;
	
UPDATE LocalizedText SET Text= Text || '[NEWLINE][NEWLINE][ICON_CAPITAL] Allying will provide +2[ICON_FOOD] to cities with Encampments. Cities with at least 2 districts but no Encampment have -1[ICON_FOOD] Food.'
	WHERE Tag='LOC_AGENDA_STANDING_ARMY_DESCRIPTION' ;
	
UPDATE LocalizedText SET Text= Text || '[NEWLINE][NEWLINE][ICON_CAPITAL] Allying will provide +5% towards scientific Eurekas, but -5% toward cultural Eurekas.'
	WHERE Tag='LOC_AGENDA_TECHNOPHILE_DESCRIPTION' ;
	
UPDATE LocalizedText SET Text= Text || '[NEWLINE][NEWLINE][ICON_CAPITAL] Allying will provide +10%[ICON_PRODUCTION] towards World Wonders. Cities with at least 2 districts but no Industrial Zone have -1[ICON_PRODUCTION] Production.'
	WHERE Tag='LOC_AGENDA_WONDER_OBSESSED_DESCRIPTION' ; */







-- DEBUG
/* UPDATE tblQuoDebug SET x_Close='1' WHERE DebugID='Quo_Civ_Text'; */
