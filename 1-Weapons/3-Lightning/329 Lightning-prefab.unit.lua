prefab.weapon.lightning = {}
prefab.weapon_info.lightning = {}

function prefab.weapon.lightning_effect(num)
	return {
		name		 = "Turret Lightning",
		mesh       = "329-Turrets-1/Turret-1-Lightning-Effect-"..num,
		materials  = { "329_MT_arc_weapon_teamGlow" },
		position   = { 0, 0, 0 },
		rotation   = { 0, 0, 0 },
		scale 	 = { .1, .1, .1 },
		
		weaponVisualConfig = {
			laserColour = {1,1,1},
			intensity = 3;
			useWeaponLaserDescription = true,
			laserDescription = {
			}, 
		}
	}
end

function prefab.weapon_info.lightning.D(count)
	return { 3295300, 1 * count, 0 }
end
function prefab.weapon.lightning.D(pos, rot, sca, isGhost, ghostIndex, ghostMat)
	if(ghostIndex==nil) then ghostIndex=0 end
	if(ghostMat==nil) then ghostMat="build" end
	if(ghostIndex < 0) then return {}; end
	if(not isGhost and ghostIndex < 0) then return {}; end
	prefab_part = {
		name	= "Small Turret Base",
		-- mesh      = "329-Turrets-1/Turret-1-Base",
		-- materials = { "329_MT_arc_hull",  "329_MT_arc_teamColour", "329_MT_arc_teamGlow", "329_MT_arc_hull_dark" },
		position  = pos,    	-- float3: XYZ Relative local position of this object. Copy positions from Blender to help you out. NOTICE: Blender uses +Z as up, but this is converted to +Y (is up) when used in game.
		rotation  = rot,        			-- float3: XYZ Eular Angles, will apply rotation ZXY. Relative local rotation of this object.
		scale 	= sca,					-- float3: XYZ The nonuniform scale of the part, relative to it's parent's scale.
	}
	-- ghosts should NOT have weapons, as it causes a crash.
	if isGhost then
		if (ghostMat == "aegis") then
			prefab_part.aegisVisual = true;
		end
		prefab_part.materials = {"329_MT_arc_"..ghostIndex.."_"..ghostMat,"329_MT_arc_"..ghostIndex.."_"..ghostMat,"329_MT_arc_"..ghostIndex.."_"..ghostMat,"329_MT_arc_"..ghostIndex.."_"..ghostMat,}
	else
		prefab_part.parts={
			{
				name      = "Turret",	position  = { 0,0, 0 },	rotation  = { 0, 0, 0 },	scale 	= { 1, 1, 1 },
				weapon    = {
					weaponID = 3295300, --int: The weaponData id to be used for this weapon.
					turnSpeed = weaponStats.baseTracking*weaponStats.lightning.trackingMult.D, 	--float: Degrees per second.
					turnMode = "Linear", --string enum: Linear / Acceleration
					turnInstant = false, --bool: Ignore turn speed, snap to target. (Beam Spire, point defence)
					mountAngles = { -- Weapon's firing angles in degrees. Won't aquire targets outside this field of view.
						left = 25, --float:
						right = 25,--float:
						up = 15,	 --float:
						down = 15  --float:
					},
				},

				parts = {
					prefab.weapon.lightning_effect(1),
					prefab.weapon.lightning_effect(2),
					prefab.weapon.lightning_effect(3),
				},
			},
		}
	end
	return prefab_part
end

function prefab.weapon_info.lightning.S(count)
	return { 3295301, 1 * count, 0 }
