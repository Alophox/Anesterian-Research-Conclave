prefab.weapon.missile = {
	vls = {},
	hls = {}
}
prefab.weapon_info.missile = {
	vls = {},
	hls = {}
}

function prefab.weapon_info.missile.vls.S(count)
	return { 3296011, 1 * count, -2 } -- -2 gets payload information for spawned unit from the launcher
end
function prefab.weapon.missile.vls.S(pos, rot, sca, isGhost, ghostIndex, ghostMat)
	if(ghostIndex==nil) then ghostIndex=0 end
	if(ghostMat==nil) then ghostMat="build" end
	if(ghostIndex < 0) then return {}; end
	prefab_part = {
		name	= "Small VLS",
		mesh      = "329-Missiles/Missile-1-VLS",
		materials = { "329_MT_arc_hull", "329_MT_arc_teamGlow", "329_MT_arc_hull_dark", "329_MT_arc_teamColour" },
		position  = pos,
		rotation  = rot,
		scale 	= sca,
	}
	-- ghosts should NOT have weapons, as it causes a crash.
	if isGhost then
		if (ghostMat == "aegis_teamColour") then
			prefab_part.aegisVisual = true;
		end
		prefab_part.materials = {"329_MT_arc_"..ghostIndex.."_"..ghostMat,"329_MT_arc_"..ghostIndex.."_"..ghostMat,"329_MT_arc_"..ghostIndex.."_"..ghostMat,"329_MT_arc_"..ghostIndex.."_"..ghostMat,}
	else
		prefab_part.weapon = {
			weaponID = 3295001, --int: The weaponData id to be used for this weapon.
			turnSpeed = 0, 	--float: Degrees per second.
			turnMode = "Linear", --string enum: Linear / Acceleration
			turnInstant = false, --bool: Ignore turn speed, snap to target. (Beam Spire, point defence)
			
			mountAngles = { -- Weapon's firing angles in degrees. Won't aquire targets outside this field of view.
				left = 180, --float:
				right = 180,--float:
				up = 90,	 --float:
				down = 90  --float:
			},
		}
		prefab_part.parts = {
			{
				name      = "Muzzle",
				position  = { 0, 0, -.4 },
				rotation  = { 0, 0, 0 },
				scale 	= { 1, 1, 1 },
				barrel    = true, --Assigns this part as a barrel to the parent's weapon. Barrels are where lasers, units, and weaponVisuals are placed or fired from.
			},
		}
	end
	return prefab_part
end
function prefab.weapon_info.missile.vls.M(count)
	return { 3296012, 1 * count, -2 }
end
function prefab.weapon.missile.vls.M(pos, rot, sca, isGhost, ghostIndex, ghostMat)
	if(ghostIndex==nil) then ghostIndex=0 end
	if(ghostMat==nil) then ghostMat="build" end
	if(ghostIndex < 0) then return {}; end
	prefab_part = {
		name	= "Medium VLS",
		mesh      = "329-Missiles/Missile-2-VLS",
		materials = { "329_MT_arc_hull", "329_MT_arc_teamGlow", "329_MT_arc_hull_dark", "329_MT_arc_teamColour" },
		position  = pos,
		rotation  = rot,
		scale 	= sca,
	}
	-- ghosts should NOT have weapons, as it causes a crash.
	if isGhost then
		if (ghostMat == "aegis_teamColour") then
			prefab_part.aegisVisual = true;
		end
		prefab_part.materials = {"329_MT_arc_"..ghostIndex.."_"..ghostMat,"329_MT_arc_"..ghostIndex.."_"..ghostMat,"329_MT_arc_"..ghostIndex.."_"..ghostMat,"329_MT_arc_"..ghostIndex.."_"..ghostMat,}
	else
		prefab_part.weapon = {
			weaponID = 3295002, --int: The weaponData id to be used for this weapon.
			turnSpeed = 0, 	--float: Degrees per second.
			turnMode = "Linear", --string enum: Linear / Acceleration
			turnInstant = false, --bool: Ignore turn speed, snap to target. (Beam Spire, point defence)
			mountAngles = { -- Weapon's firing angles in degrees. Won't aquire targets outside this field of view.
				left = 180, --float:
				right = 180,--float:
				up = 90,	 --float:
				down = 90  --float:
			},
		}
		prefab_part.parts = {
			{
				name      = "Muzzle",
				position  = { 0, 0, -.6 },
				rotation  = { 0, 0, 0 },
				scale 	= { 1, 1, 1 },
				barrel    = true, --Assigns this part as a barrel to the parent's weapon. Barrels are where lasers, units, and weaponVisuals are placed or fired from.
			},
		}
	end
	return prefab_part
