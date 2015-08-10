if (isNil "missionParametersSet") then {	
	waitUntil {!isNil "dzn_fnc_getMissionParametes"};
	call dzn_fnc_getMissionParametes;

	// Set Date, Daytime and Weather	
	[par_daytime, par_month, par_year] call dzn_fnc_setDateTime;
  
	missionParametersSet = true;
};
