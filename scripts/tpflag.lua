local radar = piece "radar"
local flag =  piece "flag"


function script.Create()
	Hide (radar)
	
	StartThread (wave)
end

function wave ()
	Sleep (math.random(1000))
	while (true) do
	local x,y,z = Spring.GetWind ()
	local h = Spring.GetHeadingFromVector (x,z)
	Turn (flag, y_axis, h,math.rad(math.random (45,180)))
	Sleep (1000)
	end	
end

function script.Killed(recentDamage, maxHealth)	
	Sleep(100)
end