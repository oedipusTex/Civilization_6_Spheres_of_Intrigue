-- ===========================================================================
--	Quo Configuration Options
-- ===========================================================================
local lastLocalTurnNumber = 0;


-- use this variable to track whether Cathy is in game, and if so, what spot
local iCathy_D_Id = -1;
local iTechToMeetCathy = GameInfo.Technologies["TECH_CASTLES"].Index ;

	
-- stores list of player ids who have met cathy
local kQuoPlayersMetCathy = {};

local g_iRollsPerPlayer = 3;





-- ===========================================================================
function fnQuo_Initialize()

	print ("Initialized Quo Custom Options.") ;
	print ("QuoOptionBorderSpeed:" .. tostring(quo_border_speed_option)  );
	

end


--==========================================================================================================================
-- UTILITY FUNCTIONS
--==========================================================================================================================
-- Credits to Chrisy for this function
--------------------------------------------------------------
function GetPlayersWithTrait(sTrait)
	local tValid = {}
	for k, v in pairs(PlayerManager.GetWasEverAliveIDs()) do
		local leaderType = PlayerConfigurations[v]:GetLeaderTypeName()
		for trait in GameInfo.LeaderTraits() do
			if trait.LeaderType == leaderType and trait.TraitType == sTrait then 
				tValid[v] = true 
			end
		end
		if not tValid[v] then
			local civType = PlayerConfigurations[v]:GetCivilizationTypeName()
			for trait in GameInfo.CivilizationTraits() do
				if trait.CivilizationType == civType and trait.TraitType == sTrait then 
					tValid[v] = true 
					print("GetPlayersWithTrait: Found " .. tostring(civType) .. " with trait type " .. tostring(sTrait));

				end
			end
		end
	end
	return tValid
end

local sAfricaTrait = "QUO_TRAIT_BIOME_AFRICA"
local tBiomeAfricaPlayers:table = GetPlayersWithTrait(sAfricaTrait)



-- Changed in v3.10.1 to award 1 boost for one suzerain and 2 for 3
local function fnQuo_FreeCivicBoostOnEraChange( iPlayer )

	-- local sLeaderName = playerConfig:GetLeaderTypeName() ;

	--print ('ERA CHANGED  ') ;
	print ('ERA CHANGED REFRESH for ' .. tostring(iPlayer)) ;
	
	local pPlayer = Players[iPlayer];
	local playerConfig:table = PlayerConfigurations[iPlayer] ;
	local sLeaderName = playerConfig:GetLeaderTypeName() ;
	
	-- exit if this is turn 1 or earlier, it means the player is entering the first era 
	local currentTurn = Game.GetCurrentGameTurn();
	if (currentTurn < 2) then	
		return ;
	end
	
	if (sLeaderName == "LEADER_PERICLES") then
	 	local iNumFound = 0;
		local iNumAwards = 0;
		
		
		-- loop through minor civs and see who is in control. if it is Pericles, give him the boost
		local aMinorPlayers = PlayerManager.GetAliveMinors();
		for loop, pPlayerToCheck in ipairs(aMinorPlayers) do
			local iPlayerToCheck = pPlayerToCheck:GetID();
		
			local iSuze = pPlayerToCheck:GetInfluence():GetSuzerain() ;	
	
			print ('Current Suzeraine of: ' .. tostring (iPlayerToCheck) .. '  is:  ' .. tostring(iSuze));
			
			if (iSuze == iPlayer) then
				print ('Pericles is Suzerian! Initiating bonus boosts.')
			
				-- search for civics that can be boosted
				-- right now this fills an array with up to 4 civics to pick from, then ignores that array and just picks the first item
				-- leaving as in case a random element is ever introduced (too much effort to test at the moment hence hardcoded picks)
				local aPossibleTechBoosts = {};
				for row in GameInfo.Civics() do
					if (not pPlayer:GetCulture():HasCivic(row.Index)) then
						if (not pPlayer:GetCulture():HasBoostBeenTriggered(row.Index)) then
							iNumFound = iNumFound + 1;
							table.insert(aPossibleTechBoosts, row.Index);
							
							print ('Possible civic:' .. tostring(row.Index)) ;
							
							if iNumFound >= 4 then
								break;
							end
						end
					end
				end
				
				if (iNumFound > 0) then
					local iRoll = Game.GetRandNum(100, "Quo Free Civic Boost Event Roll");
					local iChosen = (iNumFound * iRoll) / 100 + 1;
					 
					 
					iNumAwards = iNumAwards + 1; 
					if (iNumAwards == 1) or (iNumAwards == 3) then
						-- for now just ignore the random roll and use the first tech
						pPlayer:GetCulture():TriggerBoost(aPossibleTechBoosts[1], 1); -- Trigger as if from goody hut
					end
								
				end
			end
			
		end
		
	end
	
