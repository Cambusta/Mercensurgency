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
				_loc = [_x, false] call dzn_fnc_convertTriggerToLocation;				
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
	
	player sideChat "AOI Initialized";
};

fnc_s_selectGarrison = {
	// @TemplateName (String) = @AOI call fnc_s_selectGarrison
	private["_garrisonType","_aoiWeight","_aoiWeigthMultiplier","_garrisonTypes"]	;
	
	// AOI Weight relative to Location type
	_aoiWeight = [aoiGarrisonToLocationTypeMapping, typeOf _this] call dzn_fnc_getValueByKey;
	_aoiWeigthMultiplier = [
		aoiAmountToWeightMapping, 
		if (_this getVariable "ownedBy" == "allies") then {
			par_alliedForces_amount
		} else {
			par_hostileForces_amount
		}
	] call dzn_fnc_getValueByKey;
	
	_aoiWeight = _aoiWeight * _aoiWeigthMultiplier;	
	
	#define	BETWEEN(VAL,X,Y)	(VAL >= X) && (Y >= VAL)
	
	_garrisonTypes = [];	
	{
		//if ( (_aoiWeight >= (_x select 1 select 0)) &&  ((_x select 1 select 1) >= _aoiWeight) ) then {
		
		if ( BETWEEN(_aoiWeight, _x select 1 select 0, _x select 1 select 1) ) then {
			_garrisonTypes pushBack (_x select 0);
		};
	} forEach aoiGarrisonToWeightMapping;
	
	_garrisonType = _garrisonTypes call BIS_fnc_selectRandom;
	
	_garrisonType
};

fnc_s_aoiInfo = {
	//@AOI call fnc_s_getAOI

			
	hintSilent format [
		"Class: %1\nDisplayName: %2\nOwnedBy: %3\nGarrison: %4\nArea: %5"
		, typeOf _this
		, _this getVariable "displayName"
		, _this getVariable "ownedBy"
		, _this getVariable "garrison"
		, str(_this getVariable "area")
	];
};
