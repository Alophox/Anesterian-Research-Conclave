prefab.weapon.railgun = {}
prefab.weapon_info.railgun = {}

function prefab.weapon_info.railgun.S(count)
	return { 1015501, 1 * count, 1016501 }
end
function prefab.weapon.railgun.S(pos, rot, sca, isGhost)
	prefab_part = {
		name	= "Small Disruptor Base",
		mesh      = "Turrets-1/Turret-1-Base",
		materials = { "arc_hull",  "arc_teamColour", "arc_teamGlow", "arc_hull_dark" },
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
				name      = "Turret-top",
				position  = { 0, .75, 0 },    	-- float3: XYZ Relative local position of this object. Copy positions from Blender to help you out. NOTICE: Blender uses +Z as up, but this is converted to +Y (is up) when used in game.
				rotation  = { 0, 0, 0 },        			-- float3: XYZ Eular Angles, will apply rotation ZXY. Relative local rotation of this object.
				scale 	= { 1, 1, 1 },					-- float3: XYZ The nonuniform scale of the part, relative to it's parent's scale.

				weapon    = {
					weaponID = 1015501, --int: The weaponData id to be used for this weapon.
					turnSpeed = weaponStats.baseTracking*weaponStats.railgun.trackingMult.S, 	--float: Degrees per second.
					turnMode = "Linear", --string enum: Linear / Acceleration
					turnInstant = false, --bool: Ignore turn speed, snap to target. (Beam Spire, point defence)
					mountAngles = { -- Weapon's firing angles in degrees. Won't aquire targets outside this field of view.
						left = 180, --float:
						right = 180,--float:
						up = 180,	 --float:
						down = 20  --float:
					},
				},

				parts = {
					{
						name		 = "Turret Body",
						mesh       = "Turrets-1/Turret-1-Body",
						materials  = { "arc_hull" },
						position   = { 0, -.25, 0},
						rotation   = { 0, 0, 0 },
						scale 	 = { 1, 1, 1 },
						turretBody = true, --Assigns this part as a body to the parent turret. Will rotate on a flat plan while the turret moves, giving the illusion of a 2-axis machine.
					},
					{
						name      = "Turret Barrel",
						mesh      = "Turrets-1/Turret-1-Railgun", --The mesh to be used for this part, works the same as mainMesh.
						materials = { "arc_hull", "arc_hull_dark", "arc_teamGlow" },
						position  = { 0, 0, 0 },
						rotation  = { 0, 0, 0 },
						scale 	= { 1, 1, 1 },
					},
					{
						name      = "Turret Muzzle",
						position  = { 0, 0, .1 },
						rotation  = { 0, 0, 0 },
						scale 	= { 1, 1, 1 },
						barrel    = true, --Assigns this part as a barrel to the parent's weapon. Barrels are where lasers, units, and weaponVisuals are placed or fired from.
					},			

				},
			},
		}
	end
	return prefab_part
end

function prefab.weapon_info.railgun.M(count)
	return { 1015502, 1 * count, 1016502 }
end
function prefab.weapon.railgun.M(pos, rot, sca, isGhost)
	prefab_part = {
		name	= "Medium Railgun Base",
		mesh      = "Turrets-3/Turret-3-Base",
		materials = { "arc_hull", "arc_teamGlow", "arc_hull_dark", "arc_teamColour", },
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
				name      = "Turret-top",
				position  = { 0, .875, 0 },    	-- float3: XYZ Relative local position of this object. Copy positions from Blender to help you out. NOTICE: Blender uses +Z as up, but this is converted to +Y (is up) when used in game.
				rotation  = { 0, 0, 0 },        			-- float3: XYZ Eular Angles, will apply rotation ZXY. Relative local rotation of this object.
				scale 	= { 1, 1, 1 },					-- float3: XYZ The nonuniform scale of the part, relative to it's parent's scale.

				weapon    = {
					weaponID = 1015502, --int: The weaponData id to be used for this weapon.
					turnSpeed = weaponStats.baseTracking*weaponStats.railgun.trackingMult.M, 	--float: Degrees per second.
					turnMode = "Linear", --string enum: Linear / Acceleration
					turnInstant = false, --bool: Ignore turn speed, snap to target. (Beam Spire, point defence)
					mountAngles = { -- Weapon's firing angles in degrees. Won't aquire targets outside this field of view.
						left = 180, --float:
						right = 180,--float:
						up = 180,	 --float:
						down = 20  --float:
					},
				},

				parts = {
					{
						name		 = "Turret Body",
						mesh       = "Turrets-3/Turret-3-Body",
						materials  = { "arc_teamGlow", "arc_hull" },
						position   = { 0, .5-.875, 0},
						rotation   = { 0, 0, 0 },
						scale 	 = { 1, 1, 1 },
						turretBody = true, --Assigns this part as a body to the parent turret. Will rotate on a flat plan while the turret moves, giving the illusion of a 2-axis machine.
					},
					{
						name      = "Turret Barrel",
						mesh      = "Turrets-3/Turret-3-Railgun",
						materials = { "arc_hull", "arc_hull_dark", "arc_teamGlow" },
						position  = { .15, 0, 0 },
						rotation  = { 0, 0, 0 },
						scale 	= { 1, 1, 1 },
					},
					{	name = "Turret Muzzle",	position = { .15, 0, .6 },	rotation = { 0, 0, 0 },	scale = { 1, 1, 1 },	barrel = true,	},		
					{
						name      = "Turret Barrel",
						mesh      = "Turrets-3/Turret-3-Railgun",
						materials = { "arc_hull", "arc_hull_dark", "arc_teamGlow" },
						position  = { -.15, 0, 0 },
						rotation  = { 0, 0, 0 },
						scale 	= { 1, 1, 1 },
					},
					{	name = "Turret Muzzle",	position = { -.15, 0, .6 },	rotation = { 0, 0, 0 },	scale = { 1, 1, 1 },	barrel = true,	},		

					
				},
			},
		}
	end
	return prefab_part
