fnc_aoi_s_initializeAOIs = {
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
			_aoi setVariable ["garrison", _aoi call fnc_aoi_s_selectGarrison, true];
			
			// Spawn
		};
	} forEach aoiToPropertiesMapping;
	
	aoiInitialized = true;
	publicVariable "aoiInitialized";
	
	player sideChat "AOI Initialized";
};

fnc_aoi_s_selectGarrison = {
	// @TemplateName (String) = @AOI call fnc_aoi_s_selectGarrison
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

fnc_aoi_s_aoiInfo = {
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


fnc_aoi_s_spawnGarrisons = {
	// @AOI spawn fnc_aoi_s_spawnGarrisons
	/*	
		MisPar:
		par_hostileForces_amount	0,1,2,3,4
		par_alliedForces_amount		0,1,2,3,4	
		
		par_hostileForces_vehicles	0,1,2,3,4
		par_alliedForces_vehicles	0,1,2,3,4
		
		par_hostileForces_skill		0,1,2
		par_alliedForces_skill		0,1,2	
	*/
	aoi_hostileInfantry = [aoiGarrisonInfantryToOwnerMapping, "hostiles"] call dzn_fnc_getValueByKey;
	aoi_alliedInfantry = [aoiGarrisonInfantryToOwnerMapping, "allies"] call dzn_fnc_getValueByKey;

	aoi_hostileVehicles = [aoiGarrisonVehiclesToOwnerMapping, "hostiles"] call dzn_fnc_getValueByKey;
	aoi_alliedVehicles = [aoiGarrisonVehiclesToOwnerMapping, "allies"] call dzn_fnc_getValueByKey;

	#define	VEHICLE_TYPE(TYPES,ID)	TYPES select ID
	dzn_allowedHostileVehicleClasses = switch (par_hostileForces_vehicles) do {
		case 0: { [] };
		case 1: { [ VEHICLE_TYPE(aoi_hostileVehicles,0) ] };
		case 2: { [ VEHICLE_TYPE(aoi_hostileVehicles,0), VEHICLE_TYPE(aoi_hostileVehicles,1) ] };
		case 3: { [ VEHICLE_TYPE(aoi_hostileVehicles,0), VEHICLE_TYPE(aoi_hostileVehicles,1), VEHICLE_TYPE(aoi_hostileVehicles,2) ] };
		case 4: { [ VEHICLE_TYPE(aoi_hostileVehicles,0), VEHICLE_TYPE(aoi_hostileVehicles,1), VEHICLE_TYPE(aoi_hostileVehicles,2), VEHICLE_TYPE(aoi_hostileVehicles,3) ] };
	};	
	dzn_allowedAlliedVehicleClasses = switch (par_hostileForces_vehicles) do {
		case 0: { [] };
		case 1: { [ VEHICLE_TYPE(aoi_alliedVehicles,0) ] };
		case 2: { [ VEHICLE_TYPE(aoi_alliedVehicles,0), VEHICLE_TYPE(aoi_alliedVehicles,1) ] };
		case 3: { [ VEHICLE_TYPE(aoi_alliedVehicles,0), VEHICLE_TYPE(aoi_alliedVehicles,1), VEHICLE_TYPE(aoi_alliedVehicles,2) ] };
		case 4: { [ VEHICLE_TYPE(aoi_alliedVehicles,0), VEHICLE_TYPE(aoi_alliedVehicles,1), VEHICLE_TYPE(aoi_alliedVehicles,2), VEHICLE_TYPE(aoi_alliedVehicles,3) ] };
	};
	
	
	
	{
	
	} forEach aoiToPropertiesMapping;
};

fnc_aoi_s_setUpDynaiZoneForAOI = {
	// @AOI call fnc_aoi_s_setUpDynaiZoneForAOI

	
	
};









