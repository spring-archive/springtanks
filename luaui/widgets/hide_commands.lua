function widget:GetInfo()
   return {
   version   = "1",
   name      = "SpringTanks | Hide buttons and resource bar",
   desc      = "Hides some commands and the resource bar which is unused anyway",
   author    = "Regret",
   date      = "February 19, 2010",
   license   = "Public Domain",
   layer     = 0,
   enabled   = true, --enabled by default
   handler   = true, --access to handler
   }
end

local HiddenCommands = {
   [CMD.MOVE] = true,
   [CMD.WAIT] = true,
   [CMD.STOP] = true,
   [CMD.FIGHT] = true,
   [CMD.ATTACK] = true,
   [CMD.PATROL] = true,
   [CMD.RECLAIM] = true,   
   [CMD.LOAD_UNITS] = true,
   [CMD.LOAD_UNITS] = true,
   [CMD.UNLOAD_UNITS] = true, 
   [CMD.GUARD] = true,
   [CMD.REPEAT] = true, 
   --   [CMD.MOVE_STATE] = true,
--   [CMD.FIRE_STATE] = true,
   [CMD.CLOAK] = true,
   [CMD.AUTOREPAIRLEVEL] = true,
   [CMD.IDLEMODE] = true,
}

function widget:CommandsChanged()
    local cmds = widgetHandler.commands
    local n = widgetHandler.commands.n
    for i=1,n do
      if (HiddenCommands[cmds[i].id]) then
         cmds[i].hidden = true
      end
    end
end

function widget:Initialize()
	Spring.SendCommands ("resbar 0")
end