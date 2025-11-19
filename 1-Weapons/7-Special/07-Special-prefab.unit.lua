prefab.weapon.special = {}
prefab.weapon_info.special = {}


function prefab.weapon_info.special.spawn_shield(count)
-- ...don't want stats for this showing
end
function prefab.weapon.special.spawn_shield(pos,rot,sca,isGhost) --{float3}, {float3}, {float3}, bool
	prefab_part = {
		name	= "Spawn Shield",
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
				name      = "Turret",	position  = { 0,0, 0 },	rotation  = { 0, 0, 0 },	scale 	= { 1, 1, 1 },
				weapon    = {
					weaponID = 1015701, --int: The weaponData id to be used for this weapon.
					turnSpeed = 0, 	--float: Degrees per second.
					turnMode = "Linear", --string enum: Linear / Acceleration
					turnInstant = true, --bool: Ignore turn speed, snap to target. (Beam Spire, point defence)
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