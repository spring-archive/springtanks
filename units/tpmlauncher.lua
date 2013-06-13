unitDef = {
  unitname            = [[tpmlauncher]],
  name                = [[Rocket Launcher]],
  description         = [[Pick up the Rocket Launcher and fire 3 powerfull rockets!]],
  iconType		    = "flag",
  HideDamage	    = 1,
  Autoheal		    = 1000,
  acceleration        = 0,
  bmcode              = [[1]],
  brakeRate           = 0,
  buildCostEnergy     = 0,
  buildCostMetal      = 300,
  builder             = false,
  buildPic            = [[tpmlauncher.png]],
  buildTime           = 20,
  canAttack           = true,
  canGuard            = true,
  canMove             = true,
  canPatrol           = true,
  canstop             = [[1]],
  category            = [[FLAG]],  
  reclaimable         = false,
  --HITBOX--
  --collisionVolumeTest       =  1,	
  --collisionVolumeOffsets    =  [[0 0 0]],
  --collisionVolumeType       =  [[box]],
  --collisionVolumeScales     =  [[55 65 55]],
  ----------
  defaultmissiontype  = [[Standby]],
--	  explodeAs           = [[MEDIUM_UNIT]],
  footprintx          = 1,
  footprintZ          = 1,
  idleAutoHeal        = 0,
  leaveTracks         = true,
  trackOffset         = 3,
  trackStrength       = 6,
  trackStretch        = 1,
  trackType           = [[StdTank]],
  trackWidth          = 50,
  maneuverleashlength = [[640]],
  mass                = 5,
  maxDamage           = 9999999,
  maxSlope            = 18,
  maxVelocity         = 0,
  maxWaterDepth       = 22,
  minCloakDistance    = 75,
  movementClass       = [[LightTANK]],
  moveState           = 0,
  noAutoFire          = false,
  noChaseCategory     = [[MINERALS FIXEDWING GUNSHIP SUB]],
  objectName          = [[tpmlauncher.s3o]],
  seismicSignature    = 4,
  selfDestructAs      = [[SMALL_UNIT]],
  cantBeTransported = false,

		
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
  script              = [[tpmlauncher.lua]],
  
  	  weapons             = {
	
	    {
	      def                = [[Cannon]],
	      badTargetCategory  = [[SINK FLOAT MINERALS]],
	      onlyTargetCategory = [[LAND SINK SHIP SWIM FLOAT HOVER]],
	    },
	
	  },
	
	
	  weaponDefs          = {
	
	    Cannon = {
	      name                    = [[Cannon]],
	      areaOfEffect            = 200,
	      burst                   = 1,
	      burstrate               = 0.08,
	      craterMult              = 0.25,
	      accuracy                = 100,
	
	      damage                  = {
			Normal = 600, --600
	      },
		  CegTag				 = "tpmisslesmoke2",
	      model                   = [[tpmissileproj.s3o]], -- [[bantimechmissile.s3o]],
	      --dance                   = 200,
	      wobble                  = 200,
	      explosionGenerator      = [[custom:tpcannonimpact]],
	      flightTime              = 4,
	      interceptedByShieldType = 1,
	      lineOfSight             = true,
	      range                   = 800,
	      reloadtime              = 1, --1
	      smokeTrail              = false,
	      soundHit                = [[argh/Argh_LargeExplosion]],
	      soundStart              = [[kanoba/Torpedo1Remake.ogg]],
	      tolerance               = 8000,
	      tracks                  = true,
	      Turnrate				  = 16000, --16000 26000
		  FixedLauncher			  = true,
		  TrajectoryHeight		  = 1, --2
		  turret                  = true,
	      weaponType              = [[MissileLauncher]],
	      weaponVelocity          = 500,--300
	      startVelocity           = 500,
	      weaponAcceleration      = 10,
	    },
	
	  },
  
  
}

return lowerkeys({ tpmlauncher = unitDef })