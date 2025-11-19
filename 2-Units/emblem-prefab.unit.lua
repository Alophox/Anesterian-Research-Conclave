
function prefab.part.emblem(pos, rot, sca, isGhost)
	prefab_part = {
		name = "Emblem",
		mesh = "Emblem/Emblem",
		materials = { "arc_hull", "arc_teamGlow", "arc_hull_dark", "arc_teamColour",  },
		rotation = rot,
		position = pos,
		scale = sca,}
	if isGhost then
		prefab_part.materials = {"arc_build","arc_build","arc_build","arc_build",}
	end
    return prefab_part
end