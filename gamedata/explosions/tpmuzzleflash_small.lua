--a muzzle flash flame thing by knorke
--based on orc_machinegun_muzzle by Argh

return {
	["tpmuzzleflash_small"] = {
		bitmapmuzzleflame = {
			ground             = true,
			air                = true,
			water              = true,
			class              = [[CBitmapMuzzleFlame]],
			count              = 1,
			underwater         = 1,
			properties = {
				colormap           = [[1 1 1 0.01	    1 0.8 0 0.01     0.5 0.3 0.01]], --Colour map progress from one to next. Colors in RGBA
				dir                = [[dir]],
				frontoffset        = 0,
				fronttexture       = [[tpmuzzleflash_front]],
				length             = 11,
				sidetexture        = [[tpmuzzleflash_side]],
				size               = 1.5,
				sizegrowth         = 1,
				ttl                = 3,
			},
		},
	},
}
