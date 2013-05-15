local featureDef  =  {
   name           = "ftpbrickwall",
   blocking       = true,
   --HITBOX--
  footprintX                    = 1,
  footprintZ                    = 10,
  yardMap                       = [[oooooooooo]],
  collisionVolumeType           = [[box]],
  collisionVolumeOffsets        = [[0 0 0]],
  collisionVolumeScales         = [[20 190 180]],


   category       = "Normal",
   maxdamage            = 1,--any of those will work
   damage            = 1,--any of those will work
   maxhealth            = 1,--any of those will work
   mass				= 75,--only thulsa can crush
   description       = "Stonewall - can be knocked down by Thulsa tanks",
   energy            = 1,
--   featuredead       = "doesthistreeturnintoanotherfeaturewhenitdies?ifsonamethenewfeaturehere",  
   flammable         = 1,
   upright           = true,
   height            = 60,
   object            = "brickwall.s3o", -- << path to the feature
   reclaimable       = true,
   autoreclaimable      = true,  
   world          = "All Worlds",
   
    customparams = {
 	provide_cover=0,
	},
}
return lowerkeys({[featureDef.name] = featureDef})