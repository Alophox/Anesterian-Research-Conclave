prefab.weapon.hangar = {
	quartz={}
}
prefab.weapon_info.hangar = {
	quartz={}
}


function prefab.weapon_info.hangar.quartz.P(count)
	return { 3295601, 1 * count, 3291001 }
end
function prefab.weapon.hangar.quartz.P(pos, rot, sca, isGhost, ghostIndex, ghostMat)
	if(ghostIndex==nil) then ghostIndex=0 end
	if(ghostMat==nil) then ghostMat="build" end
	if(ghostIndex < 0) then return {}; end
	prefab_part = {
		name	= "Quartz Hangar",
		mesh      = "329-Hangar/Hangar",
		materials = { "329_MT_arc_hull_dark", "329_MT_arc_teamGlow",  "329_MT_arc_teamColour",  },
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
				name      = "Hangar",
				position  = { 0, 0, -1.5 },    	-- float3: XYZ Relative local position of this object. Copy positions from Blender to help you out. NOTICE: Blender uses +Z as up, but this is converted to +Y (is up) when used in game.
				rotation  = { 0, 0, 0 },        			-- float3: XYZ Eular Angles, will apply rotation ZXY. Relative local rotation of this object.
				scale 	= { 1, 1, 1 },					-- float3: XYZ The nonuniform scale of the part, relative to it's parent's scale.

				weapon    = {
					weaponID = 3295601, --int: The weaponData id to be used for this weapon.
					turnSpeed = 0, 	--float: Degrees per second.
					turnMode = "Linear", --string enum: Linear / Acceleration
					turnInstant = false, --bool: Ignore turn speed, snap to target. (Beam Spire, point defence)
					useRootTarget = true,
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

function prefab.weapon_info.hangar.quartz.B(count)
	return { 3295602, 1 * count, 3291002 }
end
function prefab.weapon.hangar.quartz.B(pos, rot, sca, isGhost, ghostIndex, ghostMat)
	if(ghostIndex==nil) then ghostIndex=0 end
	if(ghostMat==nil) then ghostMat="build" end
	if(ghostIndex < 0) then return {}; end
	prefab_part = {
		name	= "Quartz Hangar",
		mesh      = "329-Hangar/Hangar",
		materials = { "329_MT_arc_hull_dark", "329_MT_arc_teamGlow",  "329_MT_arc_teamColour" },
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
				name      = "Hangar",
				position  = { 0, 0, -1.5 },    	-- float3: XYZ Relative local position of this object. Copy positions from Blender to help you out. NOTICE: Blender uses +Z as up, but this is converted to +Y (is up) when used in game.
				rotation  = { 0, 0, 0 },        			-- float3: XYZ Eular Angles, will apply rotation ZXY. Relative local rotation of this object.
				scale 	= { 1, 1, 1 },					-- float3: XYZ The nonuniform scale of the part, relative to it's parent's scale.

				weapon    = {
					weaponID = 3295602, --int: The weaponData id to be used for this weapon.
					turnSpeed = 0, 	--float: Degrees per second.
					turnMode = "Linear", --string enum: Linear / Acceleration
					turnInstant = false, --bool: Ignore turn speed, snap to target. (Beam Spire, point defence)
					useRootTarget = true,
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

function prefab.weapon_info.hangar.quartz.G(count)
	return { 3295604, 1 * count, 3291004 }
end
function prefab.weapon.hangar.quartz.G(pos, rot, sca, isGhost, ghostIndex, ghostMat)
	if(ghostIndex==nil) then ghostIndex=0 end
	if(ghostMat==nil) then ghostMat="build" end
	if(ghostIndex < 0) then return {}; end
	prefab_part = {
		name	= "Quartz Hangar",
		mesh      = "329-Hangar/Hangar",
		materials = { "329_MT_arc_hull_dark", "329_MT_arc_teamGlow", "329_MT_arc_teamColour" },
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
				name      = "Hangar",
				position  = { 0, 0, -1.5 },    	-- float3: XYZ Relative local position of this object. Copy positions from Blender to help you out. NOTICE: Blender uses +Z as up, but this is converted to +Y (is up) when used in game.
				rotation  = { 0, 0, 0 },        			-- float3: XYZ Eular Angles, will apply rotation ZXY. Relative local rotation of this object.
				scale 	= { 1, 1, 1 },					-- float3: XYZ The nonuniform scale of the part, relative to it's parent's scale.

				weapon    = {
					weaponID = 3295604, --int: The weaponData id to be used for this weapon.
					turnSpeed = 0, 	--float: Degrees per second.
					turnMode = "Linear", --string enum: Linear / Acceleration
					turnInstant = false, --bool: Ignore turn speed, snap to target. (Beam Spire, point defence)
					useRootTarget = true,
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

function prefab.weapon_info.hangar.quartz.A(count)
	return { 3295605, 1 * count, 3291005 }
end
function prefab.weapon.hangar.quartz.A(pos, rot, sca, isGhost, ghostIndex, ghostMat)
	if(ghostIndex==nil) then ghostIndex=0 end
	if(ghostMat==nil) then ghostMat="build" end
	if(ghostIndex < 0) then return {}; end
	prefab_part = {
		name	= "Quartz Hangar",
		mesh      = "329-Hangar/Hangar",
		materials = { "329_MT_arc_hull_dark", "329_MT_arc_teamGlow", "329_MT_arc_teamColour" },
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
				name      = "Hangar",
				position  = { 0, 0, -1.5 },    	-- float3: XYZ Relative local position of this object. Copy positions from Blender to help you out. NOTICE: Blender uses +Z as up, but this is converted to +Y (is up) when used in game.
				rotation  = { 0, 0, 0 },        			-- float3: XYZ Eular Angles, will apply rotation ZXY. Relative local rotation of this object.
				scale 	= { 1, 1, 1 },					-- float3: XYZ The nonuniform scale of the part, relative to it's parent's scale.

				weapon    = {
					weaponID = 3295605, --int: The weaponData id to be used for this weapon.
					turnSpeed = 0, 	--float: Degrees per second.
					turnMode = "Linear", --string enum: Linear / Acceleration
					turnInstant = false, --bool: Ignore turn speed, snap to target. (Beam Spire, point defence)
					useRootTarget = true,
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

function prefab.weapon_info.hangar.quartz.stardust(count)
	return { 3295606, 1 * count, 3291006 }
end
function prefab.weapon.hangar.quartz.stardust(pos, rot, sca, isGhost, ghostIndex, ghostMat)
	if(ghostIndex==nil) then ghostIndex=0 end
	if(ghostMat==nil) then ghostMat="build" end
	if(ghostIndex < 0) then return {}; end
	prefab_part = {
		name	= "Quartz Hangar",
		mesh      = "329-Hangar/Hangar",
		materials = { "329_MT_arc_hull_dark", "329_MT_arc_teamGlow", "329_MT_arc_teamColour" },
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
				name      = "Hangar",
				position  = { 0, 0, -1.5 },    	-- float3: XYZ Relative local position of this object. Copy positions from Blender to help you out. NOTICE: Blender uses +Z as up, but this is converted to +Y (is up) when used in game.
				rotation  = { 0, 0, 0 },        			-- float3: XYZ Eular Angles, will apply rotation ZXY. Relative local rotation of this object.
				scale 	= { 1, 1, 1 },					-- float3: XYZ The nonuniform scale of the part, relative to it's parent's scale.

				weapon    = {
					weaponID = 3295606, --int: The weaponData id to be used for this weapon.
					turnSpeed = 0, 	--float: Degrees per second.
					turnMode = "Linear", --string enum: Linear / Acceleration
					turnInstant = false, --bool: Ignore turn speed, snap to target. (Beam Spire, point defence)
					useRootTarget = true,
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

function prefab.weapon_info.hangar.ruby(count)
	return functions.combineWeaponInfo({
		{{ 3295610, 1 * count, 3291100 }},
		{{ 3295611, 1 * count, 3291101 }},
		{{ 3295612, 1 * count, 3291102 }},
	});
end
function prefab.weapon.hangar.ruby(pos, rot, sca, isGhost, ghostIndex, ghostMat)
	if(ghostIndex==nil) then ghostIndex=0 end
	if(ghostMat==nil) then ghostMat="build" end
	if(ghostIndex < 0) then return {}; end
	prefab_part = {
		name	= "Ruby Hangar",
		mesh      = "329-Hangar/Hangar-1",
		materials = { "329_MT_arc_hull_dark", "329_MT_arc_teamGlow", "329_MT_arc_teamColour", },
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
				name      = "Hangar",
				position  = { 0, 0, -3.5 },    	-- float3: XYZ Relative local position of this object. Copy positions from Blender to help you out. NOTICE: Blender uses +Z as up, but this is converted to +Y (is up) when used in game.
				rotation  = { 0, 0, 0 },        			-- float3: XYZ Eular Angles, will apply rotation ZXY. Relative local rotation of this object.
				scale 	= { 1, 1, 1 },					-- float3: XYZ The nonuniform scale of the part, relative to it's parent's scale.
				parts={
					{
						weapon    = {
							weaponID = 3295610, --int: The weaponData id to be used for this weapon.
							turnSpeed = 0, 	--float: Degrees per second.
							turnMode = "Linear", --string enum: Linear / Acceleration
							turnInstant = false, --bool: Ignore turn speed, snap to target. (Beam Spire, point defence)
							useRootTarget = true,
							mountAngles = { -- Weapon's firing angles in degrees. Won't aquire targets outside this field of view.
								left = 180, --float:
								right = 180,--float:
								up = 90,	 --float:
								down = 90  --float:
							},
						},
					},
					{
						weapon    = {
							weaponID = 3295611, --int: The weaponData id to be used for this weapon.
							turnSpeed = 0, 	--float: Degrees per second.
							turnMode = "Linear", --string enum: Linear / Acceleration
							turnInstant = false, --bool: Ignore turn speed, snap to target. (Beam Spire, point defence)
							useRootTarget = true,
							mountAngles = { -- Weapon's firing angles in degrees. Won't aquire targets outside this field of view.
								left = 180, --float:
								right = 180,--float:
								up = 90,	 --float:
								down = 90  --float:
							},
						},
					},
					{
						weapon    = {
							weaponID = 3295612, --int: The weaponData id to be used for this weapon.
							turnSpeed = 0, 	--float: Degrees per second.
							turnMode = "Linear", --string enum: Linear / Acceleration
							turnInstant = false, --bool: Ignore turn speed, snap to target. (Beam Spire, point defence)
							useRootTarget = true,
							mountAngles = { -- Weapon's firing angles in degrees. Won't aquire targets outside this field of view.
								left = 180, --float:
								right = 180,--float:
								up = 90,	 --float:
								down = 90  --float:
							},
						},
					},
				}
				
			},
		}
	end
	return prefab_part
end

function prefab.weapon_info.hangar.citrine(count)
	return functions.combineWeaponInfo({
		{{ 3295620, 1 * count, 3291200 }},
		{{ 3295621, 1 * count, 3291201 }},
		{{ 3295622, 1 * count, 3291202 }},
	});
end
function prefab.weapon.hangar.citrine(pos, rot, sca, isGhost, ghostIndex, ghostMat)
	if(ghostIndex==nil) then ghostIndex=0 end
	if(ghostMat==nil) then ghostMat="build" end
	if(ghostIndex < 0) then return {}; end
	prefab_part = {
		name	= "Ruby Hangar",
		mesh      = "329-Hangar/Hangar-2",
		materials = { "329_MT_arc_hull_dark", "329_MT_arc_teamGlow", "329_MT_arc_teamColour", },
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
				name      = "Hangar",
				position  = { 0, 0, -4.5 },    	-- float3: XYZ Relative local position of this object. Copy positions from Blender to help you out. NOTICE: Blender uses +Z as up, but this is converted to +Y (is up) when used in game.
				rotation  = { 0, 0, 0 },        			-- float3: XYZ Eular Angles, will apply rotation ZXY. Relative local rotation of this object.
				scale 	= { 1, 1, 1 },					-- float3: XYZ The nonuniform scale of the part, relative to it's parent's scale.
				parts={
					{
						weapon    = {
							weaponID = 3295620, --int: The weaponData id to be used for this weapon.
							turnSpeed = 0, 	--float: Degrees per second.
							turnMode = "Linear", --string enum: Linear / Acceleration
							turnInstant = false, --bool: Ignore turn speed, snap to target. (Beam Spire, point defence)
							useRootTarget = true,
							mountAngles = { -- Weapon's firing angles in degrees. Won't aquire targets outside this field of view.
								left = 180, --float:
								right = 180,--float:
								up = 90,	 --float:
								down = 90  --float:
							},
						},
					},
					{
						weapon    = {
							weaponID = 3295621, --int: The weaponData id to be used for this weapon.
							turnSpeed = 0, 	--float: Degrees per second.
							turnMode = "Linear", --string enum: Linear / Acceleration
							turnInstant = false, --bool: Ignore turn speed, snap to target. (Beam Spire, point defence)
							useRootTarget = true,
							mountAngles = { -- Weapon's firing angles in degrees. Won't aquire targets outside this field of view.
								left = 180, --float:
								right = 180,--float:
								up = 90,	 --float:
								down = 90  --float:
							},
						},
					},
					{
						weapon    = {
							weaponID = 3295622, --int: The weaponData id to be used for this weapon.
							turnSpeed = 0, 	--float: Degrees per second.
							turnMode = "Linear", --string enum: Linear / Acceleration
							turnInstant = false, --bool: Ignore turn speed, snap to target. (Beam Spire, point defence)
							useRootTarget = true,
							mountAngles = { -- Weapon's firing angles in degrees. Won't aquire targets outside this field of view.
								left = 180, --float:
								right = 180,--float:
								up = 90,	 --float:
								down = 90  --float:
							},
						},
					},
				}
				
			},
		}
	end
	return prefab_part
end