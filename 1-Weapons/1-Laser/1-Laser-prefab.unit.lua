prefab.weapon.laser = {}
prefab.weapon_info.laser = {}

function prefab.weapon.laser_effect()
	return {
		name		 = "Turret Laser",
		mesh       = "Turrets-1/Turret-1-Laser-Effect",
		materials  = { "329_MT_arc_weapon_teamGlow", "329_MT_arc_teamGlow" },
		position   = { 0, 0, 0 },
		rotation   = { 0, 0, 0 },
		scale 	 = { .1, .1, .1 },
		
		--Assigns this part as a weaponVisual to the parent part's weapon, that we will use as a muzzle flash.
		--Muzzle flashes are secretly laser beams. WOW
		weaponVisualConfig = { --Controls how the visual effect behaves.
			-- Yes I know it says laser, all weapon visuals in the game are derived from the original laser effect. So even muzzle flashes are secretly "lasers".
			laserColour = {1,1,1}, 	-- RGB, 0 to 1, colour of the weaponVisual.
			intensity = 3;			-- The brightness of the laser colour.
			useWeaponLaserDescription = true, --If true, will ignore it's own laserDescription and use the weapon's defined one.
			laserDescription = { 		--"laser" description, but is actually a maleable visual effect.
			}, 
		}
	}
end

function prefab.weapon_info.laser.D(count)
	return { 3295100, 1 * count, 0 }
end
function prefab.weapon.laser.D(pos, rot, sca, isGhost, ghostIndex, ghostMat) --{float3}, {float3}, {float3}, bool
	if(ghostIndex==nil) then ghostIndex=0 end
	if(ghostMat==nil) then ghostMat="build" end
	if(ghostIndex < 0) then return {}; end
	if(not isGhost and ghostIndex < 0) then return {}; end
	prefab_part = {
		name	= "Drone Laser",
		-- mesh      = "Turrets-1/Turret-1-Base",
		-- materials = { "329_MT_arc_hull",  "329_MT_arc_teamColour", "329_MT_arc_teamGlow", "329_MT_arc_hull_dark" },
		position  = pos,    	-- float3: XYZ Relative local position of this object. Copy positions from Blender to help you out. NOTICE: Blender uses +Z as up, but this is converted to +Y (is up) when used in game.
		rotation  = rot,        			-- float3: XYZ Eular Angles, will apply rotation ZXY. Relative local rotation of this object.
		scale 	= sca,					-- float3: XYZ The nonuniform scale of the part, relative to it's parent's scale.
	}
	-- ghosts should NOT have weapons, as it causes a crash.
	if isGhost then
		if (ghostMat == "329_MT_arc_aegis") then
			prefab_part.aegisVisual = true;
		end
		prefab_part.materials = {"329_MT_arc_"..ghostIndex.."_"..ghostMat,"329_MT_arc_"..ghostIndex.."_"..ghostMat,"329_MT_arc_"..ghostIndex.."_"..ghostMat,"329_MT_arc_"..ghostIndex.."_"..ghostMat,}
	else
		prefab_part.parts={
			{
				name      = "Turret",	position  = { 0,0, 0 },	rotation  = { 0, 0, 0 },	scale 	= { 1, 1, 1 },
				weapon    = {
					weaponID = 3295100, --int: The weaponData id to be used for this weapon.
					turnSpeed = weaponStats.baseTracking*weaponStats.laser.trackingMult.D, 	--float: Degrees per second.
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
					prefab.weapon.laser_effect(),
				},
			},
		}
	end
	return prefab_part
end

function prefab.weapon_info.laser.S(count)
	return { 3295101, 1 * count, 0 }
