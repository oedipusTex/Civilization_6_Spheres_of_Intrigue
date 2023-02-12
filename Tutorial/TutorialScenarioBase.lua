-- ===========================================================================
--
--	Tutorial items meant to be included from TutorialUIRoot
--	Customized Tutorial-ONLY scenario 
--
-- ===========================================================================

include("InputSupport");


-- ===========================================================================
-- Overall tutorial definition
-- ===========================================================================
hstructure TutorialDefinition
	Id				: string;		-- Id of scenario
	Bank			: table;		-- array of functions that when called populate tutorial items
end


-- ===========================================================================
--	Setup the tutorial environment.
--	RETURN Tutorial defintion
-- ===========================================================================
function InitializeTutorial()
	local scenarioName:string = "QUO";
	SetScenarioName(scenarioName);
	ForceEnableTutorialLevel();
	--ActivateInputFiltering();
	--SetSimpleInGameMenu(true);
	--SetSlowNextTurnEnable(true);
	--DisableSettleHintLens();
	--DisableTechAndCivicPopups();
	--DisableUnitAction( "UNITCOMMAND_AUTOMATE" );	
	--DisableUnitAction( "UNITCOMMAND_DELETE" );	
	--DisableUnitAction( "UNITOPERATION_AUTOMATE_EXPLORE" );
	--DisableUnitAction( "UNITOPERATION_REMOVE_IMPROVEMENT" );	
	--DisableUnitAction( "UNITOPERATION_SKIP_TURN" );	
	--DisableUnitAction( "UNITOPERATION_FORTIFY", "UNIT_BUILDER");		
	--DisableUnitAction( "UNITOPERATION_FORTIFY", "UNIT_SCOUT");	
	--DisableUnitAction( "UNITOPERATION_FORTIFY", "UNIT_WARRIOR");
	--DisableUnitAction( "UNITOPERATION_HEAL",	"UNIT_WARRIOR");
	--DisableUnitAction( "UNITCOMMAND_CANCEL",	"UNIT_WARRIOR");
	--DisableUnitAction( "UNITOPERATION_SLEEP",	"UNIT_BUILDER");
	local currentTurn = Game.GetCurrentGameTurn();
	if (currentTurn > 1) then	
		return ;
	end
	
	UITutorialManager:SetActiveAlways( false );					-- If loading from a save, this may still be (stuck) on.
		
	--GoalsAutoRemove();
	--UserConfiguration.SetLockedValue("AutoEndTurn", false);		-- Disable AutoEndTurn

	--LuaEvents.Tutorial_PlotToolTipsOff();
	--LuaEvents.Tutorial_ContextDisableItems( 
		--"CityPanel", 
		--{
			--"PurchaseTileCheck","ManageCitizensCheck","ProduceWithGoldCheck","ProduceWithFaithCheck","YieldsArea",
			--"CultureCheck","CultureIgnore","FoodCheck","FoodIgnore","ProductionCheck","ProductionIgnore","ScienceCheck","ScienceIgnore","FaithCheck","FaithIgnore","GoldCheck","GoldIgnore"
		--} );

	WriteCustomData("about","Firaxis 'on rails' tutorial.");
	WriteCustomData("version",1);

	Input.SetActiveContext( InputContext.Tutorial ); 

	-- register game event
	GameEvents.PlayerTurnStarted.Add(fnQuo_OnPlayerTurnActivated);

	return hmake TutorialDefinition {
		Id	= scenarioName,
		Bank= { TutorialItemBank1 }
	};
end


-- ===========================================================================
--	If this is not from a save game, run these commands that would typically
--	be serialized out and read back in automatically.
-- ===========================================================================
function InitFirstRun()
--	AddUnitHexRestriction( "UNIT_SCOUT", 14, 12 );				-- Scout cannot go back home		
end


