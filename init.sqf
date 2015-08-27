private["_multiplierCoeff"];

enableSaving [false, false];
enableSentences false;

#include "mission_defines.sqf";
#include "commonFunctions.sqf";

// dzn_gear
// 0: true or false - Edit mode activation, 1: true/false - is Server-side only
[false] execVM "dzn_gear\dzn_gear_init.sqf";
// dzn_dynai
[] execVM "dzn_dynai\dzn_dynai_init.sqf";

// AOI
[] execVM "aoi\aoi_init.sqf";

// Squad
[] execVM "squad\squad_init.sqf";

// Task Generator
[] execVM "taskGenerator\taskgen_init.sqf";

// Market
waitUntil {!isNull "par_marketSaleMultiplier"};  //par_marketSaleMultiplier returns Undefined Variable Exception upon mission start
_multiplierCoeff =
[
   [marketSaleMultiplierMapping, par_marketSaleMultiplier] call dzn_fnc_getValueByKey
] execVM "dzn_market\dzn_market_init.sqf";
