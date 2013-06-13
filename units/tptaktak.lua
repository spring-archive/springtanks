	unitDef = {
	  unitname            = [[tptaktak]],
	  name                = [[Tak Tak]],
	  description         = [[Ratatata!]],
	  iconType		    = "circle",
	  acceleration        = 0.4, --0.1
	  maxVelocity         = 4.0, --3.3
	  bmcode              = [[1]],
	  brakeRate           = 0.05, --0.1
	  buildCostEnergy     = 0,
	  buildCostMetal      = 300,
	  builder             = false,
	  buildPic            = [[tptaktakblue.png]],
	  buildTime           = 20,
	  canAttack           = true,
	  canGuard            = true,
	  canMove             = true,
	  canPatrol           = true,
	  canstop             = [[1]],
	  category            = [[LAND]],	  
      reclaimable         = false,
	  --HITBOX--
	  --collisionVolumeTest       =  1,	
	  --collisionVolumeOffsets    =  [[0 0 0]],
	  --collisionVolumeType       =  [[box]],
	  --collisionVolumeScales     =  [[55 65 55]],
	  ----------
	    --TRANSPORT--
	  isTransport = true,
	  ReleaseHeld = true,		--transported units survive if transporter dies
	  HoldSteady = true,		--transported units tilt and turn like the transporter
	  TransportCapacity = 1,    --The number of units the transport can carry
	  transportSize = 10000,
	  TransportMass = 50,
	  isFirebase = true,
	  Firebase = true,
	  IsFirebase = true,
	  isfireplatform=1,
	  defaultmissiontype  = [[Standby]],
--	  explodeAs           = [[MEDIUM_UNIT]],
      footprintx          = 3,
	  footprintZ          = 3,
	  idleAutoHeal        = 0,
	  leaveTracks         = true,
	  trackOffset         = 3,  --3
	  trackStrength       = 6,
	  trackStretch        = 4,
	  trackType           = [[taktaktrack]],
	  trackWidth          = 48,
	  maneuverleashlength = [[640]],
	  mass                = 200,
	  maxDamage           = 400,
	  idleAutoHeal        = 0,
	  AutoHeal			  = 10, --every second(?)
      SlopeMod			  = 0,
	  maxSlope            = 30,
	  SlopeMod 			  = 0, --slowdown on slopes. 0=no slowdown
	  --maxReverseVelocity   = 3.3,  ---***************************backward driving	  
      maxWaterDepth       = 22,
	  minCloakDistance    = 75,
	  movementClass       = [[taktak]],
	  moveState           = 0,
	  noAutoFire          = false,
	  noChaseCategory     = [[FLAG MINERALS FIXEDWING GUNSHIP SUB]],
	  objectName          = [[tptaktak.s3o]],
	  seismicSignature    = 4,
--	  selfDestructAs      = [[SMALL_UNIT]],

	  	    
	  sfxtypes            = {
	
	    explosiongenerators = {
		"custom:tpsmallsmoke",
		"custom:tpmuzzleflash_small",
	    },
	
	  },

	  sounds			= {
	      select = {
		"yea",
		maxconcurrent = 1,
		},
	      --ok = {
		--"Argh_TankSound",
		--},
	  },

	  side                = [[GAYS]],
	  sightDistance       = 1000, --500
	  smoothAnim          = true,
	  steeringmode        = [[1]],
	  TEDClass            = [[TANK]],
	  turninplace         = 1,
	  turnRate            = 850,--550
	  workerTime          = 0,
      script              = [[tptaktak.lua]],
	  customParams = {
		needed_cover=1,
		},
	
	  weapons             = {
	
	    {
	      def                = [[Cannon]],
	      badTargetCategory  = [[FLAG SINK FLOAT MINERALS FLAG]],
	      onlyTargetCategory = [[LAND SINK SHIP SWIM FLOAT HOVER]],
	    },
	
	  },
	
	
	    weaponDefs          = {	
	    Cannon = {
	      name                    = [[Cannon]],
	      areaOfEffect            = 10,
	      craterMult              = 0.25,	
	      damage                  = {
		  Normal = 20,
	      },
	--CegTag				 = "tpsmallsmoke", --gar nicht

	      explosionGenerator      = [[custom:tpsparks]],
	      interceptedByShieldType = 1,
	      lineOfSight             = true,
	      range                   = 400, --300
	      reloadtime              = 0.3,
	      rgbColor                = [[1 0.95 0.4]],
	      separation              = 2,
          size                    = 4.00,
	      soundHit                = [[argh/Argh_LargeExplosion]],
	      soundStart              = [[Argh_heavy_machinegun.wav]],
	      --soundStartVolume        = 0.75,
	      soundTrigger            = true,
	      stages                  = 50,
	      --sprayAngle              = 1180,
	      tolerance               = 8000,
	      turret                  = true,
	      weaponType              = [[Cannon]],
	      weaponVelocity          = 1500,
		  --burst                   = 2,  --3
	      burstrate               = 0.08,
		  },	
	  },		
	}
	
	return lowerkeys({ tptaktak = unitDef })