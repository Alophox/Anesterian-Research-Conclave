prefab.ship.ruby = {
	core = {}
}
prefab.weapon_info.ruby = {
	core = {}
}

function prefab.ship.ruby.thruster(scaleConst, isGhost, ghostIndex, ghostMat)
	if(ghostIndex==nil) then ghostIndex=0 end
	if(ghostMat==nil) then ghostMat="build" end
	if(ghostIndex < 0) then return {}; end
	if(not isGhost and ghostIndex < 0) then return {}; end
	prefab_part = {
		name     = "Thruster",
		position = { 0, 0, -2.25 },
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
				mesh     = "Thruster/Thruster-Plume",
				materials  = { "329_MT_arc_thruster_teamGlow", "329_MT_arc_thruster-middle_teamGlow", "329_MT_arc_thruster-outer_teamGlow" },
				position = { 0, 0, 0 }, --XYZ, Thruster subparts should all be on the same Y point, as they all scale along the parent's Y axis.
				rotation = { 0, 0, 0 },
				scale 	= { 2, 2, 2 },
			},
		}
	end
	return prefab_part
end

function prefab.weapon_info.ruby.core.P()
	weapon_info = {
		prefab.weapon_info.laser.S(2)
	}
	return weapon_info
end
function prefab.ship.ruby.core.P(scaleConst, isGhost, ghostIndex, ghostMat)
	if(ghostIndex==nil) then ghostIndex=0 end
	if(ghostMat==nil) then ghostMat="build" end
	if(ghostIndex < 0) then return {}; end
	if(not isGhost and ghostIndex < 0) then return {}; end
	prefab_part = {
		name = "Ruby-Core-P",
		position = {0,0,0},
		rotation = {0,0,0},
		mesh = "1-Ruby/Ruby-Core-P",
		materials = { "329_MT_arc_teamGlow", "329_MT_arc_hull", "329_MT_arc_hull_dark", "329_MT_arc_engine", "329_MT_arc_teamColour" },

		scale = {.1/scaleConst,.1/scaleConst,.1/scaleConst},
		parts={
			prefab.weapon.laser.S(
				{ 0, 0.75, -.5 },
				{ 0, 0, 0 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),
			prefab.weapon.laser.S(
				{ 0, -0.75, -.5 },
				{ 0, 0, 180 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),

			prefab.part.emblem(
				{ 0, .75, -2},
				{ 0, 0, 0 },
				{ .5, .5, .5 },
				isGhost, ghostIndex, ghostMat
			),
			prefab.part.emblem(
				{ 0, -.75, -2},
				{ 0, 0, 180 },
				{ .5, .5, .5 },
				isGhost, ghostIndex, ghostMat
			),

			prefab.ship.ruby.thruster(scaleConst, isGhost, ghostIndex),

			prefab.ship.ruby.core.P(.1, isGhost, ghostIndex-1, ghostMat),
	
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

function prefab.weapon_info.ruby.core.B()
	weapon_info = {
		prefab.weapon_info.cannon.S(1),
		prefab.weapon_info.cannon.S(1),
	}
	return weapon_info
end
function prefab.ship.ruby.core.B(scaleConst, isGhost, ghostIndex, ghostMat)
	if(ghostIndex==nil) then ghostIndex=0 end
	if(ghostMat==nil) then ghostMat="build" end
	if(ghostIndex < 0) then return {}; end
	if(not isGhost and ghostIndex < 0) then return {}; end
	prefab_part = {
		name = "Ruby-Core-B",
		mesh = "1-Ruby/Ruby-Core-B",
		materials = { "329_MT_arc_teamGlow", "329_MT_arc_hull", "329_MT_arc_hull_dark", "329_MT_arc_teamColour" },

		position = {0,0,0},
		rotation = {0,0,0},
		scale = {.1/scaleConst,.1/scaleConst,.1/scaleConst},
		parts={
			prefab.weapon.cannon.S(
				{ 0, 0.75, -.5 },
				{ 0, 0, 0 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),
			prefab.weapon.cannon.S(
				{ 0, -0.75, -.5 },
				{ 0, 0, 180 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),

			prefab.part.emblem(
				{ 0, .75, -2},
				{ 0, 0, 0 },
				{ .5, .5, .5 },
				isGhost, ghostIndex, ghostMat
			),
			prefab.part.emblem(
				{ 0, -.75, -2},
				{ 0, 0, 180 },
				{ .5, .5, .5 },
				isGhost, ghostIndex, ghostMat
			),

			prefab.ship.ruby.thruster(scaleConst, isGhost, ghostIndex),

			prefab.ship.ruby.core.B(.1, isGhost, ghostIndex-1, ghostMat),
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

function prefab.weapon_info.ruby.core.M()
	weapon_info = {
		prefab.weapon_info.missile.hls.S(4)
	}
	return weapon_info
end
function prefab.ship.ruby.core.M(scaleConst, isGhost, ghostIndex, ghostMat)
	if(ghostIndex==nil) then ghostIndex=0 end
	if(ghostMat==nil) then ghostMat="build" end
	if(ghostIndex < 0) then return {}; end
	if(not isGhost and ghostIndex < 0) then return {}; end
	prefab_part = {
		name = "Ruby-Core-M",
		mesh = "1-Ruby/Ruby-Core-M",
		materials = { "329_MT_arc_teamGlow", "329_MT_arc_hull", "329_MT_arc_hull_dark", "329_MT_arc_teamColour" },
		position = {0,0,0},
		rotation = {0,0,0},
		scale = {.1/scaleConst,.1/scaleConst,.1/scaleConst},
		parts={
			prefab.weapon.missile.hls.S(
				{ 1, 0.5, -.5 },
				{ 0, 0, -45 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),
			prefab.weapon.missile.hls.S(
				{ -1, 0.5, -.5 },
				{ 0, 0, 45 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),
			prefab.weapon.missile.hls.S(
				{ 1, -0.5, -.5 },
				{ 0, 0, -135 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),
			prefab.weapon.missile.hls.S(
				{ -1, -0.5, -.5 },
				{ 0, 0, 135 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),
			

			prefab.part.emblem(
				{ 0, .5, -1.5},
				{ 0, 0, 0 },
				{ .5, .5, .5 },
				isGhost, ghostIndex, ghostMat
			),
			prefab.part.emblem(
				{ 0, -.5, -1.5},
				{ 0, 0, 180 },
				{ .5, .5, .5 },
				isGhost, ghostIndex, ghostMat
			),

			prefab.ship.ruby.thruster(scaleConst, isGhost, ghostIndex),

			prefab.ship.ruby.core.M(.1, isGhost, ghostIndex-1, ghostMat),
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