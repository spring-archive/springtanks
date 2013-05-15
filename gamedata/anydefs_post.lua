Spring.Echo ("fuck yeah says anydefs_post.lua")
--create a "death animation unit" for every feature
for name, fd in pairs(FeatureDefs) do
--	Spring.Echo ("feature: " .. ud.name or "nil")
	local u = {}
	for key,value in pairs(fd) do
		--Spring.Echo(key,value)
		u[key]=value
	end
	--u.filename = "xxx"
	u.name = "unit" .. name
	u.script = "shatter.lua"
	u.objectname = fd.object
	u.maxDamage = 1
	u.hideDamage = true
	u.levelGround=false
	UnitDefs [u.name] = u
end