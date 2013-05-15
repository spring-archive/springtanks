--a shower of stars, as unicorns are known to create. by knorke
return {
  ["tpstars"] = {
    tpstars = {
      air                = true,
      class              = [[CSimpleParticleSystem]],
      count              = 1,
      ground             = true,
      underwater         = 1,
      useairlos          = true,
      water              = true,
      alwaysVisible = 1,
	  properties = {
        alwaysVisible = 1,
        explosiongenerator = [[custom:tpstars]],
	  airdrag            = 0.9,
        colormap           = [[1 1 0.95 0.9    0 0 0.9 0.6    1 0.0 0.1 0.95     0.3 1 0.3 0.1]],
        directional        = false,
        emitrot            = 90,
        emitrotspread      = 5,
        emitvector         = [[0, 1, 0]],
        gravity            = [[0, 0.8 r0.1, 0]],
        numparticles       = 6,
        particlelife       = 10,
        particlelifespread = 50,
        particlesize       = 8, --2 --4
        particlesizespread = 8,
        particlespeed      =  3.5,
        particlespeedspread = 9,
        pos                = [[0, 0, 0]],
        sizegrowth         = 1,
        sizemod            = 1.001,
        texture            = [[star]],
      },
    },
  },

}