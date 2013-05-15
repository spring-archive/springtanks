local unitName = "tpbutterfly"

unitDef = {
name                = "Butterfly",
description         = "now look at that fucker go",
objectName          = [[butterfly.s3o]],
script              = [[tpbutterfly.lua]],

bmcode              = [[1]],

builder             = false,
buildPic            = [[placeholder.png]],
buildTime           = 10,
----cost
buildCostEnergy     = 0,
buildCostMetal      = 1,
----health
maxDamage           = 500,
idleAutoHeal        = 0,
----movement
maxVelocity         = 4,
acceleration        = 0.2,
brakeRate           = 3.75,
moverate1           = [[3]],
footprintx          = 3,
footprintZ          = 3,
Upright 			= false,
maneuverleashlength = 1280,
collide             = false,
collision 			= false,
steeringmode        = [[1]],
TEDClass            = [[VTOL]],
turnRate            = 1000,
turnRadius		  	= 5,
----aircraft related
canFly              = true,
cruiseAlt           = 200,
hoverAttack         = true,
airStrafe			= false,
bankscale           = 1,
maxBank				= 0.2,
maxPitch			= 0.2,

sightDistance       = 0,
canGuard            = true,
canMove             = true,
canPatrol           = true,
canstop             = [[1]],
category            = [[NOBODYCARES]],
mass                = 125,
}

return lowerkeys({ [unitName] = unitDef })
