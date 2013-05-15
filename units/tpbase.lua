unitDef = {
  unitname            = [[tpbase]],
  name                = [[Base]],
  description         = [[Bring enemy flags to your base to score]],
  iconType		    = "square",
  isCommander		  = true, --so crtl c centers view on base naja iwie nicht
  HideDamage 	    = 1,
  Autoheal		    = 1000,
  acceleration        = 0,
  bmcode              = [[1]],
  brakeRate           = 0,
  buildCostEnergy     = 0,
  buildCostMetal      = 300,
  builder             = false,
  buildPic            = [[tpthulsablue.png]],
  buildTime           = 20,
  canAttack           = true,
  canGuard            = true,
  canMove             = true,
  canPatrol           = true,
  canstop             = [[1]],
  category            = [[FLAG]],
  corpse              = [[DEAD]],
  reclaimable         = false,
  --HITBOX--
  --collisionVolumeTest       =  1,	
  --collisionVolumeOffsets    =  [[0 0 0]],
  --collisionVolumeType       =  [[box]],
  --collisionVolumeScales     =  [[55 65 55]],
  ----------
  defaultmissiontype  = [[Standby]],
--	  explodeAs           = [[MEDIUM_UNIT]],
  footprintx          = 3,
  footprintZ          = 3,
  idleAutoHeal        = 0,
  leaveTracks         = true,
  trackOffset         = 3,
  trackStrength       = 6,
  trackStretch        = 1,
  trackType           = [[StdTank]],
  trackWidth          = 50,
  maneuverleashlength = [[640]],
  mass                = 9999999,
  maxDamage           = 9999999,
  maxSlope            = 18,
  maxVelocity         = 0,
  maxWaterDepth       = 22,
  minCloakDistance    = 75,
  movementClass       = [[LightTANK]],
  moveState           = 0,
  noAutoFire          = false,
  noChaseCategory     = [[MINERALS FIXEDWING GUNSHIP SUB]],
  objectName          = [[tpbase.s3o]],
  seismicSignature    = 4,
  selfDestructAs      = [[SMALL_UNIT]],

		
  sfxtypes            = {

	explosiongenerators = {
	"custom:tpsmokecloud",
--		"custom:orc_machinegun_muzzle",
	},

  },

  sounds			= {
	  select = {
	"Argh_TankSound",
	},
	  ok = {
	"Argh_TankSound",
	},
  },

  side                = [[GAYS]],
  sightDistance       = 900,
  smoothAnim          = true,
  steeringmode        = [[1]],
  TEDClass            = [[TANK]],
  turninplace         = 1,
  turnRate            = 0,
  workerTime          = 0,
  script              = [[tpbase.lua]],
}

return lowerkeys({ tpbase = unitDef })
