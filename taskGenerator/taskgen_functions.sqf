#define DEBUG	true

fnc_s_taskGen_getSquadsWithoutTask = {
	// @ListOfSquads = @SquadLogics call fnc_s_taskGen_getSquadsWithoutTask
	private ["_squadsWithoutTasks"];
	
	_squadsWithoutTasks = [];
	{
		if !(_x getVariable "isOnTask") then {
			_squadsWithoutTasks pushBack _x;		
		};	
	} forEach _this;
	
	_squadsWithoutTasks
};

fnc_s_taskGen_generateTask = {
	// @Squad spawn fnc_s_taskGen_generateTask;
	private["_squad","_taskAOI","_taskAOIs","_task"];
	_squad = _this;

	// Choose task
	_taskAOIs = [];	
	if (round(random 100) > round(taskGen_hostileToAlliesTaskCoef*100)) then {
		// Allied AOI task
		if (DEBUG) then {player sideChat format ["ALLIED TASK for %1 squad", _squad getVariable "squadName"];};
		
		_task = taskGen_taskList_allies call BIS_fnc_selectRandom;
		{
			if (_x select 1 select 1 == "allies") then {
				_taskAOIs pushBack (_x select 0);
			};
		} forEach aoiToPropertiesMapping;		
	} else {
		// Hostile AOI task
		if (DEBUG) then { player sideChat format ["HOSTILE TASK for %1 squad", _squad getVariable "squadName"];};

		_task = taskGen_taskList_hostiles call BIS_fnc_selectRandom;
		{
			if (_x select 1 select 1 == "hostiles") then {
				_taskAOIs pushBack (_x select 0);
			};
		} forEach aoiToPropertiesMapping;
	};
	
	// Choose task's AOI
	_taskAOI = _taskAOIs call BIS_fnc_selectRandom;	
	
	_squad setVariable ["isOnTask", true, true];
	_squad setVariable ["task", [_task, _taskAOI], true];
	{
		_x setVariable ["taskInitialized", false, true];
	} forEach (synchronizedObjects _squad);
	
	// Run on server side
	[_squad, _taskAOI, true] execVM format ["taskGenerator\tasks\%1.sqf",_task];
};
