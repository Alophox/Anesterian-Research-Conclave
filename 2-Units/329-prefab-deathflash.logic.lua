-- dimensions is {x,y,z}
function prefab.part.deathflash_shell(scaleConst, dimensionMultipliers, time)
	-- local dimensions = {scaleConst * dimensionMultipliers[1],scaleConst * dimensionMultipliers[2],scaleConst * dimensionMultipliers[3]}
	local prefab_part = {
		name = "deathflash container",
		scale = {1.5,1.5,1.5},
		rotate = {
			timeStepSeconds =time/10,             -- decimal
			degreeRotationPerSecond = { 0,0,25 }, -- decimals (x,y,z)
		},

		parts={

		}
	}
	for i=1, time*5 do
		table.insert(prefab_part.parts,prefab.part.deathflash(scaleConst, functions.randomPointOnOvaloid(dimensionMultipliers) ,time))
	end

	return prefab_part
end

function prefab.part.deathflash(scaleConst, position, time)
	local deathflashSize = math.random() * .3 * math.sqrt(scaleConst) + .05
	local prefab_part = {
		name = "deathflash",
		-- mesh                    	= "329-Missiles/Missile-1-Zerda",   -- string: Visual body of this unit. Requires materials to be visible. FileName/ObjectName, looks for FileName.glb and then ObjectName from within that.
		-- materials                   = { "329_MT_arc_hull","329_MT_arc_teamColour","329_MT_arc_engine","329_MT_arc_hull_dark","329_MT_arc_teamGlow" },

		-- Geometry
		position = position,
		rotation = { 0, 0, 0 },
		scale = { .1, .1, .1 },

		-- Behaviours
		weapon = {
			weaponID = 0,
			targetRootUnit = true,
			turnInstant = true, --bool: Ignore turn speed, snap to target. (Beam Spire, point defence)
			mountAngles = { -- Weapon's firing angles in degrees. Won't aquire targets outside this field of view.
				left = 180, --float:
				right = 180,--float:
				up = 90,	 --float:
				down = 90  --float:
			},
			weaponData = {

				-- Firing behaviour
				weaponType = "PUREHIT",
				alwaysfire = true,
				magdump = false,
				necrofire = true,
				active = false,
				oneuse = false,
				rangeInUnits = scaleConst,
				forceRaycastDirectlyToTarget = true,

				damageData = {
					targetsFriendly = true,
				},

				-- Audio and visuals
				sfxID = 0,
				SFXIntensity = 0,
				sizeInUnits = deathflashSize,
				lifetime = deathflashSize,
				impactSize = deathflashSize,
				impactDuration = deathflashSize,
				disableImpactEffect = false,
				disableImpactFlash = false,
				-- impactColour = { 1, .5, 1, .1 },
				impactFresnelStrength = .1,
				disableImpactSizeVariance = false,
				snapUnitDeathExplosionToImpactPosition = false,
				impactEffectType = "EXPLOSION",
				laserDescription = {
					duration = 0.5,
					opacity = 0,
					fadeCurve = 0,
					diameter = 0.1,
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


				-- Cycle and magazine
				reloadAmount = 0,
				secondsPerCycle = 1+math.random() * (time/2),
				secondsPerCycleCurrent = math.random()*time,
				shotsPerCycle = 1,
				shotsPerCycleCurrent = 0,
				simultaniousShots = 0,
				minBurstSize = 0,
				secondsPerShot = 0,
				secondsBetweenBursts = 0,
				secondsPerShotCurrent = 0,
			},
		},
	}
	return prefab_part

end