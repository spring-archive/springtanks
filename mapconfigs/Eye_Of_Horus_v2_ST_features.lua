local features = {}

local function Bush  (x,z)
	newBush = {}
	newBush.x = x
	newBush.z = z
	local d = math.random(0,10)
	if (d > 9) then newBush.name = "ad0_bushes_xxxl_1"
	elseif (d > 4) then newBush.name = "ad0_bushes_xxl_1"
	elseif (d > 2) then newBush.name = "ad0_bushes_xxl_5"
	else newBush.name = "ad0_bushes_xxl_2" end		
	table.insert (features, newBush)
end

local function Bush2  (x,z)
	newBush = {}
	newBush.x = x
	newBush.z = z
	local d = math.random(0,10)
	if (d > 6) then newBush.name = "ad0_bushes_xxxl_1"
	elseif (d > 4) then newBush.name = "ad0_bushes_xxl_1"
	elseif (d > 2) then newBush.name = "ad0_bushes_xxl_5"
	else newBush.name = "ad0_bushes_xxl_2" end		
	table.insert (features, newBush)
end

local function Tree  (x,z)
	new = {}
	new.x = x
	new.z = z
	local d = math.random (0,10)
	if (d > 5) then new.name = "ad0_baobab_xxl_0" else new.name = "ad0_baobab_xxl_3" end
	table.insert (features, new)
end

local function smallTree  (x,z)
	new = {}
	new.x = x
	new.z = z
	local d = math.random (0,4)
	new.name = "ad0_baobab_" ..d	
	table.insert (features, new)
end
Bush (698 , 4092)   -- left pocket middle
Bush (704 , 4007)   -- 
Bush (803 , 3997)   -- 
Bush (799 , 4096)   -- 
Bush (806 , 4203)   -- 
Bush (900 , 4202)   -- 
Bush (924 , 4094)   -- 
Bush (925 , 4006)   -- 
Bush (904 , 3889)   -- 
Bush (833 , 3894)   -- 
Bush (691 , 3899)   -- 
Bush (693 , 3797)   -- 
Bush (704 , 3709)   -- 
Bush (793 , 3705)   -- 
Bush (904 , 3709)   -- 
Bush (904 , 3793)   -- 
Bush (795 , 3794)   -- 
Bush (606 , 4095)   -- 
Bush (492 , 4101)   -- 
Bush (401 , 4094)   -- 
Bush (399 , 3992)   -- 
Bush (287 , 3998)   -- 
Bush (295 , 4104)   -- 
Bush (386 , 3895)   -- 
Bush (970 , 4006)   -- 
Bush (5395 , 3297)   -- right pocket middle
Bush (5297 , 3303)   -- 
Bush (5198 , 3297)   -- 
Bush (5199 , 3205)   -- 
Bush (5212 , 3099)   -- 
Bush (5297 , 3095)   -- 
Bush (5300 , 3191)   -- 
Bush (5291 , 3386)   -- 
Bush (5222 , 3392)   -- 
Bush (5395 , 3209)   -- 
Bush (5423 , 3095)   -- 
Bush (5505 , 3211)   -- 
Bush (5494 , 3282)   -- 
Bush (5427 , 3357)   -- 
Bush (5410 , 3409)   -- 
Bush (5405 , 3494)   -- 
Bush (5513 , 3500)   -- 
Bush (5605 , 3502)   -- 
Bush (5695 , 3498)   -- 
Bush (5708 , 3398)   -- 
Bush (5790 , 3305)   -- 
Bush (5709 , 3302)   -- 
Tree (430 , 2215)   -- big trees in craters
Tree (3080 , 3600)   -- middle crater
Tree (5706 , 4966)   -- big tree in crater
Tree (70 , 4601)   -- 
Tree (2133 , 66)   -- 
Tree (4027 , 7092)   -- 
Tree (6065 , 2536)   -- 
Bush (2898 , 814)   -- grass top middle behind flag
Bush (2890 , 896)   -- 
Bush (2890 , 984)   -- 
Bush (2796 , 997)   -- 
Bush (3010 , 994)   -- 
Bush (3105 , 995)   -- 
Bush (3195 , 913)   -- 
Bush (3113 , 919)   -- 
Bush (2982 , 902)   -- 
Bush (2999 , 793)   -- 
Bush (3159 , 788)   -- 
Bush (3092 , 766)   -- 
Bush (3104 , 703)   -- 
Bush (3025 , 703)   -- 
Bush (3101 , 6391)   -- grass bottom middle behind flag
Bush (3196 , 6402)   -- 
Bush (3301 , 6401)   -- 
Bush (3412 , 6397)   -- 
Bush (3408 , 6293)   -- 
Bush (3317 , 6291)   -- 
Bush (3299 , 6209)   -- 
Bush (3213 , 6177)   -- 
Bush (3313 , 6092)   -- 
Bush (3391 , 6093)   -- 
Bush (3392 , 5983)   -- 
Bush (3202 , 6292)   -- 
Bush (3197 , 6468)   -- 

smallTree (3445 , 4062)   -- small trees in middle
smallTree (3502 , 4217)   -- 
smallTree (3374 , 4317)   -- 
smallTree (3621 , 4366)   -- 
smallTree (3647 , 4201)   -- 
smallTree (4023 , 3718)   -- 
smallTree (3900 , 3773)   -- 
smallTree (4029 , 3998)   -- 
smallTree (3817 , 3383)   -- 
smallTree (3693 , 3614)   -- 
smallTree (2589 , 2545)   -- 
smallTree (2585 , 2676)   -- 
smallTree (2937 , 2862)   -- 
smallTree (2561 , 2986)   -- 
smallTree (2250 , 3654)   -- 
smallTree (1907 , 3487)   -- 
smallTree (2305 , 3206)   -- 
smallTree (2128 , 3504)   -- 
Bush2 (2628 , 4114)   -- grass in middle left
Bush2 (2427 , 4009)   -- 
Bush2 (2624 , 3917)   -- 
Bush2 (2899 , 4126)   -- 
Bush2 (2858 , 4299)   -- 
Bush2 (2738 , 4191)   -- 
Bush2 (2790 , 4047)   -- 
Bush2 (2496 , 4141)   -- 
Bush2 (2582 , 4007)   -- 
Bush2 (3415 , 3067)   -- grass in middle right
Bush2 (3531 , 3014)   -- 
Bush2 (3358 , 2914)   -- 
Bush2 (3182 , 2941)   -- 
Bush2 (3593 , 3000)   -- 
Bush2 (3629 , 2810)   -- 
Bush2 (3477 , 2894)   -- 
Bush2 (3287 , 2776)   -- 
Bush2 (3282 , 2915)   -- 

return features