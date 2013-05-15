-- $Id: ModOptions.lua 3323 2008-11-29 19:55:06Z reivanen $

--  Custom Options Definition Table format

--  NOTES:
--  - using an enumerated table lets you specify the options order
--
--  These keywords must be lowercase for LuaParser to read them.
--
--  key:      the string used in the script.txt
--  name:     the displayed name
--  desc:     the description (could be used as a tooltip)
--  type:     the option type
--  def:      the default value
--  min:      minimum value for number options
--  max:      maximum value for number options
--  step:     quantization step, aligned to the def value
--  maxlen:   the maximum string length for string options
--  items:    array of item strings for list options
--  scope:    'all', 'player', 'team', 'allyteam'      <<< not supported yet >>>
--


--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

local opts= {
	{
	key="gametimelimit",
	name="Time Limit",
	desc="How many minutes the game lasts.",
	type   = 'number',	
	def    = 10,
	min    = 1,
	max    = 90,
	step   = 1,
	},
	
	key="flaglos",
	name="Flag Visibility",
	desc="Should flags be always visible, even outside of units sight range?",
	type="list",
	def="normal",
	items = {
		{ key = "normal", name = "Flags are only visible when seen by units.", desc = "Flags are only visible when in sight distance"},
		{ key = "alwaysvisible", name = "Flags are always visible.", desc = "Flags are always visible" },
		
	},
	
}
return opts