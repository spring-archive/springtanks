local turret = piece "turret"
local launchpad = piece "launchpad"
local flares = ({piece "flare1", piece "flare2", piece "flare3"})
local missiles = ({piece "missile1", piece "missile2", piece "missile3"})
local radarmount = piece "radarmount"
local barrelsn = 3
local shotfrom = 1
local canshot = true
local lasttargetID = -1

function script.Create()
	Spin (radarmount, y_axis, 1)
end


--SHOOTING
function script.QueryWeapon1() return flares[shotfrom] end

function script.AimFromWeapon1() return launchpad end

function script.AimWeapon1( heading, pitch )	
	Signal(SIG_AIM)
	SetSignalMask(SIG_AIM)
	Turn(turret, y_axis, heading, math.rad(180))
	if (math.deg(pitch) < -10) then pitch = math.rad(-10) end
	Turn(launchpad, x_axis, -pitch, math.rad(180))
	WaitForTurn(turret, y_axis)
	WaitForTurn(launchpad, x_axis)
	--StartThread(RestoreAfterDelay)	
	return canshot
end

function script.FireWeapon1()
--	EmitSfx(flare, orc_machinegun_flash)
--	
	--Spring.MoveCtrl.SetGroundMoveTypeData(unitID, "maxSpeed", 0.5)
	--Spring.MoveCtrl.SetGroundMoveTypeData(unitID, "turnRate", 0.1)
	--EmitSfx(flares[shotfrom], muzzleflash)
	--Move (barrels[shotfrom], z_axis, -5)
		--Move (barrels[shotfrom], z_axis, 0, 20)	
	
	
	Hide (missiles[shotfrom])
	shotfrom=shotfrom+1
	if (shotfrom > barrelsn) then 
		--canshot= false 
		shotfrom = 1
		--Sleep (1000)
		Spring.AddUnitDamage (unitID, math.huge)
	end	
	--StartThread(RestoreAfterDelay)
	--RestoreAfterDelay()	
	--Spring.UnitScript.SetUnitValue(COB.CHANGE_TARGET, 0)
end



function script.BlockShot1 (targetID, userTarget )
	--[[
	if (targetID==nil) then return false end	--shooting at ground
	--Spring.Echo ("blockshot() targetID " .. targetID .. " its a " .. type (targetID) )
	--Spring.Echo ("blockshot() lasttargetID " .. lasttargetID)
	--Spring.Echo ("blockshot() userTarget  " .. userTarget)
	if (targetID==lasttargetID) then
		--Spring.Echo ("lol denied, retarget!")
		Spring.UnitScript.SetUnitValue(COB.CHANGE_TARGET, 0)
		return true
	end
	
	return false
	--]]
end


function script.Shot1 ()
	--Spring.Echo ("Shot1")
	Spring.UnitScript.SetUnitValue(COB.CHANGE_TARGET, 1)
end

--[[
function script.TargetWeight1 (targetID)
	Spring.Echo ("TargetWeight() targetID " .. targetID)
	Spring.Echo ("TargetWeight() lasttargetID " .. lasttargetID)
	if (targetID==lasttargetID) then 
		Spring.Echo ("same target as last time") 
		Spring.UnitScript.SetUnitValue(COB.CHANGE_TARGET, 0)
		return 90000 
	end
	lasttargetID = targetID
	Spring.Echo ("not same target")	
	return 0
end
--]]

function script.Killed(recentDamage, maxHealth)
	Spring.UnitScript.Explode (turret, SFX.FALL)
	Spring.UnitScript.Explode (launchpad, SFX.FALL)
	Sleep(30)
end


-------Transporting-----