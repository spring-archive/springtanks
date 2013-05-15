local features = {}
local function Wall  (x,z, rot)
	new = {}
	new.x = x
	new.z = z
	if (rot==1) then rot=16384 end -- 0=|  1=-
	new.rot=rot	
	new.name = "ftpbrickwall"
	table.insert (features, new)
end


Wall (2792 , 3216, 0)   -- UnitCreated
Wall (2792 , 3376, 0)   -- UnitCreated
Wall (2792 , 3536, 0)   -- UnitCreated
Wall (2792 , 3696, 0)   -- UnitCreated
Wall (2792 , 3856, 0)   -- UnitCreated
Wall (3224 , 5232, 0)   -- UnitCreated
Wall (3224 , 5072, 0)   -- UnitCreated
Wall (3224 , 4912, 0)   -- UnitCreated
Wall (3224 , 4752, 0)   -- UnitCreated
Wall (3224 , 4592, 0)   -- UnitCreated
Wall (5000 , 4512, 0)   -- UnitCreated
Wall (5000 , 4672, 0)   -- UnitCreated
Wall (5000 , 4832, 0)   -- UnitCreated
Wall (5000 , 4992, 0)   -- UnitCreated
Wall (5000 , 5152, 0)   -- UnitCreated
Wall (5032 , 3760, 0)   -- UnitCreated
Wall (5032 , 3600, 0)   -- UnitCreated
Wall (5032 , 3440, 0)   -- UnitCreated
Wall (5032 , 3280, 0)   -- UnitCreated
Wall (5032 , 3120, 0)   -- UnitCreated
Wall (2984 , 1616, 0)   -- UnitCreated
Wall (2984 , 1776, 0)   -- UnitCreated
Wall (2600 , 1872, 0)   -- UnitCreated
Wall (2600 , 1712, 0)   -- UnitCreated
Wall (2600 , 1552, 0)   -- UnitCreated
Wall (5592 , 1584, 0)   -- UnitCreated
Wall (5592 , 1744, 0)   -- UnitCreated
Wall (5592 , 1904, 0)   -- UnitCreated
Wall (5192 , 1648, 0)   -- UnitCreated
Wall (5192 , 1808, 0)   -- UnitCreated
Wall (2600 , 6336, 0)   -- UnitCreated
Wall (2600 , 6496, 0)   -- UnitCreated
Wall (2600 , 6656, 0)   -- UnitCreated
Wall (3016 , 6368, 0)   -- UnitCreated
Wall (3016 , 6528, 0)   -- UnitCreated
-- jetz die ---- wände
Wall (2880 , 3928, 1)   -- UnitCreated
Wall (3040 , 3928, 1)   -- UnitCreated
Wall (3312 , 5320, 1)   -- UnitCreated
Wall (3472 , 5320, 1)   -- UnitCreated
Wall (3632 , 5320, 1)   -- UnitCreated
Wall (3792 , 5320, 1)   -- UnitCreated
Wall (3952 , 5320, 1)   -- UnitCreated
Wall (4112 , 5320, 1)   -- UnitCreated
Wall (4272 , 5320, 1)   -- UnitCreated
Wall (4432 , 5320, 1)   -- UnitCreated
Wall (4592 , 5320, 1)   -- UnitCreated
Wall (4752 , 5320, 1)   -- UnitCreated
Wall (4912 , 5320, 1)   -- UnitCreated
Wall (4960 , 3032, 1)   -- UnitCreated
Wall (4800 , 3032, 1)   -- UnitCreated
Wall (4640 , 3032, 1)   -- UnitCreated
Wall (4480 , 3032, 1)   -- UnitCreated
Wall (4320 , 3032, 1)   -- UnitCreated
Wall (4160 , 3032, 1)   -- UnitCreated
Wall (4000 , 3032, 1)   -- UnitCreated
Wall (3840 , 3032, 1)   -- UnitCreated
Wall (3680 , 3032, 1)   -- UnitCreated
Wall (3520 , 3032, 1)   -- UnitCreated
Wall (3360 , 3032, 1)   -- UnitCreated
Wall (3200 , 3032, 1)   -- UnitCreated
Wall (1680 , 2520, 1)   -- UnitCreated
Wall (1840 , 2520, 1)   -- UnitCreated
Wall (2000 , 2520, 1)   -- UnitCreated
Wall (2032 , 5720, 1)   -- UnitCreated
Wall (1872 , 5720, 1)   -- UnitCreated
Wall (1712 , 5720, 1)   -- UnitCreated
Wall (6224 , 5704, 1)   -- UnitCreated
Wall (6384 , 5704, 1)   -- UnitCreated
Wall (6544 , 5704, 1)   -- UnitCreated
Wall (5088 , 4440, 1)   -- UnitCreated
Wall (5248 , 4440, 1)   -- UnitCreated
Wall (5408 , 4440, 1)   -- UnitCreated
Wall (5568 , 4440, 1)   -- UnitCreated
Wall (5728 , 4440, 1)   -- UnitCreated
Wall (5888 , 4440, 1)   -- UnitCreated
Wall (5088 , 4808, 1)   -- UnitCreated
Wall (5248 , 4808, 1)   -- UnitCreated
Wall (5408 , 4808, 1)   -- UnitCreated
Wall (5568 , 4808, 1)   -- UnitCreated
Wall (5728 , 4808, 1)   -- UnitCreated
Wall (5888 , 4808, 1)   -- UnitCreated
Wall (6048 , 4808, 1)   -- UnitCreated
Wall (5120 , 3672, 1)   -- UnitCreated
Wall (5280 , 3672, 1)   -- UnitCreated
Wall (5440 , 3672, 1)   -- UnitCreated
Wall (5600 , 3672, 1)   -- UnitCreated
Wall (5760 , 3672, 1)   -- UnitCreated
Wall (5920 , 3672, 1)   -- UnitCreated
Wall (6080 , 3672, 1)   -- UnitCreated
Wall (6240 , 3672, 1)   -- UnitCreated
Wall (6400 , 3672, 1)   -- UnitCreated
Wall (6560 , 3672, 1)   -- UnitCreated
Wall (6720 , 3672, 1)   -- UnitCreated
Wall (6880 , 3672, 1)   -- UnitCreated
Wall (3632 , 4888, 1)   -- UnitCreated
Wall (3472 , 4888, 1)   -- UnitCreated
Wall (3312 , 4888, 1)   -- UnitCreated

return features