-- ===========================================================================
-- ===========================================================================
function TutorialItemBank1()

	-- ================================ WELCOME =====================================
	local item_getStarted:TutorialItem = TutorialItem:new("GET_STARTED");
	item_getStarted:SetRaiseEvents("LocalPlayerTurnBegin");
	item_getStarted:SetIsDoneFunction(
		function()
			return false;
		end );
	--item_getStarted:SetNextTutorialItemId("SELECT_SETTLER");
	item_getStarted:SetShowPortrait(true)

	local localPlayer = Game.GetLocalPlayer()
	local playerConfig:table = PlayerConfigurations[localPlayer]
	local leaderTypeName:string = playerConfig:GetLeaderTypeName()


		item_getStarted:SetAdvisorMessage("QUO_LOC_TUTORIAL_WELCOME");
		--item_getStarted:SetAdvisorAudio("Play_ADVISOR_LINE_FTUE_1ALT_2");
		item_getStarted:AddAdvisorButton("LOC_ADVISOR_BUTTON_GET_STARTED",
			function( advisorInfo )
				UI.PlaySound("Stop_ADVISOR_LINE_FTUE_1ALT_2")
				LuaEvents.AdvisorPopup_ClearActive( advisorInfo );
			end );
		item_getStarted:SetOpenFunction(
			function()
				-- Disable strategic view
				-- UI.SetWorldRenderView(WorldRenderView.VIEW_3D)
				-- UserConfiguration.SetLockedValue("RenderViewIsLocked", true)

				--Input.SetActiveContext( InputContext.Tutorial )
				--LuaEvents.Tutorial_ForceHideWorldTracker()
                --LuaEvents.Tutorial_SwitchToWorldView()
			end );
			
	-- ================== second screen


	-- =============================== SELECT_SETTLER =====================================
	local item_selectSettler:TutorialItem = TutorialItem:new("SELECT_SETTLER");
	item_selectSettler:SetPrereqs("GET_STARTED");
	item_selectSettler:SetAdvisorMessage("QUO_LOC_TUTORIAL_RULES");
	--item_selectSettler:SetAdvisorAudio("Play_ADVISOR_LINE_FTUE_2_ALT");
	item_selectSettler:AddAdvisorButton("LOC_ADVISOR_BUTTON_CONTINUE",
		function( advisorInfo )
			UI.PlaySound("Stop_ADVISOR_LINE_FTUE_2_ALT")
			--CenterOnFirstUnit( true );
			UI.DeselectAllUnits();
			--LuaEvents.Tutorial_DisableMapDrag( true );
			LuaEvents.AdvisorPopup_ShowDetails( advisorInfo );
		end );
	--item_selectSettler:SetIsDoneEvents("UnitSelectionChanged");
	--item_selectSettler:SetIsDoneFunction( IsAbleToBuildFirstCity );
	item_selectSettler:SetCleanupFunction(
		function( )
			LuaEvents.Tutorial_DisableMapDrag( false );
			ClearDimHexes();
		end );
	--item_selectSettler:SetAdvisorCallout("LOC_META_1_HEAD", "LOC_META_1_BODY",
		--function()
			 --local pUnit:table = GetFirstUnitOfType("UNIT_SETTLER");
			 --return GetPlotOfUnit( pUnit ):GetIndex();
		--end);
	--item_selectSettler:SetUITriggers("TutorialSelectUnit", "UnitFlagManager", "WorldInput");
	--item_selectSettler:SetEnabledControls(UITutorialManager:GetHash("UnitFlagManager"));
	--item_selectSettler:SetOverlayEnabled( false );
	--item_selectSettler:SetNextTutorialItemId("FOUND_FIRST_CITY");
	--item_selectSettler:SetShowPortrait(true)
	--item_selectSettler:SetOpenFunction(
		--function()
			--SetFunctionBeforeEveryOpen( CloseScreensIfOpen );			-- This will be called before EVERY item's open() until disabled later.  (Not in global init because loading from saves will likely keeping having this behavior.)
			--UserConfiguration.SetLockedValue("AutoUnitCycle", 0);
		--end );

	-- ================================ CONFIRM MYOPTIONS ==================================
	local item_confirmMyOptions:TutorialItem = TutorialItem:new("CONFIRM_MYOPTIONS");
	item_confirmMyOptions:SetPrereqs("SELECT_SETTLER");
	item_confirmMyOptions:SetAdvisorMessage("LOC_QUO_MYOPTIONS_CONFIRM");
	--item_selectSettler:SetAdvisorAudio("Play_ADVISOR_LINE_FTUE_2_ALT");
	item_confirmMyOptions:AddAdvisorButton("LOC_ADVISOR_BUTTON_CONTINUE",
		function( advisorInfo )
			UI.PlaySound("Stop_ADVISOR_LINE_FTUE_2_ALT")
			--CenterOnFirstUnit( true );
			UI.DeselectAllUnits();
			--LuaEvents.Tutorial_DisableMapDrag( true );
			LuaEvents.AdvisorPopup_ShowDetails( advisorInfo );
		end );
	--item_confirmMyOptions:SetIsDoneEvents("UnitSelectionChanged");
	--item_confirmMyOptions:SetIsDoneFunction( IsAbleToBuildFirstCity );
	item_confirmMyOptions:SetCleanupFunction(
		function( )
			LuaEvents.Tutorial_DisableMapDrag( false );
			ClearDimHexes();
		end );
		

