
prefab.ship.quartz = {
	core = {}
}
prefab.weapon_info.quartz = {
	core = {}
}

function prefab.ship.quartz.thruster(scaleConst, isGhost, ghostIndex, ghostMat)
	if(ghostIndex==nil) then ghostIndex=0 end
	if(ghostMat==nil) then ghostMat="build" end
	if(ghostIndex < 0) then return {}; end
	if(not isGhost and ghostIndex < 0) then return {}; end
	prefab_part = {
		name     = "Thruster",
		position = { 0, 0, -.4125 },
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
				scale 	= { .4, .3, .4 },
			},
			{
				name     = "Trail Examplee",
				position = { 0, 0, .0125 },
				rotation = { 0, 0, 0 },
				scale 	= { 1, 1, 1 },

				particleEmitter = {
					particleType = "RIBBON",        -- enum EMITTERTYPE -- PARTICLE, RIBBON, PULSE
					distancePerParticle = .2,       -- decimal
					minSecondsPerParticle = 0,     -- decimal
					ejectionVelocity = 2,             -- decimal
					ejectionVelocityAwayFromEmitter = false, -- bool
					randomRadius = 0,                 -- decimal
					randomScaleMinFraction = 1,       -- decimal
					startDisabled = false,            -- bool
					stateToggleTrigger = "None",      -- enum EMITTERSTATETRIGGER
					colourStart = {1,1,1},            -- decimals
					colourEnd   = {0,0,0},            -- decimals
					opacity     = .5,                  -- decimal
					scaleStart  = scaleConst/8,                  -- decimal
					scaleEnd    = scaleConst,                  -- decimal
					lifetime    = .1,                  -- decimal
				},
				
			},
		}
	end
	return prefab_part
end

function prefab.weapon_info.quartz.core.P()
	weapon_info = {
		prefab.weapon_info.laser.D(2)
	}
	return weapon_info
