/*
    Created by Quo
*/
 

-- RULES FOR HARDCORE ONLY


-- Debug
INSERT INTO tblQuoDebug 
	(DebugID, 		x_Open, x_Close, 	Message)
VALUES ('Quo_Resources_Code',	'1',	'0',		'') ;


-- RESOURCE REQUIREMENTS TO BUILD UNITS
-- Now possible to build units with just one copy of a resource
-- This is now controlled by a MyOption

UPDATE GlobalParameters SET Value=(SELECT tblQuoOptions.Value FROM tblQuoOptions WHERE tblQuoOptions.OptionId='QUO_OPTION_MIN_NUM_RESOURCE_FOR_PRODUCTION_ANYWHERE') 
	WHERE Name='STRATEGIC_RESOURCE_MINIMUM_FOR_PURCHASE_ANYWHERE' ;
	
UPDATE GlobalParameters SET Value=(SELECT tblQuoOptions.Value FROM tblQuoOptions WHERE tblQuoOptions.OptionId='QUO_OPTION_MIN_NUM_RESOURCE_FOR_PRODUCTION_ANYWHERE') 
	WHERE Name='STRATEGIC_RESOURCE_MINIMUM_FOR_PRODUCTION_ANYWHERE' ;



					 					  
					  
/*
code used for reviewing Victories in database

select * from victories
left join requirementsets on requirementsets.RequirementSetId = victories.RequirementSetId
left join requirementsetrequirements on requirementsetrequirements.RequirementSetId = requirementsets.RequirementSetId
left join requirements on requirements.RequirementId = requirementsetrequirements.RequirementId
left join requirementarguments on requirementarguments.RequirementId = requirements.RequirementId
left join requirementsets as req2 on req2.RequirementSetId = requirementarguments.Value
left join requirementsetrequirements as reqset2 on reqset2.RequirementSetId = req2.RequirementSetId
left join requirements as req_ on req_.RequirementId = reqset2.RequirementId
left join requirementarguments as reqarg2 on reqarg2.RequirementId =  req_.RequirementId
*/



-- ASSORTED RESOURCES
-- Allow Deer to appear near rivers, because deer live near rivers. Make them somewhat more common overall.
UPDATE Resources SET NoRiver='0', Frequency='12' WHERE ResourceType='RESOURCE_DEER' ;







-- UPDATE BUG TRACKER
-- This code should go last in every file


UPDATE tblQuoDebug SET x_Close='1' WHERE DebugID='Quo_Resources_Code';

