/*
    Created by Quo
*/
 

-- LOGS
-- Debug
INSERT INTO tblQuoDebug 
	(DebugID, 		x_Open, x_Close, 	Message)
VALUES ('Quo_Governors_Code',	'1',	'0',		'') ;

-- NOTE: This file must load after the Biomes code in order to function.


-- Fix values for some broken abilities

-- Reduce science and culture per point of population for the Researcher
UPDATE ModifierArguments SET Value='.75' WHERE ModifierId='CONNOISSEUR_CULTURE_CITIZEN' AND Name='Amount';
UPDATE ModifierArguments SET Value='.75' WHERE ModifierId='RESEARCHER_SCIENCE_CITIZEN' AND Name='Amount';


-- Protector has x2 normal Loyalty pressure
UPDATE Governors SET IdentityPressure = 16 WHERE GovernorType='GOVERNOR_THE_DEFENDER' ;



-- Make Magnus less overpowered

-- Surplus Logistics now tier 1
DELETE FROM GovernorPromotionPrereqs WHERE GovernorPromotionType='GOVERNOR_PROMOTION_RESOURCE_MANAGER_SURPLUS_LOGISTICS' AND PrereqGovernorPromotion='GOVERNOR_PROMOTION_RESOURCE_MANAGER_GROUNDBREAKER' ;
 
 
 -- Update other prereqs
UPDATE GovernorPromotionPrereqs SET PrereqGovernorPromotion='GOVERNOR_PROMOTION_RESOURCE_MANAGER_SURPLUS_LOGISTICS' WHERE GovernorPromotionType='GOVERNOR_PROMOTION_RESOURCE_MANAGER_EXPEDITION' ;
UPDATE GovernorPromotionPrereqs SET PrereqGovernorPromotion='GOVERNOR_PROMOTION_RESOURCE_MANAGER_INDUSTRIALIST' WHERE GovernorPromotionType='GOVERNOR_PROMOTION_RESOURCE_MANAGER_GROUNDBREAKER' ;

 -- Insert Groundbreaker
INSERT OR IGNORE INTO GovernorPromotionPrereqs
	(GovernorPromotionType, PrereqGovernorPromotion)
VALUES ('GOVERNOR_PROMOTION_RESOURCE_MANAGER_GROUNDBREAKER', 'GOVERNOR_PROMOTION_RESOURCE_MANAGER_SURPLUS_LOGISTICS');  


-- Update visually
UPDATE GovernorPromotions SET Level = 0, Column=1, BaseAbility=1 WHERE GovernorPromotionType='GOVERNOR_PROMOTION_RESOURCE_MANAGER_SURPLUS_LOGISTICS' ;
UPDATE GovernorPromotions SET Level = 1, Column=0, BaseAbility=0 WHERE GovernorPromotionType='GOVERNOR_PROMOTION_RESOURCE_MANAGER_GROUNDBREAKER' ;
UPDATE GovernorPromotions SET Level = 2, Column=0 WHERE GovernorPromotionType='GOVERNOR_PROMOTION_RESOURCE_MANAGER_INDUSTRIALIST' ;

-- Nerf the amount of extra production
UPDATE ModifierArguments SET Value = 30 WHERE ModifierId='GROUNDBREAKER_BONUS_HARVEST_YIELDS' AND Name='Amount' ;


-- Update the Ambassador's ability set
/* DELETE FROM GovernorPromotionSets WHERE GovernorType='GOVERNOR_THE_AMBASSADOR' AND GovernorPromotion='GOVERNOR_PROMOTION_LOCAL_INFORMANTS';

INSERT OR REPLACE INTO GovernorPromotionSets 
	(GovernorType,GovernorPromotion)
VALUES ('GOVERNOR_THE_AMBASSADOR','GOVERNOR_PROMOTION_KHASS_ODA_BASHI');
	
INSERT OR REPLACE INTO GovernorPromotionPrereqs
	(GovernorPromotionType, PrereqGovernorPromotion)
VALUES ('GOVERNOR_PROMOTION_KHASS_ODA_BASHI', 'GOVERNOR_PROMOTION_KHASS_ODA_BASHI');   */



-- New governors
INSERT INTO Types 
	(Type, 					Kind)
VALUES 	('QUO_GOVERNOR_COOK', 		'KIND_GOVERNOR') ,
		('QUO_GOVERNOR_MARINER', 		'KIND_GOVERNOR') ,
		('QUO_GOVERNOR_DRUID', 		'KIND_GOVERNOR') ;

