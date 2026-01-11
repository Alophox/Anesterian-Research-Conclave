prefab.weapon.cannon = {}
prefab.weapon_info.cannon = {}

function prefab.weapon_info.cannon.S(count)
	return { 3295401, 1 * count, 3296401 }
end
function prefab.weapon.cannon.S(pos, rot, sca, isGhost)
	prefab_part = {
		name	= "Small Turret Base",
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
		prefab_part.parts = {
			{
				name      = "Turret-top",
				position  = { 0, .75, 0 },    	-- float3: XYZ Relative local position of this object. Copy positions from Blender to help you out. NOTICE: Blender uses +Z as up, but this is converted to +Y (is up) when used in game.
				rotation  = { 0, 0, 0 },        			-- float3: XYZ Eular Angles, will apply rotation ZXY. Relative local rotation of this object.
				scale 	= { 1, 1, 1 },					-- float3: XYZ The nonuniform scale of the part, relative to it's parent's scale.

				weapon    = {
					weaponID = 3295401, --int: The weaponData id to be used for this weapon.
					turnSpeed = weaponStats.baseTracking*weaponStats.cannon.trackingMult.S, 	--float: Degrees per second.
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
						mesh      = "Turrets-1/Turret-1-Cannon", --The mesh to be used for this part, works the same as mainMesh.
						materials = { "arc_hull", "arc_teamGlow" },
						position  = { 0, 0, 0 },
						rotation  = { 0, 0, 0 },
						scale 	= { 1, 1, 1 },
					},
					{
						name      = "Turret Muzzle",
						position  = { 0, 0, .6 },
						rotation  = { 0, 0, 0 },
						scale 	= { 1, 1, 1 },
						barrel    = true, --Assigns this part as a barrel to the parent's weapon. Barrels are where lasers, units, and weaponVisuals are placed or fired from.
					},			

					-- {
					-- 	name		 = "Muzzle Flash",
					-- 	mesh       = "Thruster/Thruster-Plume",
					-- 	materials  = { "arc_muzzleFlash_teamGlow" },
					-- 	position   = { 0, 0, 0 },
					-- 	rotation   = { 180, 180, 180 },
					-- 	scale 	 = { .1, .1, .001 },
						
					-- 	--Assigns this part as a weaponVisual to the parent part's weapon, that we will use as a muzzle flash.
					-- 	--Muzzle flashes are secretly laser beams. WOW
					-- 	weaponVisualConfig = { --Controls how the visual effect behaves.
					-- 		-- Yes I know it says laser, all weapon visuals in the game are derived from the original laser effect. So even muzzle flashes are secretly "lasers".
					-- 		laserColour = {1,.5,1}, 	-- RGB, 0 to 1, colour of the weaponVisual.
					-- 		intensity = 3;			-- The brightness of the laser colour.
					-- 		useWeaponLaserDescription = true, --If true, will ignore it's own laserDescription and use the weapon's defined one.
					-- 		laserDescription = { 		--"laser" description, but is actually a maleable visual effect.
					-- 		}, 
					-- 	}
						
					-- },
				},
			},
		}
	end
	return prefab_part
end


function prefab.weapon_info.cannon.M(count)
	return { 3295402, 1 * count, 3296402 }
end
function prefab.weapon.cannon.M(pos, rot, sca, isGhost)
	prefab_part = {
		name	= "Medium Cannon Base",
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
					weaponID = 3295402, --int: The weaponData id to be used for this weapon.
					turnSpeed = weaponStats.baseTracking*weaponStats.cannon.trackingMult.M, 	--float: Degrees per second.
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
						mesh      = "Turrets-3/Turret-3-Cannon",
						materials = { "arc_hull", "arc_teamGlow" },
						position  = { .15, 0, 0 },
						rotation  = { 0, 0, 0 },
						scale 	= { 1, 1, 1 },
					},
					{	name = "Turret Muzzle",	position = { .15, 0, 1.35 },	rotation = { 0, 0, 0 },	scale = { 1, 1, 1 },	barrel = true,	},		
					{
						name      = "Turret Barrel",
						mesh      = "Turrets-3/Turret-3-Cannon",
						materials = { "arc_hull", "arc_teamGlow" },
						position  = { -.15, 0, 0 },
						rotation  = { 0, 0, 0 },
						scale 	= { 1, 1, 1 },
					},
					{	name = "Turret Muzzle",	position = { -.15, 0, 1.35 },	rotation = { 0, 0, 0 },	scale = { 1, 1, 1 },	barrel = true,	},		
				},
			},
		}
	end
	return prefab_part
end

function prefab.weapon_info.cannon.L(count)
	return { 3295403, 1 * count, 3296403 }
