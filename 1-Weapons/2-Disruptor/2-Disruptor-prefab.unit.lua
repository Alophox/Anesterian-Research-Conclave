prefab.weapon.disruptor = {}
prefab.weapon_info.disruptor = {}

function prefab.weapon_info.disruptor.S(count)
	return { 3295201, 1 * count, 3296201 }
end
function prefab.weapon.disruptor.S(pos, rot, sca, isGhost, ghostIndex, ghostMat)
	if(ghostIndex==nil) then ghostIndex=0 end
	if(ghostMat==nil) then ghostMat="arc_build" end
	if(ghostIndex < 0) then return {}; end
	if(not isGhost and ghostIndex < 0) then return {}; end
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
		if (ghostMat == "arc_aegis") then
			prefab_part.aegisVisual = true;
		end
		prefab_part.materials = {ghostIndex.."_"..ghostMat,ghostIndex.."_"..ghostMat,ghostIndex.."_"..ghostMat,ghostIndex.."_"..ghostMat,}
	else
		prefab_part.parts={
			{
				name      = "Turret-top",
				position  = { 0, .75, 0 },    	-- float3: XYZ Relative local position of this object. Copy positions from Blender to help you out. NOTICE: Blender uses +Z as up, but this is converted to +Y (is up) when used in game.
				rotation  = { 0, 0, 0 },        			-- float3: XYZ Eular Angles, will apply rotation ZXY. Relative local rotation of this object.
				scale 	= { 1, 1, 1 },					-- float3: XYZ The nonuniform scale of the part, relative to it's parent's scale.

				weapon    = {
					weaponID = 3295201, --int: The weaponData id to be used for this weapon.
					turnSpeed = weaponStats.baseTracking*weaponStats.disruptor.trackingMult.S, 	--float: Degrees per second.
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
						mesh      = "Turrets-1/Turret-1-Disruptor", --The mesh to be used for this part, works the same as mainMesh.
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

					{
						name		 = "Muzzle Flash",
						mesh       = "Thruster/Thruster-Plume",
						materials  = { "arc_muzzleFlash_teamGlow" },
						position   = { 0, 0, 0 },
						rotation   = { 180, 180, 180 },
						scale 	 = { .1, .1, .001 },
						
						--Assigns this part as a weaponVisual to the parent part's weapon, that we will use as a muzzle flash.
						--Muzzle flashes are secretly laser beams. WOW
						weaponVisualConfig = { --Controls how the visual effect behaves.
							-- Yes I know it says laser, all weapon visuals in the game are derived from the original laser effect. So even muzzle flashes are secretly "lasers".
							laserColour = {.5,1,1}, 	-- RGB, 0 to 1, colour of the weaponVisual.
							intensity = 3;			-- The brightness of the laser colour.
							useWeaponLaserDescription = true, --If true, will ignore it's own laserDescription and use the weapon's defined one.
							laserDescription = {
							}, 
						}
						
					},
				},
			},
		}
	end
	return prefab_part
end

function prefab.weapon_info.disruptor.M(count)
	return { 3295202, 1 * count, 3296202 }