INSERT INTO Governors (
                          GovernorType,
                          Name,
                          Description,
                          IdentityPressure,
                          Title,
                          ShortTitle,
                          TransitionStrength,
                          AssignCityState,
                          Image,
                          PortraitImage,
                          PortraitImageSelected,
                          TraitType
                      )
                      VALUES (
                          'QUO_GOVERNOR_COOK', --'GovernorType',
                          'LOC_QUO_GOVERNOR_COOK_NAME',--'Name',
                          'LOC_QUO_GOVERNOR_COOK_DESCRIPTION',--'Description',
                          8, --'IdentityPressure',
                          'LOC_QUO_GOVERNOR_COOK_TITLE',--'Title',
                          'LOC_QUO_GOVERNOR_COOK_TITLE_SHORT',--'ShortTitle',
                          100, --'TransitionStrength',
                          0, --'AssignCityState',
                          'GOVERNOR_RESOURCE_RESOURCE_MANAGER', --'Image',
                          'GovernorNormal_ResourceManager', --'PortraitImage',
                          'GovernorSelected_ResourceManager', --'PortraitImageSelected',
                          NULL --'TraitType'
                      ),
					  (
                          'QUO_GOVERNOR_MARINER', --'GovernorType',
                          'LOC_QUO_GOVERNOR_MARINER_NAME',--'Name',
                          'LOC_QUO_GOVERNOR_MARINER_DESCRIPTION',--'Description',
                          8, --'IdentityPressure',
                          'LOC_QUO_GOVERNOR_MARINER_TITLE',--'Title',
                          'LOC_QUO_GOVERNOR_MARINER_TITLE_SHORT',--'ShortTitle',
                          100, --'TransitionStrength',
                          0, --'AssignCityState',
                          'GOVERNOR_THE_AMBASSADOR', --'Image',
                          'GovernorNormal_Ambassador', --'PortraitImage',
                          'GovernorSelected_Ambassador', --'PortraitImageSelected',
                          NULL --'TraitType'
                      ),
					  (
                          'QUO_GOVERNOR_DRUID', --'GovernorType',
                          'LOC_QUO_GOVERNOR_DRUID_NAME',--'Name',
                          'LOC_QUO_GOVERNOR_DRUID_DESCRIPTION',--'Description',
                          8, --'IdentityPressure',
                          'LOC_QUO_GOVERNOR_DRUID_TITLE',--'Title',
                          'LOC_QUO_GOVERNOR_DRUID_TITLE_SHORT',--'ShortTitle',
                          100, --'TransitionStrength',
                          0, --'AssignCityState',
                          'GOVERNOR_CARDINAL', --'Image',
                          'GovernorNormal_Cardinal', --'PortraitImage',
                          'GovernorSelected_Cardinal', --'PortraitImageSelected',
                          NULL --'TraitType'
                      );
					  

INSERT INTO Types 
	(Type, 					Kind)
VALUES 	('QUO_GOV_PROMO_FREE_SPY', 		'KIND_GOVERNOR_PROMOTION'),
		('QUO_GOV_PROMO_MARINER_1', 		'KIND_GOVERNOR_PROMOTION'),
		('QUO_GOV_PROMO_MARINER_2', 		'KIND_GOVERNOR_PROMOTION'),
		('QUO_GOV_PROMO_MARINER_3', 		'KIND_GOVERNOR_PROMOTION'),
		('QUO_GOV_PROMO_MARINER_4', 		'KIND_GOVERNOR_PROMOTION'),
		
		('QUO_GOV_PROMO_DRUID_FAITH', 		'KIND_GOVERNOR_PROMOTION'),
		('QUO_GOV_PROMO_DRUID_POP_FAITH', 		'KIND_GOVERNOR_PROMOTION'),
		('QUO_GOV_PROMO_DRUID_ARCHERY', 		'KIND_GOVERNOR_PROMOTION'),
		('QUO_GOV_PROMO_DRUID_APPEAL', 		'KIND_GOVERNOR_PROMOTION');


INSERT INTO GovernorPromotions (
                                   GovernorPromotionType,
                                   Name,
                                   Description,
                                   Level,
                                   [Column],
                                   BaseAbility
                               )
                               VALUES (
                                   'QUO_GOV_PROMO_FREE_SPY', --'GovernorPromotionType',
                                   'LOC_QUO_GOV_PROMO_FREE_SPY_NAME',--'Name',
                                   'LOC_QUO_GOV_PROMO_FREE_SPY_DESCRIPTION',--'Description',
                                   0, --'Level',
                                   1, --'Column',
                                   1--'BaseAbility'
                               ),
							   (
                                   'QUO_GOV_PROMO_MARINER_1', --'GovernorPromotionType',
                                   'LOC_QUO_GOV_PROMO_MARINER_1_NAME',--'Name',
                                   'LOC_QUO_GOV_PROMO_MARINER_1_DESCRIPTION',--'Description',
                                   0, --'Level',
                                   1, --'Column',
                                   1--'BaseAbility'
                               ),							   
							   (
                                   'QUO_GOV_PROMO_MARINER_2', --'GovernorPromotionType',
                                   'LOC_QUO_GOV_PROMO_MARINER_2_NAME',--'Name',
                                   'LOC_QUO_GOV_PROMO_MARINER_2_DESCRIPTION',--'Description',
                                   2, --'Level',
                                   1, --'Column',
                                   0--'BaseAbility'
                               ),						   
							   (
                                   'QUO_GOV_PROMO_MARINER_3', --'GovernorPromotionType',
                                   'LOC_QUO_GOV_PROMO_MARINER_3_NAME',--'Name',
                                   'LOC_QUO_GOV_PROMO_MARINER_3_DESCRIPTION',--'Description',
                                   3, --'Level',
                                   0, --'Column',
                                   0--'BaseAbility'
                               ),							   
							   (
                                   'QUO_GOV_PROMO_MARINER_4', --'GovernorPromotionType',
                                   'LOC_QUO_GOV_PROMO_MARINER_4_NAME',--'Name',
                                   'LOC_QUO_GOV_PROMO_MARINER_4_DESCRIPTION',--'Description',
                                   3, --'Level',
                                   2, --'Column',
                                   0--'BaseAbility'
                               ),							   
							   (
                                   'QUO_GOV_PROMO_DRUID_FAITH', --'GovernorPromotionType',
                                   'LOC_QUO_GOV_PROMO_DRUID_FAITH_NAME',--'Name',
                                   'LOC_QUO_GOV_PROMO_DRUID_FAITH_DESCRIPTION',--'Description',
                                   0, --'Level',
                                   0, --'Column',
                                   1--'BaseAbility'
                               ),							   
							   (
                                   'QUO_GOV_PROMO_DRUID_POP_FAITH', --'GovernorPromotionType',
                                   'LOC_QUO_GOV_PROMO_DRUID_POP_FAITH_NAME',--'Name',
                                   'LOC_QUO_GOV_PROMO_DRUID_POP_FAITH_DESCRIPTION',--'Description',
                                   3, --'Level',
                                   0, --'Column',
                                   0--'BaseAbility'
                               ),
							   (
                                   'QUO_GOV_PROMO_DRUID_APPEAL', --'GovernorPromotionType',
                                   'LOC_QUO_GOV_PROMO_DRUID_APPEAL_NAME',--'Name',
                                   'LOC_QUO_GOV_PROMO_DRUID_APPEAL_DESCRIPTION',--'Description',
                                   2, --'Level',
                                   1, --'Column',
                                   0--'BaseAbility'
                               );

