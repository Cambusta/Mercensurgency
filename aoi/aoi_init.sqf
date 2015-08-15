/*
	Area of Interests - According to Mission Parameters and Locations
*/

#include "aoi_commonFunctions.sqf";
if (isServer || isDedicated) then {
	#include "aoi_serverFunctions.sqf";
	
	waitUntil { time > 1 };
	call fnc_aoi_s_initializeAOIs;
		
	waitUntil { time > 6 };
	call fnc_aoi_s_spawnGarrisons
};