end
function prefab.weapon_info.missile.vls.L(count)
	return { 3296013, 1 * count, -2 }
end
function prefab.weapon.missile.vls.L(pos, rot, sca, isGhost, ghostIndex, ghostMat)
	if(ghostIndex==nil) then ghostIndex=0 end
	if(ghostMat==nil) then ghostMat="build" end
	if(ghostIndex < 0) then return {}; end
	prefab_part = {
		name	= "Large VLS",
		mesh      = "329-Missiles/Missile-3-VLS",
		materials = { "329_MT_arc_hull", "329_MT_arc_teamGlow", "329_MT_arc_hull_dark", "329_MT_arc_teamColour" },
		position  = pos,
		rotation  = rot,
		scale 	= sca,
	}
	-- ghosts should NOT have weapons, as it causes a crash.
	if isGhost then
		if (ghostMat == "aegis_teamColour") then
			prefab_part.aegisVisual = true;
		end
		prefab_part.materials = {"329_MT_arc_"..ghostIndex.."_"..ghostMat,"329_MT_arc_"..ghostIndex.."_"..ghostMat,"329_MT_arc_"..ghostIndex.."_"..ghostMat,"329_MT_arc_"..ghostIndex.."_"..ghostMat,}
	else
		prefab_part.weapon = {
			weaponID = 3295003, --int: The weaponData id to be used for this weapon.
			turnSpeed = 0, 	--float: Degrees per second.
			turnMode = "Linear", --string enum: Linear / Acceleration
			turnInstant = false, --bool: Ignore turn speed, snap to target. (Beam Spire, point defence)
			mountAngles = { -- Weapon's firing angles in degrees. Won't aquire targets outside this field of view.
				left = 180, --float:
				right = 180,--float:
				up = 90,	 --float:
				down = 90  --float:
			},
		}
		prefab_part.parts = {
			{
				name      = "Muzzle",
				position  = { 0, 0, -.8 },
				rotation  = { 0, 0, 0 },
				scale 	= { 1, 1, 1 },
				barrel    = true, --Assigns this part as a barrel to the parent's weapon. Barrels are where lasers, units, and weaponVisuals are placed or fired from.
			},
		}
	end
	return prefab_part
end
function prefab.weapon_info.missile.vls.X(count)
	return { 3296014, 1 * count, -2 }
end
function prefab.weapon.missile.vls.X(pos, rot, sca, isGhost, ghostIndex, ghostMat)
	if(ghostIndex==nil) then ghostIndex=0 end
	if(ghostMat==nil) then ghostMat="build" end
	if(ghostIndex < 0) then return {}; end
	prefab_part = {
		name	= "Extra Large VLS",
		mesh      = "329-Missiles/Missile-4-VLS",
		materials = { "329_MT_arc_hull", "329_MT_arc_teamGlow", "329_MT_arc_hull_dark", "329_MT_arc_teamColour" },
		position  = pos,
		rotation  = rot,
		scale 	= sca,
	}
	-- ghosts should NOT have weapons, as it causes a crash.
	if isGhost then
		if (ghostMat == "aegis_teamColour") then
			prefab_part.aegisVisual = true;
		end
		prefab_part.materials = {"329_MT_arc_"..ghostIndex.."_"..ghostMat,"329_MT_arc_"..ghostIndex.."_"..ghostMat,"329_MT_arc_"..ghostIndex.."_"..ghostMat,"329_MT_arc_"..ghostIndex.."_"..ghostMat,}
	else
		prefab_part.weapon = {
			weaponID = 3295004, --int: The weaponData id to be used for this weapon.
			turnSpeed = 0, 	--float: Degrees per second.
			turnMode = "Linear", --string enum: Linear / Acceleration
			turnInstant = false, --bool: Ignore turn speed, snap to target. (Beam Spire, point defence)
			mountAngles = { -- Weapon's firing angles in degrees. Won't aquire targets outside this field of view.
				left = 180, --float:
				right = 180,--float:
				up = 90,	 --float:
				down = 90  --float:
			},
		}
		prefab_part.parts = {
			{
				name      = "Muzzle",
				position  = { 0, 0, -1 },
				rotation  = { 0, 0, 0 },
				scale 	= { 1, 1, 1 },
				barrel    = true, --Assigns this part as a barrel to the parent's weapon. Barrels are where lasers, units, and weaponVisuals are placed or fired from.
			},
		}
	end
	return prefab_part