-- fix some of the existing Governor abilities
UPDATE GovernorPromotions SET [Column] = 0 WHERE GovernorPromotionType = 'GOVERNOR_PROMOTION_CARDINAL_LAYING_ON_OF_HANDS';
UPDATE GovernorPromotions SET [Column] = 2 WHERE GovernorPromotionType = 'GOVERNOR_PROMOTION_CARDINAL_GRAND_INQUISITOR';							   


INSERT INTO Modifiers 
	(ModifierId, 	ModifierType, 	RunOnce, Permanent, OwnerRequirementSetId, SubjectRequirementSetId)
VALUES	('QUO_MOD_GOV_MARINER_SEA_SCIENCE', 	'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD', 0, 0, NULL, 'UBOAT_PLOT_IS_OCEAN_REQUIREMENTS') ,
		('QUO_MOD_GOV_MARINER_TRADE_BONUS', 	'MODIFIER_SINGLE_CITY_ADJUST_TRADE_ROUTE_YIELD_TO_OTHERS', 0, 0, NULL, NULL) ,
		('QUO_MOD_GOV_MARINER_TRADE_BONUS_HAMMERS', 	'MODIFIER_SINGLE_CITY_ADJUST_TRADE_ROUTE_YIELD_TO_OTHERS', 0, 0, NULL, NULL) ,
		('QUO_MOD_GOV_MARINER_POP_HAMMERS', 	'MODIFIER_SINGLE_CITY_ADJUST_CITY_YIELD_PER_POPULATION', 0, 0, NULL, NULL) ,
		
		
		
		('QUO_MOD_GOV_DRUID_FAITH_TILES', 	'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD', 0, 0, NULL, 'PLOT_HAS_ANY_PASSABLE_FEATURE_REQUIREMENTS') ,
		('QUO_MOD_GOV_DRUID_POP_FAITH', 	'MODIFIER_SINGLE_CITY_ADJUST_CITY_YIELD_PER_POPULATION', 0, 0, NULL, NULL) ,
		('QUO_MOD_GOV_DRUID_POP_FOOD', 	'MODIFIER_SINGLE_CITY_ADJUST_CITY_YIELD_PER_POPULATION', 0, 0, NULL, NULL) ,
		
		('QUO_MOD_GOV_DRUID_SPREADS', 	'MODIFIER_SINGLE_CITY_RELIGIOUS_SPREADS', 0, 0, NULL, 'MOSQUE_RELIGIOUS_UNIT') ,
		

		('QUO_MOD_GOV_DRUID_APPEAL', 	'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD', 0, 0, NULL, 'PLOT_CHARMING_APPEAL') ,
		('QUO_MOD_GOV_DRUID_APPEAL_LVL2', 	'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD', 0, 0, NULL, 'QUO_REQSET_PLOT_APPEAL_BREATHTAKING') ; -- this reqset is created in the Belief files
		
		
		


INSERT INTO ModifierArguments
	(ModifierId, 			Name, 		Type, 			Value, 					Extra, 	SecondExtra)
VALUES	('QUO_MOD_GOV_MARINER_SEA_SCIENCE', 	'Amount', 	'ARGTYPE_IDENTITY', 	'4',		NULL, 	NULL) ,
		('QUO_MOD_GOV_MARINER_SEA_SCIENCE', 	'YieldType', 	'ARGTYPE_IDENTITY', 	'YIELD_SCIENCE',		NULL, 	NULL) ,
		
		('QUO_MOD_GOV_MARINER_TRADE_BONUS', 	'Amount', 	'ARGTYPE_IDENTITY', 	'8',		NULL, 	NULL) ,
		('QUO_MOD_GOV_MARINER_TRADE_BONUS', 	'Domestic', 	'ARGTYPE_IDENTITY', 	'1',		NULL, 	NULL) ,
		('QUO_MOD_GOV_MARINER_TRADE_BONUS', 	'YieldType', 	'ARGTYPE_IDENTITY', 	'YIELD_GOLD',		NULL, 	NULL) ,
		
		('QUO_MOD_GOV_MARINER_TRADE_BONUS_HAMMERS', 	'Amount', 	'ARGTYPE_IDENTITY', 	'4',		NULL, 	NULL) ,
		('QUO_MOD_GOV_MARINER_TRADE_BONUS_HAMMERS', 	'Domestic', 	'ARGTYPE_IDENTITY', 	'1',		NULL, 	NULL) ,
		('QUO_MOD_GOV_MARINER_TRADE_BONUS_HAMMERS', 	'YieldType', 	'ARGTYPE_IDENTITY', 	'YIELD_PRODUCTION',		NULL, 	NULL) ,
		
		('QUO_MOD_GOV_MARINER_POP_HAMMERS', 	'Amount', 	'ARGTYPE_IDENTITY', 	'0.75',		NULL, 	NULL) ,
		('QUO_MOD_GOV_MARINER_POP_HAMMERS', 	'YieldType', 	'ARGTYPE_IDENTITY', 	'YIELD_PRODUCTION',		NULL, 	NULL) ,
		
		('QUO_MOD_GOV_DRUID_FAITH_TILES', 	'Amount', 	'ARGTYPE_IDENTITY', 	'1',		NULL, 	NULL) ,
		('QUO_MOD_GOV_DRUID_FAITH_TILES', 	'YieldType', 	'ARGTYPE_IDENTITY', 	'YIELD_FAITH',		NULL, 	NULL) ,
		
		('QUO_MOD_GOV_DRUID_POP_FAITH', 	'Amount', 	'ARGTYPE_IDENTITY', 	'1',		NULL, 	NULL) ,
		('QUO_MOD_GOV_DRUID_POP_FAITH', 	'YieldType', 	'ARGTYPE_IDENTITY', 	'YIELD_FAITH',		NULL, 	NULL) ,
		('QUO_MOD_GOV_DRUID_POP_FOOD', 	'Amount', 	'ARGTYPE_IDENTITY', 	'0.5',		NULL, 	NULL) ,
		('QUO_MOD_GOV_DRUID_POP_FOOD', 	'YieldType', 	'ARGTYPE_IDENTITY', 	'YIELD_FOOD',		NULL, 	NULL) ,
		
		('QUO_MOD_GOV_DRUID_SPREADS', 	'Amount', 	'ARGTYPE_IDENTITY', 	'1',		NULL, 	NULL) ,
		
		('QUO_MOD_GOV_DRUID_APPEAL', 	'Amount', 	'ARGTYPE_IDENTITY', 	'1',		NULL, 	NULL) ,
		('QUO_MOD_GOV_DRUID_APPEAL', 	'YieldType', 	'ARGTYPE_IDENTITY', 	'YIELD_CULTURE',		NULL, 	NULL) ,		
		('QUO_MOD_GOV_DRUID_APPEAL_LVL2', 	'Amount', 	'ARGTYPE_IDENTITY', 	'1',		NULL, 	NULL) ,
		('QUO_MOD_GOV_DRUID_APPEAL_LVL2', 	'YieldType', 	'ARGTYPE_IDENTITY', 	'YIELD_CULTURE',		NULL, 	NULL) ;