end
function prefab.weapon.laser.S(pos, rot, sca, isGhost, ghostIndex, ghostMat) --{float3}, {float3}, {float3}, bool
	if(ghostIndex==nil) then ghostIndex=0 end
	if(ghostMat==nil) then ghostMat="build" end
	if(ghostIndex < 0) then return {}; end
	if(not isGhost and ghostIndex < 0) then return {}; end
	prefab_part = {
		name	= "Small Turret Base",
		mesh      = "Turrets-1/Turret-1-Base",
		materials = { "329_MT_arc_hull",  "329_MT_arc_teamColour", "329_MT_arc_teamGlow", "329_MT_arc_hull_dark" },
		position  = pos,    	-- float3: XYZ Relative local position of this object. Copy positions from Blender to help you out. NOTICE: Blender uses +Z as up, but this is converted to +Y (is up) when used in game.
		rotation  = rot,        			-- float3: XYZ Eular Angles, will apply rotation ZXY. Relative local rotation of this object.
		scale 	= sca,					-- float3: XYZ The nonuniform scale of the part, relative to it's parent's scale.
	}
	-- ghosts should NOT have weapons, as it causes a crash.
	if isGhost then
		if (ghostMat == "329_MT_arc_aegis") then
			prefab_part.aegisVisual = true;
		end
		prefab_part.materials = {"329_MT_arc_"..ghostIndex.."_"..ghostMat,"329_MT_arc_"..ghostIndex.."_"..ghostMat,"329_MT_arc_"..ghostIndex.."_"..ghostMat,"329_MT_arc_"..ghostIndex.."_"..ghostMat,}
	else
		prefab_part.parts={
			{
				name      = "Turret-top",	position  = { 0,.75, 0 },	rotation  = { 0, 0, 0 },	scale 	= { 1, 1, 1 },
				weapon    = {
					weaponID = 3295101, --int: The weaponData id to be used for this weapon.
					turnSpeed = weaponStats.baseTracking*weaponStats.laser.trackingMult.S, 	--float: Degrees per second.
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
						mesh       = "Turrets-1/Turret-1-Body",
						materials  = { "329_MT_arc_hull" },
						position   = { 0, -.25, 0},
						rotation   = { 0, 0, 0 },
						scale 	 = { 1, 1, 1 },
						turretBody = true, --Assigns this part as a body to the parent turret. Will rotate on a flat plan while the turret moves, giving the illusion of a 2-axis machine.
					},
					{
						name      = "Turret Barrel",
						mesh      = "Turrets-1/Turret-1-Laser", --The mesh to be used for this part, works the same as mainMesh.
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

					prefab.weapon.laser_effect(),
				},
			},
		}
	end
	return prefab_part
end

function prefab.weapon_info.laser.M(count)
	return { 3295102, 1 * count, 0 }
end
function prefab.weapon.laser.M(pos, rot, sca, isGhost, ghostIndex, ghostMat) --{float3}, {float3}, {float3}, bool
	if(ghostIndex==nil) then ghostIndex=0 end
	if(ghostMat==nil) then ghostMat="build" end
	if(ghostIndex < 0) then return {}; end
	if(not isGhost and ghostIndex < 0) then return {}; end
	prefab_part = {
		name	= "Medium Laser Base",
		mesh      = "Turrets-3/Turret-3-Base",
		materials = { "329_MT_arc_hull", "329_MT_arc_teamGlow", "329_MT_arc_hull_dark", "329_MT_arc_teamColour", },
		position  = pos,    	-- float3: XYZ Relative local position of this object. Copy positions from Blender to help you out. NOTICE: Blender uses +Z as up, but this is converted to +Y (is up) when used in game.
		rotation  = rot,        			-- float3: XYZ Eular Angles, will apply rotation ZXY. Relative local rotation of this object.
		scale 	= sca,					-- float3: XYZ The nonuniform scale of the part, relative to it's parent's scale.
		
	}
	if isGhost then
		if (ghostMat == "329_MT_arc_aegis") then
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
					weaponID = 3295102, --int: The weaponData id to be used for this weapon.
					turnSpeed = weaponStats.baseTracking*weaponStats.laser.trackingMult.M, 	--float: Degrees per second.
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
						materials  = { "329_MT_arc_teamGlow", "329_MT_arc_hull" },
						position   = { 0, .5-.875, 0},
						rotation   = { 0, 0, 0 },
						scale 	 = { 1, 1, 1 },
						turretBody = true, --Assigns this part as a body to the parent turret. Will rotate on a flat plan while the turret moves, giving the illusion of a 2-axis machine.
					},
					{
						name      = "Turret Barrel",
						mesh      = "Turrets-3/Turret-3-Laser",
						materials = { "329_MT_arc_hull", "329_MT_arc_teamGlow" },
						position  = { .15, 0, 0 },
						rotation  = { 0, 0, 0 },
						scale 	= { 1, 1, 1 },
					},
					{	name = "Turret Muzzle",	position = { .15, 0, 1.35 },	rotation = { 0, 0, 0 },	scale = { 1, 1, 1 },	barrel = true,	},		
					{
						name      = "Turret Barrel",
						mesh      = "Turrets-3/Turret-3-Laser",
						materials = { "329_MT_arc_hull", "329_MT_arc_teamGlow" },
						position  = { -.15, 0, 0 },
						rotation  = { 0, 0, 0 },
						scale 	= { 1, 1, 1 },
					},
					{	name = "Turret Muzzle",	position = { -.15, 0, 1.35 },	rotation = { 0, 0, 0 },	scale = { 1, 1, 1 },	barrel = true,	},
					prefab.weapon.laser_effect(),
					prefab.weapon.laser_effect(),
				},
			},
		}
	end
	
	return prefab_part
