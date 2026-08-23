weaponConst = {
	size = "L",
};
return {
     id = 3295003,
     name = "Vulpes Missile VLS",
     blurb = "Vulpes Vertical Launch System.",
     metaNote = "Used on Missile and Carrier variant ships",
     hideInDatabank = false,
     displayType = "NORMAL", -- NORMAL, DRONE

     weapon = {

          -- "Weapons" are EXTREMELY versatile and can perform all manner of operations from firing a laser, to launching drones, to being a bullet or missile impact.
          -- All missiles, bullets, and weapons in the game utilise these instructions to operate.
          -- Get creative, and you can do a frighteningly varied number of things with "weapons" on "units" (Splitting railgun bullets, Kasaba howitser, chain lightning, drone launching drones).
          
          -- NOTICE:
          -- All weapons will only fire if a target is found, is in range and angle, and has shots left.
          -- Alwaysfire ignores this, but still requires shots.
          -- HOWEVER, Aquisition types such as RAYCAST_VELOCITY will fire the weapon regardless of angle or range. 
          -- Most weapons will create an AOE explosion if isAreaOfEffect is enabled.
          -- All weapons will try to use a childed weaponVisual when firing. If there are multiple weaponVisuals, each shot it will use one in child order. (as a laser beam, or as a muzzle flash depending on how you configure the weaponVisual)

          weaponType = "LAUNCHER",
          
          -- LASER, raycast forward and damage the first thing you hit. Can do AOE/Damage. Uses weaponVisual as a beam.
          -- PUREHIT, directly damage the target. Can do AOE/Damage. Uses weaponVisual as a beam.
          -- LAUNCHER, spawn a unit by typeID with velocity among other things.
          -- WARHEAD, directly damages the target, and kill itself. (bullet, missile, etc)
          -- SPARKLER, spawn visual effects.
          -- TESLA, raycast forward, and spawns a unit by typeID at point of impact or termination. Can also spawn an AOE explosion if isAreaOfEffect or deal direct damage. Additionally use a weaponVisual as a beam.
          -- CONE_INSTANT, spawn an invisible explosion with damageData, and use a weaponVisual but forces length to 1.
          -- WARHEAD_TRIGGER, kills itself. (use with unit Payload for flak, AOE, mines, etc)
          -- EXPLODER, creates an AOE and optional explosion visual.

          --Fire Control 
          alwaysfire = false,           -- fire constantly if not disabled (good for SPARKLER effects, constant drones, deploying mines, etc, but can look dumb when there are no enemies)
          magdump = true,              -- always expend entire magazine, good for drone launchers to ensure the whole squadron is deployed. DAKKA DAKKA DAKKA DAKKA
          necrofire = false,            -- enable weapon on parent death (good for SPARKLER visual effects, among other things)
          active = true,                -- is the weapon online (for use with necrofire)
          oneuse = false,               -- destroy root unit when out of ammo, (for bullets, missiles, etc) (fires entire magazine then destroys the unit it's on)
          rangeInUnits = weaponStats.rangeMult[weaponConst.size] * weaponStats.missile.baseRange,            -- Target must be within range, for gun to fire.
          maximumAngleToTargetDegrees = 179.90874767107849,   -- Radians, target must be within angle for gun to fire.
          unitsPerSecond = 2,           -- projectile velocity for LAUNCHER in 100m/s
          spreadDegrees = 0,          -- Radians, spread for LAUNCHER (machine guns, etc)
          spreadType = "BELLCURVE",       -- Spread style. BELLCURVE (more in the center), RANDOM 
          forceRaycastDirectlyToTarget = false, -- LASERS, forces the laser to hit it's intended target even if the turret is not looking perfectly at it. (Important for PD weapons, and most laser weapons)
          lockTime = 0,                 -- Seconds this weapon must have the same target before it can fire.
          simultaniousObjectLimit = 0,  -- LAUNCHER, used for Drones, mines, etc. 0 = no limit.

          --Damage Data
          damageData = {
			isNondamaging = false,
			instances = 1,
			damage = 0,
			piercing = 0,
			shred = 0,
			heat = 0,
			vulnerability = 0,
			decloak = 1.0,
			targetingPriorityMultiplier = 0,
			impulseForce = 50.
		},

          

          --Self Effects
          selfHealRatio = 0,       -- heal parent by this fraction of damage dealt. // I don't know why this is like this.
          selfDamage = 0,          -- damage done to root unit per shot.
          selfHeat = 0,            -- heat done to root unit per shot.
          selfImpulseForce = 0,              -- Force applied opposite the firing direction.
          dontFireBelowHealthFraction = 0,   -- hold fire if parent health falls below this threshold
          resumeFireAboveHealthFraction = 0, -- resume fire if parent health exceeds this threshold
          dontFireAboveHeatFraction = 0,     -- hold fire if parent heat exceeds this threshold
          resumeFireBelowHeatFraction = 0,   -- resume fire if parent heat falls below this threshold
          isResourceMiner = false,           --Is allowed to target the Environmental team.
          
          isPiercing = false,       -- Allows the laser/bullet to pierce through targets they believe they have killed. Weapon will reduce it's damage. Lasers will damage the next target on their raycast. Incompatible with AOE on warheads
          piercingThreshold = 0,   -- Must have MORE than this much damage remaining after piercing in order to continue piercing. (Prevents scenarios where a super laser murders a capital ship then does 2 damage to a Tolly on the other side)

          -- AOE
          isAreaOfEffect = false;
          aoeData = {
               maximumDegrees = 360,    --Degrees from forward that units can be hit. Weapons spawn AOE's facing the same direction as them.
               radiusOuter = 1,         --Damage drops off to 0 at outer. Linear scale. A tolly is 0.4 units
               radiusInner = 0.5          --Full damage to units within inner.
          },

          --Audio
		sfxID = weaponStats.missile.sfxID,               --int, id of the audio to play when this weapon fires.
		SFXIntensity = weaponStats.SFXIntensity[weaponConst.size],      --float, controls how far the sound reaches, and how important it is.

          --Visuals
          sizeInUnits = 1,         --Controls laser width, 
          lifetime = 1,            --Controls how long the laser lasts,
          impactSize = 1,          --For LASERS, TESLA, controls the size of the impact effect.
          impactDuration = 0.5,    --Seconds, controls how long the impact effect lasts.
          disableImpactEffect = false,  --As on the tin.
          disableImpactFlash = true,    --Prevents the bright white explosion core.
          impactEffectType = "EXPLOSION"; --EXPLOSION, EXPLOSION_LOWPOLY, SHOCKWAVE, FLASH, FLAK, SPARKS, FISHEXPLOSION, WARP

          --Laser Visuals defaults.
          --If a laserDescription part is tagged as "use parent laserDescription" then it will use this.
          laserDescription = { 		--"laser" description, but is actually a maleable visual effect.
                              duration = 1,			--seconds
                              opacity = 2,			--float, 0-1
                              diameter = 1,			--relative to turret scale
                              offset = 0,			--relative to the barrel it gets fired from's facing.
                              rotateZ = true,		--Rotate the effect once randomly on the z axis when used.
                              rotateZUpdate = false,	--Continuously rotate the effect on the z axis when used.
                              noRescaleLength = 0,	--0 means DO rescale like a laser beam. >0 means don't, like a muzzle flashes.
                              noFade = true,			--prevents the effect from fading to nothing over it's duration.
                              noShrink = false,		--prevents the effect from scaling down to nothing over it's duration.
                              }, 
          lasersPerShot = 1, --How many "weaponVisualConfig parts" to use at once. For having multiple laser/muzzle effects at the same time. (reminder that each WVC can define it's own laserDescription)


          --"Virtual Barrels : Overriden by real barrels
          --Useful to save time if your weapon is part of the unit's mesh and already positioned where it's going to fire from. (tolly)
          barrelCount = 0;                   --
          barrelSpacing = 0,                 --Horizontal (x) spacing. Virtual barrels are always in a horizontal line.
          virtualBarrelOffset = {0,0,0},     --XYZ, offset your barrels.
          barrelIndexCurrent = 0,            --Controls which barrel (in child order) the weapon will start with.

          --LAUNCHER / TESLA Controls
          spawnID = 3294003,       --unit typeID
          arrivalData = {
               type           = "CONSTRUCT",    --NONE, ARRIVE, DEPART, CONSTRUCT, LAUNCH, WARP
               -- arrivalDuration= 1.0,
               -- approachSpeed  = 5.0,
               keepDisabled   = false,
               },
          checkForWaypoints = false,                    --units spawned from this weapon will follow any waypoint they spawn in.
          ignoreRootVelocity = false,                   --Launched units inherit the velocity of their launcher. You can prevent this here.
          setAutoWaypointTargetToWeaponTarget = true,  --Useful for drones, missiles, in order to get them to go towards the root unit's target.

          --Reload time
          
          -- reloadAmount controls both partial reloading, and hot-reloading. 
          -- 0 = normal behaviour. Try to reload the entire shotsPerCycle when not firing.
          -- > 0 : reload a set amount at a time, cannot be interupted. Starts reloading the moment shotsPerCycleCurrent < shotsPerCycle
          -- < 0 : reload a set amount at a time, interupted when firing. The moment the weapon fires, will reset the secondsPerCycleCurrent to secondsPerCycle.
		reloadAmount = 0,             --Normal weapons use 0, aka full
		secondsPerCycle = weaponStats.missile.baseCD * weaponStats.CDMult[weaponConst.size] + weaponStats.CDMod[weaponConst.size] - weaponStats.missile.secondsPerShot*(weaponStats.missile.shotsPerBurst[weaponConst.size] - 1),        --Seconds per reload. Negative value prevent reloading (limited ammo weapons).
		secondsPerCycleCurrent = 0,   --Starting delay. Good if you don't want your bomber launching bombs the moment it spawns.

		--Magazine Size
		shotsPerCycle = weaponStats.missile.shotsPerBurst[weaponConst.size],            --Shots per reload, ATS will ensure this number is always at least 1.
		shotsPerCycleCurrent = weaponStats.missile.shotsPerBurst[weaponConst.size],     --Starting shots in the clip.
		simultaniousShots = 1,        --How many shots we can make at once. (shotgun, cluster bomb)

		--Fire Rate
		secondsPerShot = weaponStats.missile.secondsPerShot,           --Delay between shots.
          secondsPerShotCurrent = 0,    --Starting delay.

     },

     -- Same definition as used by units.
     targeting = {
          acquisition = {
               -- QUADTREE_AND_MACRO (Local stuff, and MacroTargets), QUADTREE_ONLY (Only local stuff, for turrets), MACRO_ONLY (Only MacroTargets, for Nukes), RAYCAST (by minimumDistance), RAYCAST_VELOCITY (bullets), SPHEREOVERLAP (flak, missiles, by minimumDistance), CAPSULEOVERLAP_VELOCITY, CAPSULEOVERLAP (by minimumDistance, and width as maximumDistance)
               type = "QUADTREE_ONLY",
               isFriendly = false, 			--Allowed to target units on the same team/alliance.
               isResourceMiner = false, 		--Allowed to target the Environmental team.
               acceptFirstValidTarget = true, 	--For launchers and things that don't need to actually target something. Shoot at the first thing you see.
               pauseIfHasTarget = false, 		--Don't look for a target again, until you're current one is dead. USE WITH canInvalidateTarget otherwise units WILL get stuck trying to shoot stuff out of their range.
               ignoreUncapturable = false, 		--If the target is uncapturable, ignore it.
               secondsPerScan = 1.5, 			--How long to wait before reassessing what you're targeting.

               ignoreFullHealth = false, 		--Good for healers.
               minimumHealth = 0, 				--Don't target things with less Max Health than this.
               minimumDistance = 0, 			--Don't target things that are closer than this.
               maximumDistance = weaponStats.fireRangeMult * weaponStats.rangeMult[weaponConst.size] * weaponStats.missile.baseRange, 			--Important. Scan radius. Don't target things further than this. KEEP THIS NUMBER LOW, SERIOUS PERFORMANCE IMPACT. Light ~15, Medium ~20, Heavy ~25, Capital ~25
               maximumAngleDegrees = 0, 				--Good for spinal weapons/missiles.
               addedPreaimDistance = 1, 		--If you have no target in maximumDistance, you may try to target something this far beyond max distance. (use on turrets, not ships)
               
               -- Scoring can be negative. Will invert behaviour.
               scoreForDistance = 1,    		--Foundational. NOTICE, VALUE IS INVERTED. Keep at 1. 1 unit distance = -1 score, means prioritise closer targets. Negative means prioritise farther targets.
               scoreForHealth = 0,      		--Niche parameter, prioritise the biggest things, or smallest if negative.
               scoreForHealthCurrent = 0, 		--Good for healers.
               scoreForHealthCurrentMissing = 0, 	--Good for healers. 1 missing hp = 1 score.
               scoreForHealthCurrentPercentage = 0, --Good for healers, good for spreading healing between units regardless of total health.
               scoreForArmour = 0,      		--Good for anti-armour, if negative good for units with weapons that are better against raw hull. But can be misleading on it's own (*cough cough* GLADIATOR)
               scoreForArmourCurrent = 0, 		--Good for anti-armour, if negative good for units with weapons that are better spent against raw hull.
               scoreForAngle = 0,       		--Good for slow units and turrets that need to shoot things infront of them to minimise traverse.

               -- If scoreForX is not 0, clamp the X (eg. the enemy's health) to this perceived value. Useful for helping units put a floor and ceiling to how much they care about different stats.
               perceivedHealthMax = 0,
               perceivedHealthMin = 0,
               perceivedArmourMax = 0, 			--Good for most units with scoreForArmour. If you have 20 damage don't worry if the target has more than 20 armour because it makes no difference you're doing no damage anyway.
               perceivedArmourMin = 0, 			--Good for most units with scoreForArmour. If you have 20 piercing, you don't care if a target has less armour than that because you pierce it, only it if has more.
               perceivedDistanceMin = 5, 		--Clamps the score for distance. Good in general. Keep at a fraction of your maximumDistance. Once a target is within normal firing range it's good to keep the target and not prioritise other things just because they're closer.

               -- Target class priority.
               -- Vital for unit behaviour. -1 = ignore.
               -- Multiplies the target score by this.
               classMultMissile = -1,
               classMultDrone = -1,
               classMultLight = 1,
               classMultMedium = 1,
               classMultHeavy = 0.5,
               classMultCapital = 0.2,
               classMultTitan = 0.1,

               --Multiplied against score at the end.
               shipMultiplier = 1.0, 			--Priority for ships.
               structureMultiplier = 1.0, 		--Priority for structures.
               keepTargetMultiplier = 2, 		--Important. Allows the unit to keep it's current target, and not bounce between things.
               scoreBandingSize = 0,			--Allows the targeter to pick a random target within bands. Useful for PD and AOE, but requires a high keep target to prevent schizophrenia.
          },
          tracking = {
               positionPredictionType = "NONE", --Algorithm for predicting target position. NONE (lasers, most ships), SIMPLE (bad, nothing uses this), TRIGONOMETRIC (spinal ships, turrets, missiles)
               predictionVelocityOveride = 0, 	--The speed of the thing we want to hit our target with. For bullets use unitsPerSecond. EG. An Untresnafol has this set to the launch velocity of it's bullet.
               doAimingComputation = true,   	--For weapons.
               canInvalidateTarget = false,  	--For units using pauseIfHasTarget.
               invalidationDistance = 0,
               invalidationAngleDegrees = 0,        	--Radians
               invalidationVelocityHeadOn = 0 	--For tractor ships,
          }
     },
}