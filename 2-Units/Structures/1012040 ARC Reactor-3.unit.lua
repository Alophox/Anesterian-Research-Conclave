scaleConst = 2.8;
return {

	-- 🟦 DEFINITIONS
	unitName                    = "329_MT_arc_reactor-3",
	unitDisplayName             = "Zero-Point Inductor",
	unitTooltip                 = "",
	unitBlurb                   = "What an awful shape, who designed this?!",
	unitBlurbExcludeFromTooltip = false,
	hotkey                      = "r",
	picture                     = "329_MT_arc_reactor-3.png",

	-- 📘 DATABANK ENTRY
	databankEntry               = {
		visibility                  = "VISIBLE", --VISIBLE (always available) / HIDDEN (never visible)/ DISCOVER (visible once required level)
		requiredLevelForVisible     = "",
		requiredLevelForDescription = "",
		tactical                    = 	"<color=yellow>Tactical:</color>\n"..
										" - Efficient Energy Generation\n"..
										" - Poor space usage\n"
										,
		description                 = 	"Utilizing their Breach technology, the Zero-Point Inductor invests energy into a singular point to produce more energy. The laws of reality temporarily break down at that point, expanding the singularity into a moderately volatile vacuum zone that could then have energy extracted from.\n"..
										"\n"..
										"While the name implies certain methods of collection, attempts to engineer similar reactors have left rival groups with fancy, but useless, examples of failure.\n"..
										"\n"..
										"The first iterations only had one extractor- though somebody had the bright idea of adding another, as 2 times 0 is still 0, and therefore more efficient as you only have one 0 with this setup!\n"..
										"",
		weaponInfo                  = {},
		relatedUnitIDs              = {}
	},

	-- BODY SETUP
	scale                       = scaleConst, -- 0.035714
	mainMesh                    = "Reactor/Reactor-3_2",
	materials                   = { "329_MT_arc_hull", "329_MT_arc_teamGlow", "329_MT_arc_teamColour", "329_MT_arc_hull_dark" },
	inEditor = true,
    autoColourElements = true,
    editorDontColour = false,
	colliderDimensions = {
		widthMultiplier  = 1,
		heightMultiplier = .532,
		lengthMultiplier = 1,
	},

	-- 🟦 UNIT ID, STRUCTURE COST, MACROTARGET STATE, TECH
	data                        = {
		typeID       = 3292040,
		factionID    = 329,
		macroType    = "AUTO",
		cost_matter  = 30, -- Platforms are not buildable, so it does not require a cost.
		cost_energy  = 45,
		cost_supply  = 3,
		cost_time    = 15,
		techRequired = 0
	},

	-- 🟦 PARTS
	parts = {
		{
			name = "Aegis spawner",
			autoModule = {
				moduleTypeID = 3297100,
				reportKillsToParent = false,
				doDamageToEntityOnDeath = true,
				damageToEntityOnDeath = {
					isNondamaging = true, instances = 1, damage = 0.00001, piercing = -9999999999,
					shred = 0, heat = 0, vulnerability = 0, decloak = 0,
					targetingPriorityMultiplier = 0, impulseForce = 0,
				},
			},
		},
		{
			name     = "Aegis",
			mesh    = "Reactor/Reactor-3_2",
			materials = { "329_MT_arc_0_aegis", "329_MT_arc_0_aegis", "329_MT_arc_0_aegis", "329_MT_arc_0_aegis" },
			pos       = { 0, 0, 0 },        --Relative local position of this object.
			rotation  = { 0, 0, 0 },        	--Eular Angles XYZ, will apply rotation ZXY. Relative local rotation of this object.
			scale 	= { 1, 1, 1 },			--The nonuniform scale of the part, relative to it's parent's scale.
			aegisVisual = true,
		},
		{
			name     = "Build",
			mesh    = "Reactor/Reactor-3_2",
			materials = { "329_MT_arc_0_build", "329_MT_arc_0_build", "329_MT_arc_0_build", "329_MT_arc_0_build" },
			pos       = { 0, 0, 0 },        --Relative local position of this object.
			rotation  = { 0, 0, 0 },        	--Eular Angles XYZ, will apply rotation ZXY. Relative local rotation of this object.
			scale 	= { 1, 1, 1 },			--The nonuniform scale of the part, relative to it's parent's scale.
			destroyOnConstructionComplete = true,
		},
		{
			name     = "Build",
			mesh    = "Reactor/Reactor-3_2",
			materials = { "329_MT_arc_1_build", "329_MT_arc_1_build", "329_MT_arc_1_build", "329_MT_arc_1_build" },
			pos       = { 0, 0, 0 },        --Relative local position of this object.
			rotation  = { 0, 0, 0 },        	--Eular Angles XYZ, will apply rotation ZXY. Relative local rotation of this object.
			scale 	= { 1, 1, 1 },			--The nonuniform scale of the part, relative to it's parent's scale.
			destroyOnConstructionComplete = true,
		},
		{
			name     = "Build",
			mesh    = "Reactor/Reactor-3_2",
			materials = { "329_MT_arc_2_build", "329_MT_arc_2_build", "329_MT_arc_2_build", "329_MT_arc_2_build" },
			pos       = { 0, 0, 0 },        --Relative local position of this object.
			rotation  = { 0, 0, 0 },        	--Eular Angles XYZ, will apply rotation ZXY. Relative local rotation of this object.
			scale 	= { 1, 1, 1 },			--The nonuniform scale of the part, relative to it's parent's scale.
			destroyOnConstructionComplete = true,
		},
		prefab.part.rift(
			{ 0, 0, 0},
			{ 0, 0, 0 },
			{ 6*.1/scaleConst, 6*.1/scaleConst, 6*.1/scaleConst },
			.6,
			false
		),
		{
			name = "Particle Tube",
			position = {0,0,0},
			rotation = {0,0,0},
			rotate = {
				timeStepSeconds = .01,             -- decimal
				degreeRotationPerSecond = { 1,0,0 }, -- decimals (x,y,z)
			},
			parts = {
				{
					name     = "Particles",
					position = { 0, .001, 0 },
					rotation = { 0, 90, 0 },
					scale 	= { 1, 1, 1 },
					
					particleEmitter = {
						particleType = "PARTICLE",        -- enum EMITTERTYPE -- PARTICLE, RIBBON, PULSE
						distancePerParticle = .00001,       -- decimal
						minSecondsPerParticle = 9999,     -- decimal
						ejectionVelocity = .2,             -- decimal
						ejectionVelocityAwayFromEmitter = false, -- bool
						randomRadius = 0.1,                 -- decimal
						randomScaleMinFraction = 1,       -- decimal
						startDisabled = false,            -- bool
						stateToggleTrigger = "None",      -- enum EMITTERSTATETRIGGER
						colourStart = {1,1,1},            -- decimals
						colourEnd   = {1,1,1},            -- decimals
						opacity     = .1,                  -- decimal
						scaleStart  = .15,                  -- decimal
						scaleEnd    = 0,                  -- decimal
						lifetime    = 3.5,                  -- decimal
					},
					
				},
				{
					name     = "Particles",
					position = { 0, .001, 0 },
					rotation = { 0, -90, 0 },
					scale 	= { 1, 1, 1 },
					
					particleEmitter = {
						particleType = "PARTICLE",        -- enum EMITTERTYPE -- PARTICLE, RIBBON, PULSE
						distancePerParticle = .00001,       -- decimal
						minSecondsPerParticle = 9999,     -- decimal
						ejectionVelocity = .2,             -- decimal
						ejectionVelocityAwayFromEmitter = false, -- bool
						randomRadius = 0.1,                 -- decimal
						randomScaleMinFraction = 1,       -- decimal
						startDisabled = false,            -- bool
						stateToggleTrigger = "None",      -- enum EMITTERSTATETRIGGER
						colourStart = {1,1,1},            -- decimals
						colourEnd   = {1,1,1},            -- decimals
						opacity     = .1,                  -- decimal
						scaleStart  = .15,                  -- decimal
						scaleEnd    = 0,                  -- decimal
						lifetime    = 3.5,                  -- decimal
					},
					
				},
			}
		}
		
	},

	-- 🟦 HEALTH & ARMOR
	health = {
		unitClass = "HEAVY",       -- UNITCLASS: NONE, MISSILE, DRONE, LIGHT, MEDIUM, HEAVY, CAPITAL, TITAN
		health = 3000,
		health_regen_per_second = healthStats.regen.H,
		max_regen_frac = 0,

		health = (1 - healthStats.proportionRegenMax) * 2000,
		health_regen_per_second = healthStats.regen.M,
		max_regen_frac = 0,
		aegis_regen_per_second = healthStats.aegisRegen.M * healthStats.structAegisRegenMult,
		aegisMaximum = healthStats.proportionRegenMax * 2000,

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
		explosionSizeOveride = 0,			-- Give it a hearty platform saildrive critical BOOM!!!
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
	isStructure = true,
	structure = {
		type = "ECONOMY", --NONE, ECONOMY, PRODUCTION, DEFENCE, OFFENCE, UTILITY, EXTENDER
		--rectangle = {5,5}, 		-- optional, float2: xz dimensions of the influence, facing ^
		--ring = {0, 2.5},			-- optional, float2: Inner and outer ring radius. Inner > 0 lets you make donuts. If structure footprint is odd, add +0.5 for a cleaner circle.
		matrixDimensions = {3,3},
		matrix = {				-- optional, int bool: matrix for detailed footprints. 0 = empty space, 1 = occupied space
			1, 0, 1,
			1, 1, 1,
			1, 0, 1,
		 },
	},

	-- 🟨 RESOURCE GENERATOR AND STORAGE CONFIGURATION
	isGenerator        = true,
	resourceGeneration = {
		matter = 0, 	-- float: Matter generation per second
		energy = 1.5, 	-- float: Energy generation per second
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