end
function prefab.ship.quartz.core.P(scaleConst, isGhost, ghostIndex, ghostMat)
	if(ghostIndex==nil) then ghostIndex=0 end
	if(ghostMat==nil) then ghostMat="build" end
	if(ghostIndex < 0) then return {}; end
	if(not isGhost and ghostIndex < 0) then return {}; end
	prefab_part = {
		name = "Quartz-Core-P",
		position = {0,0,0},
		rotation = {0,0,0},
		mesh = "329-0-Quartz/Quartz",
		materials = { "329_MT_arc_teamGlow", "329_MT_arc_teamColour", "329_MT_arc_hull" },

		scale = {.1/scaleConst,.1/scaleConst,.1/scaleConst},
		parts={
			-- prefab.weapon.laser.D(
			-- 	{ 0, 0, .825 },
			-- 	{ 0, 0, 0 },
			-- 	{ 1, 1, 1 },
			-- 	isGhost
			-- ),
			prefab.weapon.laser.D(
				{ -.2625, 0, .373 },
				{ 0, 0, 0 },
				{ 1, 1, 1 },
				isGhost
			),
			prefab.weapon.laser.D(
				{ .2625, 0, .373 },
				{ 0, 0, 0 },
				{ 1, 1, 1 },
				isGhost
			),

			prefab.ship.quartz.thruster(scaleConst, isGhost, ghostIndex),

			prefab.ship.quartz.core.P(.1, isGhost, ghostIndex-1, ghostMat),
	
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

function prefab.weapon_info.quartz.core.B()
	weapon_info = {
		prefab.weapon_info.cannon.D(2)
	}
	return weapon_info
end
function prefab.ship.quartz.core.B(scaleConst, isGhost, ghostIndex, ghostMat)
	if(ghostIndex==nil) then ghostIndex=0 end
	if(ghostMat==nil) then ghostMat="build" end
	if(ghostIndex < 0) then return {}; end
	if(not isGhost and ghostIndex < 0) then return {}; end
	prefab_part = {
		name = "Quartz-Core-P",
		position = {0,0,0},
		rotation = {0,0,0},
		mesh = "329-0-Quartz/Diamond",
		materials = { "329_MT_arc_teamGlow", "329_MT_arc_teamColour", "329_MT_arc_hull" },

		scale = {.1/scaleConst,.1/scaleConst,.1/scaleConst},
		parts={
			-- prefab.weapon.laser.D(
			-- 	{ 0, 0, .825*.1/scaleConst },
			-- 	{ 0, 0, 0 },
			-- 	{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
			-- 	isGhost
			-- ),
			prefab.weapon.cannon.D(
				{ -.1875, 0, .6816 },
				{ 0, 0, 0 },
				{ 1, 1, 1 },
				isGhost
			),
			prefab.weapon.cannon.D(
				{ .1875, 0, .6816 },
				{ 0, 0, 0 },
				{ 1, 1, 1 },
				isGhost
			),

			prefab.ship.quartz.thruster(scaleConst, isGhost, ghostIndex),

			prefab.ship.quartz.core.B(.1, isGhost, ghostIndex-1, ghostMat),
	
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

function prefab.weapon_info.quartz.core.G()
	weapon_info = {
		prefab.weapon_info.lightning.D(2)
	}
	return weapon_info
end
function prefab.ship.quartz.core.G(scaleConst, isGhost, ghostIndex, ghostMat)
	if(ghostIndex==nil) then ghostIndex=0 end
	if(ghostMat==nil) then ghostMat="build" end
	if(ghostIndex < 0) then return {}; end
	if(not isGhost and ghostIndex < 0) then return {}; end
	prefab_part = {
		name = "Quartz-Core-P",
		position = {0,0,0},
		rotation = {0,0,0},
		mesh = "329-0-Quartz/Petalite",
		materials = { "329_MT_arc_teamGlow", "329_MT_arc_hull_dark", "329_MT_arc_teamColour", "329_MT_arc_hull" },

		scale = {.1/scaleConst,.1/scaleConst,.1/scaleConst},
		parts={
			-- prefab.weapon.laser.D(
			-- 	{ 0, 0, .825*.1/scaleConst },
			-- 	{ 0, 0, 0 },
			-- 	{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
			-- 	isGhost
			-- ),
			prefab.weapon.lightning.D(
				{ 0, 0, .825 },
				{ 0, 0, 0 },
				{ 1, 1, 1 },
				isGhost
			),
			prefab.weapon.lightning.D(
				{ 0, 0, .825 },
				{ 0, 0, 0 },
				{ 1, 1, 1 },
				isGhost
			),

			prefab.ship.quartz.thruster(scaleConst, isGhost, ghostIndex),

			prefab.ship.quartz.core.G(.1, isGhost, ghostIndex-1, ghostMat),
	
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

function prefab.weapon_info.quartz.core.A()
	weapon_info = {
		prefab.weapon_info.railgun.D(2)
	}
	return weapon_info
end
function prefab.ship.quartz.core.A(scaleConst, isGhost, ghostIndex, ghostMat)
	if(ghostIndex==nil) then ghostIndex=0 end
	if(ghostMat==nil) then ghostMat="build" end
	if(ghostIndex < 0) then return {}; end
	if(not isGhost and ghostIndex < 0) then return {}; end
	prefab_part = {
		name = "Quartz-Core-P",
		position = {0,0,0},
		rotation = {0,0,0},
		mesh = "329-0-Quartz/Zircon",
		materials = { "329_MT_arc_teamGlow", "329_MT_arc_hull_dark", "329_MT_arc_teamColour", "329_MT_arc_hull" },

		scale = {.1/scaleConst,.1/scaleConst,.1/scaleConst},
		parts={
			-- prefab.weapon.laser.D(
			-- 	{ 0, 0, .825*.1/scaleConst },
			-- 	{ 0, 0, 0 },
			-- 	{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
			-- 	isGhost
			-- ),
			prefab.weapon.railgun.D(
				{ 0, 0, -.1 },
				{ 0, 0, 0 },
				{ 1, 1, 1 },
				isGhost
			),
			prefab.weapon.railgun.D(
				{ 0, 0, 0 },
				{ 0, 0, 0 },
				{ 1, 1, 1 },
				isGhost
			),

			prefab.ship.quartz.thruster(scaleConst, isGhost, ghostIndex),

			prefab.ship.quartz.core.A(.1, isGhost, ghostIndex-1, ghostMat),
	
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