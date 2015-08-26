if (player distance (getMarkerPos "respawn_west") < 5) then {
	if (par_respawnCost > 0) then {
		hint parseText format [
			"<t size='1.25' color='#CC3300'>MEDICAL INSURANCE</t><br/>Issued in the name %1.<br/><br/>Cost $ %2."
			,name(player)
			,par_respawnCost 
		]; 
		
		// Update player's balance :: Balance - par_respawnCost
		
		sleep 5;
		// Show current balance
	};

	// Here some RAMBO-proof stuff called
	
	[player, "kit_playerDefault", false] spawn dzn_fnc_gear_assignKit;
	player setPosASL (getPosASL merc_mainBase);
} else {
	[player, revive_deathKit] call dzn_fnc_gear_setSimpleKit;
};
