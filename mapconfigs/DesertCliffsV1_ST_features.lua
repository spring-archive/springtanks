local features = {}

local function Bush  (x,z)
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



Tree (1441 , 2268)   -- big tree middle hill left
Tree (2584 , 1994)   -- big tree middle hill right


Bush(399 , 1096)   -- top left plateau
Bush(397 , 999)   -- 
Bush(499 , 999)   -- 
Bush(507 , 1101)   -- 
Bush(314 , 1075)   -- 
Bush(279 , 986)   -- 
Bush(309 , 881)   -- 
Bush(414 , 889)   -- 
Bush(493 , 881)   -- 
Bush(508 , 776)   -- 
Bush(587 , 792)   -- 
Bush(598 , 896)   -- 
Bush(607 , 995)   -- 
Bush(560 , 949)   -- 
Bush(666 , 832)   -- 
Bush(706 , 996)   -- 
Bush(807 , 990)   -- 
Bush(807 , 1093)   -- 
Bush(697 , 1094)   -- 
Bush(754 , 941)   -- 
Bush(697 , 896)   -- 
Bush(703 , 789)   -- 
Bush(799 , 799)   -- 
Bush(803 , 896)   -- 
Bush(507 , 303)   -- 
Bush(507 , 406)   -- 
Bush(402 , 400)   -- 
Bush(411 , 300)   -- 
Bush(444 , 341)   -- 
Bush(602 , 293)   -- 
Bush(595 , 191)   -- 
Bush(517 , 203)   -- 
Bush(405 , 183)   -- 
Bush(547 , 249)   -- 
Bush(402 , 501)   -- 
Bush(492 , 501)   -- 
Bush(444 , 443)   -- 
Bush(304 , 398)   -- 
Bush(313 , 306)   -- 
Bush(3604 , 3800)   -- lower right plateau
Bush(3705 , 3788)   -- 
Bush(3717 , 3893)   -- 
Bush(3618 , 3918)   -- 
Bush(3643 , 3856)   -- 
Bush(3505 , 3903)   -- 
Bush(3505 , 3800)   -- 
Bush(3612 , 3674)   -- 
Bush(3686 , 3680)   -- 
Bush(3800 , 3702)   -- 
Bush(3750 , 3795)   -- 
Bush(3597 , 2904)   -- 
Bush(3602 , 2997)   -- 
Bush(3502 , 3098)   -- 
Bush(3600 , 3098)   -- 
Bush(3698 , 3093)   -- 
Bush(3553 , 3044)   -- 
Bush(3701 , 3000)   -- 
Bush(3505 , 3002)   -- 
Bush(3696 , 2904)   -- 
Bush(3695 , 2797)   -- 
Bush(3611 , 2814)   -- 
Bush(3502 , 2892)   -- 
Bush(3776 , 2912)   -- 
Bush(3767 , 2971)   -- 
Bush(3780 , 3002)   -- 
Bush(3656 , 3052)   -- 
Bush(3662 , 2840)   -- 
Bush(3663 , 2932)   -- 
Bush(3804 , 3094)   -- 
Bush(3778 , 3116)   -- 
Bush(3773 , 3063)   -- 
Bush(1297 , 3093)   -- in front of lower left plateau
Bush(1304 , 2992)   -- 
Bush(1202 , 2998)   -- 
Bush(1209 , 3094)   -- 
Bush(1258 , 3148)   -- 
Bush(1191 , 3203)   -- 
Bush(1119 , 3240)   -- 
Bush(1306 , 3203)   -- 
Bush(1103 , 3092)   -- 
Bush(1108 , 3001)   -- 
Bush(1196 , 2895)   -- 
Bush(1302 , 2895)   -- 
Bush(1350 , 2946)   -- 
Bush(1401 , 2993)   -- 
Bush(1406 , 2885)   -- 
Bush(2900 , 999)   -- in front of top right plateau
Bush(2902 , 1102)   -- 
Bush(2896 , 1202)   -- 
Bush(2998 , 1195)   -- 
Bush(2999 , 1287)   -- 
Bush(3000 , 1086)   -- 
Bush(3005 , 995)   -- 
Bush(3000 , 893)   -- 
Bush(3083 , 895)   -- 
Bush(2959 , 966)   -- 
Bush(2962 , 1049)   -- 
Bush(2964 , 1195)   -- 
Bush(2975 , 1252)   -- 
Bush(3028 , 1221)   -- 
Bush(2940 , 1142)   -- 
Bush(3089 , 1093)   -- 
Bush(3084 , 1172)   -- 

return features