// Gear Kits

// ******** USEFUL MACROSES *******
#define EMPTYKIT	[["","","","",""],["","","","",""],["","","","",""],["","","","",""],[],[["",0],["",0],["",0],["",0],["",0],["",0],["",0],["",0],["",0]],[["",0],["",0],["",0],["",0],["",0],["",0]],[]]
#define EMPTYWEAPON	["","","",""]
// Macros for the list of items to be chosen randomly
#define RANDOM_ITEM	["H_HelmetB_grass","H_HelmetB"]
// Macros to give the item only if daytime is in given inerval (e.g. to give NVGoggles only at night)
#define NIGHT_ITEM(X)	if (daytime < 9 || daytime > 18) then { X } else { "" }

// =====================
//         KITS 
// =====================

// Allies
kit_allies_R = EMPTYKIT;
kit_allies_AR = EMPTYKIT;
kit_allies_G = EMPTYKIT;
kit_allies_AT = EMPTYKIT;
kit_allies_C = EMPTYKIT;

// Hostiles
kit_hostiles_R = EMPTYKIT;
kit_hostiles_AR = EMPTYKIT;
kit_hostiles_G = EMPTYKIT;
kit_hostiles_AT = EMPTYKIT;
kit_hostiles_C = EMPTYKIT;

// =====================
//     VEHICLE KITS
// =====================
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
