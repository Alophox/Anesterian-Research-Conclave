prefab.ship.topaz = {
	stern = {},
	bow = {}
}
prefab.weapon_info.topaz = {
	stern = {},
	bow = {}
}
function prefab.ship.topaz.thruster(scaleConst, isGhost)
	prefab_part = {
		name     = "Thruster",
		position = { 0, 0, -6.5*.1/scaleConst },
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
		}
	end
	return prefab_part
end

function prefab.weapon_info.topaz.stern.P()
	weapon_info = {
		prefab.weapon_info.laser.M(2),
	}
	return weapon_info
end
function prefab.ship.topaz.stern.P(scaleConst, isGhost)
	prefab_part = {
		name = "Topaz-Stern-P",
		mesh = "3-Topaz/Topaz-Stern-P",
		materials = {"arc_teamGlow", "arc_hull", "arc_engine", "arc_teamColour", },
		position = {0,0,0},
		rotation = {0,0,0},
		scale = {1,1,1},
		parts={
			prefab.weapon.laser.M(
				{ 0, 1.75*.1/scaleConst, -2.5*.1/scaleConst },
				{ 0, 0, 0 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),
			prefab.weapon.laser.M(
				{ 0, -1.75*.1/scaleConst, -2.5*.1/scaleConst },
				{ 0, 0, 180 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),
			
			prefab.part.emblem(
				{ 0, 1.75*.1/scaleConst, -5*.1/scaleConst},
				{ 0, 0, 0 },
				{ 1.5*.1/scaleConst, 1.5*.1/scaleConst, 1.5*.1/scaleConst },
				isGhost
			),
			prefab.part.emblem(
				{ 0, -1.75*.1/scaleConst, -5*.1/scaleConst},
				{ 0, 0, 180 },
				{ 1.5*.1/scaleConst, 1.5*.1/scaleConst, 1.5*.1/scaleConst },
				isGhost
			),
			prefab.ship.topaz.thruster(scaleConst, isGhost),
		}
	}
	if isGhost then
		prefab_part.materials= {"arc_build","arc_build","arc_build","arc_build","arc_build",}
	end
	return prefab_part
end

function prefab.weapon_info.topaz.stern.B()
	weapon_info = {
		prefab.weapon_info.cannon.S(2),
		prefab.weapon_info.cannon.S(2),
	}
	return weapon_info
end
function prefab.ship.topaz.stern.B(scaleConst, isGhost)
	prefab_part = {
		name = "Topaz-Stern-B",
		mesh = "3-Topaz/Topaz-Stern-B",
		materials = {"arc_teamGlow", "arc_hull", "arc_engine", "arc_teamColour", },
		position = {0,0,0},
		rotation = {0,0,0},
		scale = {1,1,1},
		parts={
			prefab.weapon.cannon.S(
				{ 0, 1.75*.1/scaleConst, -1.75*.1/scaleConst },
				{ 0, 0, 0 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),
			prefab.weapon.cannon.S(
				{ 0, -1.75*.1/scaleConst, -1.75*.1/scaleConst },
				{ 0, 0, 180 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),
			prefab.weapon.cannon.S(
				{ 2.25*.1/scaleConst, 0, -4.25*.1/scaleConst },
				{ 0, 0, -90 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),
			prefab.weapon.cannon.S(
				{ -2.25*.1/scaleConst, 0, -4.25*.1/scaleConst },
				{ 0, 0, 90 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),

			prefab.part.emblem(
				{ 0, 1.75*.1/scaleConst, -4.25*.1/scaleConst},
				{ 0, 0, 0 },
				{ 1.5*.1/scaleConst, 1.5*.1/scaleConst, 1.5*.1/scaleConst },
				isGhost
			),
			prefab.part.emblem(
				{ 0, -1.75*.1/scaleConst, -4.25*.1/scaleConst},
				{ 0, 0, 180 },
				{ 1.5*.1/scaleConst, 1.5*.1/scaleConst, 1.5*.1/scaleConst },
				isGhost
			),

			prefab.ship.topaz.thruster(scaleConst, isGhost),
		}
	}
	if isGhost then
		prefab_part.materials= {"arc_build","arc_build","arc_build","arc_build","arc_build",}
	end
	return prefab_part
end

function prefab.weapon_info.topaz.stern.M()
	weapon_info = {
		prefab.weapon_info.missile.vls.M(4),
	}
	return weapon_info
end
function prefab.ship.topaz.stern.M(scaleConst, isGhost)
	prefab_part = {
		name = "Topaz-Stern-M",
		mesh = "3-Topaz/Topaz-Stern-M",
		materials = {"arc_hull_dark","arc_teamGlow", "arc_hull", "arc_engine", "arc_teamColour", },
		position = {0,0,0},
		rotation = {0,0,0},
		scale = {1,1,1},
		parts={
			prefab.weapon.missile.vls.M(
				{ 2.25*.1/scaleConst, .75*.1/scaleConst, -2*.1/scaleConst },
				{ 0, 90, 90 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),
			prefab.weapon.missile.vls.M(
				{ 2.25*.1/scaleConst, -.75*.1/scaleConst, -2*.1/scaleConst },
				{ 0, 90, 90 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),
			prefab.weapon.missile.vls.M(
				{ -2.25*.1/scaleConst, .75*.1/scaleConst, -2*.1/scaleConst },
				{ 0, -90, -90 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),
			prefab.weapon.missile.vls.M(
				{ -2.25*.1/scaleConst, -.75*.1/scaleConst, -2*.1/scaleConst },
				{ 0, -90, -90 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),
			
			prefab.part.emblem(
				{ 0, 1.5*.1/scaleConst, -4.25*.1/scaleConst},
				{ 0, 0, 0 },
				{ 1*.1/scaleConst, 1*.1/scaleConst, 1*.1/scaleConst },
				isGhost
			),
			prefab.part.emblem(
				{ 0, -1.5*.1/scaleConst, -4.25*.1/scaleConst},
				{ 0, 0, 180 },
				{ 1*.1/scaleConst, 1*.1/scaleConst, 1*.1/scaleConst },
				isGhost
			),

			prefab.ship.topaz.thruster(scaleConst, isGhost),
		}
	}
	if isGhost then
		prefab_part.materials= {"arc_build","arc_build","arc_build","arc_build","arc_build",}
	end
	return prefab_part
end


function prefab.weapon_info.topaz.bow.P()
	weapon_info = {
		prefab.weapon_info.laser.S(3),
	}
	return weapon_info
end
function prefab.ship.topaz.bow.P(scaleConst, isGhost)
	prefab_part = {
		name = "Topaz-Bow-P",
		mesh = "3-Topaz/Topaz-Bow-P",
		materials = {"arc_teamGlow", "arc_hull", "arc_teamColour", },
		position = {0,0,0},
		rotation = {0,0,0},
		scale = {1,1,1},
		parts={
			prefab.weapon.laser.S(
				{ 0, 1.25*.1/scaleConst, 3*.1/scaleConst },
				{ 0, 0, 0 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),
			prefab.weapon.laser.S(
				{ 0, .75*.1/scaleConst, 6*.1/scaleConst },
				{ 18.4349, 0, 0 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),
			prefab.weapon.laser.S(
				{ 0, -.75*.1/scaleConst, 6*.1/scaleConst },
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

function prefab.weapon_info.topaz.bow.B()
	weapon_info = {
		prefab.weapon_info.cannon.S(2),
		prefab.weapon_info.cannon.S(1),
	}
	return weapon_info
end
function prefab.ship.topaz.bow.B(scaleConst, isGhost)
	prefab_part = {
		name = "Topaz-Bow-B",
		mesh = "3-Topaz/Topaz-Bow-B",
		materials = {"arc_teamGlow", "arc_hull", "arc_teamColour", },
		position = {0,0,0},
		rotation = {0,0,0},
		scale = {1,1,1},
		parts={
			prefab.weapon.cannon.S(
				{ 1*.1/scaleConst, 1.25*.1/scaleConst, 2.75*.1/scaleConst },
				{ 0, 0, 0 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),
			prefab.weapon.cannon.S(
				{ -1*.1/scaleConst, 1.25*.1/scaleConst, 2.75*.1/scaleConst },
				{ 0, 0, 0 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),
			
			prefab.weapon.cannon.S(
				{ 0, -1.25*.1/scaleConst, 2.75*.1/scaleConst },
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

function prefab.weapon_info.topaz.bow.M()
	weapon_info = {
		prefab.weapon_info.missile.hls.S(4),
		prefab.weapon_info.missile.vls.S(2),
	}
	return weapon_info
end
function prefab.ship.topaz.bow.M(scaleConst, isGhost)
	prefab_part = {
		name = "Topaz-Bow-M",
		mesh = "3-Topaz/Topaz-Bow-M",
		materials = {"arc_hull_dark", "arc_teamGlow", "arc_hull", "arc_teamColour", },
		position = {0,0,0},
		rotation = {0,0,0},
		scale = {1,1,1},
		parts={
			prefab.weapon.missile.hls.S(
				{ 1*.1/scaleConst, 1.25*.1/scaleConst, 2.5*.1/scaleConst },
				{ 0, 0, 0 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),
			prefab.weapon.missile.hls.S(
				{ -1*.1/scaleConst, 1.25*.1/scaleConst, 2.5*.1/scaleConst },
				{ 0, 0, 0 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),
			prefab.weapon.missile.hls.S(
				{ 1*.1/scaleConst, -1.25*.1/scaleConst, 2.5*.1/scaleConst },
				{ 0, 0, 180 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),
			prefab.weapon.missile.hls.S(
				{ -1*.1/scaleConst, -1.25*.1/scaleConst, 2.5*.1/scaleConst },
				{ 0, 0, 180 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),
			
			prefab.weapon.missile.vls.S(
				{ 1*.1/scaleConst, 1.5*.1/scaleConst, .75*.1/scaleConst },
				{ -90+18.4349, 0, 0 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),
			prefab.weapon.missile.vls.S(
				{ -1*.1/scaleConst, 1.5*.1/scaleConst, .75*.1/scaleConst },
				{ -90+18.4349, 0, 0 },
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