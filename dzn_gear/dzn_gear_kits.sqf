// Gear Kits

// ******** USEFUL MACROSES *******
#define EMPTYWEAPON	["","","",""]
// Macros for the list of items to be chosen randomly
#define RANDOM_ITEM	["H_HelmetB_grass","H_HelmetB"]
// Macros to give the item only if daytime is in given inerval (e.g. to give NVGoggles only at night)
#define NIGHT_ITEM(X)	if (daytime < 9 || daytime > 18) then { X } else { "" }

// ******** KITS *******



// ******** VEHICLE KITS *******
kit_vehicleEmpty = [
	[],
	[["SmokeShell",20],["Chemlight_red",10]],
	[["FirstAidKit",10],["Medikit",1],["ToolKit",1]],
	[]
];

// ****************
// END OF KITS
// ****************
dzn_gear_kitsInitialized = true;