INSERT INTO GovernorPromotionModifiers
	(GovernorPromotionType, ModifierId)
VALUES	('QUO_GOV_PROMO_MARINER_1','LIGHTHOUSE_COAST_FOOD'),
		('QUO_GOV_PROMO_MARINER_2','QUO_MOD_GOV_MARINER_SEA_SCIENCE'),
		('QUO_GOV_PROMO_MARINER_3','QUO_MOD_GOV_MARINER_TRADE_BONUS'),
		('QUO_GOV_PROMO_MARINER_4','QUO_MOD_GOV_MARINER_POP_HAMMERS'),
		
		('QUO_GOV_PROMO_DRUID_FAITH','QUO_MOD_GOV_DRUID_FAITH_TILES'),
		('QUO_GOV_PROMO_DRUID_FAITH','QUO_MOD_GOV_DRUID_SPREADS'),
		
		('QUO_GOV_PROMO_DRUID_POP_FAITH','QUO_MOD_GOV_DRUID_POP_FAITH'),
		('QUO_GOV_PROMO_DRUID_POP_FAITH','QUO_MOD_GOV_DRUID_POP_FOOD'),
		
		('QUO_GOV_PROMO_DRUID_APPEAL','QUO_MOD_GOV_DRUID_APPEAL'),
		('QUO_GOV_PROMO_DRUID_APPEAL','QUO_MOD_GOV_DRUID_APPEAL_LVL2');
							   
							   
INSERT INTO GovernorPromotionSets 
	(GovernorType,GovernorPromotion)
VALUES ('QUO_GOVERNOR_COOK','QUO_GOV_PROMO_FREE_SPY'),
		('QUO_GOVERNOR_MARINER','QUO_GOV_PROMO_MARINER_1'),
		('QUO_GOVERNOR_MARINER','GOVERNOR_PROMOTION_MERCHANT_HARBORMASTER'),
		('QUO_GOVERNOR_MARINER','GOVERNOR_PROMOTION_AQUACULTURE'),
		('QUO_GOVERNOR_MARINER','QUO_GOV_PROMO_MARINER_2'),
		('QUO_GOVERNOR_MARINER','QUO_GOV_PROMO_MARINER_3'),
		('QUO_GOVERNOR_MARINER','QUO_GOV_PROMO_MARINER_4'),
		
		('QUO_GOVERNOR_DRUID','QUO_GOV_PROMO_DRUID_FAITH'),
		('QUO_GOVERNOR_DRUID','GOVERNOR_PROMOTION_MERCHANT_FORESTRY_MANAGEMENT'),
		('QUO_GOVERNOR_DRUID','GOVERNOR_PROMOTION_CARDINAL_DIVINE_ARCHITECT'),
		('QUO_GOVERNOR_DRUID','QUO_GOV_PROMO_DRUID_POP_FAITH'),
		('QUO_GOVERNOR_DRUID','GOVERNOR_PROMOTION_CARDINAL_LAYING_ON_OF_HANDS'),
		--('QUO_GOVERNOR_DRUID','GOVERNOR_PROMOTION_EMBRASURE'),
		('QUO_GOVERNOR_DRUID','QUO_GOV_PROMO_DRUID_APPEAL');

		
INSERT INTO GovernorPromotionPrereqs
	(GovernorPromotionType, PrereqGovernorPromotion)
VALUES ('GOVERNOR_PROMOTION_MERCHANT_HARBORMASTER','QUO_GOV_PROMO_MARINER_1'),
		('GOVERNOR_PROMOTION_AQUACULTURE','QUO_GOV_PROMO_MARINER_1'),
		('QUO_GOV_PROMO_MARINER_2','GOVERNOR_PROMOTION_MERCHANT_HARBORMASTER'),
		('QUO_GOV_PROMO_MARINER_2','GOVERNOR_PROMOTION_AQUACULTURE'),
		('QUO_GOV_PROMO_MARINER_3','QUO_GOV_PROMO_MARINER_2'),
		('QUO_GOV_PROMO_MARINER_4','QUO_GOV_PROMO_MARINER_2'),
		
		('GOVERNOR_PROMOTION_CARDINAL_LAYING_ON_OF_HANDS','QUO_GOV_PROMO_DRUID_FAITH'),
		('GOVERNOR_PROMOTION_MERCHANT_FORESTRY_MANAGEMENT','QUO_GOV_PROMO_DRUID_FAITH'),
		('QUO_GOV_PROMO_DRUID_APPEAL','GOVERNOR_PROMOTION_CARDINAL_LAYING_ON_OF_HANDS'),
		('QUO_GOV_PROMO_DRUID_APPEAL','GOVERNOR_PROMOTION_MERCHANT_FORESTRY_MANAGEMENT'),
		('QUO_GOV_PROMO_DRUID_POP_FAITH','QUO_GOV_PROMO_DRUID_APPEAL'),
		('GOVERNOR_PROMOTION_CARDINAL_DIVINE_ARCHITECT','QUO_GOV_PROMO_DRUID_APPEAL');
		
