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

[] execVM "aoi\aoi_commonFunctions.sqf";
if (isServer || isDedicated) then {
	[] execVM "aoi\aoi_serverFunctions.sqf";
};

// if (hasInterface) then {};
