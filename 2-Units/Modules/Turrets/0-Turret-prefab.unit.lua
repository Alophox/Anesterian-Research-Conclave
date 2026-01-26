prefab.part.module.emplacement = {}
prefab.weapon_info.module.emplacement = {}

function prefab.weapon_info.module.emplacement.S(count, type)
	weapon_info = {
		prefab.weapon_info[type].S(4*count),
	}
	return weapon_info
end
function prefab.part.module.emplacement.S(scaleConst, angleCount, type, isGhost, ghostIndex)
	newPos1 = functions.rotateRecursive({x=0,z=1.25*.1/scaleConst},{x=0,z=0},angleCount)
	newPos2 = functions.rotateRecursive({x=-1.25*.1/scaleConst,z=0*.1/scaleConst},{x=0,z=0},angleCount)
	newPos3 = functions.rotateRecursive({x=0,z=-1.25*.1/scaleConst},{x=0,z=0},angleCount)
	newPos4 = functions.rotateRecursive({x=1.25*.1/scaleConst,z=0*.1/scaleConst},{x=0,z=0},angleCount)
	if(ghostIndex==nil) then ghostIndex=0 end
	if(ghostIndex > 5) then return {}; end
	if(not isGhost and ghostIndex > 0) then return {}; end
	prefab_part = {
		name = "Small Emplacement Cluster",
		-- mesh = "3-Topaz/Topaz-Stern-P",
		-- materials = {"arc_teamGlow", "arc_hull", "arc_engine", "arc_teamColour", },
		position = {0,0,0},
		rotation = {0,0,0},
		scale = {1,1,1},
		parts={
			prefab.weapon[type].S(
				{newPos1.x, 3.5*.1/scaleConst,newPos1.z},
				{ 0, -22.5*angleCount, 0 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost, ghostIndex
			),
			prefab.weapon[type].S(
				{newPos2.x, 3.5*.1/scaleConst,newPos2.z},
				{ 0, -22.5*angleCount, 0 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost, ghostIndex
			),
			prefab.weapon[type].S(
				{newPos3.x, 3.5*.1/scaleConst,newPos3.z},
				{ 0, -22.5*angleCount, 0 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost, ghostIndex
			),
			prefab.weapon[type].S(
				{newPos4.x, 3.5*.1/scaleConst,newPos4.z},
				{ 0, -22.5*angleCount, 0 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost, ghostIndex
			),
		}
	}
	if isGhost then
		prefab_part.materials= {"arc_build"..ghostIndex,"arc_build"..ghostIndex,"arc_build"..ghostIndex,"arc_build"..ghostIndex,"arc_build"..ghostIndex,}
	end
	return prefab_part
end

function prefab.weapon_info.module.emplacement.M(count, type)
	weapon_info = {
		prefab.weapon_info[type].M(2*count),
	}
	return weapon_info
end
function prefab.part.module.emplacement.M(scaleConst, angleCount, type, isGhost, ghostIndex)
	newPos1 = functions.rotateRecursive({x=1.45*.1/scaleConst,z=6.5*.1/scaleConst},{x=0,z=0},angleCount)
	newPos2 = functions.rotateRecursive({x=-1.45*.1/scaleConst,z=6.5*.1/scaleConst},{x=0,z=0},angleCount)
	if(ghostIndex==nil) then ghostIndex=0 end
	if(ghostIndex > 5) then return {}; end
	if(not isGhost and ghostIndex > 0) then return {}; end
	prefab_part = {
		name = "Medium Emplacement Cluster",
		-- mesh = "3-Topaz/Topaz-Stern-P",
		-- materials = {"arc_teamGlow", "arc_hull", "arc_engine", "arc_teamColour", },
		position = {0,0,0},
		rotation = {0,0,0},
		scale = {1,1,1},
		parts={
			prefab.weapon[type].M(
				{newPos1.x, 4.25*.1/scaleConst,newPos1.z},
				{ 0, -22.5*angleCount, 0 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost, ghostIndex
			),
			prefab.weapon[type].M(
				{newPos2.x, 4.25*.1/scaleConst,newPos2.z},
				{ 0, -22.5*angleCount, 0 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost, ghostIndex
			),

		}
	}
	if isGhost then
		prefab_part.materials= {"arc_build"..ghostIndex,"arc_build"..ghostIndex,"arc_build"..ghostIndex,"arc_build"..ghostIndex,"arc_build"..ghostIndex,}
	end
	return prefab_part
end

function prefab.weapon_info.module.emplacement.L(count, type)
	weapon_info = {
		prefab.weapon_info[type].L(1*count),
	}
	return weapon_info
end
function prefab.part.module.emplacement.L(scaleConst, angleCount, type, isGhost, ghostIndex)
	newPos1 = functions.rotateRecursive({x=0,z=10*.1/scaleConst},{x=0,z=0},angleCount)
	if(ghostIndex==nil) then ghostIndex=0 end
	if(ghostIndex > 5) then return {}; end
	if(not isGhost and ghostIndex > 0) then return {}; end
	prefab_part = {
		name = "Large Emplacement Cluster",
		-- mesh = "3-Topaz/Topaz-Stern-P",
		-- materials = {"arc_teamGlow", "arc_hull", "arc_engine", "arc_teamColour", },
		position = {0,0,0},
		rotation = {0,0,0},
		scale = {1,1,1},
		parts={
			prefab.weapon[type].L(
				{newPos1.x, 4.75*.1/scaleConst,newPos1.z},
				{ 0, -22.5*angleCount, 0 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost, ghostIndex
			),

		}
	}
	if isGhost then
		prefab_part.materials= {"arc_build"..ghostIndex,"arc_build"..ghostIndex,"arc_build"..ghostIndex,"arc_build"..ghostIndex,"arc_build"..ghostIndex,}
	end
	return prefab_part
end