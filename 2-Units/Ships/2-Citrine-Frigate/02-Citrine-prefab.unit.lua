prefab.ship.citrine = {
	core = {}
}
prefab.weapon_info.citrine = {
	core = {}
}
function prefab.ship.citrine.thruster(scaleConst, isGhost)
	prefab_part = {
		name     = "Thruster",
		position = { 0, 0, -3.75*.1/scaleConst },
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
				scale 	= { 3, 3, 3 },
			},
		}
	end
	return prefab_part
end

function prefab.weapon_info.citrine.core.G()
	weapon_info = {
		prefab.weapon_info.lightning.M(1),
		prefab.weapon_info.lightning.S(2),
	}
	return weapon_info
end
function prefab.ship.citrine.core.G(scaleConst, isGhost)
	prefab_part = {
		name = "Citrine-Core-G",
		position = {0,0,0},
		rotation = {0,0,0},
		scale = {1,1,1},
		parts={
			prefab.weapon.lightning.M(
				{ 0, 1.25*.1/scaleConst, -.5*.1/scaleConst },
				{ 0, 0, 0 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),
			prefab.weapon.lightning.S(
				{ 0, -1.25*.1/scaleConst, -.5*.1/scaleConst },
				{ 0, 0, 180 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),
			prefab.weapon.lightning.S(
				{ 0, -0.75*.1/scaleConst, 2.75*.1/scaleConst },
				{ -18.4349, 0, 180 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),

			prefab.part.emblem(
				{ 0, 1.25*.1/scaleConst, -2.5*.1/scaleConst},
				{ 0, 0, 0 },
				{ 1*.1/scaleConst, 1*.1/scaleConst, 1*.1/scaleConst },
				isGhost
			),
			prefab.part.emblem(
				{ 0, -1.25*.1/scaleConst, -2.5*.1/scaleConst},
				{ 0, 0, 180 },
				{ 1*.1/scaleConst, 1*.1/scaleConst, 1*.1/scaleConst },
				isGhost
			),

			prefab.ship.citrine.thruster(scaleConst, isGhost),
		}
	}
	if isGhost then
		prefab_part.materials= {"arc_build","arc_build","arc_build","arc_build","arc_build",}
	end
	return prefab_part
end

function prefab.weapon_info.citrine.core.A()
	weapon_info = {
		prefab.weapon_info.railgun.L(1),
	}
	return weapon_info
end
function prefab.ship.citrine.core.A(scaleConst, isGhost)
	prefab_part = {
		name = "Citrine-Core-A",
		position = {0,0,0},
		rotation = {0,0,0},
		scale = {1,1,1},
		parts={
			prefab.weapon.railgun.L(
				{ 0, .75*.1/scaleConst, -.5*.1/scaleConst },
				{ 0, 0, 0 },
				{ .09999/scaleConst, .09999/scaleConst, .09999/scaleConst }, --stop z-fighting today!
				isGhost
			),

			prefab.part.emblem(
				{ 0, 1*.1/scaleConst, -3*.1/scaleConst},
				{ 18.4349, 0, 0 },
				{ .8*.1/scaleConst, .8*.1/scaleConst, 1*.1/scaleConst },
				isGhost
			),
			prefab.part.emblem(
				{ 0, -1*.1/scaleConst, -3*.1/scaleConst},
				{ -18.4349, 0, 180 },
				{ .8*.1/scaleConst, .8*.1/scaleConst, .8*.1/scaleConst },
				isGhost
			),

			prefab.ship.citrine.thruster(scaleConst, isGhost),
		}
	}
	if isGhost then
		prefab_part.materials= {"arc_build","arc_build","arc_build","arc_build","arc_build",}
	end
	return prefab_part
end

function prefab.weapon_info.citrine.core.C()
	weapon_info = {
		prefab.weapon_info.laser.S(1),
		prefab.weapon_info.hangar.quartz(1),
		prefab.weapon_info.missile.hls.S(2),
	}
	return weapon_info
end
function prefab.ship.citrine.core.C(scaleConst, isGhost)
	prefab_part = {
		name = "Citrine-Core-C",
		position = {0,0,0},
		rotation = {0,0,0},
		scale = {1,1,1},
		parts={
			prefab.weapon.laser.S(
				{ 0, 1*.1/scaleConst, .5*.1/scaleConst },
				{ 0, 0, 0 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst }, --stop z-fighting today!
				isGhost
			),

			prefab.weapon.hangar.quartz(
				{ 0, 0, 2.75*.1/scaleConst },
				{ 0, 0, 0 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),

			prefab.weapon.missile.hls.S(
				{ -.75*.1/scaleConst, 1*.1/scaleConst, -.5*.1/scaleConst },
				{ 0, 0, 0 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),
			prefab.weapon.missile.hls.S(
				{ .75*.1/scaleConst, 1*.1/scaleConst, -.5*.1/scaleConst },
				{ 0, 0, 0 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),

			prefab.part.emblem(
				{ 0, 1.25*.1/scaleConst, -2.75*.1/scaleConst},
				{ 0, 0, 0 },
				{ 1*.1/scaleConst, 1*.1/scaleConst, 1*.1/scaleConst },
				isGhost
			),
			prefab.part.emblem(
				{ 0, 1.25*.1/scaleConst, -2.75*.1/scaleConst},
				{ 0, 0, 180 },
				{ 1*.1/scaleConst, 1*.1/scaleConst, 1*.1/scaleConst },
				isGhost
			),

			prefab.ship.citrine.thruster(scaleConst, isGhost),
		}
	}
	if isGhost then
		prefab_part.materials= {"arc_build","arc_build","arc_build","arc_build","arc_build",}
	end
	return prefab_part
end