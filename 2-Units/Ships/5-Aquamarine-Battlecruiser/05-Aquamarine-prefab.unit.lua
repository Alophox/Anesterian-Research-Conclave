prefab.ship.aquamarine = {
	stern = {},
	core = {},
	bow = {}
}
prefab.weapon_info.aquamarine = {
	stern = {},
	core = {},
	bow = {}
}

function prefab.ship.aquamarine.thruster(scaleConst, isGhost)
	prefab_part = {
		name     = "Thruster",
		position = { 0, 0, -10.5*.1/scaleConst },
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
				scale 	= { 5, 5, 5 },
			},
			{
				name     = "Thruster Plume",
				mesh     = "Thruster/Thruster-Plume",
				materials  = { "arc_thruster-inner", "arc_thruster-middle", "arc_thruster-outer" },
				position = { -2.5, 0, 0 }, --XYZ, Thruster subparts should all be on the same Y point, as they all scale along the parent's Y axis.
				rotation = { 0, 0, 0 },
				scale 	= { 3, 3, 3 },
			},
			{
				name     = "Thruster Plume",
				mesh     = "Thruster/Thruster-Plume",
				materials  = { "arc_thruster-inner", "arc_thruster-middle", "arc_thruster-outer" },
				position = { 2.5, 0, 0 }, --XYZ, Thruster subparts should all be on the same Y point, as they all scale along the parent's Y axis.
				rotation = { 0, 0, 0 },
				scale 	= { 3, 3, 3 },
			},
		}
	end
	return prefab_part
end

function prefab.weapon_info.aquamarine.stern.P()
	weapon_info = {
		prefab.weapon_info.laser.M(2),
		prefab.weapon_info.laser.S(2),
	}
	return weapon_info
