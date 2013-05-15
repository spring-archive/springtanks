--rocket trail by knorke
--version 2, with colors
return {
  ["tpmisslesmoke2"] = {
    tpmisslesmoke2 = {
      air                = true,
      class              = [[CSimpleParticleSystem]],
      count              = 1,
      ground             = true,
      underwater         = 1,
      useairlos          = true,
      water              = true,
      alwaysVisible = 0,
	  properties = {
        alwaysVisible = 0,
        explosiongenerator = [[custom:tpmisslesmoke2]],
	  airdrag            = 0.9,
        colormap           = [[1.0 0.1 0.1 0.9    0.8 0.8 0.8 0.8    0.5 0.4 0.1 0.5     0.1 0.1 0.1 0.6]],
        directional        = false,
        emitrot            = 90,
        emitrotspread      = 0.5,
        emitvector         = [[0, 1, 0]],
        gravity            = [[0, 0.1 r0.1, 0]],
        numparticles       = 9,
        particlelife       = 7,
        particlelifespread = 5,
        particlesize       = 2,
        particlesizespread = 1,
        particlespeed      =  3.5,
        particlespeedspread = 2.5,
        pos                = [[0, 0, 0]],
        sizegrowth         = 1.5,
        sizemod            = 0.9,
        texture            = [[dirt]],
      },
    },
  },

}