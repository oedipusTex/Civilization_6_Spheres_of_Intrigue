/* 

This file sets up the dependencies for the Improvements Patch merger. It runs prior to all of the XAV code.


*/

INSERT INTO tblQuoDebug 
	(DebugID, 		x_Open, x_Close, 	Message)
VALUES ('Xav_AA_Setup_Code',	'1',	'0',		'Set up for XAV Improvements Patch.') ;


/* 
I converted the various Requirements that were originally located inside the Policy files 
because there were dependencies between the requirements established there and other files.
Added the tag XAV_ to ensure there are no conflicts.
*/


INSERT INTO RequirementSets (
                                RequirementSetType,
                                RequirementSetId
                            )
                            VALUES (
                                'REQUIREMENTSET_TEST_ALL',
                                'XAV_UNIT_IS_FIGHTER'
                            ),
                            (
                                'REQUIREMENTSET_TEST_ALL',
                                'XAV_UNIT_IS_BOMBER'
                            ),
                            (
                                'REQUIREMENTSET_TEST_ALL',
                                'XAV_PLOT_HAS_PLANTATION'
                            ),
                            (
                                'REQUIREMENTSET_TEST_ALL',
                                'XAV_PLOT_HAS_LUXURY'
                            ),
                            (
                                'REQUIREMENTSET_TEST_ALL',
                                'XAV_PLOT_HAS_BONUS'
                            ),
                            (
                                'REQUIREMENTSET_TEST_ALL',
                                'XAV_PLOT_HAS_STRATEGIC'
                            ),
                            (
                                'REQUIREMENTSET_TEST_ANY',
                                'XAV_CITY_HAS_WALLS_OR_CASTLE'
                            ),
                            (
                                'REQUIREMENTSET_TEST_ANY',
                                'XAV_PLOT_HAS_COAST'
                            ),
                            (
                                'REQUIREMENTSET_TEST_ALL',
                                'XAV_HAS_POLICY_ACTIVE'
                            ),
                            (
                                'REQUIREMENTSET_TEST_ALL',
                                'XAV_DISTRICT_IS_ROYAL_DOCKYARD'
                            ),
                            (
                                'REQUIREMENTSET_TEST_ALL',
                                'XAV_PLOT_HAS_LUMBERMILL_REQUIREMENTS'
                            ),
                            (
                                'REQUIREMENTSET_TEST_ALL',
                                'XAV_DISTRICT_IS_NEIGHBORHOOD'
                            ),
                            (
                                'REQUIREMENTSET_TEST_ANY',
                                'XAV_PLOT_HAS_OIL_IMPROVEMENTS'
                            );



