
return {
	id = 3295720,
	name = "Self Heal",
	blurb = "",
	metaNote = "heal when child lives",
	hideInDatabank = true,
	displayType = "NORMAL", -- NORMAL, DRONE

	weapon = {
		-- Firing behaviour
		weaponType = "LASER",
		alwaysfire = false,
		magdump = false,
		necrofire = false,
		active = true,
		oneuse = false,
		exemptFromRangeSanityChecks = true,
		rangeInUnits = 30,
		maximumAngleToTargetDegrees = 0,
		unitsPerSecond = 0,
		velocityStd = 0,
		spreadDegrees = 0,
		spreadType = "BELLCURVE",
		forceRaycastDirectlyToTarget = false,
		lockTime = 0,
		simultaniousObjectLimit = 0,
		DontReloadWhileActiveObjects = false,
		forbidOrphanedObjects = false,

		-- Damage
		damageData = {
			targetsFriendly = true,
			ignoreResistances = true,
			instances = 0,
			damage = 0,
			piercing = 0,
			shred = 0,
			heat = 0,
			vulnerability = 0,
			decloak = false,
			targetingPriorityMultiplier = 0,
			impulseForce = 0,
		},

		-- Self-effects and restrictions
		selfHealRatio = 0,
		selfDamage = math.abs(1) * -.1,
		selfHeat = 0,
		selfImpulseForce = 0,
		isNonDecloaking = true,

		-- Area effects
		isAreaOfEffect = false,

		-- Audio and visuals
		sfxID = 0,
		SFXIntensity = 0,
		sizeInUnits = 0,
		lifetime = 0,
		impactSize = 0,
		impactDuration = 0,
		disableImpactEffect = true,
		disableImpactFlash = true,
		impactColour = { 0, 0, 0, 0 },
		impactFresnelStrength = 0,
		disableImpactSizeVariance = false,
		snapUnitDeathExplosionToImpactPosition = false,
		impactEffectType = "EXPLOSION",
		laserDescription = {
			duration = 0.45,
			opacity = 0,
			fadeCurve = 0,
			diameter = 0.67,
			offset = 0,
			rotateZ = false,
			rotateZUpdate = false,
			rotateZUpdatesPerSecond = 0,
			noRescaleLength = 0,
			noFade = false,
			noShrink = false,
		},
		lasersPerShot = 0,
		barrelCount = 0,
		barrelSpacing = 0,
		virtualBarrelOffset = { 0, 0, 0 },
		barrelIndexCurrent = 0,

		-- Spawn behaviour
		spawnID = 0,
		checkForWaypoints = false,
		ignoreRootVelocity = false,
		setAutoWaypointTargetToWeaponTarget = false,
		setAutoWaypointPositionToWeaponTarget = false,

		-- Cycle and magazine
		reloadAmount = 0,
		secondsPerCycle = .1,
		secondsPerCycleCurrent = 0,
		shotsPerCycle = 1,
		shotsPerCycleCurrent = 0,
		simultaniousShots = 0,
		minBurstSize = 0,
		secondsPerShot = 0,
		secondsBetweenBursts = 0,
		secondsPerShotCurrent = .01,
	},
	targeting = {
		acquisition = {
			type = "QUADTREE_ONLY",
			isFriendly = true,
			pauseIfHasTarget = true,
			targetOnlySpecialType = 3291005,
			secondsPerScan = .1,
			maximumDistance = .5,
		},
		tracking = {
			positionPredictionType = "NONE",
		},
	},
}