end
function prefab.weapon.lightning.S(pos, rot, sca, isGhost, ghostIndex, ghostMat)
	if(ghostIndex==nil) then ghostIndex=0 end
	if(ghostMat==nil) then ghostMat="build" end
	if(ghostIndex < 0) then return {}; end
	if(not isGhost and ghostIndex < 0) then return {}; end
	prefab_part = {
		name	= "Small Turret Base",
		mesh      = "329-Turrets-1/Turret-1-Base",
		materials = { "329_MT_arc_hull",  "329_MT_arc_teamColour", "329_MT_arc_teamGlow", "329_MT_arc_hull_dark" },
		position  = pos,    	-- float3: XYZ Relative local position of this object. Copy positions from Blender to help you out. NOTICE: Blender uses +Z as up, but this is converted to +Y (is up) when used in game.
		rotation  = rot,        			-- float3: XYZ Eular Angles, will apply rotation ZXY. Relative local rotation of this object.
		scale 	= sca,					-- float3: XYZ The nonuniform scale of the part, relative to it's parent's scale.
	}
	-- ghosts should NOT have weapons, as it causes a crash.
	if isGhost then
		if (ghostMat == "aegis") then
			prefab_part.aegisVisual = true;
		end
		prefab_part.materials = {"329_MT_arc_"..ghostIndex.."_"..ghostMat,"329_MT_arc_"..ghostIndex.."_"..ghostMat,"329_MT_arc_"..ghostIndex.."_"..ghostMat,"329_MT_arc_"..ghostIndex.."_"..ghostMat,}
	else
		prefab_part.parts={
			{
				name      = "Turret-top",	position  = { 0,.75, 0 },	rotation  = { 0, 0, 0 },	scale 	= { 1, 1, 1 },
				weapon    = {
					weaponID = 3295301, --int: The weaponData id to be used for this weapon.
					turnSpeed = weaponStats.baseTracking*weaponStats.lightning.trackingMult.S, 	--float: Degrees per second.
					turnMode = "Linear", --string enum: Linear / Acceleration
					turnInstant = false, --bool: Ignore turn speed, snap to target. (Beam Spire, point defence)
					mountAngles = { -- Weapon's firing angles in degrees. Won't aquire targets outside this field of view.
						left = 180, --float:
						right = 180,--float:
						up = 90,	 --float:
						down = 20  --float:
					},
				},

				parts = {
					{
						name		 = "Turret Body",
						mesh       = "329-Turrets-1/Turret-1-Body",
						materials  = { "329_MT_arc_hull" },
						position   = { 0, -.25, 0},
						rotation   = { 0, 0, 0 },
						scale 	 = { 1, 1, 1 },
						turretBody = true, --Assigns this part as a body to the parent turret. Will rotate on a flat plan while the turret moves, giving the illusion of a 2-axis machine.
					},
					{
						name      = "Turret Barrel",
						mesh      = "329-Turrets-1/Turret-1-Lightning", --The mesh to be used for this part, works the same as mainMesh.
						materials = { "329_MT_arc_hull", "329_MT_arc_teamGlow" },
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

					prefab.weapon.lightning_effect(1),
					prefab.weapon.lightning_effect(2),
					prefab.weapon.lightning_effect(3),
				},
			},
		}
	end
	return prefab_part
end

function prefab.weapon_info.lightning.M(count)
	return { 3295302, 1 * count, 0 }
end
function prefab.weapon.lightning.M(pos, rot, sca, isGhost, ghostIndex, ghostMat)
	if(ghostIndex==nil) then ghostIndex=0 end
	if(ghostMat==nil) then ghostMat="build" end
	if(ghostIndex < 0) then return {}; end
	if(not isGhost and ghostIndex < 0) then return {}; end
	prefab_part = {
		name	= "Medium Turret Base",
		mesh      = "329-Turrets-3/Turret-3-Base",
		materials = { "329_MT_arc_hull", "329_MT_arc_teamGlow", "329_MT_arc_hull_dark", "329_MT_arc_teamColour", },
		position  = pos,    	-- float3: XYZ Relative local position of this object. Copy positions from Blender to help you out. NOTICE: Blender uses +Z as up, but this is converted to +Y (is up) when used in game.
		rotation  = rot,        			-- float3: XYZ Eular Angles, will apply rotation ZXY. Relative local rotation of this object.
		scale 	= sca,					-- float3: XYZ The nonuniform scale of the part, relative to it's parent's scale.
	}
	-- ghosts should NOT have weapons, as it causes a crash.
	if isGhost then
		if (ghostMat == "aegis") then
			prefab_part.aegisVisual = true;
		end
		prefab_part.materials = {"329_MT_arc_"..ghostIndex.."_"..ghostMat,"329_MT_arc_"..ghostIndex.."_"..ghostMat,"329_MT_arc_"..ghostIndex.."_"..ghostMat,"329_MT_arc_"..ghostIndex.."_"..ghostMat,}
	else
		prefab_part.parts={
			{
				name      = "Turret-top",
				position  = { 0, .875, 0 },    	-- float3: XYZ Relative local position of this object. Copy positions from Blender to help you out. NOTICE: Blender uses +Z as up, but this is converted to +Y (is up) when used in game.
				rotation  = { 0, 0, 0 },        			-- float3: XYZ Eular Angles, will apply rotation ZXY. Relative local rotation of this object.
				scale 	= { 1, 1, 1 },					-- float3: XYZ The nonuniform scale of the part, relative to it's parent's scale.

				weapon    = {
					weaponID = 3295302, --int: The weaponData id to be used for this weapon.
					turnSpeed = weaponStats.baseTracking*weaponStats.lightning.trackingMult.M, 	--float: Degrees per second.
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
						mesh       = "329-Turrets-3/Turret-3-Body",
						materials  = { "329_MT_arc_teamGlow", "329_MT_arc_hull" },
						position   = { 0, .5-.875, 0},
						rotation   = { 0, 0, 0 },
						scale 	 = { 1, 1, 1 },
						turretBody = true, --Assigns this part as a body to the parent turret. Will rotate on a flat plan while the turret moves, giving the illusion of a 2-axis machine.
					},
					{
						name      = "Turret Barrel",
						mesh      = "329-Turrets-3/Turret-3-Lightning",
						materials = { "329_MT_arc_hull", "329_MT_arc_teamGlow" },
						position  = { .15, 0, 0 },
						rotation  = { 0, 0, 0 },
						scale 	= { 1, 1, 1 },
					},
					{	name = "Turret Muzzle",	position = { .15, 0, 1.35 },	rotation = { 0, 0, 0 },	scale = { 1, 1, 1 },	barrel = true,	},
					{	name = "Turret Muzzle",	position = { .15, 0, 1.35 },	rotation = { 0, 0, 120 },	scale = { 1, 1, 1 },	barrel = true,	},
					{	name = "Turret Muzzle",	position = { .15, 0, 1.35 },	rotation = { 0, 0, 240 },	scale = { 1, 1, 1 },	barrel = true,	},
					
					{
						name      = "Turret Barrel",
						mesh      = "329-Turrets-3/Turret-3-Lightning",
						materials = { "329_MT_arc_hull", "329_MT_arc_teamGlow" },
						position  = { -.15, 0, 0 },
						rotation  = { 0, 0, 0 },
						scale 	= { 1, 1, 1 },
					},
					{	name = "Turret Muzzle",	position = { -.15, 0, 1.35 },	rotation = { 0, 0, 0 },	scale = { 1, 1, 1 },	barrel = true,	},
					{	name = "Turret Muzzle",	position = { -.15, 0, 1.35 },	rotation = { 0, 0, 120 },	scale = { 1, 1, 1 },	barrel = true,	},
					{	name = "Turret Muzzle",	position = { -.15, 0, 1.35 },	rotation = { 0, 0, 240 },	scale = { 1, 1, 1 },	barrel = true,	},

					prefab.weapon.lightning_effect(1),
					prefab.weapon.lightning_effect(2),
					prefab.weapon.lightning_effect(3),
				},
			},
		}
	end
	return prefab_part