end

function prefab.weapon_info.laser.L(count)
	return { 3295103, 1 * count, 0 }
end
function prefab.weapon.laser.L(pos, rot, sca, isGhost, ghostIndex, ghostMat) --{float3}, {float3}, {float3}, bool
	if(ghostIndex==nil) then ghostIndex=0 end
	if(ghostMat==nil) then ghostMat="build" end
	if(ghostIndex < 0) then return {}; end
	if(not isGhost and ghostIndex < 0) then return {}; end
	prefab_part = {
		name	= "Large Laser Base",
		mesh      = "Turrets-5/Turret-5-Base",
		materials = { "329_MT_arc_hull_dark", "329_MT_arc_hull", "329_MT_arc_teamColour", "329_MT_arc_teamGlow", },
		position  = pos,    	-- float3: XYZ Relative local position of this object. Copy positions from Blender to help you out. NOTICE: Blender uses +Z as up, but this is converted to +Y (is up) when used in game.
		rotation  = rot,        			-- float3: XYZ Eular Angles, will apply rotation ZXY. Relative local rotation of this object.
		scale 	= sca,					-- float3: XYZ The nonuniform scale of the part, relative to it's parent's scale.
		
	}
	if isGhost then
		if (ghostMat == "329_MT_arc_aegis") then
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
					weaponID = 3295103, --int: The weaponData id to be used for this weapon.
					turnSpeed = weaponStats.baseTracking*weaponStats.laser.trackingMult.L, 	--float: Degrees per second.
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
						materials  = { "329_MT_arc_teamGlow", "329_MT_arc_hull" },
						position   = { 0, .5-.925, 0},
						rotation   = { 0, 0, 0 },
						scale 	 = { 1, 1, 1 },
						turretBody = true, --Assigns this part as a body to the parent turret. Will rotate on a flat plan while the turret moves, giving the illusion of a 2-axis machine.
					},
					{
						name      = "Turret Barrel Left",
						mesh      = "Turrets-5/Turret-5-Laser",
						materials = { "329_MT_arc_hull", "329_MT_arc_teamGlow" },
						position  = { -.375, 0, 0 },
						rotation  = { 0, 0, 0 },
						scale 	= { 1, 1, 1 },
					},
					{	name = "Turret Muzzle",	position = { -.375, 0, 1.7125 },	rotation = { 0, 0, 0 },	scale = { 1, 1, 1 },	barrel = true,	},		
					{
						name      = "Turret Barrel Center",
						mesh      = "Turrets-5/Turret-5-Laser",
						materials = { "329_MT_arc_hull", "329_MT_arc_teamGlow" },
						position  = { 0, 0, 0 },
						rotation  = { 0, 0, 0 },
						scale 	= { 1, 1, 1 },
					},
					{	name = "Turret Muzzle",	position = { 0, 0, 1.7125 },	rotation = { 0, 0, 0 },	scale = { 1, 1, 1 },	barrel = true,	},
					{
						name      = "Turret Barrel Right",
						mesh      = "Turrets-5/Turret-5-Laser",
						materials = { "329_MT_arc_hull", "329_MT_arc_teamGlow" },
						position  = { .375, 0, 0 },
						rotation  = { 0, 0, 0 },
						scale 	= { 1, 1, 1 },
					},
					{	name = "Turret Muzzle",	position = { .375, 0, 1.7125 },	rotation = { 0, 0, 0 },	scale = { 1, 1, 1 },	barrel = true,	},
					prefab.weapon.laser_effect(),
					prefab.weapon.laser_effect(),
					prefab.weapon.laser_effect(),
				},
			},
		}
	end
	
	return prefab_part