end
function prefab.weapon_info.missile.vls.T(count)
	return { 3296015, 1 * count, -2 }
end
function prefab.weapon.missile.vls.T(pos, rot, sca, isGhost, ghostIndex, ghostMat)
	if(ghostIndex==nil) then ghostIndex=0 end
	if(ghostMat==nil) then ghostMat="build" end
	if(ghostIndex < 0) then return {}; end
	prefab_part = {
		name	= "Titanic VLS",
		mesh      = "329-Missiles/Missile-5-VLS",
		materials = { "329_MT_arc_hull", "329_MT_arc_teamGlow", "329_MT_arc_hull_dark", "329_MT_arc_teamColour" },
		position  = pos,
		rotation  = rot,
		scale 	= sca,
	}
	-- ghosts should NOT have weapons, as it causes a crash.
	if isGhost then
		if (ghostMat == "aegis_teamColour") then
			prefab_part.aegisVisual = true;
		end
		prefab_part.materials = {"329_MT_arc_"..ghostIndex.."_"..ghostMat,"329_MT_arc_"..ghostIndex.."_"..ghostMat,"329_MT_arc_"..ghostIndex.."_"..ghostMat,"329_MT_arc_"..ghostIndex.."_"..ghostMat,}
	else
		prefab_part.weapon = {
			weaponID = 3295005, --int: The weaponData id to be used for this weapon.
			turnSpeed = 0, 	--float: Degrees per second.
			turnMode = "Linear", --string enum: Linear / Acceleration
			turnInstant = false, --bool: Ignore turn speed, snap to target. (Beam Spire, point defence)
			mountAngles = { -- Weapon's firing angles in degrees. Won't aquire targets outside this field of view.
				left = 180, --float:
				right = 180,--float:
				up = 90,	 --float:
				down = 90  --float:
			},
		}
		prefab_part.parts = {
			{
				name      = "Muzzle",
				position  = { 0, 0, -1.2 },
				rotation  = { 0, 0, 0 },
				scale 	= { 1, 1, 1 },
				barrel    = true, --Assigns this part as a barrel to the parent's weapon. Barrels are where lasers, units, and weaponVisuals are placed or fired from.
			},
		}
	end
	return prefab_part
end

function prefab.weapon_info.missile.hls.S(count)
	return { 3296011, 1 * count, -2 }
end
function prefab.weapon.missile.hls.S(pos, rot, sca, isGhost, ghostIndex, ghostMat)
	-- if(ghostIndex==nil) then ghostIndex=0 end
	-- if(ghostMat==nil) then ghostMat="build" end
	-- if(ghostIndex < 0) then return {}; end
	-- if(not isGhost and ghostIndex < 0) then return {}; end
	prefab_part = {
		name	= "Small HLS",
		mesh      = "329-Missiles/Missile-1-HLS",
		materials = { "329_MT_arc_hull", "329_MT_arc_teamGlow", "329_MT_arc_hull_dark", "329_MT_arc_teamColour" },
		position  = pos,
		rotation  = rot,
		scale 	= sca,
	}
	-- ghosts should NOT have weapons, as it causes a crash.
	if isGhost then
		if (ghostMat == "aegis_teamColour") then
			prefab_part.aegisVisual = true;
		end
		prefab_part.materials = {"329_MT_arc_"..ghostIndex.."_"..ghostMat,"329_MT_arc_"..ghostIndex.."_"..ghostMat,"329_MT_arc_"..ghostIndex.."_"..ghostMat,"329_MT_arc_"..ghostIndex.."_"..ghostMat,}
	else
		prefab_part.weapon = {
			weaponID = 3295011, --int: The weaponData id to be used for this weapon.
			turnSpeed = 0, 	--float: Degrees per second.
			turnMode = "Linear", --string enum: Linear / Acceleration
			turnInstant = false, --bool: Ignore turn speed, snap to target. (Beam Spire, point defence)
			mountAngles = { -- Weapon's firing angles in degrees. Won't aquire targets outside this field of view.
				left = 180, --float:
				right = 180,--float:
				up = 90,	 --float:
				down = 90  --float:
			},
		}
		prefab_part.parts = {
			{
				name      = "Muzzle",
				position  = { 0, -.2, 0 },
				rotation  = { 0, 0, 0 },
				scale 	= { 1, 1, 1 },
				barrel    = true, --Assigns this part as a barrel to the parent's weapon. Barrels are where lasers, units, and weaponVisuals are placed or fired from.
			},
		}
	end
	return prefab_part
