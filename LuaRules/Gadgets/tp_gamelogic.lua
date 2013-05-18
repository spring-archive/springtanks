--BUG: bei 2 Basen werden beim respawnen die einheiten doppelt erstellt
--evtl neuer parameter zu spawn_unit_at_base (..., once=true)
function gadget:GetInfo()
        return {
                name                    = "ctf game logic",
                desc                    = "capture the flag!!",
                author          = "knorke",
                date                    = "Jan 2011",
                license  = "GNU GPL, v2 or later horses",
                layer            = 0,--was 0 in 5.2
                enabled  = true, --      loaded by default?
        }
end
if (gadgetHandler:IsSyncedCode()) then

flags = {}
bases = {}
flagcaptureadius = 100		--how near tanks have to get to pick up or return a flag
flagbasedistance = 300		--how far away from base the flag will respawn when returned or captured
unitrespawndistance = 200	--how far away from base units respawn
waverespawn = 30 * 30
respawnunits = {}
isdebug = false
score = {}
luamsgpre = "tpMSGBOX"
luascoremsgpre ="tpSCORE"
luaresultmsgpre = "tpRESULT"
gametimelimitf = 30*60  *  1
local winners = {}

function gadget:UnitFinished(unitID, unitDefID, teamID)
	if (teamID == nil) then Spring.Echo ("WARNING by tp_gamelogic.lua: teamID == nil in UnitFinished") end
	local unitDef = UnitDefs[unitDefID]
	if (unitDef.name == "tpflag") then 
		debugmsg ("flag added")
		flags[unitID] = teamID
		Spring.SetUnitNoSelect (unitID,true)
	end	
end

function gadget:UnitDestroyed(unitID, unitDefID, teamID, attackerID)
	local unitDef = UnitDefs[unitDefID]
	if (unitDef.name == "tpflag") then 
		flags[unitID] = nil
	end
	if (unitDef.name == "tptaktak" or unitDef.name == "tpthulsa" or unitDef.name == "tplegocar") then
		add_respawn_unit (teamID, unitDef.name)
	end	
end

function gadget:Initialize()
	Spring.Echo ("tp_gamelogic.lua Initialize()")
	get_flags_and_bases ()
	local modOptions = Spring.GetModOptions()
	gametimelimitf = (modOptions.gametimelimit or 10) * 60 * 30
end



function gadget:GameFrame (frame)	
	if (frame==1) then 
		Spring.SendLuaUIMsg (luamsgpre .. "The game has begun!")
		Spring.SendLuaUIMsg (luamsgpre .. "Timelimt: " .. gametimelimitf/30/60 .."min")
	end		
	if (frame==30) then get_flags_and_bases () end
	if (frame==gametimelimitf) then endgame() end
	if (frame+120==gametimelimitf) then Spring.SendLuaUIMsg (luamsgpre .. "press shift+esc to exit") end
	if (frame>gametimelimitf and frame%30==0) then fireworks() end
	if (frame>gametimelimitf) then return end
	if (frame % 30 == 0) then flagcheck() end
	if (frame % waverespawn == 0) then respawn_units() end	
end