end

function prefab.weapon_info.lightning.L(count)
	return { 3295303, 1 * count, 0 }
end
function prefab.weapon.lightning.L(pos, rot, sca, isGhost, ghostIndex, ghostMat)
	if(ghostIndex==nil) then ghostIndex=0 end
	if(ghostMat==nil) then ghostMat="build" end
	if(ghostIndex < 0) then return {}; end
	if(not isGhost and ghostIndex < 0) then return {}; end
	prefab_part = {
		name	= "Turret-top-base",
		mesh      = "329-Turrets-5/Turret-5-Base",
		materials = { "329_MT_arc_hull_dark", "329_MT_arc_hull", "329_MT_arc_teamColour", "329_MT_arc_teamGlow", },
		position  = pos,    	-- float3: XYZ Relative local position of this object. Copy positions from Blender to help you out. NOTICE: Blender uses +Z as up, but this is converted to +Y (is up) when used in game.
		rotation  = rot,        			-- float3: XYZ Eular Angles, will apply rotation ZXY. Relative local rotation of this object.
		scale 	= sca,					-- float3: XYZ The nonuniform scale of the part, relative to it's parent's scale.
	}
	-- ghosts should NOT have weapons, as it causes a crash.
	if isGhost then
		if (ghostMat == "aegis") then
			prefab_part.aegisVisual = true;
		end
		prefab_part.materials = {"329_MT_arc_"..ghostIndex.."_"..ghostMat,"329_MT_arc_"..ghostIndex.."_"..ghostMat,"329_MT_arc_"..ghostIndex.."_"..ghostMat,"329_MT_arc_"..ghostIndex.."_"..ghostMat,}
	else
		prefab_part.parts={
			{
				name      = "Turret-top",
				position  = { 0, .925, 0 },    	-- float3: XYZ Relative local position of this object. Copy positions from Blender to help you out. NOTICE: Blender uses +Z as up, but this is converted to +Y (is up) when used in game.
				rotation  = { 0, 0, 0 },        			-- float3: XYZ Eular Angles, will apply rotation ZXY. Relative local rotation of this object.
				scale 	= { 1, 1, 1 },					-- float3: XYZ The nonuniform scale of the part, relative to it's parent's scale.

				weapon    = {
					weaponID = 3295303, --int: The weaponData id to be used for this weapon.
					turnSpeed = weaponStats.baseTracking*weaponStats.lightning.trackingMult.L, 	--float: Degrees per second.
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
						mesh       = "329-Turrets-5/Turret-5-Body",
						materials  = { "329_MT_arc_teamGlow", "329_MT_arc_hull" },
						position   = { 0, .5-.925, 0},
						rotation   = { 0, 0, 0 },
						scale 	 = { 1, 1, 1 },
						turretBody = true, --Assigns this part as a body to the parent turret. Will rotate on a flat plan while the turret moves, giving the illusion of a 2-axis machine.
					},
					{
						name      = "Turret Barrel Left",
						mesh      = "329-Turrets-5/Turret-5-Lightning",
						materials = { "329_MT_arc_hull", "329_MT_arc_teamGlow" },
						position  = { -.375, 0, 0 },
						rotation  = { 0, 0, 0 },
						scale 	= { 1, 1, 1 },
					},
					{	name = "Turret Muzzle",	position = { -.375, 0, 1.7125 },	rotation = { 0, 0, 0 },	scale = { 1, 1, 1 },	barrel = true,	},
					{	name = "Turret Muzzle",	position = { -.375, 0, 1.7125 },	rotation = { 0, 0, 72 },	scale = { 1, 1, 1 },	barrel = true,	},
					{	name = "Turret Muzzle",	position = { -.375, 0, 1.7125 },	rotation = { 0, 0, 144 },	scale = { 1, 1, 1 },	barrel = true,	},
					{	name = "Turret Muzzle",	position = { -.375, 0, 1.7125 },	rotation = { 0, 0, 216 },	scale = { 1, 1, 1 },	barrel = true,	},
					{	name = "Turret Muzzle",	position = { -.375, 0, 1.7125 },	rotation = { 0, 0, 288 },	scale = { 1, 1, 1 },	barrel = true,	},
					
					{
						name      = "Turret Barrel Center",
						mesh      = "329-Turrets-5/Turret-5-Lightning",
						materials = { "329_MT_arc_hull", "329_MT_arc_teamGlow" },
						position  = { 0, 0, 0 },
						rotation  = { 0, 0, 0 },
						scale 	= { 1, 1, 1 },
					},
					{	name = "Turret Muzzle",	position = { 0, 0, 1.7125 },	rotation = { 0, 0, 0 },	scale = { 1, 1, 1 },	barrel = true,	},
					{	name = "Turret Muzzle",	position = { 0, 0, 1.7125 },	rotation = { 0, 0, 72 },	scale = { 1, 1, 1 },	barrel = true,	},
					{	name = "Turret Muzzle",	position = { 0, 0, 1.7125 },	rotation = { 0, 0, 144 },	scale = { 1, 1, 1 },	barrel = true,	},
					{	name = "Turret Muzzle",	position = { 0, 0, 1.7125 },	rotation = { 0, 0, 216 },	scale = { 1, 1, 1 },	barrel = true,	},
					{	name = "Turret Muzzle",	position = { 0, 0, 1.7125 },	rotation = { 0, 0, 288 },	scale = { 1, 1, 1 },	barrel = true,	},
					{
						name      = "Turret Barrel Right",
						mesh      = "329-Turrets-5/Turret-5-Lightning",
						materials = { "329_MT_arc_hull", "329_MT_arc_teamGlow" },
						position  = { .375, 0, 0 },
						rotation  = { 0, 0, 0 },
						scale 	= { 1, 1, 1 },
					},
					{	name = "Turret Muzzle",	position = { .375, 0, 1.7125 },	rotation = { 0, 0, 0 },	scale = { 1, 1, 1 },	barrel = true,	},
					{	name = "Turret Muzzle",	position = { .375, 0, 1.7125 },	rotation = { 0, 0, 72 },	scale = { 1, 1, 1 },	barrel = true,	},
					{	name = "Turret Muzzle",	position = { .375, 0, 1.7125 },	rotation = { 0, 0, 144 },	scale = { 1, 1, 1 },	barrel = true,	},
					{	name = "Turret Muzzle",	position = { .375, 0, 1.7125 },	rotation = { 0, 0, 216 },	scale = { 1, 1, 1 },	barrel = true,	},
					{	name = "Turret Muzzle",	position = { .375, 0, 1.7125 },	rotation = { 0, 0, 288 },	scale = { 1, 1, 1 },	barrel = true,	},
					

					prefab.weapon.lightning_effect(1),
					prefab.weapon.lightning_effect(2),
					prefab.weapon.lightning_effect(3),
					prefab.weapon.lightning_effect(1),
					prefab.weapon.lightning_effect(2),
					prefab.weapon.lightning_effect(3),
				},
			},
		}
	end
	return prefab_part
