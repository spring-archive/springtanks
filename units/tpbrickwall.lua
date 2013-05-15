unitDef = {

  unitname                      = [[tpbrickwall]],
  name                          = [[Brick Wall]],
  description                   = [[its big and made of stones]],
  --isfeature						= true,
  acceleration                  = 0,
  activateWhenBuilt             = true,
  bmcode                        = [[0]],
  brakeRate                     = 0,
  buildCostEnergy               = 1,
  buildCostMetal                = 1,
  builder                       = false,
  iconType           		= "resource",
  buildPic                      = [[tree.png]],
  buildTime                     = 1,
  canattack                     = [[false]],
  category                      = [[MINERALS]],

  collisionVolumeType           = [[box]],
  collisionVolumeOffsets        = [[0 0 0]],
  collisionVolumeScales         = [[20 190 180]],

  reclaimable                   = false,
  repairable			= false,
  energyUse                     = 0,
  explodeAs                     = [[ROCK_MINEDOUT]],
  extractsMetal                 = 0.000,
  floater                       = false,
  footprintX                    = 1,
  footprintZ                    = 10,
  yardMap                       = [[oooooooooo]],
  idleAutoHeal                  = 0,
  levelGround                   = false,
  mass                          = 37.5,
  maxDamage                     = 400,
  hidedamage					= 0,
  maxSlope                      = 255,
  maxVelocity                   = 0,
  maxWaterDepth                 = 0,
  minCloakDistance              = 150,
  decloakDistance			  = 0,
  noAutoFire                    = false,
  objectName                    = [[brickwall.s3o]],  -- [[bmeteor_impact.s3o]],
  onoffable                     = true,
  seismicSignature              = 4,
  selfDestructAs                = [[ROCK_MINEDOUT]],
  side                          = [[GAYS]],
  sightDistance                 = 0,

	  sfxtypes            = {	
	    explosiongenerators = {
		"custom:tpsmokecloud",
	    },
	
	  },

	pieceTrailCEGTag = "tpsmoketrail",
	pieceTrailCEGRange = 0,



  smoothAnim                    = true,
  TEDClass                      = [[METAL]],
  turnRate                      = 0,
  waterline                     = 1,
  workerTime                    = 0,  
  script                        = [[tpbrickwall.lua]],

}
return lowerkeys({ tpbrickwall = unitDef })