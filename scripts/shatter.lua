function script.Create()

end

function shatter ()
	StartThread (shatter_thread)
end

function shatter_thread ()
	Hide (1)
	Explode (1, SFX.SHATTER + SFX.NO_HEATCLOUD)	
	Spring.DestroyUnit (unitID)
	Sleep (100)
end

function script.Killed(recentDamage, maxHealth)	

end