return {
	factionName = "Anesterian Research Conclave",   -- Display name
	factionNameShorthand = "ARC",
	description = "Prioritizing modularity and efficiency, both things not useful within the Spance.",
	emblem = "329 ARC Icon",        -- PNG image used to represent the faction.
	id = 329,                     -- Unique integer faction ID, has to be greater than 99 (ATS reserve)

	-- Skirmish setup
	skirmish = true,                     -- Should appear in skirmish mode
	skirmish_loadout = { 
		3291001, 3291002, 3291004, 3291005, --dronn (size 0)
		3291100, 3291101, 3291102, --light size 1
		3291200, 3291201, 3291202, --light size 2
		3291300, 3291301, 3291302, --medium size 3
		3291400, 3291401, 3291402, --medium size 4
		3291500, 3291501, 3291502, --heavy size 5
		3291600, 3291601, 3291602, --heavy size 6
		3291700, 3291701, 3291702, 3291703, 3291704, 3291705, --capital size 7
		3291801, --special
		------------
		3292003, -- utility
		3292011, 3292012, 3292013, 3292014, --yards
		3292020, 3292021, 3292022, 3292029, --turrets
		3297000, 3297001, 3297003, 3297004, 3297005, --turrets
		3297010, 3297011, 3297013, 3297014, 3297015, --turrets
		3297020, 3297021, 3297023, 3297024, 3297025, --turrets
		3292050, --logistics
		3292051, 3292052, --storage
		3292030, 3292031, 3292040, --economy
	}, -- int array: A list of unit TypeIDs that the player is allowed to build, both structures and ships.
	skirmish_platforms = { 3292000 },      -- Initial platforms/stationary structures
	skirmish_ais = { "287ab6d5-f7d6-4eeb-8413-0f16da465efc", "7d4441ad-42b5-474f-aa13-f4a5b0efc660", "a5d1c7c4-1396-4122-b64a-59ac44ec5b08", "bb6bb183-b65e-4558-b899-40d74ab5f168", "38a6aad6-4186-438d-8ebc-017e5b15ab22" },
	
	-- Content catalog (for editor and databank)
	ships = { 
		3291001, 3291002, 3291004, 3291005, --dronn (size 0)
		3291100, 3291101, 3291102, --light size 1
		3291200, 3291201, 3291202, --light size 2
		3291300, 3291301, 3291302, --medium size 3
		3291400, 3291401, 3291402, --medium size 4
		3291500, 3291501, 3291502, --heavy size 5
		3291600, 3291601, 3291602, --heavy size 6
		3291700, 3291701, 3291702, 3291703, 3291704, 3291705, --capital size 7
		3291801, --special
		--3297000, --experimental
	},               -- Ships
	structures = { 
		3292000, 3292001, 3292002, --platforms
		3292003, -- utility
		3292011, 3292012, 3292013, 3292014, --yards
		3292020, 3292021, 3292022, 3292029, --turrets
		3297000, 3297001, 3297003, 3297004, 3297005, --turrets
		3297010, 3297011, 3297013, 3297014, 3297015, --turrets
		3297020, 3297021, 3297023, 3297024, 3297025, --turrets
		3292050, --logistics
		3292051, 3292052, --storage
		3292030, 3292031, 3292040, --economy
		3293000,  --environmental

	}, -- Structures
	--munitions = {},                    -- (optional) Bullets, missiles, etc . If you for some reason have munitions that you want to spawn / work when spawned normally.
	environmental = {},                -- Matter asteroids, etc
}
