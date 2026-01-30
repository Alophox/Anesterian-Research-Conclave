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

function prefab.ship.aquamarine.thruster(scaleConst, isGhost, ghostIndex, ghostMat)
	if(ghostIndex==nil) then ghostIndex=0 end
	if(ghostMat==nil) then ghostMat="arc_build" end
	if(ghostIndex < 0) then return {}; end
	if(not isGhost and ghostIndex < 0) then return {}; end
	prefab_part = {
		name     = "Thruster",
		position = { 0, 0, -10.5 },
		rotation = { 0, 0, 0 },
		scale 	= { 1, 1, 1, },
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
				materials  = { "arc_thruster_teamGlow", "arc_thruster-middle_teamGlow", "arc_thruster-outer_teamGlow" },
				position = { 0, 0, 0 }, --XYZ, Thruster subparts should all be on the same Y point, as they all scale along the parent's Y axis.
				rotation = { 0, 0, 0 },
				scale 	= { 5, 5, 5 },
			},
			{
				name     = "Thruster Plume",
				mesh     = "Thruster/Thruster-Plume",
				materials  = { "arc_thruster_teamGlow", "arc_thruster-middle_teamGlow", "arc_thruster-outer_teamGlow" },
				position = { -2.5, 0, 0 }, --XYZ, Thruster subparts should all be on the same Y point, as they all scale along the parent's Y axis.
				rotation = { 0, 0, 0 },
				scale 	= { 3, 3, 3 },
			},
			{
				name     = "Thruster Plume",
				mesh     = "Thruster/Thruster-Plume",
				materials  = { "arc_thruster_teamGlow", "arc_thruster-middle_teamGlow", "arc_thruster-outer_teamGlow" },
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
function prefab.ship.aquamarine.stern.P(scaleConst, isGhost, ghostIndex, ghostMat)
	if(ghostIndex==nil) then ghostIndex=0 end
	if(ghostMat==nil) then ghostMat="arc_build" end
	if(ghostIndex < 0) then return {}; end
	if(not isGhost and ghostIndex < 0) then return {}; end
	prefab_part = {
		name = "Aquamarine-Stern-P",
		mesh = "5-Aquamarine/Aquamarine-Stern-P",
		materials = {"arc_hull_dark","arc_teamGlow", "arc_hull", "arc_engine", "arc_teamColour", },
		position = {0,0,0},
		rotation = {0,0,0},
		scale = {.1/scaleConst, .1/scaleConst, .1/scaleConst,},
		parts={
			prefab.weapon.laser.M(
				{ 0, 3.25, -7.5 },
				{ 0, 0, 0 },
				{ 1, 1, 1, },
				isGhost, ghostIndex, ghostMat
			),
			prefab.weapon.laser.M(
				{ 0, -3.25, -7.5 },
				{ 0, 0, 180 },
				{ 1, 1, 1, },
				isGhost, ghostIndex, ghostMat
			),

			prefab.weapon.laser.S(
				{ -4.25, 0, -7.5 },
				{ 0, 0, 90 },
				{ 1, 1, 1, },
				isGhost, ghostIndex, ghostMat
			),
			prefab.weapon.laser.S(
				{ 4.25, 0, -7.5 },
				{ 0, 0, -90 },
				{ 1, 1, 1, },
				isGhost, ghostIndex, ghostMat
			),
			
			prefab.part.emblem(
				{ 0, 2.75, -10.5},
				{ -18.4349, 0, 0 },
				{ 2.5, 2.5, 2.5 },
				isGhost, ghostIndex, ghostMat
			),
			prefab.part.emblem(
				{ 0, -2.75, -10.5},
				{ 18.4349, 0, 180 },
				{ 2.5, 2.5, 2.5 },
				isGhost, ghostIndex, ghostMat
			),
			prefab.ship.aquamarine.thruster(scaleConst, isGhost, ghostIndex),

			prefab.ship.aquamarine.stern.P(.1, isGhost, ghostIndex-1, ghostMat),
		}
	}
	if isGhost then
		if (ghostMat == "arc_aegis") then
			prefab_part.aegisVisual = true;
		end
		prefab_part.materials= {ghostMat..ghostIndex,ghostMat..ghostIndex,ghostMat..ghostIndex,ghostMat..ghostIndex,ghostMat..ghostIndex,}
	end
	return prefab_part
end

function prefab.weapon_info.aquamarine.stern.B()
	weapon_info = {
		prefab.weapon_info.cannon.M(2),
		prefab.weapon_info.cannon.S(2),
	}
	return weapon_info
end
function prefab.ship.aquamarine.stern.B(scaleConst, isGhost, ghostIndex, ghostMat)
	if(ghostIndex==nil) then ghostIndex=0 end
	if(ghostMat==nil) then ghostMat="arc_build" end
	if(ghostIndex < 0) then return {}; end
	if(not isGhost and ghostIndex < 0) then return {}; end
	prefab_part = {
		name = "Aquamarine-Stern-B",
		mesh = "5-Aquamarine/Aquamarine-Stern-B",
		materials = {"arc_hull_dark","arc_teamGlow", "arc_hull", "arc_engine", "arc_teamColour", },
		position = {0,0,0},
		rotation = {0,0,0},
		scale = {.1/scaleConst, .1/scaleConst, .1/scaleConst,},
		parts={
			prefab.weapon.cannon.S(
				{ -0, 3.25, -7.5 },
				{ 0, 0, 0 },
				{ 1, 1, 1, },
				isGhost, ghostIndex, ghostMat
			),
			-- prefab.weapon.cannon.S(
			-- 	{ 1.5, 2.75, -7.25 },
			-- 	{ 0, 0, 0 },
			-- 	{ 1, 1, 1, },
			-- 	isGhost
			-- ),
			prefab.weapon.cannon.S(
				{ -0, -3.25, -7.5 },
				{ 0, 0, 180 },
				{ 1, 1, 1, },
				isGhost, ghostIndex, ghostMat
			),
			-- prefab.weapon.cannon.S(
			-- 	{ 1.5, -2.75, -7.25 },
			-- 	{ 0, 0, 180 },
			-- 	{ 1, 1, 1, },
			-- 	isGhost
			-- ),

			prefab.weapon.cannon.M(
				{ -4.25, 0, -7.5 },
				{ 0, 0, 90 },
				{ 1, 1, 1, },
				isGhost, ghostIndex, ghostMat
			),
			prefab.weapon.cannon.M(
				{ 4.25, 0, -7.5 },
				{ 0, 0, -90 },
				{ 1, 1, 1, },
				isGhost, ghostIndex, ghostMat
			),
			
			prefab.part.emblem(
				{ 0, 2.75, -10.5},
				{ -18.4349, 0, 0 },
				{ 2.5, 2.5, 2.5 },
				isGhost, ghostIndex, ghostMat
			),
			prefab.part.emblem(
				{ 0, -2.75, -10.5},
				{ 18.4349, 0, 180 },
				{ 2.5, 2.5, 2.5 },
				isGhost, ghostIndex, ghostMat
			),
			prefab.ship.aquamarine.thruster(scaleConst, isGhost, ghostIndex),

			prefab.ship.aquamarine.stern.B(.1, isGhost, ghostIndex-1, ghostMat),

		}
	}
	if isGhost then
		if (ghostMat == "arc_aegis") then
			prefab_part.aegisVisual = true;
		end
		prefab_part.materials= {ghostMat..ghostIndex,ghostMat..ghostIndex,ghostMat..ghostIndex,ghostMat..ghostIndex,ghostMat..ghostIndex,}
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
function prefab.ship.aquamarine.stern.M(scaleConst, isGhost, ghostIndex, ghostMat)
	if(ghostIndex==nil) then ghostIndex=0 end
	if(ghostMat==nil) then ghostMat="arc_build" end
	if(ghostIndex < 0) then return {}; end
	if(not isGhost and ghostIndex < 0) then return {}; end
	prefab_part = {
		name = "Aquamarine-Stern-M",
		mesh = "5-Aquamarine/Aquamarine-Stern-M",
		materials = {"arc_hull_dark","arc_teamGlow", "arc_hull", "arc_engine", "arc_teamColour", },
		position = {0,0,0},
		rotation = {0,0,0},
		scale = {.1/scaleConst, .1/scaleConst, .1/scaleConst,},
		parts={
			prefab.weapon.missile.vls.L(
				{ -1.5, 2.75, -7.5 },
				{ -90, 0, 0 },
				{ 1, 1, 1, },
				isGhost, ghostIndex, ghostMat
			),
			prefab.weapon.missile.vls.L(
				{ 1.5, 2.75, -7.5 },
				{ -90, 0, 0 },
				{ 1, 1, 1, },
				isGhost, ghostIndex, ghostMat
			),
			prefab.weapon.missile.vls.M(
				{ -1.5, -2.75, -7.5 },
				{ 90, 0, 180 },
				{ 1, 1, 1, },
				isGhost, ghostIndex, ghostMat
			),
			prefab.weapon.missile.vls.M(
				{ 1.5, -2.75, -7.5 },
				{ 90, 0, 180 },
				{ 1, 1, 1, },
				isGhost, ghostIndex, ghostMat
			),
			
			prefab.part.emblem(
				{ 0, 2.5, -9},
				{ 0, 0, 0 },
				{ 1.5, 1.5, 1.5 },
				isGhost, ghostIndex, ghostMat
			),
			prefab.part.emblem(
				{ 0, -2.5, -9},
				{ 0, 0, 180 },
				{ 1.5, 1.5, 1.5 },
				isGhost, ghostIndex, ghostMat
			),
			prefab.ship.aquamarine.thruster(scaleConst, isGhost, ghostIndex),

			prefab.ship.aquamarine.stern.M(.1, isGhost, ghostIndex-1, ghostMat),

		}
	}
	if isGhost then
		if (ghostMat == "arc_aegis") then
			prefab_part.aegisVisual = true;
		end
		prefab_part.materials= {ghostMat..ghostIndex,ghostMat..ghostIndex,ghostMat..ghostIndex,ghostMat..ghostIndex,ghostMat..ghostIndex,}
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
function prefab.ship.aquamarine.core.P(scaleConst, isGhost, ghostIndex, ghostMat)
	if(ghostIndex==nil) then ghostIndex=0 end
	if(ghostMat==nil) then ghostMat="arc_build" end
	if(ghostIndex < 0) then return {}; end
	if(not isGhost and ghostIndex < 0) then return {}; end
	prefab_part = {
		name = "Aquamarine-Core-P",
		mesh = "5-Aquamarine/Aquamarine-Core-P",
		materials = {"arc_hull_dark","arc_teamGlow", "arc_hull", "arc_teamColour", },
		position = {0,0,0},
		rotation = {0,0,0},
		scale = {.1/scaleConst, .1/scaleConst, .1/scaleConst,},
		parts={
			prefab.weapon.laser.L(
				{ 0, 2.75, -1.75 },
				{ 0, 0, 0 },
				{ 1, 1, 1, },
				isGhost, ghostIndex, ghostMat
			),
			prefab.weapon.laser.L(
				{ 0, -2.75, -1.75 },
				{ 0, 0, 180 },
				{ 1, 1, 1, },
				isGhost, ghostIndex, ghostMat
			),

			prefab.weapon.laser.S(
				{ 0, 2.25, 2 },
				{ 18.4349, 0, 0 },
				{ 1, 1, 1, },
				isGhost, ghostIndex, ghostMat
			),
			prefab.weapon.laser.S(
				{ 0, -2.25, 2 },
				{ -18.4349, 0, 180 },
				{ 1, 1, 1, },
				isGhost, ghostIndex, ghostMat
			),

			prefab.ship.aquamarine.core.P(.1, isGhost, ghostIndex-1, ghostMat),

		}
	}
	if isGhost then
		if (ghostMat == "arc_aegis") then
			prefab_part.aegisVisual = true;
		end
		prefab_part.materials= {ghostMat..ghostIndex,ghostMat..ghostIndex,ghostMat..ghostIndex,ghostMat..ghostIndex,ghostMat..ghostIndex,}
	end
	return prefab_part
end

function prefab.weapon_info.aquamarine.core.B()
	weapon_info = {
		prefab.weapon_info.cannon.L(2),
		prefab.weapon_info.cannon.S(2),
	}
	return weapon_info
end
function prefab.ship.aquamarine.core.B(scaleConst, isGhost, ghostIndex, ghostMat)
	if(ghostIndex==nil) then ghostIndex=0 end
	if(ghostMat==nil) then ghostMat="arc_build" end
	if(ghostIndex < 0) then return {}; end
	if(not isGhost and ghostIndex < 0) then return {}; end
	prefab_part = {
		name = "Aquamarine-Core-B",
		mesh = "5-Aquamarine/Aquamarine-Core-B",
		materials = {"arc_hull_dark","arc_teamGlow", "arc_hull", "arc_teamColour", },
		position = {0,0,0},
		rotation = {0,0,0},
		scale = {.1/scaleConst, .1/scaleConst, .1/scaleConst,},
		parts={
			prefab.weapon.cannon.L(
				{ 0, 2.75, -1.75 },
				{ 0, 0, 0 },
				{ 1, 1, 1, },
				isGhost, ghostIndex, ghostMat
			),
			prefab.weapon.cannon.L(
				{ 0, -2.75, -1.75 },
				{ 0, 0, 180 },
				{ 1, 1, 1, },
				isGhost, ghostIndex, ghostMat
			),

			prefab.weapon.cannon.S(
				{ -4.25, 0, -.25 },
				{ 0, 0, 90 },
				{ 1, 1, 1, },
				isGhost, ghostIndex, ghostMat
			),
			prefab.weapon.cannon.S(
				{ 4.25, 0, -.25 },
				{ 0, 0, -90 },
				{ 1, 1, 1, },
				isGhost, ghostIndex, ghostMat
			),

			-- prefab.weapon.cannon.S(
			-- 	{ 0, 2.25, 2 },
			-- 	{ 18.4349, 0, 0 },
			-- 	{ 1, 1, 1, },
			-- 	isGhost
			-- ),
			-- prefab.weapon.cannon.S(
			-- 	{ 0, -2.25, 2 },
			-- 	{ -18.4349, 0, 180 },
			-- 	{ 1, 1, 1, },
			-- 	isGhost
			-- ),

			prefab.ship.aquamarine.core.B(.1, isGhost, ghostIndex-1, ghostMat),

		}
	}
	if isGhost then
		if (ghostMat == "arc_aegis") then
			prefab_part.aegisVisual = true;
		end
		prefab_part.materials= {ghostMat..ghostIndex,ghostMat..ghostIndex,ghostMat..ghostIndex,ghostMat..ghostIndex,ghostMat..ghostIndex,}
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
function prefab.ship.aquamarine.core.M(scaleConst, isGhost, ghostIndex, ghostMat)
	if(ghostIndex==nil) then ghostIndex=0 end
	if(ghostMat==nil) then ghostMat="arc_build" end
	if(ghostIndex < 0) then return {}; end
	if(not isGhost and ghostIndex < 0) then return {}; end
	prefab_part = {
		name = "Aquamarine-Core-M",
		mesh = "5-Aquamarine/Aquamarine-Core-M",
		materials = {"arc_hull_dark","arc_teamGlow", "arc_hull", "arc_teamColour", },
		position = {0,0,0},
		rotation = {0,0,0},
		scale = {.1/scaleConst, .1/scaleConst, .1/scaleConst,},
		parts={
			prefab.weapon.missile.hls.L(
				{ -3.5, 2, -1.75 },
				{ 0, 0, 45 },
				{ 1, 1, 1, },
				isGhost, ghostIndex, ghostMat
			),
			prefab.weapon.missile.hls.L(
				{ 3.5, 2, -1.75 },
				{ 0, 0, -45 },
				{ 1, 1, 1, },
				isGhost, ghostIndex, ghostMat
			),
			prefab.weapon.missile.hls.L(
				{ -3.5, -2, -1.75 },
				{ 0, 0, 135 },
				{ 1, 1, 1, },
				isGhost, ghostIndex, ghostMat
			),
			prefab.weapon.missile.hls.L(
				{ 3.5, -2, -1.75 },
				{ 0, 0, -135 },
				{ 1, 1, 1, },
				isGhost, ghostIndex, ghostMat
			),

			prefab.weapon.missile.vls.S(
				{ -1.75, 2.25, 2 },
				{ -90+18.4349, 0, 0 },
				{ 1, 1, 1, },
				isGhost, ghostIndex, ghostMat
			),
			prefab.weapon.missile.vls.S(
				{ 1.75, 2.25, 2 },
				{ -90+18.4349, 0, 0 },
				{ 1, 1, 1, },
				isGhost, ghostIndex, ghostMat
			),
			prefab.weapon.missile.vls.S(
				{ -1.75, -2.25, 2 },
				{ 90-18.4349, 0, 180 },
				{ 1, 1, 1, },
				isGhost, ghostIndex, ghostMat
			),
			prefab.weapon.missile.vls.S(
				{ 1.75, -2.25, 2 },
				{ 90-18.4349, 0, 180 },
				{ 1, 1, 1, },
				isGhost, ghostIndex, ghostMat
			),

			prefab.ship.aquamarine.core.M(.1, isGhost, ghostIndex-1, ghostMat),

		}
	}
	if isGhost then
		if (ghostMat == "arc_aegis") then
			prefab_part.aegisVisual = true;
		end
		prefab_part.materials= {ghostMat..ghostIndex,ghostMat..ghostIndex,ghostMat..ghostIndex,ghostMat..ghostIndex,ghostMat..ghostIndex,}
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
function prefab.ship.aquamarine.bow.P(scaleConst, isGhost, ghostIndex, ghostMat)
	if(ghostIndex==nil) then ghostIndex=0 end
	if(ghostMat==nil) then ghostMat="arc_build" end
	if(ghostIndex < 0) then return {}; end
	if(not isGhost and ghostIndex < 0) then return {}; end
	prefab_part = {
		name = "Aquamarine-Bow-P",
		mesh = "5-Aquamarine/Aquamarine-Bow-P",
		materials = {"arc_hull_dark","arc_teamGlow", "arc_hull", "arc_teamColour", },
		position = {0,0,0},
		rotation = {0,0,0},
		scale = {.1/scaleConst, .1/scaleConst, .1/scaleConst,},
		parts={
			prefab.weapon.laser.S(
				{ -.9999, 1.75, 5.5 },
				{ 0, 0, 0 },
				{ 1, 1, 1, },
				isGhost, ghostIndex, ghostMat
			),
			prefab.weapon.laser.S(
				{ .9999, 1.75, 5.5 },
				{ 0, 0, 0 },
				{ 1, 1, 1, },
				isGhost, ghostIndex, ghostMat
			),
			prefab.weapon.laser.S(
				{ -.9999, -1.75, 5.5 },
				{ 0, 0, 180 },
				{ 1, 1, 1, },
				isGhost, ghostIndex, ghostMat
			),
			prefab.weapon.laser.S(
				{ .9999, -1.75, 5.5 },
				{ 0, 0, 180 },
				{ 1, 1, 1, },
				isGhost, ghostIndex, ghostMat
			),


			prefab.weapon.laser.M(
				{ 0, 1, 9.25 },
				{ 18.4349, 0, 0 },
				{ 1, 1, 1, },
				isGhost, ghostIndex, ghostMat
			),
			prefab.weapon.laser.M(
				{ 0, -1, 9.25 },
				{ -18.4349, 0, 180 },
				{ 1, 1, 1, },
				isGhost, ghostIndex, ghostMat
			),

			prefab.ship.aquamarine.bow.P(.1, isGhost, ghostIndex-1, ghostMat),
		}
	}
	if isGhost then
		if (ghostMat == "arc_aegis") then
			prefab_part.aegisVisual = true;
		end
		prefab_part.materials= {ghostMat..ghostIndex,ghostMat..ghostIndex,ghostMat..ghostIndex,ghostMat..ghostIndex,ghostMat..ghostIndex,}
	end
	return prefab_part
end

function prefab.weapon_info.aquamarine.bow.B()
	weapon_info = {
		prefab.weapon_info.cannon.M(2),
		prefab.weapon_info.cannon.S(4),
	}
	return weapon_info
end
function prefab.ship.aquamarine.bow.B(scaleConst, isGhost, ghostIndex, ghostMat)
	if(ghostIndex==nil) then ghostIndex=0 end
	if(ghostMat==nil) then ghostMat="arc_build" end
	if(ghostIndex < 0) then return {}; end
	if(not isGhost and ghostIndex < 0) then return {}; end
	prefab_part = {
		name = "Aquamarine-Bow-B",
		mesh = "5-Aquamarine/Aquamarine-Bow-B",
		materials = {"arc_hull_dark","arc_teamGlow", "arc_hull", "arc_teamColour", },
		position = {0,0,0},
		rotation = {0,0,0},
		scale = {.1/scaleConst, .1/scaleConst, .1/scaleConst,},
		parts={
			prefab.weapon.cannon.M(
				{ -0, 1.75, 5.75 },
				{ 0, 0, 0 },
				{ 1, 1, 1, },
				isGhost, ghostIndex, ghostMat
			),
			-- prefab.weapon.cannon.S(
			-- 	{ .9999, 1.75, 6.25 },
			-- 	{ 0, 0, 0 },
			-- 	{ 1, 1, 1, },
			-- 	isGhost
			-- ),
			prefab.weapon.cannon.M(
				{ -0, -1.75, 5.75 },
				{ 0, 0, 180 },
				{ 1, 1, 1, },
				isGhost, ghostIndex, ghostMat
			),
			-- prefab.weapon.cannon.S(
			-- 	{ .9999, -1.75, 6.25 },
			-- 	{ 0, 0, 180 },
			-- 	{ 1, 1, 1, },
			-- 	isGhost
			-- ),


			prefab.weapon.cannon.S(
				{ -3, 1, 7 },
				{ 0, 18.4349, 46.5 },
				{ 1, 1, 1, },
				isGhost, ghostIndex, ghostMat
			),
			prefab.weapon.cannon.S(
				{ 3, 1, 7 },
				{ 0, -18.4349, -46.5 },
				{ 1, 1, 1, },
				isGhost, ghostIndex, ghostMat
			),
			prefab.weapon.cannon.S(
				{ -3, -1, 7 },
				{ 0, 18.4349, 134.5 },
				{ 1, 1, 1, },
				isGhost, ghostIndex, ghostMat
			),
			prefab.weapon.cannon.S(
				{ 3, -1, 7 },
				{ 0, -18.4349, -134.5 },
				{ 1, 1, 1, },
				isGhost, ghostIndex, ghostMat
			),

			prefab.ship.aquamarine.bow.B(.1, isGhost, ghostIndex-1, ghostMat),

		}
	}
	if isGhost then
		if (ghostMat == "arc_aegis") then
			prefab_part.aegisVisual = true;
		end
		prefab_part.materials= {ghostMat..ghostIndex,ghostMat..ghostIndex,ghostMat..ghostIndex,ghostMat..ghostIndex,ghostMat..ghostIndex,}
	end
	return prefab_part
end

function prefab.weapon_info.aquamarine.bow.M()
	weapon_info = {
		prefab.weapon_info.missile.hls.L(4),
	}
	return weapon_info
end
function prefab.ship.aquamarine.bow.M(scaleConst, isGhost, ghostIndex, ghostMat)
	if(ghostIndex==nil) then ghostIndex=0 end
	if(ghostMat==nil) then ghostMat="arc_build" end
	if(ghostIndex < 0) then return {}; end
	if(not isGhost and ghostIndex < 0) then return {}; end
	prefab_part = {
		name = "Aquamarine-Bow-M",
		mesh = "5-Aquamarine/Aquamarine-Bow-M",
		materials = {"arc_hull_dark","arc_teamGlow", "arc_hull", "arc_teamColour", },
		position = {0,0,0},
		rotation = {0,0,0},
		scale = {.1/scaleConst, .1/scaleConst, .1/scaleConst,},
		parts={
			prefab.weapon.missile.hls.L(
				{ -1.75, 1.75, 5.5 },
				{ 0, 0, 0 },
				{ 1, 1, 1, },
				isGhost, ghostIndex, ghostMat
			),
			prefab.weapon.missile.hls.L(
				{ 1.75, 1.75, 5.5 },
				{ 0, 0, 0 },
				{ 1, 1, 1, },
				isGhost, ghostIndex, ghostMat
			),
			prefab.weapon.missile.hls.L(
				{ -1.75, -1.75, 5.5 },
				{ 0, 0, 180 },
				{ 1, 1, 1, },
				isGhost, ghostIndex, ghostMat
			),
			prefab.weapon.missile.hls.L(
				{ 1.75, -1.75, 5.5 },
				{ 0, 0, 180 },
				{ 1, 1, 1, },
				isGhost, ghostIndex, ghostMat
			),

			prefab.ship.aquamarine.bow.M(.1, isGhost, ghostIndex-1, ghostMat),

		}
	}
	if isGhost then
		if (ghostMat == "arc_aegis") then
			prefab_part.aegisVisual = true;
		end
		prefab_part.materials= {ghostMat..ghostIndex,ghostMat..ghostIndex,ghostMat..ghostIndex,ghostMat..ghostIndex,ghostMat..ghostIndex,}
	end
	return prefab_part
end