end
function prefab.weapon.cannon.L(pos, rot, sca, isGhost)
	prefab_part = {
		name	= "Large Cannon Base",
		mesh      = "Turrets-5/Turret-5-Base",
		materials = { "arc_hull_dark", "arc_hull", "arc_teamColour", "arc_teamGlow", },
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
				position  = { 0, .925, 0 },    	-- float3: XYZ Relative local position of this object. Copy positions from Blender to help you out. NOTICE: Blender uses +Z as up, but this is converted to +Y (is up) when used in game.
				rotation  = { 0, 0, 0 },        			-- float3: XYZ Eular Angles, will apply rotation ZXY. Relative local rotation of this object.
				scale 	= { 1, 1, 1 },					-- float3: XYZ The nonuniform scale of the part, relative to it's parent's scale.

				weapon    = {
					weaponID = 3295403, --int: The weaponData id to be used for this weapon.
					turnSpeed = weaponStats.baseTracking*weaponStats.cannon.trackingMult.L, 	--float: Degrees per second.
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
						mesh       = "Turrets-5/Turret-5-Body",
						materials  = { "arc_teamGlow", "arc_hull" },
						position   = { 0, .5-.925, 0},
						rotation   = { 0, 0, 0 },
						scale 	 = { 1, 1, 1 },
						turretBody = true, --Assigns this part as a body to the parent turret. Will rotate on a flat plan while the turret moves, giving the illusion of a 2-axis machine.
					},
					{
						name      = "Turret Barrel Left",
						mesh      = "Turrets-5/Turret-5-Cannon",
						materials = { "arc_hull", "arc_teamGlow" },
						position  = { -.375, 0, 0 },
						rotation  = { 0, 0, 0 },
						scale 	= { 1, 1, 1 },
					},
					{	name = "Turret Muzzle",	position = { -.375, 0, 1.7125 },	rotation = { 0, 0, 0 },	scale = { 1, 1, 1 },	barrel = true,	},		
					{
						name      = "Turret Barrel Center",
						mesh      = "Turrets-5/Turret-5-Cannon",
						materials = { "arc_hull", "arc_teamGlow" },
						position  = { 0, 0, 0 },
						rotation  = { 0, 0, 0 },
						scale 	= { 1, 1, 1 },
					},
					{	name = "Turret Muzzle",	position = { 0, 0, 1.7125 },	rotation = { 0, 0, 0 },	scale = { 1, 1, 1 },	barrel = true,	},
					{
						name      = "Turret Barrel Right",
						mesh      = "Turrets-5/Turret-5-Cannon",
						materials = { "arc_hull", "arc_teamGlow" },
						position  = { .375, 0, 0 },
						rotation  = { 0, 0, 0 },
						scale 	= { 1, 1, 1 },
					},
					{	name = "Turret Muzzle",	position = { .375, 0, 1.7125 },	rotation = { 0, 0, 0 },	scale = { 1, 1, 1 },	barrel = true,	},		
				},
			},
		}
	end
	return prefab_part
end

function prefab.weapon_info.cannon.X(count)
	return { 3295404, 1 * count, 3296404 }
end
function prefab.weapon.cannon.X(pos, rot, sca, isGhost)
	prefab_part = {
		name	= "Extra Large Cannon Base",
		mesh      = "Turrets-7/Turret-7-Base",
		materials = { "arc_hull_dark", "arc_hull", "arc_teamColour", "arc_teamGlow", },
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
				position  = { 0, 1.125, 0 },    	-- float3: XYZ Relative local position of this object. Copy positions from Blender to help you out. NOTICE: Blender uses +Z as up, but this is converted to +Y (is up) when used in game.
				rotation  = { 0, 0, 0 },        			-- float3: XYZ Eular Angles, will apply rotation ZXY. Relative local rotation of this object.
				scale 	= { 1, 1, 1 },					-- float3: XYZ The nonuniform scale of the part, relative to it's parent's scale.

				weapon    = {
					weaponID = 3295404, --int: The weaponData id to be used for this weapon.
					turnSpeed = weaponStats.baseTracking*weaponStats.cannon.trackingMult.X, 	--float: Degrees per second.
					turnMode = "Linear", --string enum: Linear / Acceleration
					turnInstant = false, --bool: Ignore turn speed, snap to target. (Beam Spire, point defence)
					mountAngles = { -- Weapon's firing angles in degrees. Won't aquire targets outside this field of view.
						left = 180, --float:
						right = 180,--float:
						up = 180,	 --float:
						down = 10  --float:
					},
				},

				parts = {
					{
						name		 = "Turret Body",
						mesh       = "Turrets-7/Turret-7-Body",
						materials  = { "arc_teamGlow", "arc_hull" },
						position   = { 0, .5-1.125, 0},
						rotation   = { 0, 0, 0 },
						scale 	 = { 1, 1, 1 },
						turretBody = true, --Assigns this part as a body to the parent turret. Will rotate on a flat plan while the turret moves, giving the illusion of a 2-axis machine.
					},
					{
						name      = "Turret Barrel Left",
						mesh      = "Turrets-7/Turret-7-Cannon",
						materials = { "arc_hull", "arc_teamGlow" },
						position  = { -.735, 0, 0 },
						rotation  = { 0, 0, 0 },
						scale 	= { 1, 1, 1 },
					},
					{	name = "Turret Muzzle",	position = { -.735, 0, 2.2125 },	rotation = { 0, 0, 0 },	scale = { 1, 1, 1 },	barrel = true,	},		
					
					{
						name      = "Turret Barrel Center Left",
						mesh      = "Turrets-7/Turret-7-Cannon",
						materials = { "arc_hull", "arc_teamGlow" },
						position  = { -.245, 0, 0 },
						rotation  = { 0, 0, 0 },
						scale 	= { 1, 1, 1 },
					},
					{	name = "Turret Muzzle",	position = { -.245, 0, 2.2125 },	rotation = { 0, 0, 0 },	scale = { 1, 1, 1 },	barrel = true,	},		
					
					{
						name      = "Turret Barrel Center Right",
						mesh      = "Turrets-7/Turret-7-Cannon",
						materials = { "arc_hull", "arc_teamGlow" },
						position  = { .245, 0, 0 },
						rotation  = { 0, 0, 0 },
						scale 	= { 1, 1, 1 },
					},
					{	name = "Turret Muzzle",	position = { .245, 0, 2.2125 },	rotation = { 0, 0, 0 },	scale = { 1, 1, 1 },	barrel = true,	},		
					
					
					{
						name      = "Turret Barrel Right",
						mesh      = "Turrets-7/Turret-7-Cannon",
						materials = { "arc_hull", "arc_teamGlow" },
						position  = { .735, 0, 0 },
						rotation  = { 0, 0, 0 },
						scale 	= { 1, 1, 1 },
					},
					{	name = "Turret Muzzle",	position = { .735, 0, 2.2125 },	rotation = { 0, 0, 0 },	scale = { 1, 1, 1 },	barrel = true,	},		
				},
			},
		}
	end
	return prefab_part
