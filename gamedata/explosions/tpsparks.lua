--flying sparks
return {
  ["tpsparks"] = {
    tpunithit = {
      air                = true,
      class              = [[CSimpleParticleSystem]],
      count              = 1,      
	  ground             = false,
      unit				 = true,
	  underwater         = 1,
      useairlos          = true,
      water              = true,
      alwaysVisible = 0,
	  properties = {
	  explosiongenerator = [[custom:tpsparks]],
		sizegrowth=0,
		sizemod=1,
		pos=[[0, 1.0, 0]],
		emitVector=[[0, 1.0, 0]],
		gravity=[[0, -0.5, 0]],
		Texture="line_h",
		colorMap=[[1 1 0 0.9   0.8 .8 0.1 0.2   0 0 0 0]],
		airdrag=0.99,
		particleLife=10,
		particleLifeSpread=10,
		numParticles=10,
		particleSpeed=5,
		particleSpeedSpread=10,
		particleSize=5,
		particleSizeSpread=1,
		emitRot=0,
		emitRotSpread=80,
		directional=1,		
      },
    },
	
	tpgroundhit = {
      air                = true,
      class              = [[CSimpleParticleSystem]],
      count              = 1,      
	  ground             = true,
      unit				 = false,
	  underwater         = 1,
      useairlos          = true,
      water              = true,
      alwaysVisible = 0,
	  properties = {
	  explosiongenerator = [[custom:tpsparks]],
		sizegrowth=0,
		sizemod=1,
		pos=[[0, 1.0, 0]],
		emitVector=[[0, 1.0, 0]],
		gravity=[[0, -0.5, 0]],
		Texture="dirt",
		colorMap=[[0.8 0.8 0 1   0.4 0.2 0 1   0 0 0 1]],
		airdrag=0.98,
		particleLife=10,
		particleLifeSpread=10,
		numParticles=4,
		particleSpeed=6,
		particleSpeedSpread=3,
		particleSize=5,
		particleSizeSpread=1,
		emitRot=0,
		emitRotSpread=30,
		directional=1,		
      },
    },
  },

}