end

function prefab.weapon_info.laser.X(count)
	return { 3295104, 1 * count, 0 }
end
function prefab.weapon.laser.X(pos, rot, sca, isGhost, ghostIndex, ghostMat) --{float3}, {float3}, {float3}, bool
	if(ghostIndex==nil) then ghostIndex=0 end
	if(ghostMat==nil) then ghostMat="build" end
	if(ghostIndex < 0) then return {}; end
	if(not isGhost and ghostIndex < 0) then return {}; end
	prefab_part = {
		name	= "Extra Large Laser Base",
		mesh      = "Turrets-7/Turret-7-Base",
		materials = { "329_MT_arc_hull_dark", "329_MT_arc_hull", "329_MT_arc_teamColour", "329_MT_arc_teamGlow", },
		position  = pos,    	-- float3: XYZ Relative local position of this object. Copy positions from Blender to help you out. NOTICE: Blender uses +Z as up, but this is converted to +Y (is up) when used in game.
		rotation  = rot,        			-- float3: XYZ Eular Angles, will apply rotation ZXY. Relative local rotation of this object.
		scale 	= sca,					-- float3: XYZ The nonuniform scale of the part, relative to it's parent's scale.
		
	}
	if isGhost then
		if (ghostMat == "329_MT_arc_aegis") then
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
					weaponID = 3295104, --int: The weaponData id to be used for this weapon.
					turnSpeed = weaponStats.baseTracking*weaponStats.laser.trackingMult.X, 	--float: Degrees per second.
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
						mesh       = "Turrets-7/Turret-7-Body",
						materials  = { "329_MT_arc_teamGlow", "329_MT_arc_hull" },
						position   = { 0, .5-1.125, 0},
						rotation   = { 0, 0, 0 },
						scale 	 = { 1, 1, 1 },
						turretBody = true, --Assigns this part as a body to the parent turret. Will rotate on a flat plan while the turret moves, giving the illusion of a 2-axis machine.
					},
					{
						name      = "Turret Barrel Left",
						mesh      = "Turrets-7/Turret-7-Laser",
						materials = { "329_MT_arc_hull", "329_MT_arc_teamGlow" },
						position  = { -.735, 0, 0 },
						rotation  = { 0, 0, 0 },
						scale 	= { 1, 1, 1 },
					},
					{	name = "Turret Muzzle",	position = { -.735, 0, 2.2125 },	rotation = { 0, 0, 0 },	scale = { 1, 1, 1 },	barrel = true,	},		
					{
						name      = "Turret Barrel Center Left",
						mesh      = "Turrets-7/Turret-7-Laser",
						materials = { "329_MT_arc_hull", "329_MT_arc_teamGlow" },
						position  = { -.245, 0, 0 },
						rotation  = { 0, 0, 0 },
						scale 	= { 1, 1, 1 },
					},
					{	name = "Turret Muzzle",	position = { -.245, 0, 2.2125 },	rotation = { 0, 0, 0 },	scale = { 1, 1, 1 },	barrel = true,	},		
					
					{
						name      = "Turret Barrel Center Right",
						mesh      = "Turrets-7/Turret-7-Laser",
						materials = { "329_MT_arc_hull", "329_MT_arc_teamGlow" },
						position  = { .245, 0, 0 },
						rotation  = { 0, 0, 0 },
						scale 	= { 1, 1, 1 },
					},
					{	name = "Turret Muzzle",	position = { .245, 0, 2.2125 },	rotation = { 0, 0, 0 },	scale = { 1, 1, 1 },	barrel = true,	},		
					{
						name      = "Turret Barrel Right",
						mesh      = "Turrets-7/Turret-7-Laser",
						materials = { "329_MT_arc_hull", "329_MT_arc_teamGlow" },
						position  = { .735, 0, 0 },
						rotation  = { 0, 0, 0 },
						scale 	= { 1, 1, 1 },
					},
					{	name = "Turret Muzzle",	position = { .735, 0, 2.2125 },	rotation = { 0, 0, 0 },	scale = { 1, 1, 1 },	barrel = true,	},
					
					
					prefab.weapon.laser_effect(),
					prefab.weapon.laser_effect(),
					prefab.weapon.laser_effect(),
					prefab.weapon.laser_effect(),
				},
			},
		}
	end
	
	return prefab_part
