--rocket trail by knorke
return {
  ["tpmisslesmoke"] = {
    tpmisslesmoke = {
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
        explosiongenerator = [[custom:tpmisslesmoke]],
	  airdrag            = 0.9,
        colormap           = [[0.4 0.4 0.4 0.9    0.6 0.5 0.3 0.6    0.5 0.4 0.4 0.5     0.3 0.3 0.3 0.2]],
        directional        = false,
        emitrot            = 90,
        emitrotspread      = 5,
        emitvector         = [[0, 1, 0]],
        gravity            = [[0, 0.1 r0.1, 0]],
        numparticles       = 3, --1
        particlelife       = 10,
        particlelifespread = 20, --5
        particlesize       = 2,
        particlesizespread = 1,
        particlespeed      =  1.5,
        particlespeedspread = 2.5,
        pos                = [[0, 0, 0]],
        sizegrowth         = 2,
        sizemod            = 1.0,
        texture            = [[dirt]],
      },
    },
  },

}