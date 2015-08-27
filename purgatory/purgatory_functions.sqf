fnc_c_purgatory_moveToPurgatory = {
	// @Unit spawn fnc_c_purgatory_moveToPurgatory
	0 cutText ["", "WHITE OUT", 0.1];
	player setPosASL purgatory_spawnPos;
	sleep 1;
	[player, "kit_playerDefault", false] spawn dzn_fnc_gear_assignKit;
	player switchMove "";	
	0 cutText ["", "WHITE IN", 1];
	
	sleep 2;
	
	(player getVariable "squadLogic") synchronizeObjectsAdd [vehicle player];
	[] execFSM "purgatory\purgatory_playerDeploymentLoop.fsm";	
};

fnc_c_purgatory_isSpawnAvailable = {
	// @Boolean = @Unit call fnc_c_purgatory_isSpawnAvailable
	private["_result", "_deadSquadCount"];
	
	_result = false;	
	_deadSquadCount = 0;
	// Check units of the squadLogic
	{
		// Check that anyone at the base - if present - Respawn is available
		if ( alive _x && [_x, getPosASL merc_mainBase, 200] call dzn_fnc_isInArea2d) exitWith {
			_result = true;			
		};
		
		// Count squadmates currently at purgatory
		if ( [_x, purgatory_spawnPos, 200] call dzn_fnc_isInArea2d ) then {
			_deadSquadCount = _deadSquadCount + 1;
		};
	} forEach (synchronizedObjects (_this getVariable "squadLogic")); // is equal to (units group _this), but should work even if players fucked up with ACE3
	
	player sideChat format [ "SPAWN_AVAILABILITY: _deadSquadCount = %1 :: _result = %1", str(_deadSquadCount), str(_result)];
	
	// If all squad mates are at purgatory - then Respawn is available
	if (_deadSquadCount == (count units group _this)) then {
		_result = true;
	};
	
	player sideChat format [ "SPAWN_AVAILABILITY: _deadSquadCount == count units group _this => %1 :: _result = %1", str(_deadSquadCount == (count units group _this)), str(_result)];
	
	// If squadmates are not at the base and not in purgatory, then check other squads - maybe someone at base
	if !(_result) then {
		{
			{
				if (alive _x && [_x, getPosASL merc_mainBase, 200] call dzn_fnc_isInArea2d) exitWith {
					_result = true;			
				};
			} forEach (synchronizedObjects _x);
			
			if (_result) exitWith {};
		} forEach squadLogics;
	};	

	player sideChat format [ "SPAWN_AVAILABILITY:_result = %1", str(_deadSquadCount), str(_result)];
	
	_result
};

fnc_c_purgatory_deployUnit = {
	// @Unit spawn purgatory_fnc_deployUnit
	0 cutText ["","WHITE OUT",1];
	sleep 2;
	
	_this setPosASL (getPosASL merc_mainBase);
	[player, "kit_playerDefault", false] spawn dzn_fnc_gear_assignKit;

	sleep 1;
	0 cutText ["", "WHITE IN", 1];
	
	if (par_respawnCost > 0) then {
		hint parseText format [
			"<t size='1.25' color='#CC3300'>MEDICAL INSURANCE</t><br/>Issued in the name %1.<br/><br/>Cost $ %2."
			,name(player)
			,par_respawnCost 
		]; 
		
		// Update player's balance :: Balance - par_respawnCost		
		// Show current balance
		sleep 5;
		hint "%UNIT BALANCE%"
	};
};

