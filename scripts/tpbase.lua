--pieces: (base) body bigradar cone pillar1..4 pipes smallradar triangle mast->flag
local base = piece "base"
local bigradar = piece "bigradar"
local flag =  piece "flag"
local smallradar = piece "smallradar"
local pillar4 = piece "pillar4"
local mast = piece "mast"
local flag = piece "flag"
local pillar1 = piece "pillar1"
local pillar2 = piece "pillar2"
local pillar3 = piece "pillar3"
local triangle = piece "triangle"
local pipes = piece "pipes"

function script.Create()
	Hide (flag)
	Hide (mast)
	Hide (pipes)
	--Hide (pillar4)
	Hide (triangle)
	Hide (pillar1)
	Hide (pillar2)
	Hide (pillar3)
	Hide (bigradar)
	Spin (smallradar, y_axis, math.rad(90))
end

function fallOver ()
	Turn (base, x_axis, math.rad (90),math.rad (180))
end

function script.Killed(recentDamage, maxHealth)	
	Sleep(100)
end