end

function prefab.weapon_info.railgun.L(count)
	return { 1015503, 1 * count, 1016503 }
end
function prefab.weapon.railgun.L(pos,rot,sca,isGhost) --{float3}, {float3}, {float3}, bool
	prefab_part = {
		name	= "Large Turret Base",
		mesh      = "Turrets-5/Turret-5-Base",
		materials = { "arc_hull_dark", "arc_hull", "arc_teamColour", "arc_teamGlow", },
		position  = pos,
		rotation  = rot,
		scale 	= sca,
	}
	-- ghosts should NOT have weapons, as it causes a crash.
	if isGhost then
		prefab_part.materials = {"arc_build","arc_build","arc_build","arc_build",}
	else
		prefab_part.parts = {
			{
				name      = "Turret",
				position  = { 0, .925, 0 },    	-- float3: XYZ Relative local position of this object. Copy positions from Blender to help you out. NOTICE: Blender uses +Z as up, but this is converted to +Y (is up) when used in game.
				rotation  = { 0, 0, 0 },        			-- float3: XYZ Eular Angles, will apply rotation ZXY. Relative local rotation of this object.
				scale 	= { 1, 1, 1 },					-- float3: XYZ The nonuniform scale of the part, relative to it's parent's scale.

				weapon    = {
					weaponID = 1015503, --int: The weaponData id to be used for this weapon.
					turnSpeed = weaponStats.baseTracking*weaponStats.railgun.trackingMult.L, 	--float: Degrees per second.
					turnMode = "Linear", --string enum: Linear / Acceleration
					turnInstant = false, --bool: Ignore turn speed, snap to target. (Beam Spire, point defence)
					mountAngles = { -- Weapon's firing angles in degrees. Won't aquire targets outside this field of view.
						left = 180, --float:
						right = 180,--float:
						up = 180,	 --float:
						down = 5  --float:
					},
				},

				parts = {
					{
						name		 = "Turret Body",
						mesh       = "Turrets-5/Turret-5-Body",
						materials  = { "arc_teamGlow", "arc_hull" },
						position   = { 0, .5-.925, 0},
						rotation   = { 0, 0, 0 },
						scale 	 = { 1, 1, 1 },
						turretBody = true, --Assigns this part as a body to the parent turret. Will rotate on a flat plan while the turret moves, giving the illusion of a 2-axis machine.
					},
					{
						name      = "Turret Barrel Left",
						mesh      = "Turrets-5/Turret-5-Railgun", --The mesh to be used for this part, works the same as mainMesh.
						materials = { "arc_hull", "arc_hull_dark", "arc_teamGlow" },
						position  = { -.375, 0, 0 },
						rotation  = { 0, 0, 0 },
						scale 	= { 1, 1, 1 },
					},
					{
						name      = "Turret Muzzle",
						position  = { -.375, 0, .5875 },
						rotation  = { 0, 0, 0 },
						scale 	= { 1, 1, 1 },
						barrel    = true,
					},	
					{
						name      = "Turret Barrel Center",
						mesh      = "Turrets-5/Turret-5-Railgun", --The mesh to be used for this part, works the same as mainMesh.
						materials = { "arc_hull", "arc_hull_dark", "arc_teamGlow" },
						position  = { 0, 0, 0 },
						rotation  = { 0, 0, 0 },
						scale 	= { 1, 1, 1 },
					},		
					{
						name      = "Turret Muzzle",
						position  = { 0, 0, .5875 },
						rotation  = { 0, 0, 0 },
						scale 	= { 1, 1, 1 },
						barrel    = true,
					},	
					{
						name      = "Turret Barrel Right",
						mesh      = "Turrets-5/Turret-5-Railgun", --The mesh to be used for this part, works the same as mainMesh.
						materials = { "arc_hull", "arc_hull_dark", "arc_teamGlow" },
						position  = { .375, 0, 0 },
						rotation  = { 0, 0, 0 },
						scale 	= { 1, 1, 1 },
					},
					{
						name      = "Turret Muzzle",
						position  = { .375, 0, .5875 },
						rotation  = { 0, 0, 0 },
						scale 	= { 1, 1, 1 },
						barrel    = true,
					},
					
				},
			},
		}
	end
	return prefab_part
end