end
-- ===========================================================================
--
--	2 two ii
--
-- ===========================================================================



-- ===========================================================================
--
--	HELPER Functions
--
-- ===========================================================================

-- ===========================================================================
function GetPlayer()
	local playerID = Game.GetLocalPlayer();
	if (playerID == PlayerTypes.NONE) then
		return nil;
	end
	return Players[playerID];
end

-- ===========================================================================
-- Obtain # of cities the current player has
function GetCityCount()
	local playerID = Game.GetLocalPlayer();
	if (playerID == PlayerTypes.NONE) then
		return -1;
	end
	local pPlayer = Players[playerID];
	local cities = pPlayer:GetCities();
	return cities:GetCount();
end

-- ===========================================================================
function IsUnitVaild()
	local pUnit = UI.GetHeadSelectedUnit();
	if pUnit == nil then 
		return false;
	end
	return true;
end

-- ===========================================================================
function IsAbleToBuildFirstCity()
	local pUnit = UI.GetHeadSelectedUnit();
	if pUnit == nil then 
		return false;
	end
	if ( UnitManager.CanStartOperation(pUnit, UnitOperationTypes.FOUND_CITY) and GetCityCount() == 0) then
		return true;
	end

	return false;
end

-- ===========================================================================
function HasFoundedFirstCity()
	local cityCount = GetCityCount();
	if ( GetCityCount() == 1 ) then
		return true;
	end

	return false;
end

-- ===========================================================================
function UnitNotCityBuilder()
	local pUnit = UI.GetHeadSelectedUnit();
	if pUnit == nil then 
		return false;
	end
	if ( UnitManager.CanStartOperation(pUnit, UnitOperationTypes.FOUND_CITY) ) then
		return false;
	end

	return true;
end

-- ===========================================================================
function UnitHasMovesLeft()
	local pUnit = UI.GetHeadSelectedUnit();
	if ( pUnit ~= nil ) then 
		if ( UnitManager.CanStartOperation(pUnit, UnitOperationTypes.MOVE_TO) ) then
			return true;
		end
	end
	return false;
end

-- ===========================================================================
function CenterOnFirstUnit( bHighLightHex:boolean )
	local pPlayer = GetPlayer();
	if ( pPlayer ~= nil )  then
		local pUnit = pPlayer:GetUnits():GetFirstReadyUnit();
		if ( pUnit ~= nil ) then
			local pPlot = Map.GetPlot(pUnit:GetX(), pUnit:GetY());
			UI.LookAtPlot(pPlot);
			if bHighLightHex then
				local kHexIndexes:table = { pPlot:GetIndex() };
				DimHexes( kHexIndexes );
			end
			return pUnit;
		end
	end