end

-- REMOVED IN V.0.17 
--Events.PlayerEraChanged.Add(fnQuo_FreeCivicBoostOnEraChange);
 

-- ===========================================================================
local function fnQuo_OnPlayerTurnActivated( player )

	--print ('fnQuo_OnPlayerTurnActivated') ;
	local currentTurn = Game.GetCurrentGameTurn();
	local pPlayer = Players[player];
	
	local playerConfig:table = PlayerConfigurations[player] ;
	local sLeaderName = playerConfig:GetLeaderTypeName() ;
	
	
	if not (pPlayer:IsMajor()) then
		return
	end ; 
	
	if not (pPlayer:IsAlive()) then
		return
	end ;
	
	print ("fnQuo_OnPlayerTurnActivated: Player: " .. tostring(player) .. ", Turn " .. tostring(currentTurn) .. " LeaderName: " .. tostring(sLeaderName));


	-- grow trees, if the player is listed in the tBiomeAfricaPlayers table (created during initialization)
	fnQuo_GrowTrees( player )

	
	-- Save the ID of Cathy. We need to do this check every turn because the number gets lost when game is saved and reloaded.
	if (sLeaderName == "LEADER_CATHERINE_DE_MEDICI") then
		iCathy_D_Id = player ; 
	end
	
	
	-- local iHorses = GameInfo.Resources["RESOURCE_HORSES"].Index ; 
	-- print ("Horse Count: " .. tostring(pPlayer:GetResources():GetResourceAmount(iHorses) ) ) ;
	 
	-- introduce civs to Cathy if they have Writing and haven't met him
	-- changed in 3.07.1 to check to make sure player is a major civ
	
	
	if pPlayer:IsMajor() and (sLeaderName ~= "LEADER_CATHERINE_DE_MEDICI") then
		if (pPlayer:GetTechs():HasTech( iTechToMeetCathy )) then
			if (iCathy_D_Id ~= -1 ) and ((not pPlayer:GetDiplomacy():HasMet( iCathy_D_Id )) or (kQuoPlayersMetCathy[player] == nil)) then
			
				print ("Quo: Meeting Catherine D for Player: " .. tostring(sLeaderName)) ;
				
				
				-- Unveil the tile where the other civs capital is located
				local pCurPlayerVisibility = PlayersVisibility[ iCathy_D_Id ];
				
				if(pCurPlayerVisibility ~= nil) then
					
					local pCapitalCity = pPlayer:GetCities():GetCapitalCity();
					
					if pCapitalCity then
												
						local iCityPlotIndex = Map.GetPlot(pCapitalCity:GetX(), pCapitalCity:GetY()):GetIndex() ;
						pCurPlayerVisibility:ChangeVisibilityCount(iCityPlotIndex, 1);
						
						-- mark the fact that the player met Cathy in the Lua
						kQuoPlayersMetCathy[player] = 1 ;
					end
					
				end
				
				-- Players[ iCathy_D_Id ]:GetDiplomacy():SendKudoTo( player );
		
				Players[ player ]:GetDiplomacy():RecheckVisibilityOnAll();
								
			end
		end
	end

	if (player == 0) then
		if (currentTurn > lastLocalTurnNumber) then
			lastLocalTurnNumber = currentTurn;
		end
	end
	
	
	
end

GameEvents.PlayerTurnStarted.Add(fnQuo_OnPlayerTurnActivated);





