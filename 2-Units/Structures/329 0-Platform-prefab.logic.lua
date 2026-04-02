prefab.part.platform = {}
prefab.weapon_info.platform = {}
prefab.part.platform.L = {}
prefab.weapon_info.platform.L = {}


function prefab.weapon_info.platform.L.A(count)
	weapon_info = {
		prefab.weapon_info.laser.S(4*count),
	}
	return weapon_info
end
function prefab.part.platform.L.A(scaleConst, angleCount, isGhost, ghostIndex, ghostMat)
	newPos1 = functions.rotateRecursive({x=0,z=36.25*.1/scaleConst},{x=0,z=0},angleCount)
	newPos2 = functions.rotateRecursive({x=-1.25*.1/scaleConst,z=35*.1/scaleConst},{x=0,z=0},angleCount)
	newPos3 = functions.rotateRecursive({x=0,z=33.75*.1/scaleConst},{x=0,z=0},angleCount)
	newPos4 = functions.rotateRecursive({x=1.25*.1/scaleConst,z=35*.1/scaleConst},{x=0,z=0},angleCount)
	if(ghostIndex==nil) then ghostIndex=0 end
	if(ghostIndex > 2) then return {}; end
	if(not isGhost and ghostIndex > 0) then return {}; end
	prefab_part = {
		name = "Platform Segment Large A",
		-- mesh = "3-Topaz/Topaz-Stern-P",
		-- materials = {"329_MT_arc_teamGlow", "329_MT_arc_hull", "329_MT_arc_engine", "329_MT_arc_teamColour", },
		position = {0,0,0},
		rotation = {0,0,0},
		scale = {1,1,1},
		parts={
			prefab.weapon.laser.S(
				{newPos1.x, 3.5*.1/scaleConst,newPos1.z},
				{ 0, -22.5*angleCount, 0 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost, ghostIndex, ghostMat
			),
			prefab.weapon.laser.S(
				{newPos2.x, 3.5*.1/scaleConst,newPos2.z},
				{ 0, -22.5*angleCount, 0 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost, ghostIndex, ghostMat
			),
			prefab.weapon.laser.S(
				{newPos3.x, 3.5*.1/scaleConst,newPos3.z},
				{ 0, -22.5*angleCount, 0 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost, ghostIndex, ghostMat
			),
			prefab.weapon.laser.S(
				{newPos4.x, 3.5*.1/scaleConst,newPos4.z},
				{ 0, -22.5*angleCount, 0 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost, ghostIndex, ghostMat
			),
		}
	}
	if isGhost then
		prefab_part.materials= {"329_MT_arc_"..ghostIndex.."_"..ghostMat,"329_MT_arc_"..ghostIndex.."_"..ghostMat,"329_MT_arc_"..ghostIndex.."_"..ghostMat,"329_MT_arc_"..ghostIndex.."_"..ghostMat,"329_MT_arc_"..ghostIndex.."_"..ghostMat,}
	end
	return prefab_part
end

function prefab.weapon_info.platform.L.B(count)
	weapon_info = {
		prefab.weapon_info.cannon.M(2*count),
	}
	return weapon_info
end
function prefab.part.platform.L.B(scaleConst, angleCount, isGhost, ghostIndex, ghostMat)
	newPos1 = functions.rotateRecursive({x=1.45*.1/scaleConst,z=35*.1/scaleConst},{x=0,z=0},angleCount)
	newPos2 = functions.rotateRecursive({x=-1.45*.1/scaleConst,z=35*.1/scaleConst},{x=0,z=0},angleCount)
	if(ghostIndex==nil) then ghostIndex=0 end
	if(ghostIndex > 2) then return {}; end
	if(not isGhost and ghostIndex > 0) then return {}; end
	prefab_part = {
		name = "Platform Segment Large B",
		-- mesh = "3-Topaz/Topaz-Stern-P",
		-- materials = {"329_MT_arc_teamGlow", "329_MT_arc_hull", "329_MT_arc_engine", "329_MT_arc_teamColour", },
		position = {0,0,0},
		rotation = {0,0,0},
		scale = {1,1,1},
		parts={
			prefab.weapon.cannon.M(
				{newPos1.x, 4.25*.1/scaleConst,newPos1.z},
				{ 0, -22.5*angleCount, 0 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost, ghostIndex, ghostMat
			),
			prefab.weapon.cannon.M(
				{newPos2.x, 4.25*.1/scaleConst,newPos2.z},
				{ 0, -22.5*angleCount, 0 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost, ghostIndex, ghostMat
			),

		}
	}
	if isGhost then
		prefab_part.materials= {"329_MT_arc_"..ghostIndex.."_"..ghostMat,"329_MT_arc_"..ghostIndex.."_"..ghostMat,"329_MT_arc_"..ghostIndex.."_"..ghostMat,"329_MT_arc_"..ghostIndex.."_"..ghostMat,"329_MT_arc_"..ghostIndex.."_"..ghostMat,}
	end
	return prefab_part
end
function prefab.weapon_info.platform.L.C1(count)
	weapon_info = {
		prefab.weapon_info.railgun.L(1*count),
	}
	return weapon_info
end
function prefab.part.platform.L.C1(scaleConst, angleCount, isGhost, ghostIndex, ghostMat)
	newPos1 = functions.rotateRecursive({x=0,z=16*.1/scaleConst},{x=0,z=0},angleCount)
	if(ghostIndex==nil) then ghostIndex=0 end
	if(ghostIndex > 2) then return {}; end
	if(not isGhost and ghostIndex > 0) then return {}; end
	prefab_part = {
		name = "Platform Segment Large C",
		-- mesh = "3-Topaz/Topaz-Stern-P",
		-- materials = {"329_MT_arc_teamGlow", "329_MT_arc_hull", "329_MT_arc_engine", "329_MT_arc_teamColour", },
		position = {0,0,0},
		rotation = {0,0,0},
		scale = {1,1,1},
		parts={
			prefab.weapon.railgun.L(
				{newPos1.x, 4.75*.1/scaleConst,newPos1.z},
				{ 0, -22.5*angleCount, 0 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost, ghostIndex, ghostMat
			),

		}
	}
	if isGhost then
		prefab_part.materials= {"329_MT_arc_"..ghostIndex.."_"..ghostMat,"329_MT_arc_"..ghostIndex.."_"..ghostMat,"329_MT_arc_"..ghostIndex.."_"..ghostMat,"329_MT_arc_"..ghostIndex.."_"..ghostMat,"329_MT_arc_"..ghostIndex.."_"..ghostMat,}
	end
	return prefab_part
end
function prefab.weapon_info.platform.L.C2(count)
	weapon_info = {
		prefab.weapon_info.lightning.L(1*count),
	}
	return weapon_info
end
function prefab.part.platform.L.C2(scaleConst, angleCount, isGhost, ghostIndex, ghostMat)
	newPos1 = functions.rotateRecursive({x=0,z=16*.1/scaleConst},{x=0,z=0},angleCount)
	if(ghostIndex==nil) then ghostIndex=0 end
	if(ghostIndex > 2) then return {}; end
	if(not isGhost and ghostIndex > 0) then return {}; end
	prefab_part = {
		name = "Platform Segment Large C",
		-- mesh = "3-Topaz/Topaz-Stern-P",
		-- materials = {"329_MT_arc_teamGlow", "329_MT_arc_hull", "329_MT_arc_engine", "329_MT_arc_teamColour", },
		position = {0,0,0},
		rotation = {0,0,0},
		scale = {1,1,1},
		parts={
			prefab.weapon.lightning.L(
				{newPos1.x, 4.75*.1/scaleConst,newPos1.z},
				{ 0, -22.5*angleCount, 0 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost, ghostIndex, ghostMat
			),

		}
	}
	if isGhost then
		prefab_part.materials= {"329_MT_arc_"..ghostIndex.."_"..ghostMat,"329_MT_arc_"..ghostIndex.."_"..ghostMat,"329_MT_arc_"..ghostIndex.."_"..ghostMat,"329_MT_arc_"..ghostIndex.."_"..ghostMat,"329_MT_arc_"..ghostIndex.."_"..ghostMat,}
	end
	return prefab_part
end