if (!isNil "missionParametersSet") exitWith {};

#include "serverFunctions.sqf";

waitUntil {!isNil "dzn_fnc_getMissionParametes"};
call dzn_fnc_getMissionParametes;

// Set Date, Daytime and Weather
[par_weather, weatherSettingsMapping] call dzn_fnc_setWeather;
[par_fog, fogSettingsMapping] call dzn_fnc_setFog;
[par_daytime, par_month, par_year] call dzn_fnc_setDateTime;

// Get mission parameters
missionParametersSet = true;

// =======================
// Initialize Purgatory
// =======================
[] execVM "purgatory\purgatory_init.sqf";
