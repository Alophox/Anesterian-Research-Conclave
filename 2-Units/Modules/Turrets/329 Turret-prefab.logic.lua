prefab.part.module.emplacement = {}
prefab.weapon_info.module.emplacement = {}
prefab.part.module.emplacement.missile = {}
prefab.weapon_info.module.emplacement.missile = {}

function prefab.weapon_info.module.emplacement.S(count, type)
	local weapon_info = {
		prefab.weapon_info[type].S(4*count),
	}
	return weapon_info
end
function prefab.part.module.emplacement.S(scaleConst, angleCount, type, isGhost, ghostIndex, ghostMat)
	local newPos1 = functions.rotateRecursive({x=0,z=1.25*.1/scaleConst},{x=0,z=0},angleCount)
	local newPos2 = functions.rotateRecursive({x=-1.25*.1/scaleConst,z=0*.1/scaleConst},{x=0,z=0},angleCount)
	local newPos3 = functions.rotateRecursive({x=0,z=-1.25*.1/scaleConst},{x=0,z=0},angleCount)
	local newPos4 = functions.rotateRecursive({x=1.25*.1/scaleConst,z=0*.1/scaleConst},{x=0,z=0},angleCount)
	if(ghostIndex==nil) then ghostIndex=0 end
	if(ghostMat==nil) then ghostMat="build" end
	if(ghostIndex < 0) then return {}; end
	local prefab_part = {
		name = "Small Emplacement Cluster",
		-- mesh = "3-Topaz/Topaz-Stern-P",
		-- materials = {"329_MT_arc_teamGlow", "329_MT_arc_hull", "329_MT_arc_engine", "329_MT_arc_teamColour", },
		position = {0,0,0},
		rotation = {0,0,0},
		scale = {1,1,1},
		parts={
			prefab.weapon[type].S(
				{newPos1.x, 3.5*.1/scaleConst,newPos1.z},
				{ 0, -22.5*(angleCount+0), 0 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost, ghostIndex, ghostMat
			),
			prefab.weapon[type].S(
				{newPos2.x, 3.5*.1/scaleConst,newPos2.z},
				{ 0, -22.5*(angleCount+4), 0 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost, ghostIndex, ghostMat
			),
			prefab.weapon[type].S(
				{newPos3.x, 3.5*.1/scaleConst,newPos3.z},
				{ 0, -22.5*(angleCount+8), 0 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost, ghostIndex, ghostMat
			),
			prefab.weapon[type].S(
				{newPos4.x, 3.5*.1/scaleConst,newPos4.z},
				{ 0, -22.5*(angleCount+12), 0 },
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
function prefab.weapon_info.module.emplacement.missile.S(count, type)
	local weapon_info = {
		prefab.weapon_info.missile[type].S(8*count),
	}
	return weapon_info
end
function prefab.part.module.emplacement.missile.S(scaleConst, angleCount, type, isGhost, ghostIndex, ghostMat)
	local newPos1 = functions.rotateRecursive({x=0,z=1.25*.1/scaleConst},{x=0,z=0},angleCount)
	local newPos2 = functions.rotateRecursive({x=-1.25*.1/scaleConst,z=0*.1/scaleConst},{x=0,z=0},angleCount)
	local newPos3 = functions.rotateRecursive({x=0,z=-1.25*.1/scaleConst},{x=0,z=0},angleCount)
	local newPos4 = functions.rotateRecursive({x=1.25*.1/scaleConst,z=0*.1/scaleConst},{x=0,z=0},angleCount)
	local newPos5 = functions.rotateRecursive(newPos1,{x=0,z=0},2)
	local newPos6 = functions.rotateRecursive(newPos2,{x=0,z=0},2)
	local newPos7 = functions.rotateRecursive(newPos3,{x=0,z=0},2)
	local newPos8 = functions.rotateRecursive(newPos4,{x=0,z=0},2)
	if(ghostIndex==nil) then ghostIndex=0 end
	if(ghostMat==nil) then ghostMat="build" end
	if(ghostIndex < 0) then return {}; end
	local prefab_part = {
		name = "Small Emplacement Cluster",
		-- mesh = "3-Topaz/Topaz-Stern-P",
		-- materials = {"329_MT_arc_teamGlow", "329_MT_arc_hull", "329_MT_arc_engine", "329_MT_arc_teamColour", },
		position = {0,0,0},
		rotation = {0,0,0},
		scale = {1,1,1},
		parts={
			prefab.weapon.missile[type].S(
				{newPos1.x, 3.5*.1/scaleConst,newPos1.z},
				{ -90, -22.5*(angleCount+0), 0 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost, ghostIndex, ghostMat
			),
			prefab.weapon.missile[type].S(
				{newPos2.x, 3.5*.1/scaleConst,newPos2.z},
				{ -90, -22.5*(angleCount+4), 0 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost, ghostIndex, ghostMat
			),
			prefab.weapon.missile[type].S(
				{newPos3.x, 3.5*.1/scaleConst,newPos3.z},
				{ -90, -22.5*(angleCount+8), 0 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost, ghostIndex, ghostMat
			),
			prefab.weapon.missile[type].S(
				{newPos4.x, 3.5*.1/scaleConst,newPos4.z},
				{ -90, -22.5*(angleCount+12), 0 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost, ghostIndex, ghostMat
			),
			prefab.weapon.missile[type].S(
				{newPos5.x, 3.5*.1/scaleConst,newPos5.z},
				{ -90, -22.5*(angleCount+2), 0 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost, ghostIndex, ghostMat
			),
			prefab.weapon.missile[type].S(
				{newPos6.x, 3.5*.1/scaleConst,newPos6.z},
				{ -90, -22.5*(angleCount+6), 0 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost, ghostIndex, ghostMat
			),
			prefab.weapon.missile[type].S(
				{newPos7.x, 3.5*.1/scaleConst,newPos7.z},
				{ -90, -22.5*(angleCount+10), 0 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost, ghostIndex, ghostMat
			),
			prefab.weapon.missile[type].S(
				{newPos8.x, 3.5*.1/scaleConst,newPos8.z},
				{ -90, -22.5*(angleCount+14), 0 },
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

function prefab.weapon_info.module.emplacement.M(count, type)
	local weapon_info = {
		prefab.weapon_info[type].M(2*count),
	}
	return weapon_info
end
function prefab.part.module.emplacement.M(scaleConst, angleCount, type, isGhost, ghostIndex)
	local newPos1 = functions.rotateRecursive({x=1.45*.1/scaleConst,z=6.5*.1/scaleConst},{x=0,z=0},angleCount)
	local newPos2 = functions.rotateRecursive({x=-1.45*.1/scaleConst,z=6.5*.1/scaleConst},{x=0,z=0},angleCount)
	if(ghostIndex==nil) then ghostIndex=0 end
	if(ghostMat==nil) then ghostMat="build" end
	if(ghostIndex < 0) then return {}; end
	local prefab_part = {
		name = "Medium Emplacement Cluster",
		-- mesh = "3-Topaz/Topaz-Stern-P",
		-- materials = {"329_MT_arc_teamGlow", "329_MT_arc_hull", "329_MT_arc_engine", "329_MT_arc_teamColour", },
		position = {0,0,0},
		rotation = {0,0,0},
		scale = {1,1,1},
		parts={
			prefab.weapon[type].M(
				{newPos1.x, 4.25*.1/scaleConst,newPos1.z},
				{ 0, -22.5*angleCount, 0 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost, ghostIndex, ghostMat
			),
			prefab.weapon[type].M(
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
function prefab.weapon_info.module.emplacement.missile.M(count, type)
	local weapon_info = {
		prefab.weapon_info.missile[type].M(4*count),
	}
	return weapon_info
end
function prefab.part.module.emplacement.missile.M(scaleConst, angleCount, type, isGhost, ghostIndex)
	local newPos1 = functions.rotateRecursive({x=1.45*.1/scaleConst,z=6.5*.1/scaleConst},{x=0,z=0},angleCount)
	local newPos2 = functions.rotateRecursive({x=-1.45*.1/scaleConst,z=6.5*.1/scaleConst},{x=0,z=0},angleCount)
	local newPos3 = functions.rotateRecursive({x=0*.1/scaleConst,z=5.5*.1/scaleConst},{x=0,z=0},angleCount)
	local newPos4 = functions.rotateRecursive({x=0*.1/scaleConst,z=7.5*.1/scaleConst},{x=0,z=0},angleCount)
	if(ghostIndex==nil) then ghostIndex=0 end
	if(ghostMat==nil) then ghostMat="build" end
	if(ghostIndex < 0) then return {}; end
	local prefab_part = {
		name = "Medium Emplacement Cluster",
		-- mesh = "3-Topaz/Topaz-Stern-P",
		-- materials = {"329_MT_arc_teamGlow", "329_MT_arc_hull", "329_MT_arc_engine", "329_MT_arc_teamColour", },
		position = {0,0,0},
		rotation = {0,0,0},
		scale = {1,1,1},
		parts={
			prefab.weapon.missile[type].M(
				{newPos1.x, 4*.1/scaleConst,newPos1.z},
				{ -90, -22.5*angleCount, 0 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost, ghostIndex, ghostMat
			),
			prefab.weapon.missile[type].M(
				{newPos2.x, 4*.1/scaleConst,newPos2.z},
				{ -90, -22.5*angleCount, 0 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost, ghostIndex, ghostMat
			),
			prefab.weapon.missile[type].M(
				{newPos3.x, 4*.1/scaleConst,newPos3.z},
				{ -90, -22.5*angleCount, 0 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost, ghostIndex, ghostMat
			),
			prefab.weapon.missile[type].M(
				{newPos4.x, 4*.1/scaleConst,newPos4.z},
				{ -90, -22.5*angleCount, 0 },
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

function prefab.weapon_info.module.emplacement.L(count, type)
	local weapon_info = {
		prefab.weapon_info[type].L(1*count),
	}
	return weapon_info
end
function prefab.part.module.emplacement.L(scaleConst, angleCount, type, isGhost, ghostIndex)
	local newPos1 = functions.rotateRecursive({x=0,z=10*.1/scaleConst},{x=0,z=0},angleCount)
	if(ghostIndex==nil) then ghostIndex=0 end
	if(ghostMat==nil) then ghostMat="build" end
	if(ghostIndex < 0) then return {}; end
	local prefab_part = {
		name = "Large Emplacement Cluster",
		-- mesh = "3-Topaz/Topaz-Stern-P",
		-- materials = {"329_MT_arc_teamGlow", "329_MT_arc_hull", "329_MT_arc_engine", "329_MT_arc_teamColour", },
		position = {0,0,0},
		rotation = {0,0,0},
		scale = {1,1,1},
		parts={
			prefab.weapon[type].L(
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
function prefab.weapon_info.module.emplacement.missile.L(count, type)
	local weapon_info = {
		prefab.weapon_info.missile[type].L(2*count),
	}
	return weapon_info
end
function prefab.part.module.emplacement.missile.L(scaleConst, angleCount, type, isGhost, ghostIndex)
	local newPos1 = functions.rotateRecursive({x=-1.23438*.1/scaleConst,z=10*.1/scaleConst},{x=0,z=0},angleCount)
	local newPos2 = functions.rotateRecursive({x=1.23438*.1/scaleConst,z=10*.1/scaleConst},{x=0,z=0},angleCount)
	if(ghostIndex==nil) then ghostIndex=0 end
	if(ghostMat==nil) then ghostMat="build" end
	if(ghostIndex < 0) then return {}; end
	local prefab_part = {
		name = "Large Emplacement Cluster",
		-- mesh = "3-Topaz/Topaz-Stern-P",
		-- materials = {"329_MT_arc_teamGlow", "329_MT_arc_hull", "329_MT_arc_engine", "329_MT_arc_teamColour", },
		position = {0,0,0},
		rotation = {0,0,0},
		scale = {1,1,1},
		parts={
			prefab.weapon.missile[type].L(
				{newPos1.x, 4.5*.1/scaleConst,newPos1.z},
				{ -90, -22.5*angleCount, 0 },
				{ .1/scaleConst, .1/scaleConst, .1/scaleConst },
				isGhost, ghostIndex, ghostMat
			),
			prefab.weapon.missile[type].L(
				{newPos2.x, 4.5*.1/scaleConst,newPos2.z},
				{ -90, -22.5*angleCount, 0 },
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