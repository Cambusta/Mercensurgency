if (player distance (getMarkerPos "respawn_west") < 5) then {
	
	[player, "kit_playerDefault", false] spawn dzn_fnc_gear_assignKit;
	// Here some RAMBO-proof stuff called
	player setPosASL purgatory_spawnPos;
	
	if (par_respawnCost > 0) then {
		hint parseText format [
			"<t size='1.25' color='#CC3300'>MEDICAL INSURANCE</t><br/>Issued in the name %1.<br/><br/>Cost $ %2."
			,name(player)
			,par_respawnCost 
		]; 
		
		// Update player's balance :: Balance - par_respawnCost		
		
		// Show current balance
		sleep 5;
	};	
} else {
	//[player, revive_deathKit] call dzn_fnc_gear_setSimpleKit;
};
