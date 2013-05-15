local wingr = piece "wingr"
local wingl = piece "wingl"
local flapSpeed = math.rad(360)

function script.Create()
	StartThread (flapWings)
end

function script.Killed(recentDamage, maxHealth)

end

function flapWings()
	while (true) do
		Turn (wingr, z_axis, -math.rad(60),flapSpeed)
		Turn (wingl, z_axis, math.rad(60),flapSpeed)		
		WaitForTurn (wingr,z_axis)
		WaitForTurn (wingr,z_axis)
		Sleep (math.random (0,100))
		Turn (wingr, z_axis, 0,flapSpeed)
		Turn (wingl, z_axis, 0,flapSpeed)
		WaitForTurn (wingr,z_axis)
		WaitForTurn (wingr,z_axis)
		Sleep (math.random (100,300))
	end
end