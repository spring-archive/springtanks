-- UNITDEF -- walld1 --
--------------------------------------------------------------------------------

local unitName = "walld1"

--------------------------------------------------------------------------------

local unitDef = {
  category           = [[NOTARGET]],
  collide             = true,
  collisionvolumetest = 1,
  --collisionSphereScale   = 1,
  collisionVolumeOffsets = [[0 0 0]],
  collisionVolumeScales  = [[45 42 16]],
  collisionVolumeTest    = 1,
  collisionVolumeType    = [[box]],
   customParams        = {
		dontCount = "1",
			},
  description        = [[Wall]],
  footprintX         = 3,
  footprintZ         = 1,
  iconType           = [[base]],
  levelGround        = true,
  maxDamage          = 990000,
  maxSlope           = 255,
  name               = [[walld1]],
  objectName         = [[walld1.s3o]],
  pushResistant      = 1,
  reclaimable        = false,
  script                 = [[wall.lua]],
  showNanoFrame      = false,
  sightDistance      = 0,
  unitname           = [[walld1]],
  yardMap                       = [[ooo]],
}


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
