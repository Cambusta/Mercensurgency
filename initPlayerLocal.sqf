if (isNil "missionParametersSet") then {
	missionParametersSet = true;
	
	waitUntil {!isNil "dzn_fnc_getMissionParametes"};
	call dzn_fnc_getMissionParametes;

	// Set Date, Daytime and Weather	
	[par_daytime, par_month, par_year] call dzn_fnc_setDateTime;
	
  	// Respawn Time
  	setPlayerRespawnTime par_respawnTime;
  	
	[] spawn {
		waitUntil {!isNil "aoiInitialized"};
		[] spawn fnc_drawGarrisonMarkers;
	};
};