-- no trait type yet. we will assign further down when all Governors receive their traits in case
-- we add an option later to make all Governors available.


-- Governor traits

INSERT INTO Types 
	(Type, 					Kind)
VALUES 	('QUO_TRAIT_GOVERNOR_MERCHANT', 		'KIND_TRAIT'),
		('QUO_TRAIT_GOVERNOR_CARDINAL', 		'KIND_TRAIT'),
		('QUO_TRAIT_GOVERNOR_DEFENDER', 		'KIND_TRAIT'),
		('QUO_TRAIT_GOVERNOR_BUILDER', 		'KIND_TRAIT'),
		('QUO_TRAIT_GOVERNOR_EDUCATOR', 		'KIND_TRAIT'),
		--('QUO_TRAIT_GOVERNOR_IBRAHIM', 		'KIND_TRAIT'),
		('QUO_TRAIT_GOVERNOR_RESOURCE', 		'KIND_TRAIT'),
		('QUO_TRAIT_GOVERNOR_AMBASSADOR', 		'KIND_TRAIT'),
		('QUO_TRAIT_GOVERNOR_COOK', 		'KIND_TRAIT'),
		('QUO_TRAIT_GOVERNOR_MARINER', 		'KIND_TRAIT'),
		('QUO_TRAIT_GOVERNOR_DRUID', 		'KIND_TRAIT');

		
INSERT INTO Traits 
	(TraitType,			Name,						Description,						InternalOnly)
VALUES ('QUO_TRAIT_GOVERNOR_MERCHANT',	NULL,		NULL,		0) ,
		('QUO_TRAIT_GOVERNOR_CARDINAL',	NULL,		NULL,		0) ,
		('QUO_TRAIT_GOVERNOR_DEFENDER',	NULL,		NULL,		0) ,
		('QUO_TRAIT_GOVERNOR_BUILDER',	NULL,		NULL,		0) ,
		('QUO_TRAIT_GOVERNOR_EDUCATOR',	NULL,		NULL,		0) ,
		--('QUO_TRAIT_GOVERNOR_IBRAHIM',	NULL,		NULL,		0) ,
		('QUO_TRAIT_GOVERNOR_RESOURCE',	NULL,		NULL,		0) ,
		('QUO_TRAIT_GOVERNOR_AMBASSADOR',	NULL,		NULL,		0) ,
		('QUO_TRAIT_GOVERNOR_COOK',	NULL,		NULL,		0) ,
		('QUO_TRAIT_GOVERNOR_MARINER',	NULL,		NULL,		0) ,
		('QUO_TRAIT_GOVERNOR_DRUID',	NULL,		NULL,		0) ;


-- Add a TraitType to the governor. 
-- Added in v8.0.5: Only do this if Biomes are enabled.
UPDATE Governors SET TraitType ='QUO_TRAIT_GOVERNOR_MERCHANT' WHERE GovernorType= 'GOVERNOR_THE_MERCHANT' AND EXISTS (SELECT VALUE from tblQuoOptions WHERE OptionID='QUO_OPTION_ENABLE_BIOMES' AND Value >= 1);
UPDATE Governors SET TraitType ='QUO_TRAIT_GOVERNOR_CARDINAL' WHERE GovernorType= 'GOVERNOR_THE_CARDINAL' AND EXISTS (SELECT VALUE from tblQuoOptions WHERE OptionID='QUO_OPTION_ENABLE_BIOMES' AND Value >= 1);
UPDATE Governors SET TraitType ='QUO_TRAIT_GOVERNOR_DEFENDER' WHERE GovernorType= 'GOVERNOR_THE_DEFENDER' AND EXISTS (SELECT VALUE from tblQuoOptions WHERE OptionID='QUO_OPTION_ENABLE_BIOMES' AND Value >= 1);
UPDATE Governors SET TraitType ='QUO_TRAIT_GOVERNOR_BUILDER' WHERE GovernorType= 'GOVERNOR_THE_BUILDER' AND EXISTS (SELECT VALUE from tblQuoOptions WHERE OptionID='QUO_OPTION_ENABLE_BIOMES' AND Value >= 1);
UPDATE Governors SET TraitType ='QUO_TRAIT_GOVERNOR_EDUCATOR' WHERE GovernorType= 'GOVERNOR_THE_EDUCATOR' AND EXISTS (SELECT VALUE from tblQuoOptions WHERE OptionID='QUO_OPTION_ENABLE_BIOMES' AND Value >= 1);
--UPDATE Governors SET TraitType ='QUO_TRAIT_GOVERNOR_IBRAHIM' WHERE GovernorType= 'GOVERNOR_IBRAHIM' AND EXISTS (SELECT VALUE from tblQuoOptions WHERE OptionID='QUO_OPTION_ENABLE_BIOMES' AND Value >= 1);
UPDATE Governors SET TraitType ='QUO_TRAIT_GOVERNOR_AMBASSADOR' WHERE GovernorType= 'GOVERNOR_THE_AMBASSADOR' AND EXISTS (SELECT VALUE from tblQuoOptions WHERE OptionID='QUO_OPTION_ENABLE_BIOMES' AND Value >= 1);
UPDATE Governors SET TraitType ='QUO_TRAIT_GOVERNOR_RESOURCE' WHERE GovernorType= 'GOVERNOR_THE_RESOURCE_MANAGER' AND EXISTS (SELECT VALUE from tblQuoOptions WHERE OptionID='QUO_OPTION_ENABLE_BIOMES' AND Value >= 1);
UPDATE Governors SET TraitType ='QUO_TRAIT_GOVERNOR_COOK' WHERE GovernorType= 'QUO_GOVERNOR_COOK' AND EXISTS (SELECT VALUE from tblQuoOptions WHERE OptionID='QUO_OPTION_ENABLE_BIOMES' AND Value >= 1);
UPDATE Governors SET TraitType ='QUO_TRAIT_GOVERNOR_MARINER' WHERE GovernorType= 'QUO_GOVERNOR_MARINER' AND EXISTS (SELECT VALUE from tblQuoOptions WHERE OptionID='QUO_OPTION_ENABLE_BIOMES' AND Value >= 1);
UPDATE Governors SET TraitType ='QUO_TRAIT_GOVERNOR_DRUID' WHERE GovernorType= 'QUO_GOVERNOR_DRUID' AND EXISTS (SELECT VALUE from tblQuoOptions WHERE OptionID='QUO_OPTION_ENABLE_BIOMES' AND Value >= 1);






