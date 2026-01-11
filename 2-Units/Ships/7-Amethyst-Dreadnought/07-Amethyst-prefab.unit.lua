-- technically amethyst has 4 ship sections, but to keep the number of combos reasonable for this, the core is combined into 1
-- ...this is also because there is one size for all six types

-- but I'll have each individual section made... so 5 sections!
prefab.ship.amethyst = {
	stern = {},
	core_aft = {},
	core = {},
	core_fore = {},
	bow = {}
}
prefab.weapon_info.amethyst = {
	stern = {},
	core_aft = {},
	core = {},
	core_fore = {},
	bow = {}
}

function prefab.ship.amethyst.thruster(scaleConst, isGhost)
	prefab_part = {
		name     = "Thruster",
		position = { 0, 0, -23.25*.1/scaleConst },
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
				scale 	= { 11, 11, 11 },
			},
			{
				name     = "Thruster Plume",
				mesh     = "Thruster/Thruster-Plume",
				materials  = { "arc_thruster-inner", "arc_thruster-middle", "arc_thruster-outer" },
				position = { -4.75, 0, 0 }, --XYZ, Thruster subparts should all be on the same Y point, as they all scale along the parent's Y axis.
				rotation = { 0, 0, 0 },
				scale 	= { 6, 6, 6 },
			},
			{
				name     = "Thruster Plume",
				mesh     = "Thruster/Thruster-Plume",
				materials  = { "arc_thruster-inner", "arc_thruster-middle", "arc_thruster-outer" },
				position = { 4.75, 0, 0 }, --XYZ, Thruster subparts should all be on the same Y point, as they all scale along the parent's Y axis.
				rotation = { 0, 0, 0 },
				scale 	= { 6, 6, 6 },
			},
			{
				name     = "Thruster Plume",
				mesh     = "Thruster/Thruster-Plume",
				materials  = { "arc_thruster-inner", "arc_thruster-middle", "arc_thruster-outer" },
				position = { 0, 4, 0 }, --XYZ, Thruster subparts should all be on the same Y point, as they all scale along the parent's Y axis.
				rotation = { 0, 0, 0 },
				scale 	= { 3, 3, 3 },
			},
			{
				name     = "Thruster Plume",
				mesh     = "Thruster/Thruster-Plume",
				materials  = { "arc_thruster-inner", "arc_thruster-middle", "arc_thruster-outer" },
				position = { 0, -4, 0 }, --XYZ, Thruster subparts should all be on the same Y point, as they all scale along the parent's Y axis.
				rotation = { 0, 0, 0 },
				scale 	= { 3, 3, 3 },
			},
		}
	end
	return prefab_part
end

function prefab.weapon_info.amethyst.stern.P()
	weapon_info = {
		prefab.weapon_info.laser.X(2),
	}
	return weapon_info
