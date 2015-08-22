// Properties
private["_squadLogic"];
waitUntil { !isNil "squadInitialized" };

if( !isNil {player getVariable "squadLogic"} ) then {
	_squadLogic = player getVariable "squadLogic";
	dzn_market_accountCash = [_squadLogic getVariable (name player), "cash"] call dzn_fnc_getValueByKey;
}
else { 
	dzn_market_accountCash = par_startCash;
};

dzn_market_sellCoefficient = _this select 0;

// Include functions
#include "dzn_market_inventory.sqf"

// Include functions
#include "dzn_market_functions.sqf"




[
	marketBox, 
	["FirstAidKit"], 
	true,
	true
] call BIS_fnc_addVirtualItemCargo;

[marketBox, dzn_market_itemList] call dzn_fnc_market_updateMarketBox;

	
	
waitUntil {!isNil "dzn_fnc_gear_getGear" && !isNil "dzn_fnc_gear_assignGear"};
player setVariable ["ArsenalOpened",false];
player setVariable ["ArsenalTimer",time + 1];
player setVariable ["market_CashSyncTimer",time + 300];

[] spawn {
	["arsenal", "onEachFrame", {
		if !(isNull ( uinamespace getvariable "RSCDisplayArsenal" )) then {
			if !(player getVariable "ArsenalOpened") then {
				player setVariable ["ArsenalOpened",true];
				
				player setVariable ["CurrentGear", player call dzn_fnc_gear_getGear];
				player setVariable ["BaseInv", (player call BIS_fnc_saveInventory) call dzn_fnc_convertInventoryToLine];
			};
			
			if (time > player getVariable "ArsenalTimer") then {
				player setVariable ["ArsenalTimer",time + 1];
				_currentInv = (player call BIS_fnc_saveInventory) call dzn_fnc_convertInventoryToLine;
				_diff = [_currentInv, player getVariable "BaseInv"] call dzn_fnc_getChangedInvItems;
				
				if !(_diff isEqualTo []) then {
					_diff call dzn_fnc_market_invTotals;			
				};
			};
		} else {
			if (player getVariable "ArsenalOpened") then {
				player setVariable ["ArsenalOpened",false];				
				player setVariable ["NewGear", (player call dzn_fnc_gear_getGear)];
				
				if !((player getVariable "CurrentGear") isEqualTo (player getVariable "NewGear")) then {
					[ player, player getVariable "CurrentGear" ] spawn dzn_fnc_gear_assignGear;					
					0 = createDialog "dzn_market_dialog";					
				};				
			};
		};
	
	if(time > player getVariable "market_CashSyncTimer") then {
		player setVariable ["market_CashSyncTimer",time + 300];
		
                [_squadLogic getVariable (name player), "cash", dzn_market_accountCash] call dzn_fnc_setValueByKey;
                (player getVariable "squadLogic") setVariable [
                        name player,
                        (player getVariable "squadLogic")  getVariable (name player),
                        true
                ];
	};
	
	}] call BIS_fnc_addStackedEventHandler;
};
