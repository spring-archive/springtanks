---geschoss impact für kannonen by knorke
return {
  ["tpcannonimpact"] = {
    tpcannonimpact = {
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
        explosiongenerator = [[custom:tpcannonimpact]],
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
  ["groundflash"] = {
    
	alwaysVisible=0,
      flashSize = 100,
      flashAlpha = 0.95,
      circleGrowth = 1.1,
      circleAlpha = 0.3,
      ttl = 6,
      color = [[0.8 0.7 0.4]],
      alwaysvisible=0,
	  air=1,
      ground=1,
      water=1,
   },
  
  
  },

}
