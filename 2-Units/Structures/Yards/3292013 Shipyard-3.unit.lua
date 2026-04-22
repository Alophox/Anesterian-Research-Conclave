shipConst = {
	class = "C",
}
return {

	-- 🟦 DEFINITIONS
	unitName                    = "329-shipyard-3",              	-- Internal name for debugging and errors.
	unitDisplayName             = "Heavy Yard",                    	-- Actual display name of the unit in the Databank, HUD, etc.
	unitTooltip                 = "", 						   	-- Shown when moused over in the HUD.
	unitBlurb                   = "Produces heavy units.", 		-- Shown just below the unit name in tooltips and databank.
	unitBlurbExcludeFromTooltip = false,                           	-- The blurb is automatically added to tooltips, but if you don't want that (looks weird and redundant for most structures) set this.
	hotkey                      = "r",                             	-- For buildbar. The hotkey for this unit.
	picture                     = "329-shipyard-3.png",            -- The name of the image file in this folder to be used for this unit.

	-- 📘 DATABANK ENTRY
	databankEntry               = {
		visibility                  = "VISIBLE", --VISIBLE (always available) / HIDDEN (never visible)/ DISCOVER (visible once required level)
		requiredLevelForVisible     = "",
		requiredLevelForDescription = "",
		tactical                    = ""..
										" - <color=#80ffff>"..(healthStats.aegisRegen[shipConst.class]*healthStats.structAegisRegenMult).." Aegis/s</color>\n"..
										"", --Added to the top of all tooltips and Databank descriptions. Used to quickly explain what a unit is good at doing. Strong against, decent against, weak against.
		description                 =
		"Every need covered by a single yard.",
		weaponInfo                  = { --Tells the databank which weaponDatas to grab and display for this unit. Not automatic, you have to do this.
			
		},
		relatedUnitIDs              = {} --TypeID of other units in the family tree
	},

	-- BODY SETUP
	scale                       = 4.80811,       -- 0.020798
	mainMesh                    = "329-Shipyard/Shipyard-3",   -- Visual body of this unit. Requires materials to be visible. FileName/ObjectName, looks for FileName.glb and then ObjectName from within that.
	
	--NOTICE, WORKING WITH MATERIALS AND MESHS:
	--When making a mesh in Blender, you can assign materials to different surfaces. The number of materials used create 'material slots' for the mesh.
	--ATS cannot use the Blender materials, and so we must define them in a .materials.lua file within the same mod folder.
	--Inorder for ATS to know which material goes to which material slot on a mesh, we must define the ordering.
	--Assign materials here in the same order as they are defined on the object in your Blender file. 
	--(Can only get materials from .materials.lua files in this mod folder.)
	materials                   = { "329_MT_arc_hull", "329_MT_arc_teamGlow", "329_MT_arc_hull_dark", "329_MT_arc_teamColour" },

	-- Percieved dimensions of the unit. Multiplied against scale. Controls how big the unit is percieved by other units. 
	-- Units cannot actually "see" anything, so we need to mathematically define how big the unit is for standoff behaviour among other things.
	-- CONTROLS: standoff, targeting, repulsion distance.
	-- Better to have the dimensions too small, than too large. Otherwise units will struggle to get in actual firing range of the target's colliders.
	inEditor = true,
    autoColourElements = true,
    editorDontColour = false,
	colliderDimensions = {
		widthMultiplier  = .59, --Multiplied by scale to determine the percieved width of the unit. Long units (Vaalkorei) have this at about 0.5~0.6, aka we're only half as wide as we are long.
		heightMultiplier = .415, --Multiplied by scale to determine the percieved height of the unit, flat units (Kontaalen) have this at about 0.6, aka we're shorter than we are long.
		lengthMultiplier = 1, --Multiplied by scale to determine the percieved length of the unit. wide units (Soul Warden Fore section) have this at about 0.5, aka we're only half as long as we are wide.
	},

	-- 🟦 UNIT ID, STRUCTURE COST, MACROTARGET STATE, TECH
	data                        = {
		typeID       = 3292013, 	--!!! IMPORTANT !!! The unique id of this unit. Must be higher than 99999 (ATS reserved). Used by maps and many things. If you change this any maps made with it won't be able to find the unit and will just spawn nothing.
		factionID    = 329, 	--The faction this unit is associated with in the Databank.
		macroType    = "AUTO", 	--MacroTarget state: AUTO (is capital or command?) / TRUE / FALSE
		cost_matter  = 125, 		--integer, For structures.
		cost_energy  = 125, 		--integer, For structures.
		cost_supply  = 10, 		--integer, For structures. Logistics cost.
		cost_time    = 40, 		--integer, For structures, how long in seconds it takes to build.
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
			mesh    = "329-Shipyard/Shipyard-3",
			materials = { "329_MT_arc_0_aegis_teamColour", "329_MT_arc_0_aegis_teamColour", "329_MT_arc_0_aegis_teamColour", "329_MT_arc_0_aegis_teamColour" },
			pos       = { 0, 0, 0 },        --Relative local position of this object.
			rotation  = { 0, 0, 0 },        	--Eular Angles XYZ, will apply rotation ZXY. Relative local rotation of this object.
			scale 	= { 1, 1, 1 },			--The nonuniform scale of the part, relative to it's parent's scale.
			aegisVisual = true,
		},
		{
			name     = "Build",
			mesh    = "329-Shipyard/Shipyard-3",
			materials = { "329_MT_arc_1_build", "329_MT_arc_1_build", "329_MT_arc_1_build", "329_MT_arc_1_build" },
			pos       = { 0, 0, 0 },        --Relative local position of this object.
			rotation  = { 0, 0, 0 },        	--Eular Angles XYZ, will apply rotation ZXY. Relative local rotation of this object.
			scale 	= { 1, 1, 1 },			--The nonuniform scale of the part, relative to it's parent's scale.
			destroyOnConstructionComplete = true,
		},
		{
			name     = "Build",
			mesh    = "329-Shipyard/Shipyard-3",
			materials = { "329_MT_arc_2_build", "329_MT_arc_2_build", "329_MT_arc_2_build", "329_MT_arc_2_build" },
			pos       = { 0, 0, 0 },        --Relative local position of this object.
			rotation  = { 0, 0, 0 },        	--Eular Angles XYZ, will apply rotation ZXY. Relative local rotation of this object.
			scale 	= { 1, 1, 1 },			--The nonuniform scale of the part, relative to it's parent's scale.
			destroyOnConstructionComplete = true,
		},
		{
			name     = "Spawner Spawn and Ghost Point",	
			pos       = { 0, 0, 0 },        --Relative local position of this object.
			rotation  = { 0, 0, 0 },        	--Eular Angles XYZ, will apply rotation ZXY. Relative local rotation of this object.
			scale 	= { 1, 1, 1 },			--The nonuniform scale of the part, relative to it's parent's scale.
			spawnerSpawnPoint = {
				code = 0, -- The code used to identify this spawnpoint, spawnItems with the same code will be spawned at this spawnpoint and any others with the same code.
			},
		},
		
	},

	-- 🟦 HEALTH & ARMOR
	health = {
		unitClass = "CAPITAL",       -- UNITCLASS: NONE, MISSILE, DRONE, LIGHT, MEDIUM, HEAVY, CAPITAL, TITAN
		health = functions.floor((1 - healthStats.proportionRegenMax) * 10000),
		health_regen_per_second = healthStats.regen[shipConst.class],
		max_regen_frac = 0,
		aegis_regen_per_second = healthStats.aegisRegen[shipConst.class] * healthStats.structAegisRegenMult,
		aegisMaximum = functions.ceil(healthStats.proportionRegenMax * 10000),

		armour = 10,                --Reduces incoming damage. Used to allow heavier ship classes to withstand many smaller opponents, but still being countered by anti-armour. Lights ~5, Mediums ~10, Heavies ~20, Capitals ~50
		vulnerability_max = 0,   --Prevent the unit from losing more than X fraction of it's armour.
		shredMultiplier = 0,     --Multiplies incomming shred, pretty self explanatory right?

		explosionSFX = 0,          --Sorry don't have a table for this. Just use 0.
		explosionSFXIntensity = 0.8, --The importance of a sound, affects how far away it is heard and what other sounds it can override as there can only be 255 sounds at a time. Platform Death/Nuke = 10, Ekudon cannon = 4, Tolly gun = 0.2, Otorell gun = 0.4,

		heatResistancePercentage = healthStats.proportionRegenMax, --Fraction of heat resistance. (0-1) Normally 0
		shredResistancePercentage = 0, --Fraction of shred resistance. (0-1) Normally 0. If 0 game automatically assigns shredResistance based on unit class (as is done for the entire vanilla game).
		isResourceMatter = false,  	--For Matter Deposits. When damaged, gives the damage back to the attacking team as Matter.
		isResourceEnergy = false,  	--For Energy Deposits. When damaged, gives the damage back to the attacking team as Energy.
		isUncapturable = false,    	--Prevents capture, such as from Glowfish.
		ignoreImpulse = false,     	--Prevents getting pushed around by attacks. Such as Untresnafol bullets, or Heron railgun rounds.

		targetingPriorityMultiplier = 1.0, --Useful on torpedos. How important is this unit to attack? Strix torpedos = ~2
		untargetableTime = 0,    --Useful on drones/missiles. How long after spawning is this unit untargetable? (0 for everything, except missiles and drones)

		--###################### CLOAK DOES NOT WORK, DON'T USE IT YET. - Luke 2025/04/16
		doesCloaking = false,                 --Can cloak, and become untargetable.
		isCloaked = false,                    --Current state of cloak.
		cloakFrac = 0,
		cloakTime = 1.0,                      --How long it takes to cloak.
		decloakDistance = 0,                --How close it can get to something before being visible. Used by Glowfish blobs to let them get close enough to targets.

		phaseBlockFraction = 0,               --How much Phase is used to block damage. I don't think this works. 
		
		lifetime = 0,                         --How long before this unit self-destructs. (drones, missiles, bullets)
		explodeOnTimeout = false,             --Was it a peaceful death?

		explosionType = "EXPLOSION",          	-- EXPLOSION \ EXPLOSION_LOWPOLY \ SHOCKWAVE \ FLASH \ FLAK \ SPARKS (railgun bullet) \ FISHEXPLOSION \ WARP \ NONE \ VOLTJUMP
		explosionVolatility = 1.0,            	-- 1000 * unit scale * volatility = area damage when a unit of scale 2 or greater dies.
		explosionSizeOveride = 0,             	-- Size of the visual explosion. A Tolly is 0.4 in size. 0 is automatic.
		flashSizeOverride = 0,                	-- Size of the white internal flash. 0 is automatic.
		forceShockwave = false,               	-- Forces a repulsive shockwave to be created, uses explosionSizeOveride or auto if not set.
		preventShockwave = false,             	-- Prevents a repulsive shockwave from being created automatically on units scale 1+
		randomiseInAllDirections = false,     	--Let the explosion randomise it's direction.
		deathUnitSpawnDoNotRandomiseRotation = false, --Randomise the rotation of the unit spawned on death, if any.
		deathUnitSpawnTypeID = -1,            	--The unit spawned when this dies. -1 is nothing. Used for debris, and Glowfish Blobs.
		invulnerable = false,                 	--You can't hurt me, little man.
		unkillable = false,                   	--Even in death, I am eternal.
		death_countdown = 0,                  	--If the unit dies, but has not taken enough damage for InstaDeath, count down this long then blowup.
		mass = 0,                             	--Mass override, leave 0 for automatic (calculated from health, armour, and densityMult). Affects repulsion and impulse from damage.
		densityMult = 1.0,                    	--Multiplied agains the automatic mass calculation.
		tonnage = 40,                         	--Visual display value, does nothing.
		ignoreInstaDeath = false,             	--If a unit takes more than 150% damage (it's at negative health) it will explode instantly. True prevents that.
		alertPlayerOnDeath = false,           	--If on the player's team, log an Alert that this unit has died. Should make it true on all buildings, and hero units (Hemedall).
	},

	

	-- 🟦 STRUCTURE
	isStructure = true,
	structure = {
		type = "PRODUCTION", --NONE, ECONOMY, PRODUCTION, DEFENCE, OFFENCE, UTILITY, EXTENDER
		rectangle = {3,5}, 		-- optional, float2: xz dimensions of the influence, facing ^
		--ring = {0, 2.5},			-- optional, float2: Inner and outer ring radius. Inner > 0 lets you make donuts. If structure footprint is odd, add +0.5 for a cleaner circle.
		--matrixDimensions = {5,5},
		--matrix = {				-- optional, int bool: matrix for detailed footprints. 0 = empty space, 1 = occupied space
		--	0, 1, 1, 1, 0,
		--	1, 1, 1, 1, 1,
		--	1, 1, 1, 1, 1,
		--	1, 1, 1, 1, 1,
		--	0, 1, 1, 1, 0,
		-- },
	},


	-- 🟨 SPAWNER CONFIGURATION (yards)
	isSpawner = true,
	spawner = {
		spawnOffset = { 0, 3, 0 },      -- XYZ local offset
		spawnOffsetHeightRandomisation = 0.5, -- Adds +/- Y random variation
		endRotationUseStructureForward = false, -- Align to structure's forward?

		noUnitGhost = false,            -- If true, don't spawn ghost previews
		usesToSelfdestruct = 0,         -- Number of uses before self-destruct
		simultaneousUnitLimit = 0,      -- Max spawns at once, (Jerens and Refinery M6 use 1)

		arrivalData = {
			type = "ARRIVE", 		-- ARRIVETYPE: NONE, ARRIVE (appear and rise up), WARP (like a platform, or Petrel)
			arrivalDuration = 4, 	-- Seconds that the unit will spend moving from the point it is spawned, to the spawnOffset. AKA, makes it rise into place nicely. Distance = speed * duration
			approachSpeed = .3, 	-- Speed of movement, will extend the distance the unit moves. Distance = speed * duration
			keepDisabled = false 	-- The unit will be braindead on spawn and ignore repulsion. Not useful for spawners (used by map events and stuff), but exposed here just incase.
		}
	},

	-- 🟨 SPAWNER UNITS (units a yard can build)
	spawnItems = {
		{
			id = 3291500, -- typeID of the unit to spawn
			spawnTime = 80, -- How long to build/spawn
			spawnTimeStart = 0, -- Delay before first spawn, can be used to boost the initial production of a yard.

			-- Parts with SpawnerSpawnPoint = { code = X }, will be used by this spawnItem. Controls how many units are spawned, where they are spawned, and where their preview ghosts go.
			spawnPointCode = 0,

			spawnVelocity = 0, -- Ejection speed, eg. Kontaalagrad. Normal yards don't use this.
			ignoreWaypoints = false, -- EG. Kontaalagrad.
			heatPercentage = 0, -- What fraction of heat the unit spawns with, eg. Tychon units start with 20% (0.2) heat.

			techID = 0 -- Required tech to enable.
		},
		{
			id = 3291501, -- typeID of the unit to spawn
			spawnTime = 80, -- How long to build/spawn
			spawnTimeStart = 0, -- Delay before first spawn, can be used to boost the initial production of a yard.

			-- Parts with SpawnerSpawnPoint = { code = X }, will be used by this spawnItem. Controls how many units are spawned, where they are spawned, and where their preview ghosts go.
			spawnPointCode = 0,

			spawnVelocity = 0, -- Ejection speed, eg. Kontaalagrad. Normal yards don't use this.
			ignoreWaypoints = false, -- EG. Kontaalagrad.
			heatPercentage = 0, -- What fraction of heat the unit spawns with, eg. Tychon units start with 20% (0.2) heat.

			techID = 0 -- Required tech to enable.
		},
		{
			id = 3291502, -- typeID of the unit to spawn
			spawnTime = 80, -- How long to build/spawn
			spawnTimeStart = 0, -- Delay before first spawn, can be used to boost the initial production of a yard.

			-- Parts with SpawnerSpawnPoint = { code = X }, will be used by this spawnItem. Controls how many units are spawned, where they are spawned, and where their preview ghosts go.
			spawnPointCode = 0,

			spawnVelocity = 0, -- Ejection speed, eg. Kontaalagrad. Normal yards don't use this.
			ignoreWaypoints = false, -- EG. Kontaalagrad.
			heatPercentage = 0, -- What fraction of heat the unit spawns with, eg. Tychon units start with 20% (0.2) heat.

			techID = 0 -- Required tech to enable.
		},
		{
			id = 3291600, -- typeID of the unit to spawn
			spawnTime = 110, -- How long to build/spawn
			spawnTimeStart = 0, -- Delay before first spawn, can be used to boost the initial production of a yard.

			-- Parts with SpawnerSpawnPoint = { code = X }, will be used by this spawnItem. Controls how many units are spawned, where they are spawned, and where their preview ghosts go.
			spawnPointCode = 0,

			spawnVelocity = 0, -- Ejection speed, eg. Kontaalagrad. Normal yards don't use this.
			ignoreWaypoints = false, -- EG. Kontaalagrad.
			heatPercentage = 0, -- What fraction of heat the unit spawns with, eg. Tychon units start with 20% (0.2) heat.

			techID = 0 -- Required tech to enable.
		},
		{
			id = 3291601, -- typeID of the unit to spawn
			spawnTime = 110, -- How long to build/spawn
			spawnTimeStart = 0, -- Delay before first spawn, can be used to boost the initial production of a yard.

			-- Parts with SpawnerSpawnPoint = { code = X }, will be used by this spawnItem. Controls how many units are spawned, where they are spawned, and where their preview ghosts go.
			spawnPointCode = 0,

			spawnVelocity = 0, -- Ejection speed, eg. Kontaalagrad. Normal yards don't use this.
			ignoreWaypoints = false, -- EG. Kontaalagrad.
			heatPercentage = 0, -- What fraction of heat the unit spawns with, eg. Tychon units start with 20% (0.2) heat.

			techID = 0 -- Required tech to enable.
		},
		{
			id = 3291602, -- typeID of the unit to spawn
			spawnTime = 110, -- How long to build/spawn
			spawnTimeStart = 0, -- Delay before first spawn, can be used to boost the initial production of a yard.

			-- Parts with SpawnerSpawnPoint = { code = X }, will be used by this spawnItem. Controls how many units are spawned, where they are spawned, and where their preview ghosts go.
			spawnPointCode = 0,

			spawnVelocity = 0, -- Ejection speed, eg. Kontaalagrad. Normal yards don't use this.
			ignoreWaypoints = false, -- EG. Kontaalagrad.
			heatPercentage = 0, -- What fraction of heat the unit spawns with, eg. Tychon units start with 20% (0.2) heat.

			techID = 0 -- Required tech to enable.
		},
		{
			id = 3291804, -- typeID of the unit to spawn
			spawnTime = 80, -- How long to build/spawn
			spawnTimeStart = 0, -- Delay before first spawn, can be used to boost the initial production of a yard.

			-- Parts with SpawnerSpawnPoint = { code = X }, will be used by this spawnItem. Controls how many units are spawned, where they are spawned, and where their preview ghosts go.
			spawnPointCode = 0,

			spawnVelocity = 0, -- Ejection speed, eg. Kontaalagrad. Normal yards don't use this.
			ignoreWaypoints = false, -- EG. Kontaalagrad.
			heatPercentage = 0, -- What fraction of heat the unit spawns with, eg. Tychon units start with 20% (0.2) heat.

			techID = 0 -- Required tech to enable.
		},
	},
}
