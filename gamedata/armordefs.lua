local armorDefs = {
Normal = {
	"tptank",
	"tpjeep",
	"tpfactory",
	"tpfactory2",
	"tpvierling",
	"tpdude",
	"tpdrill",
	"tphubschrauber",
	"tpclocky",
	"tpheliport",
	"tpufo",
	"tpthulsa",
	"tptaktak",
	"tplegocar",
},
Minerals = {
	"tpkristall",
	"tpkristall2",
},
}

--95.0
--http://springrts.com/wiki/Armordefs.lua#Example
--for categoryName, categoryTable in pairs(armorDefs) do
--  local t = {}
--  for _, unitName in pairs(categoryTable) do
--    t[unitName] = 1
--  end
--  armorDefs[categoryName] = t
--end

return armorDefs