end
function prefab.ship.amethyst.stern.P(scaleConst, isGhost)
	prefab_part = {
		name = "Amethyst-Stern-P",
		mesh = "7-Amethyst/Amethyst-Stern-P",
		materials = {"arc_hull_dark","arc_teamGlow", "arc_hull", "arc_engine", "arc_teamColour", },
		position = {0,0,0},
		rotation = {0,0,0},
		scale = {1,1,1},
		parts={

			prefab.weapon.laser.X(
				{ 0, 6.25*.1/scaleConst, -18.75*.1/scaleConst },
				{ 0, 0, 0 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),
			prefab.weapon.laser.X(
				{ 0, -6.25*.1/scaleConst, -18.75*.1/scaleConst },
				{ 0, 0, 180 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),

			
			-- prefab.part.emblem(
			-- 	{ 0, 3.95*.1/scaleConst, -9.5*.1/scaleConst},
			-- 	{ 0, 0, 0 },
			-- 	{ 1.5*.1/scaleConst, 1.5*.1/scaleConst, 1.5*.1/scaleConst },
			-- 	isGhost
			-- ),
			-- prefab.part.emblem(
			-- 	{ 0, -3.95*.1/scaleConst, -9.5*.1/scaleConst},
			-- 	{ 0, 0, 180 },
			-- 	{ 1.5*.1/scaleConst, 1.5*.1/scaleConst, 1.5*.1/scaleConst },
			-- 	isGhost
			-- ),
			prefab.ship.amethyst.thruster(scaleConst, isGhost),
		}
	}
	if isGhost then
		prefab_part.materials= {"arc_build","arc_build","arc_build","arc_build","arc_build",}
	end
	return prefab_part
end

function prefab.weapon_info.amethyst.stern.B()
	weapon_info = {
		prefab.weapon_info.cannon.X(2),
	}
	return weapon_info
end
function prefab.ship.amethyst.stern.B(scaleConst, isGhost)
	prefab_part = {
		name = "Amethyst-Stern-B",
		mesh = "7-Amethyst/Amethyst-Stern-B",
		materials = {"arc_hull_dark","arc_teamGlow", "arc_hull", "arc_engine", "arc_teamColour", },
		position = {0,0,0},
		rotation = {0,0,0},
		scale = {1,1,1},
		parts={

			prefab.weapon.cannon.X(
				{ 0, 6.25*.1/scaleConst, -18.75*.1/scaleConst },
				{ 0, 0, 0 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),
			prefab.weapon.cannon.X(
				{ 0, -6.25*.1/scaleConst, -18.75*.1/scaleConst },
				{ 0, 0, 180 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),

			
			-- prefab.part.emblem(
			-- 	{ 0, 3.95*.1/scaleConst, -9.5*.1/scaleConst},
			-- 	{ 0, 0, 0 },
			-- 	{ 1.5*.1/scaleConst, 1.5*.1/scaleConst, 1.5*.1/scaleConst },
			-- 	isGhost
			-- ),
			-- prefab.part.emblem(
			-- 	{ 0, -3.95*.1/scaleConst, -9.5*.1/scaleConst},
			-- 	{ 0, 0, 180 },
			-- 	{ 1.5*.1/scaleConst, 1.5*.1/scaleConst, 1.5*.1/scaleConst },
			-- 	isGhost
			-- ),
			prefab.ship.amethyst.thruster(scaleConst, isGhost),
		}
	}
	if isGhost then
		prefab_part.materials= {"arc_build","arc_build","arc_build","arc_build","arc_build",}
	end
	return prefab_part
end

function prefab.weapon_info.amethyst.stern.M()
	weapon_info = {
		prefab.weapon_info.missile.hls.X(2),
	}
	return weapon_info
end
function prefab.ship.amethyst.stern.M(scaleConst, isGhost)
	prefab_part = {
		name = "Amethyst-Stern-M",
		mesh = "7-Amethyst/Amethyst-Stern-M",
		materials = {"arc_hull_dark","arc_teamGlow", "arc_hull", "arc_engine", "arc_teamColour", },
		position = {0,0,0},
		rotation = {0,0,0},
		scale = {1,1,1},
		parts={

			prefab.weapon.missile.hls.X(
				{ -5*.1/scaleConst, 3.5*.1/scaleConst, -19.5*.1/scaleConst },
				{ 0, 0, 45 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),
			prefab.weapon.missile.hls.X(
				{ 5*.1/scaleConst, 3.5*.1/scaleConst, -19.5*.1/scaleConst },
				{ 0, 0, -45 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),

			prefab.weapon.missile.hls.X(
				{ -5*.1/scaleConst, -3.5*.1/scaleConst, -19.5*.1/scaleConst },
				{ 0, 0, 135 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),
			prefab.weapon.missile.hls.X(
				{ 5*.1/scaleConst, -3.5*.1/scaleConst, -19.5*.1/scaleConst },
				{ 0, 0, -135 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),

			
			-- prefab.part.emblem(
			-- 	{ 0, 3.95*.1/scaleConst, -9.5*.1/scaleConst},
			-- 	{ 0, 0, 0 },
			-- 	{ 1.5*.1/scaleConst, 1.5*.1/scaleConst, 1.5*.1/scaleConst },
			-- 	isGhost
			-- ),
			-- prefab.part.emblem(
			-- 	{ 0, -3.95*.1/scaleConst, -9.5*.1/scaleConst},
			-- 	{ 0, 0, 180 },
			-- 	{ 1.5*.1/scaleConst, 1.5*.1/scaleConst, 1.5*.1/scaleConst },
			-- 	isGhost
			-- ),
			prefab.ship.amethyst.thruster(scaleConst, isGhost),
		}
	}
	if isGhost then
		prefab_part.materials= {"arc_build","arc_build","arc_build","arc_build","arc_build",}
	end
	return prefab_part
end
function prefab.weapon_info.amethyst.stern.G()
	weapon_info = {
		prefab.weapon_info.lightning.X(2),
	}
	return weapon_info
end
function prefab.ship.amethyst.stern.G(scaleConst, isGhost)
	prefab_part = {
		name = "Amethyst-Stern-G",
		mesh = "7-Amethyst/Amethyst-Stern-G",
		materials = {"arc_hull_dark","arc_teamGlow", "arc_hull", "arc_engine", "arc_teamColour", },
		position = {0,0,0},
		rotation = {0,0,0},
		scale = {1,1,1},
		parts={

			prefab.weapon.lightning.X(
				{ 0, 6.25*.1/scaleConst, -18.75*.1/scaleConst },
				{ 0, 0, 0 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),
			prefab.weapon.lightning.X(
				{ 0, -6.25*.1/scaleConst, -18.75*.1/scaleConst },
				{ 0, 0, 180 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),

			
			-- prefab.part.emblem(
			-- 	{ 0, 3.95*.1/scaleConst, -9.5*.1/scaleConst},
			-- 	{ 0, 0, 0 },
			-- 	{ 1.5*.1/scaleConst, 1.5*.1/scaleConst, 1.5*.1/scaleConst },
			-- 	isGhost
			-- ),
			-- prefab.part.emblem(
			-- 	{ 0, -3.95*.1/scaleConst, -9.5*.1/scaleConst},
			-- 	{ 0, 0, 180 },
			-- 	{ 1.5*.1/scaleConst, 1.5*.1/scaleConst, 1.5*.1/scaleConst },
			-- 	isGhost
			-- ),
			prefab.ship.amethyst.thruster(scaleConst, isGhost),
		}
	}
	if isGhost then
		prefab_part.materials= {"arc_build","arc_build","arc_build","arc_build","arc_build",}
	end
	return prefab_part
end
function prefab.weapon_info.amethyst.stern.A()
	weapon_info = {
		prefab.weapon_info.railgun.X(2),
	}
	return weapon_info
end
function prefab.ship.amethyst.stern.A(scaleConst, isGhost)
	prefab_part = {
		name = "Amethyst-Stern-A",
		mesh = "7-Amethyst/Amethyst-Stern-A",
		materials = {"arc_hull_dark","arc_teamGlow", "arc_hull", "arc_engine", "arc_teamColour", },
		position = {0,0,0},
		rotation = {0,0,0},
		scale = {1,1,1},
		parts={

			prefab.weapon.railgun.X(
				{ 0, 6*.1/scaleConst, -18.75*.1/scaleConst },
				{ 0, 0, 0 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),
			prefab.weapon.railgun.X(
				{ 0, -6*.1/scaleConst, -18.75*.1/scaleConst },
				{ 0, 0, 180 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),

			
			-- prefab.part.emblem(
			-- 	{ 0, 3.95*.1/scaleConst, -9.5*.1/scaleConst},
			-- 	{ 0, 0, 0 },
			-- 	{ 1.5*.1/scaleConst, 1.5*.1/scaleConst, 1.5*.1/scaleConst },
			-- 	isGhost
			-- ),
			-- prefab.part.emblem(
			-- 	{ 0, -3.95*.1/scaleConst, -9.5*.1/scaleConst},
			-- 	{ 0, 0, 180 },
			-- 	{ 1.5*.1/scaleConst, 1.5*.1/scaleConst, 1.5*.1/scaleConst },
			-- 	isGhost
			-- ),
			prefab.ship.amethyst.thruster(scaleConst, isGhost),
		}
	}
	if isGhost then
		prefab_part.materials= {"arc_build","arc_build","arc_build","arc_build","arc_build",}
	end
	return prefab_part
end




function prefab.weapon_info.amethyst.stern.C()
	weapon_info = {
		prefab.weapon_info.hangar.quartz(12),
	}
	return weapon_info
end
function prefab.ship.amethyst.stern.C(scaleConst, isGhost)
	prefab_part = {
		name = "Amethyst-Stern-C",
		mesh = "7-Amethyst/Amethyst-Stern-C",
		materials = {"arc_hull_dark","arc_teamGlow", "arc_hull", "arc_engine", "arc_teamColour", },
		position = {0,0,0},
		rotation = {0,0,0},
		scale = {1,1,1},
		parts={
			prefab.weapon.hangar.quartz(
				{ -7*.1/scaleConst, 0, -21*.1/scaleConst },
				{ 0, -90, 0 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),
			prefab.weapon.hangar.quartz(
				{ -7*.1/scaleConst, 0, -19.5*.1/scaleConst },
				{ 0, -90, 0 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),
			prefab.weapon.hangar.quartz(
				{ -7*.1/scaleConst, 0, -18*.1/scaleConst },
				{ 0, -90, 0 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),
			prefab.weapon.hangar.quartz(
				{ -7*.1/scaleConst, 0, -16.5*.1/scaleConst },
				{ 0, -90, 0 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),
			prefab.weapon.hangar.quartz(
				{ -7*.1/scaleConst, 0, -15*.1/scaleConst },
				{ 0, -90, 0 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),
			prefab.weapon.hangar.quartz(
				{ -7*.1/scaleConst, 0, -13.5*.1/scaleConst },
				{ 0, -90, 0 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),

			prefab.weapon.hangar.quartz(
				{ 7*.1/scaleConst, 0, -21*.1/scaleConst },
				{ 0, 90, 0 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),
			prefab.weapon.hangar.quartz(
				{ 7*.1/scaleConst, 0, -19.5*.1/scaleConst },
				{ 0, 90, 0 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),
			prefab.weapon.hangar.quartz(
				{ 7*.1/scaleConst, 0, -18*.1/scaleConst },
				{ 0, 90, 0 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),
			prefab.weapon.hangar.quartz(
				{ 7*.1/scaleConst, 0, -16.5*.1/scaleConst },
				{ 0, 90, 0 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),
			prefab.weapon.hangar.quartz(
				{ 7*.1/scaleConst, 0, -15*.1/scaleConst },
				{ 0, 90, 0 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),
			prefab.weapon.hangar.quartz(
				{ 7*.1/scaleConst, 0, -13.5*.1/scaleConst },
				{ 0, 90, 0 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),
			
			-- prefab.part.emblem(
			-- 	{ 0, 3.95*.1/scaleConst, -9.5*.1/scaleConst},
			-- 	{ 0, 0, 0 },
			-- 	{ 1.5*.1/scaleConst, 1.5*.1/scaleConst, 1.5*.1/scaleConst },
			-- 	isGhost
			-- ),
			-- prefab.part.emblem(
			-- 	{ 0, -3.95*.1/scaleConst, -9.5*.1/scaleConst},
			-- 	{ 0, 0, 180 },
			-- 	{ 1.5*.1/scaleConst, 1.5*.1/scaleConst, 1.5*.1/scaleConst },
			-- 	isGhost
			-- ),
			prefab.ship.amethyst.thruster(scaleConst, isGhost),
		}
	}
	if isGhost then
		prefab_part.materials= {"arc_build","arc_build","arc_build","arc_build","arc_build",}
	end
	return prefab_part
end


function prefab.weapon_info.amethyst.core_aft.P()
	weapon_info = {
		prefab.weapon_info.laser.X(2),
		prefab.weapon_info.laser.L(4),
	}
	return weapon_info
end
function prefab.ship.amethyst.core_aft.P(scaleConst, isGhost)
	prefab_part = {
		name = "Amethyst-Core-Aft-P",
		mesh = "7-Amethyst/Amethyst-Core-Aft-P",
		materials = {"arc_teamGlow", "arc_hull", "arc_engine", "arc_teamColour", },
		position = {0,0,0},
		rotation = {0,0,0},
		scale = {1,1,1},
		parts={

			prefab.weapon.laser.X(
				{ 0*.1/scaleConst, 4.75*.1/scaleConst, -7*.1/scaleConst },
				{ 0, 0, 0 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),

			prefab.weapon.laser.X(
				{ 0*.1/scaleConst, -4.75*.1/scaleConst, -7*.1/scaleConst },
				{ 0, 0, 180 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),

			prefab.weapon.laser.L(
				{ -6*.1/scaleConst, 3.5*.1/scaleConst, -7*.1/scaleConst },
				{ 0, 0, 45 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),
			prefab.weapon.laser.L(
				{ 6*.1/scaleConst, 3.5*.1/scaleConst, -7*.1/scaleConst },
				{ 0, 0, -45 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),
			prefab.weapon.laser.L(
				{ -6*.1/scaleConst, -3.5*.1/scaleConst, -7*.1/scaleConst },
				{ 0, 0, 135 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),
			prefab.weapon.laser.L(
				{ 6*.1/scaleConst, -3.5*.1/scaleConst, -7*.1/scaleConst },
				{ 0, 0, -135 },
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
function prefab.weapon_info.amethyst.core_aft.B()
	weapon_info = {
		prefab.weapon_info.cannon.X(2),
		prefab.weapon_info.cannon.L(2),
		prefab.weapon_info.cannon.M(4),
	}
	return weapon_info
end
function prefab.ship.amethyst.core_aft.B(scaleConst, isGhost)
	prefab_part = {
		name = "Amethyst-Core-Aft-B",
		mesh = "7-Amethyst/Amethyst-Core-Aft-B",
		materials = {"arc_teamGlow", "arc_hull", "arc_engine", "arc_teamColour", },
		position = {0,0,0},
		rotation = {0,0,0},
		scale = {1,1,1},
		parts={

			prefab.weapon.cannon.X(
				{ 0*.1/scaleConst, 4.75*.1/scaleConst, -8.5*.1/scaleConst },
				{ 0, 0, 0 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),

			prefab.weapon.cannon.X(
				{ 0*.1/scaleConst, -4.75*.1/scaleConst, -8.5*.1/scaleConst },
				{ 0, 0, 180 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),

			prefab.weapon.cannon.M(
				{ -6*.1/scaleConst, 3.5*.1/scaleConst, -7*.1/scaleConst },
				{ 0, 0, 45 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),
			prefab.weapon.cannon.M(
				{ 6*.1/scaleConst, 3.5*.1/scaleConst, -7*.1/scaleConst },
				{ 0, 0, -45 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),
			prefab.weapon.cannon.M(
				{ -6*.1/scaleConst, -3.5*.1/scaleConst, -7*.1/scaleConst },
				{ 0, 0, 135 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),
			prefab.weapon.cannon.M(
				{ 6*.1/scaleConst, -3.5*.1/scaleConst, -7*.1/scaleConst },
				{ 0, 0, -135 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),

			prefab.weapon.cannon.L(
				{ -7.25*.1/scaleConst, 0*.1/scaleConst, -6.25*.1/scaleConst },
				{ 0, 0, 90 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),
			prefab.weapon.cannon.L(
				{ 7.25*.1/scaleConst, 0*.1/scaleConst, -6.25*.1/scaleConst },
				{ 0, 0, -90 },
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
function prefab.weapon_info.amethyst.core_aft.M()
	weapon_info = {
		prefab.weapon_info.missile.hls.X(8),
	}
	return weapon_info
end
function prefab.ship.amethyst.core_aft.M(scaleConst, isGhost)
	prefab_part = {
		name = "Amethyst-Core-Aft-M",
		mesh = "7-Amethyst/Amethyst-Core-Aft-M",
		materials = {"arc_hull_dark","arc_teamGlow", "arc_hull", "arc_engine", "arc_teamColour", },
		position = {0,0,0},
		rotation = {0,0,0},
		scale = {1,1,1},
		parts={

			prefab.weapon.missile.hls.X(
				{ -3*.1/scaleConst, 4.75*.1/scaleConst, -7*.1/scaleConst },
				{ 0, 0, 0 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),
			prefab.weapon.missile.hls.X(
				{ 3*.1/scaleConst, 4.75*.1/scaleConst, -7*.1/scaleConst },
				{ 0, 0, 0 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),
			prefab.weapon.missile.hls.X(
				{ -3*.1/scaleConst, -4.75*.1/scaleConst, -7*.1/scaleConst },
				{ 0, 0, 180 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),
			prefab.weapon.missile.hls.X(
				{ 3*.1/scaleConst, -4.75*.1/scaleConst, -7*.1/scaleConst },
				{ 0, 0, 180 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),

			prefab.weapon.missile.hls.X(
				{ -6*.1/scaleConst, 3.5*.1/scaleConst, -7*.1/scaleConst },
				{ 0, 0, 45 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),
			prefab.weapon.missile.hls.X(
				{ 6*.1/scaleConst, 3.5*.1/scaleConst, -7*.1/scaleConst },
				{ 0, 0, -45 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),
			prefab.weapon.missile.hls.X(
				{ -6*.1/scaleConst, -3.5*.1/scaleConst, -7*.1/scaleConst },
				{ 0, 0, 135 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),
			prefab.weapon.missile.hls.X(
				{ 6*.1/scaleConst, -3.5*.1/scaleConst, -7*.1/scaleConst },
				{ 0, 0, -135 },
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

function prefab.weapon_info.amethyst.core_aft.G()
	weapon_info = {
		prefab.weapon_info.lightning.X(3),
		prefab.weapon_info.lightning.L(2),
	}
	return weapon_info
end
function prefab.ship.amethyst.core_aft.G(scaleConst, isGhost)
	prefab_part = {
		name = "Amethyst-Core-Aft-G",
		mesh = "7-Amethyst/Amethyst-Core-Aft-G",
		materials = {"arc_hull_dark","arc_teamGlow", "arc_hull", "arc_engine", "arc_teamColour", },
		position = {0,0,0},
		rotation = {0,0,0},
		scale = {1,1,1},
		parts={

			prefab.weapon.lightning.X(
				{ -2.4999*.1/scaleConst, 4.75*.1/scaleConst, -8.5*.1/scaleConst },
				{ 0, 0, 0 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),
			prefab.weapon.lightning.X(
				{ 2.4999*.1/scaleConst, 4.75*.1/scaleConst, -8.5*.1/scaleConst },
				{ 0, 0, 0 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),

			prefab.weapon.lightning.X(
				{ 0*.1/scaleConst, -4.75*.1/scaleConst, -8.5*.1/scaleConst },
				{ 0, 0, 180 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),
			-- prefab.weapon.lightning.L(
			-- 	{ 0*.1/scaleConst, 4.75*.1/scaleConst, -4.75*.1/scaleConst },
			-- 	{ 0, 0, 0 },
			-- 	{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
			-- 	isGhost
			-- ),
			-- prefab.weapon.lightning.L(
			-- 	{ 0*.1/scaleConst, -4.75*.1/scaleConst, -4.75*.1/scaleConst },
			-- 	{ 0, 0, 180 },
			-- 	{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
			-- 	isGhost
			-- ),

			prefab.weapon.lightning.L(
				{ -7.25*.1/scaleConst, 0*.1/scaleConst, -6.25*.1/scaleConst },
				{ 0, 0, 90 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),
			prefab.weapon.lightning.L(
				{ 7.25*.1/scaleConst, 0*.1/scaleConst, -6.25*.1/scaleConst },
				{ 0, 0, -90 },
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

function prefab.weapon_info.amethyst.core_aft.A()
	weapon_info = {
		prefab.weapon_info.railgun.X(4),
	}
	return weapon_info
end
function prefab.ship.amethyst.core_aft.A(scaleConst, isGhost)
	prefab_part = {
		name = "Amethyst-Core-Aft-A",
		mesh = "7-Amethyst/Amethyst-Core-Aft-A",
		materials = {"arc_hull_dark","arc_teamGlow", "arc_hull", "arc_engine", "arc_teamColour", },
		position = {0,0,0},
		rotation = {0,0,0},
		scale = {1,1,1},
		parts={

			prefab.weapon.railgun.X(
				{ -2.5*.1/scaleConst, 4.5*.1/scaleConst, -7*.1/scaleConst },
				{ 0, 0, 0 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),
			prefab.weapon.railgun.X(
				{ 2.5*.1/scaleConst, 4.5*.1/scaleConst, -7*.1/scaleConst },
				{ 0, 0, 0 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),

			prefab.weapon.railgun.X(
				{ -2.5*.1/scaleConst, -4.5*.1/scaleConst, -7*.1/scaleConst },
				{ 0, 0, 180 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),
			prefab.weapon.railgun.X(
				{ 2.5*.1/scaleConst, -4.5*.1/scaleConst, -7*.1/scaleConst },
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

function prefab.weapon_info.amethyst.core_aft.C()
	weapon_info = functions.combineWeaponInfo({
		prefab.weapon_info.hangar.citrine(2),
		{prefab.weapon_info.hangar.quartz(8)},
		{prefab.weapon_info.laser.M(2)},
		-- prefab.weapon_info.missile.hls.S(4),
	});
	return weapon_info
end
function prefab.ship.amethyst.core_aft.C(scaleConst, isGhost)
	prefab_part = {
		name = "Amethyst-Core-Aft-C",
		mesh = "7-Amethyst/Amethyst-Core-Aft-C",
		materials = {"arc_hull_dark","arc_teamGlow", "arc_hull", "arc_engine", "arc_teamColour", },
		position = {0,0,0},
		rotation = {0,0,0},
		scale = {1,1,1},
		parts={
			prefab.weapon.hangar.citrine(
				{ -7*.1/scaleConst, 0, -7.75*.1/scaleConst },
				{ 0, -90, 0 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),
			prefab.weapon.hangar.citrine(
				{ 7*.1/scaleConst, 0, -7.75*.1/scaleConst },
				{ 0, 90, 0 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),

			prefab.weapon.hangar.quartz(
				{ -7*.1/scaleConst, 0, -11.5*.1/scaleConst },
				{ 0, -90, 0 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),
			prefab.weapon.hangar.quartz(
				{ -7*.1/scaleConst, 0, -4*.1/scaleConst },
				{ 0, -90, 0 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),
			prefab.weapon.hangar.quartz(
				{ -7*.1/scaleConst, 0, -2.5*.1/scaleConst },
				{ 0, -90, 0 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),
			prefab.weapon.hangar.quartz(
				{ -7*.1/scaleConst, 0, -1*.1/scaleConst },
				{ 0, -90, 0 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),

			prefab.weapon.hangar.quartz(
				{ 7*.1/scaleConst, 0, -11.5*.1/scaleConst },
				{ 0, 90, 0 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),
			prefab.weapon.hangar.quartz(
				{ 7*.1/scaleConst, 0, -4*.1/scaleConst },
				{ 0, 90, 0 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),
			prefab.weapon.hangar.quartz(
				{ 7*.1/scaleConst, 0, -2.5*.1/scaleConst },
				{ 0, 90, 0 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),
			prefab.weapon.hangar.quartz(
				{ 7*.1/scaleConst, 0, -1*.1/scaleConst },
				{ 0, 90, 0 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),

			prefab.weapon.laser.M(
				{ 0, 4.75*.1/scaleConst, -4.75*.1/scaleConst },
				{ 0, 0, 0 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),
			prefab.weapon.laser.M(
				{ 0, -4.75*.1/scaleConst, -4.75*.1/scaleConst },
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

function prefab.weapon_info.amethyst.core_fore.P()
	weapon_info = {
		prefab.weapon_info.laser.L(4),
		prefab.weapon_info.laser.M(2),
		prefab.weapon_info.laser.S(4),
	}
	return weapon_info
end
function prefab.ship.amethyst.core_fore.P(scaleConst, isGhost)
	prefab_part = {
		name = "Amethyst-Core-Fore-P",
		mesh = "7-Amethyst/Amethyst-Core-Fore-P",
		materials = {"arc_teamGlow", "arc_hull", "arc_engine", "arc_teamColour", },
		position = {0,0,0},
		rotation = {0,0,0},
		scale = {1,1,1},
		parts={

			prefab.weapon.laser.L(
				{ -3*.1/scaleConst, 3.25*.1/scaleConst, 4*.1/scaleConst },
				{ 0, 0, 0 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),
			prefab.weapon.laser.L(
				{ 3*.1/scaleConst, 3.25*.1/scaleConst, 4*.1/scaleConst },
				{ 0, 0, 0 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),
			prefab.weapon.laser.L(
				{ -3*.1/scaleConst, -3.25*.1/scaleConst, 4*.1/scaleConst },
				{ 0, 0, 180 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),
			prefab.weapon.laser.L(
				{ 3*.1/scaleConst, -3.25*.1/scaleConst, 4*.1/scaleConst },
				{ 0, 0, 180 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),

			prefab.weapon.laser.M(
				{ 0*.1/scaleConst, 3.25*.1/scaleConst, 7.75*.1/scaleConst },
				{ 0, 0, 0 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),
			prefab.weapon.laser.M(
				{ 0*.1/scaleConst, -3.25*.1/scaleConst, 7.75*.1/scaleConst },
				{ 0, 0, 180 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),

			prefab.weapon.laser.S(
				{ -6.25*.1/scaleConst, 2.25*.1/scaleConst, 5.5*.1/scaleConst },
				{ 0, 0, 45 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),
			prefab.weapon.laser.S(
				{ 6.25*.1/scaleConst, 2.25*.1/scaleConst, 5.5*.1/scaleConst },
				{ 0, 0, -45 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),
			prefab.weapon.laser.S(
				{ -6.25*.1/scaleConst, -2.25*.1/scaleConst, 5.5*.1/scaleConst },
				{ 0, 0, 145 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),
			prefab.weapon.laser.S(
				{ 6.25*.1/scaleConst, -2.25*.1/scaleConst, 5.5*.1/scaleConst },
				{ 0, 0, -145 },
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

function prefab.weapon_info.amethyst.core_fore.B()
	weapon_info = {
		prefab.weapon_info.cannon.X(2),
		prefab.weapon_info.cannon.M(4),
	}
	return weapon_info
end
function prefab.ship.amethyst.core_fore.B(scaleConst, isGhost)
	prefab_part = {
		name = "Amethyst-Core-Fore-B",
		mesh = "7-Amethyst/Amethyst-Core-Fore-B",
		materials = {"arc_teamGlow", "arc_hull", "arc_engine", "arc_teamColour", },
		position = {0,0,0},
		rotation = {0,0,0},
		scale = {1,1,1},
		parts={

			prefab.weapon.cannon.X(
				{ 0*.1/scaleConst, 3.25*.1/scaleConst, 5.5*.1/scaleConst },
				{ 0, 0, 0 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),
			prefab.weapon.cannon.X(
				{ 0*.1/scaleConst, -3.25*.1/scaleConst, 5.5*.1/scaleConst },
				{ 0, 0, 180 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),
			prefab.weapon.cannon.M(
				{ -6.25*.1/scaleConst, 2.25*.1/scaleConst, 5.5*.1/scaleConst },
				{ 0, 0, 45 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),
			prefab.weapon.cannon.M(
				{ 6.25*.1/scaleConst, 2.25*.1/scaleConst, 5.5*.1/scaleConst },
				{ 0, 0, -45 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),
			prefab.weapon.cannon.M(
				{ -6.25*.1/scaleConst, -2.25*.1/scaleConst, 5.5*.1/scaleConst },
				{ 0, 0, 135 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),
			prefab.weapon.cannon.M(
				{ 6.25*.1/scaleConst, -2.25*.1/scaleConst, 5.5*.1/scaleConst },
				{ 0, 0, -135 },
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
function prefab.weapon_info.amethyst.core_fore.M()
	weapon_info = {
		prefab.weapon_info.missile.vls.X(6),
	}
	return weapon_info
end
function prefab.ship.amethyst.core_fore.M(scaleConst, isGhost)
	prefab_part = {
		name = "Amethyst-Core-Fore-M",
		mesh = "7-Amethyst/Amethyst-Core-Fore-M",
		materials = {"arc_hull_dark","arc_teamGlow", "arc_hull", "arc_engine", "arc_teamColour", },
		position = {0,0,0},
		rotation = {0,0,0},
		scale = {1,1,1},
		parts={

			prefab.weapon.missile.vls.X(
				{ -3.25*.1/scaleConst, 3.25*.1/scaleConst, 5.5*.1/scaleConst },
				{ -90, 0, 0 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),
			prefab.weapon.missile.vls.X(
				{ 3.25*.1/scaleConst, 3.25*.1/scaleConst, 5.5*.1/scaleConst },
				{ -90, 0, 0 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),
			prefab.weapon.missile.vls.X(
				{ -3.25*.1/scaleConst, -3.25*.1/scaleConst, 5.5*.1/scaleConst },
				{ 90, 0, 180 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),
			prefab.weapon.missile.vls.X(
				{ 3.25*.1/scaleConst, -3.25*.1/scaleConst, 5.5*.1/scaleConst },
				{ 90, 0, 180 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),

			prefab.weapon.missile.vls.X(
				{ -3.25*.1/scaleConst, 2.75*.1/scaleConst, 10.75*.1/scaleConst },
				{ -90+18.4349, 0, 0 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),
			prefab.weapon.missile.vls.X(
				{ 3.25*.1/scaleConst, 2.75*.1/scaleConst, 10.75*.1/scaleConst },
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
function prefab.weapon_info.amethyst.core_fore.G()
	weapon_info = {
		prefab.weapon_info.lightning.X(2),
		prefab.weapon_info.lightning.L(2),
	}
	return weapon_info
end
function prefab.ship.amethyst.core_fore.G(scaleConst, isGhost)
	prefab_part = {
		name = "Amethyst-Core-Fore-G",
		mesh = "7-Amethyst/Amethyst-Core-Fore-G",
		materials = {"arc_hull_dark","arc_teamGlow", "arc_hull", "arc_engine", "arc_teamColour", },
		position = {0,0,0},
		rotation = {0,0,0},
		scale = {1,1,1},
		parts={

			prefab.weapon.lightning.X(
				{ 0*.1/scaleConst, 3.25*.1/scaleConst, 4*.1/scaleConst },
				{ 0, 0, 0 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),
			prefab.weapon.lightning.X(
				{ 0*.1/scaleConst, -3.25*.1/scaleConst, 4*.1/scaleConst },
				{ 0, 0, 180 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),
			prefab.weapon.lightning.L(
				{ -3.5*.1/scaleConst, 3.25*.1/scaleConst, 7.5*.1/scaleConst },
				{ 0, 0, 0 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),
			prefab.weapon.lightning.L(
				{ 3.5*.1/scaleConst, 3.25*.1/scaleConst, 7.5*.1/scaleConst },
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
function prefab.weapon_info.amethyst.core_fore.A()
	weapon_info = {
		prefab.weapon_info.railgun.X(6),
	}
	return weapon_info
end
function prefab.ship.amethyst.core_fore.A(scaleConst, isGhost)
	prefab_part = {
		name = "Amethyst-Core-Fore-A",
		mesh = "7-Amethyst/Amethyst-Core-Fore-A",
		materials = {"arc_hull_dark","arc_teamGlow", "arc_hull", "arc_engine", "arc_teamColour", },
		position = {0,0,0},
		rotation = {0,0,0},
		scale = {1,1,1},
		parts={

			prefab.weapon.railgun.X(
				{ -2.5*.1/scaleConst, 3*.1/scaleConst, 5.5*.1/scaleConst },
				{ 0, 0, 0 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),
			prefab.weapon.railgun.X(
				{ 2.5*.1/scaleConst, 3*.1/scaleConst, 5.5*.1/scaleConst },
				{ 0, 0, 0 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),

			prefab.weapon.railgun.X(
				{ 0*.1/scaleConst, -3*.1/scaleConst, 5.5*.1/scaleConst },
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

function prefab.weapon_info.amethyst.core_fore.C()
	weapon_info = functions.combineWeaponInfo({
		prefab.weapon_info.hangar.ruby(2),
		{prefab.weapon_info.hangar.quartz(6)},
		{prefab.weapon_info.laser.M(2)},
		-- prefab.weapon_info.missile.hls.S(4),
	})
	return weapon_info
end
function prefab.ship.amethyst.core_fore.C(scaleConst, isGhost)
	prefab_part = {
		name = "Amethyst-Core-Fore-C",
		mesh = "7-Amethyst/Amethyst-Core-Fore-C",
		materials = {"arc_hull_dark","arc_teamGlow", "arc_hull", "arc_engine", "arc_teamColour", },
		position = {0,0,0},
		rotation = {0,0,0},
		scale = {1,1,1},
		parts={
			prefab.weapon.hangar.ruby(
				{ -7*.1/scaleConst, 0, 5.5*.1/scaleConst },
				{ 0, -90, 0 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),
			prefab.weapon.hangar.ruby(
				{ 7*.1/scaleConst, 0, 5.5*.1/scaleConst },
				{ 0, 90, 0 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),


			prefab.weapon.hangar.quartz(
				{ -7*.1/scaleConst, 0, 1*.1/scaleConst },
				{ 0, -90, 0 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),
			prefab.weapon.hangar.quartz(
				{ -7*.1/scaleConst, 0, 2.5*.1/scaleConst },
				{ 0, -90, 0 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),
			prefab.weapon.hangar.quartz(
				{ -7*.1/scaleConst, 0, 8.5*.1/scaleConst },
				{ 0, -90, 0 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),

			prefab.weapon.hangar.quartz(
				{ 7*.1/scaleConst, 0, 1*.1/scaleConst },
				{ 0, 90, 0 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),
			prefab.weapon.hangar.quartz(
				{ 7*.1/scaleConst, 0, 2.5*.1/scaleConst },
				{ 0, 90, 0 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),
			prefab.weapon.hangar.quartz(
				{ 7*.1/scaleConst, 0, 8.5*.1/scaleConst },
				{ 0, 90, 0 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),

			prefab.weapon.laser.M(
				{ 0, 3.25*.1/scaleConst, 7.75*.1/scaleConst },
				{ 0, 0, 0 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),
			prefab.weapon.laser.M(
				{ 0, -3.25*.1/scaleConst, 7.75*.1/scaleConst },
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

function prefab.weapon_info.amethyst.core.P()
	weapon_info = functions.combineWeaponInfo({
		prefab.weapon_info.amethyst.core_aft.P(),
		prefab.weapon_info.amethyst.core_fore.P(),
	});
	return weapon_info
end

function prefab.ship.amethyst.core.P(scaleConst, isGhost)
	prefab_part = {
		name = "Amethyst-Core-P",
		position = {0,0,0},
		rotation = {0,0,0},
		scale = {1,1,1},
		parts={
			prefab.ship.amethyst.core_aft.P(scaleConst,isGhost),
			prefab.ship.amethyst.core_fore.P(scaleConst,isGhost),
		}
	}
	if isGhost then
		prefab_part.materials= {"arc_build","arc_build","arc_build","arc_build","arc_build",}
	end
	return prefab_part
end

function prefab.weapon_info.amethyst.core.B()
	weapon_info = functions.combineWeaponInfo({
		prefab.weapon_info.amethyst.core_aft.B(),
		prefab.weapon_info.amethyst.core_fore.B(),
	});
	return weapon_info
end

function prefab.ship.amethyst.core.B(scaleConst, isGhost)
	prefab_part = {
		name = "Amethyst-Core-B",
		position = {0,0,0},
		rotation = {0,0,0},
		scale = {1,1,1},
		parts={
			prefab.ship.amethyst.core_aft.B(scaleConst,isGhost),
			prefab.ship.amethyst.core_fore.B(scaleConst,isGhost),
		}
	}
	if isGhost then
		prefab_part.materials= {"arc_build","arc_build","arc_build","arc_build","arc_build",}
	end
	return prefab_part
end

function prefab.weapon_info.amethyst.core.M()
	weapon_info = functions.combineWeaponInfo({
		prefab.weapon_info.amethyst.core_aft.M(),
		prefab.weapon_info.amethyst.core_fore.M(),
	});
	return weapon_info
end

function prefab.ship.amethyst.core.M(scaleConst, isGhost)
	prefab_part = {
		name = "Amethyst-Core-M",
		position = {0,0,0},
		rotation = {0,0,0},
		scale = {1,1,1},
		parts={
			prefab.ship.amethyst.core_aft.M(scaleConst,isGhost),
			prefab.ship.amethyst.core_fore.M(scaleConst,isGhost),
		}
	}
	if isGhost then
		prefab_part.materials= {"arc_build","arc_build","arc_build","arc_build","arc_build",}
	end
	return prefab_part
end

function prefab.weapon_info.amethyst.core.G()
	weapon_info = functions.combineWeaponInfo({
		prefab.weapon_info.amethyst.core_aft.G(),
		prefab.weapon_info.amethyst.core_fore.G(),
	});
	return weapon_info
end

function prefab.ship.amethyst.core.G(scaleConst, isGhost)
	prefab_part = {
		name = "Amethyst-Core-G",
		position = {0,0,0},
		rotation = {0,0,0},
		scale = {1,1,1},
		parts={
			prefab.ship.amethyst.core_aft.G(scaleConst,isGhost),
			prefab.ship.amethyst.core_fore.G(scaleConst,isGhost),
		}
	}
	if isGhost then
		prefab_part.materials= {"arc_build","arc_build","arc_build","arc_build","arc_build",}
	end
	return prefab_part
end

function prefab.weapon_info.amethyst.core.A()
	weapon_info = functions.combineWeaponInfo({
		prefab.weapon_info.amethyst.core_aft.A(),
		prefab.weapon_info.amethyst.core_fore.A(),
	});
	return weapon_info
end

function prefab.ship.amethyst.core.A(scaleConst, isGhost)
	prefab_part = {
		name = "Amethyst-Core-A",
		position = {0,0,0},
		rotation = {0,0,0},
		scale = {1,1,1},
		parts={
			prefab.ship.amethyst.core_aft.A(scaleConst,isGhost),
			prefab.ship.amethyst.core_fore.A(scaleConst,isGhost),
		}
	}
	if isGhost then
		prefab_part.materials= {"arc_build","arc_build","arc_build","arc_build","arc_build",}
	end
	return prefab_part
end

function prefab.weapon_info.amethyst.core.C()
	weapon_info = functions.combineWeaponInfo({
		prefab.weapon_info.amethyst.core_aft.C(),
		prefab.weapon_info.amethyst.core_fore.C(),
	});
	return weapon_info
end
function prefab.ship.amethyst.core.C(scaleConst, isGhost)
	prefab_part = {
		name = "Amethyst-Core-C",
		position = {0,0,0},
		rotation = {0,0,0},
		scale = {1,1,1},
		parts={
			prefab.ship.amethyst.core_aft.C(scaleConst,isGhost),
			prefab.ship.amethyst.core_fore.C(scaleConst,isGhost),
		}
	}
	if isGhost then
		prefab_part.materials= {"arc_build","arc_build","arc_build","arc_build","arc_build",}
	end
	return prefab_part
end

function prefab.weapon_info.amethyst.bow.P()
	weapon_info = {
		prefab.weapon_info.laser.TS(1),
	}
	return weapon_info
end
function prefab.ship.amethyst.bow.P(scaleConst, isGhost)
	prefab_part = {
		name = "Amethyst-Bow-P",
		mesh = "7-Amethyst/Amethyst-Bow-P",
		materials = {"arc_teamGlow", "arc_hull", "arc_engine", "arc_teamColour", },
		position = {0,0,0},
		rotation = {0,0,0},
		scale = {1,1,1},
		parts={

			prefab.weapon.laser.TS(
				{ 0*.1/scaleConst, 0*.1/scaleConst, 14*.1/scaleConst },
				{ 0, 0, 0 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),
			{
				name = "Spinal",
				position = {0,0,0},
				rotation = {0,0,0},
				scale = {.1/scaleConst, .1/scaleConst, .1/scaleConst},
				parts={
			{
				name = "Spinal Barrel",
				mesh = "6-Sapphire/Spinal-Barrel",
				materials = isGhost and {"arc_build", "arc_build", "arc_build", "arc_build",} or {"arc_hull_dark","arc_teamGlow", "arc_hull", "arc_teamColour", },
				position = {0,0,14.5},
				rotation = {0,90,0},
				scale = {1,1,1},
			},
		}}
		}
	}
	if isGhost then
		prefab_part.materials= {"arc_build","arc_build","arc_build","arc_build","arc_build",}
	end
	return prefab_part
end
function prefab.weapon_info.amethyst.bow.B()
	weapon_info = {
		prefab.weapon_info.cannon.TS(1),
	}
	return weapon_info
end
function prefab.ship.amethyst.bow.B(scaleConst, isGhost)
	prefab_part = {
		name = "Amethyst-Bow-B",
		mesh = "7-Amethyst/Amethyst-Bow-B",
		materials = {"arc_teamGlow", "arc_hull", "arc_engine", "arc_teamColour", },
		position = {0,0,0},
		rotation = {0,0,0},
		scale = {1,1,1},
		parts={

			prefab.weapon.cannon.TS(
				{ 0*.1/scaleConst, 0*.1/scaleConst, 14*.1/scaleConst },
				{ 0, 0, 0 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),
			{
				name = "Spinal",
				position = {0,0,0},
				rotation = {0,0,0},
				scale = {.1/scaleConst, .1/scaleConst, .1/scaleConst},
				parts={
			{
				name = "Spinal Barrel",
				mesh = "6-Sapphire/Spinal-Barrel",
				materials = isGhost and {"arc_build", "arc_build", "arc_build", "arc_build",} or {"arc_hull_dark","arc_teamGlow", "arc_hull", "arc_teamColour", },
				position = {0,0,14.5001},
				rotation = {0,90,0},
				scale = {1,1,1},
			},
		}}
		}
	}
	if isGhost then
		prefab_part.materials= {"arc_build","arc_build","arc_build","arc_build","arc_build",}
	end
	return prefab_part
end
function prefab.weapon_info.amethyst.bow.M()
	weapon_info = {
		prefab.weapon_info.missile.vls.T(2),
	}
	return weapon_info
end
function prefab.ship.amethyst.bow.M(scaleConst, isGhost)
	prefab_part = {
		name = "Amethyst-Bow-M",
		mesh = "7-Amethyst/Amethyst-Bow-M",
		materials = {"arc_teamGlow", "arc_hull", "arc_engine", "arc_teamColour", },
		position = {0,0,0},
		rotation = {0,0,0},
		scale = {1,1,1},
		parts={

			prefab.weapon.missile.vls.T(
				{ -1.5*.1/scaleConst, 0*.1/scaleConst, 14.25*.1/scaleConst },
				{ 0, 0, 0 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),
			prefab.weapon.missile.vls.T(
				{ 1.5*.1/scaleConst, 0*.1/scaleConst, 14.25*.1/scaleConst },
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
function prefab.weapon_info.amethyst.bow.G()
	weapon_info = {
		prefab.weapon_info.lightning.TS(1),
	}
	return weapon_info
end
function prefab.ship.amethyst.bow.G(scaleConst, isGhost)
	prefab_part = {
		name = "Amethyst-Bow-G",
		mesh = "7-Amethyst/Amethyst-Bow-G",
		materials = {"arc_teamGlow", "arc_hull", "arc_engine", "arc_teamColour", },
		position = {0,0,0},
		rotation = {0,0,0},
		scale = {1,1,1},
		parts={

			prefab.weapon.lightning.TS(
				{ 0*.1/scaleConst, 0*.1/scaleConst, 14*.1/scaleConst },
				{ 0, 0, 0 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),
			{
				name = "Spinal",
				position = {0,0,0},
				rotation = {0,0,0},
				scale = {.1/scaleConst, .1/scaleConst, .1/scaleConst},
				parts={
			{
				name = "Spinal Barrel",
				mesh = "6-Sapphire/Spinal-Barrel",
				materials = isGhost and {"arc_build", "arc_build", "arc_build", "arc_build",} or {"arc_hull_dark","arc_teamGlow", "arc_hull", "arc_teamColour", },
				position = {0,0,14.5},
				rotation = {0,90,0},
				scale = {1,1,1},
			},
		}}
		}
	}
	if isGhost then
		prefab_part.materials= {"arc_build","arc_build","arc_build","arc_build","arc_build",}
	end
	return prefab_part
end
function prefab.weapon_info.amethyst.bow.A()
	weapon_info = {
		prefab.weapon_info.railgun.TS(1),
	}
	return weapon_info
end
function prefab.ship.amethyst.bow.A(scaleConst, isGhost)
	prefab_part = {
		name = "Amethyst-Bow-A",
		mesh = "7-Amethyst/Amethyst-Bow-A",
		materials = {"arc_hull_dark","arc_teamGlow", "arc_hull", "arc_engine", "arc_teamColour", },
		position = {0,0,0},
		rotation = {0,0,0},
		scale = {1,1,1},
		parts={

			prefab.weapon.railgun.TS(
				{ 0*.1/scaleConst, 0*.1/scaleConst, 14*.1/scaleConst },
				{ 0, 0, 0 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),

			{
				name = "Spinal",
				position = {0,0,0},
				rotation = {0,0,0},
				scale = {.1/scaleConst, .1/scaleConst, .1/scaleConst},
				parts={
			{
				name = "Spinal Barrel",
				mesh = "6-Sapphire/Spinal-Barrel",
				materials = isGhost and {"arc_build", "arc_build", "arc_build", "arc_build",} or {"arc_hull_dark","arc_teamGlow", "arc_hull", "arc_teamColour", },
				position = {0,0,14.5},
				rotation = {0,90,0},
				scale = {1,1,1},
			},
		}}

		}
	}
	if isGhost then
		prefab_part.materials= {"arc_build","arc_build","arc_build","arc_build","arc_build",}
	end
	return prefab_part
end

function prefab.weapon_info.amethyst.bow.C()
	weapon_info = {
		prefab.weapon_info.hangar.quartz(10),
		-- prefab.weapon_info.laser.S(2),
		-- prefab.weapon_info.missile.hls.S(4),
	}
	return weapon_info
end
function prefab.ship.amethyst.bow.C(scaleConst, isGhost)
	prefab_part = {
		name = "Amethyst-Bow-C",
		mesh = "7-Amethyst/Amethyst-Bow-C",
		materials = {"arc_hull_dark","arc_teamGlow", "arc_hull", "arc_engine", "arc_teamColour", },
		position = {0,0,0},
		rotation = {0,0,0},
		scale = {1,1,1},
		parts={
			prefab.weapon.hangar.quartz(
				{ -3*.1/scaleConst, 1*.1/scaleConst, 17*.1/scaleConst },
				{ 0, 0, 0 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),
			prefab.weapon.hangar.quartz(
				{ -1.5*.1/scaleConst, 1*.1/scaleConst, 17*.1/scaleConst },
				{ 0, 0, 0 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),
			prefab.weapon.hangar.quartz(
				{ -3*.1/scaleConst, -1*.1/scaleConst, 17*.1/scaleConst },
				{ 0, 0, 0 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),
			prefab.weapon.hangar.quartz(
				{ -1.5*.1/scaleConst, -1*.1/scaleConst, 17*.1/scaleConst },
				{ 0, 0, 0 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),

			prefab.weapon.hangar.quartz(
				{ 0*.1/scaleConst, 1*.1/scaleConst, 17*.1/scaleConst },
				{ 0, 0, 0 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),
			prefab.weapon.hangar.quartz(
				{ 0*.1/scaleConst, -1*.1/scaleConst, 17*.1/scaleConst },
				{ 0, 0, 0 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),

			prefab.weapon.hangar.quartz(
				{ 3*.1/scaleConst, 1*.1/scaleConst, 17*.1/scaleConst },
				{ 0, 0, 0 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),
			prefab.weapon.hangar.quartz(
				{ 1.5*.1/scaleConst, 1*.1/scaleConst, 17*.1/scaleConst },
				{ 0, 0, 0 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),
			prefab.weapon.hangar.quartz(
				{ 3*.1/scaleConst, -1*.1/scaleConst, 17*.1/scaleConst },
				{ 0, 0, 0 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),
			prefab.weapon.hangar.quartz(
				{ 1.5*.1/scaleConst, -1*.1/scaleConst, 17*.1/scaleConst },
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