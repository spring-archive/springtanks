---this works---
newunit = {}
ud = UnitDefs ["tpthulsa"]
--for key,value in pairs(ud) do
--	Spring.Echo(key,value)
--	newunit[key]=value
--end
--newunit.unitname           = "testunit"
newunit.filename               = "xxx"
newunit.name               = "testunit"
newunit.objectname         = "flag.s3o"
newunit.script = "empty.lua"
UnitDefs["testunit"] = newunit
---------------

---this does not work----
UnitDefs["testunit2"] = {}
UnitDefs["testunit2"].unitname = "testunit2"
UnitDefs["testunit2"].name = "testunit2"
UnitDefs["testunit2"].objectname = "flag.s3o"
UnitDefs["testunit2"].script = "empty.lua"
-------------------------




--this works
--UnitDefs ["tpthulsa"].maxdamage = 666
--this works
Spring.Echo ("fuck yeah says unitdefs_post.lua")