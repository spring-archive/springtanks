function gadget:GetInfo()
	return {
		name      = "base spawner",
		desc      = "spawn start units based on config files (rather then on startpos set in lobby)",
		author    = "knorke (inspired by game_spawn.lua by Tobi Vollebregt)",
		date      = "May 2011",
		license   = "GNU GPL, v2 or later or a horse",
		layer     = -10,
		enabled   = true,
	}
end
--------------------------------------------------------------------------------
-- synced only
if (not gadgetHandler:IsSyncedCode()) then
	return false
end
--------------------------------------------------------------------------------
luamsgpre = "tpMSGBOX"
local mapconfig_fn = Game.mapName .. "_ST_startpos.lua"		--name of map config files
if (VFS.FileExists(mapconfig_fn)) then 
	Spring.Echo ("tp_startbase_spawn.lua: found" .. mapconfig_fn .." in mod root folder or map")
	startpos = VFS.Include(mapconfig_fn)
else
	if (VFS.FileExists("mapconfigs\\" .. mapconfig_fn)) then 
		Spring.Echo ("tp_startbase_spawn.lua: found " .. mapconfig_fn .. " in mod mapconfigs folder")
		startpos = VFS.Include("mapconfigs\\" .. mapconfig_fn)
	else
		Spring.Echo ("tp_startbase_spawn.lua: found " .. mapconfig_fn .. " NOT FOUND AT ALL.")
		Spring.Echo ("THIS MAP IS NOT SUPPORTED")
		Spring.SendLuaUIMsg (luamsgpre .. "THIS MAP IS NOT SUPPORTED")
	end
end


function spawn_player (x, z, teamID)
	x, z = 8*math.floor((x+4)/8) , 8*math.floor((z+4)/8)
	y = Spring.GetGroundHeight(x, z)
	local facing = math.abs(Game.mapSizeX/2 - x) > math.abs(Game.mapSizeZ/2 - z)
		and ((x>Game.mapSizeX/2) and "west" or "east")
		or ((z>Game.mapSizeZ/2) and "north" or "south")
	local unitID = Spring.CreateUnit("tpbase", x, y, z, facing, teamID)
	if unitID then
		-- set the *team's* lineage root
		--Spring.SetUnitLineage(unitID, teamID, true)
		Spring.SetUnitAlwaysVisible (unitID,true)
		Spring.SetUnitNoSelect (unitID, true)
		Spring.SetUnitNeutral (unitID, true)
	end
	local flag1 = Spring.CreateUnit("tpflag", x+64, y, z, facing, teamID)
	local flag2 = Spring.CreateUnit("tpflag", x-64, y, z, facing, teamID)
	Spring.SetUnitNeutral (flag1, true)
	Spring.SetUnitNoSelect (flag1, true)
	Spring.SetUnitNeutral (flag2, true)
	Spring.SetUnitNoSelect (flag2, true)
	Spring.CreateUnit("tptaktak", x, y, z+128, facing, teamID)
	Spring.CreateUnit("tptaktak", x, y, z-128, facing, teamID)
	Spring.CreateUnit("tptaktak", x-128, y, z+128, facing, teamID)
	Spring.CreateUnit("tptaktak", x-128, y, z-128, facing, teamID)
	Spring.CreateUnit("tptaktak", x-128, y, z+64, facing, teamID)
	Spring.CreateUnit("tptaktak", x-128, y, z-64, facing, teamID)
	Spring.CreateUnit("tpthulsa", x-256, y, z, facing, teamID)
	Spring.CreateUnit("tpthulsa", x+256, y, z, facing, teamID)
	Spring.CreateUnit("tplegocar", x-256, y, z+64, facing, teamID)
	Spring.CreateUnit("tplegocar", x+256, y, z+64, facing, teamID)
end

--function gadget:GameStart()
function gadget:Initialize()	
	if (startpos == nil) then Spring.Echo ("tp_startbase_spawn.lua: Did not find startpositions. No units are spawned.") return end
	local gaiaTeamID = Spring.GetGaiaTeamID()
	local i = 1
	local gm = get_game_mode ()
	if (not startpos[gm]) then 
		Spring.Echo ("NO SUPPORT FOR THIS MATCH SETUP:" .. gm)
		Spring.SendLuaUIMsg (luamsgpre .. "NO SUPPORT FOR THIS MATCH SETUP:" .. gm)
	end
	for _,teamID in ipairs(Spring.GetTeamList()) do
		if teamID~=gaiaTeamID then -- don't spawn a start unit for the Gaia team			
			local teamNum,leader,isDead,isAiTeam,side,allyTeam = Spring.GetTeamInfo(teamID)		
			--local x,y,z = Spring.GetTeamStartPosition(teamID)
			local x,z = startpos[gm][i].x, startpos[gm][i].z
			spawn_player (x, z, teamID)
			i=i+1
		end
	end	
end

function get_game_mode ()
	teamn = #Spring.GetTeamList() -1
	if teamn == 2 then return "1v1" end
	if teamn == 3 then return "1v1v1" end
	if teamn == 4 then return "4" end
	return "UKNOWN"
end