-- iMonopolyIndex is the index of the resource in arQuoMonopolyResources
-- iTradeOffset is the amount to increase or decrease the final amount based on stuff that has been traded away
function fnQuo_EvalMonopolyScore( iPlayerID, iMonopolyIndex, iTradeOffset ) 
	local pPlayer = Players[iPlayerID];
	
	local sResourceName = arQuoMonopolyResources[iMonopolyIndex] ;
	local iResourceID = GameInfo.Resources[sResourceName].Index ; 
	
	print ('EVALUATING ResourceID: ' .. tostring(iResourceID) .. "      sResourceName: " .. tostring(sResourceName) .. "     iMonopolyIndex: " .. tostring(iMonopolyIndex));
	

	-- count the number of resources
	local iAmount = pPlayer:GetResources():GetResourceAmount(iResourceID) + iTradeOffset;
	
	

	-- stuff to do if a previous owner exists
	local pOldOwner = Players[ arQuoMonopolyPlayer[iMonopolyIndex] ];
	local iOldPlayerID = arQuoMonopolyPlayer[iMonopolyIndex] ;
	
	if pOldOwner then
	
		-- if previous owner was killed, wipe out their score
		if not pOldOwner:IsAlive() then
			fnQuo_RemoveExpoInCapital(iOldPlayerID, iMonopolyIndex) ;
			arQuoMonopolyScore[iMonopolyIndex] = 0 ;
		end
		
		-- if the player whose turn it is is the previous owner, and their score has dropped too low, remove their access now
		if (iPlayerID == iOldPlayerID) and (iAmount < iQuoMinResourcesForMonopoly) then
			fnQuo_RemoveExpoInCapital(iPlayerID, iMonopolyIndex) ;
			arQuoMonopolyScore[iMonopolyIndex] = 0 ;
		end
	
	end
	

	print ("MONOPOLY CHECK. Player: " .. tostring(iPlayerID) .. " Resource: " .. sResourceName ..  "   Amount: " .. tostring(iAmount ) .. "   Score to Beat: " .. tostring(arQuoMonopolyScore[iMonopolyIndex])) ;
	
	-- do we have enough resource to surpass the min necessary for a monopoly?
	if (iAmount >= iQuoMinResourcesForMonopoly) then
	
		-- is the amount a tie? if so, no one wins and remove the resource from the old owner
		if (iAmount == arQuoMonopolyScore[iMonopolyIndex] ) and (iOldPlayerID) and (iPlayerID ~= iOldPlayerID) then
			fnQuo_RemoveExpoInCapital(iOldPlayerID, iMonopolyIndex) ;
			
			print ("Monopoly eliminated due to a tie! Player: " .. tostring(iPlayerID) .. " resource: " .. sResourceName);

		end
		
		-- is it more than whatever the current high score is?
		if (iAmount > arQuoMonopolyScore[iMonopolyIndex] ) then
			
			-- increase the monopoly score to match the new high score
			 arQuoMonopolyScore[iMonopolyIndex] = iAmount ;
			 
			-- if a new player got the monopoly, do stuff with the expo building. skip this if its the same player as before
			if (iPlayerID ~= iOldPlayerID) then
			
				print ("New monopoly! Player: " .. tostring(iPlayerID) .. " resource: " .. sResourceName .. " amount: " .. tostring(iAmount)) ;
				
				if iOldPlayerID then
					-- remove the building from the old owner, if there is one
					fnQuo_RemoveExpoInCapital(iOldPlayerID, iMonopolyIndex) ;
				end
			
				-- add the building to the new owner	
				fnQuo_PlaceExpoInCapital(iPlayerID, iMonopolyIndex) ;			
			end
				
		end
	end
	
end





function fnQuo_OnCityAddedToMap( playerID: number, cityID : number, cityX : number, cityY : number )
	
	print("CityAddedToMap - " .. tostring(playerID) .. ":" .. tostring(cityID) .. " " .. tostring(cityX) .. "x" .. tostring(cityY));

	local pGameReligion:table = Game.GetReligion();
	local pPlayer = Players[playerID];
	local pPlayerCities:table = pPlayer:GetCities();
	local pReligion = pPlayer:GetReligion();
end
-- GameEvents.CityBuilt.Add(fnQuo_OnCityAddedToMap );



--function fnQuo_CheckActivateSpell()

--end
--GameEvents.ImprovementAddedToMap.Add( fnQuo_CheckActivateSpell );


-- Makes this player meet all major civs
function fnQuo_MakeMeetAllMajorCivs( playerID: number)

	print("Making player " .. tostring(playerID) .. "meet all major civs.") ;
	
	local pPlayer = Players[playerID];
	
	
	local aPlayers = PlayerManager.GetAliveMajors();
	for loop, pPlayerToMeet in ipairs(aPlayers) do
		local iPlayerToMeet = pPlayerToMeet:GetID();
		
		if (playerID ~= iPlayerToMeet) then
			Players[ playerID ]:GetDiplomacy():SetHasMet( iPlayerToMeet );
			Players[ playerID ]:GetDiplomacy():SetHasDelegationAt( iPlayerToMeet, true);
			Players[ iPlayerToMeet ]:GetDiplomacy():SetHasDelegationAt( playerID, true);
	
			Players[ playerID ]:GetDiplomacy():RecheckVisibilityOnAll();
			-- Players[ playerID ]:GetDiplomacy():SendKudoTo ( iPlayerToMeet ) ;
		end
	end

