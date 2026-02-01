
function prefab.part.emblem(pos, rot, sca, isGhost, ghostIndex, ghostMat)
	if(ghostIndex==nil) then ghostIndex=0 end
	if(ghostMat==nil) then ghostMat="arc_build" end
	if(ghostIndex < 0) then return {}; end
	if(not isGhost and ghostIndex < 0) then return {}; end
	prefab_part = {
		name = "Emblem",
		mesh = "Emblem/Emblem",
		materials = { "arc_hull", "arc_teamGlow", "arc_hull_dark", "arc_teamColour",  },
		rotation = rot,
		position = pos,
		scale = sca,}
	if isGhost then
		if (ghostMat == "arc_aegis") then
			prefab_part.aegisVisual = true;
		end
		prefab_part.materials = {ghostIndex.."_"..ghostMat,ghostIndex.."_"..ghostMat,ghostIndex.."_"..ghostMat,ghostIndex.."_"..ghostMat,}
	end
    return prefab_part
end