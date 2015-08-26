private["_b","_basicPos","_basicObject","_o","_to","_i","_j","_k"];

purgatory_spawnPos = [1735, 5622, 56];
publicVariable "purgatory_spawnPos";


_b = "Land_VR_Block_02_F";
_basicPos = [1697, 5598, 50];
_basicObject = createVehicle [_b, _basicPos, [], 0, "NONE"];

/*
  [0,0,1], [1,0,0]	- EAST vertical
  [0,0,0], [0,1,0]	- NORTH vertical
*/ 
 
for "_i" from 0 to 31 do {
	for "_j" from 0 to 5 do {	
		_o = createVehicle [_b, _basicPos, [], 0, "NONE"];
		_o attachTo [_basicObject, [11.9 * _i, 11.9 * _j, 0]];
		
		if (_j in [0,5]) then {
			for "_k" from 0 to 2 do {
				_o  = createVehicle [_b, _basicPos, [], 0, "NONE"];
				_o attachTo [_basicObject, [12 * _i, 12 * _j, 0 + 12 * _k]];
				_o setVectorDirAndUp [ [1,0,0], [0,1,0] ];
			};
		};
	
		if (_i in [10, 15, 20, 25, 30] && _j in [1,2,3,4]) then {
			_to = createVehicle ["TargetP_Inf_F", _basicPos, [], 0, "NONE"];
			_to attachTo [_basicObject, [12 * _i, 12 * _j, 3]];
			_to setDir 90;			
		};
	
		if (_i in [0, 31]) then {
			for "_k" from 0 to 2 do {
				_o  = createVehicle [_b, _basicPos, [], 0, "NONE"];
				_o attachTo [_basicObject, [12 * _i, 12 * _j, 0 + 12 * _k]];
				_o setVectorDirAndUp [ [0,0,1], [1,0,0] ];
			};
		};
		
		
		if (_i == 3 && _j == 2) then {
			_o = createVehicle ["Land_MilOffices_V1_F", _basicPos, [], 0, "NONE"];
			_o attachTo [_basicObject, [12 * _i, 12 * _j, 5]];
			_o setDir 90;
		};
		
		if (_i == 6 && _j in [1,4]) then {
			_o = createVehicle ["Land_HBarrierTower_F", _basicPos, [], 0, "NONE"];
			_o attachTo [_basicObject, [12 * _i, 12 * _j, 4]];
			_o setDir 270;			
		};
	};
};