end

function prefab.weapon_info.lightning.X(count)
	return { 3295304, 1 * count, 0 }
end
function prefab.weapon.lightning.X(pos, rot, sca, isGhost, ghostIndex, ghostMat)
	if(ghostIndex==nil) then ghostIndex=0 end
	if(ghostMat==nil) then ghostMat="build" end
	if(ghostIndex < 0) then return {}; end
	if(not isGhost and ghostIndex < 0) then return {}; end
	prefab_part = {
		name	= "Turret-top-base",
		mesh      = "329-Turrets-7/Turret-7-Base",
		materials = { "329_MT_arc_hull_dark", "329_MT_arc_hull", "329_MT_arc_teamColour", "329_MT_arc_teamGlow", },
		position  = pos,    	-- float3: XYZ Relative local position of this object. Copy positions from Blender to help you out. NOTICE: Blender uses +Z as up, but this is converted to +Y (is up) when used in game.
		rotation  = rot,        			-- float3: XYZ Eular Angles, will apply rotation ZXY. Relative local rotation of this object.
		scale 	= sca,					-- float3: XYZ The nonuniform scale of the part, relative to it's parent's scale.
	}
	-- ghosts should NOT have weapons, as it causes a crash.
	if isGhost then
		if (ghostMat == "aegis") then
			prefab_part.aegisVisual = true;
		end
		prefab_part.materials = {"329_MT_arc_"..ghostIndex.."_"..ghostMat,"329_MT_arc_"..ghostIndex.."_"..ghostMat,"329_MT_arc_"..ghostIndex.."_"..ghostMat,"329_MT_arc_"..ghostIndex.."_"..ghostMat,}
	else
		prefab_part.parts={
			{
				name      = "Turret-top",
				position  = { 0, 1.125, 0 },    	-- float3: XYZ Relative local position of this object. Copy positions from Blender to help you out. NOTICE: Blender uses +Z as up, but this is converted to +Y (is up) when used in game.
				rotation  = { 0, 0, 0 },        			-- float3: XYZ Eular Angles, will apply rotation ZXY. Relative local rotation of this object.
				scale 	= { 1, 1, 1 },					-- float3: XYZ The nonuniform scale of the part, relative to it's parent's scale.

				weapon    = {
					weaponID = 3295304, --int: The weaponData id to be used for this weapon.
					turnSpeed = weaponStats.baseTracking*weaponStats.lightning.trackingMult.X, 	--float: Degrees per second.
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
						mesh       = "329-Turrets-7/Turret-7-Body",
						materials  = { "329_MT_arc_teamGlow", "329_MT_arc_hull" },
						position   = { 0, .5-1.125, 0},
						rotation   = { 0, 0, 0 },
						scale 	 = { 1, 1, 1 },
						turretBody = true, --Assigns this part as a body to the parent turret. Will rotate on a flat plan while the turret moves, giving the illusion of a 2-axis machine.
					},
					{
						name      = "Turret Barrel Left",
						mesh      = "329-Turrets-7/Turret-7-Lightning",
						materials = { "329_MT_arc_hull", "329_MT_arc_teamGlow" },
						position  = { -.735, 0, 0 },
						rotation  = { 0, 0, 0 },
						scale 	= { 1, 1, 1 },
					},
					{	name = "Turret Muzzle",	position = { -.735, 0, 2.2125 },	rotation = { 0, 0, 0 },	scale = { 1, 1, 1 },	barrel = true,	},
					{	name = "Turret Muzzle",	position = { -.735, 0, 2.2125 },	rotation = { 0, 0, 51 },	scale = { 1, 1, 1 },	barrel = true,	},
					{	name = "Turret Muzzle",	position = { -.735, 0, 2.2125 },	rotation = { 0, 0, 103 },	scale = { 1, 1, 1 },	barrel = true,	},
					{	name = "Turret Muzzle",	position = { -.735, 0, 2.2125 },	rotation = { 0, 0, 154 },	scale = { 1, 1, 1 },	barrel = true,	},
					{	name = "Turret Muzzle",	position = { -.735, 0, 2.2125 },	rotation = { 0, 0, 206 },	scale = { 1, 1, 1 },	barrel = true,	},
					{	name = "Turret Muzzle",	position = { -.735, 0, 2.2125 },	rotation = { 0, 0, 257 },	scale = { 1, 1, 1 },	barrel = true,	},
					{	name = "Turret Muzzle",	position = { -.735, 0, 2.2125 },	rotation = { 0, 0, 309 },	scale = { 1, 1, 1 },	barrel = true,	},
					
					{
						name      = "Turret Barrel Center Left",
						mesh      = "329-Turrets-7/Turret-7-Lightning",
						materials = { "329_MT_arc_hull", "329_MT_arc_teamGlow" },
						position  = { -.245, 0, 0 },
						rotation  = { 0, 0, 0 },
						scale 	= { 1, 1, 1 },
					},
					{	name = "Turret Muzzle",	position = { -.245, 0, 2.2125 },	rotation = { 0, 0, 0 },	scale = { 1, 1, 1 },	barrel = true,	},
					{	name = "Turret Muzzle",	position = { -.245, 0, 2.2125 },	rotation = { 0, 0, 51 },	scale = { 1, 1, 1 },	barrel = true,	},
					{	name = "Turret Muzzle",	position = { -.245, 0, 2.2125 },	rotation = { 0, 0, 103 },	scale = { 1, 1, 1 },	barrel = true,	},
					{	name = "Turret Muzzle",	position = { -.245, 0, 2.2125 },	rotation = { 0, 0, 154 },	scale = { 1, 1, 1 },	barrel = true,	},
					{	name = "Turret Muzzle",	position = { -.245, 0, 2.2125 },	rotation = { 0, 0, 206 },	scale = { 1, 1, 1 },	barrel = true,	},
					{	name = "Turret Muzzle",	position = { -.245, 0, 2.2125 },	rotation = { 0, 0, 257 },	scale = { 1, 1, 1 },	barrel = true,	},
					{	name = "Turret Muzzle",	position = { -.245, 0, 2.2125 },	rotation = { 0, 0, 309 },	scale = { 1, 1, 1 },	barrel = true,	},
					
					
					{
						name      = "Turret Barrel Center Right",
						mesh      = "329-Turrets-7/Turret-7-Lightning",
						materials = { "329_MT_arc_hull", "329_MT_arc_teamGlow" },
						position  = { .245, 0, 0 },
						rotation  = { 0, 0, 0 },
						scale 	= { 1, 1, 1 },
					},
					{	name = "Turret Muzzle",	position = { .245, 0, 2.2125 },	rotation = { 0, 0, 0 },	scale = { 1, 1, 1 },	barrel = true,	},
					{	name = "Turret Muzzle",	position = { .245, 0, 2.2125 },	rotation = { 0, 0, 51 },	scale = { 1, 1, 1 },	barrel = true,	},
					{	name = "Turret Muzzle",	position = { .245, 0, 2.2125 },	rotation = { 0, 0, 103 },	scale = { 1, 1, 1 },	barrel = true,	},
					{	name = "Turret Muzzle",	position = { .245, 0, 2.2125 },	rotation = { 0, 0, 154 },	scale = { 1, 1, 1 },	barrel = true,	},
					{	name = "Turret Muzzle",	position = { .245, 0, 2.2125 },	rotation = { 0, 0, 206 },	scale = { 1, 1, 1 },	barrel = true,	},
					{	name = "Turret Muzzle",	position = { .245, 0, 2.2125 },	rotation = { 0, 0, 257 },	scale = { 1, 1, 1 },	barrel = true,	},
					{	name = "Turret Muzzle",	position = { .245, 0, 2.2125 },	rotation = { 0, 0, 309 },	scale = { 1, 1, 1 },	barrel = true,	},
					
					
					{
						name      = "Turret Barrel Right",
						mesh      = "329-Turrets-7/Turret-7-Lightning",
						materials = { "329_MT_arc_hull", "329_MT_arc_teamGlow" },
						position  = { .735, 0, 0 },
						rotation  = { 0, 0, 0 },
						scale 	= { 1, 1, 1 },
					},
					{	name = "Turret Muzzle",	position = { .735, 0, 2.2125 },	rotation = { 0, 0, 0 },	scale = { 1, 1, 1 },	barrel = true,	},
					{	name = "Turret Muzzle",	position = { .735, 0, 2.2125 },	rotation = { 0, 0, 51 },	scale = { 1, 1, 1 },	barrel = true,	},
					{	name = "Turret Muzzle",	position = { .735, 0, 2.2125 },	rotation = { 0, 0, 103 },	scale = { 1, 1, 1 },	barrel = true,	},
					{	name = "Turret Muzzle",	position = { .735, 0, 2.2125 },	rotation = { 0, 0, 154 },	scale = { 1, 1, 1 },	barrel = true,	},
					{	name = "Turret Muzzle",	position = { .735, 0, 2.2125 },	rotation = { 0, 0, 206 },	scale = { 1, 1, 1 },	barrel = true,	},
					{	name = "Turret Muzzle",	position = { .735, 0, 2.2125 },	rotation = { 0, 0, 257 },	scale = { 1, 1, 1 },	barrel = true,	},
					{	name = "Turret Muzzle",	position = { .735, 0, 2.2125 },	rotation = { 0, 0, 309 },	scale = { 1, 1, 1 },	barrel = true,	},
					

					prefab.weapon.lightning_effect(1),
					prefab.weapon.lightning_effect(2),
					prefab.weapon.lightning_effect(3),
					prefab.weapon.lightning_effect(1),
					prefab.weapon.lightning_effect(2),
					prefab.weapon.lightning_effect(3),
					prefab.weapon.lightning_effect(1),
					prefab.weapon.lightning_effect(2),
					prefab.weapon.lightning_effect(3),
				},
			},
		}
	end
	return prefab_part