-- Governor clones
-- updated V8.0.11 to include only specific governors (ie no secret society governors)
create table tblQuoTempGovernors as
select * from governors where GovernorType in 
('GOVERNOR_THE_DEFENDER',
'GOVERNOR_THE_AMBASSADOR',
'GOVERNOR_THE_CARDINAL',
'GOVERNOR_THE_RESOURCE_MANAGER',
'GOVERNOR_THE_BUILDER',
'GOVERNOR_THE_EDUCATOR',
'GOVERNOR_THE_MERCHANT',
'GOVERNOR_IBRAHIM',
'QUO_GOVERNOR_MARINER',
'QUO_GOVERNOR_DRUID');



INSERT INTO Types 
	(Type, 					Kind)
SELECT 'QUO_' || tblQuoTempGovernors.GovernorType || '_CLONE', 		'KIND_GOVERNOR'
FROM tblQuoTempGovernors;

-- Here we clone each existing governor with a name structured as QUO_ _CLONE. 
-- The trait type will be the name of the governor with _CLONE tacked on
INSERT INTO Types 
	(Type, 					Kind)
SELECT tblQuoTempGovernors.TraitType || '_CLONE', 		'KIND_TRAIT'
FROM tblQuoTempGovernors
WHERE tblQuoTempGovernors.TraitType is not null;


INSERT INTO Traits 
	(TraitType,			Name,						Description,						InternalOnly)
SELECT tblQuoTempGovernors.TraitType || '_CLONE',	NULL,		NULL,		0
FROM tblQuoTempGovernors
WHERE tblQuoTempGovernors.TraitType is not null;


INSERT INTO Governors
	(GovernorType, Name, Description, IdentityPressure, Title, ShortTitle, TransitionStrength, AssignCityState,Image, PortraitImage, PortraitImageSelected, TraitType)
SELECT 'QUO_' || tblQuoTempGovernors.GovernorType || '_CLONE', 
		'QUO_'|| tblQuoTempGovernors.Name, 
		tblQuoTempGovernors.Description, 
		tblQuoTempGovernors.IdentityPressure, 
		tblQuoTempGovernors.Title, 
		tblQuoTempGovernors.ShortTitle, 
		tblQuoTempGovernors.TransitionStrength, 
		tblQuoTempGovernors.AssignCityState, 
		tblQuoTempGovernors.Image, -- reuse existing
		tblQuoTempGovernors.PortraitImage, -- reuse existing
		tblQuoTempGovernors.PortraitImageSelected, -- reuse existing
		tblQuoTempGovernors.TraitType || '_CLONE'
from tblQuoTempGovernors;


-- copy the promotions
INSERT OR IGNORE INTO GovernorPromotionSets (GovernorType,GovernorPromotion)
SELECT  'QUO_' || tblQuoTempGovernors.GovernorType || '_CLONE', GovernorPromotion
from tblQuoTempGovernors
left join GovernorPromotionSets using (governortype);




CREATE TABLE tblBiomeGovernors
(
	xTrait text,
	xGovernorTrait text
);


INSERT INTO tblBiomeGovernors
		(xTrait,xGovernorTrait)
