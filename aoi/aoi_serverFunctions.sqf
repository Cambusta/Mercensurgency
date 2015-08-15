fnc_aoi_s_initializeAOIs = {
	// call fnc_initializeAOIs
	// Method-orchestrator
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
};

fnc_aoi_s_spawnGarrisons = {
	// call fnc_aoi_s_spawnGarrisons
	// Method-orchestrator
	private ["_aoi","_side","_unitRefs"];
	{
		if (!isNil format["%1", _x select 0]) then {
			_aoi = _x select 0;
			_side = _aoi getVariable "ownedBy";
			_unitRefs = call compile format [
				[aoiGarrisonsToGroupReferencesMapping,  _aoi getVariable "garrison"] call dzn_fnc_getValueByKey	
				, [aoiGarrisonInfantryToOwnerMapping, _side] call dzn_fnc_getValueByKey
				, _side
				, ((_side call fnc_aoi_s_getAllowedVehicleTypes) call BIS_fnc_selectRandom) call BIS_fnc_selectRandom
			];
			
			{
				_x pushBack ([aoiGarrisonSkillLevelMapping, call compile format ["par_%1Forces_skill",_side]] call dzn_fnc_getValueByKey);			
			} forEach _unitRefs;
			_val = _unitRefs;
			
			[
				format["aoi_garrison_%1", str(_aoi)]
				, [aoiSidesMapping, _side] call dzn_fnc_getValueByKey
				, true
				, _aoi getVariable "area"
				, "randomize"
				, _unitRefs
				, aoiGarrisonDefaultBehaviorSettings
			] spawn dzn_fnc_dynai_addNewZone;
		};
		
		sleep 2;
	} forEach aoiToPropertiesMapping;
};


fnc_aoi_s_selectGarrison = {
	// @TemplateName (String) = @AOI call fnc_aoi_s_selectGarrison
	private["_garrisonType","_aoiWeight","_aoiWeigthMultiplier","_garrisonTypes"]	;
	
	// AOI Weight relative to Location type
	_aoiWeight = [aoiGarrisonToLocationTypeMapping, typeOf _this] call dzn_fnc_getValueByKey;
	_aoiWeigthMultiplier = [
		aoiAmountToWeightMapping, 
		call compile format [ "par_%1Forces_amount", _this getVariable "ownedBy"];
	] call dzn_fnc_getValueByKey;
	
	_aoiWeight = _aoiWeight * _aoiWeigthMultiplier;
	
	_garrisonTypes = [];
	#define	BETWEEN(VAL,X,Y)	(VAL >= X) && (Y >= VAL)
	{
		//if ( (_aoiWeight >= (_x select 1 select 0)) &&  ((_x select 1 select 1) >= _aoiWeight) ) then {
		
		if ( BETWEEN(_aoiWeight, _x select 1 select 0, _x select 1 select 1) ) then {
			_garrisonTypes pushBack (_x select 0);
		};
	} forEach aoiGarrisonToWeightMapping;
	
	_garrisonType = _garrisonTypes call BIS_fnc_selectRandom;
	
	_garrisonType
};

fnc_aoi_s_getAllowedVehicleTypes = {
	// @ArrayOfVehicleTypes = "allies"/"hostiles" call fnc_aoi_s_getAllowedVehicleTypes
	private["_definedVehicleClasses", "_vehicleClasses", "_vehicleTypes"];
	
	_definedVehicleClasses = [aoiGarrisonVehiclesToOwnerMapping, _this] call dzn_fnc_getValueByKey;
	_vehicleClasses = [];
	_vehicleTypes = call compile format [ "par_%1Forces_vehicles", _this];
	for "_i" from 0 to _vehicleTypes do {
		if (_i > 0) then {
			_vehicleClasses pushBack (_definedVehicleClasses select (_i - 1));
		};
	};
	_vehicleClasses
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
