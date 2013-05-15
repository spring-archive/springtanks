function widget:GetInfo()
   return {
   version   = "1",
   name      = "SpringTanks | Hotkeys",
   desc      = "Adds hotkeys:  B: send selected units to base  V: select flag carrying units",
   author    = "knorke",
   date      = "February 2011",
   license   = "3,5% Fett",
   layer     = 0,
   enabled   = true, --enabled by default
   --handler   = true, --access to handler
   }
end

local KEY_TOBASE = 98		--b
local KEY_FLAGGERS = 118	--v

function widget:KeyPress(key, mods, isRepeat)
	--Spring.Echo ("key was pressed:" .. key)
	if (key==KEY_TOBASE) then send_selected_to_base () end
	if (key==KEY_FLAGGERS) then select_flag_carriers () end
end

function send_selected_to_base ()
	selectedUnits = Spring.GetSelectedUnits  ()
	if (selectedUnits) then			
		for i,_  in pairs (selectedUnits) do				
			if (Spring.ValidUnitID (selectedUnits[i])) then		--seems like the number of selected units is also returned, ie when two units are selected:  456, 420, 2
				--Spring.Echo ("selected :" .. selectedUnits[i])
				local id, x,y,z = nearest_homebase_from_unit (selectedUnits[i])
				--units carrying flags get move command: get to base asap to to score
				--units without flag get fight command: attack enemys at base and on the way to it
				if is_flag_carrier (selectedUnits[i]) then
					Spring.GiveOrderToUnit(selectedUnits[i], CMD.MOVE , {x, y, z  }, {})
				else
					Spring.GiveOrderToUnit(selectedUnits[i], CMD.FIGHT , {x, y, z  }, {})
				end
			end
		end
	end
end

function select_flag_carriers ()
	local myTeamID = Spring.GetMyTeamID ()
	units=Spring.GetTeamUnits  (myTeamID)
	local flagcarriers = {}
	for i in pairs (units) do
		if ( is_flag_carrier (units[i]) ) then
			table.insert (flagcarriers, units[i])
		end
	end	
	if (flagcarriers and #flagcarriers > 0) then
		Spring.SelectUnitArray ({}, false)	--clear selection by selecting an "empty" selection. false means do no keep previous selection
		Spring.SelectUnitArray (flagcarriers, true)
	end
end

function is_flag_carrier (unitID)
	local flagscarried = #(Spring.GetUnitIsTransporting (unitID) or ({}))
	if (flagscarried > 0) then 
		return true 
	else 
		return false
	end
end

function nearest_homebase_from_unit (uID)
	local nearest_baseID = nil
	local nearest_distance = 9999999999
	local x,y,z = Spring.GetUnitPosition(uID)	
	local uteam = Spring.GetUnitTeam (uID)
	units=Spring.GetTeamUnits  (uteam)
	if (units == nil) then return nil end	--no units alive? :/
	for i in pairs (units) do
		if (Spring.GetUnitTeam(units[i]) == uteam) then
			local udID =Spring.GetUnitDefID(units[i])
			if (udID) then
				local unitDef = UnitDefs [udID]
				if (unitDef.name=="tpbase") then
					local d = Spring.GetUnitSeparation (uID, units[i])
					if (d < nearest_distance) then
						nearest_distance = d
						nearest_baseID = units[i]
					end
				end
			end
		end
	end
	if (nearest_baseID~=nil) then 		
		local rx,ry,rz=Spring.GetUnitPosition(nearest_baseID)
		return nearest_baseID, rx,ry,rz, nearest_distance 
		else return nil
	end
end



function widget:MapDrawCmd(playerID, cmdType, px, py, pz, label)
	local msg = "MapDrawCmd" .. "|" .. playerID .. "|".. cmdType.. "|".. px.. "|".. py.. "|".. pz.. "|".. label
	Spring.SendLuaRulesMsg (msg)
	--Spring.Echo (a .. ":" .. b)
end