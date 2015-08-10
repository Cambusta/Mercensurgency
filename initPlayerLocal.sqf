if (isNil "missionParametersSet") then {
  // Get mission parameters
  call dzn_fnc_getMissionParametes;
  
  // Set Date, Daytime and Weather
  par_weather call dzn_fnc_setWeather;
  par_fog call dzn_fnc_setFog;
  [par_daytime, par_month, par_year] call dzn_fnc_setDateTime;
  
  missionParametersSet = true;
};
