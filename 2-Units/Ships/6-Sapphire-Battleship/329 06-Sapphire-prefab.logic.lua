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

function prefab.ship.sapphire.thruster(scaleConst, isGhost, ghostIndex, ghostMat)
	if(ghostIndex==nil) then ghostIndex=0 end
	if(ghostMat==nil) then ghostMat="build" end
	if(ghostIndex < 0) then return {}; end
	if(not isGhost and ghostIndex < 0) then return {}; end
	prefab_part = {
		name     = "Thruster",
		position = { 0, 0, -12.5 },
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
				mesh     = "329-Thruster/Thruster-Plume",
				materials  = { "329_MT_arc_thruster_teamGlow", "329_MT_arc_thruster-middle_teamGlow", "329_MT_arc_thruster-outer_teamGlow" },
				position = { 0, 0, 0 }, --XYZ, Thruster subparts should all be on the same Y point, as they all scale along the parent's Y axis.
				rotation = { 0, 0, 0 },
				scale 	= { 7, 7, 7 },
			},
			{
				name     = "Thruster Plume",
				mesh     = "329-Thruster/Thruster-Plume",
				materials  = { "329_MT_arc_thruster_teamGlow", "329_MT_arc_thruster-middle_teamGlow", "329_MT_arc_thruster-outer_teamGlow" },
				position = { -3.25, 0, 0 }, --XYZ, Thruster subparts should all be on the same Y point, as they all scale along the parent's Y axis.
				rotation = { 0, 0, 0 },
				scale 	= { 4, 4, 4 },
			},
			{
				name     = "Thruster Plume",
				mesh     = "329-Thruster/Thruster-Plume",
				materials  = { "329_MT_arc_thruster_teamGlow", "329_MT_arc_thruster-middle_teamGlow", "329_MT_arc_thruster-outer_teamGlow" },
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
function prefab.ship.sapphire.stern.G(scaleConst, isGhost, ghostIndex, ghostMat)
	if(ghostIndex==nil) then ghostIndex=0 end
	if(ghostMat==nil) then ghostMat="build" end
	if(ghostIndex < 0) then return {}; end
	if(not isGhost and ghostIndex < 0) then return {}; end
	prefab_part = {
		name = "Sapphire-Stern-G",
		mesh = "329-6-Sapphire/Sapphire-Stern-G",
		materials = {"329_MT_arc_hull_dark","329_MT_arc_teamGlow", "329_MT_arc_hull", "329_MT_arc_teamColour", },
		position = {0,0,0},
		rotation = {0,0,0},
		scale = {.1/scaleConst,.1/scaleConst,.1/scaleConst},
		parts={
			prefab.weapon.lightning.M(
				{ 0, 3.75, -9.5 },
				{ 0, 0, 0 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),
			prefab.weapon.lightning.M(
				{ 0, -3.75, -9.5 },
				{ 0, 0, 180 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),


			prefab.weapon.lightning.S(
				{ -1, 3.25, -5.75 },
				{ 0, 0, 0 },
				{ 1.001, 1.001, 1.001 },
				isGhost, ghostIndex, ghostMat
			),
			prefab.weapon.lightning.S(
				{ 1, 3.25, -5.75 },
				{ 0, 0, 0 },
				{ 1.001, 1.001, 1.001 },
				isGhost, ghostIndex, ghostMat
			),
			prefab.weapon.lightning.S(
				{ -1, -3.25, -5.75 },
				{ 0, 0, 180 },
				{ 1.001, 1.001, 1.001 },
				isGhost, ghostIndex, ghostMat
			),
			prefab.weapon.lightning.S(
				{ 1, -3.25, -5.75 },
				{ 0, 0, 180 },
				{ 1.001, 1.001, 1.001 },
				isGhost, ghostIndex, ghostMat
			),

			
			prefab.part.emblem(
				{ 0, 3.25, -12.5},
				{ -18.4349, 0, 0 },
				{ 3, 3, 3 },
				isGhost, ghostIndex, ghostMat
			),
			prefab.part.emblem(
				{ 0, -3.25, -12.5},
				{ 18.4349, 0, 180 },
				{ 3, 3, 3 },
				isGhost, ghostIndex, ghostMat
			),
			prefab.ship.sapphire.thruster(scaleConst, isGhost, ghostIndex),

			prefab.ship.sapphire.stern.G(.1, isGhost, ghostIndex-1, ghostMat),
		}
	}
	if isGhost then
		if (ghostMat == "aegis_teamColour") then
			prefab_part.aegisVisual = true;
		end
		prefab_part.materials= {"329_MT_arc_"..ghostIndex.."_"..ghostMat,"329_MT_arc_"..ghostIndex.."_"..ghostMat,"329_MT_arc_"..ghostIndex.."_"..ghostMat,"329_MT_arc_"..ghostIndex.."_"..ghostMat,"329_MT_arc_"..ghostIndex.."_"..ghostMat,}
	end
	return prefab_part
end

function prefab.weapon_info.sapphire.stern.A()
	weapon_info = {
		prefab.weapon_info.railgun.L(2),
	}
	return weapon_info
end
function prefab.ship.sapphire.stern.A(scaleConst, isGhost, ghostIndex, ghostMat)
	if(ghostIndex==nil) then ghostIndex=0 end
	if(ghostMat==nil) then ghostMat="build" end
	if(ghostIndex < 0) then return {}; end
	if(not isGhost and ghostIndex < 0) then return {}; end
	prefab_part = {
		name = "Sapphire-Stern-A",
		mesh = "329-6-Sapphire/Sapphire-Stern-A",
		materials = {"329_MT_arc_hull_dark","329_MT_arc_teamGlow", "329_MT_arc_hull", "329_MT_arc_teamColour", },
		position = {0,0,0},
		rotation = {0,0,0},
		scale = {.1/scaleConst,.1/scaleConst,.1/scaleConst},
		parts={
			prefab.weapon.railgun.L(
				{ 0, 3.5, -8.75 },
				{ 0, 0, 0 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),
			prefab.weapon.railgun.L(
				{ 0, -3.5, -8.75 },
				{ 0, 0, 180 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),
			
			prefab.part.emblem(
				{ 0, 3.25, -12.5},
				{ -18.4349, 0, 0 },
				{ 3, 3, 3 },
				isGhost, ghostIndex, ghostMat
			),
			prefab.part.emblem(
				{ 0, -3.25, -12.5},
				{ 18.4349, 0, 180 },
				{ 3, 3, 3 },
				isGhost, ghostIndex, ghostMat
			),
			prefab.ship.sapphire.thruster(scaleConst, isGhost, ghostIndex),

			prefab.ship.sapphire.stern.A(.1, isGhost, ghostIndex-1, ghostMat),

		}
	}
	if isGhost then
		if (ghostMat == "aegis_teamColour") then
			prefab_part.aegisVisual = true;
		end
		prefab_part.materials= {"329_MT_arc_"..ghostIndex.."_"..ghostMat,"329_MT_arc_"..ghostIndex.."_"..ghostMat,"329_MT_arc_"..ghostIndex.."_"..ghostMat,"329_MT_arc_"..ghostIndex.."_"..ghostMat,"329_MT_arc_"..ghostIndex.."_"..ghostMat,}
	end
	return prefab_part
end

function prefab.weapon_info.sapphire.stern.C()
	weapon_info = {
		prefab.weapon_info.hangar.quartz.A(4),
		prefab.weapon_info.laser.S(2),
		-- prefab.weapon_info.missile.hls.S(4),
	}
	return weapon_info
end
function prefab.ship.sapphire.stern.C(scaleConst, isGhost, ghostIndex, ghostMat)
	if(ghostIndex==nil) then ghostIndex=0 end
	if(ghostMat==nil) then ghostMat="build" end
	if(ghostIndex < 0) then return {}; end
	if(not isGhost and ghostIndex < 0) then return {}; end
	prefab_part = {
		name = "Sapphire-Stern-C",
		mesh = "329-6-Sapphire/Sapphire-Stern-C",
		materials = {"329_MT_arc_hull_dark","329_MT_arc_teamGlow", "329_MT_arc_hull", "329_MT_arc_teamColour", },
		position = {0,0,0},
		rotation = {0,0,0},
		scale = {.1/scaleConst,.1/scaleConst,.1/scaleConst},
		parts={
			prefab.weapon.hangar.quartz.A(
				{ -5, 0, -5.75 },
				{ 0, -90, 0 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),
			prefab.weapon.hangar.quartz.A(
				{ 5, 0, -5.75 },
				{ 0, 90, 0 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),
			prefab.weapon.hangar.quartz.A(
				{ -5, 0, -7.25 },
				{ 0, -90, 0 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),
			prefab.weapon.hangar.quartz.A(
				{ 5, 0, -7.25 },
				{ 0, 90, 0 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),

			prefab.weapon.laser.S(
				{ 0, 3.25, -6.5 },
				{ 0, 0, 0 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),
			prefab.weapon.laser.S(
				{ 0, -3.25, -6.5 },
				{ 0, 0, 180 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),

			-- prefab.weapon.missile.hls.S(
			-- 	{ -2, 3, -9.75 },
			-- 	{ 0, 0, 0 },
			-- 	{ 1, 1, 1 },
			-- 	isGhost, ghostIndex, ghostMat
			-- ),
			-- prefab.weapon.missile.hls.S(
			-- 	{ 2, 3, -9.75 },
			-- 	{ 0, 0, 0 },
			-- 	{ 1, 1, 1 },
			-- 	isGhost, ghostIndex, ghostMat
			-- ),
			-- prefab.weapon.missile.hls.S(
			-- 	{ -2, -3, -9.75 },
			-- 	{ 0, 0, 180 },
			-- 	{ 1, 1, 1 },
			-- 	isGhost, ghostIndex, ghostMat
			-- ),
			-- prefab.weapon.missile.hls.S(
			-- 	{ 2, -3, -9.75 },
			-- 	{ 0, 0, 180 },
			-- 	{ 1, 1, 1 },
			-- 	isGhost, ghostIndex, ghostMat
			-- ),

			
			prefab.part.emblem(
				{ 0, 3.95, -9.5},
				{ 0, 0, 0 },
				{ 1.5, 1.5, 1.5 },
				isGhost, ghostIndex, ghostMat
			),
			prefab.part.emblem(
				{ 0, -3.95, -9.5},
				{ 0, 0, 180 },
				{ 1.5, 1.5, 1.5 },
				isGhost, ghostIndex, ghostMat
			),
			prefab.ship.sapphire.thruster(scaleConst, isGhost, ghostIndex),

			prefab.ship.sapphire.stern.C(.1, isGhost, ghostIndex-1, ghostMat),

		}
	}
	if isGhost then
		if (ghostMat == "aegis_teamColour") then
			prefab_part.aegisVisual = true;
		end
		prefab_part.materials= {"329_MT_arc_"..ghostIndex.."_"..ghostMat,"329_MT_arc_"..ghostIndex.."_"..ghostMat,"329_MT_arc_"..ghostIndex.."_"..ghostMat,"329_MT_arc_"..ghostIndex.."_"..ghostMat,"329_MT_arc_"..ghostIndex.."_"..ghostMat,}
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
function prefab.ship.sapphire.core.G(scaleConst, isGhost, ghostIndex, ghostMat)
	if(ghostIndex==nil) then ghostIndex=0 end
	if(ghostMat==nil) then ghostMat="build" end
	if(ghostIndex < 0) then return {}; end
	if(not isGhost and ghostIndex < 0) then return {}; end
	prefab_part = {
		name = "Sapphire-Core-G",
		mesh = "329-6-Sapphire/Sapphire-Core-G",
		materials = {"329_MT_arc_hull_dark","329_MT_arc_teamGlow", "329_MT_arc_hull", "329_MT_arc_teamColour", },
		position = {0,0,0},
		rotation = {0,0,0},
		scale = {.1/scaleConst,.1/scaleConst,.1/scaleConst},
		parts={
			prefab.weapon.lightning.L(
				{ 0, 2.75, -.75 },
				{ 0, 0, 0 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),
			prefab.weapon.lightning.L(
				{ 0, -2.75, -.75 },
				{ 0, 0, 180 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),


			prefab.weapon.lightning.M(
				{ -4.74, 1.76, -.75 },
				{ 0, 0, 45 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),
			prefab.weapon.lightning.M(
				{ 4.74, 1.76, -.75 },
				{ 0, 0, -45 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),
			prefab.weapon.lightning.S(
				{ -4.75, -1.75, -.75 },
				{ 0, 0, 135 },
				{ .100/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost, ghostIndex, ghostMat
			),
			prefab.weapon.lightning.S(
				{ 4.75, -1.75, -.75 },
				{ 0, 0, -135 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),

			prefab.ship.sapphire.core.G(.1, isGhost, ghostIndex-1, ghostMat),

		}
	}
	if isGhost then
		if (ghostMat == "aegis_teamColour") then
			prefab_part.aegisVisual = true;
		end
		prefab_part.materials= {"329_MT_arc_"..ghostIndex.."_"..ghostMat,"329_MT_arc_"..ghostIndex.."_"..ghostMat,"329_MT_arc_"..ghostIndex.."_"..ghostMat,"329_MT_arc_"..ghostIndex.."_"..ghostMat,"329_MT_arc_"..ghostIndex.."_"..ghostMat,}
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
function prefab.ship.sapphire.core.A(scaleConst, isGhost, ghostIndex, ghostMat)
	if(ghostIndex==nil) then ghostIndex=0 end
	if(ghostMat==nil) then ghostMat="build" end
	if(ghostIndex < 0) then return {}; end
	if(not isGhost and ghostIndex < 0) then return {}; end
	prefab_part = {
		name = "Sapphire-Core-A",
		mesh = "329-6-Sapphire/Sapphire-Core-A",
		materials = {"329_MT_arc_hull_dark","329_MT_arc_teamGlow", "329_MT_arc_hull", "329_MT_arc_teamColour", },
		position = {0,0,0},
		rotation = {0,0,0},
		scale = {.1/scaleConst,.1/scaleConst,.1/scaleConst},
		parts={
			prefab.weapon.railgun.L(
				{ -2, 2.5, -.75 },
				{ 0, 0, 0 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),
			prefab.weapon.railgun.L(
				{ 2, 2.5, -.75 },
				{ 0, 0, 0 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),
			prefab.weapon.railgun.L(
				{ 0, -2.5, -.75 },
				{ 0, 0, 180 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),

			prefab.weapon.railgun.M(
				{ 0, -2, 3 },
				{ -18.4349, 0, 180 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),

			prefab.ship.sapphire.core.A(.1, isGhost, ghostIndex-1, ghostMat),

		}
	}
	if isGhost then
		if (ghostMat == "aegis_teamColour") then
			prefab_part.aegisVisual = true;
		end
		prefab_part.materials= {"329_MT_arc_"..ghostIndex.."_"..ghostMat,"329_MT_arc_"..ghostIndex.."_"..ghostMat,"329_MT_arc_"..ghostIndex.."_"..ghostMat,"329_MT_arc_"..ghostIndex.."_"..ghostMat,"329_MT_arc_"..ghostIndex.."_"..ghostMat,}
	end
	return prefab_part
end

function prefab.weapon_info.sapphire.core.C()
	weapon_info = {
		prefab.weapon_info.hangar.quartz.G(6),
		prefab.weapon_info.missile.hls.M(2),
	}
	return weapon_info
end
function prefab.ship.sapphire.core.C(scaleConst, isGhost, ghostIndex, ghostMat)
	if(ghostIndex==nil) then ghostIndex=0 end
	if(ghostMat==nil) then ghostMat="build" end
	if(ghostIndex < 0) then return {}; end
	if(not isGhost and ghostIndex < 0) then return {}; end
	prefab_part = {
		name = "Sapphire-Core-C",
		mesh = "329-6-Sapphire/Sapphire-Core-C",
		materials = {"329_MT_arc_hull_dark","329_MT_arc_teamGlow", "329_MT_arc_hull", "329_MT_arc_teamColour", },
		position = {0,0,0},
		rotation = {0,0,0},
		scale = {.1/scaleConst,.1/scaleConst,.1/scaleConst},
		parts={
			prefab.weapon.hangar.quartz.G(
				{ -5, 0, -3.75 },
				{ 0, -90, 0 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),
			prefab.weapon.hangar.quartz.G(
				{ -5, 0, -2.25 },
				{ 0, -90, 0 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),
			prefab.weapon.hangar.quartz.G(
				{ -5, 0, -.75 },
				{ 0, -90, 0 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),
			prefab.weapon.hangar.quartz.G(
				{ 5, 0, -3.75 },
				{ 0, 90, 0 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),
			prefab.weapon.hangar.quartz.G(
				{ 5, 0, -2.25 },
				{ 0, 90, 0 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),
			prefab.weapon.hangar.quartz.G(
				{ 5, 0, -.75 },
				{ 0, 90, 0 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),

			prefab.weapon.missile.hls.M(
				{ -5, 0, 1.375 },
				{ 0, 0, 90 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),
			prefab.weapon.missile.hls.M(
				{ 5, 0, 1.375 },
				{ 0, 0, -90 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),

			prefab.ship.sapphire.core.C(.1, isGhost, ghostIndex-1, ghostMat),

		}
	}
	if isGhost then
		if (ghostMat == "aegis_teamColour") then
			prefab_part.aegisVisual = true;
		end
		prefab_part.materials= {"329_MT_arc_"..ghostIndex.."_"..ghostMat,"329_MT_arc_"..ghostIndex.."_"..ghostMat,"329_MT_arc_"..ghostIndex.."_"..ghostMat,"329_MT_arc_"..ghostIndex.."_"..ghostMat,"329_MT_arc_"..ghostIndex.."_"..ghostMat,}
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
function prefab.ship.sapphire.bow.G(scaleConst, isGhost, ghostIndex, ghostMat)
	if(ghostIndex==nil) then ghostIndex=0 end
	if(ghostMat==nil) then ghostMat="build" end
	if(ghostIndex < 0) then return {}; end
	if(not isGhost and ghostIndex < 0) then return {}; end
	prefab_part = {
		name = "Sapphire-Bow-G",
		mesh = "329-6-Sapphire/Sapphire-Bow-G",
		materials = {"329_MT_arc_hull_dark","329_MT_arc_teamGlow", "329_MT_arc_hull", "329_MT_arc_teamColour", },
		position = {0,0,0},
		rotation = {0,0,0},
		scale = {.1/scaleConst,.1/scaleConst,.1/scaleConst},
		parts={
			prefab.weapon.lightning.M(
				{ -2, 1.75, 6.75 },
				{ 0, 0, 0 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),
			prefab.weapon.lightning.M(
				{ 2, 1.75, 6.75 },
				{ 0, 0, 0 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),
			prefab.weapon.lightning.M(
				{ -2, -1.75, 6.75 },
				{ 0, 0, 180 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),
			prefab.weapon.lightning.M(
				{ 2, -1.75, 6.75 },
				{ 0, 0, 180 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),

			prefab.ship.sapphire.bow.G(.1, isGhost, ghostIndex-1, ghostMat),

		}
	}
	if isGhost then
		if (ghostMat == "aegis_teamColour") then
			prefab_part.aegisVisual = true;
		end
		prefab_part.materials= {"329_MT_arc_"..ghostIndex.."_"..ghostMat,"329_MT_arc_"..ghostIndex.."_"..ghostMat,"329_MT_arc_"..ghostIndex.."_"..ghostMat,"329_MT_arc_"..ghostIndex.."_"..ghostMat,"329_MT_arc_"..ghostIndex.."_"..ghostMat,}
	end
	return prefab_part
end

function prefab.weapon_info.sapphire.bow.A()
	weapon_info = {
		prefab.weapon_info.railgun.L(2),
	}
	return weapon_info
end
function prefab.ship.sapphire.bow.A(scaleConst, isGhost, ghostIndex, ghostMat)
	if(ghostIndex==nil) then ghostIndex=0 end
	if(ghostMat==nil) then ghostMat="build" end
	if(ghostIndex < 0) then return {}; end
	if(not isGhost and ghostIndex < 0) then return {}; end
	prefab_part = {
		name = "Sapphire-Bow-A",
		mesh = "329-6-Sapphire/Sapphire-Bow-A",
		materials = {"329_MT_arc_hull_dark","329_MT_arc_teamGlow", "329_MT_arc_hull", "329_MT_arc_teamColour", },
		position = {0,0,0},
		rotation = {0,0,0},
		scale = {.1/scaleConst,.1/scaleConst,.1/scaleConst},
		parts={
			prefab.weapon.railgun.L(
				{ 0, 1.5, 7.25 },
				{ 0, 0, 0 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),
			prefab.weapon.railgun.L(
				{ 0, -1.5, 7.25 },
				{ 0, 0, 180 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),

			prefab.ship.sapphire.bow.A(.1, isGhost, ghostIndex-1, ghostMat),


		}
	}
	if isGhost then
		if (ghostMat == "aegis_teamColour") then
			prefab_part.aegisVisual = true;
		end
		prefab_part.materials= {"329_MT_arc_"..ghostIndex.."_"..ghostMat,"329_MT_arc_"..ghostIndex.."_"..ghostMat,"329_MT_arc_"..ghostIndex.."_"..ghostMat,"329_MT_arc_"..ghostIndex.."_"..ghostMat,"329_MT_arc_"..ghostIndex.."_"..ghostMat,}
	end
	return prefab_part
end

function prefab.weapon_info.sapphire.bow.S()
	weapon_info = {
		prefab.weapon_info.laser.XS(1),
	}
	return weapon_info
end
function prefab.ship.sapphire.bow.S(scaleConst, isGhost, ghostIndex, ghostMat)
	if(ghostIndex==nil) then ghostIndex=0 end
	if(ghostMat==nil) then ghostMat="build" end
	if(ghostIndex < 0) then return {}; end
	if(not isGhost and ghostIndex < 0) then return {}; end
	spinal_mats = isGhost and {"329_MT_arc_"..ghostIndex.."_"..ghostMat,"329_MT_arc_"..ghostIndex.."_"..ghostMat,"329_MT_arc_"..ghostIndex.."_"..ghostMat,} or {"329_MT_arc_teamGlow", "329_MT_arc_hull", "329_MT_arc_teamColour", };
	prefab_part = {
		name = "Sapphire-Bow-S",
		mesh = "329-6-Sapphire/Sapphire-Bow-S",
		materials = {"329_MT_arc_hull_dark","329_MT_arc_teamGlow", "329_MT_arc_hull", "329_MT_arc_teamColour", },
		position = {0,0,0},
		rotation = {0,0,0},
		scale = {.1/scaleConst,.1/scaleConst,.1/scaleConst},
		parts={
			prefab.weapon.laser.XS(
				{ 0, 0, 6.5 },
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
						mesh = "329-6-Sapphire/Spinal-Barrel",
						materials = isGhost and {"329_MT_arc_"..ghostIndex.."_"..ghostMat,"329_MT_arc_"..ghostIndex.."_"..ghostMat,"329_MT_arc_"..ghostIndex.."_"..ghostMat,"329_MT_arc_"..ghostIndex.."_"..ghostMat,} or {"329_MT_arc_hull_dark","329_MT_arc_teamGlow", "329_MT_arc_hull", "329_MT_arc_teamColour", },
						position = {0,0,7},
						rotation = {0,90,0},
						scale = {1, 1, 1},
					},
					{
						name = "Spinal Ring",
						mesh = "329-6-Sapphire/Spinal-Ring",
						materials = spinal_mats,
						position = {0,0,13.25},
						rotation = {0,90,0},
						scale = {1, 1, 1},
					},
					{
						name = "Spinal Ring",
						mesh = "329-6-Sapphire/Spinal-Ring",
						materials = spinal_mats,
						position = {0,0,13.25-2.5},
						rotation = {0,90,0},
						scale = {1, 1, 1},
					},
					{
						name = "Spinal Ring",
						mesh = "329-6-Sapphire/Spinal-Ring",
						materials = spinal_mats,
						position = {0,0,13.25-5},
						rotation = {0,90,0},
						scale = {1, 1, 1},
					},
				}
			},

			prefab.ship.sapphire.bow.S(.1, isGhost, ghostIndex-1, ghostMat),

			
		}
	}
	if isGhost then
		if (ghostMat == "aegis_teamColour") then
			prefab_part.aegisVisual = true;
		end
		prefab_part.materials= {"329_MT_arc_"..ghostIndex.."_"..ghostMat,"329_MT_arc_"..ghostIndex.."_"..ghostMat,"329_MT_arc_"..ghostIndex.."_"..ghostMat,"329_MT_arc_"..ghostIndex.."_"..ghostMat,"329_MT_arc_"..ghostIndex.."_"..ghostMat,}
	end
	return prefab_part
end