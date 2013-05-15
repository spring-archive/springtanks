local wheel1 = piece "w1"
local wheel2 = piece "w2"
local wheel3 = piece "w3"
local wheel4 = piece "w4"
local base = piece "body"
local flagattachpoint = piece "flagpoint"

--local unitteamID = Spring.GetUnitAllyTeam (unitID)
-------DRIVING-----
function script.StartMoving()
--	StartThread(drive)
	Spin(wheel1, x_axis, 7)
	Spin(wheel2, x_axis, 7)
	Spin(wheel3, x_axis, 7)
	Spin(wheel4, x_axis, 7)
end
function script.StopMoving()
--	StartThread(stopdrive)
	StopSpin (wheel1,x_axis, 3)
	StopSpin (wheel2,x_axis, 3)
	StopSpin (wheel3,x_axis, 3)
	StopSpin (wheel4,x_axis, 3)
end

-------Transporting-----
function script.BeginTransport(passengerID)
end
function script.QueryTransport(passengerID)
	return base
end
function script.EndTransport(each, passengerID)
end
function script.TransportPickup (passengerID)	
	local unitDef = UnitDefs[Spring.GetUnitDefID(passengerID)]
	passengerteam = Spring.GetUnitAllyTeam (passengerID)
	if (unitDef.name == "tpmlauncher")									--always pick up rocket launcher
	or (passengerteam ~= Spring.GetUnitAllyTeam(unitID) and unitDef.name == "tpflag") then 	--only pick up enemy flags	
		Spring.SetUnitNoSelect (passengerID, true)
		Spring.UnitScript.AttachUnit (flagattachpoint, passengerID)
	end
end
------------------------

function script.FireWeapon1()
	--Emit blabla
	Sleep(30)
end

function script.Killed(recentDamage, maxHealth)
	Spring.UnitScript.Explode (wheel1, SFX.FALL)
	Spring.UnitScript.Explode (wheel2, SFX.FALL)
	Spring.UnitScript.Explode (wheel3, SFX.FALL)
	Spring.UnitScript.Explode (wheel4, SFX.FALL)
	Spring.UnitScript.Explode (base, SFX.SHATTER)
	Sleep(30)
end