end
function prefab.ship.aquamarine.stern.P(scaleConst, isGhost)
	prefab_part = {
		name = "Aquamarine-Stern-P",
		mesh = "5-Aquamarine/Aquamarine-Stern-P",
		materials = {"arc_hull_dark","arc_teamGlow", "arc_hull", "arc_engine", "arc_teamColour", },
		position = {0,0,0},
		rotation = {0,0,0},
		scale = {1,1,1},
		parts={
			prefab.weapon.laser.M(
				{ 0, 2.75*.1/scaleConst, -6*.1/scaleConst },
				{ 0, 0, 0 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),
			prefab.weapon.laser.M(
				{ 0, -2.75*.1/scaleConst, -6*.1/scaleConst },
				{ 0, 0, 180 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),

			prefab.weapon.laser.S(
				{ -4.25*.1/scaleConst, 0, -7.5*.1/scaleConst },
				{ 0, 0, 90 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),
			prefab.weapon.laser.S(
				{ 4.25*.1/scaleConst, 0, -7.5*.1/scaleConst },
				{ 0, 0, -90 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),
			
			prefab.part.emblem(
				{ 0, 2.75*.1/scaleConst, -9*.1/scaleConst},
				{ 0, 0, 0 },
				{ 2.5*.1/scaleConst, 2.5*.1/scaleConst, 2.5*.1/scaleConst },
				isGhost
			),
			prefab.part.emblem(
				{ 0, -2.75*.1/scaleConst, -9*.1/scaleConst},
				{ 0, 0, 180 },
				{ 2.5*.1/scaleConst, 2.5*.1/scaleConst, 2.5*.1/scaleConst },
				isGhost
			),
			prefab.ship.aquamarine.thruster(scaleConst, isGhost),
		}
	}
	if isGhost then
		prefab_part.materials= {"arc_build","arc_build","arc_build","arc_build","arc_build",}
	end
	return prefab_part
end

function prefab.weapon_info.aquamarine.stern.B()
	weapon_info = {
		prefab.weapon_info.cannon.S(2),
		prefab.weapon_info.cannon.S(4),
	}
	return weapon_info
end
function prefab.ship.aquamarine.stern.B(scaleConst, isGhost)
	prefab_part = {
		name = "Aquamarine-Stern-B",
		mesh = "5-Aquamarine/Aquamarine-Stern-B",
		materials = {"arc_hull_dark","arc_teamGlow", "arc_hull", "arc_engine", "arc_teamColour", },
		position = {0,0,0},
		rotation = {0,0,0},
		scale = {1,1,1},
		parts={
			prefab.weapon.cannon.S(
				{ -1.5*.1/scaleConst, 2.75*.1/scaleConst, -7.25*.1/scaleConst },
				{ 0, 0, 0 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),
			prefab.weapon.cannon.S(
				{ 1.5*.1/scaleConst, 2.75*.1/scaleConst, -7.25*.1/scaleConst },
				{ 0, 0, 0 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),
			prefab.weapon.cannon.S(
				{ -1.5*.1/scaleConst, -2.75*.1/scaleConst, -7.25*.1/scaleConst },
				{ 0, 0, 180 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),
			prefab.weapon.cannon.S(
				{ 1.5*.1/scaleConst, -2.75*.1/scaleConst, -7.25*.1/scaleConst },
				{ 0, 0, 180 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),

			prefab.weapon.cannon.S(
				{ -4.25*.1/scaleConst, 0, -5.25*.1/scaleConst },
				{ 0, 0, 90 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),
			prefab.weapon.cannon.S(
				{ 4.25*.1/scaleConst, 0, -5.25*.1/scaleConst },
				{ 0, 0, -90 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),
			
			prefab.part.emblem(
				{ 0, 2.75*.1/scaleConst, -9*.1/scaleConst},
				{ 0, 0, 0 },
				{ 2.5*.1/scaleConst, 2.5*.1/scaleConst, 2.5*.1/scaleConst },
				isGhost
			),
			prefab.part.emblem(
				{ 0, -2.75*.1/scaleConst, -9*.1/scaleConst},
				{ 0, 0, 180 },
				{ 2.5*.1/scaleConst, 2.5*.1/scaleConst, 2.5*.1/scaleConst },
				isGhost
			),
			prefab.ship.aquamarine.thruster(scaleConst, isGhost),
		}
	}
	if isGhost then
		prefab_part.materials= {"arc_build","arc_build","arc_build","arc_build","arc_build",}
	end
	return prefab_part
end

function prefab.weapon_info.aquamarine.stern.M()
	weapon_info = {
		prefab.weapon_info.missile.vls.L(2),
		prefab.weapon_info.missile.vls.M(4),
	}
	return weapon_info
end
function prefab.ship.aquamarine.stern.M(scaleConst, isGhost)
	prefab_part = {
		name = "Aquamarine-Stern-M",
		mesh = "5-Aquamarine/Aquamarine-Stern-M",
		materials = {"arc_hull_dark","arc_teamGlow", "arc_hull", "arc_engine", "arc_teamColour", },
		position = {0,0,0},
		rotation = {0,0,0},
		scale = {1,1,1},
		parts={
			prefab.weapon.missile.vls.L(
				{ -1.5*.1/scaleConst, 2.75*.1/scaleConst, -7.5*.1/scaleConst },
				{ -90, 0, 0 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),
			prefab.weapon.missile.vls.L(
				{ 1.5*.1/scaleConst, 2.75*.1/scaleConst, -7.5*.1/scaleConst },
				{ -90, 0, 0 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),
			prefab.weapon.missile.vls.M(
				{ -1.5*.1/scaleConst, -2.75*.1/scaleConst, -7.5*.1/scaleConst },
				{ 90, 0, 180 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),
			prefab.weapon.missile.vls.M(
				{ 1.5*.1/scaleConst, -2.75*.1/scaleConst, -7.5*.1/scaleConst },
				{ 90, 0, 180 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),
			
			prefab.part.emblem(
				{ 0, 2.5*.1/scaleConst, -9*.1/scaleConst},
				{ 0, 0, 0 },
				{ 1.5*.1/scaleConst, 1.5*.1/scaleConst, 1.5*.1/scaleConst },
				isGhost
			),
			prefab.part.emblem(
				{ 0, -2.5*.1/scaleConst, -9*.1/scaleConst},
				{ 0, 0, 180 },
				{ 1.5*.1/scaleConst, 1.5*.1/scaleConst, 1.5*.1/scaleConst },
				isGhost
			),
			prefab.ship.aquamarine.thruster(scaleConst, isGhost),
		}
	}
	if isGhost then
		prefab_part.materials= {"arc_build","arc_build","arc_build","arc_build","arc_build",}
	end
	return prefab_part
end



function prefab.weapon_info.aquamarine.core.P()
	weapon_info = {
		prefab.weapon_info.laser.L(2),
		prefab.weapon_info.laser.S(2),
	}
	return weapon_info
end
function prefab.ship.aquamarine.core.P(scaleConst, isGhost)
	prefab_part = {
		name = "Aquamarine-Core-P",
		mesh = "5-Aquamarine/Aquamarine-Core-P",
		materials = {"arc_teamGlow", "arc_hull", "arc_teamColour", },
		position = {0,0,0},
		rotation = {0,0,0},
		scale = {1,1,1},
		parts={
			prefab.weapon.laser.L(
				{ 0, 2.75*.1/scaleConst, -1.75*.1/scaleConst },
				{ 0, 0, 0 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),
			prefab.weapon.laser.L(
				{ 0, -2.75*.1/scaleConst, -1.75*.1/scaleConst },
				{ 0, 0, 180 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),

			prefab.weapon.laser.S(
				{ 0, 2.25*.1/scaleConst, 2*.1/scaleConst },
				{ 18.4349, 0, 0 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),
			prefab.weapon.laser.S(
				{ 0, -2.25*.1/scaleConst, 2*.1/scaleConst },
				{ -18.4349, 0, 180 },
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

function prefab.weapon_info.aquamarine.core.B()
	weapon_info = {
		prefab.weapon_info.cannon.M(2),
		prefab.weapon_info.cannon.M(2),
		prefab.weapon_info.cannon.S(2),
	}
	return weapon_info
end
function prefab.ship.aquamarine.core.B(scaleConst, isGhost)
	prefab_part = {
		name = "Aquamarine-Core-B",
		mesh = "5-Aquamarine/Aquamarine-Core-B",
		materials = {"arc_teamGlow", "arc_hull", "arc_teamColour", },
		position = {0,0,0},
		rotation = {0,0,0},
		scale = {1,1,1},
		parts={
			prefab.weapon.cannon.M(
				{ 0, 2.75*.1/scaleConst, -1.75*.1/scaleConst },
				{ 0, 0, 0 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),
			prefab.weapon.cannon.M(
				{ 0, -2.75*.1/scaleConst, -1.75*.1/scaleConst },
				{ 0, 0, 180 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),

			prefab.weapon.cannon.M(
				{ -4.25*.1/scaleConst, 0, -.25*.1/scaleConst },
				{ 0, 0, 90 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),
			prefab.weapon.cannon.M(
				{ 4.25*.1/scaleConst, 0, -.25*.1/scaleConst },
				{ 0, 0, -90 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),

			prefab.weapon.cannon.S(
				{ 0, 2.25*.1/scaleConst, 2*.1/scaleConst },
				{ 18.4349, 0, 0 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),
			prefab.weapon.cannon.S(
				{ 0, -2.25*.1/scaleConst, 2*.1/scaleConst },
				{ -18.4349, 0, 180 },
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

function prefab.weapon_info.aquamarine.core.M()
	weapon_info = {
		prefab.weapon_info.missile.hls.L(4),
		prefab.weapon_info.missile.vls.S(4),
	}
	return weapon_info
end
function prefab.ship.aquamarine.core.M(scaleConst, isGhost)
	prefab_part = {
		name = "Aquamarine-Core-M",
		mesh = "5-Aquamarine/Aquamarine-Core-M",
		materials = {"arc_hull_dark","arc_teamGlow", "arc_hull", "arc_teamColour", },
		position = {0,0,0},
		rotation = {0,0,0},
		scale = {1,1,1},
		parts={
			prefab.weapon.missile.hls.L(
				{ -3.5*.1/scaleConst, 2*.1/scaleConst, -1.75*.1/scaleConst },
				{ 0, 0, 45 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),
			prefab.weapon.missile.hls.L(
				{ 3.5*.1/scaleConst, 2*.1/scaleConst, -1.75*.1/scaleConst },
				{ 0, 0, -45 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),
			prefab.weapon.missile.hls.L(
				{ -3.5*.1/scaleConst, -2*.1/scaleConst, -1.75*.1/scaleConst },
				{ 0, 0, 135 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),
			prefab.weapon.missile.hls.L(
				{ 3.5*.1/scaleConst, -2*.1/scaleConst, -1.75*.1/scaleConst },
				{ 0, 0, -135 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),

			prefab.weapon.missile.vls.S(
				{ -1.75*.1/scaleConst, 2.25*.1/scaleConst, 2*.1/scaleConst },
				{ -90+18.4349, 0, 0 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),
			prefab.weapon.missile.vls.S(
				{ 1.75*.1/scaleConst, 2.25*.1/scaleConst, 2*.1/scaleConst },
				{ -90+18.4349, 0, 0 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),
			prefab.weapon.missile.vls.S(
				{ -1.75*.1/scaleConst, -2.25*.1/scaleConst, 2*.1/scaleConst },
				{ 90-18.4349, 0, 180 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),
			prefab.weapon.missile.vls.S(
				{ 1.75*.1/scaleConst, -2.25*.1/scaleConst, 2*.1/scaleConst },
				{ 90-18.4349, 0, 180 },
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



function prefab.weapon_info.aquamarine.bow.P()
	weapon_info = {
		prefab.weapon_info.laser.M(2),
		prefab.weapon_info.laser.S(4),
	}
	return weapon_info
end
function prefab.ship.aquamarine.bow.P(scaleConst, isGhost)
	prefab_part = {
		name = "Aquamarine-Bow-P",
		mesh = "5-Aquamarine/Aquamarine-Bow-P",
		materials = {"arc_teamGlow", "arc_hull", "arc_teamColour", },
		position = {0,0,0},
		rotation = {0,0,0},
		scale = {1,1,1},
		parts={
			prefab.weapon.laser.S(
				{ -.9999*.1/scaleConst, 1.75*.1/scaleConst, 5.5*.1/scaleConst },
				{ 0, 0, 0 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),
			prefab.weapon.laser.S(
				{ .9999*.1/scaleConst, 1.75*.1/scaleConst, 5.5*.1/scaleConst },
				{ 0, 0, 0 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),
			prefab.weapon.laser.S(
				{ -.9999*.1/scaleConst, -1.75*.1/scaleConst, 5.5*.1/scaleConst },
				{ 0, 0, 180 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),
			prefab.weapon.laser.S(
				{ .9999*.1/scaleConst, -1.75*.1/scaleConst, 5.5*.1/scaleConst },
				{ 0, 0, 180 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),


			prefab.weapon.laser.M(
				{ 0, 1*.1/scaleConst, 9.25*.1/scaleConst },
				{ 18.4349, 0, 0 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),
			prefab.weapon.laser.M(
				{ 0, -1*.1/scaleConst, 9.25*.1/scaleConst },
				{ -18.4349, 0, 180 },
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

function prefab.weapon_info.aquamarine.bow.B()
	weapon_info = {
		prefab.weapon_info.cannon.S(4),
		prefab.weapon_info.cannon.S(4),
	}
	return weapon_info
end
function prefab.ship.aquamarine.bow.B(scaleConst, isGhost)
	prefab_part = {
		name = "Aquamarine-Bow-B",
		mesh = "5-Aquamarine/Aquamarine-Bow-B",
		materials = {"arc_teamGlow", "arc_hull", "arc_teamColour", },
		position = {0,0,0},
		rotation = {0,0,0},
		scale = {1,1,1},
		parts={
			prefab.weapon.cannon.S(
				{ -.9999*.1/scaleConst, 1.75*.1/scaleConst, 6.25*.1/scaleConst },
				{ 0, 0, 0 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),
			prefab.weapon.cannon.S(
				{ .9999*.1/scaleConst, 1.75*.1/scaleConst, 6.25*.1/scaleConst },
				{ 0, 0, 0 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),
			prefab.weapon.cannon.S(
				{ -.9999*.1/scaleConst, -1.75*.1/scaleConst, 6.25*.1/scaleConst },
				{ 0, 0, 180 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),
			prefab.weapon.cannon.S(
				{ .9999*.1/scaleConst, -1.75*.1/scaleConst, 6.25*.1/scaleConst },
				{ 0, 0, 180 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),


			prefab.weapon.cannon.S(
				{ -3*.1/scaleConst, 1*.1/scaleConst, 7*.1/scaleConst },
				{ 0, 18.4349, 46.5 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),
			prefab.weapon.cannon.S(
				{ 3*.1/scaleConst, 1*.1/scaleConst, 7*.1/scaleConst },
				{ 0, -18.4349, -46.5 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),
			prefab.weapon.cannon.S(
				{ -3*.1/scaleConst, -1*.1/scaleConst, 7*.1/scaleConst },
				{ 0, 18.4349, 134.5 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),
			prefab.weapon.cannon.S(
				{ 3*.1/scaleConst, -1*.1/scaleConst, 7*.1/scaleConst },
				{ 0, -18.4349, -134.5 },
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

function prefab.weapon_info.aquamarine.bow.M()
	weapon_info = {
		prefab.weapon_info.missile.hls.L(4),
	}
	return weapon_info
end
function prefab.ship.aquamarine.bow.M(scaleConst, isGhost)
	prefab_part = {
		name = "Aquamarine-Bow-M",
		mesh = "5-Aquamarine/Aquamarine-Bow-M",
		materials = {"arc_hull_dark","arc_teamGlow", "arc_hull", "arc_teamColour", },
		position = {0,0,0},
		rotation = {0,0,0},
		scale = {1,1,1},
		parts={
			prefab.weapon.missile.hls.L(
				{ -1.75*.1/scaleConst, 1.75*.1/scaleConst, 5.5*.1/scaleConst },
				{ 0, 0, 0 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),
			prefab.weapon.missile.hls.L(
				{ 1.75*.1/scaleConst, 1.75*.1/scaleConst, 5.5*.1/scaleConst },
				{ 0, 0, 0 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),
			prefab.weapon.missile.hls.L(
				{ -1.75*.1/scaleConst, -1.75*.1/scaleConst, 5.5*.1/scaleConst },
				{ 0, 0, 180 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),
			prefab.weapon.missile.hls.L(
				{ 1.75*.1/scaleConst, -1.75*.1/scaleConst, 5.5*.1/scaleConst },
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