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

function prefab.ship.amethyst.thruster(scaleConst, isGhost, ghostIndex, ghostMat)
	if(ghostIndex==nil) then ghostIndex=0 end
	if(ghostMat==nil) then ghostMat="build" end
	if(ghostIndex < 0) then return {}; end
	if(not isGhost and ghostIndex < 0) then return {}; end
	prefab_part = {
		name     = "Thruster",
		position = { 0, 0, -23.25 },
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
				scale 	= { 11, 11, 11 },
			},
			{
				name     = "Thruster Plume",
				mesh     = "Thruster/Thruster-Plume",
				materials  = { "329_MT_arc_thruster_teamGlow", "329_MT_arc_thruster-middle_teamGlow", "329_MT_arc_thruster-outer_teamGlow" },
				position = { -4.75, 0, 0 }, --XYZ, Thruster subparts should all be on the same Y point, as they all scale along the parent's Y axis.
				rotation = { 0, 0, 0 },
				scale 	= { 6, 6, 6 },
			},
			{
				name     = "Thruster Plume",
				mesh     = "Thruster/Thruster-Plume",
				materials  = { "329_MT_arc_thruster_teamGlow", "329_MT_arc_thruster-middle_teamGlow", "329_MT_arc_thruster-outer_teamGlow" },
				position = { 4.75, 0, 0 }, --XYZ, Thruster subparts should all be on the same Y point, as they all scale along the parent's Y axis.
				rotation = { 0, 0, 0 },
				scale 	= { 6, 6, 6 },
			},
			{
				name     = "Thruster Plume",
				mesh     = "Thruster/Thruster-Plume",
				materials  = { "329_MT_arc_thruster_teamGlow", "329_MT_arc_thruster-middle_teamGlow", "329_MT_arc_thruster-outer_teamGlow" },
				position = { 0, 4, 0 }, --XYZ, Thruster subparts should all be on the same Y point, as they all scale along the parent's Y axis.
				rotation = { 0, 0, 0 },
				scale 	= { 3, 3, 3 },
			},
			{
				name     = "Thruster Plume",
				mesh     = "Thruster/Thruster-Plume",
				materials  = { "329_MT_arc_thruster_teamGlow", "329_MT_arc_thruster-middle_teamGlow", "329_MT_arc_thruster-outer_teamGlow" },
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
function prefab.ship.amethyst.stern.P(scaleConst, isGhost, ghostIndex, ghostMat)
	if(ghostIndex==nil) then ghostIndex=0 end
	if(ghostMat==nil) then ghostMat="build" end
	if(ghostIndex < 0) then return {}; end
	if(not isGhost and ghostIndex < 0) then return {}; end
	prefab_part = {
		name = "Amethyst-Stern-P",
		mesh = "7-Amethyst/Amethyst-Stern-P",
		materials = {"329_MT_arc_hull_dark","329_MT_arc_teamGlow", "329_MT_arc_hull", "329_MT_arc_teamColour", },
		position = {0,0,0},
		rotation = {0,0,0},
		scale = {.1/scaleConst,.1/scaleConst,.1/scaleConst},
		parts={

			prefab.weapon.laser.X(
				{ 0, 6.25, -18.75 },
				{ 0, 0, 0 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),
			prefab.weapon.laser.X(
				{ 0, -6.25, -18.75 },
				{ 0, 0, 180 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),

			
			-- prefab.part.emblem(
			-- 	{ 0, 3.95, -9.5},
			-- 	{ 0, 0, 0 },
			-- 	{ 1.5, 1.5, 1.5 },
			-- 	isGhost
			-- ),
			-- prefab.part.emblem(
			-- 	{ 0, -3.95, -9.5},
			-- 	{ 0, 0, 180 },
			-- 	{ 1.5, 1.5, 1.5 },
			-- 	isGhost
			-- ),
			prefab.ship.amethyst.thruster(scaleConst, isGhost, ghostIndex),

			prefab.ship.amethyst.stern.P(.1, isGhost, ghostIndex-1, ghostMat),
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

function prefab.weapon_info.amethyst.stern.B()
	weapon_info = {
		prefab.weapon_info.cannon.X(2),
	}
	return weapon_info
end
function prefab.ship.amethyst.stern.B(scaleConst, isGhost, ghostIndex, ghostMat)
	if(ghostIndex==nil) then ghostIndex=0 end
	if(ghostMat==nil) then ghostMat="build" end
	if(ghostIndex < 0) then return {}; end
	if(not isGhost and ghostIndex < 0) then return {}; end
	prefab_part = {
		name = "Amethyst-Stern-B",
		mesh = "7-Amethyst/Amethyst-Stern-B",
		materials = {"329_MT_arc_hull_dark","329_MT_arc_teamGlow", "329_MT_arc_hull", "329_MT_arc_teamColour", },
		position = {0,0,0},
		rotation = {0,0,0},
		scale = {.1/scaleConst,.1/scaleConst,.1/scaleConst},
		parts={

			prefab.weapon.cannon.X(
				{ 0, 6.25, -18.75 },
				{ 0, 0, 0 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),
			prefab.weapon.cannon.X(
				{ 0, -6.25, -18.75 },
				{ 0, 0, 180 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),

			
			-- prefab.part.emblem(
			-- 	{ 0, 3.95, -9.5},
			-- 	{ 0, 0, 0 },
			-- 	{ 1.5, 1.5, 1.5 },
			-- 	isGhost
			-- ),
			-- prefab.part.emblem(
			-- 	{ 0, -3.95, -9.5},
			-- 	{ 0, 0, 180 },
			-- 	{ 1.5, 1.5, 1.5 },
			-- 	isGhost
			-- ),
			prefab.ship.amethyst.thruster(scaleConst, isGhost, ghostIndex),

			prefab.ship.amethyst.stern.B(.1, isGhost, ghostIndex-1, ghostMat),
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

function prefab.weapon_info.amethyst.stern.M()
	weapon_info = {
		prefab.weapon_info.missile.hls.X(2),
	}
	return weapon_info
end
function prefab.ship.amethyst.stern.M(scaleConst, isGhost, ghostIndex, ghostMat)
	if(ghostIndex==nil) then ghostIndex=0 end
	if(ghostMat==nil) then ghostMat="build" end
	if(ghostIndex < 0) then return {}; end
	if(not isGhost and ghostIndex < 0) then return {}; end
	prefab_part = {
		name = "Amethyst-Stern-M",
		mesh = "7-Amethyst/Amethyst-Stern-M",
		materials = {"329_MT_arc_hull_dark","329_MT_arc_teamGlow", "329_MT_arc_hull", "329_MT_arc_teamColour", },
		position = {0,0,0},
		rotation = {0,0,0},
		scale = {.1/scaleConst,.1/scaleConst,.1/scaleConst},
		parts={

			prefab.weapon.missile.hls.X(
				{ -5, 3.5, -19.5 },
				{ 0, 0, 45 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),
			prefab.weapon.missile.hls.X(
				{ 5, 3.5, -19.5 },
				{ 0, 0, -45 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),

			prefab.weapon.missile.hls.X(
				{ -5, -3.5, -19.5 },
				{ 0, 0, 135 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),
			prefab.weapon.missile.hls.X(
				{ 5, -3.5, -19.5 },
				{ 0, 0, -135 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),

			
			-- prefab.part.emblem(
			-- 	{ 0, 3.95, -9.5},
			-- 	{ 0, 0, 0 },
			-- 	{ 1.5, 1.5, 1.5 },
			-- 	isGhost
			-- ),
			-- prefab.part.emblem(
			-- 	{ 0, -3.95, -9.5},
			-- 	{ 0, 0, 180 },
			-- 	{ 1.5, 1.5, 1.5 },
			-- 	isGhost
			-- ),
			prefab.ship.amethyst.thruster(scaleConst, isGhost, ghostIndex),

			prefab.ship.amethyst.stern.M(.1, isGhost, ghostIndex-1, ghostMat),
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
function prefab.weapon_info.amethyst.stern.G()
	weapon_info = {
		prefab.weapon_info.lightning.X(2),
	}
	return weapon_info
end
function prefab.ship.amethyst.stern.G(scaleConst, isGhost, ghostIndex, ghostMat)
	if(ghostIndex==nil) then ghostIndex=0 end
	if(ghostMat==nil) then ghostMat="build" end
	if(ghostIndex < 0) then return {}; end
	if(not isGhost and ghostIndex < 0) then return {}; end
	prefab_part = {
		name = "Amethyst-Stern-G",
		mesh = "7-Amethyst/Amethyst-Stern-G",
		materials = {"329_MT_arc_hull_dark","329_MT_arc_teamGlow", "329_MT_arc_hull", "329_MT_arc_teamColour", },
		position = {0,0,0},
		rotation = {0,0,0},
		scale = {.1/scaleConst,.1/scaleConst,.1/scaleConst},
		parts={

			prefab.weapon.lightning.X(
				{ 0, 6.25, -18.75 },
				{ 0, 0, 0 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),
			prefab.weapon.lightning.X(
				{ 0, -6.25, -18.75 },
				{ 0, 0, 180 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),

			
			-- prefab.part.emblem(
			-- 	{ 0, 3.95, -9.5},
			-- 	{ 0, 0, 0 },
			-- 	{ 1.5, 1.5, 1.5 },
			-- 	isGhost
			-- ),
			-- prefab.part.emblem(
			-- 	{ 0, -3.95, -9.5},
			-- 	{ 0, 0, 180 },
			-- 	{ 1.5, 1.5, 1.5 },
			-- 	isGhost
			-- ),
			prefab.ship.amethyst.thruster(scaleConst, isGhost, ghostIndex),

			prefab.ship.amethyst.stern.G(.1, isGhost, ghostIndex-1, ghostMat),
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
function prefab.weapon_info.amethyst.stern.A()
	weapon_info = {
		prefab.weapon_info.railgun.X(2),
	}
	return weapon_info
end
function prefab.ship.amethyst.stern.A(scaleConst, isGhost, ghostIndex, ghostMat)
	if(ghostIndex==nil) then ghostIndex=0 end
	if(ghostMat==nil) then ghostMat="build" end
	if(ghostIndex < 0) then return {}; end
	if(not isGhost and ghostIndex < 0) then return {}; end
	prefab_part = {
		name = "Amethyst-Stern-A",
		mesh = "7-Amethyst/Amethyst-Stern-A",
		materials = {"329_MT_arc_hull_dark","329_MT_arc_teamGlow", "329_MT_arc_hull", "329_MT_arc_teamColour", },
		position = {0,0,0},
		rotation = {0,0,0},
		scale = {.1/scaleConst,.1/scaleConst,.1/scaleConst},
		parts={

			prefab.weapon.railgun.X(
				{ 0, 6, -18.75 },
				{ 0, 0, 0 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),
			prefab.weapon.railgun.X(
				{ 0, -6, -18.75 },
				{ 0, 0, 180 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),

			
			-- prefab.part.emblem(
			-- 	{ 0, 3.95, -9.5},
			-- 	{ 0, 0, 0 },
			-- 	{ 1.5, 1.5, 1.5 },
			-- 	isGhost
			-- ),
			-- prefab.part.emblem(
			-- 	{ 0, -3.95, -9.5},
			-- 	{ 0, 0, 180 },
			-- 	{ 1.5, 1.5, 1.5 },
			-- 	isGhost
			-- ),
			prefab.ship.amethyst.thruster(scaleConst, isGhost, ghostIndex),

			prefab.ship.amethyst.stern.A(.1, isGhost, ghostIndex-1, ghostMat),
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




function prefab.weapon_info.amethyst.stern.C()
	weapon_info = {
		prefab.weapon_info.hangar.quartz(12),
	}
	return weapon_info
end
function prefab.ship.amethyst.stern.C(scaleConst, isGhost, ghostIndex, ghostMat)
	if(ghostIndex==nil) then ghostIndex=0 end
	if(ghostMat==nil) then ghostMat="build" end
	if(ghostIndex < 0) then return {}; end
	if(not isGhost and ghostIndex < 0) then return {}; end
	prefab_part = {
		name = "Amethyst-Stern-C",
		mesh = "7-Amethyst/Amethyst-Stern-C",
		materials = {"329_MT_arc_hull_dark","329_MT_arc_teamGlow", "329_MT_arc_hull", "329_MT_arc_teamColour", },
		position = {0,0,0},
		rotation = {0,0,0},
		scale = {.1/scaleConst,.1/scaleConst,.1/scaleConst},
		parts={
			prefab.weapon.hangar.quartz(
				{ -7, 0, -21 },
				{ 0, -90, 0 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),
			prefab.weapon.hangar.quartz(
				{ -7, 0, -19.5 },
				{ 0, -90, 0 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),
			prefab.weapon.hangar.quartz(
				{ -7, 0, -18 },
				{ 0, -90, 0 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),
			prefab.weapon.hangar.quartz(
				{ -7, 0, -16.5 },
				{ 0, -90, 0 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),
			prefab.weapon.hangar.quartz(
				{ -7, 0, -15 },
				{ 0, -90, 0 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),
			prefab.weapon.hangar.quartz(
				{ -7, 0, -13.5 },
				{ 0, -90, 0 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),

			prefab.weapon.hangar.quartz(
				{ 7, 0, -21 },
				{ 0, 90, 0 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),
			prefab.weapon.hangar.quartz(
				{ 7, 0, -19.5 },
				{ 0, 90, 0 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),
			prefab.weapon.hangar.quartz(
				{ 7, 0, -18 },
				{ 0, 90, 0 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),
			prefab.weapon.hangar.quartz(
				{ 7, 0, -16.5 },
				{ 0, 90, 0 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),
			prefab.weapon.hangar.quartz(
				{ 7, 0, -15 },
				{ 0, 90, 0 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),
			prefab.weapon.hangar.quartz(
				{ 7, 0, -13.5 },
				{ 0, 90, 0 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),
			
			-- prefab.part.emblem(
			-- 	{ 0, 3.95, -9.5},
			-- 	{ 0, 0, 0 },
			-- 	{ 1.5, 1.5, 1.5 },
			-- 	isGhost
			-- ),
			-- prefab.part.emblem(
			-- 	{ 0, -3.95, -9.5},
			-- 	{ 0, 0, 180 },
			-- 	{ 1.5, 1.5, 1.5 },
			-- 	isGhost
			-- ),
			prefab.ship.amethyst.thruster(scaleConst, isGhost, ghostIndex),

			prefab.ship.amethyst.stern.C(.1, isGhost, ghostIndex-1, ghostMat),
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


function prefab.weapon_info.amethyst.core_aft.P()
	weapon_info = {
		prefab.weapon_info.laser.X(2),
		prefab.weapon_info.laser.L(4),
	}
	return weapon_info
end
function prefab.ship.amethyst.core_aft.P(scaleConst, isGhost, ghostIndex, ghostMat)
	if(ghostIndex==nil) then ghostIndex=0 end
	if(ghostMat==nil) then ghostMat="build" end
	if(ghostIndex < 0) then return {}; end
	if(not isGhost and ghostIndex < 0) then return {}; end
	prefab_part = {
		name = "Amethyst-Core-Aft-P",
		mesh = "7-Amethyst/Amethyst-Core-Aft-P",
		materials = {"329_MT_arc_hull_dark","329_MT_arc_teamGlow", "329_MT_arc_hull", "329_MT_arc_teamColour", },
		position = {0,0,0},
		rotation = {0,0,0},
		scale = {.1/scaleConst,.1/scaleConst,.1/scaleConst},
		parts={

			prefab.weapon.laser.X(
				{ 0, 4.75, -7 },
				{ 0, 0, 0 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),

			prefab.weapon.laser.X(
				{ 0, -4.75, -7 },
				{ 0, 0, 180 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),

			prefab.weapon.laser.L(
				{ -6, 3.5, -7 },
				{ 0, 0, 45 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),
			prefab.weapon.laser.L(
				{ 6, 3.5, -7 },
				{ 0, 0, -45 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),
			prefab.weapon.laser.L(
				{ -6, -3.5, -7 },
				{ 0, 0, 135 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),
			prefab.weapon.laser.L(
				{ 6, -3.5, -7 },
				{ 0, 0, -135 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),

			prefab.ship.amethyst.core_aft.P(.1, isGhost, ghostIndex-1, ghostMat),

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
function prefab.weapon_info.amethyst.core_aft.B()
	weapon_info = {
		prefab.weapon_info.cannon.X(2),
		prefab.weapon_info.cannon.L(2),
		prefab.weapon_info.cannon.M(4),
	}
	return weapon_info
end
function prefab.ship.amethyst.core_aft.B(scaleConst, isGhost, ghostIndex, ghostMat)
	if(ghostIndex==nil) then ghostIndex=0 end
	if(ghostMat==nil) then ghostMat="build" end
	if(ghostIndex < 0) then return {}; end
	if(not isGhost and ghostIndex < 0) then return {}; end
	prefab_part = {
		name = "Amethyst-Core-Aft-B",
		mesh = "7-Amethyst/Amethyst-Core-Aft-B",
		materials = {"329_MT_arc_hull_dark","329_MT_arc_teamGlow", "329_MT_arc_hull", "329_MT_arc_teamColour", },
		position = {0,0,0},
		rotation = {0,0,0},
		scale = {.1/scaleConst,.1/scaleConst,.1/scaleConst},
		parts={

			prefab.weapon.cannon.X(
				{ 0, 4.75, -8.5 },
				{ 0, 0, 0 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),

			prefab.weapon.cannon.X(
				{ 0, -4.75, -8.5 },
				{ 0, 0, 180 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),

			prefab.weapon.cannon.M(
				{ -6, 3.5, -7 },
				{ 0, 0, 45 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),
			prefab.weapon.cannon.M(
				{ 6, 3.5, -7 },
				{ 0, 0, -45 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),
			prefab.weapon.cannon.M(
				{ -6, -3.5, -7 },
				{ 0, 0, 135 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),
			prefab.weapon.cannon.M(
				{ 6, -3.5, -7 },
				{ 0, 0, -135 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),

			prefab.weapon.cannon.L(
				{ -7.25, 0, -6.25 },
				{ 0, 0, 90 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),
			prefab.weapon.cannon.L(
				{ 7.25, 0, -6.25 },
				{ 0, 0, -90 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),

			prefab.ship.amethyst.core_aft.B(.1, isGhost, ghostIndex-1, ghostMat),

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
function prefab.weapon_info.amethyst.core_aft.M()
	weapon_info = {
		prefab.weapon_info.missile.hls.X(8),
	}
	return weapon_info
end
function prefab.ship.amethyst.core_aft.M(scaleConst, isGhost, ghostIndex, ghostMat)
	if(ghostIndex==nil) then ghostIndex=0 end
	if(ghostMat==nil) then ghostMat="build" end
	if(ghostIndex < 0) then return {}; end
	if(not isGhost and ghostIndex < 0) then return {}; end
	prefab_part = {
		name = "Amethyst-Core-Aft-M",
		mesh = "7-Amethyst/Amethyst-Core-Aft-M",
		materials = {"329_MT_arc_hull_dark","329_MT_arc_teamGlow", "329_MT_arc_hull", "329_MT_arc_teamColour", },
		position = {0,0,0},
		rotation = {0,0,0},
		scale = {.1/scaleConst,.1/scaleConst,.1/scaleConst},
		parts={

			prefab.weapon.missile.hls.X(
				{ -3, 4.75, -7 },
				{ 0, 0, 0 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),
			prefab.weapon.missile.hls.X(
				{ 3, 4.75, -7 },
				{ 0, 0, 0 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),
			prefab.weapon.missile.hls.X(
				{ -3, -4.75, -7 },
				{ 0, 0, 180 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),
			prefab.weapon.missile.hls.X(
				{ 3, -4.75, -7 },
				{ 0, 0, 180 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),

			prefab.weapon.missile.hls.X(
				{ -6, 3.5, -7 },
				{ 0, 0, 45 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),
			prefab.weapon.missile.hls.X(
				{ 6, 3.5, -7 },
				{ 0, 0, -45 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),
			prefab.weapon.missile.hls.X(
				{ -6, -3.5, -7 },
				{ 0, 0, 135 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),
			prefab.weapon.missile.hls.X(
				{ 6, -3.5, -7 },
				{ 0, 0, -135 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),

			prefab.ship.amethyst.core_aft.M(.1, isGhost, ghostIndex-1, ghostMat),
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

function prefab.weapon_info.amethyst.core_aft.G()
	weapon_info = {
		prefab.weapon_info.lightning.X(3),
		prefab.weapon_info.lightning.L(2),
	}
	return weapon_info
end
function prefab.ship.amethyst.core_aft.G(scaleConst, isGhost, ghostIndex, ghostMat)
	if(ghostIndex==nil) then ghostIndex=0 end
	if(ghostMat==nil) then ghostMat="build" end
	if(ghostIndex < 0) then return {}; end
	if(not isGhost and ghostIndex < 0) then return {}; end
	prefab_part = {
		name = "Amethyst-Core-Aft-G",
		mesh = "7-Amethyst/Amethyst-Core-Aft-G",
		materials = {"329_MT_arc_hull_dark","329_MT_arc_teamGlow", "329_MT_arc_hull", "329_MT_arc_teamColour", },
		position = {0,0,0},
		rotation = {0,0,0},
		scale = {.1/scaleConst,.1/scaleConst,.1/scaleConst},
		parts={

			prefab.weapon.lightning.X(
				{ -2.4999, 4.75, -8.5 },
				{ 0, 0, 0 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),
			prefab.weapon.lightning.X(
				{ 2.4999, 4.75, -8.5 },
				{ 0, 0, 0 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),

			prefab.weapon.lightning.X(
				{ 0, -4.75, -8.5 },
				{ 0, 0, 180 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),
			-- prefab.weapon.lightning.L(
			-- 	{ 0, 4.75, -4.75 },
			-- 	{ 0, 0, 0 },
			-- 	{ 1, 1, 1 },
			-- 	isGhost
			-- ),
			-- prefab.weapon.lightning.L(
			-- 	{ 0, -4.75, -4.75 },
			-- 	{ 0, 0, 180 },
			-- 	{ 1, 1, 1 },
			-- 	isGhost
			-- ),

			prefab.weapon.lightning.L(
				{ -7.25, 0, -6.25 },
				{ 0, 0, 90 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),
			prefab.weapon.lightning.L(
				{ 7.25, 0, -6.25 },
				{ 0, 0, -90 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),

			prefab.ship.amethyst.core_aft.G(.1, isGhost, ghostIndex-1, ghostMat),

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

function prefab.weapon_info.amethyst.core_aft.A()
	weapon_info = {
		prefab.weapon_info.railgun.X(4),
	}
	return weapon_info
end
function prefab.ship.amethyst.core_aft.A(scaleConst, isGhost, ghostIndex, ghostMat)
	if(ghostIndex==nil) then ghostIndex=0 end
	if(ghostMat==nil) then ghostMat="build" end
	if(ghostIndex < 0) then return {}; end
	if(not isGhost and ghostIndex < 0) then return {}; end
	prefab_part = {
		name = "Amethyst-Core-Aft-A",
		mesh = "7-Amethyst/Amethyst-Core-Aft-A",
		materials = {"329_MT_arc_hull_dark","329_MT_arc_teamGlow", "329_MT_arc_hull", "329_MT_arc_teamColour", },
		position = {0,0,0},
		rotation = {0,0,0},
		scale = {.1/scaleConst,.1/scaleConst,.1/scaleConst},
		parts={

			prefab.weapon.railgun.X(
				{ -2.5, 4.5, -7 },
				{ 0, 0, 0 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),
			prefab.weapon.railgun.X(
				{ 2.5, 4.5, -7 },
				{ 0, 0, 0 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),

			prefab.weapon.railgun.X(
				{ -2.5, -4.5, -7 },
				{ 0, 0, 180 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),
			prefab.weapon.railgun.X(
				{ 2.5, -4.5, -7 },
				{ 0, 0, 180 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),

			prefab.ship.amethyst.core_aft.A(.1, isGhost, ghostIndex-1, ghostMat),

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

function prefab.weapon_info.amethyst.core_aft.C()
	weapon_info = functions.combineWeaponInfo({
		prefab.weapon_info.hangar.citrine(2),
		{prefab.weapon_info.hangar.quartz(8)},
		{prefab.weapon_info.laser.M(2)},
		-- prefab.weapon_info.missile.hls.S(4),
	});
	return weapon_info
end
function prefab.ship.amethyst.core_aft.C(scaleConst, isGhost, ghostIndex, ghostMat)
	if(ghostIndex==nil) then ghostIndex=0 end
	if(ghostMat==nil) then ghostMat="build" end
	if(ghostIndex < 0) then return {}; end
	if(not isGhost and ghostIndex < 0) then return {}; end
	prefab_part = {
		name = "Amethyst-Core-Aft-C",
		mesh = "7-Amethyst/Amethyst-Core-Aft-C",
		materials = {"329_MT_arc_hull_dark","329_MT_arc_teamGlow", "329_MT_arc_hull", "329_MT_arc_teamColour", },
		position = {0,0,0},
		rotation = {0,0,0},
		scale = {.1/scaleConst,.1/scaleConst,.1/scaleConst},
		parts={
			prefab.weapon.hangar.citrine(
				{ -7, 0, -7.75 },
				{ 0, -90, 0 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),
			prefab.weapon.hangar.citrine(
				{ 7, 0, -7.75 },
				{ 0, 90, 0 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),

			prefab.weapon.hangar.quartz(
				{ -7, 0, -11.5 },
				{ 0, -90, 0 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),
			prefab.weapon.hangar.quartz(
				{ -7, 0, -4 },
				{ 0, -90, 0 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),
			prefab.weapon.hangar.quartz(
				{ -7, 0, -2.5 },
				{ 0, -90, 0 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),
			prefab.weapon.hangar.quartz(
				{ -7, 0, -1 },
				{ 0, -90, 0 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),

			prefab.weapon.hangar.quartz(
				{ 7, 0, -11.5 },
				{ 0, 90, 0 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),
			prefab.weapon.hangar.quartz(
				{ 7, 0, -4 },
				{ 0, 90, 0 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),
			prefab.weapon.hangar.quartz(
				{ 7, 0, -2.5 },
				{ 0, 90, 0 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),
			prefab.weapon.hangar.quartz(
				{ 7, 0, -1 },
				{ 0, 90, 0 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),

			prefab.weapon.laser.M(
				{ 0, 4.75, -4.75 },
				{ 0, 0, 0 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),
			prefab.weapon.laser.M(
				{ 0, -4.75, -4.75 },
				{ 0, 0, 180 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),

			prefab.ship.amethyst.core_aft.C(.1, isGhost, ghostIndex-1, ghostMat),
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

function prefab.weapon_info.amethyst.core_fore.P()
	weapon_info = {
		prefab.weapon_info.laser.L(4),
		prefab.weapon_info.laser.M(2),
		prefab.weapon_info.laser.S(4),
	}
	return weapon_info
end
function prefab.ship.amethyst.core_fore.P(scaleConst, isGhost, ghostIndex, ghostMat)
	if(ghostIndex==nil) then ghostIndex=0 end
	if(ghostMat==nil) then ghostMat="build" end
	if(ghostIndex < 0) then return {}; end
	if(not isGhost and ghostIndex < 0) then return {}; end
	prefab_part = {
		name = "Amethyst-Core-Fore-P",
		mesh = "7-Amethyst/Amethyst-Core-Fore-P",
		materials = {"329_MT_arc_hull_dark","329_MT_arc_teamGlow", "329_MT_arc_hull", "329_MT_arc_teamColour", },
		position = {0,0,0},
		rotation = {0,0,0},
		scale = {.1/scaleConst,.1/scaleConst,.1/scaleConst},
		parts={

			prefab.weapon.laser.L(
				{ -3, 3.25, 4 },
				{ 0, 0, 0 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),
			prefab.weapon.laser.L(
				{ 3, 3.25, 4 },
				{ 0, 0, 0 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),
			prefab.weapon.laser.L(
				{ -3, -3.25, 4 },
				{ 0, 0, 180 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),
			prefab.weapon.laser.L(
				{ 3, -3.25, 4 },
				{ 0, 0, 180 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),

			prefab.weapon.laser.M(
				{ 0, 3.25, 7.75 },
				{ 0, 0, 0 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),
			prefab.weapon.laser.M(
				{ 0, -3.25, 7.75 },
				{ 0, 0, 180 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),

			prefab.weapon.laser.S(
				{ -6.25, 2.25, 5.5 },
				{ 0, 0, 45 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),
			prefab.weapon.laser.S(
				{ 6.25, 2.25, 5.5 },
				{ 0, 0, -45 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),
			prefab.weapon.laser.S(
				{ -6.25, -2.25, 5.5 },
				{ 0, 0, 145 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),
			prefab.weapon.laser.S(
				{ 6.25, -2.25, 5.5 },
				{ 0, 0, -145 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),

			prefab.ship.amethyst.core_fore.P(.1, isGhost, ghostIndex-1, ghostMat),

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

function prefab.weapon_info.amethyst.core_fore.B()
	weapon_info = {
		prefab.weapon_info.cannon.X(2),
		prefab.weapon_info.cannon.M(4),
	}
	return weapon_info
end
function prefab.ship.amethyst.core_fore.B(scaleConst, isGhost, ghostIndex, ghostMat)
	if(ghostIndex==nil) then ghostIndex=0 end
	if(ghostMat==nil) then ghostMat="build" end
	if(ghostIndex < 0) then return {}; end
	if(not isGhost and ghostIndex < 0) then return {}; end
	prefab_part = {
		name = "Amethyst-Core-Fore-B",
		mesh = "7-Amethyst/Amethyst-Core-Fore-B",
		materials = {"329_MT_arc_hull_dark","329_MT_arc_teamGlow", "329_MT_arc_hull", "329_MT_arc_teamColour", },
		position = {0,0,0},
		rotation = {0,0,0},
		scale = {.1/scaleConst,.1/scaleConst,.1/scaleConst},
		parts={

			prefab.weapon.cannon.X(
				{ 0, 3.25, 5.5 },
				{ 0, 0, 0 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),
			prefab.weapon.cannon.X(
				{ 0, -3.25, 5.5 },
				{ 0, 0, 180 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),
			prefab.weapon.cannon.M(
				{ -6.25, 2.25, 5.5 },
				{ 0, 0, 45 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),
			prefab.weapon.cannon.M(
				{ 6.25, 2.25, 5.5 },
				{ 0, 0, -45 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),
			prefab.weapon.cannon.M(
				{ -6.25, -2.25, 5.5 },
				{ 0, 0, 135 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),
			prefab.weapon.cannon.M(
				{ 6.25, -2.25, 5.5 },
				{ 0, 0, -135 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),

			prefab.ship.amethyst.core_fore.B(.1, isGhost, ghostIndex-1, ghostMat),

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
function prefab.weapon_info.amethyst.core_fore.M()
	weapon_info = {
		prefab.weapon_info.missile.vls.X(6),
	}
	return weapon_info
end
function prefab.ship.amethyst.core_fore.M(scaleConst, isGhost, ghostIndex, ghostMat)
	if(ghostIndex==nil) then ghostIndex=0 end
	if(ghostMat==nil) then ghostMat="build" end
	if(ghostIndex < 0) then return {}; end
	if(not isGhost and ghostIndex < 0) then return {}; end
	prefab_part = {
		name = "Amethyst-Core-Fore-M",
		mesh = "7-Amethyst/Amethyst-Core-Fore-M",
		materials = {"329_MT_arc_hull_dark","329_MT_arc_teamGlow", "329_MT_arc_hull", "329_MT_arc_teamColour", },
		position = {0,0,0},
		rotation = {0,0,0},
		scale = {.1/scaleConst,.1/scaleConst,.1/scaleConst},
		parts={

			prefab.weapon.missile.vls.X(
				{ -3.25, 3.25, 5.5 },
				{ -90, 0, 0 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),
			prefab.weapon.missile.vls.X(
				{ 3.25, 3.25, 5.5 },
				{ -90, 0, 0 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),
			prefab.weapon.missile.vls.X(
				{ -3.25, -3.25, 5.5 },
				{ 90, 0, 180 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),
			prefab.weapon.missile.vls.X(
				{ 3.25, -3.25, 5.5 },
				{ 90, 0, 180 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),

			prefab.weapon.missile.vls.X(
				{ -3.25, 2.75, 10.75 },
				{ -90+18.4349, 0, 0 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),
			prefab.weapon.missile.vls.X(
				{ 3.25, 2.75, 10.75 },
				{ -90+18.4349, 0, 0 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),

			prefab.ship.amethyst.core_fore.M(.1, isGhost, ghostIndex-1, ghostMat),
			

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
function prefab.weapon_info.amethyst.core_fore.G()
	weapon_info = {
		prefab.weapon_info.lightning.X(2),
		prefab.weapon_info.lightning.L(2),
	}
	return weapon_info
end
function prefab.ship.amethyst.core_fore.G(scaleConst, isGhost, ghostIndex, ghostMat)
	if(ghostIndex==nil) then ghostIndex=0 end
	if(ghostMat==nil) then ghostMat="build" end
	if(ghostIndex < 0) then return {}; end
	if(not isGhost and ghostIndex < 0) then return {}; end
	prefab_part = {
		name = "Amethyst-Core-Fore-G",
		mesh = "7-Amethyst/Amethyst-Core-Fore-G",
		materials = {"329_MT_arc_hull_dark","329_MT_arc_teamGlow", "329_MT_arc_hull", "329_MT_arc_teamColour", },
		position = {0,0,0},
		rotation = {0,0,0},
		scale = {.1/scaleConst,.1/scaleConst,.1/scaleConst},
		parts={

			prefab.weapon.lightning.X(
				{ 0, 3.25, 4 },
				{ 0, 0, 0 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),
			prefab.weapon.lightning.X(
				{ 0, -3.25, 4 },
				{ 0, 0, 180 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),
			prefab.weapon.lightning.L(
				{ -3.5, 3.25, 7.5 },
				{ 0, 0, 0 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),
			prefab.weapon.lightning.L(
				{ 3.5, 3.25, 7.5 },
				{ 0, 0, 0 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),

			prefab.ship.amethyst.core_fore.G(.1, isGhost, ghostIndex-1, ghostMat),

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
function prefab.weapon_info.amethyst.core_fore.A()
	weapon_info = {
		prefab.weapon_info.railgun.X(6),
	}
	return weapon_info
end
function prefab.ship.amethyst.core_fore.A(scaleConst, isGhost, ghostIndex, ghostMat)
	if(ghostIndex==nil) then ghostIndex=0 end
	if(ghostMat==nil) then ghostMat="build" end
	if(ghostIndex < 0) then return {}; end
	if(not isGhost and ghostIndex < 0) then return {}; end
	prefab_part = {
		name = "Amethyst-Core-Fore-A",
		mesh = "7-Amethyst/Amethyst-Core-Fore-A",
		materials = {"329_MT_arc_hull_dark","329_MT_arc_teamGlow", "329_MT_arc_hull", "329_MT_arc_teamColour", },
		position = {0,0,0},
		rotation = {0,0,0},
		scale = {.1/scaleConst,.1/scaleConst,.1/scaleConst},
		parts={

			prefab.weapon.railgun.X(
				{ -3, 3, 5.5 },
				{ 0, 0, 0 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),
			prefab.weapon.railgun.X(
				{ 3, 3, 5.5 },
				{ 0, 0, 0 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),

			prefab.weapon.railgun.X(
				{ 0, -3, 5.5 },
				{ 0, 0, 180 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),

			prefab.ship.amethyst.core_fore.A(.1, isGhost, ghostIndex-1, ghostMat),

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

function prefab.weapon_info.amethyst.core_fore.C()
	weapon_info = functions.combineWeaponInfo({
		prefab.weapon_info.hangar.ruby(2),
		{prefab.weapon_info.hangar.quartz(6)},
		{prefab.weapon_info.laser.M(2)},
		-- prefab.weapon_info.missile.hls.S(4),
	})
	return weapon_info
end
function prefab.ship.amethyst.core_fore.C(scaleConst, isGhost, ghostIndex, ghostMat)
	if(ghostIndex==nil) then ghostIndex=0 end
	if(ghostMat==nil) then ghostMat="build" end
	if(ghostIndex < 0) then return {}; end
	if(not isGhost and ghostIndex < 0) then return {}; end
	prefab_part = {
		name = "Amethyst-Core-Fore-C",
		mesh = "7-Amethyst/Amethyst-Core-Fore-C",
		materials = {"329_MT_arc_hull_dark","329_MT_arc_teamGlow", "329_MT_arc_hull", "329_MT_arc_teamColour", },
		position = {0,0,0},
		rotation = {0,0,0},
		scale = {.1/scaleConst,.1/scaleConst,.1/scaleConst},
		parts={
			prefab.weapon.hangar.ruby(
				{ -7, 0, 5.5 },
				{ 0, -90, 0 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),
			prefab.weapon.hangar.ruby(
				{ 7, 0, 5.5 },
				{ 0, 90, 0 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),


			prefab.weapon.hangar.quartz(
				{ -7, 0, 1 },
				{ 0, -90, 0 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),
			prefab.weapon.hangar.quartz(
				{ -7, 0, 2.5 },
				{ 0, -90, 0 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),
			prefab.weapon.hangar.quartz(
				{ -7, 0, 8.5 },
				{ 0, -90, 0 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),

			prefab.weapon.hangar.quartz(
				{ 7, 0, 1 },
				{ 0, 90, 0 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),
			prefab.weapon.hangar.quartz(
				{ 7, 0, 2.5 },
				{ 0, 90, 0 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),
			prefab.weapon.hangar.quartz(
				{ 7, 0, 8.5 },
				{ 0, 90, 0 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),

			prefab.weapon.laser.M(
				{ 0, 3.25, 7.75 },
				{ 0, 0, 0 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),
			prefab.weapon.laser.M(
				{ 0, -3.25, 7.75 },
				{ 0, 0, 180 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),

			prefab.ship.amethyst.core_fore.C(.1, isGhost, ghostIndex-1, ghostMat),
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

function prefab.weapon_info.amethyst.core.P()
	weapon_info = functions.combineWeaponInfo({
		prefab.weapon_info.amethyst.core_aft.P(),
		prefab.weapon_info.amethyst.core_fore.P(),
	});
	return weapon_info
end

function prefab.ship.amethyst.core.P(scaleConst, isGhost, ghostIndex, ghostMat)
	if(ghostIndex==nil) then ghostIndex=0 end
	if(ghostMat==nil) then ghostMat="build" end
	if(ghostIndex < 0) then return {}; end
	if(not isGhost and ghostIndex < 0) then return {}; end
	prefab_part = {
		name = "Amethyst-Core-P",
		position = {0,0,0},
		rotation = {0,0,0},
		scale = {.1/scaleConst,.1/scaleConst,.1/scaleConst},
		parts={
			prefab.ship.amethyst.core_aft.P(.1,isGhost, ghostIndex, ghostMat),
			prefab.ship.amethyst.core_fore.P(.1,isGhost, ghostIndex, ghostMat),
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

function prefab.weapon_info.amethyst.core.B()
	weapon_info = functions.combineWeaponInfo({
		prefab.weapon_info.amethyst.core_aft.B(),
		prefab.weapon_info.amethyst.core_fore.B(),
	});
	return weapon_info
end

function prefab.ship.amethyst.core.B(scaleConst, isGhost, ghostIndex, ghostMat)
	if(ghostIndex==nil) then ghostIndex=0 end
	if(ghostMat==nil) then ghostMat="build" end
	if(ghostIndex < 0) then return {}; end
	if(not isGhost and ghostIndex < 0) then return {}; end
	prefab_part = {
		name = "Amethyst-Core-B",
		position = {0,0,0},
		rotation = {0,0,0},
		scale = {.1/scaleConst,.1/scaleConst,.1/scaleConst},
		parts={
			prefab.ship.amethyst.core_aft.B(.1,isGhost, ghostIndex, ghostMat),
			prefab.ship.amethyst.core_fore.B(.1,isGhost, ghostIndex, ghostMat),
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

function prefab.weapon_info.amethyst.core.M()
	weapon_info = functions.combineWeaponInfo({
		prefab.weapon_info.amethyst.core_aft.M(),
		prefab.weapon_info.amethyst.core_fore.M(),
	});
	return weapon_info
end

function prefab.ship.amethyst.core.M(scaleConst, isGhost, ghostIndex, ghostMat)
	if(ghostIndex==nil) then ghostIndex=0 end
	if(ghostMat==nil) then ghostMat="build" end
	if(ghostIndex < 0) then return {}; end
	if(not isGhost and ghostIndex < 0) then return {}; end
	prefab_part = {
		name = "Amethyst-Core-M",
		position = {0,0,0},
		rotation = {0,0,0},
		scale = {.1/scaleConst,.1/scaleConst,.1/scaleConst},
		parts={
			prefab.ship.amethyst.core_aft.M(.1,isGhost, ghostIndex, ghostMat),
			prefab.ship.amethyst.core_fore.M(.1,isGhost, ghostIndex, ghostMat),
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

function prefab.weapon_info.amethyst.core.G()
	weapon_info = functions.combineWeaponInfo({
		prefab.weapon_info.amethyst.core_aft.G(),
		prefab.weapon_info.amethyst.core_fore.G(),
	});
	return weapon_info
end

function prefab.ship.amethyst.core.G(scaleConst, isGhost, ghostIndex, ghostMat)
	if(ghostIndex==nil) then ghostIndex=0 end
	if(ghostMat==nil) then ghostMat="build" end
	if(ghostIndex < 0) then return {}; end
	if(not isGhost and ghostIndex < 0) then return {}; end
	prefab_part = {
		name = "Amethyst-Core-G",
		position = {0,0,0},
		rotation = {0,0,0},
		scale = {.1/scaleConst,.1/scaleConst,.1/scaleConst},
		parts={
			prefab.ship.amethyst.core_aft.G(.1,isGhost, ghostIndex, ghostMat),
			prefab.ship.amethyst.core_fore.G(.1,isGhost, ghostIndex, ghostMat),
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

function prefab.weapon_info.amethyst.core.A()
	weapon_info = functions.combineWeaponInfo({
		prefab.weapon_info.amethyst.core_aft.A(),
		prefab.weapon_info.amethyst.core_fore.A(),
	});
	return weapon_info
end

function prefab.ship.amethyst.core.A(scaleConst, isGhost, ghostIndex, ghostMat)
	if(ghostIndex==nil) then ghostIndex=0 end
	if(ghostMat==nil) then ghostMat="build" end
	if(ghostIndex < 0) then return {}; end
	if(not isGhost and ghostIndex < 0) then return {}; end
	prefab_part = {
		name = "Amethyst-Core-A",
		position = {0,0,0},
		rotation = {0,0,0},
		scale = {.1/scaleConst,.1/scaleConst,.1/scaleConst},
		parts={
			prefab.ship.amethyst.core_aft.A(.1,isGhost, ghostIndex, ghostMat),
			prefab.ship.amethyst.core_fore.A(.1,isGhost, ghostIndex, ghostMat),
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

function prefab.weapon_info.amethyst.core.C()
	weapon_info = functions.combineWeaponInfo({
		prefab.weapon_info.amethyst.core_aft.C(),
		prefab.weapon_info.amethyst.core_fore.C(),
	});
	return weapon_info
end
function prefab.ship.amethyst.core.C(scaleConst, isGhost, ghostIndex, ghostMat)
	if(ghostIndex==nil) then ghostIndex=0 end
	if(ghostMat==nil) then ghostMat="build" end
	if(ghostIndex < 0) then return {}; end
	if(not isGhost and ghostIndex < 0) then return {}; end
	prefab_part = {
		name = "Amethyst-Core-C",
		position = {0,0,0},
		rotation = {0,0,0},
		scale = {.1/scaleConst,.1/scaleConst,.1/scaleConst},
		parts={
			prefab.ship.amethyst.core_aft.C(.1,isGhost, ghostIndex, ghostMat),
			prefab.ship.amethyst.core_fore.C(.1,isGhost, ghostIndex, ghostMat),
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

function prefab.weapon_info.amethyst.bow.P()
	weapon_info = {
		prefab.weapon_info.laser.TS(1),
	}
	return weapon_info
end
function prefab.ship.amethyst.bow.P(scaleConst, isGhost, ghostIndex, ghostMat)
	if(ghostIndex==nil) then ghostIndex=0 end
	if(ghostMat==nil) then ghostMat="build" end
	if(ghostIndex < 0) then return {}; end
	if(not isGhost and ghostIndex < 0) then return {}; end
	prefab_part = {
		name = "Amethyst-Bow-P",
		mesh = "7-Amethyst/Amethyst-Bow-P",
		materials = {"329_MT_arc_hull_dark","329_MT_arc_teamGlow", "329_MT_arc_hull", "329_MT_arc_teamColour", },
		position = {0,0,0},
		rotation = {0,0,0},
		scale = {.1/scaleConst,.1/scaleConst,.1/scaleConst},
		parts={

			prefab.weapon.laser.TS(
				{ 0, 0, 14 },
				{ 0, 0, 0 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),
			{
				name = "Spinal",
				position = {0,0,0},
				rotation = {0,0,0},
				scale = {1, 1, 1},
				parts={
			{
				name = "Spinal Barrel",
				mesh = "6-Sapphire/Spinal-Barrel",
				materials = isGhost and {"329_MT_arc_"..ghostIndex.."_"..ghostMat,"329_MT_arc_"..ghostIndex.."_"..ghostMat,"329_MT_arc_"..ghostIndex.."_"..ghostMat,"329_MT_arc_"..ghostIndex.."_"..ghostMat,"329_MT_arc_"..ghostIndex.."_"..ghostMat,} or {"329_MT_arc_hull_dark","329_MT_arc_teamGlow", "329_MT_arc_hull", "329_MT_arc_teamColour", },
				position = {0,0,14.5},
				rotation = {0,90,0},
				scale = {1, 1, 1},
			},
			
		}},

			prefab.ship.amethyst.bow.P(.1, isGhost, ghostIndex-1, ghostMat),

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
function prefab.weapon_info.amethyst.bow.B()
	weapon_info = {
		prefab.weapon_info.cannon.TS(1),
	}
	return weapon_info
end
function prefab.ship.amethyst.bow.B(scaleConst, isGhost, ghostIndex, ghostMat)
	if(ghostIndex==nil) then ghostIndex=0 end
	if(ghostMat==nil) then ghostMat="build" end
	if(ghostIndex < 0) then return {}; end
	if(not isGhost and ghostIndex < 0) then return {}; end
	prefab_part = {
		name = "Amethyst-Bow-B",
		mesh = "7-Amethyst/Amethyst-Bow-B",
		materials = {"329_MT_arc_hull_dark","329_MT_arc_teamGlow", "329_MT_arc_hull", "329_MT_arc_teamColour", },
		position = {0,0,0},
		rotation = {0,0,0},
		scale = {.1/scaleConst,.1/scaleConst,.1/scaleConst},
		parts={

			prefab.weapon.cannon.TS(
				{ 0, 0, 14 },
				{ 0, 0, 0 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),
			{
				name = "Spinal",
				position = {0,0,0},
				rotation = {0,0,0},
				scale = {1, 1, 1},
				parts={
			{
				name = "Spinal Barrel",
				mesh = "6-Sapphire/Spinal-Barrel",
				materials = isGhost and {"329_MT_arc_"..ghostIndex.."_"..ghostMat,"329_MT_arc_"..ghostIndex.."_"..ghostMat,"329_MT_arc_"..ghostIndex.."_"..ghostMat,"329_MT_arc_"..ghostIndex.."_"..ghostMat,"329_MT_arc_"..ghostIndex.."_"..ghostMat,} or {"329_MT_arc_hull_dark","329_MT_arc_teamGlow", "329_MT_arc_hull", "329_MT_arc_teamColour", },
				position = {0,0,14.5001},
				rotation = {0,90,0},
				scale = {1, 1, 1},
			},
		}},

			prefab.ship.amethyst.bow.B(.1, isGhost, ghostIndex-1, ghostMat),
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
function prefab.weapon_info.amethyst.bow.M()
	weapon_info = {
		prefab.weapon_info.missile.vls.T(2),
	}
	return weapon_info
end
function prefab.ship.amethyst.bow.M(scaleConst, isGhost, ghostIndex, ghostMat)
	if(ghostIndex==nil) then ghostIndex=0 end
	if(ghostMat==nil) then ghostMat="build" end
	if(ghostIndex < 0) then return {}; end
	if(not isGhost and ghostIndex < 0) then return {}; end
	prefab_part = {
		name = "Amethyst-Bow-M",
		mesh = "7-Amethyst/Amethyst-Bow-M",
		materials = {"329_MT_arc_hull_dark","329_MT_arc_teamGlow", "329_MT_arc_hull", "329_MT_arc_teamColour", },
		position = {0,0,0},
		rotation = {0,0,0},
		scale = {.1/scaleConst,.1/scaleConst,.1/scaleConst},
		parts={

			prefab.weapon.missile.vls.T(
				{ -1.5, 0, 14 },
				{ 0, 0, 0 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),
			prefab.weapon.missile.vls.T(
				{ 1.5, 0, 14 },
				{ 0, 0, 0 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),

			prefab.ship.amethyst.bow.M(.1, isGhost, ghostIndex-1, ghostMat),
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
function prefab.weapon_info.amethyst.bow.G()
	weapon_info = {
		prefab.weapon_info.lightning.TS(1),
	}
	return weapon_info
end
function prefab.ship.amethyst.bow.G(scaleConst, isGhost, ghostIndex, ghostMat)
	if(ghostIndex==nil) then ghostIndex=0 end
	if(ghostMat==nil) then ghostMat="build" end
	if(ghostIndex < 0) then return {}; end
	if(not isGhost and ghostIndex < 0) then return {}; end
	prefab_part = {
		name = "Amethyst-Bow-G",
		mesh = "7-Amethyst/Amethyst-Bow-G",
		materials = {"329_MT_arc_hull_dark","329_MT_arc_teamGlow", "329_MT_arc_hull", "329_MT_arc_teamColour", },
		position = {0,0,0},
		rotation = {0,0,0},
		scale = {.1/scaleConst,.1/scaleConst,.1/scaleConst},
		parts={

			prefab.weapon.lightning.TS(
				{ 0, 0, 14 },
				{ 0, 0, 0 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),
			{
				name = "Spinal",
				position = {0,0,0},
				rotation = {0,0,0},
				scale = {1, 1, 1},
				parts={
			{
				name = "Spinal Barrel",
				mesh = "6-Sapphire/Spinal-Barrel",
				materials = isGhost and {"329_MT_arc_"..ghostIndex.."_"..ghostMat,"329_MT_arc_"..ghostIndex.."_"..ghostMat,"329_MT_arc_"..ghostIndex.."_"..ghostMat,"329_MT_arc_"..ghostIndex.."_"..ghostMat,"329_MT_arc_"..ghostIndex.."_"..ghostMat,} or {"329_MT_arc_hull_dark","329_MT_arc_teamGlow", "329_MT_arc_hull", "329_MT_arc_teamColour", },
				position = {0,0,14.5},
				rotation = {0,90,0},
				scale = {1, 1, 1},
			},
		}},

			prefab.ship.amethyst.bow.G(.1, isGhost, ghostIndex-1, ghostMat),
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
function prefab.weapon_info.amethyst.bow.A()
	weapon_info = {
		prefab.weapon_info.railgun.TS(1),
	}
	return weapon_info
end
function prefab.ship.amethyst.bow.A(scaleConst, isGhost, ghostIndex, ghostMat)
	if(ghostIndex==nil) then ghostIndex=0 end
	if(ghostMat==nil) then ghostMat="build" end
	if(ghostIndex < 0) then return {}; end
	if(not isGhost and ghostIndex < 0) then return {}; end
	prefab_part = {
		name = "Amethyst-Bow-A",
		mesh = "7-Amethyst/Amethyst-Bow-A",
		materials = {"329_MT_arc_hull_dark","329_MT_arc_teamGlow", "329_MT_arc_hull", "329_MT_arc_teamColour", },
		position = {0,0,0},
		rotation = {0,0,0},
		scale = {.1/scaleConst,.1/scaleConst,.1/scaleConst},
		parts={

			prefab.weapon.railgun.TS(
				{ 0, 0, 14 },
				{ 0, 0, 0 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),

			{
				name = "Spinal",
				position = {0,0,0},
				rotation = {0,0,0},
				scale = {1, 1, 1},
				parts={
			{
				name = "Spinal Barrel",
				mesh = "6-Sapphire/Spinal-Barrel",
				materials = isGhost and {"329_MT_arc_"..ghostIndex.."_"..ghostMat,"329_MT_arc_"..ghostIndex.."_"..ghostMat,"329_MT_arc_"..ghostIndex.."_"..ghostMat,"329_MT_arc_"..ghostIndex.."_"..ghostMat,"329_MT_arc_"..ghostIndex.."_"..ghostMat,} or {"329_MT_arc_hull_dark","329_MT_arc_teamGlow", "329_MT_arc_hull", "329_MT_arc_teamColour", },
				position = {0,0,14.5},
				rotation = {0,90,0},
				scale = {1, 1, 1},
			},
		}},

			prefab.ship.amethyst.bow.A(.1, isGhost, ghostIndex-1, ghostMat),

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

function prefab.weapon_info.amethyst.bow.C()
	weapon_info = {
		prefab.weapon_info.hangar.quartz(10),
		-- prefab.weapon_info.laser.S(2),
		-- prefab.weapon_info.missile.hls.S(4),
	}
	return weapon_info
end
function prefab.ship.amethyst.bow.C(scaleConst, isGhost, ghostIndex, ghostMat)
	if(ghostIndex==nil) then ghostIndex=0 end
	if(ghostMat==nil) then ghostMat="build" end
	if(ghostIndex < 0) then return {}; end
	if(not isGhost and ghostIndex < 0) then return {}; end
	prefab_part = {
		name = "Amethyst-Bow-C",
		mesh = "7-Amethyst/Amethyst-Bow-C",
		materials = {"329_MT_arc_hull_dark","329_MT_arc_teamGlow", "329_MT_arc_hull", "329_MT_arc_teamColour", },
		position = {0,0,0},
		rotation = {0,0,0},
		scale = {.1/scaleConst,.1/scaleConst,.1/scaleConst},
		parts={
			prefab.weapon.hangar.quartz(
				{ -3, 1, 17 },
				{ 0, 0, 0 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),
			prefab.weapon.hangar.quartz(
				{ -1.5, 1, 17 },
				{ 0, 0, 0 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),
			prefab.weapon.hangar.quartz(
				{ -3, -1, 17 },
				{ 0, 0, 0 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),
			prefab.weapon.hangar.quartz(
				{ -1.5, -1, 17 },
				{ 0, 0, 0 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),

			prefab.weapon.hangar.quartz(
				{ 0, 1, 17 },
				{ 0, 0, 0 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),
			prefab.weapon.hangar.quartz(
				{ 0, -1, 17 },
				{ 0, 0, 0 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),

			prefab.weapon.hangar.quartz(
				{ 3, 1, 17 },
				{ 0, 0, 0 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),
			prefab.weapon.hangar.quartz(
				{ 1.5, 1, 17 },
				{ 0, 0, 0 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),
			prefab.weapon.hangar.quartz(
				{ 3, -1, 17 },
				{ 0, 0, 0 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),
			prefab.weapon.hangar.quartz(
				{ 1.5, -1, 17 },
				{ 0, 0, 0 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),

			prefab.ship.amethyst.bow.C(.1, isGhost, ghostIndex-1, ghostMat),
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