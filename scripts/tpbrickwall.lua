local base = piece "base"
--local smoke = SFX.CEG

function script.Create()
	--Spring.Echo ("unit " .. unitID .. " was created!")
end


function fall ()
	StartThread (fall_thread)
end

function fall_thread ()
	Turn (base, z_axis,math.rad(90), math.rad(200))
	--Sleep (50)
	for i=29,1,-1 do 
		Hide (i)
		d=math.random (0,100)
		if (d < 80) then Explode (i, SFX.FALL + SFX.NO_HEATCLOUD) else Explode (i, SFX.SHATTER+SFX.NO_HEATCLOUD) end
		--EmitSfx (i, smoke)
		Hide (i)
		Sleep (15)
	end	
	Spring.DestroyUnit (unitID)
end

function script.Killed(recentDamage, maxHealth)

end