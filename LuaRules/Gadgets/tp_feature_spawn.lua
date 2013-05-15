function gadget:GetInfo()
  return {
    name      = "feature spawner",
    desc      = "spawn features on the map, as defined in a config file",
    author    = "knorke",
    date      = "May 2011",
    license   = "GNU GPL, v2 or later or horse",
    layer     = 0,
    enabled   = true,  --  loaded by default?
  }
end

if not gadgetHandler:IsSyncedCode() then
  return false -- no unsynced code
end

local GetGaiaTeamID  = Spring.GetGaiaTeamID ()
local mapconfig_fn = Game.mapName .. "_ST_features.lua"		--name of map config files
if (VFS.FileExists(mapconfig_fn)) then 
	Spring.Echo ("tp_feature_spawn.lua: found" .. mapconfig_fn .." in mod root folder or map")
	mapfeatures = VFS.Include(mapconfig_fn)
else
	if (VFS.FileExists("mapconfigs\\" .. mapconfig_fn)) then 
		Spring.Echo ("tp_feature_spawn.lua: found " .. mapconfig_fn .. " in mod mapconfigs folder")
		mapfeatures = VFS.Include("mapconfigs\\" .. mapconfig_fn)
	else
		Spring.Echo ("tp_feature_spawn.lua: found " .. mapconfig_fn .. " NOT FOUND AT ALL.")
	end
end



local function PutFeaturesOnMap ()
	if (mapfeatures == nil) then return end	
	Spring.Echo ("tp_feature_spawn.lua: ----PutFeaturesOnMap ()----")
	if (mapfeatures) then
		Spring.Echo ("#mapfeatures:" .. table.getn(mapfeatures))
		for i in pairs(mapfeatures) do			
			--Spring.Echo ("PutFeaturesOnMap:" .. i)
			--Spring.Echo ("PutFeaturesOnMap:" .. mapfeatures[i].x .. ":" .. mapfeatures[i].z)
			local y = Spring.GetGroundHeight (mapfeatures[i].x, mapfeatures[i].z)
			Spring.CreateFeature (mapfeatures[i].name,  mapfeatures[i].x, y, mapfeatures[i].z, mapfeatures[i].rot or math.random (0,32000), GetGaiaTeamID)			
		end
	end
end

--[[
--handle features with metal: remove or replace
function FeatureHandling ()
	local featurehandling = "replace" --
	if (gamesettings==nil) then return end
	if (gamesettings.featurehandling) then featurehandling = gamesettings.featurehandling end	
	if (featurehanding == "donothing") then return end
	local all_features = Spring.GetAllFeatures ()
	for i in pairs(all_features) do
		local RemainingMetal, maxMetal, RemainingEnergy, maxEnergy, reclaimLeft = Spring.GetFeatureResources(all_features[i])
		if (maxMetal) then
			if (maxMetal > 0) then
				local fx,fy,fz = Spring.GetFeaturePosition (all_features[i])
				if (featurehandling=="replace") then 
					SpawnResource (fx,fz) 
					Spring.DestroyFeature (all_features[i])
					Spring.Echo ("tp_feature_spawn.lua: feature replaced")
				end
				if (featurehandling=="remove") then 				
					Spring.DestroyFeature (all_features[i])
					Spring.Echo ("tp_feature_spawn.lua: feature removed")
				end
			end
		end
	end
end
--]]

function gadget:Initialize()
	Spring.Echo ("tp_feature_spawn.lua: Hey I am the resource spawn gadget")
--	PutFeaturesOnMap ()
	--FeatureHandling ()
	--Spring.Echo ("!!!!!!!! lolfactor=" .. gamesettings.lolfactor)
end

function gadget:GameFrame(frame)
if frame == 60 then PutFeaturesOnMap() end
--if (frame % 3200 ~=0) then return end
--Spring.Echo ("----resource spawner anfang testtext----")
--if (gamesettings == nil) then Spring.Echo ("was nil") end
--Spring.Echo ("!!!!!!!! lolfactor=" .. gamesettings.lolfactor)
--if (mapfeatures) then
--	for resID in pairs(mapfeatures) do
		--Spring.Echo ( "res #" .. resID .. " at " ..  mapfeatures[resID].x  .. ":"..mapfeatures[resID].y )
--	end
end