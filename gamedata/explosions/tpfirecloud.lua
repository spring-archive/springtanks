--a smoke cloud by knorke
--basically the dollar cloud from CT
--ist eher eine rauchwolke
return {
  ["tpsmokecloud"] = {
    tpsmokecloud = {
      air                = true,
      class              = [[CSimpleParticleSystem]],
      count              = 6,
      ground             = true,
      underwater         = 1,
      useairlos          = true,
      water              = true,
      alwaysVisible = 0,
	  properties = {
        alwaysVisible = 0,
        explosiongenerator = [[custom:tpsmokecloud]],
	  airdrag            = 0.9,
        colormap           = [[0.3 0.3 0.3 0.9    0.6 0.5 0.5 0.6    0.8 0.7 0.7 0.3     0.8 0.8 0.8 0.1]],
        directional        = false,
        emitrot            = 90,
        emitrotspread      = 10,
        emitvector         = [[0, 1, 0]],
        gravity            = [[0, 0.1 r0.1, 0]],
        numparticles       = 1,
        particlelife       = 50,
        particlelifespread = 10,
        particlesize       = 10,
        particlesizespread = 10,
        particlespeed      =  1.5,
        particlespeedspread = 2.5,
        pos                = [[0, 0, 0]],
        sizegrowth         = 0,
        sizemod            = 1.0,
        texture            = [[dirt]],
      },
    },
  },

}