end

function prefab.weapon_info.laser.XS(count)
	return { 3295104, 1 * count, 0 }
end
function prefab.weapon.laser.XS(pos, rot, sca, isGhost, ghostIndex, ghostMat) --{float3}, {float3}, {float3}, bool
	if(ghostIndex==nil) then ghostIndex=0 end
	if(ghostMat==nil) then ghostMat="build" end
	if(ghostIndex < 0) then return {}; end
	if(not isGhost and ghostIndex < 0) then return {}; end
	prefab_part = {
		name	= "Extra Large Laser Base",
		-- mesh      = "Turrets-5/Turret-5-Base",
		-- materials = { "329_MT_arc_hull_dark", "329_MT_arc_hull", "329_MT_arc_teamColour", "329_MT_arc_teamGlow", },
		position  = pos,    	-- float3: XYZ Relative local position of this object. Copy positions from Blender to help you out. NOTICE: Blender uses +Z as up, but this is converted to +Y (is up) when used in game.
		rotation  = rot,        			-- float3: XYZ Eular Angles, will apply rotation ZXY. Relative local rotation of this object.
		scale 	= sca,					-- float3: XYZ The nonuniform scale of the part, relative to it's parent's scale.
		
	}
	if isGhost then
		if (ghostMat == "329_MT_arc_aegis") then
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
					weaponID = 3295104, --int: The weaponData id to be used for this weapon.
					turnSpeed = weaponStats.baseTracking*weaponStats.laser.trackingMult.X, 	--float: Degrees per second.
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
					prefab.weapon.laser_effect(),
				},
			},
		}
	end
	
	return prefab_part
end

function prefab.weapon_info.laser.TS(count)
	return { 3295105, 1 * count, 0 }
end
function prefab.weapon.laser.TS(pos, rot, sca, isGhost, ghostIndex, ghostMat) --{float3}, {float3}, {float3}, bool
	if(ghostIndex==nil) then ghostIndex=0 end
	if(ghostMat==nil) then ghostMat="build" end
	if(ghostIndex < 0) then return {}; end
	if(not isGhost and ghostIndex < 0) then return {}; end
	prefab_part = {
		name	= "Titanic Laser Base",
		-- mesh      = "Turrets-5/Turret-5-Base",
		-- materials = { "329_MT_arc_hull_dark", "329_MT_arc_hull", "329_MT_arc_teamColour", "329_MT_arc_teamGlow", },
		position  = pos,    	-- float3: XYZ Relative local position of this object. Copy positions from Blender to help you out. NOTICE: Blender uses +Z as up, but this is converted to +Y (is up) when used in game.
		rotation  = rot,        			-- float3: XYZ Eular Angles, will apply rotation ZXY. Relative local rotation of this object.
		scale 	= sca,					-- float3: XYZ The nonuniform scale of the part, relative to it's parent's scale.
		
	}
	if isGhost then
		if (ghostMat == "329_MT_arc_aegis") then
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
					weaponID = 3295105, --int: The weaponData id to be used for this weapon.
					turnSpeed = weaponStats.baseTracking*weaponStats.laser.trackingMult.T, 	--float: Degrees per second.
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
					prefab.weapon.laser_effect(),
				},
			},
		}
	end
	
	return prefab_part
end