end
function prefab.weapon.disruptor.M(pos, rot, sca, isGhost, ghostIndex, ghostMat)
	if(ghostIndex==nil) then ghostIndex=0 end
	if(ghostMat==nil) then ghostMat="arc_build" end
	if(ghostIndex < 0) then return {}; end
	if(not isGhost and ghostIndex < 0) then return {}; end
	prefab_part = {
		name	= "Medium Disruptor Base",
		mesh      = "Turrets-3/Turret-3-Base",
		materials = { "arc_hull", "arc_teamGlow", "arc_hull_dark", "arc_teamColour", },
		position  = pos,    	-- float3: XYZ Relative local position of this object. Copy positions from Blender to help you out. NOTICE: Blender uses +Z as up, but this is converted to +Y (is up) when used in game.
		rotation  = rot,        			-- float3: XYZ Eular Angles, will apply rotation ZXY. Relative local rotation of this object.
		scale 	= sca,					-- float3: XYZ The nonuniform scale of the part, relative to it's parent's scale.
	}
	-- ghosts should NOT have weapons, as it causes a crash.
	if isGhost then
		if (ghostMat == "arc_aegis") then
			prefab_part.aegisVisual = true;
		end
		prefab_part.materials = {ghostIndex.."_"..ghostMat,ghostIndex.."_"..ghostMat,ghostIndex.."_"..ghostMat,ghostIndex.."_"..ghostMat,}
	else
		prefab_part.parts={
			{
				name      = "Turret-top",
				position  = { 0, .875, 0 },    	-- float3: XYZ Relative local position of this object. Copy positions from Blender to help you out. NOTICE: Blender uses +Z as up, but this is converted to +Y (is up) when used in game.
				rotation  = { 0, 0, 0 },        			-- float3: XYZ Eular Angles, will apply rotation ZXY. Relative local rotation of this object.
				scale 	= { 1, 1, 1 },					-- float3: XYZ The nonuniform scale of the part, relative to it's parent's scale.

				weapon    = {
					weaponID = 3295202, --int: The weaponData id to be used for this weapon.
					turnSpeed = weaponStats.baseTracking*weaponStats.disruptor.trackingMult.M, 	--float: Degrees per second.
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
						mesh      = "Turrets-3/Turret-3-Disruptor",
						materials = { "arc_hull", "arc_teamGlow" },
						position  = { .15, 0, 0 },
						rotation  = { 0, 0, 0 },
						scale 	= { 1, 1, 1 },
					},
					{	name = "Turret Muzzle",	position = { .15, 0, 1.35 },	rotation = { 0, 0, 0 },	scale = { 1, 1, 1 },	barrel = true,	},		
					{
						name      = "Turret Barrel",
						mesh      = "Turrets-3/Turret-3-Disruptor",
						materials = { "arc_hull", "arc_teamGlow" },
						position  = { -.15, 0, 0 },
						rotation  = { 0, 0, 0 },
						scale 	= { 1, 1, 1 },
					},
					{	name = "Turret Muzzle",	position = { -.15, 0, 1.35 },	rotation = { 0, 0, 0 },	scale = { 1, 1, 1 },	barrel = true,	},		

					{
						name		 = "Muzzle Flash",
						mesh       = "Thruster/Thruster-Plume",
						materials  = { "arc_muzzleFlash_teamGlow" },
						position   = { 0, 0, 0 },
						rotation   = { 180, 180, 180 },
						scale 	 = { .1, .1, .001 },
						
						--Assigns this part as a weaponVisual to the parent part's weapon, that we will use as a muzzle flash.
						--Muzzle flashes are secretly laser beams. WOW
						weaponVisualConfig = { --Controls how the visual effect behaves.
							-- Yes I know it says laser, all weapon visuals in the game are derived from the original laser effect. So even muzzle flashes are secretly "lasers".
							laserColour = {.5,1,1}, 	-- RGB, 0 to 1, colour of the weaponVisual.
							intensity = 3;			-- The brightness of the laser colour.
							useWeaponLaserDescription = true, --If true, will ignore it's own laserDescription and use the weapon's defined one.
							laserDescription = {
							},
						}
					},
				},
			},
		}
	end
	return prefab_part
end

function prefab.weapon_info.disruptor.L(count)
	return { 3295203, 1 * count, 3296203 }
