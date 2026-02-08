prefab.ship.emerald = {
	stern = {},
	bow = {}
}
prefab.weapon_info.emerald = {
	stern = {},
	bow = {}
}
function prefab.ship.emerald.thruster(scaleConst, isGhost, ghostIndex, ghostMat)
	if(ghostIndex==nil) then ghostIndex=0 end
	if(ghostMat==nil) then ghostMat="build" end
	if(ghostIndex < 0) then return {}; end
	if(not isGhost and ghostIndex < 0) then return {}; end
	prefab_part = {
		name     = "Thruster",
		position = { 0, 0, -8 },
		rotation = { 0, 0, 0 },
		scale 	= { 1, 1, 1 },
	}
	if not isGhost then
		prefab_part.thruster = {
			-- This part will respond to how the ship tries to move. It will scale along the Z axis (XYZ) starting from 0 (invisible), and return up to it's starting scale.
			decayTime = 1,	--float: Seconds, how long it takes for the thruster to shrink to 0, or return to full scale.
			workWhenThrustWithinAngleDegrees = 60, --float: Thrusters are purely visual. For them to know when to visually "thrust" they check the direction that the parent ship is thrusting. How many degrees off can the thrust direction be before the thruster ignores it.
		}

		-- For thruster visuals, if you want more than one plume for our thruster build it out of multiple subparts.
		prefab_part.parts = {
			{
				name     = "Thruster Plume",
				mesh     = "329-Thruster/Thruster-Plume",
				materials  = { "329_MT_arc_thruster_teamGlow", "329_MT_arc_thruster-middle_teamGlow", "329_MT_arc_thruster-outer_teamGlow" },
				position = { 0, 0, 0 }, --XYZ, Thruster subparts should all be on the same Y point, as they all scale along the parent's Y axis.
				rotation = { 0, 0, 0 },
				scale 	= { 7, 7, 7 },
			},
		}
	end
	return prefab_part
end

function prefab.weapon_info.emerald.stern.G()
	weapon_info = {
		prefab.weapon_info.lightning.M(2),
		prefab.weapon_info.lightning.S(2),
	}
	return weapon_info
