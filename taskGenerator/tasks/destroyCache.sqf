// [@Squad, @AOI, @IsServer] execVM "taskGenerator\tasks\destroyCache.sqf"
// [player getVariable "squadLogic", aoi_3, true] execVM "taskGenerator\tasks\destroyCache.sqf"

#define DEBUG	true
params ["_squad","_aoi",["_serverExec", false]];


// *********************************
// TASK SETTINGS
// *********************************
_taskName = format["task_%1_destroyCache_%2", _squad getVariable "squadName", round(serverTime)];
_taskSide = west;
_taskReward = 5000;
_taskDisplayName = format["Weapon cache at %1", _aoi getVariable "displayName"];
_taskDesc = format[
	"Find and destroy enemy weapon cache at %1.<br /><br />Reward:   $%2</t>"
	, _aoi getVariable "displayName"
	, _taskReward
];


// *********************************************
// TASK Server Init (called from Task Generator)
// *********************************************
if (_serverExec) exitWith {	

	_compostionObjects = [];
	_cacheObjectClass = "O_CargoNet_01_ammo_F";
	_camoNetObjectClass = "CamoNet_OPFOR_F";

	// **********************************
	// TASK INIT
	// **********************************
	if (DEBUG) then {player sideChat format ["DESTROY CACHE: EXECUTED BY SERVER SIDE for %1 squad", (_squad getVariable "squadName")];};
	
	_b = [getPos _aoi, 100] call dzn_fnc_getHousesNear;
	_cacheObject = _cacheObjectClass createVehicle (getPos _aoi);
	_cacheObject allowDamage false;
	
	if (_b isEqualTo []) then {
		_aoiPos = (_aoi getVariable "area") call dzn_fnc_getZonePosition;		
		_compostionObjects pushBack (_camoNetObjectClass createVehicle ([(_aoi getVariable "area"), _aoiPos select 1, _aoiPos select 2] call dzn_fnc_getRandomPointInZone));
		_cacheObject setPos ((_compostionObjects select 0) modelToWorld [-1,-1,0]);		
	} else {
		[_cacheObject, _b, nil, true] spawn dzn_fnc_assignInBuilding;	
	};	
	
	sleep 3;
	[_taskSide,[_taskName],[_taskDesc,_taskDisplayName,""],objNull,1,8,true,"",true] call BIS_fnc_taskCreate;
	
	waitUntil { sleep 15; !alive _cacheObject };
	sleep 3;
	hint "Cache destroyed!";
};


// *******************************************************
// TASK Client Init (called from Player's Task Listener)
// *******************************************************
if (DEBUG) then {
	player sideChat format [
		"DESTROY CACHE: EXECUTED BY CLIENT for %1 SQUAD :: AOI %2",
		(_this select 0 getVariable "squadName"),
		str(_this select 1)
	];
	
	_aoiPos = (_aoi getVariable "area") call dzn_fnc_getZonePosition;		
	_taskMrk = [
		format["mrk_%1", _taskName]
		, [(_aoi getVariable "area"), _aoiPos select 1, _aoiPos select 2] call dzn_fnc_getRandomPointInZone
		, "mil_warning"
		, "ColorRED"
		, _taskDisplayName
		, true
	] call dzn_fnc_createMarkerIcon;

};
