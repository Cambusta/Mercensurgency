/*
	Area of Interests - According to Mission Parameters and Locations
*/

#include "aoi_commonFunctions.sqf";
if (isServer || isDedicated) then {
	#include "aoi_serverFunctions.sqf";
	
	waitUntil { time > 1 };
	player sideChat "AOI :: Initializing";
	call fnc_aoi_s_initializeAOIs;
	player sideChat "AOI Initialized";
	
	waitUntil { time > 6 };
	player sideChat "AOI :: Spawn Garrisons";
	call fnc_aoi_s_spawnGarrisons
};