end

function prefab.weapon_info.missile.hls.M(count)
	return { 3296012, 1 * count, -2 }
end
function prefab.weapon.missile.hls.M(pos, rot, sca, isGhost, ghostIndex, ghostMat)
	if(ghostIndex==nil) then ghostIndex=0 end
	if(ghostMat==nil) then ghostMat="build" end
	if(ghostIndex < 0) then return {}; end
	prefab_part = {
		name	= "Medium HLS",
		mesh      = "329-Missiles/Missile-2-HLS",
		materials = { "329_MT_arc_hull", "329_MT_arc_teamGlow", "329_MT_arc_hull_dark", "329_MT_arc_teamColour" },
		position  = pos,
		rotation  = rot,
		scale 	= sca,
	}
	-- ghosts should NOT have weapons, as it causes a crash.
	if isGhost then
		if (ghostMat == "aegis_teamColour") then
			prefab_part.aegisVisual = true;
		end
		prefab_part.materials = {"329_MT_arc_"..ghostIndex.."_"..ghostMat,"329_MT_arc_"..ghostIndex.."_"..ghostMat,"329_MT_arc_"..ghostIndex.."_"..ghostMat,"329_MT_arc_"..ghostIndex.."_"..ghostMat,}
	else
		prefab_part.weapon = {
			weaponID = 3295012, --int: The weaponData id to be used for this weapon.
			turnSpeed = 0, 	--float: Degrees per second.
			turnMode = "Linear", --string enum: Linear / Acceleration
			turnInstant = false, --bool: Ignore turn speed, snap to target. (Beam Spire, point defence)
			mountAngles = { -- Weapon's firing angles in degrees. Won't aquire targets outside this field of view.
				left = 180, --float:
				right = 180,--float:
				up = 90,	 --float:
				down = 90  --float:
			},
		}
		prefab_part.parts = {
			{
				name      = "Muzzle",
				position  = { 0, -.3, 0 },
				rotation  = { 0, 0, 0 },
				scale 	= { 1, 1, 1 },
				barrel    = true, --Assigns this part as a barrel to the parent's weapon. Barrels are where lasers, units, and weaponVisuals are placed or fired from.
			},
		}
	end
	return prefab_part
end
function prefab.weapon_info.missile.hls.L(count)
	return { 3296013, 1 * count, -2 }
end
function prefab.weapon.missile.hls.L(pos, rot, sca, isGhost, ghostIndex, ghostMat)
	if(ghostIndex==nil) then ghostIndex=0 end
	if(ghostMat==nil) then ghostMat="build" end
	if(ghostIndex < 0) then return {}; end
	prefab_part = {
		name	= "Large HLS",
		mesh      = "329-Missiles/Missile-3-HLS",
		materials = { "329_MT_arc_hull", "329_MT_arc_teamGlow", "329_MT_arc_hull_dark", "329_MT_arc_teamColour" },
		position  = pos,
		rotation  = rot,
		scale 	= sca,
	}
	-- ghosts should NOT have weapons, as it causes a crash.
	if isGhost then
		if (ghostMat == "aegis_teamColour") then
			prefab_part.aegisVisual = true;
		end
		prefab_part.materials = {"329_MT_arc_"..ghostIndex.."_"..ghostMat,"329_MT_arc_"..ghostIndex.."_"..ghostMat,"329_MT_arc_"..ghostIndex.."_"..ghostMat,"329_MT_arc_"..ghostIndex.."_"..ghostMat,}
	else
		prefab_part.weapon = {
			weaponID = 3295013, --int: The weaponData id to be used for this weapon.
			turnSpeed = 0, 	--float: Degrees per second.
			turnMode = "Linear", --string enum: Linear / Acceleration
			turnInstant = false, --bool: Ignore turn speed, snap to target. (Beam Spire, point defence)
			mountAngles = { -- Weapon's firing angles in degrees. Won't aquire targets outside this field of view.
				left = 180, --float:
				right = 180,--float:
				up = 90,	 --float:
				down = 90  --float:
			},
		}
		prefab_part.parts = {
			{
				name      = "Muzzle",
				position  = { 0, -.3, 0 },
				rotation  = { 0, 0, 0 },
				scale 	= { 1, 1, 1 },
				barrel    = true, --Assigns this part as a barrel to the parent's weapon. Barrels are where lasers, units, and weaponVisuals are placed or fired from.
			},
		}
	end
	return prefab_part
