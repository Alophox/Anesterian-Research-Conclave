prefab.weapon.hangar = {}
prefab.weapon_info.hangar = {}


function prefab.weapon_info.hangar.quartz(count)
	return { 3295600, 1 * count, 3291000 }
end
function prefab.weapon.hangar.quartz(pos, rot, sca, isGhost, ghostIndex, ghostMat)
	if(ghostIndex==nil) then ghostIndex=0 end
	if(ghostMat==nil) then ghostMat="arc_build" end
	if(ghostIndex < 0) then return {}; end
	if(not isGhost and ghostIndex < 0) then return {}; end
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
		if (ghostMat == "arc_aegis") then
			prefab_part.aegisVisual = true;
		end
		prefab_part.materials = {ghostIndex.."_"..ghostMat,ghostIndex.."_"..ghostMat,ghostIndex.."_"..ghostMat,ghostIndex.."_"..ghostMat,}
	else
		prefab_part.parts={
			{
				name      = "Hangar",
				position  = { 0, 0, -1.5 },    	-- float3: XYZ Relative local position of this object. Copy positions from Blender to help you out. NOTICE: Blender uses +Z as up, but this is converted to +Y (is up) when used in game.
				rotation  = { 0, 0, 0 },        			-- float3: XYZ Eular Angles, will apply rotation ZXY. Relative local rotation of this object.
				scale 	= { 1, 1, 1 },					-- float3: XYZ The nonuniform scale of the part, relative to it's parent's scale.

				weapon    = {
					weaponID = 3295600, --int: The weaponData id to be used for this weapon.
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
	if(ghostMat==nil) then ghostMat="arc_build" end
	if(ghostIndex < 0) then return {}; end
	if(not isGhost and ghostIndex < 0) then return {}; end
	prefab_part = {
		name	= "Ruby Hangar",
		mesh      = "Hangar/Hangar-1",
		materials = { "arc_hull_dark", "arc_teamGlow", "arc_teamColour", },
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
	if(ghostMat==nil) then ghostMat="arc_build" end
	if(ghostIndex < 0) then return {}; end
	if(not isGhost and ghostIndex < 0) then return {}; end
	prefab_part = {
		name	= "Ruby Hangar",
		mesh      = "Hangar/Hangar-2",
		materials = { "arc_hull_dark", "arc_teamGlow", "arc_teamColour", },
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