if (!isNil "squadInitialized") exitWith {};
waitUntil { time > 5 };

if (isServer || isDedicated) then {
	private["_sqLogic","_units"];
	{
   		_sqLogic = _x;
   		_units = synchronizedObjects _sqLogic;
   		{
   			if (_x == leader (group _x)) then {
		   		(group _x) setGroupIdGlobal [[squadLogicToNameMapping, _sqLogic] call dzn_fnc_getValueByKey];
				_sqLogic setVariable ["squadName", [squadLogicToNameMapping, _sqLogic] call dzn_fnc_getValueByKey, true];
		   	};
   		} forEach _units;
	} forEach squadLogics;
	
	squadInitialized = true;
	publicVariable "squadInitialized";
};

if (hasInterface && { !isNull player }) then {
	waitUntil { !isNil "squadInitialized" };
	
	{
		if (typeOf _x == "Logic" && !isNil {_x getVariable "squadName"} && isNil {_x getVariable (name player)}) then {
			_x setVariable [(name(player)), [
		   		["cash",	par_startCash]
		   		,["perks",	[]]
		   	], true];
		};
	} forEach (synchronizedObjects player)
};