end
function prefab.weapon.disruptor.L(pos, rot, sca, isGhost, ghostIndex, ghostMat)
	if(ghostIndex==nil) then ghostIndex=0 end
	if(ghostMat==nil) then ghostMat="arc_build" end
	if(ghostIndex < 0) then return {}; end
	if(not isGhost and ghostIndex < 0) then return {}; end
	prefab_part = {
		name	= "Large Disruptor Base",
		mesh      = "Turrets-5/Turret-5-Base",
		materials = { "arc_hull_dark", "arc_hull", "arc_teamColour", "arc_teamGlow", },
		position  = pos,    	-- float3: XYZ Relative local position of this object. Copy positions from Blender to help you out. NOTICE: Blender uses +Z as up, but this is converted to +Y (is up) when used in game.
		rotation  = rot,        			-- float3: XYZ Eular Angles, will apply rotation ZXY. Relative local rotation of this object.
		scale 	= sca,					-- float3: XYZ The nonuniform scale of the part, relative to it's parent's scale.
	}
	-- ghosts should NOT have weapons, as it causes a crash.
	if isGhost then
		if (ghostMat == "arc_aegis") then
			prefab_part.aegisVisual = true;
		end
		prefab_part.materials = {ghostIndex.."_"..ghostMat,ghostIndex.."_"..ghostMat,ghostIndex.."_"..ghostMat,ghostIndex.."_"..ghostMat,}
	else
		prefab_part.parts={
			{
				name      = "Turret-top",
				position  = { 0, .925, 0 },    	-- float3: XYZ Relative local position of this object. Copy positions from Blender to help you out. NOTICE: Blender uses +Z as up, but this is converted to +Y (is up) when used in game.
				rotation  = { 0, 0, 0 },        			-- float3: XYZ Eular Angles, will apply rotation ZXY. Relative local rotation of this object.
				scale 	= { 1, 1, 1 },					-- float3: XYZ The nonuniform scale of the part, relative to it's parent's scale.

				weapon    = {
					weaponID = 3295203, --int: The weaponData id to be used for this weapon.
					turnSpeed = weaponStats.baseTracking*weaponStats.disruptor.trackingMult.L, 	--float: Degrees per second.
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
						mesh      = "Turrets-5/Turret-5-Disruptor",
						materials = { "arc_hull", "arc_teamGlow" },
						position  = { -.375, 0, 0 },
						rotation  = { 0, 0, 0 },
						scale 	= { 1, 1, 1 },
					},
					{	name = "Turret Muzzle",	position = { -.375, 0, 1.7125 },	rotation = { 0, 0, 0 },	scale = { 1, 1, 1 },	barrel = true,	},		
					{
						name      = "Turret Barrel Center",
						mesh      = "Turrets-5/Turret-5-Disruptor",
						materials = { "arc_hull", "arc_teamGlow" },
						position  = { 0, 0, 0 },
						rotation  = { 0, 0, 0 },
						scale 	= { 1, 1, 1 },
					},
					{	name = "Turret Muzzle",	position = { 0, 0, 1.7125 },	rotation = { 0, 0, 0 },	scale = { 1, 1, 1 },	barrel = true,	},
					{
						name      = "Turret Barrel Right",
						mesh      = "Turrets-5/Turret-5-Disruptor",
						materials = { "arc_hull", "arc_teamGlow" },
						position  = { .375, 0, 0 },
						rotation  = { 0, 0, 0 },
						scale 	= { 1, 1, 1 },
					},
					{	name = "Turret Muzzle",	position = { .375, 0, 1.7125 },	rotation = { 0, 0, 0 },	scale = { 1, 1, 1 },	barrel = true,	},		

					{
						name		 = "Muzzle Flash",
						mesh       = "Thruster/Thruster-Plume",
						materials  = { "arc_muzzleFlash_teamGlow" },
						position   = { 0, 0, 0 },
						rotation   = { 180, 180, 180 },
						scale 	 = { .1, .1, .001 },
						
						--Assigns this part as a weaponVisual to the parent part's weapon, that we will use as a muzzle flash.
						--Muzzle flashes are secretly laser beams. WOW
						weaponVisualConfig = { --Controls how the visual effect behaves.
							-- Yes I know it says laser, all weapon visuals in the game are derived from the original laser effect. So even muzzle flashes are secretly "lasers".
							laserColour = {.5,1,1}, 	-- RGB, 0 to 1, colour of the weaponVisual.
							intensity = 3;			-- The brightness of the laser colour.
							useWeaponLaserDescription = true, --If true, will ignore it's own laserDescription and use the weapon's defined one.
							laserDescription = {
							},
						}
					},
				},
			},
		}
	end
	return prefab_part
end