INSERT INTO Requirements (
                             Triggered,
                             ProgressWeight,
                             Persistent,
                             Reverse,
                             Inverse,
                             Impact,
                             Likeliness,
                             RequirementType,
                             RequirementId
                         )
                         VALUES (
                             0,
                             1,
                             0,
                             0,
                             0,
                             0,
                             0,
                             'REQUIREMENT_CITY_HAS_BUILDING',
                             'XAV_REQUIRES_CITY_HAS_OBSERVATORY'
                         ),
                         (
                             0,
                             1,
                             0,
                             0,
                             0,
                             0,
                             0,
                             'REQUIREMENT_UNIT_PROMOTION_CLASS_MATCHES',
                             'XAV_REQUIRES_UNIT_IS_FIGHTER'
                         ),
                         (
                             0,
                             1,
                             0,
                             0,
                             0,
                             0,
                             0,
                             'REQUIREMENT_UNIT_PROMOTION_CLASS_MATCHES',
                             'XAV_REQUIRES_UNIT_IS_BOMBER'
                         ),
                         (
                             0,
                             1,
                             0,
                             0,
                             0,
                             0,
                             0,
                             'REQUIREMENT_CITY_HAS_BUILDING',
                             'XAV_REQUIRES_CITY_HAS_CASTLE'
                         ),
                         (
                             0,
                             1,
                             0,
                             0,
                             0,
                             0,
                             0,
                             'REQUIREMENT_CITY_HAS_BUILDING',
                             'XAV_REQUIRES_CITY_HAS_WALLS'
                         ),
                         (
                             0,
                             1,
                             0,
                             0,
                             0,
                             0,
                             0,
                             'REQUIREMENT_PLOT_TERRAIN_TYPE_MATCHES',
                             'XAV_REQUIRES_PLOT_HAS_OCEAN'
                         ),
                         (
                             0,
                             1,
                             0,
                             0,
                             0,
                             0,
                             0,
                             'REQUIREMENT_HAS_POLICY_ACTIVE',
                             'XAV_REQUIRES_HAS_POLICY_ACTIVE'
                         ),
                         (
                             0,
                             1,
                             0,
                             0,
                             0,
                             0,
                             0,
                             'REQUIREMENT_DISTRICT_TYPE_MATCHES',
                             'XAV_REQUIRES_DISTRICT_IS_ROYAL_DOCKYARD'
                         ),
                         (
                             0,
                             1,
                             0,
                             0,
                             0,
                             0,
                             0,
                             'REQUIREMENT_PLOT_IMPROVEMENT_TYPE_MATCHES',
                             'XAV_REQUIRES_PLOT_HAS_LUMBERMILL'
                         ),
                         (
                             0,
                             1,
                             0,
                             0,
                             0,
                             0,
                             0,
                             'REQUIREMENT_DISTRICT_TYPE_MATCHES',
                             'XAV_REQUIRES_DISTRICT_IS_NEIGHBORHOOD'
                         ),
                         (
                             0,
                             1,
                             0,
                             0,
                             0,
                             0,
                             0,
                             'REQUIREMENT_PLOT_IMPROVEMENT_TYPE_MATCHES',
                             'XAV_REQUIRES_PLOT_HAS_OIL_WELL'
                         ),
                         (
                             0,
                             1,
                             0,
                             0,
                             0,
                             0,
                             0,
                             'REQUIREMENT_PLOT_IMPROVEMENT_TYPE_MATCHES',
                             'XAV_REQUIRES_PLOT_HAS_OFFSHORE_OIL_RIG'
                         );


		

INSERT INTO RequirementArguments (
                                     SecondExtra,
                                     Extra,
                                     Value,
                                     Type,
                                     Name,
                                     RequirementId
                                 )
                                 VALUES (
                                     NULL,
                                     NULL,
                                     'PROMOTION_CLASS_AIR_FIGHTER',
                                     'ARGTYPE_IDENTITY',
                                     'UnitPromotionClass',
                                     'XAV_REQUIRES_UNIT_IS_FIGHTER'
                                 ),
                                 (
                                     NULL,
                                     NULL,
                                     'PROMOTION_CLASS_AIR_BOMBER',
                                     'ARGTYPE_IDENTITY',
                                     'UnitPromotionClass',
                                     'XAV_REQUIRES_UNIT_IS_BOMBER'
                                 ),
                                 (
                                     NULL,
                                     NULL,
                                     'IMPROVEMENT_LUMBER_MILL',
                                     'ARGTYPE_IDENTITY',
                                     'ImprovementType',
                                     'XAV_REQUIRES_PLOT_HAS_LUMBERMILL'
                                 ),
                                 (
                                     NULL,
                                     NULL,
                                     'BUILDING_WALLS',
                                     'ARGTYPE_IDENTITY',
                                     'BuildingType',
                                     'XAV_REQUIRES_CITY_HAS_WALLS'
                                 ),
                                 (
                                     NULL,
                                     NULL,
                                     'BUILDING_CASTLE',
                                     'ARGTYPE_IDENTITY',
                                     'BuildingType',
                                     'XAV_REQUIRES_CITY_HAS_CASTLE'
                                 ),
                                 (
                                     NULL,
                                     NULL,
                                     'TERRAIN_OCEAN',
                                     'ARGTYPE_IDENTITY',
                                     'TerrainType',
                                     'XAV_REQUIRES_PLOT_HAS_OCEAN'
                                 ),
                                 (
                                     NULL,
                                     NULL,
                                     'POLICY_PUBLIC_WORKS',
                                     'ARGTYPE_IDENTITY',
                                     'PolicyType',
                                     'XAV_REQUIRES_HAS_POLICY_ACTIVE'
                                 ),
                                 (
                                     NULL,
                                     NULL,
                                     'DISTRICT_ROYAL_NAVY_DOCKYARD',
                                     'ARGTYPE_IDENTITY',
                                     'DistrictType',
                                     'XAV_REQUIRES_DISTRICT_IS_ROYAL_DOCKYARD'
                                 ),
                                 (
                                     NULL,
                                     NULL,
                                     'DISTRICT_NEIGHBORHOOD',
                                     'ARGTYPE_IDENTITY',
                                     'DistrictType',
                                     'XAV_REQUIRES_DISTRICT_IS_NEIGHBORHOOD'
                                 ),
                                 (
                                     NULL,
                                     NULL,
                                     'IMPROVEMENT_OIL_WELL',
                                     'ARGTYPE_IDENTITY',
                                     'ImprovementType',
                                     'XAV_REQUIRES_PLOT_HAS_OIL_WELL'
                                 ),
                                 (
                                     NULL,
                                     NULL,
                                     'IMPROVEMENT_OFFSHORE_OIL_RIG',
                                     'ARGTYPE_IDENTITY',
                                     'ImprovementType',
                                     'XAV_REQUIRES_PLOT_HAS_OFFSHORE_OIL_RIG'
                                 );

								 
