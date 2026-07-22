scaleConst = 7.7596;
return {

	-- 🟦 DEFINITIONS
	unitName                    = "329-platform",
	unitDisplayName             = "Starhold",
	unitTooltip                 = "",
	unitBlurb                   = "Super Command Platform",
	unitBlurbExcludeFromTooltip = false,
	hotkey                      = "",
	generatePicture = true;
	-- picture                     = "329-platform-l.png",

	-- 📘 DATABANK ENTRY
	databankEntry               = {
		visibility                  = "VISIBLE", --VISIBLE (always available) / HIDDEN (never visible)/ DISCOVER (visible once required level)
		requiredLevelForVisible     = "",
		requiredLevelForDescription = "",
		tactical                    = "<color=yellow>Tactical:</color>\n"..
										" - Produces Matter, Energy, and Logistics\n"..
										" - Breach Communications Suite\n"..
										" - Breach Core\n"..
										" - <color=#80ffff>100 Aegis/s</color>\n"..
										"",
		description                 =	"Powered by a Breach Core, these multipurpose structures are utilized in highly dangerous Research and Reconnaissance missions.\n"..
										"\n"..
										"Following the eventual colonization of 'nearby' star systems, it was determined that a central, fortified communications station would be required in each system. This turned into the Starhold- a stronghold that would orbit stars, providing a heavy duty node in the now interestellar constellation of stations.\n"..
										"\n"..
										"The first Breach Cores in space were first installed on one of these, as only they had the auxilliary power required to contain a Breach. The first attempt, unfortunately, resulted in the complete destruction of the Starhold- but the Anesterian Research Conclave learned from their mistakes, and revisited their designs- leading to the refinement of the technology to such a degree it could be considered 'safe' by most metrics.\n"..
										"\n"..
										"Here in the Spance, the Starholds have their Warp Drive replaced with a SAIL drive to accompany their Breach Interdiction and Breach Communications Suite. Breach Interdiction destabalizes space around it, preventing anything nearby from safely exiting the zone- and tripping failsafes of those passing by. Unfortunately the technlogy is still in its infancy, and much less efficient than what other Interdictors are capable of. The Breach Communication Suite, however, enables 0 lag communication between other BCSs, by 'entangling' Breaches to send data.\n"..
										"\n"..
										"The Breach Nodes surrounding the Starhold enable it to punch through the strange distortions present within the Spance, providing auxiliary power in addition to strengthened communications.\n"..
										"\n",
		weaponInfo                  = functions.combineWeaponInfo({
			{prefab.weapon_info.hangar.quartz.P(4)},
			{prefab.weapon_info.special.sensor_gravitic(1)},
			prefab.weapon_info.platform.L.A(8),
			prefab.weapon_info.platform.L.B(8),
			prefab.weapon_info.platform.L.C1(4),
			prefab.weapon_info.platform.L.C2(4),
		}),
		relatedUnitIDs              = {}
	},

	-- BODY SETUP
	scale                       = scaleConst,
	mainMesh                    = "329-Core/Core-Large",
	materials                   = { "329_MT_arc_hull", "329_MT_arc_teamGlow", "329_MT_arc_teamColour", "329_MT_arc_hull_dark" },
	inEditor = true,
    autoColourElements = true,
    editorDontColour = false,
	colliderDimensions = {
		widthMultiplier  = 1,
		heightMultiplier = .263,
		lengthMultiplier = 1,
	},

	-- 🟦 UNIT ID, STRUCTURE COST, MACROTARGET STATE, TECH
	data                        = {
		typeID       = 3292002,
		factionID    = 329,
		macroType    = "AUTO",
		cost_matter  = 0, -- Platforms are not buildable, so it does not require a cost.
		cost_energy  = 0,
		cost_supply  = 0,
		cost_time    = 0,
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
					isNondamaging = true, instances = 1, damage = 0, piercing = -9999999999,
					shred = 0, heat = 0, vulnerability = 0, decloak = 0,
					targetingPriorityMultiplier = 0, impulseForce = 0,
				},
			},
		},
		{
			name     = "Aegis",
			mesh    = "329-Core/Core-Large",
			materials = { "329_MT_arc_0_aegis_teamColour", "329_MT_arc_0_aegis_teamColour", "329_MT_arc_0_aegis_teamColour", "329_MT_arc_0_aegis_teamColour" },
			pos       = { 0, 0, 0 },        --Relative local position of this object.
			rotation  = { 0, 0, 0 },        	--Eular Angles XYZ, will apply rotation ZXY. Relative local rotation of this object.
			scale 	= { 1, 1, 1 },			--The nonuniform scale of the part, relative to it's parent's scale.
			aegisVisual = true,
		},
		-- {
		-- 	name     = "Build",
		-- 	mesh    = "329-Core/Core-Large",
		-- 	materials = { "329_MT_arc_1_build", "329_MT_arc_1_build", "329_MT_arc_1_build", "329_MT_arc_1_build" },
		-- 	pos       = { 0, 0, 0 },        --Relative local position of this object.
		-- 	rotation  = { 0, 0, 0 },        	--Eular Angles XYZ, will apply rotation ZXY. Relative local rotation of this object.
		-- 	scale 	= { 1, 1, 1 },			--The nonuniform scale of the part, relative to it's parent's scale.
		-- 	destroyOnConstructionComplete = true,
		-- },
		-- {
		-- 	name     = "Build",
		-- 	mesh    = "329-Core/Core-Large",
		-- 	materials = { "329_MT_arc_2_build", "329_MT_arc_2_build", "329_MT_arc_2_build", "329_MT_arc_2_build" },
		-- 	pos       = { 0, 0, 0 },        --Relative local position of this object.
		-- 	rotation  = { 0, 0, 0 },        	--Eular Angles XYZ, will apply rotation ZXY. Relative local rotation of this object.
		-- 	scale 	= { 1, 1, 1 },			--The nonuniform scale of the part, relative to it's parent's scale.
		-- 	destroyOnConstructionComplete = true,
		-- },
		prefab.weapon.special.sensor_gravitic(
			{0, 0, 0},
			{ 0, 0, 0 },
			{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
			false
		),
		{
			name      = "Drone Bay N",
			position  = { 0, 8*.1/scaleConst, .75*.1/scaleConst },
			rotation  = { -90, 00, 00 },
			scale 	= { .1/scaleConst, .1/scaleConst, .1/scaleConst },

			weapon    = {
				weaponID = 3295601, --int: The weaponData id to be used for this weapon.
				turnSpeed = 0, 	--float: Degrees per second.
				turnMode = "Linear", --string enum: Linear / Acceleration
				turnInstant = false, --bool: Ignore turn speed, snap to target. (Beam Spire, point defence)
				mountAngles = { -- Weapon's firing angles in degrees. Won't aquire targets outside this field of view.
					left = 180,
					right = 180,
					up = 90,
					down = 90
				},
			},
		},
		{
			name      = "Drone Bay E",
			position  = { .75*.1/scaleConst, 8*.1/scaleConst, 0 },
			rotation  = { -90, 90, 00 },
			scale 	= { .1/scaleConst, .1/scaleConst, .1/scaleConst },

			weapon    = {
				weaponID = 3295601, --int: The weaponData id to be used for this weapon.
				turnSpeed = 0, 	--float: Degrees per second.
				turnMode = "Linear", --string enum: Linear / Acceleration
				turnInstant = false, --bool: Ignore turn speed, snap to target. (Beam Spire, point defence)
				mountAngles = { -- Weapon's firing angles in degrees. Won't aquire targets outside this field of view.
					left = 180,
					right = 180,
					up = 90,
					down = 90
				},
			},
		},
		{
			name      = "Drone Bay S",
			position  = { 0, 8*.1/scaleConst, -.75*.1/scaleConst },
			rotation  = { -90, 180, 00 },
			scale 	= { .1/scaleConst, .1/scaleConst, .1/scaleConst },

			weapon    = {
				weaponID = 3295601, --int: The weaponData id to be used for this weapon.
				turnSpeed = 0, 	--float: Degrees per second.
				turnMode = "Linear", --string enum: Linear / Acceleration
				turnInstant = false, --bool: Ignore turn speed, snap to target. (Beam Spire, point defence)
				mountAngles = { -- Weapon's firing angles in degrees. Won't aquire targets outside this field of view.
					left = 180,
					right = 180,
					up = 90,
					down = 90
				},
			},
		},
		{
			name      = "Drone Bay W",
			position  = { -.75*.1/scaleConst, 8*.1/scaleConst, 0 },
			rotation  = { -90, 270, 00 },
			scale 	= { .1/scaleConst, .1/scaleConst, .1/scaleConst },

			weapon    = {
				weaponID = 3295601, --int: The weaponData id to be used for this weapon.
				turnSpeed = 0, 	--float: Degrees per second.
				turnMode = "Linear", --string enum: Linear / Acceleration
				turnInstant = false, --bool: Ignore turn speed, snap to target. (Beam Spire, point defence)
				mountAngles = { -- Weapon's firing angles in degrees. Won't aquire targets outside this field of view.
					left = 180,
					right = 180,
					up = 90,
					down = 90
				},
			},
		},

		prefab.part.platform.L.A(scaleConst, 1, false),
		prefab.part.platform.L.A(scaleConst, 3, false),
		prefab.part.platform.L.A(scaleConst, 5, false),
		prefab.part.platform.L.A(scaleConst, 7, false),
		prefab.part.platform.L.A(scaleConst, 9, false),
		prefab.part.platform.L.A(scaleConst, 11, false),
		prefab.part.platform.L.A(scaleConst, 13, false),
		prefab.part.platform.L.A(scaleConst, 15, false),

		prefab.part.platform.L.B(scaleConst, 0, false),
		prefab.part.platform.L.B(scaleConst, 2, false),
		prefab.part.platform.L.B(scaleConst, 4, false),
		prefab.part.platform.L.B(scaleConst, 6, false),
		prefab.part.platform.L.B(scaleConst, 8, false),
		prefab.part.platform.L.B(scaleConst, 10, false),
		prefab.part.platform.L.B(scaleConst, 12, false),
		prefab.part.platform.L.B(scaleConst, 14, false),

		prefab.part.platform.L.C1(scaleConst, 0, false),
		prefab.part.platform.L.C1(scaleConst, 4, false),
		prefab.part.platform.L.C1(scaleConst, 8, false),
		prefab.part.platform.L.C1(scaleConst, 12, false),
		
		prefab.part.platform.L.C2(scaleConst, 2, false),
		prefab.part.platform.L.C2(scaleConst, 6, false),
		prefab.part.platform.L.C2(scaleConst, 10, false),
		prefab.part.platform.L.C2(scaleConst, 14, false),




		prefab.part.platform.L.A(scaleConst, 1,true, 0, "aegis_teamColour"),
		prefab.part.platform.L.A(scaleConst, 3,true, 0, "aegis_teamColour"),
		prefab.part.platform.L.A(scaleConst, 5,true, 0, "aegis_teamColour"),
		prefab.part.platform.L.A(scaleConst, 7,true, 0, "aegis_teamColour"),
		prefab.part.platform.L.A(scaleConst, 9,true, 0, "aegis_teamColour"),
		prefab.part.platform.L.A(scaleConst, 11,true, 0, "aegis_teamColour"),
		prefab.part.platform.L.A(scaleConst, 13,true, 0, "aegis_teamColour"),
		prefab.part.platform.L.A(scaleConst, 15,true, 0, "aegis_teamColour"),

		prefab.part.platform.L.B(scaleConst, 0,true, 0, "aegis_teamColour"),
		prefab.part.platform.L.B(scaleConst, 2,true, 0, "aegis_teamColour"),
		prefab.part.platform.L.B(scaleConst, 4,true, 0, "aegis_teamColour"),
		prefab.part.platform.L.B(scaleConst, 6,true, 0, "aegis_teamColour"),
		prefab.part.platform.L.B(scaleConst, 8,true, 0, "aegis_teamColour"),
		prefab.part.platform.L.B(scaleConst, 10,true, 0, "aegis_teamColour"),
		prefab.part.platform.L.B(scaleConst, 12,true, 0, "aegis_teamColour"),
		prefab.part.platform.L.B(scaleConst, 14,true, 0, "aegis_teamColour"),

		prefab.part.platform.L.C1(scaleConst, 0,true, 0, "aegis_teamColour"),
		prefab.part.platform.L.C1(scaleConst, 4,true, 0, "aegis_teamColour"),
		prefab.part.platform.L.C1(scaleConst, 8,true, 0, "aegis_teamColour"),
		prefab.part.platform.L.C1(scaleConst, 12,true, 0, "aegis_teamColour"),
		
		prefab.part.platform.L.C2(scaleConst, 2,true, 0, "aegis_teamColour"),
		prefab.part.platform.L.C2(scaleConst, 6,true, 0, "aegis_teamColour"),
		prefab.part.platform.L.C2(scaleConst, 10,true, 0, "aegis_teamColour"),
		prefab.part.platform.L.C2(scaleConst, 14,true, 0, "aegis_teamColour"),

	},

	-- 🟦 HEALTH & ARMOR
	health = {
		unitClass = "TITAN",       -- UNITCLASS: NONE, MISSILE, DRONE, LIGHT, MEDIUM, HEAVY, CAPITAL, TITAN
		health = functions.floor((1 - healthStats.proportionRegenMax) * 50000),
		health_regen_per_second = 50,
		max_regen_frac = 0,
		aegis_regen_per_second = 100 * healthStats.structAegisRegenMult,
		aegisMaximum = functions.ceil(healthStats.proportionRegenMax * 50000),

		armour = 40,
		vulnerability_max = 0,
		shredMultiplier = 0,

		explosionSFX = 0,
		explosionSFXIntensity = 5,		-- Platforms blowing up is very important.

		heatResistancePercentage = healthStats.proportionRegenMax,
		shredResistancePercentage = 0,
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
		explosionSizeOveride = 15,
        flashSizeOverride = 14,
		forceShockwave = false,
		preventShockwave = false,
		randomiseInAllDirections = false,
		deathUnitSpawnDoNotRandomiseRotation = false,
		deathExplosionFriendlyFire = true,
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

	-- /// CLOAKING ///
    isCloaking = false, -- bool - enables stealth
    isCloakDetector = true, -- bool - enables detection of cloaked units
    cloak = {
        startingCloakFrac = 0, -- float - determines how soon this unit can cloak after spawning. 0 means wait the full cloaking duration, 1 means cloak immediately
        cloakTime = 0, -- float - how many seconds it takes for this unit to cloak after being decloaked
        decloakDistance = 0, -- float - this unit will decloak if enemy units are within this distance (or maybe its distance to target? unsure)
    },
    cloakDetector = {
        range = weaponStats.sensor.baseRange * weaponStats.rangeMult.M, -- float - distance at which cloaked enemy units will be revealed
        revealDuration = 0, -- float - minimum amount of time that revealed units are forced to wait before they can cloak again (i think)
    },

	-- 🟦 COMMAND / Platform
	isCommand = true, -- Allows Platform AIs to be run on this structure.
	commandType = "CENTRAL",

	-- 🟦 STRUCTURE
	isStructure = true,
	structure = {
		type = "NONE", --NONE, ECONOMY, PRODUCTION, DEFENCE, OFFENCE, UTILITY, EXTENDER
		--rectangle = {5,5}, 		-- optional, float2: xz dimensions of the influence, facing ^
		--ring = {0, 2.5},			-- optional, float2: Inner and outer ring radius. Inner > 0 lets you make donuts. If structure footprint is odd, add +0.5 for a cleaner circle.
		matrixDimensions = {8,8},
		matrix = {				-- optional, int bool: matrix for detailed footprints. 0 = empty space, 1 = occupied space
			0, 0, 1, 1, 1, 1, 0, 0,
			0, 1, 1, 1, 1, 1, 1, 0,
			1, 1, 1, 1, 1, 1, 1, 1,
			1, 1, 1, 1, 1, 1, 1, 1,
			1, 1, 1, 1, 1, 1, 1, 1,
			1, 1, 1, 1, 1, 1, 1, 1,
			0, 1, 1, 1, 1, 1, 1, 0,
			0, 0, 1, 1, 1, 1, 0, 0,
		 },
	},

	isInfluencer = true,
	influence = {
		strength = {20, 1},
		--rectangle = {5,5}, 		-- optional, float2: xz dimensions of the influence, facing ^
		ring = {0,17},			-- optional, float2: Inner and outer ring radius. Inner > 0 lets you make donuts. If structure footprint is odd, add +0.5 for a cleaner circle.
		--matrixDimensions = {5,5},
		--matrix = {				-- optional, int bool: matrix for detailed footprints. 0 = empty space, 1 = occupied space
		--	0, 1, 1, 1, 0,
		--	1, 1, 1, 1, 1,
		--	1, 1, 1, 1, 1,
		--	1, 1, 1, 1, 1,
		--	0, 1, 1, 1, 0,
		-- },
	},

	-- 🟨 RESOURCE GENERATOR AND STORAGE CONFIGURATION
	isGenerator        = true,
	resourceGeneration = {
		matter = 5, 	-- float: Matter generation per second
		energy = 7, 	-- float: Energy generation per second
		phase  = 0 	-- float: Phase generation per second
	},

	isCapacitor        = true,
	resourceCapacity           = {
		logistics = 250, 	-- int: Logistics
		matter    = 750, 	-- int: Max stored matter
		energy    = 1000, 	-- int: Max stored energy
		phase     = 0 		-- int: Max stored phase energy
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
