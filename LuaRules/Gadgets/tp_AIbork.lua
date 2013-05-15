function gadget:GetInfo()
    return {
        name    = "Borked Advancer",
        desc    = "forever charging onwards",
        author  = "knorke",
        date    = "Jan 2011",
        license = "goodbye hooorses",
        layer   = 82, --82 fo life?!
        version = "v1",
		enabled = true
    }
end

if (gadgetHandler:IsSyncedCode()) then
------SYNCED--------
myTeam = {}
unitOnMission = {} --[unitID] = wieviele frames in ruhe gelassen werden
function gadget:Initialize()
	counter = 0
    -- Initialise AI for all teams that are set to use it
    for _,t in ipairs(Spring.GetTeamList()) do
        local _,_,_,ai,side = Spring.GetTeamInfo(t)
        if ai and Spring.GetTeamLuaAI(t) == gadget:GetInfo().name then
            --log(t, " assigned to "..gadget:GetInfo().name)
            local pos = {}
            local home_x,home_y,home_z = Spring.GetTeamStartPosition(t)
			myTeam[t] = true
			Spring.Echo ("AI playing for team " .. t .." GetTeamLuaAI: " ..  Spring.GetTeamLuaAI(t))
        else
			myTeam[t]=false
		end
    end
	if (myTeam == nil) then 
		Spring.Echo ("Borked Advancer: not used, bye bye.")
		gadgetHandler:RemoveGadget()
	end
end


function gadget:GameFrame(frame)
	for i in pairs(unitOnMission) do
		unitOnMission[i] = unitOnMission[i] -1
	if (unitOnMission[i] < 0) then unitOnMission[i] = 0 end
	end
	if (frame % 30 ==0) then
		counter=counter+1		
	end
	
	--if ((frame-1) % 30 ==0) then
--		Spring.Echo ("counter=" .. counter)
--	end	
	
	if (frame % 60 ~=0) then return end
	if (myTeam == nil) then return end
	local all_units = Spring.GetAllUnits ()--  Spring.GetTeamUnits (mit nem loop)
	--Spring.Echo ("denke")
	if (all_units == nil) then return end
	for i,unit in pairs(all_units) do		
		local uteam = Spring.GetUnitTeam (unit)
		if (myTeam[uteam]==true) then
			local udID =Spring.GetUnitDefID(unit)
			if (udID) then
				if (wantNewOrders(unit)) then
					local flagsc = Spring.GetUnitIsTransporting (unit)
					local flagscarried=0
					if (flagsc) then flagscarried=#flagsc end
					local unitDef = UnitDefs [udID]
					if (unitDef.name == "tplegocar" or unitDef.name == "tptaktak" or flagscarried>0) then
						do_flagrun (unit)
					else
						do_flagrun (unit)
						unitOnMission[unit]=100
					end
				end
			end
		end
	end
			
end

function wantNewOrders (unitID)
	if (unitOnMission[unitID]) then
		if (unitOnMission[unitID] >0) then return false end
	end
	return true
end

