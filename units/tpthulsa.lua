	unitDef = {
	  unitname            = [[tpthulsa]],
	  name                = [[Thulsa]],
	  description         = [[Ka-Boom!]],
	  iconType		    = "circlecross",
	  acceleration        = 0.3, --0.1
	  maxVelocity         = 3.5,
	  bmcode              = [[1]],
	  brakeRate           = 0.05, --0.4
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
	  category            = [[LAND]],
	  corpse              = [[DEAD]],
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
      footprintx          = 4,
	  footprintZ          = 4,
	  idleAutoHeal        = 0,
	  leaveTracks         = true,
	  trackOffset         = 0, --3
	  trackStrength       = 6,
	  trackStretch        = 4, --2
	  trackType           = [[thulsatrack]], -- StdTank
	  trackWidth          = 55, --50
	  maneuverleashlength = [[640]],
	  mass                = 300,
	  maxDamage           = 1000,
	  idleAutoHeal        = 0,
	  AutoHeal			  = 10, --every second(?)
      maxSlope            = 18,
	  SlopeMod 			  = 0, --slowdown on slopes. 0=no slowdown
      maxWaterDepth       = 22,
	  minCloakDistance    = 400,
	  
	  movementClass       = [[thulsa]],
	  moveState           = 0,
	  noAutoFire          = false,
	  noChaseCategory     = [[FLAG MINERALS FIXEDWING GUNSHIP SUB]],
	  objectName          = [[tpthulsa.s3o]],
	  seismicSignature    = 4,
	  selfDestructAs      = [[SMALL_UNIT]],

	  	    
	  sfxtypes            = {
	
	    explosiongenerators = {
		"custom:tpsmokecloud",
--		"custom:orc_machinegun_muzzle",
	    },
	
	  },
	  
	--pieceTrailCEGTag = "tpsmoketrail",
	--pieceTrailCEGRange = 0,


	  sounds			= {
	      select = {
		"yea",
		},
	      --ok = {
		--"Argh_TankSound",
		--},
	  },

	  side                = [[GAYS]],
	  sightDistance       = 1000,
	  smoothAnim          = true,
	  steeringmode        = [[1]],
	  TEDClass            = [[TANK]],
	  turninplace         = 1,
	  turnRate            = 350,
	  workerTime          = 0,
      script              = [[tpthulsa.lua]],
	  customParams = {
		needed_cover=1,
		},
	
	  weapons             = {
	
	    [1]={
	      def                = [[Cannon]],
	      badTargetCategory  = [[FLAG FLOAT MINERALS]],
	      onlyTargetCategory = [[LAND SHIP SWIM FLOAT HOVER]],		  
	    },
		[2]={
	      def                = [[targetlaser]],
	      badTargetCategory  = [[FLAG FLOAT MINERALS]],
	      onlyTargetCategory = [[LAND SHIP SWIM FLOAT HOVER]],		  
	    },
	
	  },
	
	
	  weaponDefs          = {
	
	    Cannon = {--KANONE
	      name                    = [[Cannon]],
	      areaOfEffect            = 100,--200 --50:machte quasi gar keinen splashdamage
	      burst                   = 1,
	      burstrate               = 0.08,
	      craterMult              = 0.25,
	      accuracy                = 100,
		  firestarter			  =1000,
	      damage                  = {
		Normal = 200,--300
	      },
		  CegTag				 = "tpmisslesmoke",
	      model                   = [[projmissle.s3o]], -- [[bantimechmissile.s3o]],
	      dance                   = 0,
	      wobble                  = 0,
	      explosionGenerator      = [[custom:tpexplosive]],
	      flightTime              = 4,
	      interceptedByShieldType = 1,
	      lineOfSight             = true,
	      range                   = 600, --450
	      reloadtime              = 2,
	      smokeTrail              = false,
	      soundHit                = [[argh/Argh_LargeExplosion]],
	      soundStart              = [[kanoba/Canlite3Remake.ogg]],
	      tolerance               = 8000,
	      tracks                  = false,
	      turret                  = true,
	      weaponType              = [[MissileLauncher]],
	      weaponVelocity          = 1000, --1500
	      startVelocity           = 1000, 
	      weaponAcceleration      = 0,
	    },------
		
	targetlaser = {
		name                    = [[Targeting Laser]],
		areaOfEffect            = 8,
		avoidFriendly           = false,
		beamTime                = 0.2,
		craterMult              = 0.25,
		accuracy                = 0,
		collideFriendly         = true,
		energypershot           = 0,
		damage                  = {
			default = 0,
			normal = 0,
		},
		--	explosionGenerator      = [[custom:resmining]],	
		lineOfSight             = true,
		range                   = 1000,
		reloadtime              = 0.2,
		rgbColor                = [[0 1 0]],
		separation              = 2,
		thickness               = 1,
		minIntensity            = 1,
		size                    = 0.4,
		--soundStart              = [[tp/swoosh]],
		--soundStartVolume        = 0.5,
		--soundTrigger            = true,
		stages                  = 50,
		targetBorder            = 0,
		tolerance               = 8000,
		turret                  = true,
		weaponType              = [[BeamLaser]],
		weaponVelocity          = 2500,
		},
			
	
	  },
		
	}
	
	return lowerkeys({ tpthulsa = unitDef })
