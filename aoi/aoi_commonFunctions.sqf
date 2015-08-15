fnc_drawGarrisonMarkers = {
	// [@AOIObject] spawn fnc_drawGarrisonMarkers;
	private["_aoi", "_mrkPos", "_ownedBy", "_displayName", "_garrison", "_markerName", "_mrkGarrisonType", "_mrkstr"];
	
	{
		if (!isNil format["%1", _x select 0]) then {
			_aoi = _x select 0;
			_mrkPos = getPosASL _aoi;
			
			// Variable are picked from @AOI but we can pick it from (_x select 1) - [aoi_0, ["Stratis Air Base", "allies"]]
			_ownedBy = _aoi getVariable "ownedBy";
			_displayName = _aoi getVariable "displayName";
			_garrison = _aoi getVariable "garrison";
			_markerName = format["aoi_garrison_%1", _displayName];
			
			_mrkGarrisonType = [
				[aoiGarrisonsToMarkerMapping , _garrison] call dzn_fnc_getValueByKey
				,[aoiMarkerColorToSideMapping, _ownedBy] call dzn_fnc_getValueByKey
			];
			
			// Remove marker for AOI if it already exists
			if !(getMarkerPos _markerName isEqualTo [0,0,0]) then {
				deleteMarkerLocal _markerName;
			};			
			
			// Draw marker
			_mrkstr = createMarkerLocal [_markerName, [_mrkPos select 0, _mrkPos select 1]];
			_mrkstr setMarkerShapeLocal "ICON";
			_mrkstr setMarkerTypeLocal (_mrkGarrisonType select 0);
			_mrkstr setMarkerColorLocal (_mrkGarrisonType select 1);
			_mrkstr setMarkerSize [1.25,1.25];
		};
	} forEach aoiToPropertiesMapping;
};
