prefab.weapon.hangar = {}
prefab.weapon_info.hangar = {}


function prefab.weapon_info.hangar.quartz(count)
	return { 1015600, 1 * count, 1011000 }
end
function prefab.weapon.hangar.quartz(pos, rot, sca, isGhost)
	prefab_part = {
		name	= "Quartz Hangar",
		mesh      = "Hangar/Hangar",
		materials = { "arc_hull_dark", "arc_teamGlow", "arc_teamColour", },
		position  = pos,    	-- float3: XYZ Relative local position of this object. Copy positions from Blender to help you out. NOTICE: Blender uses +Z as up, but this is converted to +Y (is up) when used in game.
		rotation  = rot,        			-- float3: XYZ Eular Angles, will apply rotation ZXY. Relative local rotation of this object.
		scale 	= sca,					-- float3: XYZ The nonuniform scale of the part, relative to it's parent's scale.
	}
	-- ghosts should NOT have weapons, as it causes a crash.
	if isGhost then
		prefab_part.materials = {"arc_build","arc_build","arc_build","arc_build",}
	else
		prefab_part.parts={
			{
				name      = "Hangar",
				position  = { 0, 0, -1.5 },    	-- float3: XYZ Relative local position of this object. Copy positions from Blender to help you out. NOTICE: Blender uses +Z as up, but this is converted to +Y (is up) when used in game.
				rotation  = { 0, 0, 0 },        			-- float3: XYZ Eular Angles, will apply rotation ZXY. Relative local rotation of this object.
				scale 	= { 1, 1, 1 },					-- float3: XYZ The nonuniform scale of the part, relative to it's parent's scale.

				weapon    = {
					weaponID = 1015600, --int: The weaponData id to be used for this weapon.
					turnSpeed = 0, 	--float: Degrees per second.
					turnMode = "Linear", --string enum: Linear / Acceleration
					turnInstant = false, --bool: Ignore turn speed, snap to target. (Beam Spire, point defence)
					mountAngles = { -- Weapon's firing angles in degrees. Won't aquire targets outside this field of view.
						left = 180, --float:
						right = 180,--float:
						up = 90,	 --float:
						down = 90  --float:
					},
				},
			},
		}
	end
	return prefab_part
end

function prefab.weapon_info.hangar.ruby_m(count)
	return { 1015601, 1 * count, 1011102 }
end
