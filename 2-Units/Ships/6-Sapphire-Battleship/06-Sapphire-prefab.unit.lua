prefab.ship.sapphire = {
	stern = {},
	core = {},
	bow = {}
}
prefab.weapon_info.sapphire = {
	stern = {},
	core = {},
	bow = {}
}

function prefab.ship.sapphire.thruster(scaleConst, isGhost)
	prefab_part = {
		name     = "Thruster",
		position = { 0, 0, -12.5*.1/scaleConst },
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
			{
				name     = "Thruster Plume",
				mesh     = "Thruster/Thruster-Plume",
				materials  = { "arc_thruster-inner", "arc_thruster-middle", "arc_thruster-outer" },
				position = { -3.25, 0, 0 }, --XYZ, Thruster subparts should all be on the same Y point, as they all scale along the parent's Y axis.
				rotation = { 0, 0, 0 },
				scale 	= { 4, 4, 4 },
			},
			{
				name     = "Thruster Plume",
				mesh     = "Thruster/Thruster-Plume",
				materials  = { "arc_thruster-inner", "arc_thruster-middle", "arc_thruster-outer" },
				position = { 3.25, 0, 0 }, --XYZ, Thruster subparts should all be on the same Y point, as they all scale along the parent's Y axis.
				rotation = { 0, 0, 0 },
				scale 	= { 4, 4, 4 },
			},
		}
	end
	return prefab_part
end

function prefab.weapon_info.sapphire.stern.G()
	weapon_info = {
		prefab.weapon_info.lightning.M(2),
		prefab.weapon_info.lightning.S(4),
	}
	return weapon_info