end
function prefab.ship.emerald.stern.G(scaleConst, isGhost, ghostIndex, ghostMat)
	if(ghostIndex==nil) then ghostIndex=0 end
	if(ghostMat==nil) then ghostMat="build" end
	if(ghostIndex < 0) then return {}; end
	if(not isGhost and ghostIndex < 0) then return {}; end
	prefab_part = {
		name = "Emerald-Stern-G",
		mesh = "329-4-Emerald/Emerald-Stern-G",
		materials = {"329_MT_arc_hull_dark", "329_MT_arc_teamGlow", "329_MT_arc_hull", "329_MT_arc_engine", "329_MT_arc_teamColour", },
		position = {0,0,0},
		rotation = {0,0,0},
		scale = {.1/scaleConst,.1/scaleConst,.1/scaleConst},
		parts={
			prefab.weapon.lightning.M(
				{ 0, 2.25, -2.75 },
				{ 0, 0, 0 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),
			prefab.weapon.lightning.M(
				{ 0, -2.25, -2.75 },
				{ 0, 0, 180 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),
			prefab.weapon.lightning.S(
				{ 3, 0, -4.25 },
				{ 0, 0, -90 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),
			prefab.weapon.lightning.S(
				{ -3, 0, -4.25 },
				{ 0, 0, 90 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),


			prefab.part.emblem(
				{ 0, 2.25, -5.75},
				{ 0, 0, 0 },
				{ 1.5, 1.5, 1.5 },
				isGhost, ghostIndex, ghostMat
			),
			prefab.part.emblem(
				{ 0, -2.25, -5.75},
				{ 0, 0, 180 },
				{ 1.5, 1.5, 1.5 },
				isGhost, ghostIndex, ghostMat
			),
			prefab.ship.emerald.thruster(scaleConst, isGhost, ghostIndex),

			prefab.ship.emerald.stern.G(.1, isGhost, ghostIndex-1, ghostMat),
		}
	}
	if isGhost then
		if (ghostMat == "aegis") then
			prefab_part.aegisVisual = true;
		end
		prefab_part.materials= {"329_MT_arc_"..ghostIndex.."_"..ghostMat,"329_MT_arc_"..ghostIndex.."_"..ghostMat,"329_MT_arc_"..ghostIndex.."_"..ghostMat,"329_MT_arc_"..ghostIndex.."_"..ghostMat,"329_MT_arc_"..ghostIndex.."_"..ghostMat,}
	end
	return prefab_part
end

function prefab.weapon_info.emerald.stern.A()
	weapon_info = {
		prefab.weapon_info.railgun.M(3),
		-- prefab.weapon_info.railgun.S(2),
	}
	return weapon_info
end
function prefab.ship.emerald.stern.A(scaleConst, isGhost, ghostIndex, ghostMat)
	if(ghostIndex==nil) then ghostIndex=0 end
	if(ghostMat==nil) then ghostMat="build" end
	if(ghostIndex < 0) then return {}; end
	if(not isGhost and ghostIndex < 0) then return {}; end
	prefab_part = {
		name = "Emerald-Stern-A",
		mesh = "329-4-Emerald/Emerald-Stern-A",
		materials = {"329_MT_arc_hull_dark", "329_MT_arc_teamGlow", "329_MT_arc_hull", "329_MT_arc_engine", "329_MT_arc_teamColour", },
		position = {0,0,0},
		rotation = {0,0,0},
		scale = {.1/scaleConst,.1/scaleConst,.1/scaleConst},
		parts={
			prefab.weapon.railgun.M(
				{0, 2.5, -6.25},
				{0, 0, 0},
				{1,1,1},
				isGhost, ghostIndex, ghostMat
			),
			prefab.weapon.railgun.M(
				{0, 2, -2},
				{0, 0, 0},
				{1,1,1},
				isGhost, ghostIndex, ghostMat
			),
			prefab.weapon.railgun.M(
				{0, -2.5, -6.25},
				{0, 0, 180},
				{1,1,1},
				isGhost, ghostIndex, ghostMat
			),
			
			-- prefab.weapon.railgun.S(
			-- 	{-1, 2.5, -2.75},
			-- 	{0, 0, 0},
			-- 	{1,1,1},
			-- 	isGhost, ghostIndex, ghostMat
			-- ),
			-- prefab.weapon.railgun.S(
			-- 	{1, 2.5, -2.75},
			-- 	{0, 0, 0},
			-- 	{1,1,1},
			-- 	isGhost, ghostIndex, ghostMat
			-- ),

			prefab.part.emblem(
				{ 0, 2.25, -8.5},
				{ -45, 0, 0 },
				{ 1.4, 1.4, 1.4 },
				isGhost, ghostIndex, ghostMat
			),
			prefab.part.emblem(
				{ 0, -2.25, -8.5},
				{ 45, 0, 180 },
				{ 1.4, 1.4, 1.4 },
				isGhost, ghostIndex, ghostMat
			),

			prefab.ship.emerald.thruster(scaleConst, isGhost, ghostIndex),

			prefab.ship.emerald.stern.A(.1, isGhost, ghostIndex-1, ghostMat),
		}
	}
	if isGhost then
		if (ghostMat == "aegis") then
			prefab_part.aegisVisual = true;
		end
		prefab_part.materials= {"329_MT_arc_"..ghostIndex.."_"..ghostMat,"329_MT_arc_"..ghostIndex.."_"..ghostMat,"329_MT_arc_"..ghostIndex.."_"..ghostMat,"329_MT_arc_"..ghostIndex.."_"..ghostMat,"329_MT_arc_"..ghostIndex.."_"..ghostMat,}
	end
	return prefab_part
end
function prefab.weapon_info.emerald.stern.C()
	weapon_info = {
		prefab.weapon_info.hangar.quartz.A(2),
		prefab.weapon_info.laser.S(2),
	}
	return weapon_info
end
function prefab.ship.emerald.stern.C(scaleConst, isGhost, ghostIndex, ghostMat)
	if(ghostIndex==nil) then ghostIndex=0 end
	if(ghostMat==nil) then ghostMat="build" end
	if(ghostIndex < 0) then return {}; end
	if(not isGhost and ghostIndex < 0) then return {}; end
	prefab_part = {
		name = "Emerald-Stern-C",
		mesh = "329-4-Emerald/Emerald-Stern-C",
		materials = {"329_MT_arc_hull_dark", "329_MT_arc_teamGlow", "329_MT_arc_hull", "329_MT_arc_engine", "329_MT_arc_teamColour", },
		position = {0,0,0},
		rotation = {0,0,0},
		scale = {.1/scaleConst,.1/scaleConst,.1/scaleConst},
		parts={
			prefab.weapon.hangar.quartz.A(
				{ -3, 0, -1.25 },
				{ 0, -90, 0 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),
			prefab.weapon.hangar.quartz.A(
				{ 3, 0, -1.25 },
				{ 0, 90, 0 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),
			prefab.weapon.laser.S(
				{ 0, 2.25, -2 },
				{ 0, 0, 0 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),
			prefab.weapon.laser.S(
				{ 0, -2.25, -2 },
				{ 0, 0, 180 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),

			prefab.part.emblem(
				{ 0, 2.25, -7.25},
				{ 0, 0, 0 },
				{ 1.5, 1.5, 1.5 },
				isGhost, ghostIndex, ghostMat
			),
			prefab.part.emblem(
				{ 0, -2.25, -7.25},
				{ 0, 0, 180 },
				{ 1.5, 1.5, 1.5 },
				isGhost, ghostIndex, ghostMat
			),

			prefab.ship.emerald.thruster(scaleConst, isGhost, ghostIndex),

			prefab.ship.emerald.stern.C(.1, isGhost, ghostIndex-1, ghostMat),
		}
	}
	if isGhost then
		if (ghostMat == "aegis") then
			prefab_part.aegisVisual = true;
		end
		prefab_part.materials= {"329_MT_arc_"..ghostIndex.."_"..ghostMat,"329_MT_arc_"..ghostIndex.."_"..ghostMat,"329_MT_arc_"..ghostIndex.."_"..ghostMat,"329_MT_arc_"..ghostIndex.."_"..ghostMat,"329_MT_arc_"..ghostIndex.."_"..ghostMat,}
	end
	return prefab_part
end




function prefab.weapon_info.emerald.bow.G()
	weapon_info = {
		prefab.weapon_info.lightning.M(2),
		prefab.weapon_info.lightning.S(1),
	}
	return weapon_info
end
function prefab.ship.emerald.bow.G(scaleConst, isGhost, ghostIndex, ghostMat)
	if(ghostIndex==nil) then ghostIndex=0 end
	if(ghostMat==nil) then ghostMat="build" end
	if(ghostIndex < 0) then return {}; end
	if(not isGhost and ghostIndex < 0) then return {}; end
	prefab_part = {
		name = "Emerald-Bow-G",
		mesh = "329-4-Emerald/Emerald-Bow-G",
		materials = {"329_MT_arc_hull_dark", "329_MT_arc_teamGlow", "329_MT_arc_hull", "329_MT_arc_teamColour", },
		position = {0,0,0},
		rotation = {0,0,0},
		scale = {.1/scaleConst,.1/scaleConst,.1/scaleConst},
		parts={
			prefab.weapon.lightning.M(
				{ 0, 1.75, 3 },
				{ 0, 0, 0 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),
			prefab.weapon.lightning.M(
				{ 0, -1.75, 3 },
				{ 0, 0, 180 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),
			prefab.weapon.lightning.S(
				{ 0, 1, 6.75 },
				{ 18.4349, 0, 0 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),

			prefab.ship.emerald.bow.G(.1, isGhost, ghostIndex-1, ghostMat),
		}
	}
	if isGhost then
		if (ghostMat == "aegis") then
			prefab_part.aegisVisual = true;
		end
		prefab_part.materials= {"329_MT_arc_"..ghostIndex.."_"..ghostMat,"329_MT_arc_"..ghostIndex.."_"..ghostMat,"329_MT_arc_"..ghostIndex.."_"..ghostMat,"329_MT_arc_"..ghostIndex.."_"..ghostMat,"329_MT_arc_"..ghostIndex.."_"..ghostMat,}
	end
	return prefab_part
end

function prefab.weapon_info.emerald.bow.A()
	weapon_info = {
		prefab.weapon_info.railgun.M(2),
		prefab.weapon_info.railgun.S(1),
	}
	return weapon_info
end
function prefab.ship.emerald.bow.A(scaleConst, isGhost, ghostIndex, ghostMat)
	if(ghostIndex==nil) then ghostIndex=0 end
	if(ghostMat==nil) then ghostMat="build" end
	if(ghostIndex < 0) then return {}; end
	if(not isGhost and ghostIndex < 0) then return {}; end
	prefab_part = {
		name = "Emerald-Bow-A",
		mesh = "329-4-Emerald/Emerald-Bow-A",
		materials = {"329_MT_arc_hull_dark", "329_MT_arc_teamGlow", "329_MT_arc_hull", "329_MT_arc_teamColour", },
		position = {0,0,0},
		rotation = {0,0,0},
		scale = {.1/scaleConst,.1/scaleConst,.1/scaleConst},
		parts={
			prefab.weapon.railgun.M(
				{ 0, 1.5, 3.25 },
				{ 0, 0, 0 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),
			prefab.weapon.railgun.M(
				{ 0, -1.5, 3.25 },
				{ 0, 0, 180 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),

			prefab.weapon.railgun.S(
				{ 0, -1, 6.75 },
				{ -18.4349, 0, 180 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),

			prefab.ship.emerald.bow.A(.1, isGhost, ghostIndex-1, ghostMat),
		}
	}
	if isGhost then
		if (ghostMat == "aegis") then
			prefab_part.aegisVisual = true;
		end
		prefab_part.materials= {"329_MT_arc_"..ghostIndex.."_"..ghostMat,"329_MT_arc_"..ghostIndex.."_"..ghostMat,"329_MT_arc_"..ghostIndex.."_"..ghostMat,"329_MT_arc_"..ghostIndex.."_"..ghostMat,"329_MT_arc_"..ghostIndex.."_"..ghostMat,}
	end
	return prefab_part
end

function prefab.weapon_info.emerald.bow.C()
	weapon_info = {
		prefab.weapon_info.hangar.quartz.B(2),
		prefab.weapon_info.missile.hls.S(2),
	}
	return weapon_info
end
function prefab.ship.emerald.bow.C(scaleConst, isGhost, ghostIndex, ghostMat)
	if(ghostIndex==nil) then ghostIndex=0 end
	if(ghostMat==nil) then ghostMat="build" end
	if(ghostIndex < 0) then return {}; end
	if(not isGhost and ghostIndex < 0) then return {}; end
	prefab_part = {
		name = "Emerald-Bow-C",
		mesh = "329-4-Emerald/Emerald-Bow-C",
		materials = {"329_MT_arc_hull_dark", "329_MT_arc_teamGlow", "329_MT_arc_hull", "329_MT_arc_teamColour", },
		position = {0,0,0},
		rotation = {0,0,0},
		scale = {.1/scaleConst,.1/scaleConst,.1/scaleConst},
		parts={
			prefab.weapon.hangar.quartz.B(
				{ -3, 0, .75 },
				{ 0, -90, 0 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),
			prefab.weapon.hangar.quartz.B(
				{ 3, 0, .75 },
				{ 0, 90, 0 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),

			prefab.weapon.missile.hls.S(
				{ -1.25, 1.5, 3.75 },
				{ 0, 0, 0 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),
			prefab.weapon.missile.hls.S(
				{ 1.25, 1.5, 3.75 },
				{ 0, 0, 0 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),

			prefab.ship.emerald.bow.C(.1, isGhost, ghostIndex-1, ghostMat),
		}
	}
	if isGhost then
		if (ghostMat == "aegis") then
			prefab_part.aegisVisual = true;
		end
		prefab_part.materials= {"329_MT_arc_"..ghostIndex.."_"..ghostMat,"329_MT_arc_"..ghostIndex.."_"..ghostMat,"329_MT_arc_"..ghostIndex.."_"..ghostMat,"329_MT_arc_"..ghostIndex.."_"..ghostMat,"329_MT_arc_"..ghostIndex.."_"..ghostMat,}
	end
	return prefab_part
end