function endgame ()
	Spring.SendLuaUIMsg (luamsgpre .. "The game has ended!")
	winners, allysWithHSnumber = winningteams(score)
	--Spring.Echo ("#Spring.GetAllyTeamList():" .. #Spring.GetAllyTeamList() .." allysWithHSnumber:" .. allysWithHSnumber)
	if (winners==nil or (allysWithHSnumber == #Spring.GetAllyTeamList()  -1)) then
		Spring.SendLuaUIMsg (luamsgpre .. "There is no winner.")
		Spring.SendLuaUIMsg (luaresultmsgpre .. "*DRAW*")
	else
		--if (#winners==1) then Spring.SendLuaUIMsg (luamsgpre .. "<TEAM" .. winners[1] .."> wins!") end
		if (allysWithHSnumber > 1) then
			Spring.SendLuaUIMsg (luamsgpre .. "It is a tie between:")
		else
			Spring.SendLuaUIMsg (luamsgpre .. "The winners are:")
		end
		local winnerString = "*" --"*1*2*36* <- nummer der winning teams
		for winner_i,_  in pairs (winners) do
			winnerString = winnerString .. winners[winner_i] .. "*"
			Spring.SendLuaUIMsg (luamsgpre .. "<TEAM" .. winners[winner_i] ..">")
		end
		Spring.SendLuaUIMsg (luaresultmsgpre .. winnerString)
	end	
	--Spring.GameOver	(winners)  --will be possible in 0.83.x 
end

--***bei teamgames müssen die teamscores zum ally score zusammengerechnet werden.
function winningteams(score)
	--[[ alt
	local highestscore=0
	for teamid,_  in pairs (score) do
			if (score[teamid] > highestscore) then highestscore=score[teamid] end
	end
	local winners = {}
	for teamid,_  in pairs (score) do
		if (score[teamid] == highestscore) then table.insert(winners,teamid) end
	end
	return winners
	--]]
	local allysWithHScounter = 0	--how many teams have the highest score. to decide if it is a tie.
	local allyscore = getallyscores (score)	
	local highestscore=0
	--find the highest score reached by any allyteam
	for allyid,_  in pairs (allyscore) do
		if (allyscore[allyid] > highestscore) then highestscore=allyscore[allyid] end
	end
	debugmsg ("the highest score is " .. highestscore)
	if (highestscore == 0) then return nil, 0 end --wenn der höchste score 0 ist, hat keiner gewonnen
	local winners = {}
	
	for allyid,_  in pairs (allyscore) do	
		--all allyteams with a score equal to highestscore are winrars!
		if (allyscore[allyid] == highestscore) then 
			debugmsg ("Ally " .. allyid .. " has the highest score")
			allysWithHScounter = allysWithHScounter +1
			local winteams = Spring.GetTeamList (allyid)
			for _,winteamID  in ipairs (winteams) do				
				table.insert(winners,winteamID)
				debugmsg ("Team " .. winteamID .. " of ally " .. allyid .. " is a winning team")
			end
		end
	end
	
	return winners, allysWithHScounter
end

--add up the team's score to form the ally score. then return those.
function getallyscores (score)	
	local allyscore = {}
	local allys = Spring.GetAllyTeamList ()
	for _,allyid  in ipairs (allys) do
		--debugmsg ("ALLYID: " .. allyid)
		local teams = Spring.GetTeamList (allyid)		
		allyscore[allyid] = 0
		for _,teamid  in ipairs (teams) do
			if (score[teamid]~=nil) then allyscore[allyid]=allyscore[allyid]  + score[teamid] end
		end
		debugmsg ("Allyteam " .. allyid .. " has " .. allyscore[allyid] .. " points")
	end
	return allyscore
end

--spawn "fireworks" effects above the base of the winners
function fireworks ()	
	if (winners == nil) then return end	
	for winid,_  in pairs (winners) do
		for baseid,_  in pairs (bases) do		
		local unitteam = Spring.GetUnitTeam (baseid)
		if (winners[winid] == unitteam) then
			local x,y,z=Spring.GetUnitPosition (baseid)
			Spring.SpawnCEG("tpstars", x+math.random(-100,100), y+100, z+math.random(-100,100))
			Spring.SpawnCEG("tpstars", x+math.random(-100,100), y+100, z+math.random(-100,100))
			Spring.SpawnCEG("tpstars", x+math.random(-100,100), y+100, z+math.random(-100,100))
		end
		end
	end	
end

---CAPTURE THE FLAG-----
function flagcheck ()	
	if (flags) then		
	--Spring.Echo ("flag check")
		for flagid,_  in pairs (flags) do			
			local x,y,z = Spring.GetUnitPosition (flagid)
			if (x) then				
				nearunits=Spring.GetUnitsInCylinder (x,z, flagcaptureadius) or "nothing"
				if (nearunits~="nothing") then
					--Spring.Echo ("units near flag:" .. #nearunits)
					for _, nearunitid in ipairs (nearunits) do
						local unitDef = UnitDefs[Spring.GetUnitDefID(nearunitid)]
						nearunitteam = Spring.GetUnitTeam (nearunitid)
						flagteam = flags[flagid]
						--if (nearunitteam == flagteam and unitDef.name ~= "tpflag" and unitDef.name ~= "tpbase") then
						if (units_allied (nearunitid, flagid) and unitDef.name ~= "tpflag" and unitDef.name ~= "tpbase") then						 
							--Spring.Echo("flag returned!")							
							local flagreturned = teleport_unit_to_base (flagid, flagteam, flagbasedistance)
							if (flagreturned==true) then 
								Spring.SpawnCEG("tpflagreturn", x, y, z)
								Spring.SendLuaUIMsg (luamsgpre .. "<TEAM" .. flagteam .. "> returned his flag")
								break --stop doubled "flag returned" messages
							end
						end
						--if (nearunitteam ~= flagteam and unitDef.name ~= "tpflag" and unitDef.name ~= "tpbase") then
						--if (canCarryFlag (unitDef.name) and not units_allied (nearunitid, flagid) and unitDef.name ~= "tpflag" and unitDef.name ~= "tpbase") then							
						if (canCarryFlag (unitDef.name) and not units_allied (nearunitid, flagid) ) then							
							--Spring.Echo ("flag picked up!")
							local flagscarried = #(Spring.GetUnitIsTransporting (nearunitid) or ({}))
							local flagcarrier = Spring.GetUnitTransporter (flagid)
							if (flagscarried==0 and flagcarrier == nil) then		--no "you got flag!" mess spam when a unit is already carrying a flag or is near a flag that is carried by another unit because that flag cant be picked up
								Spring.SendLuaUIMsg (luamsgpre .. "<TEAM" .. nearunitteam .. "> picked up flag!")
								Spring.SpawnCEG("tpflagpickup", x, y, z)
								env = Spring.UnitScript.GetScriptEnv(nearunitid)
								if (env) then Spring.UnitScript.CallAsUnit(nearunitid, env.script.TransportPickup,flagid) end
							end
						end						
						if (unitDef.name == "tpbase" and not units_allied (nearunitid, flagid)) then
							--Spring.Echo ("yeah score!")
							score_flag (flagid, flagteam, nearunitteam)							
							Spring.SendLuaUIMsg (luascoremsgpre .. score_string())
						end						
					end
				end
			end
		end
	end
end

function score_flag (flagid, flagteam, scorerteam)	
	--local msg = "**HOORAY!**  " .. teamid_to_playername(scorerteam) .. " has scored with the flag of " .. teamid_to_playername(flagteam) .. " !"
	local msg = "<TEAM" .. scorerteam .. "> scored!"
	--Spring.Echo (msg)
	Spring.SendLuaUIMsg (luamsgpre .. msg)
	local x,y,z=Spring.GetUnitPosition (flagid)
	Spring.SpawnCEG("tpstars", x, y, z)
	spawn_unit_at_base (flagteam, "tpflag", 256)
	Spring.DestroyUnit (flagid)
	add_score (scorerteam, 1)
end

function get_flags_and_bases ()
	--Spring.Echo ("get_flags_and_bases ()")
	flags = {}
	bases = {}
	local all_units = Spring.GetAllUnits ()
	for i in pairs(all_units) do
		debugmsg ("Uid=" .. all_units[i])
		local unitDef = UnitDefs[Spring.GetUnitDefID(all_units[i])]
		local unitTeam = Spring.GetUnitTeam (all_units[i])
		if (unitDef) then
			if (unitDef.name == "tpflag") then
				flags[all_units[i]] = unitTeam
			end
			if (unitDef.name == "tpbase") then
				bases[all_units[i]] = unitTeam
			end
		end
	end
end

function canCarryFlag (unitName)
	if (unitName=="tptaktak") then return true end
	if (unitName=="tpthulsa") then return true end
	if (unitName=="tplegocar") then return true end
end
-----------ctf end----------

----UNIT RESPAWN------------
function add_respawn_unit (teamID, unitname)
	local newunit={}
	newunit.teamid = teamID
	newunit.unitname = unitname
	table.insert (respawnunits, newunit)
end

function respawn_units ()
	for uid,_  in pairs (respawnunits) do
		--Spring.Echo ("respawning a " .. respawnunits[uid].unitname .." for a Team " .. respawnunits[uid].teamid)
		spawn_unit_at_base (respawnunits[uid].teamid, respawnunits[uid].unitname, unitrespawndistance)
	end
	respawnunits={}	
end

----unit respawn end--------

function spawn_unit_at_base (teamID, unitname, radius)
	if (radius==nil) then radius = 64 end
	if (bases==nil) then Spring.Echo ("ERROR: NO BASES TO RESPAWN UNITS") end
	for baseid,_  in pairs (bases) do
		if (bases[baseid] == teamID) then
			local x,y,z=Spring.GetUnitPosition (baseid)
			--x=x+math.random(-radius,radius)
			--z=z+math.random(-radius,radius)
			local angle = math.random (0, 360)
			x=x+ radius*math.sin(math.rad(angle))
			z=z+ radius*math.cos(math.rad(angle))
			local newunit = Spring.CreateUnit(unitname, x, y, z, 0, teamID)
			Spring.SpawnCEG("tprespawn", x, y, z)
			--if (newunit) then Spring.Echo ("unit respawned for team " .. teamID) end
		end
	end
end

--return true if the unit was moved (might not move when it is already close enough to base)
function teleport_unit_to_base (unitID, teamID, radius)
	if (radius==nil) then radius = 256 end
	if (teamID==nil) then teamID = Spring.GetUnitTeam (unitID) end
	for baseid,_  in pairs (bases) do
		if (bases[baseid] == teamID) then
			local d = Spring.GetUnitSeparation (unitID, baseid)
			if (d*1.1 > radius) then
				local x,y,z=Spring.GetUnitPosition (baseid)
				local angle = math.random (0, 360)
				x=x+ radius*math.sin(math.rad(angle))
				z=z+ radius*math.cos(math.rad(angle))
				Spring.MoveCtrl.Enable(unitID)
				Spring.MoveCtrl.SetPosition (unitID,x,y,z)
				Spring.MoveCtrl.Disable(unitID)
				Spring.SpawnCEG("tprespawn", x, y, z)
				return true
			end
		end
	end
end

---score keeping---
function add_score (teamID, bonus)
	teamID=teamID
	if (score[teamID]==nil) then score[teamID] = 0 end
	score[teamID] = score[teamID] + bonus
end

function show_score ()
	Spring.Echo ("***SCORE TABLE***")
	for teamid,_  in pairs (score) do
		Spring.Echo ("Team " .. teamid .. ":" .. score[teamid])
	end
	Spring.Echo ("score als string:" .. score_string ())
end

--"TEAMSCORE0=450 TEAMSCORE1=8 TEAMSCORE5=90"
function score_string ()
	local score_s = ""
	for teamid,_  in pairs (score) do
		score_s = score_s .. "TEAMSCORE" .. teamid .."=" .. score[teamid] .. " "
	end
	--Spring.Echo ("score_string() returned: " .. score_s)
	return score_s
end
-------------------

--return player(s) on this team as string
--does not work in 	0.82.7.1   http://springrts.com/mantis/view.php?id=2307
function teamid_to_playername (teamID)
	local _, uplayer, _, isAiTeam = Spring.GetTeamInfo(teamID)
	local playername = "unknown playername"
	if (isAiTeam == true) then
		local _, skirmishAIID, name, hostingPlayerID, shortName, version = Spring.GetAIInfo(teamID)  --Spring.GetAIInfo(uplayer) 
		playername = "BOT_" .. name .. skirmishAIID .."_"..shortName ..hostingPlayerID
	end
	if (isAiTeam == false) then playername = Spring.GetPlayerInfo(uplayer) or 'GetPlayerInfo fail' end
	--Spring.Echo ("<PLAYER0> did something")
	--Spring.SendMessage ("<PLAYER0>")
	return playername
end

function units_allied (unitID1, unitID2)
	return Spring.GetUnitAllyTeam (unitID1) == Spring.GetUnitAllyTeam (unitID2)	
end

function debugmsg (msg)
if (isbug) then Spring.Echo ("* " .. msg .. " *") end
end

---------- table to string functions -------
--- http://lua-users.org/wiki/TableUtils ---
function table.val_to_str ( v )
      if "string" == type( v ) then
        v = string.gsub( v, "\n", "\\n" )
        if string.match( string.gsub(v,"[^'\"]",""), '^"+$' ) then
          return "'" .. v .. "'"
        end
        return '"' .. string.gsub(v,'"', '\\"' ) .. '"'
      else
        return "table" == type( v ) and table.tostring( v ) or
          tostring( v )
      end
    end

    function table.key_to_str ( k )
      if "string" == type( k ) and string.match( k, "^[_%a][_%a%d]*$" ) then
        return k
      else
        return "[" .. table.val_to_str( k ) .. "]"
      end
    end

    function table.tostring( tbl )
      local result, done = {}, {}
      for k, v in ipairs( tbl ) do
        table.insert( result, table.val_to_str( v ) )
        done[ k ] = true
      end
      for k, v in pairs( tbl ) do
        if not done[ k ] then
          table.insert( result,
            table.key_to_str( k ) .. "=" .. table.val_to_str( v ) )
        end
      end
      return "{" .. table.concat( result, "," ) .. "}"
    end	
end


---no unit transfer!
function gadget:AllowUnitTransfer(unitID, unitDefID, oldTeam, newTeam, capture)
	return false
end