INSERT INTO RequirementSetRequirements (
                                           RequirementId,
                                           RequirementSetId
                                       )
                                       VALUES (
                                           'XAV_REQUIRES_UNIT_IS_FIGHTER',
                                           'XAV_UNIT_IS_FIGHTER'
                                       ),
                                       (
                                           'XAV_REQUIRES_UNIT_IS_BOMBER',
                                           'XAV_UNIT_IS_BOMBER'
                                       ),
									   -- reuse existing Firaxis PLOT_HAS_PLANTATION
                                       (
                                           'REQUIRES_PLOT_HAS_PLANTATION',
                                           'XAV_PLOT_HAS_PLANTATION'
                                       ),
									   -- reuse existing Firaxis requirement
                                       (
                                           'REQUIRES_PLOT_HAS_BONUS',
                                           'XAV_PLOT_HAS_BONUS'
                                       ),
									   --  reuse existing Firaxis requirement
                                       (
                                           'REQUIRES_PLOT_HAS_STRATEGIC',
                                           'XAV_PLOT_HAS_STRATEGIC'
                                       ),
									   -- reuse existing 
                                       (
                                           'REQUIRES_PLOT_HAS_LUXURY',
                                           'XAV_PLOT_HAS_LUXURY'
                                       ),
                                       (
                                           'XAV_REQUIRES_CITY_HAS_CASTLE',
                                           'XAV_CITY_HAS_WALLS_OR_CASTLE'
                                       ),
                                       (
                                           'XAV_REQUIRES_CITY_HAS_WALLS',
                                           'XAV_CITY_HAS_WALLS_OR_CASTLE'
                                       ),
									   -- plot has coast
                                       (
                                           'REQUIRES_PLOT_HAS_COAST',
                                           'XAV_PLOT_HAS_COAST'
                                       ),
                                       (
                                           'XAV_REQUIRES_PLOT_HAS_OCEAN',
                                           'XAV_PLOT_HAS_COAST'
                                       ),
                                       (
                                           'XAV_REQUIRES_HAS_POLICY_ACTIVE',
                                           'XAV_HAS_POLICY_ACTIVE'
                                       ),
                                       (
                                           'XAV_REQUIRES_DISTRICT_IS_ROYAL_DOCKYARD',
                                           'XAV_DISTRICT_IS_ROYAL_DOCKYARD'
                                       ),
                                       (
                                           'XAV_REQUIRES_PLOT_HAS_LUMBERMILL',
                                           'XAV_PLOT_HAS_LUMBERMILL_REQUIREMENTS'
                                       ),
                                       (
                                           'XAV_REQUIRES_DISTRICT_IS_NEIGHBORHOOD',
                                           'XAV_DISTRICT_IS_NEIGHBORHOOD'
                                       ),
                                       (
                                           'XAV_REQUIRES_PLOT_HAS_OIL_WELL',
                                           'XAV_PLOT_HAS_OIL_IMPROVEMENTS'
                                       ),
                                       (
                                           'XAV_REQUIRES_PLOT_HAS_OFFSHORE_OIL_RIG',
                                           'XAV_PLOT_HAS_OIL_IMPROVEMENTS'
                                       );




-- UPDATE BUG TRACKER
-- This code should go last in every file

UPDATE tblQuoDebug SET x_Close='1' WHERE DebugID='Xav_AA_Setup_Code';