function do_flagrun (unitID)
	local flagscarried = Spring.GetUnitIsTransporting (unitID)
	if ((not flagscarried) or #flagscarried==0) then
		nearflagID, tx, ty,tz,flagdistance = nearest_flag_from_unit (unitID)
		friendID, frx,fry,frz, frienddistance = nearest_friend_from_unit (unitID)
		--Spring.Echo (friendID .. " is nearest to " .. unitID)
		--if (friendID) then frienddistance = Spring.GetUnitSeparation (unitID, friendID) or 999999999999 end
		--if (friendID==nil) then Spring.Echo (unitID .. " got no friend") end
		if (friendID and frienddistance > 400 and (flagdistance or 0) > 700 ) then
			--tx,ty,tz = Spring.GetUnitPosition(friendID)
			tx = frx
			ty = fry
			tz = frz
			--Spring.Echo ("my friend is away " .. frienddistance)
			--Spring.GiveOrderToUnit(unitID, CMD.MOVE , {tx, ty, tz  }, {})
			Spring.GiveOrderToUnit(unitID, CMD.GUARD  , {friendID}, {}) 
			return
		else
			if (nearflagID) then tx,ty,tz = Spring.GetUnitPosition(nearflagID) end
		end			
		if (tx and ty and tz) then 
			Spring.GiveOrderToUnit(unitID, CMD.MOVE , {tx, ty, tz  }, {})
		end		
	else	--carrying flag? run home!
		local flagid, tx, ty,tz,d = nearest_homebase_from_unit (unitID)
		if (tx and ty and tz) then 
			Spring.GiveOrderToUnit(unitID, CMD.MOVE , {tx, ty, tz  }, {})
		end
	end
end

function do_attacknearest (unitID)
	local enemy = Spring.GetUnitNearestEnemy (unitID)
	if (enemy) then 
		Spring.GiveOrderToUnit(unitID, CMD.ATTACK  , { enemy  }, {}) 
	end
end

--nearest enemy flag actually
function nearest_flag_from_unit (uID)
	local nearest_flagID = nil
	local nearest_flag_distance = 9999999999	
	local x,y,z = Spring.GetUnitPosition(uID)	
	--local uallyteam = Spring.GetUnitAllyTeam (uID)
	flag=Spring.GetUnitsInCylinder (x,z, 9000)
	if (flag == nil) then return nil end	--no near units at all :/
	for i in pairs (flag) do
		if (not units_allied (flag[i] , uID)) then
			local udID =Spring.GetUnitDefID(flag[i])
			if (udID) then
				local unitDef = UnitDefs [udID]
				if (unitDef.name=="tpflag") then
					local d = Spring.GetUnitSeparation (uID, flag[i])
					if (d < nearest_flag_distance) then
						nearest_flag_distance = d
						nearest_flagID = flag[i]
					end
				end
			end
		end
	end
	if (nearest_flagID~=nil) then 		
		local rx,ry,rz=Spring.GetUnitPosition(nearest_flagID)
		return nearest_flagID, rx,ry,rz, nearest_flag_distance 
		else return nil 
	end
end
--***!!! combinieren zu get_nearest_unit_from_unit (uID, unitname, friend/enemy)
--!!! wtf? das returned doch doch nicht die homebase sondern sucht ja schon das ziel für die ai!  <- HÄ?
function nearest_homebase_from_unit (uID)
	local nearest_flagID = nil
	local nearest_flag_distance = 9999999999	
	local x,y,z = Spring.GetUnitPosition(uID)	
	local uteam = Spring.GetUnitTeam (uID)
	flag=Spring.GetUnitsInCylinder (x,z, 9000, uteam)
	if (flag == nil) then return nil end	--no near units at all :/
	for i in pairs (flag) do
		if (Spring.GetUnitTeam(flag[i]) == uteam) then
			local udID =Spring.GetUnitDefID(flag[i])
			if (udID) then
				local unitDef = UnitDefs [udID]
				if (unitDef.name=="tpbase") then
					local d = Spring.GetUnitSeparation (uID, flag[i])
					if (d < nearest_flag_distance) then
						nearest_flag_distance = d
						nearest_flagID = flag[i]
					end
				end
			end
		end
	end
	if (nearest_flagID~=nil) then 		
		local rx,ry,rz=Spring.GetUnitPosition(nearest_flagID)
		return nearest_flagID, rx,ry,rz, nearest_flag_distance 
		else return nil 
	end
end

function nearest_friend_from_unit (uID)
	local nearest_friendID = nil
	local nearest_friend_distance = 9999999999	
	local x,y,z = Spring.GetUnitPosition(uID)	
	local ually = Spring.GetUnitAllyTeam  (uID)
	friend=Spring.GetUnitsInCylinder (x,z, 9000) --, ually geht nicht weil nur teamID geht. man könnte probieren mit nem loop alle verbündeten teamIDs zu nehmen und die tables dann zu mergen
	if (friend == nil) then return nil end	--no near units at all :/
	for i in pairs (friend) do
		if (friend[i] ~= uID and units_allied(friend[i], uID)) then --and Spring.GetUnitAllyTeam(friend[i]) == ually
			local udID =Spring.GetUnitDefID(friend[i])
			if (udID) then
				local unitDef = UnitDefs [udID]
				--if (unitDef.name=="tplegocar" or unitDef.name=="tptaktak" or unitDef.name=="tpthulsa" or unitDef.name=="tpflag") then
				if (unitDef.name=="tpthulsa" or unitDef.name=="tpflag" or unitDef.name=="tplegocar") then
					local d = Spring.GetUnitSeparation (uID, friend[i])
					if (d < nearest_friend_distance) then
						nearest_friend_distance = d
						nearest_friendID = friend[i]
					end
				end
			end
		end
	end
	if (nearest_friendID~=nil) then
		local rx,ry,rz=Spring.GetUnitPosition(nearest_friendID)
		return nearest_friendID, rx,ry,rz, nearest_friend_distance 
		else return nil 
	end
end


function units_allied (unitID1, unitID2)
	return Spring.GetUnitAllyTeam (unitID1) == Spring.GetUnitAllyTeam (unitID2)
end

--2         3        4   5   6   7   
--playerID, cmdType, px, py, pz, label
function gadget:RecvLuaMsg(msg, playerID)
	--Spring.Echo ("AI: look what i got " .. msg)
	if (msg:find("MapDrawCmd",1,true)) then
		local p = explode ("|", msg)
		if (p[3] == "point") then
			local x = p[4]
			local y = p[5]
			local z = p[6]
			local label = p[7]
		end
	end
	
end

-- explode(seperator, string)
function explode(d,p)
  local t, ll
  t={}
  ll=0
  if(#p == 1) then return {p} end
	while true do
	  l=string.find(p,d,ll,true) -- find the next d in the string
	  if l~=nil then -- if "not not" found then..
		table.insert(t, string.sub(p,ll,l-1)) -- Save it in our array.
		ll=l+1 -- save just after where we found it for searching next time.
	  else
		table.insert(t, string.sub(p,ll)) -- Save what's left in our array.
		break -- Break at end, as it should be, according to the lua manual.
	  end
	end
  return t
end



else ------UNSYNCED--------

--function gadget:AddConsoleLine(msg,priority)							--does not work
--	Spring.Echo ("i hear you man")
--end

--function gadget:UnitDestroyed(unitID, unitDefID, teamID, attackerID)	--does not work
--	Spring.Echo ("oh unit destroyed")
--end

--function gadget:KeyPress(key) 										--this works!
	--Spring.Echo ("pressed key in gadget: " .. key)
--end

--function gadget:MapDrawCmd(playerID, cmdType, px, py, pz, label)
--	Spring.Echo ("marker!")
--	Spring.Echo ("playerID: " .. playerID .. "cmdType:" .. cmdType .. "px:" .. px .. "py:" .. py .. "pz:" .. pz .."label:" .. label)	
--end
end	--end unsynced