
function prefab.part.rift(pos, rot, sca, scaCo, isGhost, ghostIndex)
	if isGhost then
		return {}
	end
	if(ghostIndex==nil) then ghostIndex=0 end
	if(ghostIndex > 2) then return {}; end
	if(not isGhost and ghostIndex > 0) then return {}; end
	prefab_part = {
		name = "Rift Base",
		rotation = rot,
		position = pos,
		scale = sca,
		rotate = {
			timeStepSeconds = .01,             -- decimal
			degreeRotationPerSecond = { .1,.1,.1 }, -- decimals (x,y,z)
		},
		parts = {
			{
				name = "Rift",
				mesh = "329-Rift/Rift",
				materials = { "329_MT_arc_rift-red" },
				rotation = {0,0,0},
				position = {0,0,0},
				scale = {1,1,1},
				rotate = {
					timeStepSeconds = .01,             -- decimal
					degreeRotationPerSecond = { 1,0,0 }, -- decimals (x,y,z)
				},
				parts={
					prefab.part.riftparticles({1,0,0}, scaCo),

					-- {
					-- 	name     = "Particles",
					-- 	position = { 0, .001, .001 },
					-- 	rotation = { 0, 0, 0 },
					-- 	scale 	= { 1, 1, 1 },

					-- 	-- particleEmitter = {
					-- 	-- 	particleType = "PARTICLE",        -- enum EMITTERTYPE -- PARTICLE, RIBBON, PULSE
					-- 	-- 	distancePerParticle = .000001,       -- decimal
					-- 	-- 	minSecondsPerParticle = 9999999,     -- decimal
					-- 	-- 	ejectionVelocity = .2*scaCo,             -- decimal
					-- 	-- 	ejectionVelocityAwayFromEmitter = true, -- bool
					-- 	-- 	randomRadius = .01,                 -- decimal
					-- 	-- 	randomScaleMinFraction = 1,       -- decimal
					-- 	-- 	startDisabled = false,            -- bool
					-- 	-- 	stateToggleTrigger = "None",      -- enum EMITTERSTATETRIGGER
					-- 	-- 	colourStart = {1,0,0},            -- decimals
					-- 	-- 	colourEnd   = {1,0,0},            -- decimals
					-- 	-- 	opacity     = .1,                  -- decimal
					-- 	-- 	scaleStart  = .3*scaCo,                  -- decimal
					-- 	-- 	scaleEnd    = 0,                  -- decimal
					-- 	-- 	lifetime    = 2.5,                  -- decimal
					-- 	-- },

						
						
					-- },
					-- {
					-- 	name = "Rift",
					-- 	mesh = "329-Rift/Rift-Wireframe",
					-- 	materials = { "329_MT_arc_rift-red" },
					-- 	rotation = {0,0,0},
					-- 	position = {0,0,0},
					-- 	scale = {1,1,1},
					-- },
					{
						name = "Rift",
						mesh = "329-Rift/Rift",
						materials = { "329_MT_arc_rift-blue" },
						rotation = {0,0,0},
						position = {0,0,0},
						scale = {1,1,1},
						rotate = {
							timeStepSeconds =.01,             -- decimal
							degreeRotationPerSecond = { 0,1,0 }, -- decimals (x,y,z)
						},
						parts={
							prefab.part.riftparticles({0,0,1}, scaCo),

							-- {
							-- 	name     = "Particles",
							-- 	position = { 0, .001, .001 },
							-- 	rotation = { 0, 0, 0 },
							-- 	scale 	= { 1, 1, 1 },

							-- 	particleEmitter = {
							-- 		particleType = "PARTICLE",        -- enum EMITTERTYPE -- PARTICLE, RIBBON, PULSE
							-- 		distancePerParticle = .000001,       -- decimal
							-- 		minSecondsPerParticle = 9999999,     -- decimal
							-- 		ejectionVelocity = .2*scaCo,             -- decimal
							-- 		ejectionVelocityAwayFromEmitter = true, -- bool
							-- 		randomRadius = .01,                 -- decimal
							-- 		randomScaleMinFraction = 1,       -- decimal
							-- 		startDisabled = false,            -- bool
							-- 		stateToggleTrigger = "None",      -- enum EMITTERSTATETRIGGER
							-- 		colourStart = {0,0,1},            -- decimals
							-- 		colourEnd   = {0,0,1},            -- decimals
							-- 		opacity     = .1,                  -- decimal
							-- 		scaleStart  = .25*scaCo,                  -- decimal
							-- 		scaleEnd    = 0,                  -- decimal
							-- 		lifetime    = 2,                  -- decimal
							-- 	},
								
							-- },
							-- {
							-- 	name = "Rift",
							-- 	mesh = "329-Rift/Rift-Wireframe",
							-- 	materials = { "329_MT_arc_rift-blue" },
							-- 	rotation = {0,0,0},
							-- 	position = {0,0,0},
							-- 	scale = {1,1,1},
							-- },
							{
								name = "Rift",
								mesh = "329-Rift/Rift",
								materials = { "329_MT_arc_rift-green" },
								rotation = {0,0,0},
								position = {0,0,0},
								scale = {1,1,1},
								rotate = {
									timeStepSeconds = .01,             -- decimal
									degreeRotationPerSecond = { 0,0,1 }, -- decimals (x,y,z)
								},
								parts={
									prefab.part.riftparticles({0,1,0}, scaCo),
									-- {
									-- 	name     = "Particles",
									-- 	position = { 0, .001, .001 },
									-- 	rotation = { 0, 0, 0 },
									-- 	scale 	= { 1, 1, 1 },

									-- 	particleEmitter = {
									-- 		particleType = "PARTICLE",        -- enum EMITTERTYPE -- PARTICLE, RIBBON, PULSE
									-- 		distancePerParticle = .000001,       -- decimal
									-- 		minSecondsPerParticle = 9999999,     -- decimal
									-- 		ejectionVelocity = .2*scaCo,             -- decimal
									-- 		ejectionVelocityAwayFromEmitter = true, -- bool
									-- 		randomRadius = .01,                 -- decimal
									-- 		randomScaleMinFraction = 1,       -- decimal
									-- 		startDisabled = false,            -- bool
									-- 		stateToggleTrigger = "None",      -- enum EMITTERSTATETRIGGER
									-- 		colourStart = {0,1,0},            -- decimals
									-- 		colourEnd   = {0,1,0},            -- decimals
									-- 		opacity     = .1,                  -- decimal
									-- 		scaleStart  = .25*scaCo,                  -- decimal
									-- 		scaleEnd    = 0,                  -- decimal
									-- 		lifetime    = 2,                  -- decimal
									-- 	},
										
									-- },
									-- {
									-- 	name = "Rift",
									-- 	mesh = "329-Rift/Rift-Wireframe",
									-- 	materials = { "329_MT_arc_rift-green" },
									-- 	rotation = {0,0,0},
									-- 	position = {0,0,0},
									-- 	scale = {1,1,1},
									-- },
								}
							}
						}
					}
					
				}
			}
		}
		
	}
	-- if isGhost then
	-- 	prefab_part.materials = {"329_MT_arc_"..ghostIndex.."_"..ghostMat,"329_MT_arc_"..ghostIndex.."_"..ghostMat,"329_MT_arc_"..ghostIndex.."_"..ghostMat,"329_MT_arc_"..ghostIndex.."_"..ghostMat,}
	-- end
    return prefab_part
