local nano = 1


function script.Create()

end

function script.Killed()

end

--------BUILDING---------
function script.StopBuilding()
	SetUnitValue(COB.INBUILDSTANCE, 0)
end

function script.StartBuilding(heading, pitch)
	SetUnitValue(COB.INBUILDSTANCE, 1)
end

function script.QueryNanoPiece()
     return nano
end