// [@Squad, @AOI] execVM "proxyTask.sqf"

#define DEBUG	true

// Server Stuff (called from Task Generator)
if (!isNil { _this select 2 }) exitWith {
	if (isServer || isDedicated) then {
		if (DEBUG) then {player sideChat format ["PROXY_TASK: EXECUTED BY SERVER SIDE for %1 squad", (_this select 0 getVariable "squadName")];};
	};
};

// Client Stuff (called from Player's Task Listener)
if (DEBUG) then {
	player sideChat format [
		"PROXY_TASK: EXECUTED BY CLIENT for %1 SQUAD :: AOI %2",
		(_this select 0 getVariable "squadName"),
		str(_this select 1)
	];
};
