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
	// @AOI call fnc_s_selectGarrison
	// Return @TemplateName (String)
	/*
		Calculate garrison type according to AOI type, mission parameters (count of hostiles)
		
		AOIType
		MisParam - Amount	- par_hostileForces_amount and par_alliedForces_amount
		MisParam - Vehicles?
	*/
	
	_aoiWeight = 0;
	
	switch (typeOf _this) do {
		case "": {};
		
	};
	
	
	
	"GarrisonExample"
};
