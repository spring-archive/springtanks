-- UNITDEF -- wallb1 --
--------------------------------------------------------------------------------

local unitName = "wallb1"

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
  levelGround        = false,
  maxDamage          = 5,
  maxSlope           = 255,
  name               = [[wallb1]],
  objectName         = [[wallb1.s3o]],
  pushResistant      = 1,
  reclaimable        = false,
  script                 = [[wall.lua]],
  showNanoFrame      = false,
  sightDistance      = 0,
  unitname           = [[wallb1]],
  yardMap                       = [[ooo]],
}


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
