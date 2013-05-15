for name, fd in pairs(FeatureDefs) do
	if (not fd.customParams) then fd.customParams = {} end
	
	--bushes are non-blocking and provide 5 cover by default
	if (string.find(name, "bush")) then
		fd.blocking = false
		if (not fd.customParams.provide_cover) then
			fd.customParams.provide_cover = 5
			fd.description = (fd.description or "") .. " - provides cover!"			
		end
	else--everything non-bush	
		--vegetation provides can easily be run over
		if (fd.category) then
			if (string.lower(fd["category"]) == "vegitation" or string.lower(fd["category"]) == "vegetation" and not string.find(name, "baobab_xxl")) then 
				fd["blocking"] = true
				fd.mass = 1
				fd.description = (fd.description or "") .. " - crushable!"
				--if (not fd.customParams) then fd.customParams = {} end
				--if (not fd.customParams.provide_cover) then
					--fd.customParams.provide_cover = 1
					--fd.description = (fd.description or "") .. " - provides cover!"
				--end			
			end
		end
		
		--unless set otherwise, everything explodes when crushed
		if (not fd.customParams.explode) then
			fd.customParams.explode = 1
		end	
			
		
		--the palms & palm stumps on "aquatic divide" map explode when crushed
		--palmetto: diese flachen seerosen teile  cluster: die palmen, cluster_dead die palmen stumpen
		if (string.find(name, "palmetto") or string.find(name, "cluster")) then
			fd.blocking = true
			fd.mass = 1
			fd.description = (fd.description or "") .. " - crushable!"
		end
	end
end