--THIS GOES IN YOUR GAME GADGETS FOLDER
function gadget:GetInfo()
  return {
    name      = "RecvLuaMsg to unitscript transmiter",
    desc      = "backwards through the chest into the eye",
    author    = "knorke",
    date      = "jan 2010",
    license   = "raubkopierer sind verbrecher",
    layer     = 0,
    enabled   = false,
  }
end

local d = 10	--step size for moving/resizing

if (gadgetHandler:IsSyncedCode()) then
  KP0 = 256
  KP1 = 257
  KP2 = 258
  KP3 = 259
  KP4 = 260
  KP5 = 261
  KP6 = 262
  KP7 = 263
  KP8 = 264
  KP9 = 265

local euID = nil
--local boxxy = nil
  
function gadget:RecvLuaMsg(msg, playerID)
	   
pre = "tpkey" --boxxy
--if (msg:find(pre,1,true)) then Spring.Echo ("its a loveNtrolls message") end
local data = explode( '|', msg:sub(#pre+1) )
	local key = data[2]
	if (euID) then
		env = Spring.UnitScript.GetScriptEnv(euID)
		if (env) then Spring.UnitScript.CallAsUnit(euID, env.unitmessage, msg, playerID) end

	end
--Spring.Echo ("RecvLuaMsg: " .. msg .. " from " .. playerID)
	
end

function gadget:UnitFinished(unitID, unitDefID, teamID)
	euID = unitID
	Spring.Echo ("now editing: " .. euID)
	marker_on_unit (euID, "you can now edit this unit")
end


function gadget:DrawScreenEffects()
    if (Spring.ValidUnitID (euID) == true) then
        local x,y=Spring.WorldToScreenCoords(Spring.GetUnitPosition(id))
        gl.Text("now editing"..id,x,y,16,"od")
	end    
end


function gadget:Initialize()
	Spring.Echo ("Fram0r HERE U MAD?")
end


function explode(div,str)
  if (div=='') then return false end
  local pos,arr = 0,{}
  -- for each divider found
  for st,sp in function() return string.find(str,div,pos,true) end do
    table.insert(arr,string.sub(str,pos,st-1)) -- Attach chars left of current divider
    pos = sp + 1 -- Jump past current divider
  end
  table.insert(arr,string.sub(str,pos)) -- Attach chars right of last divider
  return arr
end

function marker_on_unit (_uID, _text)
	if (_uID == nil) then return end
	if (_text == nil) then return end
	local x,y,z=Spring.GetUnitPosition (_uID)
	if (x == nil or y == nil or z == nil) then return end
	--Spring.MarkerAddPoint (x,y,z, _text .. "id:" .. _uID)
	Spring.MarkerAddPoint (x,y,z, _text)
end
else -- ab hier unsync


end