VALUES	('QUO_TRAIT_BIOME_ASIAN_STEPPE','QUO_TRAIT_GOVERNOR_DEFENDER')	,
		('QUO_TRAIT_BIOME_ASIAN_STEPPE','QUO_TRAIT_GOVERNOR_DEFENDER_CLONE')	,
		('QUO_TRAIT_BIOME_ASIAN_STEPPE','QUO_TRAIT_GOVERNOR_DRUID')	,
		('QUO_TRAIT_BIOME_ASIAN_STEPPE','QUO_TRAIT_GOVERNOR_BUILDER')	,
		('QUO_TRAIT_BIOME_ASIAN_STEPPE','QUO_TRAIT_GOVERNOR_RESOURCE')	,
		('QUO_TRAIT_BIOME_ASIAN_STEPPE','TRAIT_LEADER_SULEIMAN_GOVERNOR_CLONE')	, -- use the clone rather than the real version
		
		('QUO_TRAIT_BIOME_NATIVE_AMERICA','QUO_TRAIT_GOVERNOR_BUILDER')	,
		('QUO_TRAIT_BIOME_NATIVE_AMERICA','QUO_TRAIT_GOVERNOR_DRUID')	,
		('QUO_TRAIT_BIOME_NATIVE_AMERICA','QUO_TRAIT_GOVERNOR_DRUID_CLONE')	,
		('QUO_TRAIT_BIOME_NATIVE_AMERICA','QUO_TRAIT_GOVERNOR_EDUCATOR')	,
		('QUO_TRAIT_BIOME_NATIVE_AMERICA','QUO_TRAIT_GOVERNOR_AMBASSADOR')	,
		('QUO_TRAIT_BIOME_NATIVE_AMERICA','QUO_TRAIT_GOVERNOR_MERCHANT')	,
		
		('QUO_TRAIT_BIOME_NEW_WORLD','QUO_TRAIT_GOVERNOR_MERCHANT')	,
		('QUO_TRAIT_BIOME_NEW_WORLD','QUO_TRAIT_GOVERNOR_BUILDER')	,
		('QUO_TRAIT_BIOME_NEW_WORLD','QUO_TRAIT_GOVERNOR_RESOURCE')	,
		('QUO_TRAIT_BIOME_NEW_WORLD','QUO_TRAIT_GOVERNOR_DEFENDER')	,
		('QUO_TRAIT_BIOME_NEW_WORLD','QUO_TRAIT_GOVERNOR_EDUCATOR')	,
		('QUO_TRAIT_BIOME_NEW_WORLD','QUO_TRAIT_GOVERNOR_AMBASSADOR')	,
		('QUO_TRAIT_BIOME_NEW_WORLD','QUO_TRAIT_GOVERNOR_DRUID')	,
		('QUO_TRAIT_BIOME_NEW_WORLD','QUO_TRAIT_GOVERNOR_MARINER')	,
		('QUO_TRAIT_BIOME_NEW_WORLD','QUO_TRAIT_GOVERNOR_CARDINAL')	,
		('QUO_TRAIT_BIOME_NEW_WORLD','TRAIT_LEADER_SULEIMAN_GOVERNOR_CLONE')	,
				
		('QUO_TRAIT_BIOME_BOREAL_EUROPE','QUO_TRAIT_GOVERNOR_RESOURCE')	,
		('QUO_TRAIT_BIOME_BOREAL_EUROPE','QUO_TRAIT_GOVERNOR_AMBASSADOR')	,
		('QUO_TRAIT_BIOME_BOREAL_EUROPE','QUO_TRAIT_GOVERNOR_AMBASSADOR_CLONE')	,
		('QUO_TRAIT_BIOME_BOREAL_EUROPE','QUO_TRAIT_GOVERNOR_MARINER')	,
		('QUO_TRAIT_BIOME_BOREAL_EUROPE','QUO_TRAIT_GOVERNOR_EDUCATOR')	,
		('QUO_TRAIT_BIOME_BOREAL_EUROPE','QUO_TRAIT_GOVERNOR_EDUCATOR_CLONE')	,
						
		('QUO_TRAIT_BIOME_ASIAN_PACIFIC','QUO_TRAIT_GOVERNOR_MERCHANT')	,
		('QUO_TRAIT_BIOME_ASIAN_PACIFIC','QUO_TRAIT_GOVERNOR_MARINER')	,
		('QUO_TRAIT_BIOME_ASIAN_PACIFIC','QUO_TRAIT_GOVERNOR_MARINER_CLONE')	,
		('QUO_TRAIT_BIOME_ASIAN_PACIFIC','QUO_TRAIT_GOVERNOR_EDUCATOR')	,
		('QUO_TRAIT_BIOME_ASIAN_PACIFIC','QUO_TRAIT_GOVERNOR_DRUID')	,
		('QUO_TRAIT_BIOME_ASIAN_PACIFIC','QUO_TRAIT_GOVERNOR_RESOURCE')	,
								
		('QUO_TRAIT_BIOME_ROMANESQUE','QUO_TRAIT_GOVERNOR_MERCHANT')	,
		('QUO_TRAIT_BIOME_ROMANESQUE','QUO_TRAIT_GOVERNOR_BUILDER')	,
		('QUO_TRAIT_BIOME_ROMANESQUE','QUO_TRAIT_GOVERNOR_EDUCATOR')	,
		('QUO_TRAIT_BIOME_ROMANESQUE','QUO_TRAIT_GOVERNOR_RESOURCE')	,
		('QUO_TRAIT_BIOME_ROMANESQUE','QUO_TRAIT_GOVERNOR_AMBASSADOR')	,
		('QUO_TRAIT_BIOME_ROMANESQUE','QUO_TRAIT_GOVERNOR_AMBASSADOR_CLONE')	,
										
		('QUO_TRAIT_BIOME_ARABESQUE','QUO_TRAIT_GOVERNOR_MERCHANT')	,		
		('QUO_TRAIT_BIOME_ARABESQUE','QUO_TRAIT_GOVERNOR_CARDINAL')	,
		('QUO_TRAIT_BIOME_ARABESQUE','QUO_TRAIT_GOVERNOR_CARDINAL_CLONE')	,
		('QUO_TRAIT_BIOME_ARABESQUE','QUO_TRAIT_GOVERNOR_DRUID')	,
		('QUO_TRAIT_BIOME_ARABESQUE','TRAIT_LEADER_SULEIMAN_GOVERNOR_CLONE')	,
		('QUO_TRAIT_BIOME_ARABESQUE','QUO_TRAIT_GOVERNOR_EDUCATOR')	,
								
		('QUO_TRAIT_BIOME_AFRICA','QUO_TRAIT_GOVERNOR_MERCHANT')	,
		('QUO_TRAIT_BIOME_AFRICA','QUO_TRAIT_GOVERNOR_BUILDER')	,
		('QUO_TRAIT_BIOME_AFRICA','QUO_TRAIT_GOVERNOR_EDUCATOR')	,
		('QUO_TRAIT_BIOME_AFRICA','QUO_TRAIT_GOVERNOR_DEFENDER')	,
		('QUO_TRAIT_BIOME_AFRICA','QUO_TRAIT_GOVERNOR_DRUID')	,
		('QUO_TRAIT_BIOME_AFRICA','QUO_TRAIT_GOVERNOR_RESOURCE')	,
										
		('QUO_TRAIT_BIOME_ASIAN_EXPANSE','QUO_TRAIT_GOVERNOR_MERCHANT')	,
		('QUO_TRAIT_BIOME_ASIAN_EXPANSE','QUO_TRAIT_GOVERNOR_MERCHANT_CLONE') ,
		('QUO_TRAIT_BIOME_ASIAN_EXPANSE','QUO_TRAIT_GOVERNOR_BUILDER')	,
		('QUO_TRAIT_BIOME_ASIAN_EXPANSE','QUO_TRAIT_GOVERNOR_BUILDER_CLONE')	,
		('QUO_TRAIT_BIOME_ASIAN_EXPANSE','QUO_TRAIT_GOVERNOR_EDUCATOR')	,
		('QUO_TRAIT_BIOME_ASIAN_EXPANSE','QUO_TRAIT_GOVERNOR_EDUCATOR_CLONE')	,
		('QUO_TRAIT_BIOME_ASIAN_EXPANSE','QUO_TRAIT_GOVERNOR_DRUID')	,
		('QUO_TRAIT_BIOME_ASIAN_EXPANSE','QUO_TRAIT_GOVERNOR_DRUID_CLONE')	,
		('QUO_TRAIT_BIOME_ASIAN_EXPANSE','QUO_TRAIT_GOVERNOR_CARDINAL')	,
		('QUO_TRAIT_BIOME_ASIAN_EXPANSE','QUO_TRAIT_GOVERNOR_CARDINAL_CLONE')	,

		('QUO_TRAIT_BIOME_WEST_EUROPE','QUO_TRAIT_GOVERNOR_MERCHANT')	,
		('QUO_TRAIT_BIOME_WEST_EUROPE','QUO_TRAIT_GOVERNOR_CARDINAL')	,
		('QUO_TRAIT_BIOME_WEST_EUROPE','QUO_TRAIT_GOVERNOR_EDUCATOR')	,
		('QUO_TRAIT_BIOME_WEST_EUROPE','QUO_TRAIT_GOVERNOR_DEFENDER')	,
		('QUO_TRAIT_BIOME_WEST_EUROPE','QUO_TRAIT_GOVERNOR_MARINER')	,
		('QUO_TRAIT_BIOME_WEST_EUROPE','QUO_TRAIT_GOVERNOR_RESOURCE')	,
												
		('QUO_TRAIT_BIOME_UK','QUO_TRAIT_GOVERNOR_MARINER')	,
		('QUO_TRAIT_BIOME_UK','QUO_TRAIT_GOVERNOR_MARINER_CLONE')	,
		('QUO_TRAIT_BIOME_UK','QUO_TRAIT_GOVERNOR_AMBASSADOR')	,
		('QUO_TRAIT_BIOME_UK','QUO_TRAIT_GOVERNOR_DEFENDER')	,
		('QUO_TRAIT_BIOME_UK','QUO_TRAIT_GOVERNOR_RESOURCE')	,
		('QUO_TRAIT_BIOME_UK','QUO_TRAIT_GOVERNOR_EDUCATOR')	,
																
		('QUO_TRAIT_BIOME_EAST_EUROPE','QUO_TRAIT_GOVERNOR_CARDINAL')	,
		('QUO_TRAIT_BIOME_EAST_EUROPE','QUO_TRAIT_GOVERNOR_CARDINAL_CLONE')	,
		('QUO_TRAIT_BIOME_EAST_EUROPE','QUO_TRAIT_GOVERNOR_EDUCATOR')	,
		('QUO_TRAIT_BIOME_EAST_EUROPE','QUO_TRAIT_GOVERNOR_DEFENDER')	,
		('QUO_TRAIT_BIOME_EAST_EUROPE','QUO_TRAIT_GOVERNOR_RESOURCE')	,
		('QUO_TRAIT_BIOME_EAST_EUROPE','QUO_TRAIT_GOVERNOR_RESOURCE_CLONE')	,
																		
		('QUO_TRAIT_BIOME_NORTH_AFRICA','TRAIT_LEADER_SULEIMAN_GOVERNOR')	,
		('QUO_TRAIT_BIOME_NORTH_AFRICA','QUO_TRAIT_GOVERNOR_MARINER')	,
		('QUO_TRAIT_BIOME_NORTH_AFRICA','QUO_TRAIT_GOVERNOR_EDUCATOR')	,
		('QUO_TRAIT_BIOME_NORTH_AFRICA','QUO_TRAIT_GOVERNOR_CARDINAL')	,
		('QUO_TRAIT_BIOME_NORTH_AFRICA','QUO_TRAIT_GOVERNOR_MERCHANT')	,
		('QUO_TRAIT_BIOME_NORTH_AFRICA','QUO_TRAIT_GOVERNOR_MERCHANT_CLONE')	;
		
	

CREATE TABLE tblBiomeGovernorTraitMapping AS
select CivilizationType as xCivType, TraitType as xTraitType, xGovernorTrait from civilizationtraits 
inner join tblBiomeGovernors on civilizationtraits.TraitType = tblBiomeGovernors.xTrait ;

		
INSERT OR REPLACE INTO CivilizationTraits
		(CivilizationType, TraitType)
SELECT xCivType, xGovernorTrait
FROM tblBiomeGovernorTraitMapping
	WHERE EXISTS (SELECT 1 FROM Civilizations WHERE CivilizationType = tblBiomeGovernorTraitMapping.xCivType)
		AND EXISTS (SELECT 1 FROM tblQuoOptions WHERE OptionId='QUO_OPTION_ENABLE_BIOMES' AND Value > 0) ;





		
		


-- UPDATE BUG TRACKER
-- This code should go last in every file

UPDATE tblQuoDebug SET x_Close='1' WHERE DebugID='Quo_Governors_Code';
