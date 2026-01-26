
function prefab.part.rift(pos, rot, sca, scaCo, isGhost, ghostIndex)
	if isGhost then
		return {}
	end
	if(ghostIndex==nil) then ghostIndex=0 end
	if(ghostIndex > 5) then return {}; end
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
				mesh = "Rift/Rift",
				materials = { "arc_rift-red" },
				rotation = {0,0,0},
				position = {0,0,0},
				scale = {1,1,1},
				rotate = {
					timeStepSeconds = .01,             -- decimal
					degreeRotationPerSecond = { 1,0,0 }, -- decimals (x,y,z)
				},
				parts={
					{
						name     = "Particles",
						position = { 0, .001, .001 },
						rotation = { 0, 0, 0 },
						scale 	= { 1, 1, 1 },

						particleEmitter = {
							particleType = "PARTICLE",        -- enum EMITTERTYPE -- PARTICLE, RIBBON, PULSE
							distancePerParticle = .000001,       -- decimal
							minSecondsPerParticle = 9999999,     -- decimal
							ejectionVelocity = .2*scaCo,             -- decimal
							ejectionVelocityAwayFromEmitter = true, -- bool
							randomRadius = .01,                 -- decimal
							randomScaleMinFraction = 1,       -- decimal
							startDisabled = false,            -- bool
							stateToggleTrigger = "None",      -- enum EMITTERSTATETRIGGER
							colourStart = {1,0,0},            -- decimals
							colourEnd   = {1,0,0},            -- decimals
							opacity     = .1,                  -- decimal
							scaleStart  = .3*scaCo,                  -- decimal
							scaleEnd    = 0,                  -- decimal
							lifetime    = 2.5,                  -- decimal
						},
						
					},
					-- {
					-- 	name = "Rift",
					-- 	mesh = "Rift/Rift-Wireframe",
					-- 	materials = { "arc_rift-red" },
					-- 	rotation = {0,0,0},
					-- 	position = {0,0,0},
					-- 	scale = {1,1,1},
					-- },
					{
						name = "Rift",
						mesh = "Rift/Rift",
						materials = { "arc_rift-blue" },
						rotation = {0,0,0},
						position = {0,0,0},
						scale = {1,1,1},
						rotate = {
							timeStepSeconds =.01,             -- decimal
							degreeRotationPerSecond = { 0,1,0 }, -- decimals (x,y,z)
						},
						parts={
							{
								name     = "Particles",
								position = { 0, .001, .001 },
								rotation = { 0, 0, 0 },
								scale 	= { 1, 1, 1 },

								particleEmitter = {
									particleType = "PARTICLE",        -- enum EMITTERTYPE -- PARTICLE, RIBBON, PULSE
									distancePerParticle = .000001,       -- decimal
									minSecondsPerParticle = 9999999,     -- decimal
									ejectionVelocity = .2*scaCo,             -- decimal
									ejectionVelocityAwayFromEmitter = true, -- bool
									randomRadius = .01,                 -- decimal
									randomScaleMinFraction = 1,       -- decimal
									startDisabled = false,            -- bool
									stateToggleTrigger = "None",      -- enum EMITTERSTATETRIGGER
									colourStart = {0,0,1},            -- decimals
									colourEnd   = {0,0,1},            -- decimals
									opacity     = .1,                  -- decimal
									scaleStart  = .25*scaCo,                  -- decimal
									scaleEnd    = 0,                  -- decimal
									lifetime    = 2,                  -- decimal
								},
								
							},
							-- {
							-- 	name = "Rift",
							-- 	mesh = "Rift/Rift-Wireframe",
							-- 	materials = { "arc_rift-blue" },
							-- 	rotation = {0,0,0},
							-- 	position = {0,0,0},
							-- 	scale = {1,1,1},
							-- },
							{
								name = "Rift",
								mesh = "Rift/Rift",
								materials = { "arc_rift-green" },
								rotation = {0,0,0},
								position = {0,0,0},
								scale = {1,1,1},
								rotate = {
									timeStepSeconds = .01,             -- decimal
									degreeRotationPerSecond = { 0,0,1 }, -- decimals (x,y,z)
								},
								parts={
									{
										name     = "Particles",
										position = { 0, .001, .001 },
										rotation = { 0, 0, 0 },
										scale 	= { 1, 1, 1 },

										particleEmitter = {
											particleType = "PARTICLE",        -- enum EMITTERTYPE -- PARTICLE, RIBBON, PULSE
											distancePerParticle = .000001,       -- decimal
											minSecondsPerParticle = 9999999,     -- decimal
											ejectionVelocity = .2*scaCo,             -- decimal
											ejectionVelocityAwayFromEmitter = true, -- bool
											randomRadius = .01,                 -- decimal
											randomScaleMinFraction = 1,       -- decimal
											startDisabled = false,            -- bool
											stateToggleTrigger = "None",      -- enum EMITTERSTATETRIGGER
											colourStart = {0,1,0},            -- decimals
											colourEnd   = {0,1,0},            -- decimals
											opacity     = .1,                  -- decimal
											scaleStart  = .25*scaCo,                  -- decimal
											scaleEnd    = 0,                  -- decimal
											lifetime    = 2,                  -- decimal
										},
										
									},
									-- {
									-- 	name = "Rift",
									-- 	mesh = "Rift/Rift-Wireframe",
									-- 	materials = { "arc_rift-green" },
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
	-- 	prefab_part.materials = {"arc_build"..ghostIndex,"arc_build"..ghostIndex,"arc_build"..ghostIndex,"arc_build"..ghostIndex,}
	-- end
    return prefab_part
end