-- UNITDEF -- walla1 --
--------------------------------------------------------------------------------

local unitName = "walla1"

--------------------------------------------------------------------------------

local unitDef = {
  category           = [[NOTARGET]],
  collide             = true,
  collisionvolumetest = 1,
  --collisionSphereScale   = 1,
  collisionVolumeOffsets = [[0 0 0]],
  collisionVolumeScales  = [[90 86 32]],
  collisionVolumeTest    = 1,
  collisionVolumeType    = [[box]],
   customParams        = {
		dontCount = "1",
			},
  description        = [[Wall]],
  footprintX         = 3,
  footprintZ         = 1,
  iconType           = [[base]],
  levelGround        = false,
  maxDamage          = 5,
  maxSlope           = 255,
  name               = [[Walla1]],
  objectName         = [[walla1.s3o]],
  pushResistant      = 1,
  reclaimable        = false,
  script                 = [[wall.lua]],
  showNanoFrame      = false,
  sightDistance      = 0,
  unitname           = [[walla1]],
  yardMap                       = [[ooo]],
}


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