end
function prefab.weapon_info.missile.hls.X(count)
	return { 3296014, 1 * count, -2 }
end
function prefab.weapon.missile.hls.X(pos, rot, sca, isGhost, ghostIndex, ghostMat)
	if(ghostIndex==nil) then ghostIndex=0 end
	if(ghostMat==nil) then ghostMat="build" end
	if(ghostIndex < 0) then return {}; end
	prefab_part = {
		name	= "Large HLS",
		mesh      = "329-Missiles/Missile-4-HLS",
		materials = { "329_MT_arc_hull", "329_MT_arc_teamGlow", "329_MT_arc_hull_dark", "329_MT_arc_teamColour" },
		position  = pos,
		rotation  = rot,
		scale 	= sca,
	}
	-- ghosts should NOT have weapons, as it causes a crash.
	if isGhost then
		if (ghostMat == "aegis_teamColour") then
			prefab_part.aegisVisual = true;
		end
		prefab_part.materials = {"329_MT_arc_"..ghostIndex.."_"..ghostMat,"329_MT_arc_"..ghostIndex.."_"..ghostMat,"329_MT_arc_"..ghostIndex.."_"..ghostMat,"329_MT_arc_"..ghostIndex.."_"..ghostMat,}
	else
		prefab_part.weapon = {
			weaponID = 3295014, --int: The weaponData id to be used for this weapon.
			turnSpeed = 0, 	--float: Degrees per second.
			turnMode = "Linear", --string enum: Linear / Acceleration
			turnInstant = false, --bool: Ignore turn speed, snap to target. (Beam Spire, point defence)
			mountAngles = { -- Weapon's firing angles in degrees. Won't aquire targets outside this field of view.
				left = 180, --float:
				right = 180,--float:
				up = 90,	 --float:
				down = 90  --float:
			},
		}
		prefab_part.parts = {
			{
				name      = "Muzzle",
				position  = { 0, -.4, 0 },
				rotation  = { 0, 0, 0 },
				scale 	= { 1, 1, 1 },
				barrel    = true, --Assigns this part as a barrel to the parent's weapon. Barrels are where lasers, units, and weaponVisuals are placed or fired from.
			},
		}
	end
	return prefab_part
end
function prefab.weapon_info.missile.hls.T(count)
	return { 3296015, 1 * count, -2 }
end
function prefab.weapon.missile.hls.T(pos, rot, sca, isGhost, ghostIndex, ghostMat)
	if(ghostIndex==nil) then ghostIndex=0 end
	if(ghostMat==nil) then ghostMat="build" end
	if(ghostIndex < 0) then return {}; end
	prefab_part = {
		name	= "Large HLS",
		mesh      = "329-Missiles/Missile-5-HLS",
		materials = { "329_MT_arc_hull", "329_MT_arc_teamGlow", "329_MT_arc_hull_dark", "329_MT_arc_teamColour" },
		position  = pos,
		rotation  = rot,
		scale 	= sca,
	}
	-- ghosts should NOT have weapons, as it causes a crash.
	if isGhost then
		if (ghostMat == "aegis_teamColour") then
			prefab_part.aegisVisual = true;
		end
		prefab_part.materials = {"329_MT_arc_"..ghostIndex.."_"..ghostMat,"329_MT_arc_"..ghostIndex.."_"..ghostMat,"329_MT_arc_"..ghostIndex.."_"..ghostMat,"329_MT_arc_"..ghostIndex.."_"..ghostMat,}
	else
		prefab_part.weapon = {
			weaponID = 3295015, --int: The weaponData id to be used for this weapon.
			turnSpeed = 0, 	--float: Degrees per second.
			turnMode = "Linear", --string enum: Linear / Acceleration
			turnInstant = false, --bool: Ignore turn speed, snap to target. (Beam Spire, point defence)
			mountAngles = { -- Weapon's firing angles in degrees. Won't aquire targets outside this field of view.
				left = 180, --float:
				right = 180,--float:
				up = 90,	 --float:
				down = 90  --float:
			},
		}
		prefab_part.parts = {
			{
				name      = "Muzzle",
				position  = { 0, -.5, 0 },
				rotation  = { 0, 0, 0 },
				scale 	= { 1, 1, 1 },
				barrel    = true, --Assigns this part as a barrel to the parent's weapon. Barrels are where lasers, units, and weaponVisuals are placed or fired from.
			},
		}
	end
	return prefab_part
end