end


-- Add a unit to the map 
function fnQuo_AddUnitInCapital ( iPlayerID: number, sUnitType )

	local pPlayer = Players[iPlayerID];
	
	pPlayer:GetUnits():Create( sUnitType, iPlotX, iPlotY ) ;
	
end


-- ===========================================================================
-- Code borrowed from LeeS at CivFanatics forums for adding and removing buildings. Thanks Lee! 

function fnQuo_PlaceBuildingInCityCenter(pCity, iBuilding)
	local iCityPlotIndex = Map.GetPlot(pCity:GetX(), pCity:GetY()):GetIndex()

	if not pCity:GetBuildings():HasBuilding(iBuilding) then
		pCity:GetBuildQueue():CreateIncompleteBuilding(iBuilding, iCityPlotIndex, 100);
	end
end

function fnQuo_RemoveBuildingFromCityCenter(pCity, iBuilding)
	if pCity:GetBuildings():HasBuilding(iBuilding) then
		pCity:GetBuildings():RemoveBuilding(iBuilding);
	end
end


function GetArgumentDatas(sOrigin, tTable)
	print("============================================================================================")
	print("[" .. sOrigin .. "]: Dumping Event Hook Argument Data")
	print("............................................................................................")
	for k,v in pairs(tTable) do
		local sKeyType = type(k)
		local sValueType = type(v)
		print("[" .. sOrigin .. "]: Key is of type " .. sKeyType .. " = " .. tostring(k) .. ", Value is of type " .. sValueType .. " = " .. tostring(v))
	end
	print("............................................................................................")
	print("[" .. sOrigin .. "]: dump completed for this firing of the event")
	print("============================================================================================")
end



function fnQuoCityInitialized(iPlayer, iCityID)
	--OnCityInitialized(...)
	--OnCityInitialized(iPlayer, iCityID, iX, iY)
	print("Events.CityInitialized fired for function OnCityInitialized")
	--GetArgumentDatas("OnCityInitialized", {...})
	
	
	local iBuilding 
	local pPlayer = Players[iPlayer]
	
	
	if not pPlayer then
		print("[OnCityInitialized] pPlayer was nil")
	end
	
	local pCity = pPlayer:GetCities():FindID(iCityID)
	
	if not pCity then
		print("[OnCityInitialized] The founded city was nil")
		return
	end 
	
	iBuilding = GameInfo.Buildings["QUO_BUILDING_BEDROCK_ANCIENT"].Index 
	
	if pCity:GetBuildings():IsPillaged(iBuilding) then
		pCity:GetBuildings():SetPillaged(iBuilding, false)
	end
	
	
	iBuilding = GameInfo.Buildings["QUO_BUILDING_BEDROCK_MEDIEVAL"].Index 
	
	if pCity:GetBuildings():IsPillaged(iBuilding) then
		pCity:GetBuildings():SetPillaged(iBuilding, false)
	end
	
	
	iBuilding = GameInfo.Buildings["QUO_BUILDING_BEDROCK_RENAISSANCE"].Index 
	
	if pCity:GetBuildings():IsPillaged(iBuilding) then
		pCity:GetBuildings():SetPillaged(iBuilding, false)
	end
	
	
	print("[OnCityInitialized] Any pillaged Bedrocks have been repaired.")
	
end


function OnLoadScreenClose()
	--delay until after LoadScreenClose to avoid massive dumps in the log on reloading saved game
	Events.CityInitialized.Add(fnQuoCityInitialized)
end
Events.LoadScreenClose.Add(OnLoadScreenClose)



--------------------------------------------------------------------------------------------------------------------------------------------------------
function PlotIsAdjacentToNaturalWonder(pPlot)
	local iX, iY = pPlot:GetX(), pPlot:GetY()
	for direction = 0, DirectionTypes.NUM_DIRECTION_TYPES - 1, 1 do
		local adjacentPlot = Map.GetAdjacentPlot(iX, iY, direction);
		if adjacentPlot and adjacentPlot:IsNaturalWonder() then
			return true
		end
	end
	return false
end
--------------------------------------------------------------------------------------------------------------------------------------------------------
function PlotIsAdjacentToListedDistrict(pPlot, tTable)
	local iX, iY = pPlot:GetX(), pPlot:GetY()
	for direction = 0, DirectionTypes.NUM_DIRECTION_TYPES - 1, 1 do
		local adjacentPlot = Map.GetAdjacentPlot(iX, iY, direction);
		if adjacentPlot and tTable[adjacentPlot:GetDistrictType()] then
			return true
		end
	end
	return false
