
prefab.ship.unique = {
	constructor = {},
	orifice = {},
}
prefab.weapon_info.unique = {
	constructor = {},
	orifice = {},
}

function prefab.weapon_info.unique.constructor.core()
	weapon_info = {
		prefab.weapon_info.hangar.quartz.stardust(1),
	}
	return weapon_info
end
function prefab.ship.unique.constructor.core(scaleConst, isGhost, ghostIndex, ghostMat)
	if(ghostIndex==nil) then ghostIndex=0 end
	if(ghostMat==nil) then ghostMat="build" end
	if(ghostIndex < 0) then return {}; end
	prefab_part = {
		name = "Citrine-Core-C",
		mesh = "329-2-Citrine/Citrine-Core-C",
		materials = { "329_MT_arc_teamGlow", "329_MT_arc_hull", "329_MT_arc_hull_dark", "329_MT_arc_teamColour" },
		position = {0,0,0},
		rotation = {0,0,0},
		scale = {.1/scaleConst,.1/scaleConst,.1/scaleConst},
		parts={

			prefab.weapon.hangar.quartz.stardust(
				{ 0, 0, 2.75 },
				{ 0, 0, 0 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),



			prefab.part.emblem(
				{ 0, 1.25, -2.75},
				{ 0, 0, 0 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),
			prefab.part.emblem(
				{ 0, 1.25, -2.75},
				{ 0, 0, 180 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),

			prefab.ship.citrine.thruster(scaleConst, isGhost, ghostIndex),

			prefab.ship.unique.constructor.core(.1, isGhost, ghostIndex-1, ghostMat),
		}
	}
	if isGhost then
		if (ghostMat == "aegis_teamColour") then
			prefab_part.aegisVisual = true;
		end
		prefab_part.materials= {"329_MT_arc_"..ghostIndex.."_"..ghostMat,"329_MT_arc_"..ghostIndex.."_"..ghostMat,"329_MT_arc_"..ghostIndex.."_"..ghostMat,"329_MT_arc_"..ghostIndex.."_"..ghostMat,"329_MT_arc_"..ghostIndex.."_"..ghostMat,}
	end
	return prefab_part
end

function prefab.weapon_info.unique.orifice.core()
	weapon_info = {
		prefab.weapon_info.special.gwe(1),
	}
	return weapon_info
end
function prefab.ship.unique.orifice.core(scaleConst, isGhost, ghostIndex, ghostMat)
	if(ghostIndex==nil) then ghostIndex=0 end
	if(ghostMat==nil) then ghostMat="build" end
	if(ghostIndex < 0) then return {}; end
	prefab_part = {
		-- name = "Citrine-Core-C",
		-- mesh = "329-2-Citrine/Citrine-Core-C",
		materials = { "329_MT_arc_teamGlow", "329_MT_arc_hull", "329_MT_arc_hull_dark", "329_MT_arc_teamColour" },
		position = {0,0,0},
		rotation = {0,0,0},
		scale = {.1/scaleConst,.1/scaleConst,.1/scaleConst},
		parts={

			prefab.weapon.special.gwe(
				{ 0, 0, 7 },
				{ 0, 0, 0 },
				{ 1, 1, 1 },
				isGhost, ghostIndex, ghostMat
			),
			{
				name = "Aquamarine-Stern",
				mesh = "329-5-Aquamarine/Aquamarine-Stern",
				materials = {"329_MT_arc_hull_dark","329_MT_arc_teamGlow", "329_MT_arc_hull", "329_MT_arc_teamColour", },
				position = {0,0,0},
				rotation = {0,0,0},
				scale = {1, 1, 1},
			},
			{
				name = "Aquamarine-Core",
				mesh = "329-5-Aquamarine/Aquamarine-Core",
				materials = {"329_MT_arc_teamGlow", "329_MT_arc_hull", "329_MT_arc_teamColour", },
				position = {0,0,0},
				rotation = {0,0,0},
				scale = {1, 1, 1},
			},
			{
				name = "Aquamarine-Bow",
				mesh = "329-5-Aquamarine/Aquamarine-Bow",
				materials = {"329_MT_arc_teamGlow", "329_MT_arc_hull", "329_MT_arc_teamColour", },
				position = {0,0,0},
				rotation = {0,0,0},
				scale = {1, 1, 1},
			},


			-- prefab.part.emblem(
			-- 	{ 0, 1.25, -2.75},
			-- 	{ 0, 0, 0 },
			-- 	{ 1, 1, 1 },
			-- 	isGhost, ghostIndex, ghostMat
			-- ),
			-- prefab.part.emblem(
			-- 	{ 0, 1.25, -2.75},
			-- 	{ 0, 0, 180 },
			-- 	{ 1, 1, 1 },
			-- 	isGhost, ghostIndex, ghostMat
			-- ),

			prefab.ship.aquamarine.thruster(scaleConst, isGhost, ghostIndex),

			prefab.ship.unique.orifice.core(.1, isGhost, ghostIndex-1, ghostMat),
		}
	}
	if isGhost then
		if (ghostMat == "aegis_teamColour") then
			prefab_part.aegisVisual = true;
		end
		prefab_part.materials= {"329_MT_arc_"..ghostIndex.."_"..ghostMat,"329_MT_arc_"..ghostIndex.."_"..ghostMat,"329_MT_arc_"..ghostIndex.."_"..ghostMat,"329_MT_arc_"..ghostIndex.."_"..ghostMat,"329_MT_arc_"..ghostIndex.."_"..ghostMat,}
	end
	return prefab_part
end