// Remove dead body from squadLogic synchro
(player getVariable "squadLogic") synchronizeObjectsRemove [_this select 1];

if (player distance (getMarkerPos "respawn_west") < 5) then {
	// Dead
	player spawn fnc_c_purgatory_moveToPurgatory;
} else {
	// Revived
};
