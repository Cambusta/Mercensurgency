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
				_sqLogic setVariable ["isOnTask", false, true];
		   	};
   		} forEach _units;
	} forEach squadLogics;
	
	squadInitialized = true;
	publicVariable "squadInitialized";
};

if (hasInterface && { !isNull player && isNil "playerSquadInitialized" }) then {
	playerSquadInitialized = true;
	waitUntil { !isNil "squadInitialized" };
	
	{
		if (typeOf _x == "Logic" && !isNil {_x getVariable "squadName"}) then {
			if (isNil {_x getVariable (name player)}) then {
				_x setVariable [(name(player)), [
			   		["cash",	par_startCash]
			   		,["perks",	[]]
			   	], true];
			};
			player setVariable ["squadLogic", _x, true];
		};
	} forEach (synchronizedObjects player);
};