end

function prefab.weapon_info.lightning.XS(count)
	return { 3295304, 1 * count, 0 }
end
function prefab.weapon.lightning.XS(pos, rot, sca, isGhost, ghostIndex, ghostMat)
	if(ghostIndex==nil) then ghostIndex=0 end
	if(ghostMat==nil) then ghostMat="build" end
	if(ghostIndex < 0) then return {}; end
	if(not isGhost and ghostIndex < 0) then return {}; end
	prefab_part = {
		name	= "Turret-top-base",
		-- mesh      = "329-Turrets-5/Turret-5-Base",
		-- materials = { "329_MT_arc_hull_dark", "329_MT_arc_hull", "329_MT_arc_teamColour", "329_MT_arc_teamGlow", },
		position  = pos,    	-- float3: XYZ Relative local position of this object. Copy positions from Blender to help you out. NOTICE: Blender uses +Z as up, but this is converted to +Y (is up) when used in game.
		rotation  = rot,        			-- float3: XYZ Eular Angles, will apply rotation ZXY. Relative local rotation of this object.
		scale 	= sca,					-- float3: XYZ The nonuniform scale of the part, relative to it's parent's scale.
	}
	-- ghosts should NOT have weapons, as it causes a crash.
	if isGhost then
		if (ghostMat == "aegis") then
			prefab_part.aegisVisual = true;
		end
		prefab_part.materials = {"329_MT_arc_"..ghostIndex.."_"..ghostMat,"329_MT_arc_"..ghostIndex.."_"..ghostMat,"329_MT_arc_"..ghostIndex.."_"..ghostMat,"329_MT_arc_"..ghostIndex.."_"..ghostMat,}
	else
		prefab_part.parts={
			{
				name      = "Turret-top",
				position  = { 0, 0, 0 },    	-- float3: XYZ Relative local position of this object. Copy positions from Blender to help you out. NOTICE: Blender uses +Z as up, but this is converted to +Y (is up) when used in game.
				rotation  = { 0, 0, 0 },        			-- float3: XYZ Eular Angles, will apply rotation ZXY. Relative local rotation of this object.
				scale 	= { 1, 1, 1 },					-- float3: XYZ The nonuniform scale of the part, relative to it's parent's scale.

				weapon    = {
					weaponID = 3295304, --int: The weaponData id to be used for this weapon.
					turnSpeed = weaponStats.baseTracking*weaponStats.lightning.trackingMult.X, 	--float: Degrees per second.
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
					{	name = "Turret Muzzle",	position = { 0, 0, 0 },	rotation = { 0, 0, 51 },	scale = { 1, 1, 1 },	barrel = true,	},
					{	name = "Turret Muzzle",	position = { 0, 0, 0 },	rotation = { 0, 0, 103 },	scale = { 1, 1, 1 },	barrel = true,	},
					{	name = "Turret Muzzle",	position = { 0, 0, 0 },	rotation = { 0, 0, 154 },	scale = { 1, 1, 1 },	barrel = true,	},
					{	name = "Turret Muzzle",	position = { 0, 0, 0 },	rotation = { 0, 0, 206 },	scale = { 1, 1, 1 },	barrel = true,	},
					{	name = "Turret Muzzle",	position = { 0, 0, 0 },	rotation = { 0, 0, 257 },	scale = { 1, 1, 1 },	barrel = true,	},
					{	name = "Turret Muzzle",	position = { 0, 0, 0 },	rotation = { 0, 0, 309 },	scale = { 1, 1, 1 },	barrel = true,	},
					
					prefab.weapon.lightning_effect(1),
					prefab.weapon.lightning_effect(2),
					prefab.weapon.lightning_effect(3),
					prefab.weapon.lightning_effect(1),
					prefab.weapon.lightning_effect(2),
					prefab.weapon.lightning_effect(3),
					prefab.weapon.lightning_effect(1),
					prefab.weapon.lightning_effect(2),
					prefab.weapon.lightning_effect(3),
				},
			},
		}
	end
	return prefab_part