end

-- ===========================================================================
--	Use the mask lens layer to dim hexes not in the list.
-- ===========================================================================
function DimHexes( kHexIndexes:table )
	UILens.SetLayerHexesArea(LensLayers.MAP_HEX_MASK, Game.GetLocalPlayer(), kHexIndexes );
end

-- ===========================================================================
function ClearDimHexes()
	UILens.ClearLayerHexes( LensLayers.MAP_HEX_MASK );
end

-- ===========================================================================
function GetUnitType( playerID: number, unitID : number )
	if( playerID == Game.GetLocalPlayer() ) then
		local pPlayer	:table = Players[playerID];
		local pUnit		:table = pPlayer:GetUnits():FindID(unitID);
		if pUnit ~= nil then
			return GameInfo.Units[pUnit:GetUnitType()].UnitType;
		end
	end
	return nil;
end

-- ===========================================================================
function IsTurnFinished()
	local pPlayer = GetPlayer();
	if ( pPlayer ~= nil ) then
		local endTurnBlockingType = NotificationManager.GetFirstEndTurnBlocking(Game.GetLocalPlayer());
		if (endTurnBlockingType == EndTurnBlockingTypes.NO_ENDTURN_BLOCKING) then
			return true;
		end
	end
	return false;
end

-- ===========================================================================
function IsBlockedOnProduction()
	local pPlayer = GetPlayer();
	if ( pPlayer ~= nil )  then
		local endTurnBlockingType = NotificationManager.GetFirstEndTurnBlocking(Game.GetLocalPlayer());
		if (endTurnBlockingType == EndTurnBlockingTypes.ENDTURN_BLOCKING_PRODUCTION) then
			return true;
		end
	end
	return false;
end

-- ===========================================================================
function IsBlockedOnResearch()
	local pPlayer = GetPlayer();
	if ( pPlayer ~= nil )  then
		local endTurnBlockingType = NotificationManager.GetFirstEndTurnBlocking(Game.GetLocalPlayer());
		if (endTurnBlockingType == EndTurnBlockingTypes.ENDTURN_BLOCKING_RESEARCH) then
			return true;
		end
	end
	return false;
end

-- ===========================================================================
--	Tell world input to only accept a plot as a target movement
-- ===========================================================================
function BeginMovementRestriction( pPlot:table )
	local hexIndex:number = pPlot:GetIndex();
	DimHexes( {hexIndex} );	
	LuaEvents.Tutorial_ConstrainMovement( hexIndex );	
end

-- ===========================================================================
function EndMovementRestriction()
	ClearDimHexes();
	-- tell worldinput to allow all movement
	LuaEvents.Tutorial_ConstrainMovement( 0 );
end

-- ===========================================================================
function ForceMoveUnitOnePlot()
	local pPlayer = GetPlayer();
	if ( pPlayer ~= nil )  then
		local pUnit = pPlayer:GetUnits():GetFirstReadyUnit();
		if ( pUnit ~= nil ) then
			local adjacentPlot;
			for direction = 1, DirectionTypes.NUM_DIRECTION_TYPES - 1, 1 do
				adjacentPlot = Map.GetAdjacentPlot(pUnit:GetX(), pUnit:GetY(), direction);
				if (adjacentPlot ~= nil) then
					local bIsValid:boolean = not ( adjacentPlot:IsWater() or adjacentPlot:IsImpassable() );
					if bIsValid then
						BeginMovementRestriction( adjacentPlot );
						break;
					end
				end
			end
		end
	end
end

-- ===========================================================================
function ForceMoveUnitDirection(direction)
	local pUnit = UI.GetHeadSelectedUnit()

	if pUnit ~= nil then
		local adjacentPlot = Map.GetAdjacentPlot(pUnit:GetX(), pUnit:GetY(), direction)

		if adjacentPlot ~= nil then
			local bIsValid:boolean = not (adjacentPlot:IsWater() or adjacentPlot:IsImpassable())

			if bIsValid then
				BeginMovementRestriction(adjacentPlot)
			end
		end
	end
