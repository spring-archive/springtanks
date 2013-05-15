local features = {}

local function Bush  (x,z)
	newBush = {}
	newBush.x = x
	newBush.z = z
	local d = math.random(0,10)
	if (d > 7) then newBush.name = "ad0_bushes_xxl_2"
	elseif (d > 4) then newBush.name = "ad0_bushes_xxl_1"
	elseif (d > 2) then newBush.name = "ad0_bushes_xxl_5"
	else newBush.name = "ad0_bushes_xxxl_1" end
	
		
	table.insert (features, newBush)
end

---coordinates go in between here---
Bush (2210 , 103)   -- behind top flag, at cliff
Bush (2201 , 207)   -- 
Bush (2106 , 194)   -- 
Bush (2104 , 284)   -- 
Bush (2306 , 112)   -- 
Bush (2146 , 33)   -- 
Bush (2257 , 25)   -- 
Bush (2215 , 295)   -- 
Bush (2305 , 256)   -- 
Bush (2398 , 202)   -- 
Bush (2400 , 300)   -- 
Bush (2272 , 303)   -- 
Bush (1599 , 3998)   -- behind low flag, at cliff
Bush (1497 , 3998)   -- 
Bush (1607 , 3808)   -- 
Bush (1711 , 3899)   -- 
Bush (1799 , 3901)   -- 
Bush (1899 , 3702)   -- 
Bush (1696 , 3695)   -- 
Bush (1515 , 3901)   -- 
Bush (1617 , 3904)   -- 
Bush (1713 , 4041)   -- 
Bush (1859 , 4064)   -- 
Bush (1836 , 3961)   -- 
Bush (1766 , 3768)   -- 
Bush (1864 , 3785)   -- 
Bush (1200 , 2896)   -- lower choke, low hill
Bush (1299 , 2795)   -- 
Bush (1304 , 2610)   -- 
Bush (1401 , 2599)   -- 
Bush (1401 , 2498)   -- 
Bush (1201 , 2593)   -- 
Bush (1608 , 2610)   -- 
Bush (1203 , 2784)   -- 
Bush (1509 , 2597)   -- 
Bush (1527 , 2492)   -- 
Bush (698 , 2805)   -- lower choke, top hill
Bush (718 , 2703)   -- 
Bush (603 , 2698)   -- 
Bush (502 , 2706)   -- 
Bush (506 , 2494)   -- 
Bush (510 , 2410)   -- 
Bush (701 , 2402)   -- 
Bush (602 , 2444)   -- 
Bush (503 , 2584)   -- 
Bush (906 , 2395)   -- 
Bush (828 , 2317)   -- 
Bush (592 , 2484)   -- 
Bush (598 , 2547)   -- 
Bush (1505 , 1995)   -- middle lake, top shore
Bush (1494 , 1890)   -- 
Bush (1600 , 1999)   -- 
Bush (1795 , 1999)   -- 
Bush (1825 , 1907)   -- 
Bush (1708 , 1882)   -- 
Bush (1698 , 2009)   -- 
Bush (1618 , 1901)   -- 
Bush (1572 , 1890)   -- 
Bush (1855 , 1806)   -- 
Bush (1920 , 1737)   -- 
Bush (1800 , 1733)   -- 
Bush (1715 , 1780)   -- 
Bush (2207 , 2015)   -- middle lake, lower shore
Bush (2197 , 2106)   -- 
Bush (2310 , 2013)   -- 
Bush (2401 , 1903)   -- 
Bush (2449 , 1986)   -- 
Bush (2408 , 2101)   -- 
Bush (2503 , 2101)   -- 
Bush (2300 , 2092)   -- 
Bush (2396 , 1997)   -- 
Bush (2503 , 1987)   -- 
Bush (1003 , 926)   -- BA startpos, top
Bush (1119 , 877)   -- 
Bush (1118 , 979)   -- 
Bush (906 , 947)   -- 
Bush (1029 , 777)   -- 
Bush (977 , 998)   -- 
Bush (1048 , 955)   -- 
Bush (1159 , 922)   -- 
Bush (1125 , 792)   -- 
Bush (892 , 762)   -- 
Bush (1071 , 675)   -- 
Bush (3120 , 3349)   -- BA startpos, low
Bush (3055 , 3435)   -- 
Bush (3180 , 3462)   -- 
Bush (3251 , 3303)   -- 
Bush (3168 , 3162)   -- 
Bush (2970 , 3198)   -- 
Bush (2960 , 3335)   -- 
Bush (2998 , 1488)   -- top choke, lower hill
Bush (3010 , 1598)   -- 
Bush (3108 , 1691)   -- 
Bush (3203 , 1590)   -- 
Bush (3322 , 1703)   -- 
Bush (3187 , 1721)   -- 
Bush (3131 , 1575)   -- 
Bush (3000 , 1700)   -- 
Bush (2897 , 1525)   -- 
Bush (3436 , 1587)   -- 
Bush (3425 , 1679)   -- 
Bush (3424 , 1738)   -- 
Bush (2801 , 1186)   -- top choke, top hill
Bush (2900 , 999)   -- 
Bush (2708 , 984)   -- 
Bush (2799 , 805)   -- 
Bush (2812 , 914)   -- 
Bush (2806 , 1013)   -- 
Bush (2512 , 1092)   -- 
Bush (2602 , 990)   -- 
Bush (2599 , 898)   -- 
Bush (2509 , 974)   -- 
Bush (2406 , 1196)   -- 
Bush (2400 , 1097)   -- 
Bush (2429 , 921)   -- 
Bush (2304 , 996)   -- 
Bush (2223 , 1042)   -- 
Bush (2259 , 1081)   -- 
Bush (2291 , 1181)   -- 
Bush (2330 , 1247)   -- 

---coordinates go in between here---


return features