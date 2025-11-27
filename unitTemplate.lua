-- #########################################
--
-- Note from dev Luke AP.
--
-- The modloader is half my work, and half GPT-Codex because I don't have the time. 
-- If something isn't working let me know.
-- 
-- Please refer to the example units, for comments explaining what different parameters do.
-- Though I apologise in advance if some comments or default values are unhelpful or misleading.
--
-- Last updated: 2025-11-25 17:04
--
-- #########################################

-- Unit template for modders. Fill in fields as needed.
-- TYPE GUIDE: 
--	int: 1 2 3 4 5 6
--	decimal: 1 24.7 0.998 2000 2000.5
--	string: "letters and stuff"
-- 	bool: true / false
--	table: { item, item, item, item } 
-- 	enum (list provided).
-- ENUMS:
--   DATABANKVISIBILITY: VISIBLE, HIDDEN, DISCOVER
--   UNITMACROTYPE: AUTO, TRUE, FALSE
--   UNITCLASS: NONE, MISSILE, DRONE, LIGHT, MEDIUM, HEAVY, CAPITAL, TITAN
--   VISUALEFFECTTYPE: EXPLOSION, EXPLOSION_LOWPOLY, SHOCKWAVE, FLASH, FLAK, SPARKS, FISHEXPLOSION, WARP, NONE, VOLTJUMP
--   ARRIVETYPE: NONE, ARRIVE, WARP
--   UNITMOVETYPE: MAPLOCKED, FREE
--   SHIPTURNMODE: Acceleration, Linear
--   TARGETINGTYPE: QUADTREE_AND_MACRO, QUADTREE_ONLY, MACRO_ONLY, RAYCAST, RAYCAST_VELOCITY, SPHEREOVERLAP, CAPSULEOVERLAP_VELOCITY, CAPSULEOVERLAP
--   TARGETPOSITIONPREDICTIONTYPE: NONE, SIMPLE, TRIGONOMETRIC, MISSILE
--   STRUCTURE_TYPE: NONE, ECONOMY, PRODUCTION, DEFENCE, OFFENCE, UTILITY, EXTENDER
--   EMITTERTYPE: PARTICLE, RIBBON, PULSE
--   EMITTERSTATETRIGGER: None, OnDeath
--   COMMAND_TYPE: NONE (extend if you add more)
--   MaterialBehaviour (materials files): NONE, HULL, GLOW, THRUSTER, TRANSPARENT, CONSTRUCTION
--   PISTONDIRECTION (piston): Up, Down, UpAndDown

