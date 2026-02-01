scaleConst = 50;
return {

	-- 🟦 DEFINITIONS
	unitName                    = "329-gateway",
	unitDisplayName             = "Gateway",
	unitTooltip                 = "",
	unitBlurb                   = "Who said gates need to be planes?",
	unitBlurbExcludeFromTooltip = false,
	hotkey                      = "",
	picture                     = "329-gateway.png",

	controllable = false;	-- bool: Can this unit be given move orders with right click?
	unselectable = true;	-- Cannot be selected.
	untargetable = true;	-- Cannot be targeted.
	unhittable 	= true;  -- Will be ignored by any RAYCAST or CAST based aquisition types (as are used for bullets). Also cannot be hit by explosions or incidental weapon raycasts (lasers). But can still be hit by PureHit weapons.


	-- 📘 DATABANK ENTRY
	databankEntry               = {
		visibility                  = "HIDDEN", --VISIBLE (always available) / HIDDEN (never visible)/ DISCOVER (visible once required level)
		requiredLevelForVisible     = "",
		requiredLevelForDescription = "",
		tactical                    = "",
		description                 =	"What kind of sorcery is this?!",
		weaponInfo                  = {},
		relatedUnitIDs              = {}
	},

	-- BODY SETUP
	scale                       = scaleConst, 
	-- mainMesh                    = "329-Gateway/Gateway",
	-- materials                   = { "329_MT_arc_hull", "329_MT_arc_teamGlow", "329_MT_arc_teamColour", "329_MT_arc_hull_dark", },
	inEditor = true,
    autoColourElements = true,
    editorDontColour = false,
	colliderDimensions = {
		widthMultiplier  = .873,
		heightMultiplier = 1,
		lengthMultiplier = .873,
	},

	-- 🟦 UNIT ID, STRUCTURE COST, MACROTARGET STATE, TECH
	data                        = {
		typeID       = 3293000,
		factionID    = 329,
		macroType    = "AUTO",
		cost_matter  = 50, -- Platforms are not buildable, so it does not require a cost.
		cost_energy  = 0,
		cost_supply  = 0,
		cost_time    = 10,
		techRequired = 0
	},

	-- 🟦 PARTS
	parts = {
		{
			name = "Gateway Top",
			mesh = "329-Gateway/Gateway",
			materials = { "329_MT_arc_hull", "329_MT_arc_teamGlow", "329_MT_arc_teamColour", "329_MT_arc_hull_dark", },
			rotation = {0,0,0},
			position = {0,0,0},
			scale = {1,1,1},
			rotate = {
				timeStepSeconds = .01,             -- decimal
				degreeRotationPerSecond = { 0,.02,0 }, -- decimals (x,y,z)
			},
			piston = {
                localDistanceUp = .05,              -- decimal
                direction = "Up",                 -- enum PISTONDIRECTION: Up/Down/UpAndDown
                startProgressFraction = 0,        -- decimal 0-1
                duration = 100,                     -- decimal (seconds)
            },
			parts={
				{
					name = "Gateway Vortex",
					mesh = "329-Gateway/Swirl",
					materials = { "329_MT_arc_vortex" },
					rotation = {0,0,0},
					position = {0,0,0},
					scale = {1,1,1},
				},
				{
					name = "Gateway Vortex",
					mesh = "329-Gateway/Swirl-R",
					materials = { "329_MT_arc_vortex" },
					rotation = {0,0,0},
					position = {0,0,0},
					scale = {1,1,1},
				}
				
			}
		},
		prefab.part.rift(
			{ 0, 0, 0},
			{ 0, 0, 0 },
			{ 150*.1/scaleConst, 150*.1/scaleConst, 150*.1/scaleConst },
			15,
			false
		),
		{
			name = "Gateway Bot",
			mesh = "329-Gateway/Gateway",
			materials = { "329_MT_arc_hull", "329_MT_arc_teamGlow", "329_MT_arc_teamColour", "329_MT_arc_hull_dark", },
			rotation = {0,0,180},
			position = {0,0,0},
			scale = {1,1,1},
			rotate = {
				timeStepSeconds = .01,             -- decimal
				degreeRotationPerSecond = { 0,.02,0 }, -- decimals (x,y,z)
			},
			piston = {
                localDistanceUp = .05,              -- decimal
                direction = "Up",                 -- enum PISTONDIRECTION: Up/Down/UpAndDown
                startProgressFraction = 0,        -- decimal 0-1
                duration = 100,                     -- decimal (seconds)
            },
			parts={
				{
					name = "Gateway Vortex",
					mesh = "329-Gateway/Swirl",
					materials = { "329_MT_arc_vortex" },
					rotation = {0,0,0},
					position = {0,0,0},
					scale = {1,1,1},
				},
				{
					name = "Gateway Vortex",
					mesh = "329-Gateway/Swirl-R",
					materials = { "329_MT_arc_vortex" },
					rotation = {0,0,0},
					position = {0,0,0},
					scale = {1,1,1},
				}
				
			}
		},
	},

	-- 🟦 HEALTH & ARMOR
	health = {
		unitClass = "TITAN",       -- UNITCLASS: NONE, MISSILE, DRONE, LIGHT, MEDIUM, HEAVY, CAPITAL, TITAN
		health = 20000000,
		health_regen_per_second = 2000,
		max_regen_frac = 0,

		armour = 10,
		vulnerability_max = 0,
		shredMultiplier = 0,

		explosionSFX = 0,
		explosionSFXIntensity = 10,		-- Platforms blowing up is very important.

		heatResistancePercentage = healthStats.proportionRegenMax,
		shredResistancePercentage = 0,
		aegisMaximum = 0,
		isResourceMatter = false,
		isResourceEnergy = false,
		isUncapturable = false,
		ignoreImpulse = false,

		targetingPriorityMultiplier = 1.0,
		untargetableTime = 0,

		doesCloaking = false,
		isCloaked = false,
		cloakFrac = 0,
		cloakTime = 1.0,
		decloakDistance = 0,

		phaseBlockFraction = 0,
		
		lifetime = 0,
		explodeOnTimeout = false,

		explosionType = "EXPLOSION",          	-- EXPLOSION \ EXPLOSION_LOWPOLY \ SHOCKWAVE \ FLASH \ FLAK \ SPARKS (railgun bullet) \ FISHEXPLOSION \ WARP \ NONE \ VOLTJUMP
		explosionVolatility = 1.0,
		explosionSizeOveride = 10,			-- Give it a hearty platform saildrive critical BOOM!!!
		flashSizeOverride = 0,
		forceShockwave = false,
		preventShockwave = false,
		randomiseInAllDirections = false,
		deathUnitSpawnDoNotRandomiseRotation = false,
		deathUnitSpawnTypeID = -1,
		invulnerable = false,
		unkillable = false,
		death_countdown = 0,
		mass = 0,
		densityMult = 1.0,
		tonnage = 0,
		ignoreInstaDeath = false,
		alertPlayerOnDeath = false,
	},

	-- 🟦 COMMAND / Platform
	isCommand = false, -- Allows Platform AIs to be run on this structure.

	-- 🟦 STRUCTURE
	-- isStructure = true,
	-- structure = {
	-- 	type = "NONE", --NONE, ECONOMY, PRODUCTION, DEFENCE, OFFENCE, UTILITY, EXTENDER
	-- 	--rectangle = {5,5}, 		-- optional, float2: xz dimensions of the influence, facing ^
	-- 	--ring = {0, 2.5},			-- optional, float2: Inner and outer ring radius. Inner > 0 lets you make donuts. If structure footprint is odd, add +0.5 for a cleaner circle.
	-- 	matrixDimensions = {3,3},
	-- 	matrix = {				-- optional, int bool: matrix for detailed footprints. 0 = empty space, 1 = occupied space
	-- 		0, 1, 0,
	-- 		1, 1, 1,
	-- 		0, 1, 0,
	-- 	 },
	-- },

	-- 🟨 RESOURCE GENERATOR AND STORAGE CONFIGURATION
	isGenerator        = false,
	resourceGeneration = {
		matter = 2.5, 	-- float: Matter generation per second
		energy = 0, 	-- float: Energy generation per second
		phase  = 0 	-- float: Phase generation per second
	},

	-- 🟪 STATUS EFFECT EMITTER (AEGIS SHIELD)
	isStatusEffecter = false,
	isAegisEmitter = false,
	-- aegisEmitter = {
	-- 	secondsPerPulse = 5, 	-- float: strength will be applied to allies in range as Aegis Shielding.
	-- 	radius          = 10, 	-- float: Area of effect. The center of a unit must be within this range to be affected.
	-- 	strength        = 500 	-- float: Aegis strength applied per pulse.
	-- }
}