end

function prefab.weapon_info.lightning.TS(count)
	return { 3295305, 1 * count, 0 }
end
function prefab.weapon.lightning.TS(pos, rot, sca, isGhost, ghostIndex, ghostMat)
	if(ghostIndex==nil) then ghostIndex=0 end
	if(ghostMat==nil) then ghostMat="build" end
	if(ghostIndex < 0) then return {}; end
	if(not isGhost and ghostIndex < 0) then return {}; end
	prefab_part = {
		name	= "Turret-top-base",
		-- mesh      = "329-Turrets-5/Turret-5-Base",
		-- materials = { "329_MT_arc_hull_dark", "329_MT_arc_hull", "329_MT_arc_teamColour", "329_MT_arc_teamGlow", },
		position  = pos,    	-- float3: XYZ Relative local position of this object. Copy positions from Blender to help you out. NOTICE: Blender uses +Z as up, but this is converted to +Y (is up) when used in game.
		rotation  = rot,        			-- float3: XYZ Eular Angles, will apply rotation ZXY. Relative local rotation of this object.
		scale 	= sca,					-- float3: XYZ The nonuniform scale of the part, relative to it's parent's scale.
	}
	-- ghosts should NOT have weapons, as it causes a crash.
	if isGhost then
		if (ghostMat == "aegis") then
			prefab_part.aegisVisual = true;
		end
		prefab_part.materials = {"329_MT_arc_"..ghostIndex.."_"..ghostMat,"329_MT_arc_"..ghostIndex.."_"..ghostMat,"329_MT_arc_"..ghostIndex.."_"..ghostMat,"329_MT_arc_"..ghostIndex.."_"..ghostMat,}
	else
		prefab_part.parts={
			{
				name      = "Turret-top",
				position  = { 0, 0, 0 },    	-- float3: XYZ Relative local position of this object. Copy positions from Blender to help you out. NOTICE: Blender uses +Z as up, but this is converted to +Y (is up) when used in game.
				rotation  = { 0, 0, 0 },        			-- float3: XYZ Eular Angles, will apply rotation ZXY. Relative local rotation of this object.
				scale 	= { 1, 1, 1 },					-- float3: XYZ The nonuniform scale of the part, relative to it's parent's scale.

				weapon    = {
					weaponID = 3295305, --int: The weaponData id to be used for this weapon.
					turnSpeed = weaponStats.baseTracking*weaponStats.lightning.trackingMult.T, 	--float: Degrees per second.
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
					{	name = "Turret Muzzle",	position = { 0, 0, 0 },	rotation = { 0, 0, 51 },	scale = { 1, 1, 1 },	barrel = true,	},
					{	name = "Turret Muzzle",	position = { 0, 0, 0 },	rotation = { 0, 0, 103 },	scale = { 1, 1, 1 },	barrel = true,	},
					{	name = "Turret Muzzle",	position = { 0, 0, 0 },	rotation = { 0, 0, 154 },	scale = { 1, 1, 1 },	barrel = true,	},
					{	name = "Turret Muzzle",	position = { 0, 0, 0 },	rotation = { 0, 0, 206 },	scale = { 1, 1, 1 },	barrel = true,	},
					{	name = "Turret Muzzle",	position = { 0, 0, 0 },	rotation = { 0, 0, 257 },	scale = { 1, 1, 1 },	barrel = true,	},
					{	name = "Turret Muzzle",	position = { 0, 0, 0 },	rotation = { 0, 0, 309 },	scale = { 1, 1, 1 },	barrel = true,	},
					
					prefab.weapon.lightning_effect(1),
					prefab.weapon.lightning_effect(2),
					prefab.weapon.lightning_effect(3),
					prefab.weapon.lightning_effect(1),
					prefab.weapon.lightning_effect(2),
					prefab.weapon.lightning_effect(3),
					prefab.weapon.lightning_effect(1),
					prefab.weapon.lightning_effect(2),
					prefab.weapon.lightning_effect(3),
				},
			},
		}
	end
	return prefab_part
end