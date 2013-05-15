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

local function BushShore  (x,z)
	newBush = {}
	newBush.x = x
	newBush.z = z
	local d = math.random(0,10)
	if (d > 6) then newBush.name = "ad0_bushes_xxl_5"
	elseif (d > 4) then newBush.name = "ad0_bushes_xxxl_1"
	elseif (d > 2) then newBush.name = "ad0_bushes_xxl_1"
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


Tree (2801 , 3465)   -- big tree
Tree (3153 , 3482)   -- bt
Tree (2974 , 3140)   -- bt
Tree (3022 , 4448)   -- bt

Tree (3832 , 2914)   -- bt
Tree (2095 , 2949)   -- bt

Tree (1100 , 4694)   -- trees around the shore
Tree (994 , 4488)   -- 
Tree (989 , 4186)   -- 
Tree (1098 , 3908)   -- 
Tree (1218 , 4823)   -- 
Tree (1525 , 4979)   -- 
Tree (1948 , 5025)   -- 
Tree (2472 , 4955)   -- 
Tree (3041 , 4877)   -- 
Tree (3434 , 4878)   -- 
Tree (3194 , 4874)   -- 
Tree (2844 , 4881)   -- 
Tree (3283 , 4797)   -- 
Tree (3721 , 4921)   -- 
Tree (4072 , 4998)   -- 
Tree (4444 , 4998)   -- 
Tree (4882 , 4865)   -- 
Tree (5077 , 4568)   -- 
Tree (5075 , 4134)   -- 
Tree (4850 , 3748)   -- 
Tree (4626 , 3463)   -- 
Tree (4355 , 3144)   -- 
Tree (4054 , 2596)   -- 
Tree (4535 , 3311)   -- 
Tree (4397 , 3164)   -- 
Tree (3777 , 1748)   -- 
Tree (3599 , 1407)   -- 
Tree (3288 , 1152)   -- 
Tree (3004 , 1098)   -- 
Tree (2647 , 1387)   -- 
Tree (2343 , 1642)   -- 
Tree (2220 , 2136)   -- 
Tree (2032 , 2521)   -- 
Tree (1811 , 2941)   -- 
Tree (1663 , 3191)   -- 

Bush (2909 , 3608)   -- grass in middle
Bush (2804 , 3587)   -- 
Bush (2662 , 3587)   -- 
Bush (2697 , 3512)   -- 
Bush (2696 , 3388)   -- 
Bush (2692 , 3292)   -- 
Bush (2807 , 3296)   -- 
Bush (2915 , 3189)   -- 
Bush (2896 , 3088)   -- 
Bush (3013 , 2988)   -- 
Bush (3110 , 3106)   -- 
Bush (3117 , 3234)   -- 
Bush (3199 , 3280)   -- 
Bush (3226 , 3409)   -- 
Bush (3225 , 3519)   -- 
Bush (3220 , 3595)   -- 
Bush (3123 , 3605)   -- 
Bush (3025 , 3605)   -- 
Bush (2787 , 3203)   -- 
Bush (2708 , 3198)   -- 
Bush (2892 , 3393)   -- 
Bush (2896 , 3291)   -- 
Bush (3034 , 3291)   -- 
Bush (3118 , 3292)   -- 
Bush (3119 , 3379)   -- 
Bush (2990 , 3398)   -- 
Bush (2988 , 3503)   -- 
Bush (2889 , 3500)   -- 
Bush (3118 , 3503)   -- 
Bush (3014 , 3685)   -- 
Bush (2914 , 3682)   -- 
Bush (2783 , 3683)   -- 
Bush (3175 , 3383)   -- 
Bush (2964 , 3332)   -- 

