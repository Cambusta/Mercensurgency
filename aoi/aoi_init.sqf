/*
	Area of Interests - According to Mission Parameters and Locations
*/

#include "aoi\aoi_commonFunctions.sqf";
if (isServer || isDedicated) then {
	#include "aoi\aoi_serverFunctions.sqf";
};
