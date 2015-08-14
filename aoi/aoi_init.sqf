/*
	Area of Interests - According to Mission Parameters and Locations
	
	MisPar:
	par_hostileForces_amount	0,1,2,3,4
	par_alliedForces_amount		0,1,2,3,4	
	
	par_hostileForces_vehicles	0,1,2,3,4
	par_alliedForces_vehicles	0,1,2,3,4
	
	par_hostileForces_skill		0,1,2
	par_alliedForces_skill		0,1,2	
*/

call compile preProcessFileLineNumbers "aoi\aoi_commonFunctions.sqf";
if (isServer || isDedicated) then {
	call compile preProcessFileLineNumbers "aoi\aoi_serverFunctions.sqf";
	
	// Defines
	aoi_hostileInfantry = [aoiGarrisonInfantryToOwnerMapping, "hostiles"] call dzn_fnc_getValueByKey;
	aoi_alliedInfantry = [aoiGarrisonInfantryToOwnerMapping, "allies"] call dzn_fnc_getValueByKey;
	aoi_hostileVehicles = "hostiles" call fnc_aoi_s_getAllowedVehicleTypes;
	aoi_alliedVehicles = "allies" call fnc_aoi_s_getAllowedVehicleTypes;
};

// if (hasInterface) then {};