end

-- ===========================================================================
function ForceMoveUnitRelative(x, y)
	local pUnit = UI.GetHeadSelectedUnit()

	if pUnit ~= nil then
		local relativePlot :table = Map.GetPlot(pUnit:GetX() + x, pUnit:GetY() + y);
		if relativePlot ~= nil then
			local bIsValid:boolean = not (relativePlot:IsWater() or relativePlot:IsImpassable())
			if bIsValid then
				BeginMovementRestriction(relativePlot)
			end
		end
	end
end

-- ===========================================================================
function ForceMoveUnitToCapital()
	local playerID = Game.GetLocalPlayer();
	local player = Players[playerID];
	local playerCities = player:GetCities();
	local capitalCity = playerCities:GetCapitalCity();
	local plotX = capitalCity:GetX();
	local plotY = capitalCity:GetY();
	local plot = Map.GetPlot(plotX, plotY);

	if plot ~= nil then
		BeginMovementRestriction(plot);
	end
end

function ForceMoveUnitEastward()
	local playerID = Game.GetLocalPlayer();
	local player = Players[playerID];
	local playerCities = player:GetCities();
	local capitalCity = playerCities:GetCapitalCity();
	local plotX = capitalCity:GetX() + 4;
	local plotY = capitalCity:GetY() - 1;
	local plot = Map.GetPlot(plotX, plotY);

	if plot ~= nil then
		BeginMovementRestriction(plot);
	end
end

function GetFirstUnitOfType(typeName)
	local localPlayer = Game.GetLocalPlayer()
	local player = Players[localPlayer]
	local playerUnits = player:GetUnits()

	for i, unit in playerUnits:Members() do
		local unitTypeName = UnitManager.GetTypeName(unit)

		if typeName == unitTypeName then
			return unit
		end
	end

	return nil
end

-- ===========================================================================
--	Return a plot object for a given unit.
-- ===========================================================================
function GetPlotOfUnit( pUnit:table)
	if (pUnit ~= nil) then
		return Map.GetPlot(pUnit:GetX(), pUnit:GetY());
	end
end


-- ===========================================================================
--	If a player has opened a sub-screen, close it.
-- ===========================================================================
function CloseScreensIfOpen()
	LuaEvents.Tutorial_CloseAllPartialScreens();
	LuaEvents.Tutorial_CloseAllLaunchBarScreens();
end

-- ===========================================================================
--	If any dynamically allocated tree (civics / tech) is open, reparent
--	the tutorial tree nodes to ensure they draw on top of all the things.
-- ===========================================================================
function ReparentTutorialTreeNodes()

	local pCivicsTree:table = ContextPtr:LookUpControl( "/InGame/CivicsTree/" );
	if pCivicsTree then
		local kTutorialControlNames:table = {"NodePointer"};
		for _,controlName in ipairs(kTutorialControlNames) do
			local pControl:table = ContextPtr:LookUpControl( "/InGame/CivicsTree/"..controlName);
			if pControl then
				pControl:Reparent();
			else
				UI.DataError("Tutorial was unable to reparent the Civics Tree control '"..controlName.."' because it doesn't exist.");
			end
		end
	end

	local pTechTree:table = ContextPtr:LookUpControl( "/InGame/TechTree/" );
	if pTechTree then
		local kTutorialControlNames:table = {"CompletedTechNodePointer","IncompleteTechNodePointer","UnavailableTechNodePointer","ChooseWritingPointer","ActiveTechNodePointer","TechUnlocksPointer"};
		for _,controlName in ipairs(kTutorialControlNames) do
			local pControl:table = ContextPtr:LookUpControl( "/InGame/TechTree/"..controlName);
			if pControl then
				pControl:Reparent();
			else
				UI.DataError("Tutorial was unable to reparent the Tech Tree control '"..controlName.."' because it doesn't exist.");
			end
		end
	end
	
end