BushShore (1800 , 4894)   -- grass around the shore
BushShore (1895 , 4889)   -- 
BushShore (2007 , 4894)   -- 
BushShore (2099 , 4894)   -- 
BushShore (2185 , 4904)   -- 
BushShore (2306 , 4899)   -- 
BushShore (2406 , 4894)   -- 
BushShore (2497 , 4894)   -- 
BushShore (2598 , 4895)   -- 
BushShore (2709 , 4899)   -- 
BushShore (2814 , 4810)   -- 
BushShore (2912 , 4800)   -- 
BushShore (3000 , 4794)   -- 
BushShore (3108 , 4790)   -- 
BushShore (1591 , 4898)   -- 
BushShore (1702 , 4903)   -- 
BushShore (2198 , 4814)   -- 
BushShore (2096 , 4804)   -- 
BushShore (2003 , 4799)   -- 
BushShore (4092 , 4901)   -- 
BushShore (4000 , 4906)   -- 
BushShore (3904 , 4908)   -- 
BushShore (3810 , 4808)   -- 
BushShore (3687 , 4793)   -- 
BushShore (3584 , 4792)   -- 
BushShore (3492 , 4792)   -- 
BushShore (3364 , 4792)   -- 
BushShore (3391 , 4715)   -- 
BushShore (3292 , 4705)   -- 
BushShore (3192 , 4699)   -- 
BushShore (3062 , 4684)   -- 
BushShore (2989 , 4684)   -- 
BushShore (2855 , 4689)   -- 
BushShore (2813 , 4689)   -- 
BushShore (2720 , 4695)   -- 
BushShore (2690 , 4772)   -- 
BushShore (2571 , 4772)   -- 
BushShore (2491 , 4782)   -- 
BushShore (2289 , 4792)   -- 
BushShore (2376 , 4792)   -- 
BushShore (4187 , 2887)   -- 
BushShore (4092 , 2897)   -- 
BushShore (4175 , 2813)   -- 
BushShore (4110 , 2785)   -- 
BushShore (4201 , 2709)   -- 
BushShore (4109 , 2681)   -- 
BushShore (3995 , 2699)   -- 
BushShore (3988 , 2496)   -- 
BushShore (4104 , 2483)   -- 
BushShore (4010 , 2400)   -- 
BushShore (3859 , 2389)   -- 
BushShore (3897 , 2280)   -- 
BushShore (3929 , 2205)   -- 
BushShore (3808 , 2192)   -- 
BushShore (4008 , 2791)   -- 
BushShore (4095 , 2984)   -- 
BushShore (4199 , 2990)   -- 
BushShore (4209 , 3105)   -- 
BushShore (4308 , 3076)   -- 
BushShore (4313 , 2990)   -- 
BushShore (4306 , 3274)   -- 
BushShore (4419 , 3292)   -- 
BushShore (4423 , 3411)   -- 
BushShore (4325 , 3403)   -- 
BushShore (4503 , 3411)   -- 
BushShore (4500 , 3487)   -- 
BushShore (1695 , 3087)   -- 
BushShore (1809 , 3110)   -- 
BushShore (1816 , 3015)   -- 
BushShore (1719 , 2992)   -- 
BushShore (1925 , 2896)   -- 
BushShore (1910 , 2775)   -- 
BushShore (2001 , 2790)   -- 
BushShore (2030 , 2703)   -- 
BushShore (2116 , 2692)   -- 
BushShore (2103 , 2618)   -- 
BushShore (2197 , 2581)   -- 
BushShore (2200 , 2492)   -- 
BushShore (2224 , 2384)   -- 
BushShore (2103 , 2378)   -- 
BushShore (2106 , 2480)   -- 
BushShore (2016 , 2602)   -- 
BushShore (2004 , 3006)   -- 
BushShore (1899 , 3016)   -- 
BushShore (1900 , 3096)   -- 
BushShore (1888 , 3219)   -- 
BushShore (1816 , 3206)   -- 
BushShore (1814 , 3285)   -- 
BushShore (1709 , 3306)   -- 
BushShore (1686 , 3371)   -- 
BushShore (1583 , 3392)   -- 
BushShore (1583 , 3320)   -- 

return features