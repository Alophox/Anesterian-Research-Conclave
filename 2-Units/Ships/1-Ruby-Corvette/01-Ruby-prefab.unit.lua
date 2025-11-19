prefab.ship.ruby = {
	core = {}
}
prefab.weapon_info.ruby = {
	core = {}
}

function prefab.ship.ruby.thruster(scaleConst, isGhost)
	prefab_part = {
		name     = "Thruster",
		position = { 0, 0, -2.25*.1/scaleConst },
		rotation = { 0, 0, 0 },
		scale 	= { .1/scaleConst, .1/scaleConst, .1/scaleConst },
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
				materials  = { "arc_thruster-inner", "arc_thruster-middle", "arc_thruster-outer" },
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
function prefab.ship.ruby.core.P(scaleConst, isGhost)
	prefab_part = {
		name = "Ruby-Core-P",
		position = {0,0,0},
		rotation = {0,0,0},
		scale = {1,1,1},
		parts={
			prefab.weapon.laser.S(
				{ 0, 0.75*.1/scaleConst, -.5*.1/scaleConst },
				{ 0, 0, 0 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),
			prefab.weapon.laser.S(
				{ 0, -0.75*.1/scaleConst, -.5*.1/scaleConst },
				{ 0, 0, 180 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),

			prefab.part.emblem(
				{ 0, .75*.1/scaleConst, -2*.1/scaleConst},
				{ 0, 0, 0 },
				{ .5*.1/scaleConst, .5*.1/scaleConst, .5*.1/scaleConst },
				isGhost
			),
			prefab.part.emblem(
				{ 0, -.75*.1/scaleConst, -2*.1/scaleConst},
				{ 0, 0, 180 },
				{ .5*.1/scaleConst, .5*.1/scaleConst, .5*.1/scaleConst },
				isGhost
			),

			prefab.ship.ruby.thruster(scaleConst, isGhost),

		-- {
		-- 	name     = "Module Example",			
		-- 	position = { 1, 0, 0 },                	
		-- 	rotation = { 0, 0, 0 },              
		-- 	scale 	= { 1, 1, 1 },
		-- 	autoModule = {
		-- 		moduleTypeID = 1007000, -- The TypeID of the unit that will be attached to this unit, as a "module".
		-- 		reportKillsToParent = true, --Any kills this "module" (unit) makes will be attributed to it's root parent. Yes, even the parent of other modules if this is on a module itself and it's parent module has true also.
		-- 	},
		-- },
		}
	}
	if isGhost then
		prefab_part.materials= {"arc_build","arc_build","arc_build","arc_build","arc_build",}
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
function prefab.ship.ruby.core.B(scaleConst, isGhost)
	prefab_part = {
		name = "Ruby-Core-B",
		position = {0,0,0},
		rotation = {0,0,0},
		scale = {1,1,1},
		parts={
			prefab.weapon.cannon.S(
				{ 0, 0.75*.1/scaleConst, -.5*.1/scaleConst },
				{ 0, 0, 0 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),
			prefab.weapon.cannon.S(
				{ 0, -0.75*.1/scaleConst, -.5*.1/scaleConst },
				{ 0, 0, 180 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),

			prefab.part.emblem(
				{ 0, .75*.1/scaleConst, -2*.1/scaleConst},
				{ 0, 0, 0 },
				{ .5*.1/scaleConst, .5*.1/scaleConst, .5*.1/scaleConst },
				isGhost
			),
			prefab.part.emblem(
				{ 0, -.75*.1/scaleConst, -2*.1/scaleConst},
				{ 0, 0, 180 },
				{ .5*.1/scaleConst, .5*.1/scaleConst, .5*.1/scaleConst },
				isGhost
			),

			prefab.ship.ruby.thruster(scaleConst, isGhost),
		}
	}
	if isGhost then
		prefab_part.materials= {"arc_build","arc_build","arc_build","arc_build","arc_build",}
	end
	return prefab_part
end

function prefab.weapon_info.ruby.core.M()
	weapon_info = {
		prefab.weapon_info.missile.hls.S(4)
	}
	return weapon_info
end
function prefab.ship.ruby.core.M(scaleConst, isGhost)
	prefab_part = {
		name = "Ruby-Core-M",
		position = {0,0,0},
		rotation = {0,0,0},
		scale = {1,1,1},
		parts={
			prefab.weapon.missile.hls.S(
				{ 1*.1/scaleConst, 0.5*.1/scaleConst, -.5*.1/scaleConst },
				{ 0, 0, -45 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),
			prefab.weapon.missile.hls.S(
				{ -1*.1/scaleConst, 0.5*.1/scaleConst, -.5*.1/scaleConst },
				{ 0, 0, 45 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),
			prefab.weapon.missile.hls.S(
				{ 1*.1/scaleConst, -0.5*.1/scaleConst, -.5*.1/scaleConst },
				{ 0, 0, -135 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),
			prefab.weapon.missile.hls.S(
				{ -1*.1/scaleConst, -0.5*.1/scaleConst, -.5*.1/scaleConst },
				{ 0, 0, 135 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),
			

			prefab.part.emblem(
				{ 0, .5*.1/scaleConst, -1.5*.1/scaleConst},
				{ 0, 0, 0 },
				{ .5*.1/scaleConst, .5*.1/scaleConst, .5*.1/scaleConst },
				isGhost
			),
			prefab.part.emblem(
				{ 0, -.5*.1/scaleConst, -1.5*.1/scaleConst},
				{ 0, 0, 180 },
				{ .5*.1/scaleConst, .5*.1/scaleConst, .5*.1/scaleConst },
				isGhost
			),

			prefab.ship.ruby.thruster(scaleConst, isGhost),
		}
	}
	if isGhost then
		prefab_part.materials= {"arc_build","arc_build","arc_build","arc_build","arc_build",}
	end
	return prefab_part
end