end
---------------------------------------------------------------------------------------------------------------
-- create an lua table with the Index values for Districts we do not want to change adjacent plot features
---------------------------------------------------------------------------------------------------------------
local tBadDistricts = { [GameInfo.Districts["DISTRICT_CAMPUS"].Index] = "Campus",
	[GameInfo.Districts["DISTRICT_HOLY_SITE"].Index] = "HolySite",
	[GameInfo.Districts["DISTRICT_LAVRA"].Index] = "Lavra" }
---------------------------------------------------------------------------------------------------------------
-- create an lua local pointer variable to hold the Index number of the feature we wish to place
---------------------------------------------------------------------------------------------------------------



--------------------------------------------------------------------------------------------------------------
-- Original function by Lee S, updated by Quo
------------------------------------------------------------------------------------------------------------
function fnQuo_GetCityPlots(pCity)
 local tTempTable = {}
 if pCity ~= nil then
  local iCityRadius = 3
  local iTableCount = 1
  local iCityOwner = pCity:GetOwner()
  local iCityX, iCityY = pCity:GetX(), pCity:GetY()
  for dx = (iCityRadius * -1), iCityRadius do
   for dy = (iCityRadius * -1), iCityRadius do
    local pPlotNearCity = Map.GetPlotXYWithRangeCheck(iCityX, iCityY, dx, dy, iCityRadius);
	
	local iFeatureType = GameInfo.Features["FEATURE_JUNGLE"].Index
    if pPlotNearCity and (PlotIsAdjacentToListedDistrict(pPlotNearCity, tBadDistricts) == false) and (PlotIsAdjacentToNaturalWonder(pPlotNearCity) == false) and TerrainBuilder.CanHaveFeature(pPlotNearCity, iFeatureType) then
     local iPlotIndex, bAddToTable = pPlotNearCity:GetIndex(), false
     --if ((Cities.GetPlotWorkingCity(iPlotIndex) ~= nil) and (pCity == Cities.GetPlotWorkingCity(iPlotIndex))) then
      --bAddToTable = true
     --elseif ((Cities.GetPlotWorkingCity(iPlotIndex) == nil) and (pCity == Cities.GetPlotPurchaseCity(iPlotIndex))) then
      --bAddToTable = true
     --end
	 
	 bAddToTable = true -- just make this always true, since we don't care whether we are picking a tile we own
	 
     if (bAddToTable == true) then
      tTempTable[iTableCount] = pPlotNearCity
      iTableCount = iTableCount + 1
     end
    end
   end
  end
 end
 return tTempTable
end


-------------------------------------------------------------------------------------------------------------------
-- Created by Quo
--------------------------------------------------------------------------------------------------------------------
function fnQuo_GrowTrees(ePlayerID:number)
  
  	print ("fnQuo_GrowTrees called on player: " .. tostring(ePlayerID));

  
  -- validate 
  if Players[ePlayerID] == nil then return 0; end
  
  -- exit if the player does not have the trait
  if not tBiomeAfricaPlayers[ePlayerID] then 
    print ("fnQuo_GrowTrees: " .. tostring(ePlayerID) .. ' does not have correct trait. Exiting.');
  
    return 0
  end
  
  local iChance:number = 5;
  
  -- iterate through each city
  for _,city in Players[ePlayerID]:GetCities():Members() do
     
    -- roll the dice for the city
    local iRoll:number = math.random(0, 100)
  
    -- exit if roll too low  
    if iRoll > iChance then return 0; end
    print("fnQuo_GrowTrees: Roll successful. City is growing trees.");
    
    -- pick a plot 
    local tPossiblePlots:table = fnQuo_GetCityPlots(city)
	print("fnQuo_GrowTrees: Identified " .. tostring(#tPossiblePlots) .. "possible plots.");
  
    if #tPossiblePlots < 1 then return 0; end
    local iPlotRoll:number = math.random(#tPossiblePlots) 
    local pPlot:table = tPossiblePlots [iPlotRoll] 
 
    if not pPlot then return 0; end
  
    local iFeatureType = GameInfo.Features["FEATURE_JUNGLE"].Index
 
    if (PlotIsAdjacentToListedDistrict(pPlot, tBadDistricts) == false) and (PlotIsAdjacentToNaturalWonder(pPlot) == false)
        and TerrainBuilder.CanHaveFeature(pPlot, iFeatureType) then
        TerrainBuilder.SetFeatureType(pPlot, iFeatureType)
    end
	
   end
 
end






fnQuo_Initialize();

