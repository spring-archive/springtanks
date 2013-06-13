unitDef = {
  unitname            = [[tplegocar]],
  name                = [[Blitz]],
  description         = [[Vromm Vromm!]],
  iconType		    = "circlepie",
  acceleration        = 0.8,  --1.5
  maxVelocity         = 5.5, --6
  bmcode              = [[1]],
  brakeRate           = 0.05, --0.2
  buildCostEnergy     = 0,
  buildCostMetal      = 100,
  builder             = false,
  buildPic            = [[tplegocarblue.png]],
  buildTime           = 12,
  canAttack           = true,
  canGuard            = true,
  canMove             = true,
  canPatrol           = true,
  canstop             = [[1]],
  category            = [[LAND]],
  reclaimable         = false,
  --HITBOX--
--	  collisionVolumeTest       =  1,	
--	  collisionVolumeOffsets    =  [[0 0 0]],  --positiv = nach oben
--	  collisionVolumeType       =  [[box]],	  
--	  ollisionVolumeScales     =  [[40 25 55]],  
  ----------
  --TRANSPORT--
  isTransport = true,
  ReleaseHeld = true,		--transported units survive if transporter dies
  HoldSteady = 1,		--transported units tilt and turn like the transporter
  TransportCapacity = 1,    --The number of units the transport can carry
  transportSize = 10000,
  TransportMass = 50,
  transportUnloadMethod = 2,
  canload             = [[1]],
  isFirebase = true,
  Firebase = true,
  IsFirebase = true,
  isfireplatform=1,
  -------------
  defaultmissiontype  = [[Standby]],
--  explodeAs           = [[MEDIUM_UNIT]],
  footprintX          = 3,
  footprintZ          = 3,
  leaveTracks         = true,
  maneuverleashlength = [[640]],
  mass                = 110,
  maxDamage           = 150, --100
  idleAutoHeal        = 0,
  AutoHeal			  = 10, --every second(?)
  maxSlope            = 18,  
  SlopeMod 			  = 1, --slowdown on slopes. 0=no slowdown
  maxWaterDepth       = 22,
  minCloakDistance    = 75,
  movementClass       = [[car]],
  moveState           = 0,
  noAutoFire          = false,
  noChaseCategory     = [[FLAG MINERALS LAND SINK HOVER SHIP FLOAT SUB]],
  objectName          = [[legocar.s3o]],  -- [[legocar.s3o]],
  seismicSignature    = 4,
  --selfDestructAs      = [[MEDIUM_UNIT]],

  sounds			= {
	  select = {
	"Argh_TankSound",
	},
	  --ok = {
	--"loslos",
	--},
  },

--  sfxtypes            = {

--	explosiongenerators = {
--	"custom:orc_machinegun_flash",
--	"custom:orc_machinegun_muzzle",
--	},

--  },

  side                = [[GAYS]],
  sightDistance       = 1200,--700
  smoothAnim          = true,
  steeringmode        = [[1]],
  TEDClass            = [[TANK]],
  trackOffset         = 3,
  trackStrength       = 6,
  trackStretch        = 1,
  trackType           = [[StdTank]],
  trackWidth          = 33,
  turninplace         = 0,
  turnRate            = 1200, --500 --1000
  turnInPlaceSpeedLimit = 6, --gabs nicht
  workerTime          = 0,
  script              = [[tplegocar.lua]],
  customParams = {
		needed_cover=1,
		},

  weapons             = {

	{
	  def                = [[Gatling]],
	  onlyTargetCategory = [[LAND SINK SHIP SWIM FLOAT HOVER]],
	  badTargetCategory  = [[FLAG SINK FLOAT MINERALS]],

	},

  },


  	  weaponDefs          = {
	
	    Gatling = {
	      name                    = [[Gatling]],
	      areaOfEffect            = 8,
	      craterMult              = 0.25,
	
	    damage                  = {
		Normal = 15,
	      },
	
--	      explosionGenerator      = [[custom:FLAK_BURST_Expl]],
	      interceptedByShieldType = 1,
	      lineOfSight             = true,
	      range                   = 350,
	      reloadtime              = 0.4,
	      rgbColor                = [[1 0.95 0.4]],
	      separation              = 2,
          size                    = 1.25,
	      soundStart              = [[Argh_heavy_machinegun]],
	      soundStartVolume        = 0.8,
	      soundTrigger            = true,
	      stages                  = 50,
	      sprayAngle              = 300, --1180
	      tolerance               = 8000,
	      turret                  = true,
	      weaponType              = [[Cannon]],
	      weaponVelocity          = 750,
	    },
	
	  }, 

}

return lowerkeys({ tplegocar = unitDef })