return {

    -- Basic definitions (string/bool)
    unitName                    = "",          -- string: internal name
    unitDisplayName             = "",          -- string: display name
    unitTooltip                 = "",          -- string
    unitBlurb                   = "",          -- string
    unitBlurbExcludeFromTooltip = false,       -- bool
    hotkey                      = "",          -- string: single character
    picture                     = "",          -- string: filename (png/jpg in this folder)

    -- Databank entry
    databankEntry = {
        visibility                  = "VISIBLE", -- enum DATABANKVISIBILITY
        requiredLevelForVisible     = "",        -- string
        requiredLevelForDescription = "",        -- string
        tactical                    = "",        -- string
        description                 = "",        -- string
        weaponInfo                  = {          -- table of {int,int,int}
            -- { weaponID, count, subMunitionWeaponID }
        },
        relatedUnitIDs              = {},        -- int array
    },

    -- Body setup
    scale              = 1.0, -- decimal
    colliderDimensions = { widthMultiplier = 1, heightMultiplier = 1, lengthMultiplier = 1 }, -- decimals
    mainMesh           = "",   -- string "file/object"
    materials          = {},   -- string array; material listed by name. Fills in material slots on models in order.
    parts = {
        -- {
        --     name      = "",        -- string
        --     mesh      = "",        -- string
        --     materials = {},        -- string array
        --     position  = { 0,0,0 }, -- decimals
        --     rotation  = { 0,0,0 }, -- decimals
        --     scale     = { 1,1,1 }, -- decimals; Local scale of the part, in relation to the part it is on and the body scale.
        --     barrel    = false,     -- bool; weapons that are direct parents of this part, will spawn their units and place their weaponVisuals at the position of this component.
        --     turretBody= false,     -- bool
        --     weapon = {
        --         weaponID      = 0,        -- int
        --         turnSpeed     = 0,        -- decimal
        --         turnMode      = "Linear", -- enum SHIPTURNMODE
        --         turnInstant   = false,    -- bool
        --         useParentTarget = false,  -- bool
        --         useRootTarget   = false,  -- bool
        --         targetRootUnit  = false,  -- bool
        --         mountAngles   = { left = 0, right = 0, up = 0, down = 0 }, -- decimals
        --     },
        --     weaponVisualConfig = {
        --         laserColour = {1,1,1,1}, -- decimals (RGBA)
        --         intensity   = 1,         -- decimal
        --         useWeaponLaserDescription = false,
        --         laserDescription = {     -- decimals/bools
        --             duration = 0, opacity = 0, diameter = 0, offset = 0,
        --             rotateZ = false, rotateY = false, rotateZUpdate = false, rotateYUpdate = false,
        --             noRescaleLength = 0, noFade = false, noShrink = false,
        --         },
        --     },
        --     thruster = { decayTime = 0, workWhenThrustWithinAngleDegrees = 0 }, -- decimals
        --     autoModule = {
        --         moduleTypeID = 0,            -- int
        --         reportKillsToParent = false, -- bool
        --         doDamageToEntityOnDeath = false, -- bool
        --         damageToEntityOnDeath = {       -- damage table
        --             isNondamaging = false, instances = 1, damage = 0, piercing = 0,
        --             shred = 0, heat = 0, vulnerability = 0, decloak = 0,
        --             targetingPriorityMultiplier = 0, impulseForce = 0,
        --         },
        --     },
        --     particleEmitter = {
        --         particleType = "PARTICLE",        -- enum EMITTERTYPE
        --         distancePerParticle = 0.05,       -- decimal
        --         minSecondsPerParticle = 0.02,     -- decimal
        --         ejectionVelocity = 0,             -- decimal
        --         ejectionVelocityAwayFromEmitter = false, -- bool
        --         randomRadius = 0,                 -- decimal
        --         randomScaleMinFraction = 1,       -- decimal
        --         startDisabled = false,            -- bool
        --         stateToggleTrigger = "None",      -- enum EMITTERSTATETRIGGER
        --         colourStart = {1,1,1},            -- decimals
        --         colourEnd   = {1,1,1},            -- decimals
        --         opacity     = 1,                  -- decimal
        --         scaleStart  = 1,                  -- decimal
        --         scaleEnd    = 1,                  -- decimal
        --         lifetime    = 1,                  -- decimal
        --     },
        --     rotate = {
        --         timeStepSeconds = 0,             -- decimal
        --         degreeRotationPerSecond = { 0,0,0 }, -- decimals (x,y,z)
        --     },
        --     piston = {
        --         localDistanceUp = 0,              -- decimal
        --         direction = "Up",                 -- enum PISTONDIRECTION: Up/Down/UpAndDown
        --         startProgressFraction = 0,        -- decimal 0-1
        --         duration = 1,                     -- decimal (seconds)
        --     },
        --     visibility = {
        --         visibleInEditor = true,          -- bool
        --         visibleInGame   = true,          -- bool
        --     },
        --     vortex = false,                  -- bool: add AUVortexSetup
        --     aegisVisual = false,             -- bool: add AUAegisVisualSetup
        --     spawnerSpawnPoint = { code = 0 }, -- int
        --     parts = { }, -- child parts, which can contain their own components and children.
        -- },
    },

    -- Ghost visuals (for spawners/yards)
    ghostMesh      = "",   -- string
    ghostMaterials = {},   -- string array
    ghostParts     = {
        -- { name="", position={0,0,0}, rotation={0,0,0}, scale={1,1,1} }
    },

    -- Unit ID, faction, cost, macro
    data = {
        typeID       = 0,   -- int
        factionID    = 0,   -- int
        macroType    = "AUTO", -- enum UNITMACROTYPE
        cost_matter  = 0,   -- int
        cost_energy  = 0,   -- int
        cost_supply  = 0,   -- int
        cost_time    = 0,   -- decimal
        techRequired = 0,   -- int
    },

    -- Display/selection
    inEditor                 = true,         -- bool
    displayAreaRadius        = 0,            -- decimal
    displayAreaColour        = { 1,1,1,1 },  -- decimals
    autoColourElements       = true,         -- bool
    editorDontColour         = false,        -- bool
    elements                 = { doNotRecolourGlow = false }, -- bool
    scaleToHealth            = false,        -- bool
    scaleToHealthMinFraction = 0,            -- decimal

    -- Health & armor
    isShield = false, -- bool
    health = {
        unitClass                   = "NONE", -- enum UNITCLASS
        health                      = 0,      -- decimal
        health_regen_per_second     = 0,      -- decimal
        max_regen_frac              = 0,      -- decimal
        armour                      = 0,      -- decimal
        armour_regen_per_second     = 0,      -- decimal
        armour_max_regen_fraction   = 0,      -- decimal
        vulnerability_max           = 0,      -- decimal
        shredMultiplier             = 0,      -- decimal
        explosionSFX                = 0,      -- int
        explosionSFXIntensity       = 0,      -- decimal
        heatResistancePercentage    = 0,      -- decimal
        shredResistancePercentage   = 0,      -- decimal
        aegisMaximum                = 0,      -- decimal
        isResourceMatter            = false,  -- bool
        isResourceEnergy            = false,  -- bool
        isNonHealRequester          = false,  -- bool
        isUncapturable              = false,  -- bool
        ignoreImpulse               = false,  -- bool
        targetingPriorityMultiplier = 0,      -- decimal
        untargetableTime            = 0,      -- decimal
        phaseBlockFraction          = 0,      -- decimal
        lifetime                    = 0,      -- decimal
        explodeOnTimeout            = false,  -- bool
        explosionType               = "EXPLOSION", -- enum VISUALEFFECTTYPE
        explosionDamageRadiusMult   = 0,      -- decimal
        explosionSizeOveride        = 0,      -- decimal
        flashSizeOverride           = 0,      -- decimal
        forceShockwave              = false,  -- bool
        preventShockwave            = false,  -- bool
        preventExplosionSizeVariance = false, -- bool
        useDeathExplosionAOEDamage  = false,  -- bool
        deathExplosionAOE = { maximumDegrees = 0, radiusOuter = 0, radiusInner = 0, friendlyFire = false, waveSteps = 0, waveSeconds = 0 }, -- decimals/bools/ints
        deathExplosionDamage = { -- damage data decimals/ints
            isNondamaging = false, instances = 1, damage = 0, piercing = 0, shred = 0, heat = 0,
            vulnerability = 0, decloak = 0, targetingPriorityMultiplier = 0, impulseForce = 0
        },
        deathExplosionFriendlyFire        = false, -- bool
        deathUnitSpawnDoNotRandomiseRotation = false, -- bool
        deathUnitSpawnTypeID              = -1,   -- int
        invulnerable                      = false,-- bool
        unkillable                        = false,-- bool
        death_countdown                   = 0,    -- decimal
        mass                              = 0,    -- decimal
        densityMult                       = 1,    -- decimal
        tonnage                           = 0,    -- decimal
        ignoreInstaDeath                  = false,-- bool
        instaDeathThreshold               = 0,    -- decimal
        nonRefundable                     = false,-- bool
        alertPlayerOnDeath                = false,-- bool
    },

    -- Control flags
    controllable = false, -- bool
    unselectable = false, -- bool
    untargetable = false, -- bool
    unhittable   = false, -- bool

    -- Movement
    isMobile = false, -- bool
    movement = {
        type                         = "MAPLOCKED", -- enum UNITMOVETYPE
        maximumAngleToTarget         = 0,           -- decimal
        acceleration                 = 0,           -- decimal
        strafingAccelMultiplier      = 0,           -- decimal
        reverseAccelMultiplier       = 0,           -- decimal
        inertialCorrection           = false,
        isStrafing                   = false,
        alwaysThrust                 = false,
        standoffDistance             = 0,
        retreatDistance              = 0,
        strafeMargin                 = 0,
        useMinimumWorldYPosition     = false,
        minimumWorldYPosition        = 0,
        alwaysFaceCombatTarget       = false,
        GoToStructurePlaneForFinalWaypoint = false,
    },

    -- Rotation
    isRotating = false, -- bool
    rotation = {
        turnMode           = "Linear", -- enum SHIPTURNMODE
        baseRotationSpeed  = 0,        -- decimal
        maxSpeedMultiplier = 0,        -- decimal
        preferredAngle     = 0,        -- decimal
        ignoreWorldUp      = false,    -- bool
    },

    -- Repulsion
    isRepulsor    = false,
    isNotRepulsed = false,
    repulsion = {
        interactionLayer            = 0,      -- int
        weightOveride               = 0,      -- decimal
        colliderDimensionsOverride  = { 0,0,0 }, -- decimals
    },

    -- Targeting
    isTargeting = false,
    targetingData = {
        acquisition = {
            type                         = "QUADTREE_AND_MACRO", -- enum TARGETINGTYPE
            isFriendly                   = false,
            isResourceMiner              = false,
            acceptFirstValidTarget       = false,
            pauseIfHasTarget             = false,
            ignoreUncapturable           = false,
            ignoreNonHealRequester       = false,
            targetOnlySpecialType        = 0,    -- int
            secondsPerScan               = 0,    -- decimal
            ignoreFullHealth             = false,
            minimumHealth                = 0,
            minimumDistance              = 0,
            maximumDistance              = 0,
            maximumAngle                 = 0,
            addedPreaimDistance          = 0,
            scoreForDistance             = 0,
            scoreForHealth               = 0,
            scoreForHealthCurrent        = 0,
            scoreForHealthCurrentMissing = 0,
            scoreForHealthCurrentPercentage = 0,
            scoreForArmour               = 0,
            scoreForArmourCurrent        = 0,
            scoreForAngle                = 0,
            scoreForMountAngle           = 0,
            perceivedHealthMax           = 0,
            perceivedHealthMin           = 0,
            perceivedArmourMax           = 0,
            perceivedArmourMin           = 0,
            perceivedDistanceMin         = 0,
            classMultMissile             = 0,
            classMultDrone               = 0,
            classMultLight               = 0,
            classMultMedium              = 0,
            classMultHeavy               = 0,
            classMultCapital             = 0,
            classMultTitan               = 0,
            shipMultiplier               = 1.0,
            structureMultiplier          = 1.0,
            keepTargetMultiplier         = 1.0,
            scoreBandingSize             = 0,
        },
        tracking = {
            positionPredictionType   = "NONE", -- enum TARGETPOSITIONPREDICTIONTYPE
            predictionVelocityOveride= 0,
            doAimingComputation      = false,
            canInvalidateTarget      = false,
            invalidationDistance     = 0,
            invalidationAngle        = 0,
            invalidationVelocityHeadOn = 0,
            workOnNullEntity         = false,
        },
    },

    -- Payload (e.g. explosive missiles, flak) triggered on death such as from lifetime or a weapon with WARHEAD_TRIGGER. 
    -- Not for single-target bullets; use a weapon with WARHEAD.
    hasPayload = false,
    payload = {
        damage = {
            isNondamaging               = false,
            instances                   = 1,
            damage                      = 0,
            piercing                    = 0,
            shred                       = 0,
            heat                        = 0,
            vulnerability               = 0,
            decloak                     = 0,
            targetingPriorityMultiplier = 0,
            impulseForce                = 0,
        },
        areaEffect = {
            maximumDegrees = 0,
            radiusOuter    = 0,
            radiusInner    = 0,
            friendlyFire   = false,
            waveSteps      = 0,
            waveSeconds    = 0,
        },
    },

    -- Command
    isCommand  = false,
    commandType= "NONE", -- enum COMMAND_TYPE

    -- Structure
    isStructure                    = false,
    structureIgnoreInfluenceControl= false,
    structure = { -- occupation footprint.
        type             = "NONE", -- enum STRUCTURE_TYPE
        rectangle        = { 0,0 }, -- decimal, decimal
        ring             = { 0,0 }, -- decimal, decimal
        matrixDimensions = { 0,0 }, -- int, int
        matrix = {
            -- 0s and 1s, 1 being occupied space. 
		  -- Bellow example generates a cross, so long as matrixDimensions is 3,3 (3 wide, 3 high)
		  -- 0, 1, 0,
		  -- 1, 1, 1,
		  -- 0, 1, 0
        },
    },

    -- Influence
    isInfluencer = false,
    influence = {
        strength         = { 0,0 }, -- int, int
        rectangle        = { 0,0 }, -- decimal, decimal
        ring             = { 0,0 }, -- decimal, decimal
        matrixDimensions = { 0,0 }, -- int, int
        matrix = { -- control footprint
            -- 0s and 1s, 1 being occupied space. 
		  -- Bellow example generates a cross, so long as matrixDimensions is 3,3 (3 wide, 3 high)
		  -- 0, 1, 0,
		  -- 1, 1, 1,
		  -- 0, 1, 0
        },
    },

    -- Spawner (for yards etc.)
    isSpawner = false,
    spawner = {
        spawnOffset                   = { 0,0,0 }, -- decimals
        spawnOffsetHeightRandomisation= 0,         -- decimal
        endRotationUseStructureForward= false,     -- bool
        noUnitGhost                   = false,     -- bool
        usesToSelfdestruct            = 0,         -- int
        simultaneousUnitLimit         = 0,         -- int
        arrivalData = {
            type            = "NONE", 	-- enum ARRIVETYPE
            arrivalDuration = 0,     	-- decimal
            approachSpeed    = 0,     	-- decimal
            keepDisabled     = false, 	-- bool
        },
    },
    spawnItems = {
        -- { id=0, spawnTime=0, spawnTimeStart=0, spawnPointCode=0, spawnVelocity=0, ignoreWaypoints=false, heatPercentage=0, techID=0 }
    },

    -- Resources
    isGenerator = false,
    resourceGeneration = {
        matter = 0, -- decimal
        energy = 0, -- decimal
        phase  = 0, -- decimal
    },

    isCapacitor = false,
    resourceCapacity = {
        matter    = 0, -- int
        energy    = 0, -- int
        phase     = 0, -- int
        logistics = 0, -- int
    },

    -- Status / Aegis
    isStatusEffecter = false,
    isAegisEmitter   = false,
    aegisEmitter = {
        secondsPerPulse = 0, -- decimal
        radius          = 0, -- decimal
        strength        = 0, -- decimal
    },

    -- Tech unlock / projector
    isTechUnlocker = false,
    techUnlocks = {
        -- int tech IDs
    },

    isTechProjector = false,
    techProjector = {
        radius = 0, -- decimal
    },
    techProjectorItems = {
        -- { effectedUnitTypeID=0, effectCode=0 } -- ints
    },
}
