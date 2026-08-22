prefab.weapon.railgun = {}
prefab.weapon_info.railgun = {}


function prefab.weapon_info.railgun.D(count)
	return { 3295500, 1 * count, 3296500 }
end
function prefab.weapon.railgun.D(pos, rot, sca, isGhost, ghostIndex, ghostMat)
	if(ghostIndex==nil) then ghostIndex=0 end
	if(ghostMat==nil) then ghostMat="build" end
	if(ghostIndex < 0) then return {}; end
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
		if (ghostMat == "aegis_teamColour") then
			prefab_part.aegisVisual = true;
		end
		prefab_part.materials = {"329_MT_arc_"..ghostIndex.."_"..ghostMat,"329_MT_arc_"..ghostIndex.."_"..ghostMat,"329_MT_arc_"..ghostIndex.."_"..ghostMat,"329_MT_arc_"..ghostIndex.."_"..ghostMat,}
	else
		prefab_part.parts={
			{
				name      = "Turret",	position  = { 0,0, 0 },	rotation  = { 0, 0, 0 },	scale 	= { 1, 1, 1 },
				weapon    = {
					weaponID = 3295500, --int: The weaponData id to be used for this weapon.
					turnSpeed = weaponStats.baseTracking*weaponStats.railgun.trackingMult.D, 	--float: Degrees per second.
					turnMode = "Linear", --string enum: Linear / Acceleration
					turnInstant = false, --bool: Ignore turn speed, snap to target. (Beam Spire, point defence)
					mountAngles = { -- Weapon's firing angles in degrees. Won't aquire targets outside this field of view.
						left = 1, --float:
						right = 1,--float:
						up = 1,	 --float:
						down = 1  --float:
					},
					useRootTarget = true,
				},

				parts = {
					
				},
			},
		}
	end
	return prefab_part
end

function prefab.weapon_info.railgun.S(count)
	return { 3295501, 1 * count, 3296501 }
