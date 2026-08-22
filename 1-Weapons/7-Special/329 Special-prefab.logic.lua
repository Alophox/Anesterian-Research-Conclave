prefab.weapon.special = {}
prefab.weapon_info.special = {}


function prefab.weapon_info.special.spawn_shield(count)
-- ...don't want stats for this showing
end
function prefab.weapon.special.spawn_shield(pos, rot, sca, isGhost, ghostIndex, ghostMat) --{float3}, {float3}, {float3}, bool
	if(ghostIndex==nil) then ghostIndex=0 end
	if(ghostMat==nil) then ghostMat="build" end
	if(ghostIndex < 0) then return {}; end
	prefab_part = {
		name	= "Spawn Shield",
		position  = pos,    	-- float3: XYZ Relative local position of this object. Copy positions from Blender to help you out. NOTICE: Blender uses +Z as up, but this is converted to +Y (is up) when used in game.
		rotation  = rot,        			-- float3: XYZ Eular Angles, will apply rotation ZXY. Relative local rotation of this object.
		scale 	= sca,					-- float3: XYZ The nonuniform scale of the part, relative to it's parent's scale.
	}
	-- ghosts should NOT have weapons, as it causes a crash.
	if isGhost then
		if (ghostMat == "aegis_teamColour") then
			prefab_part.aegisVisual = true;
		end
		prefab_part.materials = {"329_MT_arc_"..ghostIndex.."_"..ghostMat,"329_MT_arc_"..ghostIndex.."_"..ghostMat,"329_MT_arc_"..ghostIndex.."_"..ghostMat,"329_MT_arc_"..ghostIndex.."_"..ghostMat,}
	else
		prefab_part.parts={
			{
				name      = "Turret",	position  = { 0,0, 0 },	rotation  = { 0, 0, 0 },	scale 	= { 1, 1, 1 },
				weapon    = {
					weaponID = 3295701, --int: The weaponData id to be used for this weapon.
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

function prefab.weapon_info.special.stardust_repair(count)
	return { 3295703, 1 * count, 0 }
end
function prefab.weapon.special.stardust_repair(pos, rot, sca, isGhost, ghostIndex, ghostMat) --{float3}, {float3}, {float3}, bool
	if(ghostIndex==nil) then ghostIndex=0 end
	if(ghostMat==nil) then ghostMat="build" end
	if(ghostIndex < 0) then return {}; end
	prefab_part = {
		name	= "Stardust Repair",
		position  = pos,    	-- float3: XYZ Relative local position of this object. Copy positions from Blender to help you out. NOTICE: Blender uses +Z as up, but this is converted to +Y (is up) when used in game.
		rotation  = rot,        			-- float3: XYZ Eular Angles, will apply rotation ZXY. Relative local rotation of this object.
		scale 	= sca,					-- float3: XYZ The nonuniform scale of the part, relative to it's parent's scale.
	}
	-- ghosts should NOT have weapons, as it causes a crash.
	if isGhost then
		if (ghostMat == "aegis_teamColour") then
			prefab_part.aegisVisual = true;
		end
		prefab_part.materials = {"329_MT_arc_"..ghostIndex.."_"..ghostMat,"329_MT_arc_"..ghostIndex.."_"..ghostMat,"329_MT_arc_"..ghostIndex.."_"..ghostMat,"329_MT_arc_"..ghostIndex.."_"..ghostMat,}
	else
		prefab_part.parts={
			{
				name      = "Turret",	position  = { 0,0, 0 },	rotation  = { 0, 0, 0 },	scale 	= { 1, 1, 1 },
				weapon    = {
					weaponID = 3295703, --int: The weaponData id to be used for this weapon.
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

function prefab.weapon_info.special.gwe(count)
	return { 3295704, 1 * count, 0 }
end
function prefab.weapon.special.gwe(pos, rot, sca, isGhost, ghostIndex, ghostMat) --{float3}, {float3}, {float3}, bool
	if(ghostIndex==nil) then ghostIndex=0 end
	if(ghostMat==nil) then ghostMat="build" end
	if(ghostIndex < 0) then return {}; end
	prefab_part = {
		name	= "Gravitational Wave Ejector",
		position  = pos,    	-- float3: XYZ Relative local position of this object. Copy positions from Blender to help you out. NOTICE: Blender uses +Z as up, but this is converted to +Y (is up) when used in game.
		rotation  = rot,        			-- float3: XYZ Eular Angles, will apply rotation ZXY. Relative local rotation of this object.
		scale 	= sca,					-- float3: XYZ The nonuniform scale of the part, relative to it's parent's scale.
	}
	-- ghosts should NOT have weapons, as it causes a crash.
	if isGhost then
		if (ghostMat == "aegis_teamColour") then
			prefab_part.aegisVisual = true;
		end
		prefab_part.materials = {"329_MT_arc_"..ghostIndex.."_"..ghostMat,"329_MT_arc_"..ghostIndex.."_"..ghostMat,"329_MT_arc_"..ghostIndex.."_"..ghostMat,"329_MT_arc_"..ghostIndex.."_"..ghostMat,}
	else
		prefab_part.parts={
			{
				name      = "Turret",	position  = { 0,0, 0 },	rotation  = { 0, 0, 0 },	scale 	= { 1, 1, 1 },
				weapon    = {
					weaponID = 3295704, --int: The weaponData id to be used for this weapon.
					turnSpeed = 5, 	--float: Degrees per second.
					turnMode = "Linear", --string enum: Linear / Acceleration
					turnInstant = false, --bool: Ignore turn speed, snap to target. (Beam Spire, point defence)
					mountAngles = { -- Weapon's firing angles in degrees. Won't aquire targets outside this field of view.
						left = 5, --float:
						right = 5,--float:
						up = 5,	 --float:
						down = 5  --float:
					},
				},

				parts={
					{
						name		 = "Turret Cone",
						mesh       = "329-Turrets-1/Turret-1-Cone-Effect",
						materials  = { "329_MT_arc_vortex_gwe" },
						position   = { 0, 0, 0 },
						rotation   = { 0, 0, 0 },
						scale 	 = { .1, .1, .1 },
						
						--Assigns this part as a weaponVisual to the parent part's weapon, that we will use as a muzzle flash.
						--Muzzle flashes are secretly laser beams. WOW
						weaponVisualConfig = { --Controls how the visual effect behaves.
							-- Yes I know it says laser, all weapon visuals in the game are derived from the original laser effect. So even muzzle flashes are secretly "lasers".
							laserColour = {1,1,1}, 	-- RGB, 0 to 1, colour of the weaponVisual.
							intensity = 3;			-- The brightness of the laser colour.
							useWeaponLaserDescription = false, --If true, will ignore it's own laserDescription and use the weapon's defined one.
							laserDescription = { 		--"laser" description, but is actually a maleable visual effect.
								duration = 5,			--seconds
								opacity = .1,			--float, 0-1
								diameter = weaponStats.gwe.coneWidth,			--relative to turret scale
								offset = 0,			--relative to the barrel it gets fired from's facing.
								rotateZ = false,		--Rotate the effect once randomly on the z axis when used.
								rotateY = false,		--Rotate the effect once randomly on the y axis when used.
								rotateZUpdate = false,	--Continuously rotate the effect on the z axis when used.
								rotateYUpdate = false,	--COntinuously rotate the effect on the y axis when used.
								noRescaleLength = weaponStats.gwe.baseAOE,	--0 means DO rescale like a laser beam. >0 means don't, like a muzzle flashes.
								noFade = false,			--prevents the effect from fading to nothing over it's duration.
								noShrink = true,		--prevents the effect from scaling down to nothing over it's duration.
							}, 	
						}, 
					}
				}
				
			},

		}
	end
	return prefab_part
end

-- should be noted that these don't actually do anything, it's all a part of the unit itself...
function prefab.weapon_info.special.sensor_em(count)
	return { 3295710, 1 * count, 0 }
end
function prefab.weapon.special.sensor_em(pos, rot, sca, isGhost, ghostIndex, ghostMat) --{float3}, {float3}, {float3}, bool
	if(ghostIndex==nil) then ghostIndex=0 end
	if(ghostMat==nil) then ghostMat="build" end
	if(ghostIndex < 0) then return {}; end
	prefab_part = {
		name	= "Sensor Suite",
		position  = pos,    	-- float3: XYZ Relative local position of this object. Copy positions from Blender to help you out. NOTICE: Blender uses +Z as up, but this is converted to +Y (is up) when used in game.
		rotation  = rot,        			-- float3: XYZ Eular Angles, will apply rotation ZXY. Relative local rotation of this object.
		scale 	= sca,					-- float3: XYZ The nonuniform scale of the part, relative to it's parent's scale.
	}
	-- ghosts should NOT have weapons, as it causes a crash.
	if isGhost then
		if (ghostMat == "aegis_teamColour") then
			prefab_part.aegisVisual = true;
		end
		prefab_part.materials = {"329_MT_arc_"..ghostIndex.."_"..ghostMat,"329_MT_arc_"..ghostIndex.."_"..ghostMat,"329_MT_arc_"..ghostIndex.."_"..ghostMat,"329_MT_arc_"..ghostIndex.."_"..ghostMat,}
	else
		prefab_part.parts={
			{
				name      = "Turret",	position  = { 0,0, 0 },	rotation  = { 0, 0, 0 },	scale 	= { 1, 1, 1 },
				weapon    = {
					weaponID = 3295710, --int: The weaponData id to be used for this weapon.
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
function prefab.weapon_info.special.sensor_gravitic(count)
	return { 3295711, 1 * count, 0 }
end
function prefab.weapon.special.sensor_gravitic(pos, rot, sca, isGhost, ghostIndex, ghostMat) --{float3}, {float3}, {float3}, bool
	if(ghostIndex==nil) then ghostIndex=0 end
	if(ghostMat==nil) then ghostMat="build" end
	if(ghostIndex < 0) then return {}; end
	prefab_part = {
		name	= "Sensor Suite",
		position  = pos,    	-- float3: XYZ Relative local position of this object. Copy positions from Blender to help you out. NOTICE: Blender uses +Z as up, but this is converted to +Y (is up) when used in game.
		rotation  = rot,        			-- float3: XYZ Eular Angles, will apply rotation ZXY. Relative local rotation of this object.
		scale 	= sca,					-- float3: XYZ The nonuniform scale of the part, relative to it's parent's scale.
	}
	-- ghosts should NOT have weapons, as it causes a crash.
	if isGhost then
		if (ghostMat == "aegis_teamColour") then
			prefab_part.aegisVisual = true;
		end
		prefab_part.materials = {"329_MT_arc_"..ghostIndex.."_"..ghostMat,"329_MT_arc_"..ghostIndex.."_"..ghostMat,"329_MT_arc_"..ghostIndex.."_"..ghostMat,"329_MT_arc_"..ghostIndex.."_"..ghostMat,}
	else
		prefab_part.parts={
			{
				name      = "Turret",	position  = { 0,0, 0 },	rotation  = { 0, 0, 0 },	scale 	= { 1, 1, 1 },
				weapon    = {
					weaponID = 3295711, --int: The weaponData id to be used for this weapon.
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
function prefab.weapon_info.special.sensor_subspace(count)
	return { 3295712, 1 * count, 0 }
end
function prefab.weapon.special.sensor_subspace(pos, rot, sca, isGhost, ghostIndex, ghostMat) --{float3}, {float3}, {float3}, bool
	if(ghostIndex==nil) then ghostIndex=0 end
	if(ghostMat==nil) then ghostMat="build" end
	if(ghostIndex < 0) then return {}; end
	prefab_part = {
		name	= "Sensor Suite",
		position  = pos,    	-- float3: XYZ Relative local position of this object. Copy positions from Blender to help you out. NOTICE: Blender uses +Z as up, but this is converted to +Y (is up) when used in game.
		rotation  = rot,        			-- float3: XYZ Eular Angles, will apply rotation ZXY. Relative local rotation of this object.
		scale 	= sca,					-- float3: XYZ The nonuniform scale of the part, relative to it's parent's scale.
	}
	-- ghosts should NOT have weapons, as it causes a crash.
	if isGhost then
		if (ghostMat == "aegis_teamColour") then
			prefab_part.aegisVisual = true;
		end
		prefab_part.materials = {"329_MT_arc_"..ghostIndex.."_"..ghostMat,"329_MT_arc_"..ghostIndex.."_"..ghostMat,"329_MT_arc_"..ghostIndex.."_"..ghostMat,"329_MT_arc_"..ghostIndex.."_"..ghostMat,}
	else
		prefab_part.parts={
			{
				name      = "Turret",	position  = { 0,0, 0 },	rotation  = { 0, 0, 0 },	scale 	= { 1, 1, 1 },
				weapon    = {
					weaponID = 3295712, --int: The weaponData id to be used for this weapon.
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
function prefab.weapon_info.special.sensor_tachyon(count)
	return { 3295713, 1 * count, 0 }
end
function prefab.weapon.special.sensor_tachyon(pos, rot, sca, isGhost, ghostIndex, ghostMat) --{float3}, {float3}, {float3}, bool
	if(ghostIndex==nil) then ghostIndex=0 end
	if(ghostMat==nil) then ghostMat="build" end
	if(ghostIndex < 0) then return {}; end
	prefab_part = {
		name	= "Sensor Suite",
		position  = pos,    	-- float3: XYZ Relative local position of this object. Copy positions from Blender to help you out. NOTICE: Blender uses +Z as up, but this is converted to +Y (is up) when used in game.
		rotation  = rot,        			-- float3: XYZ Eular Angles, will apply rotation ZXY. Relative local rotation of this object.
		scale 	= sca,					-- float3: XYZ The nonuniform scale of the part, relative to it's parent's scale.
	}
	-- ghosts should NOT have weapons, as it causes a crash.
	if isGhost then
		if (ghostMat == "aegis_teamColour") then
			prefab_part.aegisVisual = true;
		end
		prefab_part.materials = {"329_MT_arc_"..ghostIndex.."_"..ghostMat,"329_MT_arc_"..ghostIndex.."_"..ghostMat,"329_MT_arc_"..ghostIndex.."_"..ghostMat,"329_MT_arc_"..ghostIndex.."_"..ghostMat,}
	else
		prefab_part.parts={
			{
				name      = "Turret",	position  = { 0,0, 0 },	rotation  = { 0, 0, 0 },	scale 	= { 1, 1, 1 },
				weapon    = {
					weaponID = 3295713, --int: The weaponData id to be used for this weapon.
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