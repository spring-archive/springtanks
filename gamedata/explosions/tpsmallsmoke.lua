--a smaller smoke cloud by knorke
return {
  ["tpsmallsmoke"] = {
    tpsmallsmoke = {
      air                = true,
      class              = [[CSimpleParticleSystem]],
      count              = 3,
      ground             = true,
      underwater         = 1,
      useairlos          = true,
      water              = true,
      alwaysVisible = 0,
	  properties = {
        alwaysVisible = 0,
        explosiongenerator = [[custom:tpsmallsmoke]],
	  airdrag            = 0.9,
        colormap           = [[0.3 0.3 0.3 0.9    0.6 0.5 0.5 0.6    0.8 0.7 0.7 0.3     0.8 0.8 0.8 0.1]],
        directional        = false,
        emitrot            = 90,
        emitrotspread      = 10,
        emitvector         = [[0, 1, 0]],
        gravity            = [[0, 0.1 r0.1, 0]],
        numparticles       = 1,
        particlelife       = 30,
        particlelifespread = 30,
        particlesize       = 5,
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
