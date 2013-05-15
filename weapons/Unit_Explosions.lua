--------------------------------------------------------------------------------

unitDeaths = {
MEDIUM_UNIT = {

   name="Medium Unit",
   rendertype=4,
   ballistic=1,
   turret=1,
   impulseFactor      = 0,
   range=480,
   reloadtime=3.6,
   weaponvelocity=250,
   areaofeffect=95,
--   soundstart="golgotha/old_generic.wav",
--   soundhit="golgotha/old_generic.wav",
   explosiongenerator="custom:SMALL_UNIT_Expl",
	      damage                  = {
		Normal = 0,
	      },
  },

  
BIGSELFD = {

   name="BIGSELFD",
   rendertype=4,
   ballistic=1,
   turret=1,
   impulseFactor      = 10,
   range=480,
   reloadtime=3.6,
   weaponvelocity=600,
   areaofeffect=400,
--   soundstart="golgotha/old_generic.wav",
--   soundhit="golgotha/old_generic.wav",
   explosiongenerator="custom:tpbigshatter",
	      damage                  = {
		Normal = 1000,
	      },
  },

}

return lowerkeys(unitDeaths)