end
function prefab.ship.sapphire.stern.G(scaleConst, isGhost)
	prefab_part = {
		name = "Sapphire-Stern-G",
		mesh = "6-Sapphire/Sapphire-Stern-G",
		materials = {"arc_hull_dark","arc_teamGlow", "arc_hull", "arc_engine", "arc_teamColour", },
		position = {0,0,0},
		rotation = {0,0,0},
		scale = {1,1,1},
		parts={
			prefab.weapon.lightning.M(
				{ 0, 3.75*.1/scaleConst, -9.5*.1/scaleConst },
				{ 0, 0, 0 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),
			prefab.weapon.lightning.M(
				{ 0, -3.75*.1/scaleConst, -9.5*.1/scaleConst },
				{ 0, 0, 180 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),


			prefab.weapon.lightning.S(
				{ -1*.1/scaleConst, 3.25*.1/scaleConst, -5.75*.1/scaleConst },
				{ 0, 0, 0 },
				{ .1001/scaleConst, .1001/scaleConst, .1001/scaleConst },
				isGhost
			),
			prefab.weapon.lightning.S(
				{ 1*.1/scaleConst, 3.25*.1/scaleConst, -5.75*.1/scaleConst },
				{ 0, 0, 0 },
				{ .1001/scaleConst, .1001/scaleConst, .1001/scaleConst },
				isGhost
			),
			prefab.weapon.lightning.S(
				{ -1*.1/scaleConst, -3.25*.1/scaleConst, -5.75*.1/scaleConst },
				{ 0, 0, 180 },
				{ .1001/scaleConst, .1001/scaleConst, .1001/scaleConst },
				isGhost
			),
			prefab.weapon.lightning.S(
				{ 1*.1/scaleConst, -3.25*.1/scaleConst, -5.75*.1/scaleConst },
				{ 0, 0, 180 },
				{ .1001/scaleConst, .1001/scaleConst, .1001/scaleConst },
				isGhost
			),

			
			prefab.part.emblem(
				{ 0, 3.25*.1/scaleConst, -12.5*.1/scaleConst},
				{ -18.4349, 0, 0 },
				{ 3*.1/scaleConst, 3*.1/scaleConst, 3*.1/scaleConst },
				isGhost
			),
			prefab.part.emblem(
				{ 0, -3.25*.1/scaleConst, -12.5*.1/scaleConst},
				{ 18.4349, 0, 180 },
				{ 3*.1/scaleConst, 3*.1/scaleConst, 3*.1/scaleConst },
				isGhost
			),
			prefab.ship.sapphire.thruster(scaleConst, isGhost),
		}
	}
	if isGhost then
		prefab_part.materials= {"arc_build","arc_build","arc_build","arc_build","arc_build",}
	end
	return prefab_part
end

function prefab.weapon_info.sapphire.stern.A()
	weapon_info = {
		prefab.weapon_info.railgun.L(2),
	}
	return weapon_info
end
function prefab.ship.sapphire.stern.A(scaleConst, isGhost)
	prefab_part = {
		name = "Sapphire-Stern-A",
		mesh = "6-Sapphire/Sapphire-Stern-A",
		materials = {"arc_hull_dark","arc_teamGlow", "arc_hull", "arc_engine", "arc_teamColour", },
		position = {0,0,0},
		rotation = {0,0,0},
		scale = {1,1,1},
		parts={
			prefab.weapon.railgun.L(
				{ 0, 3.5*.1/scaleConst, -8.75*.1/scaleConst },
				{ 0, 0, 0 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),
			prefab.weapon.railgun.L(
				{ 0, -3.5*.1/scaleConst, -8.75*.1/scaleConst },
				{ 0, 0, 180 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),
			
			prefab.part.emblem(
				{ 0, 3.25*.1/scaleConst, -12.5*.1/scaleConst},
				{ -18.4349, 0, 0 },
				{ 3*.1/scaleConst, 3*.1/scaleConst, 3*.1/scaleConst },
				isGhost
			),
			prefab.part.emblem(
				{ 0, -3.25*.1/scaleConst, -12.5*.1/scaleConst},
				{ 18.4349, 0, 180 },
				{ 3*.1/scaleConst, 3*.1/scaleConst, 3*.1/scaleConst },
				isGhost
			),
			prefab.ship.sapphire.thruster(scaleConst, isGhost),
		}
	}
	if isGhost then
		prefab_part.materials= {"arc_build","arc_build","arc_build","arc_build","arc_build",}
	end
	return prefab_part
end

function prefab.weapon_info.sapphire.stern.C()
	weapon_info = {
		prefab.weapon_info.hangar.quartz(2),
		prefab.weapon_info.laser.S(2),
		prefab.weapon_info.missile.hls.S(4),
	}
	return weapon_info
end
function prefab.ship.sapphire.stern.C(scaleConst, isGhost)
	prefab_part = {
		name = "Sapphire-Stern-C",
		mesh = "6-Sapphire/Sapphire-Stern-C",
		materials = {"arc_hull_dark","arc_teamGlow", "arc_hull", "arc_engine", "arc_teamColour", },
		position = {0,0,0},
		rotation = {0,0,0},
		scale = {1,1,1},
		parts={
			prefab.weapon.hangar.quartz(
				{ -5*.1/scaleConst, 0, -5.75*.1/scaleConst },
				{ 0, -90, 0 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),
			prefab.weapon.hangar.quartz(
				{ 5*.1/scaleConst, 0, -5.75*.1/scaleConst },
				{ 0, 90, 0 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),

			prefab.weapon.laser.S(
				{ 0, 3.25*.1/scaleConst, -6.5*.1/scaleConst },
				{ 0, 0, 0 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),
			prefab.weapon.laser.S(
				{ 0, -3.25*.1/scaleConst, -6.5*.1/scaleConst },
				{ 0, 0, 180 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),

			prefab.weapon.missile.hls.S(
				{ -2*.1/scaleConst, 3*.1/scaleConst, -9.75*.1/scaleConst },
				{ 0, 0, 0 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),
			prefab.weapon.missile.hls.S(
				{ 2*.1/scaleConst, 3*.1/scaleConst, -9.75*.1/scaleConst },
				{ 0, 0, 0 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),
			prefab.weapon.missile.hls.S(
				{ -2*.1/scaleConst, -3*.1/scaleConst, -9.75*.1/scaleConst },
				{ 0, 0, 180 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),
			prefab.weapon.missile.hls.S(
				{ 2*.1/scaleConst, -3*.1/scaleConst, -9.75*.1/scaleConst },
				{ 0, 0, 180 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),

			
			prefab.part.emblem(
				{ 0, 3.95*.1/scaleConst, -9.5*.1/scaleConst},
				{ 0, 0, 0 },
				{ 1.5*.1/scaleConst, 1.5*.1/scaleConst, 1.5*.1/scaleConst },
				isGhost
			),
			prefab.part.emblem(
				{ 0, -3.95*.1/scaleConst, -9.5*.1/scaleConst},
				{ 0, 0, 180 },
				{ 1.5*.1/scaleConst, 1.5*.1/scaleConst, 1.5*.1/scaleConst },
				isGhost
			),
			prefab.ship.sapphire.thruster(scaleConst, isGhost),
		}
	}
	if isGhost then
		prefab_part.materials= {"arc_build","arc_build","arc_build","arc_build","arc_build",}
	end
	return prefab_part
end



function prefab.weapon_info.sapphire.core.G()
	weapon_info = {
		prefab.weapon_info.lightning.L(1),
		prefab.weapon_info.lightning.L(1),
		prefab.weapon_info.lightning.M(2),
		prefab.weapon_info.lightning.S(2),
	}
	return weapon_info
end
function prefab.ship.sapphire.core.G(scaleConst, isGhost)
	prefab_part = {
		name = "Sapphire-Core-G",
		mesh = "6-Sapphire/Sapphire-Core-G",
		materials = {"arc_hull_dark","arc_teamGlow", "arc_hull", "arc_teamColour", },
		position = {0,0,0},
		rotation = {0,0,0},
		scale = {1,1,1},
		parts={
			prefab.weapon.lightning.L(
				{ 0, 2.75*.1/scaleConst, -.75*.1/scaleConst },
				{ 0, 0, 0 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),
			prefab.weapon.lightning.L(
				{ 0, -2.75*.1/scaleConst, -.75*.1/scaleConst },
				{ 0, 0, 180 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),


			prefab.weapon.lightning.M(
				{ -4.75*.1/scaleConst, 1.75*.1/scaleConst, -.75*.1/scaleConst },
				{ 0, 0, 45 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),
			prefab.weapon.lightning.M(
				{ 4.75*.1/scaleConst, 1.75*.1/scaleConst, -.75*.1/scaleConst },
				{ 0, 0, -45 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),
			prefab.weapon.lightning.S(
				{ -4.75*.1/scaleConst, -1.75*.1/scaleConst, -.75*.1/scaleConst },
				{ 0, 0, 135 },
				{ .100/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),
			prefab.weapon.lightning.S(
				{ 4.75*.1/scaleConst, -1.75*.1/scaleConst, -.75*.1/scaleConst },
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

function prefab.weapon_info.sapphire.core.A()
	weapon_info = {
		prefab.weapon_info.railgun.L(2),
		prefab.weapon_info.railgun.L(1),
		prefab.weapon_info.railgun.M(1),
	}
	return weapon_info
end
function prefab.ship.sapphire.core.A(scaleConst, isGhost)
	prefab_part = {
		name = "Sapphire-Core-A",
		mesh = "6-Sapphire/Sapphire-Core-A",
		materials = {"arc_hull_dark","arc_teamGlow", "arc_hull", "arc_teamColour", },
		position = {0,0,0},
		rotation = {0,0,0},
		scale = {1,1,1},
		parts={
			prefab.weapon.railgun.L(
				{ -2*.1/scaleConst, 2.5*.1/scaleConst, -.75*.1/scaleConst },
				{ 0, 0, 0 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),
			prefab.weapon.railgun.L(
				{ 2*.1/scaleConst, 2.5*.1/scaleConst, -.75*.1/scaleConst },
				{ 0, 0, 0 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),
			prefab.weapon.railgun.L(
				{ 0, -2.5*.1/scaleConst, -.75*.1/scaleConst },
				{ 0, 0, 180 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),

			prefab.weapon.railgun.M(
				{ 0, -2*.1/scaleConst, 3*.1/scaleConst },
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

function prefab.weapon_info.sapphire.core.C()
	weapon_info = {
		prefab.weapon_info.hangar.quartz(6),
		prefab.weapon_info.missile.hls.M(2),
	}
	return weapon_info
end
function prefab.ship.sapphire.core.C(scaleConst, isGhost)
	prefab_part = {
		name = "Sapphire-Core-C",
		mesh = "6-Sapphire/Sapphire-Core-C",
		materials = {"arc_hull_dark","arc_teamGlow", "arc_hull", "arc_teamColour", },
		position = {0,0,0},
		rotation = {0,0,0},
		scale = {1,1,1},
		parts={
			prefab.weapon.hangar.quartz(
				{ -5*.1/scaleConst, 0, -3.75*.1/scaleConst },
				{ 0, -90, 0 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),
			prefab.weapon.hangar.quartz(
				{ -5*.1/scaleConst, 0, -2.25*.1/scaleConst },
				{ 0, -90, 0 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),
			prefab.weapon.hangar.quartz(
				{ -5*.1/scaleConst, 0, -.75*.1/scaleConst },
				{ 0, -90, 0 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),
			prefab.weapon.hangar.quartz(
				{ 5*.1/scaleConst, 0, -3.75*.1/scaleConst },
				{ 0, 90, 0 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),
			prefab.weapon.hangar.quartz(
				{ 5*.1/scaleConst, 0, -2.25*.1/scaleConst },
				{ 0, 90, 0 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),
			prefab.weapon.hangar.quartz(
				{ 5*.1/scaleConst, 0, -.75*.1/scaleConst },
				{ 0, 90, 0 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),

			prefab.weapon.missile.hls.M(
				{ -5*.1/scaleConst, 0, 1.375*.1/scaleConst },
				{ 0, 0, 90 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),
			prefab.weapon.missile.hls.M(
				{ 5*.1/scaleConst, 0, 1.375*.1/scaleConst },
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




function prefab.weapon_info.sapphire.bow.G()
	weapon_info = {
		prefab.weapon_info.lightning.M(2),
		prefab.weapon_info.lightning.M(2),
	}
	return weapon_info
end
function prefab.ship.sapphire.bow.G(scaleConst, isGhost)
	prefab_part = {
		name = "Sapphire-Bow-G",
		mesh = "6-Sapphire/Sapphire-Bow-G",
		materials = {"arc_teamGlow", "arc_hull", "arc_teamColour", },
		position = {0,0,0},
		rotation = {0,0,0},
		scale = {1,1,1},
		parts={
			prefab.weapon.lightning.M(
				{ -2*.1/scaleConst, 1.75*.1/scaleConst, 6.75*.1/scaleConst },
				{ 0, 0, 0 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),
			prefab.weapon.lightning.M(
				{ 2*.1/scaleConst, 1.75*.1/scaleConst, 6.75*.1/scaleConst },
				{ 0, 0, 0 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),
			prefab.weapon.lightning.M(
				{ -2*.1/scaleConst, -1.75*.1/scaleConst, 6.75*.1/scaleConst },
				{ 0, 0, 180 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),
			prefab.weapon.lightning.M(
				{ 2*.1/scaleConst, -1.75*.1/scaleConst, 6.75*.1/scaleConst },
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

function prefab.weapon_info.sapphire.bow.A()
	weapon_info = {
		prefab.weapon_info.railgun.L(2),
	}
	return weapon_info
end
function prefab.ship.sapphire.bow.A(scaleConst, isGhost)
	prefab_part = {
		name = "Sapphire-Bow-A",
		mesh = "6-Sapphire/Sapphire-Bow-A",
		materials = {"arc_hull_dark","arc_teamGlow", "arc_hull", "arc_teamColour", },
		position = {0,0,0},
		rotation = {0,0,0},
		scale = {1,1,1},
		parts={
			prefab.weapon.railgun.L(
				{ 0, 1.5*.1/scaleConst, 7.25*.1/scaleConst },
				{ 0, 0, 0 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost
			),
			prefab.weapon.railgun.L(
				{ 0, -1.5*.1/scaleConst, 7.25*.1/scaleConst },
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

function prefab.weapon_info.sapphire.bow.S()
	weapon_info = {
		prefab.weapon_info.lightning.XS(1),
	}
	return weapon_info
end
function prefab.ship.sapphire.bow.S(scaleConst, isGhost)
	spinal_mats = isGhost and {"arc_build", "arc_build", "arc_build",} or {"arc_teamGlow", "arc_hull", "arc_teamColour", };
	prefab_part = {
		name = "Sapphire-Bow-S",
		mesh = "6-Sapphire/Sapphire-Bow-S",
		materials = {"arc_teamGlow", "arc_hull", "arc_teamColour", },
		position = {0,0,0},
		rotation = {0,0,0},
		scale = {1,1,1},
		parts={
			prefab.weapon.lightning.XS(
				{ 0, 0, 6.5*.1/scaleConst },
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
						position = {0,0,7},
						rotation = {0,90,0},
						scale = {1,1,1},
					},
					{
						name = "Spinal Ring",
						mesh = "6-Sapphire/Spinal-Ring",
						materials = spinal_mats,
						position = {0,0,13.25},
						rotation = {0,90,0},
						scale = {1,1,1},
					},
					{
						name = "Spinal Ring",
						mesh = "6-Sapphire/Spinal-Ring",
						materials = spinal_mats,
						position = {0,0,13.25-2.5},
						rotation = {0,90,0},
						scale = {1,1,1},
					},
					{
						name = "Spinal Ring",
						mesh = "6-Sapphire/Spinal-Ring",
						materials = spinal_mats,
						position = {0,0,13.25-5},
						rotation = {0,90,0},
						scale = {1,1,1},
					},
				}
			}
			
		}
	}
	if isGhost then
		prefab_part.materials= {"arc_build","arc_build","arc_build","arc_build","arc_build",}
	end
	return prefab_part
end