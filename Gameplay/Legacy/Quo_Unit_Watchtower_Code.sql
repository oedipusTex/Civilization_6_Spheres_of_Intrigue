/*
    Created by Quo
*/
 

-- The Watchtower.


-- LOGS


-- Debug
INSERT INTO tblQuoDebug 
	(DebugID, 		x_Open, x_Close, 	Message)
VALUES ('Quo_Unit_Watchtower_Code',	'1',	'0',		'') ;

/*
INSERT INTO Types
	(Type, 				Kind)
VALUES 	('QUO_UNIT_WATCHTOWER',		'KIND_UNIT'	) ;


INSERT INTO Units (
                      UnitType,
                      Name,
                      BaseSightRange,
                      BaseMoves,
                      Combat,
                      RangedCombat,
                      Range,
                      Bombard,
                      Domain,
                      FormationClass,
                      Cost,
                      PopulationCost,
                      FoundCity,
                      FoundReligion,
                      MakeTradeRoute,
                      EvangelizeBelief,
                      LaunchInquisition,
                      RequiresInquisition,
                      BuildCharges,
                      ReligiousStrength,
                      ReligionEvictPercent,
                      SpreadCharges,
                      ExtractsArtifacts,
                      Description,
                      Flavor,
                      CanCapture,
                      CanRetreatWhenCaptured,
                      TraitType,
                      AllowBarbarians,
                      CostProgressionModel,
                      CostProgressionParam1,
                      PromotionClass,
                      InitialLevel,
                      NumRandomChoices,
                      PrereqTech,
                      PrereqCivic,
                      PrereqDistrict,
                      PrereqPopulation,
                      LeaderType,
                      CanTrain,
                      StrategicResource,
                      PurchaseYield,
                      MustPurchase,
                      Maintenance,
                      Stackable,
                      AirSlots,
                      CanTargetAir,
                      PseudoYieldType,
                      ZoneOfControl,
                      AntiAirCombat,
                      Spy,
                      WMDCapable,
                      ParkCharges,
                      IgnoreMoves,
                      TeamVisibility,
                      ObsoleteTech,
                      ObsoleteCivic,
                      MandatoryObsoleteTech,
                      MandatoryObsoleteCivic,
                      AdvisorType
                  )
                  VALUES (
                      'QUO_UNIT_WATCHTOWER'-- 'UnitType',
                      , 'LOC_QUO_UNIT_WATCHTOWER_NAME'-- 'Name',
                      , 5-- 'BaseSightRange',
                      , 0-- 'BaseMoves',
                      , 0-- 'Combat',
                      , 0-- 'RangedCombat',
                      , 0-- 'Range',
                      , 0-- 'Bombard',
                      , 'DOMAIN_LAND'-- 'Domain',
                      , 'FORMATION_CLASS_CIVILIAN' -- 'FormationClass',
                      , 9999 -- 'Cost',
                      , 0 -- 'PopulationCost',
                      , 0 -- 'FoundCity',
                      ,0 -- 'FoundReligion',
                      ,0-- 'MakeTradeRoute',
                      ,0-- 'EvangelizeBelief',
                      ,0-- 'LaunchInquisition',
                      ,0-- 'RequiresInquisition',
                      ,0-- 'BuildCharges',
                      ,0-- 'ReligiousStrength',
                      ,0-- 'ReligionEvictPercent',
                      ,0-- 'SpreadCharges',
                      ,0-- 'ExtractsArtifacts',
                      , 'LOC_QUO_UNIT_WATCHTOWER_DESCRIPTION'-- 'Description',
                      , NULL -- 'Flavor',
                      ,0 -- 'CanCapture',
                      ,0 -- 'CanRetreatWhenCaptured',
                      , NULL -- 'TraitType',
                      , 0 -- 'AllowBarbarians',
                      , 'NO_COST_PROGRESSION' -- 'CostProgressionModel',
                      , 0 -- 'CostProgressionParam1',
                      , NULL -- 'PromotionClass',
                      , 0 -- 'InitialLevel',
                      , 0 -- 'NumRandomChoices',
                      , NULL -- 'PrereqTech',
                      , NULL -- 'PrereqCivic',
                      , NULL -- 'PrereqDistrict',
                      , NULL -- 'PrereqPopulation',
                      , NULL -- 'LeaderType',
                      , 0 -- 'CanTrain',
                      , NULL -- 'StrategicResource',
                      , NULL -- 'PurchaseYield',
                      , 1 -- 'MustPurchase',
                      , 0 -- 'Maintenance',
                      , 1 -- 'Stackable',
                      , 0 -- 'AirSlots',
                      , 0 -- 'CanTargetAir',
                      , NULL -- 'PseudoYieldType',
                      , 0 -- 'ZoneOfControl',
                      , 0 -- 'AntiAirCombat',
                      , 0 -- 'Spy',
                      , 0 -- 'WMDCapable',
                      , 0 -- 'ParkCharges',
                      , 1-- 'IgnoreMoves',
                      , 0 -- 'TeamVisibility',
                      , NULL -- 'ObsoleteTech',
                      , NULL -- 'ObsoleteCivic',
                      , NULL -- 'MandatoryObsoleteTech',
                      , NULL -- 'MandatoryObsoleteCivic',
                      , NULL  -- 'AdvisorType'
                  );
*/


-- UPDATE BUG TRACKER
-- This code should go last in every file

UPDATE tblQuoDebug SET x_Close='1' WHERE DebugID='Quo_Unit_Watchtower_Code';