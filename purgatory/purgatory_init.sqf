private["_b","_basicPos","_basicObject","_o","_to","_i","_j","_k","_length","_width"];


_b = "Land_VR_Block_02_F";

_initPos = [1684,5577,150]; // flat terrain
_basicPos = [-2000, -2000, 150];
purgatory_spawnPos = [(_basicPos select 0) + 27, (_basicPos select 1) + 28, (_basicPos select 2) + 6];
publicVariable "purgatory_spawnPos";

/*
  [0,0,1], [1,0,0]	- EAST vertical
  [0,0,0], [0,1,0]	- NORTH vertical
*/ 

_basicObject = createVehicle [_b, _initPos, [], 0, "NONE"]; 
_basicObject setPosASL _basicPos;

_length = 4; //31
_width = 5;  //5
 
for "_i" from 0 to _length do {
	for "_j" from 0 to _width do {	
		_o = createVehicle [_b, _basicPos, [], 0, "NONE"];
		_o attachTo [_basicObject, [11.9 * _i, 11.9 * _j, 0]];
		
		if (_j in [0,_width]) then {
			for "_k" from 0 to 2 do {
				_o  = createVehicle [_b, _basicPos, [], 0, "NONE"];
				_o attachTo [_basicObject, [12 * _i, 12 * _j, 0 + 12 * _k]];
				_o setVectorDirAndUp [ [1,0,0], [0,1,0] ];
			};
		};
		
		if (_i in [0, _length]) then {
			for "_k" from 0 to 2 do {
				_o  = createVehicle [_b, _basicPos, [], 0, "NONE"];
				_o attachTo [_basicObject, [12 * _i, 12 * _j, 0 + 12 * _k]];
				_o setVectorDirAndUp [ [0,0,1], [1,0,0] ];
			};
		};
		
		if (_i == 2 && _j == 2) then {
			_o = createVehicle ["Land_MilOffices_V1_F", _basicPos, [], 0, "NONE"];
			_o attachTo [_basicObject, [12 * _i, 12 * _j, 5]];
			_o setDir 90;
		};
		
		/*
		// Popup Targets
		if (_i in [10, 15, 20, 25, 30] && _j in [1,2,3,4]) then {
			_to = createVehicle ["TargetP_Inf_F", _basicPos, [], 0, "NONE"];
			_to attachTo [_basicObject, [12 * _i, 12 * _j, 3]];
			_to setDir 90;			
		};
		
		// Bunkers
		if (_i == 6 && _j in [1,4]) then {
			_o = createVehicle ["Land_HBarrierTower_F", _basicPos, [], 0, "NONE"];
			_o attachTo [_basicObject, [12 * _i, 12 * _j, 4]];
			_o setDir 270;			
		};
		
		*/
	
	};
};
