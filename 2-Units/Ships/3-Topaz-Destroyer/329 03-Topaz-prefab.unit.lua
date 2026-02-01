prefab.ship.topaz = {
	stern = {},
	bow = {}
}
prefab.weapon_info.topaz = {
	stern = {},
	bow = {}
}
function prefab.ship.topaz.thruster(scaleConst, isGhost, ghostIndex, ghostMat)
	if(ghostIndex==nil) then ghostIndex=0 end
	if(ghostMat==nil) then ghostMat="build" end
	if(ghostIndex < 0) then return {}; end
	if(not isGhost and ghostIndex < 0) then return {}; end
	prefab_part = {
		name     = "Thruster",
		position = { 0, 0, -6.5 },
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
function prefab.ship.topaz.stern.P(scaleConst, isGhost, ghostIndex, ghostMat)
	if(ghostIndex==nil) then ghostIndex=0 end
	if(ghostMat==nil) then ghostMat="build" end
	if(ghostIndex < 0) then return {}; end
	if(not isGhost and ghostIndex < 0) then return {}; end
	prefab_part = {
		name = "Topaz-Stern-P",
		mesh = "3-Topaz/Topaz-Stern-P",
		materials = { "329_MT_arc_hull_dark", "329_MT_arc_teamGlow", "329_MT_arc_hull", "329_MT_arc_teamColour", },
		position = {0,0,0},
		rotation = {0,0,0},
		scale = {.1/scaleConst,.1/scaleConst,.1/scaleConst},
		parts={
			prefab.weapon.laser.M(
				{ 0, 1.75, -2.5 },
				{ 0, 0, 0 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),
			prefab.weapon.laser.M(
				{ 0, -1.75, -2.5 },
				{ 0, 0, 180 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),
			
			prefab.part.emblem(
				{ 0, 1.75, -5},
				{ 0, 0, 0 },
				{ 1.5, 1.5, 1.5 },
				isGhost, ghostIndex, ghostMat
			),
			prefab.part.emblem(
				{ 0, -1.75, -5},
				{ 0, 0, 180 },
				{ 1.5, 1.5, 1.5 },
				isGhost, ghostIndex, ghostMat
			),
			prefab.ship.topaz.thruster(scaleConst, isGhost, ghostIndex),

			prefab.ship.topaz.stern.P(.1, isGhost, ghostIndex-1, ghostMat),
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

function prefab.weapon_info.topaz.stern.B()
	weapon_info = {
		prefab.weapon_info.cannon.M(2),
		-- prefab.weapon_info.cannon.S(2),
	}
	return weapon_info
end
function prefab.ship.topaz.stern.B(scaleConst, isGhost, ghostIndex, ghostMat)
	if(ghostIndex==nil) then ghostIndex=0 end
	if(ghostMat==nil) then ghostMat="build" end
	if(ghostIndex < 0) then return {}; end
	if(not isGhost and ghostIndex < 0) then return {}; end
	prefab_part = {
		name = "Topaz-Stern-B",
		mesh = "3-Topaz/Topaz-Stern-B",
		materials = { "329_MT_arc_hull_dark", "329_MT_arc_teamGlow", "329_MT_arc_hull", "329_MT_arc_teamColour", },
		position = {0,0,0},
		rotation = {0,0,0},
		scale = {.1/scaleConst,.1/scaleConst,.1/scaleConst},
		parts={
			-- prefab.weapon.cannon.S(
			-- 	{ 0, 1.75, -1.75 },
			-- 	{ 0, 0, 0 },
			-- 	{ 1, 1, 1 },
			-- 	isGhost
			-- ),
			-- prefab.weapon.cannon.S(
			-- 	{ 0, -1.75, -1.75 },
			-- 	{ 0, 0, 180 },
			-- 	{ 1, 1, 1 },
			-- 	isGhost
			-- ),
			prefab.weapon.cannon.M(
				{ 2.25, 0, -2 },
				{ 0, 0, -90 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),
			prefab.weapon.cannon.M(
				{ -2.25, 0, -2 },
				{ 0, 0, 90 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),

			prefab.part.emblem(
				{ 0, 1.75, -4.25},
				{ 0, 0, 0 },
				{ 1.5, 1.5, 1.5 },
				isGhost, ghostIndex, ghostMat
			),
			prefab.part.emblem(
				{ 0, -1.75, -4.25},
				{ 0, 0, 180 },
				{ 1.5, 1.5, 1.5 },
				isGhost, ghostIndex, ghostMat
			),

			prefab.ship.topaz.thruster(scaleConst, isGhost, ghostIndex),

			prefab.ship.topaz.stern.B(.1, isGhost, ghostIndex-1, ghostMat),
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

function prefab.weapon_info.topaz.stern.M()
	weapon_info = {
		prefab.weapon_info.missile.vls.M(4),
	}
	return weapon_info
end
function prefab.ship.topaz.stern.M(scaleConst, isGhost, ghostIndex, ghostMat)
	if(ghostIndex==nil) then ghostIndex=0 end
	if(ghostMat==nil) then ghostMat="build" end
	if(ghostIndex < 0) then return {}; end
	if(not isGhost and ghostIndex < 0) then return {}; end
	prefab_part = {
		name = "Topaz-Stern-M",
		mesh = "3-Topaz/Topaz-Stern-M",
		materials = {"329_MT_arc_hull_dark","329_MT_arc_teamGlow", "329_MT_arc_hull", "329_MT_arc_teamColour", },
		position = {0,0,0},
		rotation = {0,0,0},
		scale = {.1/scaleConst,.1/scaleConst,.1/scaleConst},
		parts={
			prefab.weapon.missile.vls.M(
				{ 2.25, .75, -2 },
				{ 0, 90, 90 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),
			prefab.weapon.missile.vls.M(
				{ 2.25, -.75, -2 },
				{ 0, 90, 90 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),
			prefab.weapon.missile.vls.M(
				{ -2.25, .75, -2 },
				{ 0, -90, -90 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),
			prefab.weapon.missile.vls.M(
				{ -2.25, -.75, -2 },
				{ 0, -90, -90 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),
			
			prefab.part.emblem(
				{ 0, 1.5, -4.25},
				{ 0, 0, 0 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),
			prefab.part.emblem(
				{ 0, -1.5, -4.25},
				{ 0, 0, 180 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),

			prefab.ship.topaz.thruster(scaleConst, isGhost, ghostIndex),

			prefab.ship.topaz.stern.M(.1, isGhost, ghostIndex-1, ghostMat),
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


function prefab.weapon_info.topaz.bow.P()
	weapon_info = {
		prefab.weapon_info.laser.S(3),
	}
	return weapon_info
end
function prefab.ship.topaz.bow.P(scaleConst, isGhost, ghostIndex, ghostMat)
	if(ghostIndex==nil) then ghostIndex=0 end
	if(ghostMat==nil) then ghostMat="build" end
	if(ghostIndex < 0) then return {}; end
	if(not isGhost and ghostIndex < 0) then return {}; end
	prefab_part = {
		name = "Topaz-Bow-P",
		mesh = "329-3-Topaz/Topaz-Bow-P",
		materials = { "329_MT_arc_hull_dark", "329_MT_arc_teamGlow", "329_MT_arc_hull", "329_MT_arc_teamColour", },
		position = {0,0,0},
		rotation = {0,0,0},
		scale = {.1/scaleConst,.1/scaleConst,.1/scaleConst},
		parts={
			prefab.weapon.laser.S(
				{ 0, 1.25, 3 },
				{ 0, 0, 0 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),
			prefab.weapon.laser.S(
				{ 0, .75, 6 },
				{ 18.4349, 0, 0 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),
			prefab.weapon.laser.S(
				{ 0, -.75, 6 },
				{ -18.4349, 0, 180 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),

			prefab.ship.topaz.bow.P(.1, isGhost, ghostIndex-1, ghostMat),
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

function prefab.weapon_info.topaz.bow.B()
	weapon_info = {
		prefab.weapon_info.cannon.S(2),
		prefab.weapon_info.cannon.S(1),
	}
	return weapon_info
end
function prefab.ship.topaz.bow.B(scaleConst, isGhost, ghostIndex, ghostMat)
	if(ghostIndex==nil) then ghostIndex=0 end
	if(ghostMat==nil) then ghostMat="build" end
	if(ghostIndex < 0) then return {}; end
	if(not isGhost and ghostIndex < 0) then return {}; end
	prefab_part = {
		name = "Topaz-Bow-B",
		mesh = "329-3-Topaz/Topaz-Bow-B",
		materials = { "329_MT_arc_hull_dark", "329_MT_arc_teamGlow", "329_MT_arc_hull", "329_MT_arc_teamColour", },
		position = {0,0,0},
		rotation = {0,0,0},
		scale = {.1/scaleConst,.1/scaleConst,.1/scaleConst},
		parts={
			prefab.weapon.cannon.S(
				{ 1, 1.25, 2.75 },
				{ 0, 0, 0 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),
			prefab.weapon.cannon.S(
				{ -1, 1.25, 2.75 },
				{ 0, 0, 0 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),
			
			prefab.weapon.cannon.S(
				{ 0, -1.25, 2.75 },
				{ 0, 0, 180 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),

			prefab.ship.topaz.bow.B(.1, isGhost, ghostIndex-1, ghostMat),
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

function prefab.weapon_info.topaz.bow.M()
	weapon_info = {
		prefab.weapon_info.missile.hls.S(4),
		prefab.weapon_info.missile.vls.S(2),
	}
	return weapon_info
end
function prefab.ship.topaz.bow.M(scaleConst, isGhost, ghostIndex, ghostMat)
	if(ghostIndex==nil) then ghostIndex=0 end
	if(ghostMat==nil) then ghostMat="build" end
	if(ghostIndex < 0) then return {}; end
	if(not isGhost and ghostIndex < 0) then return {}; end
	prefab_part = {
		name = "Topaz-Bow-M",
		mesh = "329-3-Topaz/Topaz-Bow-M",
		materials = { "329_MT_arc_hull_dark", "329_MT_arc_teamGlow", "329_MT_arc_hull", "329_MT_arc_teamColour", },
		position = {0,0,0},
		rotation = {0,0,0},
		scale = {.1/scaleConst,.1/scaleConst,.1/scaleConst},
		parts={
			prefab.weapon.missile.hls.S(
				{ 1, 1.25, 2.5 },
				{ 0, 0, 0 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),
			prefab.weapon.missile.hls.S(
				{ -1, 1.25, 2.5 },
				{ 0, 0, 0 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),
			prefab.weapon.missile.hls.S(
				{ 1, -1.25, 2.5 },
				{ 0, 0, 180 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),
			prefab.weapon.missile.hls.S(
				{ -1, -1.25, 2.5 },
				{ 0, 0, 180 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),
			
			prefab.weapon.missile.vls.S(
				{ 1, 1.5, .75 },
				{ -90+18.4349, 0, 0 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),
			prefab.weapon.missile.vls.S(
				{ -1, 1.5, .75 },
				{ -90+18.4349, 0, 0 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),

			prefab.ship.topaz.bow.M(.1, isGhost, ghostIndex-1, ghostMat),
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