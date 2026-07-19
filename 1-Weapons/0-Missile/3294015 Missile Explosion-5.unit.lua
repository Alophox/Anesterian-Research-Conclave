weaponConst = {
	size = "T",
};
scaleConst = .044921;
return {

	-- 🟦 DEFINITIONS
	unitName                    = "329-missile-5-explosion",                 -- string: Internal name for debugging and errors.
	unitDisplayName             = "Zerda",                         -- string: Actual display name of the unit in the Databank, HUD, etc.
	unitTooltip                 = "", 						   -- string: Shown when moused over in the HUD.
	unitBlurb                   = "Smol Missile", -- string: Shown just below the unit name in tooltips and databank.
	unitBlurbExcludeFromTooltip = false,                           -- bool: The blurb is automatically added to tooltips, but if you don't want that (looks weird and redundant for most structures) set this.
	hotkey                      = "",                             -- Unity KeyCode: For buildbar. The hotkey for this unit.
	generatePicture = true;
	-- picture                     = "329-zerda.png",             -- string filename: The name of the image file in this folder to be used for this unit.

	controllable 	= false;	-- bool: Can this unit be given move orders with right click?
	unselectable = true;	-- Cannot be selected.
	untargetable = true;	-- Cannot be targeted.
	unhittable 	= true;  -- Will be ignored by any RAYCAST or CAST based aquisition types (as are used for bullets). Also cannot be hit by explosions or incidental weapon raycasts (lasers). But can still be hit by PureHit weapons.

	-- 📘 DATABANK ENTRY
	databankEntry               = {
		visibility                  = "HIDDEN", -- string enum: VISIBLE (always available) / HIDDEN (never visible)/ DISCOVER (visible once required level)
		requiredLevelForVisible     = "", 			-- string;
		requiredLevelForDescription = "", 			-- string;
		tactical                    = "", -- string markdown: Added to the top of all tooltips and Databank descriptions. Used to quickly explain what a unit is good at doing. Strong against, decent against, weak against.
		description                 =
		".",
		weaponInfo                  = {
			{ -1, -1, -2 }
		},
		relatedUnitIDs              = {} 	-- int array: TypeID of other units in the family tree
	},

	-- BODY SETUP
	scale                       	= scaleConst,                                          -- float: A Tolly is scale 0.4, all units are a uniform scale. Normalise XY mesh size to 1 in Blender. (controls selection ring, among other things. the longest horizontal part (width/length) is 1)
	-- mainMesh                    	= "329-Missiles/Missile-1-Zerda",   -- string: Visual body of this unit. Requires materials to be visible. FileName/ObjectName, looks for FileName.glb and then ObjectName from within that.
	
	--NOTICE, WORKING WITH MATERIALS AND MESHS:
	--When making a mesh in Blender, you can assign materials to different surfaces. The number of materials used create 'material slots' for the mesh.
	--ATS cannot use the Blender materials, and so we must define them in a .materials.lua file within the same mod folder.
	--Inorder for ATS to know which material goes to which material slot on a mesh, we must define the ordering.
	--Assign materials here in the same order as they are defined on the object in your Blender file. 
	--(Can only get materials from .materials.lua files in this mod folder.)
	-- materials                   = { "329_MT_arc_hull","329_MT_arc_teamColour","329_MT_arc_engine","329_MT_arc_hull_dark","329_MT_arc_teamGlow" },

	-- Percieved dimensions of the unit. Multiplied against scale. Controls how big the unit is percieved by other units. 
	-- Units cannot actually "see" anything, so we need to mathematically define how big the unit is for standoff behaviour among other things.
	-- CONTROLS: standoff, targeting, repulsion distance.
	-- Better to have the dimensions too small, than too large. Otherwise units will struggle to get in actual firing range of the target's colliders.
	inEditor = false,
    autoColourElements = true,
    editorDontColour = false,
	colliderDimensions = {
		widthMultiplier  = 0.594, -- float: Multiplied by scale to determine the percieved width of the unit. Long units (Vaalkorei) have this at about 0.5~0.6, aka we're only half as wide as we are long.
		heightMultiplier = 0.594, -- float: Multiplied by scale to determine the percieved height of the unit, flat units (Kontaalen) have this at about 0.6, aka we're shorter than we are long.
		lengthMultiplier = 1.0, -- float: Multiplied by scale to determine the percieved length of the unit. wide units (Soul Warden Fore section) have this at about 0.5, aka we're only half as long as we are wide.
	},

	-- 🟦 UNIT ID, STRUCTURE COST, MACROTARGET STATE, TECH
	data = {
		typeID       = 3294015, -- int: !!! IMPORTANT !!! The unique id of this unit. Must be higher than 99999 (ATS reserved). Used by maps and many things. If you change this any maps made with it won't be able to find the unit and will just spawn nothing.
		factionID    = 329, -- int: The faction this unit is associated with in the Databank.
		macroType    = "AUTO", -- string enum: MacroTarget state: AUTO (is capital or command?) / TRUE / FALSE
		cost_matter  = 0, -- int: For structures.
		cost_energy  = 0, -- int: For structures.
		cost_supply  = 0, -- int: For structures. Logistics cost.
		cost_time    = 0, -- float: For structures, how long in seconds it takes to build.
		techRequired = 0  -- int: The required globalTech needed for this structure to be available to build. ### Does not work at the moment.
	},

	-- 🟦 PARTS
	parts = {
		{
			name      = "Warhead",
			position  = { 0 , 0, 0 },    	-- float3: XYZ Relative local position of this object. Copy positions from Blender to help you out. NOTICE: Blender uses +Z as up, but this is converted to +Y (is up) when used in game.
			rotation  = { 0, 0, 0 },        			-- float3: XYZ Eular Angles, will apply rotation ZXY. Relative local rotation of this object.
			scale 	= { .1, .1, .1 },					-- float3: XYZ The nonuniform scale of the part, relative to it's parent's scale.

			weapon    = {
				weaponID = 3295702, --int: The weaponData id to be used for this weapon.
				turnSpeed = 0, 	--float: Degrees per second.
				turnMode = "Linear", --string enum: Linear / Acceleration
				turnInstant = true, --bool: Ignore turn speed, snap to target. (Beam Spire, point defence)
				mountAngles = { -- Weapon's firing angles in degrees. Won't aquire targets outside this field of view.
					left = 180, --float:
					right = 180,--float:
					up = 90,	 --float:
					down = 90  --float:
				},
			},
		},
		{
			name = "Particle Tube",
			position = {0,0,0},
			rotation = {0,0,0},
			rotate = {
				timeStepSeconds = .051,             -- decimal
				degreeRotationPerSecond = { 100,0,0 }, -- decimals (x,y,z)
			},
			parts={
				{
			name     = "Suck Particles",
			position = { 0, 0, 0.0001 },
			rotation = { 0, 0, 0 },
			scale 	= { 1, 1, 1 },

			particleEmitter = {
				particleType = "PULSE",        -- enum EMITTERTYPE -- PARTICLE, RIBBON, PULSE
				distancePerParticle = .1,       -- decimal
				minSecondsPerParticle = 9999,     -- decimal
				ejectionVelocity = 0,             -- decimal
				ejectionVelocityAwayFromEmitter = true, -- bool
				randomRadius = 0,                 -- decimal
				randomScaleMinFraction = 1,       -- decimal
				startDisabled = true,            -- bool
				stateToggleTrigger = "OnDeath",      -- enum EMITTERSTATETRIGGER
				colourStart = {1,1,1},            -- decimals
				colourEnd   = {1,1,1},            -- decimals
				opacity     = .5,                  -- decimal
				scaleStart  = weaponStats.missile.baseAOE * weaponStats.rangeMult[weaponConst.size],                  -- decimal
				scaleEnd    = 0,                  -- decimal
				lifetime    = .5,                  -- decimal
			},
			
		},
		{
			name     = "Suck Particles",
			position = { 0, 0, 0.0001 },
			rotation = { 0, 0, 0 },
			scale 	= { 1, 1, 1 },
			particleEmitter = {
				particleType = "PARTICLE",        -- enum EMITTERTYPE -- PARTICLE, RIBBON, PULSE
				distancePerParticle = 1,       -- decimal
				minSecondsPerParticle = 0.006,     -- decimal
				ejectionVelocity = 0,             -- decimal
				ejectionVelocityAwayFromEmitter = true, -- bool
				randomRadius = 0,                 -- decimal
				randomScaleMinFraction = 1,       -- decimal
				startDisabled = true,            -- bool
				stateToggleTrigger = "OnDeath",      -- enum EMITTERSTATETRIGGER
				colourStart = {.6,0,.6},            -- decimals
				colourEnd   = {.6,0,.6},            -- decimals
				opacity     = .5,                  -- decimal
				scaleStart  = weaponStats.missile.baseAOE * weaponStats.rangeMult[weaponConst.size]*1,                  -- decimal
				scaleEnd    = 0,                  -- decimal
				lifetime    = 1,                  -- decimal
			},
		},
		{
			name     = "Suck Particles",
			position = { 0, 0, 0.0001 },
			rotation = { 0, 0, 0 },
			scale 	= { 1, 1, 1 },
			particleEmitter = {
				particleType = "PARTICLE",        -- enum EMITTERTYPE -- PARTICLE, RIBBON, PULSE
				distancePerParticle = 1,       -- decimal
				minSecondsPerParticle = 0.006,     -- decimal
				ejectionVelocity = 0,             -- decimal
				ejectionVelocityAwayFromEmitter = true, -- bool
				randomRadius = 0,                 -- decimal
				randomScaleMinFraction = 1,       -- decimal
				startDisabled = true,            -- bool
				stateToggleTrigger = "OnDeath",      -- enum EMITTERSTATETRIGGER
				colourStart = {.7,0,.7},            -- decimals
				colourEnd   = {.7,0,.7},            -- decimals
				opacity     = .6,                  -- decimal
				scaleStart  = weaponStats.missile.baseAOE * weaponStats.rangeMult[weaponConst.size]*.8,                  -- decimal
				scaleEnd    = 0,                  -- decimal
				lifetime    = 1,                  -- decimal
			},
		},
		{
			name     = "Suck Particles",
			position = { 0, 0, 0.0001 },
			rotation = { 0, 0, 0 },
			scale 	= { 1, 1, 1 },
			particleEmitter = {
				particleType = "PARTICLE",        -- enum EMITTERTYPE -- PARTICLE, RIBBON, PULSE
				distancePerParticle = 1,       -- decimal
				minSecondsPerParticle = 0.006,     -- decimal
				ejectionVelocity = 0,             -- decimal
				ejectionVelocityAwayFromEmitter = true, -- bool
				randomRadius = 0,                 -- decimal
				randomScaleMinFraction = 1,       -- decimal
				startDisabled = true,            -- bool
				stateToggleTrigger = "OnDeath",      -- enum EMITTERSTATETRIGGER
				colourStart = {.8,.1,.8},            -- decimals
				colourEnd   = {.8,.1,.8},            -- decimals
				opacity     = .7,                  -- decimal
				scaleStart  = weaponStats.missile.baseAOE * weaponStats.rangeMult[weaponConst.size]*.6,                  -- decimal
				scaleEnd    = 0,                  -- decimal
				lifetime    = 1,                  -- decimal
			},
		},
		{
			name     = "Suck Particles",
			position = { 0, 0, 0.0001 },
			rotation = { 0, 0, 0 },
			scale 	= { 1, 1, 1 },
			particleEmitter = {
				particleType = "PARTICLE",        -- enum EMITTERTYPE -- PARTICLE, RIBBON, PULSE
				distancePerParticle = 1,       -- decimal
				minSecondsPerParticle = 0.006,     -- decimal
				ejectionVelocity = 0,             -- decimal
				ejectionVelocityAwayFromEmitter = true, -- bool
				randomRadius = 0,                 -- decimal
				randomScaleMinFraction = 1,       -- decimal
				startDisabled = true,            -- bool
				stateToggleTrigger = "OnDeath",      -- enum EMITTERSTATETRIGGER
				colourStart = {1,.5,1},            -- decimals
				colourEnd   = {1,.5,1},            -- decimals
				opacity     = .9,                  -- decimal
				scaleStart  = weaponStats.missile.baseAOE * weaponStats.rangeMult[weaponConst.size]*.4,                  -- decimal
				scaleEnd    = 0,                  -- decimal
				lifetime    = 1,                  -- decimal
			},
		},
			}
		}
		
	},

	-- Defines what the yard production ghost of this unit looks like. AKA, when a yard is building a unit, this is what it displays. Useful for construction effects like drones (Vaalkorei).
	-- ghostMesh		= "329-Missiles/Missile-1-Zerda",   -- Used for build ghosts on spawners (yards).
	-- ghostMaterials                   = { "329_MT_arc_hull","329_MT_arc_teamColour","329_MT_arc_engine","329_MT_arc_hull_dark","329_MT_arc_teamGlow"   }, -- Used for the ghostMesh for build ghosts on spawners (yards).
	ghostParts 	= {
	},

	-- 🟦 HEALTH & ARMOR
	health = {
		unitClass = "NONE",       -- string enum: UNITCLASS: NONE, MISSILE, DRONE, LIGHT, MEDIUM, HEAVY, CAPITAL, TITAN
		health = 1,              -- float: Health, also the unit's heat capacity.
		health_regen_per_second = 0, -- float: Health regen per second. Duh.
		max_regen_frac = 0,      -- float: The maximum health regen can regenerate back to. 0.2 == 20% of health. Health regen will stop when health hits this fraction of total health.

		armour = 0,                -- int: Reduces incoming damage. Used to allow heavier ship classes to withstand many smaller opponents, but still being countered by anti-armour. Lights ~5, Mediums ~10, Heavies ~20, Capitals ~50
		vulnerability_max = 0,   -- float: Prevent the unit from losing more than X fraction of it's armour.
		shredMultiplier = 0,     -- float: Multiplies incomming shred, pretty self explanatory right?

		explosionSFX = 0,          -- int: will write a table for inbuilt game SFX. If I have, ask me for it. Otherwise wait. :)
		explosionSFXIntensity = weaponStats.SFXIntensity[weaponConst.size], -- float: The importance of a sound, affects how far away it is heard and what other sounds it can override as there can only be 255 sounds at a time. Platform Death/Nuke = 10, Ekudon cannon = 4, Tolly gun = 0.2, Otorell gun = 0.4,

		heatResistancePercentage = 0, -- float: Fraction of heat resistance. (0-1) Normally 0
		shredResistancePercentage = 0, -- float: Fraction of shred resistance. (0-1) Normally 0. If 0 game automatically assigns shredResistance based on unit class (as is done for the entire vanilla game).
		aegisMaximum = 0, 			-- float: Game will automatically determine, but can be manually set here.
		isResourceMatter = false,  	-- bool: For Matter Deposits. When damaged, gives the damage back to the attacking team as Matter.
		isResourceEnergy = false,  	-- bool: For Energy Deposits. When damaged, gives the damage back to the attacking team as Energy.
		isUncapturable = false,    	-- bool: Prevents capture, such as from Glowfish.
		ignoreImpulse = false,     	-- bool: Prevents getting pushed around by attacks. Such as Untresnafol bullets, or Heron railgun rounds.

		targetingPriorityMultiplier = 1.0, -- float: Useful on torpedos. How important is this unit to attack? Strix torpedos = ~2
		untargetableTime = 0.5,    -- float: Useful on drones/missiles. How long after spawning is this unit untargetable? (0 for everything, except missiles and drones)

		--###################### CLOAK DOES NOT WORK, DON'T USE IT YET. - Luke 2025/04/16
		doesCloaking = false,                 --Can cloak, and become untargetable.
		isCloaked = false,                    --Current state of cloak.
		cloakFrac = 0,
		cloakTime = 1.0,                      -- float: How long it takes to cloak.
		decloakDistance = 0, --weaponStats.missile.baseCloakRange * weaponStats.rangeMult[weaponConst.size],                -- float: How close it can get to something before being visible. Used by Glowfish blobs to let them get close enough to targets.

		phaseBlockFraction = 0,               -- float: How much Phase is used to block damage. I don't think this works. 
		
		lifetime = 1, -- (((weaponStats.missile.baseRange * weaponStats.overShootMult * weaponStats.rangeMult[weaponConst.size]) / weaponStats.missile.velocity)^(0.5))*2.5,                         -- float: How long in seconds before this unit self-destructs. (drones, missiles, bullets)
		explodeOnTimeout = false,             -- Was it a peaceful death?

		explosionType = "NONE",          	-- string enum: EXPLOSION \ EXPLOSION_LOWPOLY \ SHOCKWAVE \ FLASH \ FLAK \ SPARKS (railgun bullet) \ FISHEXPLOSION \ WARP \ NONE \ VOLTJUMP
		explosionVolatility = 0,            	-- float: 1000 * unit scale * volatility = area damage when a unit of scale 2 or greater dies.
		explosionSizeOveride = weaponStats.missile.baseAOE * weaponStats.rangeMult[weaponConst.size],             	-- float: Size of the visual explosion. A Tolly is 0.4 in size. 0 is automatic.
		flashSizeOverride = weaponStats.missile.baseAOE * weaponStats.rangeMult[weaponConst.size] / 2,                	-- float: Size of the white internal flash. 0 is automatic.
		forceShockwave = false,               	-- bool: Forces a repulsive shockwave to be created, uses explosionSizeOveride or auto if not set.
		preventShockwave = true,             	-- Prevents a repulsive shockwave from being created automatically on units scale 1+
		randomiseInAllDirections = false,     	--Let the explosion randomise it's direction.
		
		deathExplosionVisual = {
			startColour = {.1, .1, .1}
		},
		
		deathUnitSpawnDoNotRandomiseRotation = false, --Randomise the rotation of the unit spawned on death, if any.
		deathUnitSpawnTypeID = -1,            	-- int: The unit spawned when this dies. -1 is nothing. Used for debris, and Glowfish Blobs.
		invulnerable = false,                 	-- You can't hurt me, little man.
		unkillable = false,                   	-- Even in death, I am eternal.
		death_countdown = .1,                  	-- float: If the unit dies, but has not taken enough damage for InstaDeath, count down this long then blowup.
		mass = 0,                             	-- float: Mass override, leave 0 for automatic (calculated from health, armour, and densityMult). Affects repulsion and impulse from damage.
		densityMult = 1 / (1-healthStats.proportionRegenMax),                    	-- float: Multiplied agains the automatic mass calculation.
		tonnage = 40,                         	-- float: Visual display value, does nothing.
		ignoreInstaDeath = true,             	-- If a unit takes more than 150% damage (it's at negative health) it will explode instantly. True prevents that.
		alertPlayerOnDeath = false,           	-- If on the player's team, log an Alert that this unit has died. Should make it true on all buildings, and hero units (Hemedall).
	},

	-- 🟦 MOVEMENT
	isMobile           = false,
	movement           = {
		type = "FREE",                -- string enum: UNITMOVETYPE: MAPLOCKED / FREE --Does this unit act like a normal ship, and stay within the 0-7y world height. Or like a drone/missile?
		maximumAngleToTarget = .6,        -- float: Radians within in which a unit is allowed to accelerate towards a target.
		acceleration = weaponStats.missile.velocity,               -- float: The units per second of the ship's acceleration. A tolly is 0.4 units long, and accelerates at 0.35
		strafingAccelMultiplier = 0,     -- float: Fraction of accel used for strafing
		reverseAccelMultiplier = 0,      -- float: Fraction of accel used for reverse/breaking
		inertialCorrection = false,         --Try to cancel out excess velocity in directions you don't want to go.
		isStrafing = false,                 --Should this unit strafe around? (Partell, Skua)
		standoffDistance = 0,              -- float: How far away from a target's ColliderDimensions should a unit hold position?
		retreatDistance = 0,               -- float: How far away from a target's ColliderDimensions should a unit begin to retreat?
		strafeMargin = 1.5,                -- float: How far away from standoffDistance strafe thrust is allowed to start. Default = 1
		useMinimumWorldYPosition = false,
		minimumWorldYPosition = 0,         -- float: What does this unit consider the lowest it can go? Capitals and Heavies often use 3~4 to stop them sinking into bases, and keep them looking imposing.
		alwaysFaceCombatTarget = false,     -- Important for things like Hemedalls.
		GoToStructurePlaneForFinalWaypoint = false -- Important for things like the Redemption Foundary MkX's waypointable Kontaalagrad. So that it actually hits the thing you point it to.
	},

	-- 🟦 ROTATION
	isRotating         = false,
	rotation           = {
		turnMode = "Acceleration", 	-- string enum: SHIPTURNMODE: Acceleration / Linear
		baseRotationSpeed = weaponStats.missile.trackingMult[weaponConst.size] * weaponStats.accuracySpread, 		-- float: Degrees/second
		maxSpeedMultiplier = weaponStats.missile.trackingMult[weaponConst.size] * weaponStats.accuracySpread, 		-- float: For mode Acceleration, baseRotationSpeed becomes acceleration. This is the maximum rotation speed that may be reached.
		preferredAngle = 0, 		-- float: Degrees. Prefered facing angle from target. Useful for thinks like Skua's (90) and Herons (30) that want to face away from their target for broadsides and cool stuff like strafing.
		ignoreWorldUp = true 		-- bool: Good for Lights/Drones/Missiles. Allows this unit to turn upside down, sideways, etc. Looks stupid on most large ships such as Heavies and Capitals.
	},

	-- 🟥 PAYLOAD (AOE, for missiles, flak, etc.)
	hasPayload = true,
	payload = {
		damage = {
			isNondamaging = false,
			instances = weaponStats.missile.instances[weaponConst.size],
			damage = weaponStats.damageMult[weaponConst.size] * weaponStats.missile.baseDMG / (weaponStats.missile.instances[weaponConst.size]),
			piercing = 0,
			shred = weaponStats.CDMult[weaponConst.size] * weaponStats.missile.baseShred / (weaponStats.missile.instances[weaponConst.size]),
			heat = weaponStats.damageMult[weaponConst.size] * weaponStats.missile.baseHeat / (weaponStats.missile.instances[weaponConst.size]),
			vulnerability = 0,
			decloak = 1.0,
			targetingPriorityMultiplier = 0.1,
			impulseForce = weaponStats.missile.impulse * weaponStats.damageMult[weaponConst.size]
		},

		areaEffect = {
			maximumDegrees = 0, 	--Degrees from forward that units can be hit. Weapons spawn AOE's facing the same direction as them.
			radiusOuter = weaponStats.missile.baseAOE * weaponStats.rangeMult[weaponConst.size], 		--A tolly is 0.4 units long.
			radiusInner = weaponStats.missile.baseAOE * weaponStats.rangeMult[weaponConst.size] / 2
		}
	},
	
}
