 
 --This file controls the modID of your mod, among other attributes.
 --
 --The modID is crucial and must be unique as it is used to identify your mod's models, weapons, and units in the game's code.
 --Feel free to use reasonably unique stuff like LukeAPGlaveFleet100 as your modID, but if you want to be totally safe here is a GUID generator https://www.uuidgenerator.net/guid
 --
 
 
 

return {
	modName        = "Anesterian Research Conclave",
	author         = "Alophox",

	--The modID allows other mods to referance your mod, or the other way around. (using sounds from a Sound Pack mod, for example)
 	--If two mods have the same ID the game will merge them together. You can make mods for mods! (This doesn't work yet 2025/04/22)
 	--It is also saved in Maps, in order to tell users what mods they need to get for the map to work.
	id             = "329ARC", --Must be unique. Otherwise it will override other mods. Go to https://www.uuidgenerator.net/guid generate a GUID, and set it here.
	
	--Version helps the game know if the player's local version of the mod is out of date when looking at other mods or maps. 
	--EG. a map could expect v2.0.0 while the local copy is v1.5.0. Then the map can tell the player "Hey this mod probably needs an update."
	version        = "0.6.0", -- Major.Minor.Patch

	description    = "When the stars are few and far between, make your own to light the night",
	
	conflictControls = {
		mergeSameID = false,	--Allows other mods to merge with this mod and override items, aka, mod modding. If false, this mod will be ignored if another with the same ID is already loaded.
	}
}
