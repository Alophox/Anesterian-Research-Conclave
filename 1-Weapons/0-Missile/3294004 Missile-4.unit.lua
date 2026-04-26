weaponConst = {
	size = "X",
};
scaleConst = .18;
return {

	-- 🟦 DEFINITIONS
	unitName                    = "329-lagopus",                 -- string: Internal name for debugging and errors.
	unitDisplayName             = "Lagopus",                         -- string: Actual display name of the unit in the Databank, HUD, etc.
	unitTooltip                 = "", 						   -- string: Shown when moused over in the HUD.
	unitBlurb                   = "Missile", -- string: Shown just below the unit name in tooltips and databank.
	unitBlurbExcludeFromTooltip = false,                           -- bool: The blurb is automatically added to tooltips, but if you don't want that (looks weird and redundant for most structures) set this.
	hotkey                      = "",                             -- Unity KeyCode: For buildbar. The hotkey for this unit.
	picture                     = "329-lagopus.png",             -- string filename: The name of the image file in this folder to be used for this unit.

	controllable 	= false;	-- bool: Can this unit be given move orders with right click?
	unselectable = false;	-- Cannot be selected.
	untargetable = false;	-- Cannot be targeted.
	unhittable 	= false;  -- Will be ignored by any RAYCAST or CAST based aquisition types (as are used for bullets). Also cannot be hit by explosions or incidental weapon raycasts (lasers). But can still be hit by PureHit weapons.

	-- 📘 DATABANK ENTRY
	databankEntry               = {
		visibility                  = "HIDDEN", -- string enum: VISIBLE (always available) / HIDDEN (never visible)/ DISCOVER (visible once required level)
		requiredLevelForVisible     = "", 			-- string;
		requiredLevelForDescription = "", 			-- string;
		tactical                    = "", -- string markdown: Added to the top of all tooltips and Databank descriptions. Used to quickly explain what a unit is good at doing. Strong against, decent against, weak against.
		description                 =
		".",
		weaponInfo                  = { 	-- int3 array: Tells the databank which weaponDatas to grab and display for this unit. Not automatic you have to do this, I'm sorry.
			{ 3296004, 1, 0 }   		-- (int, int, int): weaponID, count, subMunitionWeaponID (bullet, missile, etc, 0 = none) This gets the damage data of the subMunitionWeapon if it has any, important for bullets which themselves do damage via a subweapon.
		},
		relatedUnitIDs              = {} 	-- int array: TypeID of other units in the family tree
	},

	-- BODY SETUP
	scale                       	= scaleConst,                                          -- float: A Tolly is scale 0.4, all units are a uniform scale. Normalise XY mesh size to 1 in Blender. (controls selection ring, among other things. the longest horizontal part (width/length) is 1)
	mainMesh                    	= "329-Missiles/Missile-1-Zerda",   -- string: Visual body of this unit. Requires materials to be visible. FileName/ObjectName, looks for FileName.glb and then ObjectName from within that.
	
	--NOTICE, WORKING WITH MATERIALS AND MESHS:
	--When making a mesh in Blender, you can assign materials to different surfaces. The number of materials used create 'material slots' for the mesh.
	--ATS cannot use the Blender materials, and so we must define them in a .materials.lua file within the same mod folder.
	--Inorder for ATS to know which material goes to which material slot on a mesh, we must define the ordering.
	--Assign materials here in the same order as they are defined on the object in your Blender file. 
	--(Can only get materials from .materials.lua files in this mod folder.)
	materials                   = { "329_MT_arc_hull","329_MT_arc_teamColour","329_MT_arc_teamGlow","329_MT_arc_hull_dark","329_MT_arc_teamGlow" },

	-- Percieved dimensions of the unit. Multiplied against scale. Controls how big the unit is percieved by other units. 
	-- Units cannot actually "see" anything, so we need to mathematically define how big the unit is for standoff behaviour among other things.
	-- CONTROLS: standoff, targeting, repulsion distance.
	-- Better to have the dimensions too small, than too large. Otherwise units will struggle to get in actual firing range of the target's colliders.
	inEditor = true,
    autoColourElements = true,
    editorDontColour = false,
	colliderDimensions = {
		widthMultiplier  = 0.594, -- float: Multiplied by scale to determine the percieved width of the unit. Long units (Vaalkorei) have this at about 0.5~0.6, aka we're only half as wide as we are long.
		heightMultiplier = 0.594, -- float: Multiplied by scale to determine the percieved height of the unit, flat units (Kontaalen) have this at about 0.6, aka we're shorter than we are long.
		lengthMultiplier = 1.0, -- float: Multiplied by scale to determine the percieved length of the unit. wide units (Soul Warden Fore section) have this at about 0.5, aka we're only half as long as we are wide.
	},

	-- 🟦 UNIT ID, STRUCTURE COST, MACROTARGET STATE, TECH
	data = {
		typeID       = 3294004, -- int: !!! IMPORTANT !!! The unique id of this unit. Must be higher than 99999 (ATS reserved). Used by maps and many things. If you change this any maps made with it won't be able to find the unit and will just spawn nothing.
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
				weaponID = 3296004, --int: The weaponData id to be used for this weapon.
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
			name     = "Thruster",
			position = { 0, 0, -0.12*.1/scaleConst },
			rotation = { 0, 0, 0 },
			scale 	= { 1, 1, 1 },
			thruster = {
				-- This part will respond to how the ship tries to move. It will scale along the Z axis (XYZ) starting from 0 (invisible), and return up to it's starting scale.
				decayTime = 0,	--float: Seconds, how long it takes for the thruster to shrink to 0, or return to full scale.
				workWhenThrustWithinAngleDegrees = 360, --float: Thrusters are purely visual. For them to know when to visually "thrust" they check the direction that the parent ship is thrusting. How many degrees off can the thrust direction be before the thruster ignores it.
			},

			-- For thruster visuals, if you want more than one plume for our thruster build it out of multiple subparts.
			parts = {
				{
					name     = "Thruster Plume",
					mesh     = "329-Thruster/Thruster-Plume",
					materials  = { "329_MT_arc_thruster_teamGlow", "329_MT_arc_thruster-middle_teamGlow", "329_MT_arc_thruster-outer_teamGlow" },
					position = { 0, 0, 0 }, --XYZ, Thruster subparts should all be on the same Y point, as they all scale along the parent's Y axis.
					rotation = { 0, 0, 0 },
					scale 	= { .5, .5, .6 },
				},
			},
		},

		-- {
		-- 	name="trail thrower",
		-- 	position  = { 0,0, 0 },    	-- float3: XYZ Relative local position of this object. Copy positions from Blender to help you out. NOTICE: Blender uses +Z as up, but this is converted to +Y (is up) when used in game.
		-- 	rotation  = { 0, 0, 0 },        			-- float3: XYZ Eular Angles, will apply rotation ZXY. Relative local rotation of this object.
		-- 	scale 	= { 1, 1, 1 },					-- float3: XYZ The nonuniform scale of the part, relative to it's parent's scale.

		-- 	weapon    = {
		-- 		weaponID = 3295711, --int: The weaponData id to be used for this weapon.
		-- 		turnSpeed = 0, 	--float: Degrees per second.
		-- 		turnMode = "Linear", --string enum: Linear / Acceleration
		-- 		turnInstant = false, --bool: Ignore turn speed, snap to target. (Beam Spire, point defence)
		-- 		mountAngles = { -- Weapon's firing angles in degrees. Won't aquire targets outside this field of view.
		-- 			left = 0, --float:
		-- 			right = 0,--float:
		-- 			up = 0,	 --float:
		-- 			down = 0  --float:
		-- 		},
		-- 	},
		-- },

		{
			name     = "Trail Example",
			-- position = { 0, 0, -0.12*.1/.044921 },
			position = { 0, 0, 0 },
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
				colourStart = {0,1,1},            -- decimals
				colourEnd   = {1,1,1},            -- decimals
				opacity     = .2,                  -- decimal
				scaleStart  = scaleConst/2,                  -- decimal
				scaleEnd    = scaleConst,                  -- decimal
				lifetime    = 1,                  -- decimal
			},
			
		},
	},

	-- Defines what the yard production ghost of this unit looks like. AKA, when a yard is building a unit, this is what it displays. Useful for construction effects like drones (Vaalkorei).
	ghostMesh		= "329-Missiles/Missile-1-Zerda",   -- Used for build ghosts on spawners (yards).
	ghostMaterials                   = { "329_MT_arc_hull","329_MT_arc_teamColour","329_MT_arc_engine","329_MT_arc_hull_dark","329_MT_arc_teamGlow"   }, -- Used for the ghostMesh for build ghosts on spawners (yards).
	ghostParts 	= {
		-- {
		-- 	name      = "Turret",
        --     mesh      = "329-Turrets-1/Turret-1-Base",
        --     materials = { "329_MT_arc_hull", "329_MT_arc_teamGlow", "329_MT_arc_hull_dark", "329_MT_arc_teamColour" },
		-- 	position  = { 0, 0.75, -0.5 },    	-- float3: XYZ Relative local position of this object. Copy positions from Blender to help you out. NOTICE: Blender uses +Z as up, but this is converted to +Y (is up) when used in game.
		-- 	rotation  = { 0, 0, 0 },        			-- float3: XYZ Eular Angles, will apply rotation ZXY. Relative local rotation of this object.
		-- 	scale 	= { .1, .1, .1 },					-- float3: XYZ The nonuniform scale of the part, relative to it's parent's scale.
		-- },
	},

	-- 🟦 HEALTH & ARMOR
	health = {
		unitClass = "MISSILE",       -- string enum: UNITCLASS: NONE, MISSILE, DRONE, LIGHT, MEDIUM, HEAVY, CAPITAL, TITAN
		health = weaponStats.missile.baseHP * weaponStats.damageMult[weaponConst.size],              -- float: Health, also the unit's heat capacity.
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
		
		lifetime = (((weaponStats.missile.baseRange * weaponStats.overShootMult * weaponStats.rangeMult[weaponConst.size]) / weaponStats.missile.velocity)^(0.5))*2.6,                         -- float: How long in seconds before this unit self-destructs. (drones, missiles, bullets)
		explodeOnTimeout = false,             -- Was it a peaceful death?

		explosionType = "FLASH",          	-- string enum: EXPLOSION \ EXPLOSION_LOWPOLY \ SHOCKWAVE \ FLASH \ FLAK \ SPARKS (railgun bullet) \ FISHEXPLOSION \ WARP \ NONE \ VOLTJUMP
		explosionVolatility = 0,            	-- float: 1000 * unit scale * volatility = area damage when a unit of scale 2 or greater dies.
		explosionSizeOveride = 0.001, -- weaponStats.missile.baseAOE * weaponStats.rangeMult[weaponConst.size],             	-- float: Size of the visual explosion. A Tolly is 0.4 in size. 0 is automatic.
		flashSizeOverride = weaponStats.missile.baseAOE * weaponStats.rangeMult[weaponConst.size] / 20,                	-- float: Size of the white internal flash. 0 is automatic.
		forceShockwave = false,               	-- bool: Forces a repulsive shockwave to be created, uses explosionSizeOveride or auto if not set.
		preventShockwave = false,             	-- Prevents a repulsive shockwave from being created automatically on units scale 1+
		randomiseInAllDirections = false,     	--Let the explosion randomise it's direction.
		deathUnitSpawnDoNotRandomiseRotation = false, --Randomise the rotation of the unit spawned on death, if any.
		deathUnitSpawnTypeID = 3294014,            	-- int: The unit spawned when this dies. -1 is nothing. Used for debris, and Glowfish Blobs.
		invulnerable = false,                 	-- You can't hurt me, little man.
		unkillable = false,                   	-- Even in death, I am eternal.
		death_countdown = 0,                  	-- float: If the unit dies, but has not taken enough damage for InstaDeath, count down this long then blowup.
		mass = 0,                             	-- float: Mass override, leave 0 for automatic (calculated from health, armour, and densityMult). Affects repulsion and impulse from damage.
		densityMult = 1 / (1-healthStats.proportionRegenMax),                    	-- float: Multiplied agains the automatic mass calculation.
		tonnage = 40,                         	-- float: Visual display value, does nothing.
		ignoreInstaDeath = true,             	-- If a unit takes more than 150% damage (it's at negative health) it will explode instantly. True prevents that.
		alertPlayerOnDeath = false,           	-- If on the player's team, log an Alert that this unit has died. Should make it true on all buildings, and hero units (Hemedall).
	},

	-- 🟦 MOVEMENT
	isMobile           = true,
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
	isRotating         = true,
	rotation           = {
		turnMode = "Acceleration", 	-- string enum: SHIPTURNMODE: Acceleration / Linear
		baseRotationSpeed = weaponStats.missile.trackingMult[weaponConst.size] * weaponStats.accuracySpread, 		-- float: Degrees/second
		maxSpeedMultiplier = weaponStats.missile.trackingMult[weaponConst.size] * weaponStats.accuracySpread, 		-- float: For mode Acceleration, baseRotationSpeed becomes acceleration. This is the maximum rotation speed that may be reached.
		preferredAngle = 0, 		-- float: Degrees. Prefered facing angle from target. Useful for thinks like Skua's (90) and Herons (30) that want to face away from their target for broadsides and cool stuff like strafing.
		ignoreWorldUp = true 		-- bool: Good for Lights/Drones/Missiles. Allows this unit to turn upside down, sideways, etc. Looks stupid on most large ships such as Heavies and Capitals.
	},
	
	-- 🟦 TARGETING
	isTargeting        = true,
	targetingData      = {
		acquisition = {
			-- QUADTREE_AND_MACRO (Local stuff, and MacroTargets), QUADTREE_ONLY (Only local stuff, for turrets), MACRO_ONLY (Only MacroTargets, for Nukes), RAYCAST (by minimumDistance), RAYCAST_VELOCITY (bullets), SPHEREOVERLAP (flak, missiles, by minimumDistance), CAPSULEOVERLAP_VELOCITY, CAPSULEOVERLAP (by minimumDistance, and width as maximumDistance)
			type = "QUADTREE_ONLY",
			isFriendly = false, 			--Allowed to target units on the same team/alliance.
			isResourceMiner = false, 		--Allowed to target the Environmental team.
			acceptFirstValidTarget = false, 	--For launchers and things that don't need to actually target something. Shoot at the first thing you see.
			pauseIfHasTarget = false, 		--Don't look for a target again, until you're current one is dead. USE WITH canInvalidateTarget otherwise units WILL get stuck trying to shoot stuff out of their range.
			ignoreUncapturable = false, 		--If the target is uncapturable, ignore it.
			secondsPerScan = 1, 			-- float: How long to wait before reassessing what you're targeting.

			ignoreFullHealth = false, 		--Good for healers.
			minimumHealth = 0, 				-- float: Don't target things with less Max Health than this.
			minimumDistance = 0, 			-- float: Don't target things that are closer than this.
			maximumDistance = weaponStats.rangeMult[weaponConst.size] * weaponStats.missile.baseRetargetRange, 			-- float: Important. Scan radius. Don't target things further than this. KEEP THIS NUMBER LOW, SERIOUS PERFORMANCE IMPACT. Light ~15, Medium ~20, Heavy ~25, Capital ~25
			maximumAngle = 0, 				-- float: Good for spinal weapons/missiles.
			addedPreaimDistance = 1, 		-- float: If you have no target in maximumDistance, you may try to target something this far beyond max distance. (use on turrets, not ships)
			
			-- Scoring can be negative. Will invert behaviour.
			scoreForDistance = 1,    		-- float: (keep it at 1 change other score values). 1 unit distance = -1 score, means prioritise closer targets. Negative means prioritise farther targets.
			scoreForHealth = 0,      		-- float: Niche parameter, prioritise the biggest things, or smallest if negative.
			scoreForHealthCurrent = 0, 		-- float: Good for healers. 1 hp = 1 score
			scoreForHealthCurrentMissing = 0, 	-- float: Good for healers. 1 missing hp = 1 score.
			scoreForHealthCurrentPercentage = 0, -- float: Good for healers, good for spreading healing between units regardless of total health.
			scoreForArmour = 0,      		-- float: Good for anti-armour, if negative good for units with weapons that are better against raw hull. But can be misleading on it's own (*cough cough* GLADIATOR)
			scoreForArmourCurrent = 0, 		-- float: Good for anti-armour, if negative good for units with weapons that are better spent against raw hull.
			scoreForAngle = -1,       		-- float: Good for slow units and turrets that need to shoot things infront of them to minimise traverse.

			-- If scoreForX is not 0, clamp the X (eg. the enemy's health) to this perceived value. Useful for helping units put a floor and ceiling to how much they care about different stats.
			perceivedHealthMax = 0,			-- float: 
			perceivedHealthMin = 0,			-- float: 
			perceivedArmourMax = 0, 			-- float: Good for most units with scoreForArmour. If you have 20 damage don't worry if the target has more than 20 armour because it makes no difference you're doing no damage anyway.
			perceivedArmourMin = 0, 			-- float: Good for most units with scoreForArmour. If you have 20 piercing, you don't care if a target has less armour than that because you pierce it, only it if has more.
			perceivedDistanceMin = 5, 		-- float: Clamps the score for distance. Good in general. Keep at a fraction of your maximumDistance. Once a target is within normal firing range it's good to keep the target and not prioritise other things just because they're closer.

			-- Target class priority.
			-- Vital for unit behaviour. -1 = ignore.
			-- Multiplies the target score by this.
			classMultMissile = -1,	-- float: 
			classMultDrone = -1,	-- float: 
			classMultLight = .1,		-- float: 
			classMultMedium = .5,	-- float: 
			classMultHeavy = 1,	-- float: 
			classMultCapital = 0.7,	-- float: 
			classMultTitan = 0.5,	-- float: 

			--Multiplied against score at the end.
			shipMultiplier = 1.0, 			-- float: Priority for ships.
			structureMultiplier = 1.0, 		-- float: Priority for structures.
			keepTargetMultiplier = 2, 		-- float: Important. Allows the unit to keep it's current target, and not bounce between things.
			scoreBandingSize = 3,			-- float: Allows the targeter to pick a random target within bands. Useful for PD and AOE, but requires a high keep target to prevent schizophrenia.
		},
		tracking = {
			positionPredictionType = "MISSILE", --Algorithm for predicting target position. NONE (lasers, most ships), SIMPLE (bad, nothing uses this), TRIGONOMETRIC (spinal ships, turrets, missiles)
			predictionVelocityOveride = 3, 	-- float: The speed of the thing we want to hit our target with. For bullets use weapon unitsPerSecond. EG. An Untresnafol has this set to the launch velocity of it's bullet.
			doAimingComputation = false,   	-- For weapons.
			canInvalidateTarget = false,  	-- For units using pauseIfHasTarget.
			invalidationDistance = 0,		-- float: 
			invalidationAngle = 0,        	-- float: Radians
			invalidationVelocityHeadOn = 0 	-- float: For tractor ships,
		}
	},

	-- 🟥 PAYLOAD (AOE, for missiles, flak, etc.)
	hasPayload = false,
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
			maximumDegrees = 360, 	--Degrees from forward that units can be hit. Weapons spawn AOE's facing the same direction as them.
			radiusOuter = weaponStats.missile.baseAOE * weaponStats.rangeMult[weaponConst.size], 		--A tolly is 0.4 units long.
			radiusInner = weaponStats.missile.baseAOE * weaponStats.rangeMult[weaponConst.size] / 2
		}
	},
}
