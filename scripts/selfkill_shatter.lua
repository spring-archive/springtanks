local ich = unitID
function script.Create()	
	StartThread (selfkill)	
end

function selfkill ()
local SIG_BOM = 1
Signal(SIG_BOM)
SetSignalMask(SIG_BOM)

while (true) do	
	local  health,  maxHealth,  paralyzeDamage, captureProgress,  buildProgress = Spring.GetUnitHealth (ich)
	Spring.Echo ("zoing!" .. buildProgress)
	if (buildProgress==1) then Spring.DestroyUnit (ich) end
--	Spring.AddUnitDamage (ich, 9001) end
	Sleep (100)
	end
end

function script.Killed(recentDamage, maxHealth)	
	Spring.UnitScript.Explode (0, SFX.SHATTER)
end