end
function prefab.weapon.railgun.S(pos, rot, sca, isGhost, ghostIndex, ghostMat)
	if(ghostIndex==nil) then ghostIndex=0 end
	if(ghostMat==nil) then ghostMat="build" end
	if(ghostIndex < 0) then return {}; end
	prefab_part = {
		name	= "Small Disruptor Base",
		mesh      = "329-Turrets-1/Turret-1-Base",
		materials = { "329_MT_arc_hull",  "329_MT_arc_teamColour", "329_MT_arc_teamGlow", "329_MT_arc_hull_dark" },
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
				name      = "Turret-top",
				position  = { 0, .75, 0 },    	-- float3: XYZ Relative local position of this object. Copy positions from Blender to help you out. NOTICE: Blender uses +Z as up, but this is converted to +Y (is up) when used in game.
				rotation  = { 0, 0, 0 },        			-- float3: XYZ Eular Angles, will apply rotation ZXY. Relative local rotation of this object.
				scale 	= { 1, 1, 1 },					-- float3: XYZ The nonuniform scale of the part, relative to it's parent's scale.

				weapon    = {
					weaponID = 3295501, --int: The weaponData id to be used for this weapon.
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
						mesh       = "329-Turrets-1/Turret-1-Body",
						materials  = { "329_MT_arc_hull" },
						position   = { 0, -.25, 0},
						rotation   = { 0, 0, 0 },
						scale 	 = { 1, 1, 1 },
						turretBody = true, --Assigns this part as a body to the parent turret. Will rotate on a flat plan while the turret moves, giving the illusion of a 2-axis machine.
					},
					{
						name      = "Turret Barrel",
						mesh      = "329-Turrets-1/Turret-1-Railgun", --The mesh to be used for this part, works the same as mainMesh.
						materials = { "329_MT_arc_hull", "329_MT_arc_hull_dark", "329_MT_arc_teamGlow" },
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
	return { 3295502, 1 * count, 3296502 }
end
function prefab.weapon.railgun.M(pos, rot, sca, isGhost, ghostIndex, ghostMat)
	if(ghostIndex==nil) then ghostIndex=0 end
	if(ghostMat==nil) then ghostMat="build" end
	if(ghostIndex < 0) then return {}; end
	prefab_part = {
		name	= "Medium Railgun Base",
		mesh      = "329-Turrets-3/Turret-3-Base",
		materials = { "329_MT_arc_hull", "329_MT_arc_teamGlow", "329_MT_arc_hull_dark", "329_MT_arc_teamColour", },
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
				name      = "Turret-top",
				position  = { 0, .875, 0 },    	-- float3: XYZ Relative local position of this object. Copy positions from Blender to help you out. NOTICE: Blender uses +Z as up, but this is converted to +Y (is up) when used in game.
				rotation  = { 0, 0, 0 },        			-- float3: XYZ Eular Angles, will apply rotation ZXY. Relative local rotation of this object.
				scale 	= { 1, 1, 1 },					-- float3: XYZ The nonuniform scale of the part, relative to it's parent's scale.

				weapon    = {
					weaponID = 3295502, --int: The weaponData id to be used for this weapon.
					turnSpeed = weaponStats.baseTracking*weaponStats.railgun.trackingMult.M, 	--float: Degrees per second.
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
						mesh       = "329-Turrets-3/Turret-3-Body",
						materials  = { "329_MT_arc_teamGlow", "329_MT_arc_hull" },
						position   = { 0, .5-.875, 0},
						rotation   = { 0, 0, 0 },
						scale 	 = { 1, 1, 1 },
						turretBody = true, --Assigns this part as a body to the parent turret. Will rotate on a flat plan while the turret moves, giving the illusion of a 2-axis machine.
					},
					{
						name      = "Turret Barrel",
						mesh      = "329-Turrets-3/Turret-3-Railgun",
						materials = { "329_MT_arc_hull", "329_MT_arc_teamGlow", "329_MT_arc_hull_dark" },
						position  = { .15, 0, 0 },
						rotation  = { 0, 0, 0 },
						scale 	= { 1, 1, 1 },
					},
					{	name = "Turret Muzzle",	position = { .15, 0, .6 },	rotation = { 0, 0, 0 },	scale = { 1, 1, 1 },	barrel = true,	},		
					{
						name      = "Turret Barrel",
						mesh      = "329-Turrets-3/Turret-3-Railgun",
						materials = { "329_MT_arc_hull", "329_MT_arc_teamGlow", "329_MT_arc_hull_dark" },
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
	return { 3295503, 1 * count, 3296503 }
end
function prefab.weapon.railgun.L(pos, rot, sca, isGhost, ghostIndex, ghostMat) --{float3}, {float3}, {float3}, bool
	if(ghostIndex==nil) then ghostIndex=0 end
	if(ghostMat==nil) then ghostMat="build" end
	if(ghostIndex < 0) then return {}; end
	prefab_part = {
		name	= "Large Turret Base",
		mesh      = "329-Turrets-5/Turret-5-Base",
		materials = { "329_MT_arc_hull_dark", "329_MT_arc_hull", "329_MT_arc_teamColour", "329_MT_arc_teamGlow", },
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
		prefab_part.parts = {
			{
				name      = "Turret",
				position  = { 0, .925, 0 },    	-- float3: XYZ Relative local position of this object. Copy positions from Blender to help you out. NOTICE: Blender uses +Z as up, but this is converted to +Y (is up) when used in game.
				rotation  = { 0, 0, 0 },        			-- float3: XYZ Eular Angles, will apply rotation ZXY. Relative local rotation of this object.
				scale 	= { 1, 1, 1 },					-- float3: XYZ The nonuniform scale of the part, relative to it's parent's scale.

				weapon    = {
					weaponID = 3295503, --int: The weaponData id to be used for this weapon.
					turnSpeed = weaponStats.baseTracking*weaponStats.railgun.trackingMult.L, 	--float: Degrees per second.
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
						mesh       = "329-Turrets-5/Turret-5-Body",
						materials  = { "329_MT_arc_teamGlow", "329_MT_arc_hull" },
						position   = { 0, .5-.925, 0},
						rotation   = { 0, 0, 0 },
						scale 	 = { 1, 1, 1 },
						turretBody = true, --Assigns this part as a body to the parent turret. Will rotate on a flat plan while the turret moves, giving the illusion of a 2-axis machine.
					},
					{
						name      = "Turret Barrel Left",
						mesh      = "329-Turrets-5/Turret-5-Railgun", --The mesh to be used for this part, works the same as mainMesh.
						materials = { "329_MT_arc_hull", "329_MT_arc_hull_dark", "329_MT_arc_teamGlow" },
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
						mesh      = "329-Turrets-5/Turret-5-Railgun", --The mesh to be used for this part, works the same as mainMesh.
						materials = { "329_MT_arc_hull", "329_MT_arc_hull_dark", "329_MT_arc_teamGlow" },
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
						mesh      = "329-Turrets-5/Turret-5-Railgun", --The mesh to be used for this part, works the same as mainMesh.
						materials = { "329_MT_arc_hull", "329_MT_arc_hull_dark", "329_MT_arc_teamGlow" },
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

function prefab.weapon_info.railgun.X(count)
	return { 3295504, 1 * count, 3296504 }
end
function prefab.weapon.railgun.X(pos, rot, sca, isGhost, ghostIndex, ghostMat) --{float3}, {float3}, {float3}, bool
	if(ghostIndex==nil) then ghostIndex=0 end
	if(ghostMat==nil) then ghostMat="build" end
	if(ghostIndex < 0) then return {}; end
	prefab_part = {
		name	= "Large Turret Base",
		mesh      = "329-Turrets-7/Turret-7-Base",
		materials = { "329_MT_arc_hull_dark", "329_MT_arc_hull", "329_MT_arc_teamColour", "329_MT_arc_teamGlow", },
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
		prefab_part.parts = {
			{
				name      = "Turret",
				position  = { 0, 1.125, 0 },    	-- float3: XYZ Relative local position of this object. Copy positions from Blender to help you out. NOTICE: Blender uses +Z as up, but this is converted to +Y (is up) when used in game.
				rotation  = { 0, 0, 0 },        			-- float3: XYZ Eular Angles, will apply rotation ZXY. Relative local rotation of this object.
				scale 	= { 1, 1, 1 },					-- float3: XYZ The nonuniform scale of the part, relative to it's parent's scale.

				weapon    = {
					weaponID = 3295504, --int: The weaponData id to be used for this weapon.
					turnSpeed = weaponStats.baseTracking*weaponStats.railgun.trackingMult.X, 	--float: Degrees per second.
					turnMode = "Linear", --string enum: Linear / Acceleration
					turnInstant = false, --bool: Ignore turn speed, snap to target. (Beam Spire, point defence)
					mountAngles = { -- Weapon's firing angles in degrees. Won't aquire targets outside this field of view.
						left = 180, --float:
						right = 180,--float:
						up = 90,	 --float:
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
						mesh      = "329-Turrets-7/Turret-7-Railgun", --The mesh to be used for this part, works the same as mainMesh.
						materials = { "329_MT_arc_hull", "329_MT_arc_hull_dark", "329_MT_arc_teamGlow" },
						position  = { -.735, 0, 0 },
						rotation  = { 0, 0, 0 },
						scale 	= { 1, 1, 1 },
					},
					{	name      = "Turret Muzzle",	position  = { -.735, 0, .5875 },	rotation  = { 0, 0, 0 },	scale 	= { 1, 1, 1 },	barrel    = true,},	
					{
						name      = "Turret Barrel Center Left",
						mesh      = "329-Turrets-7/Turret-7-Railgun", --The mesh to be used for this part, works the same as mainMesh.
						materials = { "329_MT_arc_hull", "329_MT_arc_hull_dark", "329_MT_arc_teamGlow" },
						position  = { -.245, 0, 0 },
						rotation  = { 0, 0, 0 },
						scale 	= { 1, 1, 1 },
					},
					{	name      = "Turret Muzzle",	position  = { -.245, 0, .5875 },	rotation  = { 0, 0, 0 },	scale 	= { 1, 1, 1 },	barrel    = true,},	
					
					{
						name      = "Turret Barrel Center Right",
						mesh      = "329-Turrets-7/Turret-7-Railgun", --The mesh to be used for this part, works the same as mainMesh.
						materials = { "329_MT_arc_hull", "329_MT_arc_hull_dark", "329_MT_arc_teamGlow" },
						position  = { .245, 0, 0 },
						rotation  = { 0, 0, 0 },
						scale 	= { 1, 1, 1 },
					},
					{	name      = "Turret Muzzle",	position  = { .245, 0, .5875 },	rotation  = { 0, 0, 0 },	scale 	= { 1, 1, 1 },	barrel    = true,},	
					
					{
						name      = "Turret Barrel Right",
						mesh      = "329-Turrets-7/Turret-7-Railgun", --The mesh to be used for this part, works the same as mainMesh.
						materials = { "329_MT_arc_hull", "329_MT_arc_hull_dark", "329_MT_arc_teamGlow" },
						position  = { .735, 0, 0 },
						rotation  = { 0, 0, 0 },
						scale 	= { 1, 1, 1 },
					},
					{	name      = "Turret Muzzle",	position  = { .735, 0, .5875 },	rotation  = { 0, 0, 0 },	scale 	= { 1, 1, 1 },	barrel    = true,},	

					
				},
			},
		}
	end
	return prefab_part
end

function prefab.weapon_info.railgun.XS(count)
	return { 3295504, 1 * count, 3296504 }
end
function prefab.weapon.railgun.XS(pos, rot, sca, isGhost, ghostIndex, ghostMat) --{float3}, {float3}, {float3}, bool
	if(ghostIndex==nil) then ghostIndex=0 end
	if(ghostMat==nil) then ghostMat="build" end
	if(ghostIndex < 0) then return {}; end
	prefab_part = {
		name	= "Large Turret Base",
		-- mesh      = "329-Turrets-5/Turret-5-Base",
		-- materials = { "329_MT_arc_hull_dark", "329_MT_arc_hull", "329_MT_arc_teamColour", "329_MT_arc_teamGlow", },
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
		prefab_part.parts = {
			{
				name      = "Turret",
				position  = { 0, 0, 0 },    	-- float3: XYZ Relative local position of this object. Copy positions from Blender to help you out. NOTICE: Blender uses +Z as up, but this is converted to +Y (is up) when used in game.
				rotation  = { 0, 0, 0 },        			-- float3: XYZ Eular Angles, will apply rotation ZXY. Relative local rotation of this object.
				scale 	= { 1, 1, 1 },					-- float3: XYZ The nonuniform scale of the part, relative to it's parent's scale.

				weapon    = {
					weaponID = 3295504, --int: The weaponData id to be used for this weapon.
					turnSpeed = weaponStats.baseTracking*weaponStats.railgun.trackingMult.X, 	--float: Degrees per second.
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
					{
						name      = "Turret Muzzle",
						position  = { 0, 0, .5875 },
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

function prefab.weapon_info.railgun.TS(count)
	return { 3295505, 1 * count, 3296505 }
end
function prefab.weapon.railgun.TS(pos, rot, sca, isGhost, ghostIndex, ghostMat) --{float3}, {float3}, {float3}, bool
	if(ghostIndex==nil) then ghostIndex=0 end
	if(ghostMat==nil) then ghostMat="build" end
	if(ghostIndex < 0) then return {}; end
	prefab_part = {
		name	= "Large Turret Base",
		-- mesh      = "329-Turrets-5/Turret-5-Base",
		-- materials = { "329_MT_arc_hull_dark", "329_MT_arc_hull", "329_MT_arc_teamColour", "329_MT_arc_teamGlow", },
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
		prefab_part.parts = {
			{
				name      = "Turret",
				position  = { 0, 0, 0 },    	-- float3: XYZ Relative local position of this object. Copy positions from Blender to help you out. NOTICE: Blender uses +Z as up, but this is converted to +Y (is up) when used in game.
				rotation  = { 0, 0, 0 },        			-- float3: XYZ Eular Angles, will apply rotation ZXY. Relative local rotation of this object.
				scale 	= { 1, 1, 1 },					-- float3: XYZ The nonuniform scale of the part, relative to it's parent's scale.

				weapon    = {
					weaponID = 3295505, --int: The weaponData id to be used for this weapon.
					turnSpeed = weaponStats.baseTracking*weaponStats.railgun.trackingMult.T, 	--float: Degrees per second.
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
					{
						name      = "Turret Muzzle",
						position  = { 0, 0, .5875 },
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