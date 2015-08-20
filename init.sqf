enableSaving [false, false];
enableSentences false;

#include "defines.sqf";
#include "commonFunctions.sqf";

// dzn_gear
// 0: true or false - Edit mode activation, 1: true/false - is Server-side only
[false] execVM "dzn_gear\dzn_gear_init.sqf";
// dzn_dynai
[] execVM "dzn_dynai\dzn_dynai_init.sqf";


[] execVM "aoi\aoi_init.sqf";
