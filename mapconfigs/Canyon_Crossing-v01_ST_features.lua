local features = {}

local function Bush  (x,z)
	newBush = {}
	newBush.x = x
	newBush.z = z
	local d = math.random(0,10)
	if (d > 8) then newBush.name = "ad0_bushes_xxxl_1"
	elseif (d > 4) then newBush.name = "ad0_bushes_xxl_1"
	elseif (d > 2) then newBush.name = "ad0_bushes_xxl_5"
	else newBush.name = "ad0_bushes_xxl_2" end		
	table.insert (features, newBush)
end

local function Tree  (x,z)
	new = {}
	new.x = x
	new.z = z
	local d = math.random(0,10)
	if (d > 7) then new.name = "ad0_baobab_0"
	elseif (d > 6) then new.name = "ad0_baobab_1"
	elseif (d > 4) then new.name = "ad0_baobab_2"
	elseif (d > 2) then new.name = "ad0_baobab_3"
	else new.name = "ad0_baobab_4" end
	table.insert (features, new)
end

Bush (2994 , 6900)   -- lower middle pocket
Bush (3092 , 6905)   -- 
Bush (3199 , 6899)   -- 
Bush (3098 , 7003)   -- 
Bush (2993 , 6988)   -- 
Bush (3203 , 6997)   -- 
Bush (3311 , 6909)   -- 
Bush (3308 , 6997)   -- 
Bush (3413 , 6899)   -- 
Bush (3405 , 6982)   -- 
Bush (3496 , 6920)   -- 
Bush (3492 , 6981)   -- 
Bush (3584 , 6977)   -- 
Bush (3600 , 6904)   -- 
Bush (3505 , 6797)   -- 
Bush (3395 , 6797)   -- 
Bush (3305 , 6781)   -- 
Bush (3314 , 6667)   -- 
Bush (3390 , 6707)   -- 
Bush (3229 , 6792)   -- 
Bush (3225 , 6690)   -- 
Bush (3133 , 6693)   -- 
Bush (3105 , 6794)   -- 
Bush (3104 , 7400)   -- 
Bush (3103 , 7506)   -- 
Bush (3186 , 7501)   -- 
Bush (3208 , 7405)   -- 
Bush (3311 , 7400)   -- 
Bush (3302 , 7310)   -- 
Bush (3192 , 7305)   -- 
Bush (3235 , 7326)   -- 
Bush (3247 , 6925)   -- 
Bush (3247 , 6853)   -- 
Bush (3383 , 6835)   -- 
Bush (4996 , 1390)   -- top right pocket
Bush (5101 , 1391)   -- 
Bush (5098 , 1292)   -- 
Bush (5210 , 1287)   -- 
Bush (5199 , 1198)   -- 
Bush (5303 , 1193)   -- 
Bush (5290 , 1122)   -- 
Bush (5402 , 1103)   -- 
Bush (5400 , 1185)   -- 
Bush (5397 , 1289)   -- 
Bush (5305 , 1296)   -- 
Bush (5204 , 1393)   -- 
Bush (5249 , 1342)   -- 
Bush (5495 , 1282)   -- 
Bush (5499 , 1185)   -- 
Bush (5608 , 1198)   -- 
Bush (5614 , 1111)   -- 
Bush (5498 , 1090)   -- 
Bush (5559 , 1154)   -- 
Bush (5554 , 1234)   -- 
Bush (5698 , 1186)   -- 
Bush (5706 , 1079)   -- 
Bush (5812 , 1096)   -- 
Bush (5790 , 1209)   -- 
Bush (5699 , 1300)   -- 
Bush (5607 , 1300)   -- 
Bush (5647 , 1246)   -- 
Bush (5157 , 1341)   -- 
Bush (5050 , 1340)   -- 
Bush (5302 , 693)   -- 
Bush (5302 , 799)   -- 
Bush (5385 , 794)   -- 
Bush (5403 , 698)   -- 
Bush (5348 , 721)   -- 
Bush (898 , 3584)   -- left side pocket top
Bush (1001 , 3600)   -- 
Bush (992 , 3687)   -- 
Bush (1005 , 3795)   -- 
Bush (1097 , 3795)   -- 
Bush (1115 , 3703)   -- 
Bush (1201 , 3696)   -- 
Bush (1198 , 3608)   -- 
Bush (1187 , 3494)   -- 
Bush (1092 , 3502)   -- 
Bush (1096 , 3608)   -- 
Bush (1293 , 3600)   -- 
Bush (1308 , 3687)   -- 
Bush (1218 , 3795)   -- 
Bush (1238 , 3734)   -- 
Bush (1173 , 3734)   -- 
Bush (1045 , 3734)   -- 
Bush (1497 , 4292)   -- 
Bush (1378 , 4294)   -- 
Bush (1279 , 4308)   -- 
Bush (1293 , 4381)   -- 
Bush (1190 , 4396)   -- 
Bush (1206 , 4296)   -- 
Bush (1366 , 4354)   -- 
Bush (1398 , 4202)   -- 
Bush (1485 , 4201)   -- 
Bush (1297 , 4205)   -- 
Bush (1196 , 4210)   -- 
Bush (1216 , 4190)   -- 
Bush (1438 , 4292)   -- 
Bush (1503 , 4383)   -- 
Bush (1380 , 4388)   -- 
Bush (1549 , 4350)   -- 
Bush (1545 , 4246)   -- 
Bush (5800 , 7601)   -- pocket low right corner
Bush (5893 , 7583)   -- 
Bush (5895 , 7507)   -- 
Bush (5789 , 7490)   -- 
Bush (5905 , 7412)   -- 
Bush (5778 , 7396)   -- 
Bush (5705 , 7503)   -- 
Bush (5734 , 7411)   -- 
Bush (5848 , 7433)   -- 
Bush (5997 , 7295)   -- 
Bush (5992 , 7369)   -- 
Bush (5917 , 7294)   -- 
Bush (5950 , 7362)   -- 
Bush (6213 , 6502)   -- 
Bush (6206 , 6600)   -- 
Bush (6295 , 6580)   -- 
Bush (6301 , 6508)   -- 
Bush (6207 , 6697)   -- 
Bush (6285 , 6696)   -- 
Bush (6096 , 6582)   -- 
Bush (6161 , 6557)   -- 
Bush (4894 , 3600)   -- under top right middle hill
Bush (4996 , 3605)   -- 
Bush (5100 , 3599)   -- 
Bush (4795 , 3593)   -- 
Bush (4804 , 3713)   -- 
Bush (4697 , 3705)   -- 
Bush (4890 , 3696)   -- 
Bush (4917 , 3505)   -- 
Bush (4999 , 3509)   -- 
Bush (4800 , 3502)   -- 
Bush (4912 , 3403)   -- 
Bush (4812 , 3418)   -- 
Bush (4755 , 3462)   -- 
Bush (4991 , 3399)   -- 
Bush (5095 , 3502)   -- 
Bush (4996 , 3718)   -- 
Bush (5098 , 3701)   -- 
Bush (4906 , 3789)   -- 
Bush (4863 , 3682)   -- 
Bush (4999 , 3803)   -- 
Bush (5098 , 3797)   -- 
Bush (4785 , 3800)   -- 
Bush (4695 , 3807)   -- 
Bush (4696 , 3902)   -- 
Tree (3700 , 4589)   -- trees in the middle
Tree (3796 , 4398)   -- 
Tree (3684 , 4398)   -- 
Tree (3706 , 4173)   -- 
Tree (3905 , 4188)   -- 
Tree (3979 , 4392)   -- 
Tree (4101 , 4405)   -- 
Tree (4106 , 4516)   -- 
Tree (4110 , 4602)   -- 
Tree (4217 , 4588)   -- 
Tree (4319 , 4482)   -- 
Tree (4307 , 4296)   -- 
Tree (4205 , 4101)   -- 
Tree (4081 , 4071)   -- 
Tree (4094 , 3901)   -- 
Tree (3908 , 3901)   -- 
Tree (3990 , 3991)   -- 
Tree (4001 , 4796)   -- 
Tree (4497 , 4497)   -- 
Tree (4694 , 4702)   -- 
Tree (3711 , 5001)   -- 
Tree (3814 , 5099)   -- 
Tree (4096 , 3604)   -- 
Tree (4002 , 3401)   -- 
Tree (3609 , 3677)   -- 
Bush (3407 , 4506)   -- grass in middle
Bush (3410 , 4391)   -- 
Bush (3492 , 4380)   -- 
Bush (3514 , 4506)   -- 
Bush (3590 , 4501)   -- 
Bush (3593 , 4594)   -- 
Bush (3496 , 4590)   -- 
Bush (3505 , 4696)   -- 
Bush (3898 , 4096)   -- 
Bush (3901 , 4173)   -- 
Bush (4006 , 4202)   -- 
Bush (3999 , 4287)   -- 
Bush (3896 , 4283)   -- 
Bush (3807 , 4201)   -- 
Bush (4292 , 3699)   -- 
Bush (4300 , 3785)   -- 
Bush (4310 , 3902)   -- 
Bush (4482 , 3881)   -- 
Bush (4486 , 3788)   -- 
Bush (4499 , 3687)   -- 
Bush (4398 , 3669)   -- 
Bush (4409 , 3787)   -- 
Bush (4404 , 3895)   -- 
Bush (3907 , 5393)   -- 
Bush (3989 , 5394)   -- 
Bush (4007 , 5294)   -- 
Bush (3999 , 5204)   -- 
Bush (3924 , 5199)   -- 
Bush (3890 , 5279)   -- 
Bush (3747 , 5271)   -- 
Bush (3693 , 5295)   -- 
Bush (3740 , 5403)   -- 
Bush (3812 , 5392)   -- 
Bush (4400 , 5494)   -- 
Bush (4416 , 5376)   -- 
Bush (4528 , 5626)   -- 
Bush (4796 , 5377)   -- 
Bush (4795 , 5285)   -- 
Bush (4714 , 5275)   -- 
Bush (4711 , 5177)   -- 
Bush (4790 , 5172)   -- 
Bush (4723 , 5382)   -- 
Bush (4898 , 5186)   -- 
Bush (4806 , 5078)   -- 
Bush (3605 , 4000)   -- 
Bush (3575 , 3866)   -- 
Bush (3510 , 3974)   -- 
Bush (3492 , 3874)   -- 
Bush (2869 , 4194)   -- 
Bush (2901 , 4099)   -- 
Bush (3002 , 4089)   -- 
Bush (2990 , 4207)   -- 
Bush (3006 , 4308)   -- 
Bush (2874 , 4292)   -- 
Bush (2784 , 4300)   -- 
Bush (2688 , 4276)   -- 
Bush (2699 , 4188)   -- 
Bush (2569 , 4194)   -- 
Bush (2506 , 4189)   -- 
Bush (4009 , 5099)   -- 
Bush (3893 , 4993)   -- 
Bush (3988 , 4989)   -- 
Bush (4113 , 4976)   -- 
Bush (4104 , 4898)   -- 
Bush (4188 , 4880)   -- 
Bush (4206 , 4787)   -- 
Bush (4103 , 4797)   -- 
Bush (4091 , 5110)   -- 
Bush (3845 , 5084)   -- 
Bush (3878 , 5094)   -- 



return features