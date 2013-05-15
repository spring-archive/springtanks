local base = piece "base"
local width = 1
local length = 80
local height = 80

function script.Create()
	Show (base)
	StartThread (blink)
	local x,y,z = Spring.GetUnitPosition(unitID)
	Spring.SetUnitNeutral (unitID,true)	--not targetable
	Spring.MoveCtrl.Enable (unitID)		--so the unit does not get moved upwards when the ground is terraformed
	
	--[[
	--is the wall - or | facing? untested because i only used /give and never actually tried rotating the unit
	if (GetUnitBuildFacing (unitID)%2~=0) then
		width,length = length,width
	end
	--]]
	for zd=-width/2,width/2,1 do
		for xd=-length/2,length/2, 1 do
			--Spring.AdjustHeightMap (x+xd,z+zd, 10) --this does not work so good
			originaly = Spring.GetGroundOrigHeight (x+xd,z+zd)			
			Spring.SetHeightMapFunc (Spring.SetHeightMap, x+xd,z+zd, height+originaly)
		end
	end	
	--Spring.SetUnitToFeature (true, unitID)
end

function blink ()
	while (true) do
		Show (base)
		Sleep (400)
		Hide (base)
		Sleep (200)
	end
end

function script.Killed(recentDamage, maxHealth)	
	--remove the wall
	local x,y,z = Spring.GetUnitPosition(unitID)
	for zd=-width/2,width/2,1 do
		for xd=-length/2,length/2, 1 do			
			originaly = Spring.GetGroundOrigHeight (x+xd,z+zd)			
			Spring.SetHeightMapFunc (Spring.SetHeightMap, x+xd,z+zd, originaly)
		end
	end	
	
	Sleep(100) --why do people do this?
end

function script.HitByWeapon(x,z,weaponDef,damage)
	---damage = 0
	return 0
end