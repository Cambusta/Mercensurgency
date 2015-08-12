fnc_s_initializeAOIs = {
	// call fnc_initializeAOIs
	private ["_aoi", "_displayName", "_owner", "_area", "_triggers"];
	
	{
		// _x = [aoi_0, ["Stratis Air Base", resistance]]
		if (!isNil format["%1", _x select 0]) then {
			_aoi = _x select 0;
			_displayName = _x select 1 select 0;
			_owner = _x select 1 select 1;
			_area = [];
			
			_triggers = synchronizedObjects _aoi;
			{
				player sideChat str[_x];
				_loc = [_x, false] call dzn_fnc_convertTriggerToLocation;
				player sideChat str[_loc];
				_area pushBack _loc;
			} forEach _triggers;
			
			_aoi setVariable ["area", _area, true];
			_aoi setVariable ["ownedBy", _owner, true];
			_aoi setVariable ["displayName", _displayName, true];
			_aoi setVariable ["garrison", _aoi call fnc_s_selectGarrison, true];
			
			// Spawn
		};
	} forEach aoiToPropertiesMapping;
	
	aoiInitialized = true;
	publicVariable "aoiInitialized";
};

fnc_s_selectGarrison = {
	// @TemplateName (String) = @AOI call fnc_s_selectGarrison
	private["_garrisonType", "_aoiWeight"]
	_garrisonType = "":
	
	// AOI Weight relative to Location type
	_aoiWeight = [aoiGarrisonToLocationTypeMapping, typeOf _this] call dzn_fnc_getValueByKey;
	
	// AOI Weight relative to Mission Parameter - Side Amount
	_aoiWeigthMultiplier = 	if (_this getVariable "ownedBy" == "allies") then {
		[aoiAmountToWeightMapping, par_alliedForces_amount] call dzn_fnc_getValueByKey
	} else {
		[aoiAmountToWeightMapping, par_hostileForces_amount] call dzn_fnc_getValueByKey
	};
	_aoiWeight = _aoiWeight * _aoiWeigthMultiplier;
	
	_garrisonTypes = [];
	
	//aoiGarrisonToWeightMapping
	{
		if (_aoiWeight > (_x select 1)) then {
			_garrisonTypes pushBack (_x select 0);
		};
	} forEach aoiGarrisonToWeightMapping;
	
	_garrisonType = _garrisonTypes call BIS_fnc_selectRandom;
	
	_garrisonType
};
