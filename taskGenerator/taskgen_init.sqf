if (!isNil "taskGeneratorInitialized") exitWith {};

waitUntil {!isNil "squadInitialized"};
waitUntil { time > 5 };

#include "taskGen_functions.sqf";

if (isServer || isDedicated) then {
	taskgen_checkTimer 		= 20; // seconds

	taskGen_taskList_allies		= ["proxyTask"]; 
	taskGen_taskList_hostiles	= ["proxyTask"];

	taskGen_hostileToAlliesTaskCoef	= 0.65; // 65% that task will be HOSTILE type
	[] execFSM "taskGenerator\taskgen_loop.fsm";
	
	taskGeneratorInitialized = true;
	publicVariable "taskGeneratorInitialized";
};

if (hasInterface && { !isNull player && isNil "playerTaskListenerInitialized" }) then {
	playerTaskListenerInitialized = true;
	
	taskgen_playerCheckTimer	= 20; // seconds

	player setVariable ["taskInitialized", true, true];
	[] execFSM "taskGenerator\taskgen_playerListenerloop.fsm";
};
