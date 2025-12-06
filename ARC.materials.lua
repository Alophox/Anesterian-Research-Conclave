return {
	materials = {

		-- REMINDER:
		-- Any material with a name containing "teamColour" will be team recoloured.
		-- Any material with a name containing "teamGlow" will be glow recoloured. (if the map team is set to do glow recolouring).

		{
			id = "arc_hull",
			behaviour = "HULL", -- NONE / HULL / GLOW / THRUSTER / TRANSPARENT / CONSTRUCTION
			--NONE: Does nothing.
			--HULL: Will recieve damage effect overlay as unit is damaged as well as team colour if name contains "teamColour".
			--GLOW: Will reduce emission intensity as unit is damaged and turn off when unit dies, or is disabled. As well as team glow colour if name contains "teamGlow"
			--TRAN: Is able to be transparent, accepts an alpha value in colour.
			colour = { 0.75, 0.75, 0.75, 1 }, 	--RGBA, 0 to 1, Alpha (transparency) is considered for THRUSTER and TRANSPARENT. 0 is see through, 1 is opaque.
			emission = { 0, 0, 0, 0 }, 		--RGBI, 0 to 1, values above 1 will cause bloom. I = Brightness Intensity (also enhances bloom, will also cause the colour to white out if too high)
			metallic = 0.00,    			--How much this reflects it's own colour, versus the colour of the light shon on it.
			roughness = 0.5,  				--How bright, large and smooth specular highlights are.
			baseSkuff = 0,     				--The base amount of "damage" overlay that is applied to this material regardless of actual damage.
		},
		{
			id = "arc_build",
			behaviour = "HULL",
			colour = { 0.75, 0.75, 0.75, 1},
			emission = { 0, 0, 0, 0 },
			metallic = 0.5,
			roughness = 1,
			baseSkuff = 0,
		},
		{
			id = "arc_hull_dark",
			behaviour = "HULL",
			colour = { 0.200, 0.200, 0.200, 1 },
			emission = { 0, 0, 0, 0 },
			metallic = 0.5,
			roughness = 1,
			baseSkuff = 0,
		},
		{
			id = "arc_teamColour",
			behaviour = "HULL",
			colour = { 0.00, 0.50, 0.50, 1 },
			emission = { 0, 0, 0, 0 },
			metallic = 0.5,
			roughness = 0.5,
			baseSkuff = 0,
		},
		{
			id = "arc_teamGlow",
			behaviour = "GLOW",
			colour = { 0.30, .30, .30, 1 },
			emission = { 0.3, 1.5, 1.5, 1 },
			metallic = 0,
			roughness = 1,
			baseSkuff = 0,
		},
		{
			id = "arc_engine",
			behaviour = "GLOW",
			colour = { 0.00, 1.00, 1.00, 1 },
			emission = { 0, 2, 2, .5 },
			metallic = 0,
			roughness = 0,
			baseSkuff = 0,
		},
		{
			id = "arc_thruster-inner",
			behaviour = "TRANSPARENT",
			colour = { 0.90, 1.00, 1.00, 0 },
			emission = { .9, 2, 2, 1 },
			metallic = 0,
			roughness = 1,
			baseSkuff = 0,
		},
		{
			id = "arc_thruster-middle",
			behaviour = "TRANSPARENT",
			colour = { 0.50, 1.00, 1.00, 0 },
			emission = { .5, 1, 1, .5 },
			metallic = 0,
			roughness = 1,
			baseSkuff = 0,
		},
		{
			id = "arc_thruster-outer",
			behaviour = "TRANSPARENT",
			colour = { 0.00, 1.00, 1.00, 0 },
			emission = { 0, 1, 1, 1 },
			metallic = 0,
			roughness = 1,
			baseSkuff = 0,
		},
		{
			id = "arc_muzzleFlash_teamGlow",
			behaviour = "GLOW",
			colour = { 0.00, 1.00, 1.00, 0.5 },
			emission = { 0, 1, 1, 1 },
			metallic = 0,
			roughness = 1,
			baseSkuff = 0,
		},
		{
			id = "arc_weapon_teamGlow",
			behaviour = "TRANSPARENT",
			colour = { 0.00, 1, 1, 0.1 },
			emission = { 0.3, 1.5, 1.5, 1 },
			metallic = 0,
			roughness = 1,
			baseSkuff = 0,
		},
		{
			id = "arc_aurora_red",
			behaviour = "TRANSPARENT",
			colour =   { 1, 0, 0, 0 },
			emission = { .5, 0, 0, .2 },
			metallic = 0,
			roughness = 1,
			baseSkuff = 0,
		},
		{
			id = "arc_aurora_green",
			behaviour = "TRANSPARENT",
			colour =   { 0, 1, 0, 0 },
			emission = { 0, .5, 0, .2 },
			metallic = 0,
			roughness = 1,
			baseSkuff = 0,
		},
		{
			id = "arc_aurora_blue",
			behaviour = "TRANSPARENT",
			colour =   { 0, 0, 1, 0 },
			emission = { 0, 0, .5, .2 },
			metallic = 0,
			roughness = 1,
			baseSkuff = 0,
		},
		{
			id = "arc_aurora_pink",
			behaviour = "TRANSPARENT",
			colour =   { 1, .5, .5, 0 },
			emission = { .25, .125, .125, 0 },
			metallic = 0,
			roughness = 1,
			baseSkuff = 0,
		},

		{
			id = "arc_rift_red",
			behaviour = "TRANSPARENT",
			colour =   { 1, 0, 0, 0 },
			emission = { 1, 0, 0, .1 },
			metallic = 0,
			roughness = 1,
			baseSkuff = 0,
		},
		{
			id = "arc_rift_green",
			behaviour = "TRANSPARENT",
			colour =   { 0, 1, 0, 0 },
			emission = { 0, 1, 0, .1 },
			metallic = 0,
			roughness = 1,
			baseSkuff = 0,
		},
		{
			id = "arc_rift_blue",
			behaviour = "TRANSPARENT",
			colour =   { 0, 0, 1, 0 },
			emission = { 0, 0, 1, .1 },
			metallic = 0,
			roughness = 1,
			baseSkuff = 0,
		},
		{
			id = "arc_trail",
			behaviour = "TRANSPARENT",
			colour =   { .5, .5, .5, 0 },
			emission = { 1, 1, 1, .2 },
			metallic = 0,
			roughness = 1,
			baseSkuff = 0,
		},
	}
}