end


function prefab.part.riftparticles(color, scaCo)
	return {
		name = "particles",
		position = {0, 0,0},
		rotation = {0,0,0},
		staticEmitter = {                           -- table
			particleType = "PARTICLE",                     -- enum<STATICEMITTERTYPE>; default: "PULSE"
														-- values: PARTICLE, PULSE
			simulationSpace = "Local",                  -- enum<EMITTERSIMULATIONSPACE>; default: "Local"
														-- values: World, Local
			secondsPerEmission = .1,                     -- float; default: 1
			operationDurationSeconds = 0,               -- float; default: 0
			ejectionVelocity = -.1*scaCo,                       -- float; default: 0
			ejectionSpeedVariation = 0,                 -- float; default: 0
			ejectionDirection = "AwayFromEmitter",              -- enum<PARTICLEEJECTIONDIRECTION>; default: "Forward"
														-- values: Forward, AwayFromEmitter
			inheritEmitterVelocity = false,             -- boolean; default: false
			inheritEmitterAngularVelocity = false,      -- boolean; default: false
			volumeShape = "SphereShell",                -- enum<EMITTERVOLUMESHAPE>; default: "SphereShell"
														-- values: SphereShell, CylinderAnnulus
			innerRadius = 0.1, --.5*scaCo,                            -- float; default: 0
			outerRadius = 0.1, --.5*scaCo,                            -- float; default: 0
			minimumHeight = 0,                          -- float; default: 0
			maximumHeight = 0,                          -- float; default: 0
			vortexMotion = {                            -- table
				axisLocal = { 0, -1, 0 },                                    -- int array { value, ... }; default: { 0, 1, 0 }
				rotationDegreesPerSecond = { minimum = -60, maximum = 60 },    -- int array { value, ... }; default: { minimum = 0, maximum = 0 }
				climbUnitsPerSecond = { minimum = 0, maximum = 0 },         -- int array { value, ... }; default: { minimum = 0, maximum = 0 }
				radialUnitsPerSecond = { minimum = 0, maximum = 0 },        -- int array { value, ... }; default: { minimum = 0, maximum = 0 }
			},
			requiredVelocityAlignmentDegrees = 0,       -- float; default: 0
			randomScaleMinFraction = 0,                 -- float; default: 0
			startDisabled = false,                      -- boolean; default: false
			stateToggleTrigger = "None",                -- enum<EMITTERSTATETRIGGER>; default: "None"
														-- values: None, OnDeath
			colourStart = color,                  -- float3 { x, y, z }; default: { 0, 0, 0 }
			colourEnd = color,                    -- float3 { x, y, z }; default: { 0, 0, 0 }
			opacity = .1,                                -- float; default: 0
			scaleStart = .1*scaCo,                             -- float; default: 0
			scaleEnd = 0,                               -- float; default: 0
			lifetime = 6,                               -- float; default: 0
		}
	}
