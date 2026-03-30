prefab.ship.citrine = {
	core = {}
}
prefab.weapon_info.citrine = {
	core = {}
}
function prefab.ship.citrine.thruster(scaleConst, isGhost, ghostIndex, ghostMat)
	if(ghostIndex==nil) then ghostIndex=0 end
	if(ghostMat==nil) then ghostMat="build" end
	if(ghostIndex < 0) then return {}; end
	if(not isGhost and ghostIndex < 0) then return {}; end
	prefab_part = {
		name     = "Thruster",
		position = { 0, 0, -3.75 },
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
				scale 	= { 3, 3, 3 },
			},
		}
	end
	return prefab_part
end

function prefab.weapon_info.citrine.core.G()
	weapon_info = {
		-- prefab.weapon_info.lightning.M(1),
		prefab.weapon_info.lightning.S(4),
	}
	return weapon_info
end
function prefab.ship.citrine.core.G(scaleConst, isGhost, ghostIndex, ghostMat)
	if(ghostIndex==nil) then ghostIndex=0 end
	if(ghostMat==nil) then ghostMat="build" end
	if(ghostIndex < 0) then return {}; end
	if(not isGhost and ghostIndex < 0) then return {}; end
	prefab_part = {
		name = "Citrine-Core-G",
		mesh = "329-2-Citrine/Citrine-Core-G",
		materials = { "329_MT_arc_teamGlow", "329_MT_arc_hull", "329_MT_arc_hull_dark", "329_MT_arc_teamColour" },
		position = {0,0,0},
		rotation = {0,0,0},
		scale = {.1/scaleConst,.1/scaleConst,.1/scaleConst},
		parts={
			prefab.weapon.lightning.S(
				{ 0, 1.25, -.5 },
				{ 0, 0, 0 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),
			prefab.weapon.lightning.S(
				{ 0, -1.25, -.5 },
				{ 0, 0, 180 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),
			prefab.weapon.lightning.S(
				{ 0, 0.75, 2.75 },
				{ 18.4349, 0, 0 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),
			prefab.weapon.lightning.S(
				{ 0, -0.75, 2.75 },
				{ -18.4349, 0, 180 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),

			prefab.part.emblem(
				{ 0, 1.25, -2.5},
				{ 0, 0, 0 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),
			prefab.part.emblem(
				{ 0, -1.25, -2.5},
				{ 0, 0, 180 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),

			prefab.ship.citrine.thruster(scaleConst, isGhost, ghostIndex),

			prefab.ship.citrine.core.G(.1, isGhost, ghostIndex-1, ghostMat),
		}
	}
	if isGhost then
		if (ghostMat == "aegis_teamColour") then
			prefab_part.aegisVisual = true;
		end
		prefab_part.materials= {"329_MT_arc_"..ghostIndex.."_"..ghostMat,"329_MT_arc_"..ghostIndex.."_"..ghostMat,"329_MT_arc_"..ghostIndex.."_"..ghostMat,"329_MT_arc_"..ghostIndex.."_"..ghostMat,"329_MT_arc_"..ghostIndex.."_"..ghostMat,}
	end
	return prefab_part
end

function prefab.weapon_info.citrine.core.A()
	weapon_info = {
		prefab.weapon_info.railgun.S(4),
	}
	return weapon_info
end
function prefab.ship.citrine.core.A(scaleConst, isGhost, ghostIndex, ghostMat)
	if(ghostIndex==nil) then ghostIndex=0 end
	if(ghostMat==nil) then ghostMat="build" end
	if(ghostIndex < 0) then return {}; end
	if(not isGhost and ghostIndex < 0) then return {}; end
	prefab_part = {
		name = "Citrine-Core-A",
		mesh = "329-2-Citrine/Citrine-Core-A",
		materials = { "329_MT_arc_teamGlow", "329_MT_arc_hull", "329_MT_arc_hull_dark", "329_MT_arc_teamColour" },
		position = {0,0,0},
		rotation = {0,0,0},
		scale = {.1/scaleConst,.1/scaleConst,.1/scaleConst},
		parts={
			-- prefab.weapon.railgun.L(
			-- 	{ 0, .75, -.5 },
			-- 	{ 0, 0, 0 },
			-- 	{ .9999, .9999, .9999 }, --stop z-fighting today!
			-- 	isGhost, ghostIndex, ghostMat
			-- ),

			prefab.weapon.railgun.S(
				{ -.75-.125/4, .5, -.5 },
				{ 0, 0, 0 },
				{ 1, 1, 1 }, --stop z-fighting today!
				isGhost, ghostIndex, ghostMat
			),
			prefab.weapon.railgun.S(
				{ .75+.125/4, .5, -.5 },
				{ 0, 0, 0 },
				{ 1, 1, 1 }, --stop z-fighting today!
				isGhost, ghostIndex, ghostMat
			),
			prefab.weapon.railgun.S(
				{ -.75-.125/4, -.5, -.5 },
				{ 0, 0, 180 },
				{ 1, 1, 1 }, --stop z-fighting today!
				isGhost, ghostIndex, ghostMat
			),
			prefab.weapon.railgun.S(
				{ .75+.125/4, -.5, -.5 },
				{ 0, 0, 180 },
				{ 1, 1, 1 }, --stop z-fighting today!
				isGhost, ghostIndex, ghostMat
			),

			prefab.part.emblem(
				{ 0, 1, -3 },
				{ 18.4349, 0, 0 },
				{ .8, .8, 1 },
				isGhost, ghostIndex, ghostMat
			),
			prefab.part.emblem(
				{ 0, -1, -3 },
				{ -18.4349, 0, 180 },
				{ .8, .8, 1 },
				isGhost, ghostIndex, ghostMat
			),

			prefab.ship.citrine.thruster(scaleConst, isGhost, ghostIndex),

			prefab.ship.citrine.core.A(.1, isGhost, ghostIndex-1, ghostMat),
		}
	}
	if isGhost then
		if (ghostMat == "aegis_teamColour") then
			prefab_part.aegisVisual = true;
		end
		prefab_part.materials= {"329_MT_arc_"..ghostIndex.."_"..ghostMat,"329_MT_arc_"..ghostIndex.."_"..ghostMat,"329_MT_arc_"..ghostIndex.."_"..ghostMat,"329_MT_arc_"..ghostIndex.."_"..ghostMat,"329_MT_arc_"..ghostIndex.."_"..ghostMat,}
	end
	return prefab_part
end

function prefab.weapon_info.citrine.core.C()
	weapon_info = {
		prefab.weapon_info.laser.S(1),
		prefab.weapon_info.hangar.quartz.P(1),
		prefab.weapon_info.missile.hls.S(2),
	}
	return weapon_info
end
function prefab.ship.citrine.core.C(scaleConst, isGhost, ghostIndex, ghostMat)
	if(ghostIndex==nil) then ghostIndex=0 end
	if(ghostMat==nil) then ghostMat="build" end
	if(ghostIndex < 0) then return {}; end
	if(not isGhost and ghostIndex < 0) then return {}; end
	prefab_part = {
		name = "Citrine-Core-C",
		mesh = "329-2-Citrine/Citrine-Core-C",
		materials = { "329_MT_arc_teamGlow", "329_MT_arc_hull", "329_MT_arc_hull_dark", "329_MT_arc_teamColour" },
		position = {0,0,0},
		rotation = {0,0,0},
		scale = {.1/scaleConst,.1/scaleConst,.1/scaleConst},
		parts={
			prefab.weapon.laser.S(
				{ 0, 1, .5 },
				{ 0, 0, 0 },
				{ 1, 1, 1 }, --stop z-fighting today!
				isGhost, ghostIndex, ghostMat
			),

			prefab.weapon.hangar.quartz.P(
				{ 0, 0, 2.75 },
				{ 0, 0, 0 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),

			prefab.weapon.missile.hls.S(
				{ -.75, 1, -.5 },
				{ 0, 0, 0 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),
			prefab.weapon.missile.hls.S(
				{ .75, 1, -.5 },
				{ 0, 0, 0 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),

			prefab.part.emblem(
				{ 0, 1.25, -2.75},
				{ 0, 0, 0 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),
			prefab.part.emblem(
				{ 0, 1.25, -2.75},
				{ 0, 0, 180 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),

			prefab.ship.citrine.thruster(scaleConst, isGhost, ghostIndex),

			prefab.ship.citrine.core.C(.1, isGhost, ghostIndex-1, ghostMat),
		}
	}
	if isGhost then
		if (ghostMat == "aegis_teamColour") then
			prefab_part.aegisVisual = true;
		end
		prefab_part.materials= {"329_MT_arc_"..ghostIndex.."_"..ghostMat,"329_MT_arc_"..ghostIndex.."_"..ghostMat,"329_MT_arc_"..ghostIndex.."_"..ghostMat,"329_MT_arc_"..ghostIndex.."_"..ghostMat,"329_MT_arc_"..ghostIndex.."_"..ghostMat,}
	end
	return prefab_part
end