end

function prefab.weapon_info.cannon.XS(count)
	return { 3295404, 1 * count, 3296404 }
end
function prefab.weapon.cannon.XS(pos, rot, sca, isGhost)
	prefab_part = {
		name	= "Large Cannon Base",
		-- mesh      = "Turrets-5/Turret-5-Base",
		-- materials = { "arc_hull_dark", "arc_hull", "arc_teamColour", "arc_teamGlow", },
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
				position  = { 0, 0, 0 },    	-- float3: XYZ Relative local position of this object. Copy positions from Blender to help you out. NOTICE: Blender uses +Z as up, but this is converted to +Y (is up) when used in game.
				rotation  = { 0, 0, 0 },        			-- float3: XYZ Eular Angles, will apply rotation ZXY. Relative local rotation of this object.
				scale 	= { 1, 1, 1 },					-- float3: XYZ The nonuniform scale of the part, relative to it's parent's scale.

				weapon    = {
					weaponID = 3295404, --int: The weaponData id to be used for this weapon.
					turnSpeed = weaponStats.baseTracking*weaponStats.cannon.trackingMult.X, 	--float: Degrees per second.
					turnMode = "Linear", --string enum: Linear / Acceleration
					turnInstant = false, --bool: Ignore turn speed, snap to target. (Beam Spire, point defence)
					mountAngles = { -- Weapon's firing angles in degrees. Won't aquire targets outside this field of view.
						left = 5, --float:
						right = 5,--float:
						up = 5,	 --float:
						down = 5  --float:
					},
				},

				parts = {
					{	name = "Turret Muzzle",	position = { 0, 0, 0 },	rotation = { 0, 0, 0 },	scale = { 1, 1, 1 },	barrel = true,	},
				},
			},
		}
	end
	return prefab_part
end

function prefab.weapon_info.cannon.TS(count)
	return { 3295405, 1 * count, 3296405 }
end
function prefab.weapon.cannon.TS(pos, rot, sca, isGhost)
	prefab_part = {
		name	= "Large Cannon Base",
		-- mesh      = "Turrets-5/Turret-5-Base",
		-- materials = { "arc_hull_dark", "arc_hull", "arc_teamColour", "arc_teamGlow", },
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
				position  = { 0, 0, 0 },    	-- float3: XYZ Relative local position of this object. Copy positions from Blender to help you out. NOTICE: Blender uses +Z as up, but this is converted to +Y (is up) when used in game.
				rotation  = { 0, 0, 0 },        			-- float3: XYZ Eular Angles, will apply rotation ZXY. Relative local rotation of this object.
				scale 	= { 1, 1, 1 },					-- float3: XYZ The nonuniform scale of the part, relative to it's parent's scale.

				weapon    = {
					weaponID = 3295405, --int: The weaponData id to be used for this weapon.
					turnSpeed = weaponStats.baseTracking*weaponStats.cannon.trackingMult.T, 	--float: Degrees per second.
					turnMode = "Linear", --string enum: Linear / Acceleration
					turnInstant = false, --bool: Ignore turn speed, snap to target. (Beam Spire, point defence)
					mountAngles = { -- Weapon's firing angles in degrees. Won't aquire targets outside this field of view.
						left = 5, --float:
						right = 5,--float:
						up = 5,	 --float:
						down = 5  --float:
					},
				},

				parts = {
					{	name = "Turret Muzzle",	position = { 0, 0, 0 },	rotation = { 0, 0, 0 },	scale = { 1, 1, 1 },	barrel = true,	},
				},
			},
		}
	end
	return prefab_part
end