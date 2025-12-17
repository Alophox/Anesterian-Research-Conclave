prefab.ship.emerald = {
	stern = {},
	bow = {}
}
prefab.weapon_info.emerald = {
	stern = {},
	bow = {}
}
function prefab.ship.emerald.thruster(scaleConst, isGhost)
	prefab_part = {
		name     = "Thruster",
		position = { 0, 0, -8*.1/scaleConst },
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
function prefab.ship.emerald.stern.G(scaleConst, isGhost)
	prefab_part = {
		name = "Emerald-Stern-G",
		mesh = "4-Emerald/Emerald-Stern-G",
		materials = {"arc_hull_dark", "arc_teamGlow", "arc_hull", "arc_engine", "arc_teamColour", },
		position = {0,0,0},
		rotation = {0,0,0},
		scale = {1,1,1},
		parts={
			prefab.weapon.lightning.M(
				{ 0, 2.25*.1/scaleConst, -2.75*.1/scaleConst },
				{ 0, 0, 0 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),
			prefab.weapon.lightning.M(
				{ 0, -2.25*.1/scaleConst, -2.75*.1/scaleConst },
				{ 0, 0, 180 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),
			prefab.weapon.lightning.S(
				{ 3*.1/scaleConst, 0, -4.25*.1/scaleConst },
				{ 0, 0, -90 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),
			prefab.weapon.lightning.S(
				{ -3*.1/scaleConst, 0, -4.25*.1/scaleConst },
				{ 0, 0, 90 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),


			prefab.part.emblem(
				{ 0, 2.25*.1/scaleConst, -5.75*.1/scaleConst},
				{ 0, 0, 0 },
				{ 1.5*.1/scaleConst, 1.5*.1/scaleConst, 1.5*.1/scaleConst },
				isGhost
			),
			prefab.part.emblem(
				{ 0, -2.25*.1/scaleConst, -5.75*.1/scaleConst},
				{ 0, 0, 180 },
				{ 1.5*.1/scaleConst, 1.5*.1/scaleConst, 1.5*.1/scaleConst },
				isGhost
			),
			prefab.ship.emerald.thruster(scaleConst, isGhost),
		}
	}
	if isGhost then
		prefab_part.materials= {"arc_build","arc_build","arc_build","arc_build","arc_build",}
	end
	return prefab_part
end

function prefab.weapon_info.emerald.stern.A()
	weapon_info = {
		prefab.weapon_info.railgun.L(1),
		prefab.weapon_info.railgun.M(1),
	}
	return weapon_info
end
function prefab.ship.emerald.stern.A(scaleConst, isGhost)
	prefab_part = {
		name = "Emerald-Stern-A",
		mesh = "4-Emerald/Emerald-Stern-A",
		materials = {"arc_hull_dark", "arc_teamGlow", "arc_hull", "arc_engine", "arc_teamColour", },
		position = {0,0,0},
		rotation = {0,0,0},
		scale = {1,1,1},
		parts={
			prefab.weapon.railgun.L(
				{0, 2.5*.1/scaleConst, -3.75*.1/scaleConst},
				{0, 0, 0},
				{.1/scaleConst,.1/scaleConst,.1/scaleConst},
				isGhost
			),
			prefab.weapon.railgun.M(
				{0, -2.5*.1/scaleConst, -3.75*.1/scaleConst},
				{0, 0, 180},
				{.1/scaleConst,.1/scaleConst,.1/scaleConst},
				isGhost
			),
			
			prefab.part.emblem(
				{ 0, 2.5*.1/scaleConst, -7.25*.1/scaleConst},
				{ -18.4349, 0, 0 },
				{ 1.5*.1/scaleConst, 1.5*.1/scaleConst, 1.5*.1/scaleConst },
				isGhost
			),
			prefab.part.emblem(
				{ 0, -2.5*.1/scaleConst, -7.25*.1/scaleConst},
				{ 18.4349, 0, 180 },
				{ 1.5*.1/scaleConst, 1.5*.1/scaleConst, 1.5*.1/scaleConst },
				isGhost
			),

			prefab.ship.emerald.thruster(scaleConst, isGhost),
		}
	}
	if isGhost then
		prefab_part.materials= {"arc_build","arc_build","arc_build","arc_build","arc_build",}
	end
	return prefab_part
end
function prefab.weapon_info.emerald.stern.C()
	weapon_info = {
		prefab.weapon_info.hangar.quartz(2),
		prefab.weapon_info.laser.S(2),
	}
	return weapon_info
end
function prefab.ship.emerald.stern.C(scaleConst, isGhost)
	prefab_part = {
		name = "Emerald-Stern-C",
		mesh = "4-Emerald/Emerald-Stern-C",
		materials = {"arc_hull_dark", "arc_teamGlow", "arc_hull", "arc_engine", "arc_teamColour", },
		position = {0,0,0},
		rotation = {0,0,0},
		scale = {1,1,1},
		parts={
			prefab.weapon.hangar.quartz(
				{ -3*.1/scaleConst, 0, -1.25*.1/scaleConst },
				{ 0, -90, 0 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),
			prefab.weapon.hangar.quartz(
				{ 3*.1/scaleConst, 0, -1.25*.1/scaleConst },
				{ 0, 90, 0 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),
			prefab.weapon.laser.S(
				{ 0, 2.25*.1/scaleConst, -2*.1/scaleConst },
				{ 0, 0, 0 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),
			prefab.weapon.laser.S(
				{ 0, -2.25*.1/scaleConst, -2*.1/scaleConst },
				{ 0, 0, 180 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),

			prefab.part.emblem(
				{ 0, 2.25*.1/scaleConst, -7.25*.1/scaleConst},
				{ 0, 0, 0 },
				{ 1.5*.1/scaleConst, 1.5*.1/scaleConst, 1.5*.1/scaleConst },
				isGhost
			),
			prefab.part.emblem(
				{ 0, -2.25*.1/scaleConst, -7.25*.1/scaleConst},
				{ 0, 0, 180 },
				{ 1.5*.1/scaleConst, 1.5*.1/scaleConst, 1.5*.1/scaleConst },
				isGhost
			),

			prefab.ship.emerald.thruster(scaleConst, isGhost),
		}
	}
	if isGhost then
		prefab_part.materials= {"arc_build","arc_build","arc_build","arc_build","arc_build",}
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
function prefab.ship.emerald.bow.G(scaleConst, isGhost)
	prefab_part = {
		name = "Emerald-Bow-G",
		mesh = "4-Emerald/Emerald-Bow-G",
		materials = {"arc_hull_dark", "arc_teamGlow", "arc_hull", "arc_teamColour", },
		position = {0,0,0},
		rotation = {0,0,0},
		scale = {1,1,1},
		parts={
			prefab.weapon.lightning.M(
				{ 0, 1.75*.1/scaleConst, 3*.1/scaleConst },
				{ 0, 0, 0 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),
			prefab.weapon.lightning.M(
				{ 0, -1.75*.1/scaleConst, 3*.1/scaleConst },
				{ 0, 0, 180 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),
			prefab.weapon.lightning.S(
				{ 0, 1*.1/scaleConst, 6.75*.1/scaleConst },
				{ 18.4349, 0, 0 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),
		}
	}
	if isGhost then
		prefab_part.materials= {"arc_build","arc_build","arc_build","arc_build","arc_build",}
	end
	return prefab_part
end

function prefab.weapon_info.emerald.bow.A()
	weapon_info = {
		prefab.weapon_info.railgun.L(1),
		prefab.weapon_info.railgun.S(1),
	}
	return weapon_info
end
function prefab.ship.emerald.bow.A(scaleConst, isGhost)
	prefab_part = {
		name = "Emerald-Bow-A",
		mesh = "4-Emerald/Emerald-Bow-A",
		materials = {"arc_hull_dark", "arc_teamGlow", "arc_hull", "arc_teamColour", },
		position = {0,0,0},
		rotation = {0,0,0},
		scale = {1,1,1},
		parts={
			prefab.weapon.railgun.L(
				{ 0, 1.5*.1/scaleConst, 2.75*.1/scaleConst },
				{ 0, 0, 0 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),
			prefab.weapon.railgun.S(
				{ 0, -1.5*.1/scaleConst, 2.75*.1/scaleConst },
				{ 0, 0, 180 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),
		}
	}
	if isGhost then
		prefab_part.materials= {"arc_build","arc_build","arc_build","arc_build","arc_build",}
	end
	return prefab_part
end

function prefab.weapon_info.emerald.bow.C()
	weapon_info = {
		prefab.weapon_info.hangar.quartz(2),
		prefab.weapon_info.missile.hls.S(2),
	}
	return weapon_info
end
function prefab.ship.emerald.bow.C(scaleConst, isGhost)
	prefab_part = {
		name = "Emerald-Bow-C",
		mesh = "4-Emerald/Emerald-Bow-C",
		materials = {"arc_hull_dark", "arc_teamGlow", "arc_hull", "arc_teamColour", },
		position = {0,0,0},
		rotation = {0,0,0},
		scale = {1,1,1},
		parts={
			prefab.weapon.hangar.quartz(
				{ -3*.1/scaleConst, 0, .75*.1/scaleConst },
				{ 0, -90, 0 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),
			prefab.weapon.hangar.quartz(
				{ 3*.1/scaleConst, 0, .75*.1/scaleConst },
				{ 0, 90, 0 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),

			prefab.weapon.missile.hls.S(
				{ -1.25*.1/scaleConst, 1.5*.1/scaleConst, 3.75*.1/scaleConst },
				{ 0, 0, 0 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),
			prefab.weapon.missile.hls.S(
				{ 1.25*.1/scaleConst, 1.5*.1/scaleConst, 3.75*.1/scaleConst },
				{ 0, 0, 0 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),
		}
	}
	if isGhost then
		prefab_part.materials= {"arc_build","arc_build","arc_build","arc_build","arc_build",}
	end
	return prefab_part
end