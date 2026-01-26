
function prefab.part.emblem(pos, rot, sca, isGhost, ghostIndex)
	if(ghostIndex==nil) then ghostIndex=0 end
	if(ghostIndex > 5) then return {}; end
	if(not isGhost and ghostIndex > 0) then return {}; end
	prefab_part = {
		name = "Emblem",
		mesh = "Emblem/Emblem",
		materials = { "arc_hull", "arc_teamGlow", "arc_hull_dark", "arc_teamColour",  },
		rotation = rot,
		position = pos,
		scale = sca,}
	if isGhost then
		prefab_part.materials = {"arc_build"..ghostIndex,"arc_build"..ghostIndex,"arc_build"..ghostIndex,"arc_build"..ghostIndex,}
	end
    return prefab_part
end