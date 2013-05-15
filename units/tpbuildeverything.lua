local unitName = "tpbuildeverything"

local unitDef = {
name = "fucking magic",
Description = "builds everything",
objectName = "toilet.s3o",
script = "tpbuildeverything.lua",
buildPic = "placeholder.png",
--cost
buildCostMetal = 500,
buildCostEnergy = 0,
buildTime = 5,
--Health
maxDamage = 800,
idleAutoHeal = 0,
----movement
maxVelocity         = 15,
acceleration        = 1,
brakeRate           = 3.75,
moverate1           = [[3]],
footprintx          = 3,
footprintZ          = 3,
Upright 			= false,
maneuverleashlength = 1280,
collide             = true,
collision 			= true,
steeringmode        = [[1]],
TEDClass            = [[VTOL]],
turnRate            = 500,
turnRadius		  	= 5,
----aircraft related
canFly              = true,
dontLand		 	= false,
cruiseAlt           = 200,
hoverAttack         = true,
airStrafe			= false,
bankscale           = 1,
maxBank				= 0.2,
maxPitch			= 0.2,


sightDistance = 1000,

CanAttack = false,
CanGuard = true,
CanMove = true,
CanPatrol = true,
CanStop = true,
LeaveTracks = false, 
--building
Builder = true,
ShowNanoSpray = true,
CanBeAssisted = true,	
workerTime = 10000,
buildDistance = 2000,
terraformSpeed = 9001,
buildoptions = 
	{
	"tpflag",
	"tpbrickwall",
	},

Category = [[LAND]],


}

return lowerkeys({ [unitName] = unitDef })