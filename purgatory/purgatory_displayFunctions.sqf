fnc_c_purgatory_onPurgatoryTitleLoad = {
	private ["_display", "_ctrl"];
	disableSerialization;
	_display = _this select 0;	
	
	if !(isNil {player getVariable "purgatory_actionDeploy"}) then {
		// Deploy available
		_ctrl = _display displayCtrl 1012;
		_ctrl ctrlSetBackgroundColor [0,0.6,0,1];	
		_ctrl ctrlCommit 0;
	
		_ctrl = _display displayCtrl 1013;
		_ctrl ctrlSetText "AVAILABLE";
		_ctrl ctrlSetBackgroundColor [0.0,0.6,0,0.4];
		_ctrl ctrlCommit 0;	
	
	} else {
		// Deploy unavailable
		_ctrl = _display displayCtrl 1012;
		_ctrl ctrlSetBackgroundColor [0.6,0,0,1];	
		_ctrl ctrlCommit 0;
	
		_ctrl = _display displayCtrl 1013;
		_ctrl ctrlSetText "NOT AVAILABLE";
		_ctrl ctrlSetBackgroundColor [0.6,0,0,0.4];
		_ctrl ctrlCommit 0;	
	};	
};

fnc_c_purgatory_showPurgatorySpawnIndicator = {
	1015 cutRsc ["purgatorySpawnTitle", "PLAIN"];
};

fnc_c_purgatory_hidePurgatorySpawnIndicator = {
	1015 cutText ["", "PLAIN"];
};