end

function prefab.part.gatewayparticles(color)
	return {
		name = "particles",
		position = {0, .37,0},
		rotation = {0,0,0},
		staticEmitter = {                           -- table
			particleType = "PARTICLE",                     -- enum<STATICEMITTERTYPE>; default: "PULSE"
														-- values: PARTICLE, PULSE
			simulationSpace = "Local",                  -- enum<EMITTERSIMULATIONSPACE>; default: "Local"
														-- values: World, Local
			secondsPerEmission = 1,                     -- float; default: 1
			operationDurationSeconds = 0,               -- float; default: 0
			ejectionVelocity = 0,                       -- float; default: 0
			ejectionSpeedVariation = 0,                 -- float; default: 0
			ejectionDirection = "Forward",              -- enum<PARTICLEEJECTIONDIRECTION>; default: "Forward"
														-- values: Forward, AwayFromEmitter
			inheritEmitterVelocity = false,             -- boolean; default: false
			inheritEmitterAngularVelocity = false,      -- boolean; default: false
			volumeShape = "CylinderAnnulus",                -- enum<EMITTERVOLUMESHAPE>; default: "SphereShell"
														-- values: SphereShell, CylinderAnnulus
			innerRadius = 0,                            -- float; default: 0
			outerRadius = 0,                            -- float; default: 0
			minimumHeight = 0,                          -- float; default: 0
			maximumHeight = 0,                          -- float; default: 0
			vortexMotion = {                            -- table
				axisLocal = { 0, -1, 0 },                                    -- int array { value, ... }; default: { 0, 1, 0 }
				rotationDegreesPerSecond = { minimum = -60, maximum = 60 },    -- int array { value, ... }; default: { minimum = 0, maximum = 0 }
				climbUnitsPerSecond = { minimum = 2, maximum = 2 },         -- int array { value, ... }; default: { minimum = 0, maximum = 0 }
				radialUnitsPerSecond = { minimum = 1.15, maximum = 1.15 },        -- int array { value, ... }; default: { minimum = 0, maximum = 0 }
			},
			requiredVelocityAlignmentDegrees = 0,       -- float; default: 0
			randomScaleMinFraction = 0,                 -- float; default: 0
			startDisabled = false,                      -- boolean; default: false
			stateToggleTrigger = "None",                -- enum<EMITTERSTATETRIGGER>; default: "None"
														-- values: None, OnDeath
			colourStart = color,                  -- float3 { x, y, z }; default: { 0, 0, 0 }
			colourEnd = color,                    -- float3 { x, y, z }; default: { 0, 0, 0 }
			opacity = .1,                                -- float; default: 0
			scaleStart = 1,                             -- float; default: 0
			scaleEnd = 0,                               -- float; default: 0
			lifetime = 10,                               -- float; default: 0
		}
	}
end