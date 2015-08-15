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
kit_allies_R = [["U_I_CombatUniform","V_PlateCarrierIA1_dgtl","","H_HelmetIA","G_Lowprofile"],["arifle_Mk20_ACO_pointer_F","optic_ACO_grn","","acc_pointer_IR",""],["","","","",""],["hgun_ACPC2_F","","","",""],["ItemMap","ItemCompass","ItemWatch","ItemRadio",NIGHT_ITEM("NVGoggles_INDEP")],[["30Rnd_556x45_Stanag",9],["",0],["9Rnd_45ACP_Mag",2],["HandGrenade",2],["SmokeShell",1],["SmokeShellGreen",1],["Chemlight_green",2],["",0],["",0]],[["FirstAidKit",1],["",0],["",0],["",0],["",0],["",0]],[]];
kit_allies_AR = [["U_I_CombatUniform_shortsleeve","V_PlateCarrierIA2_dgtl","","H_HelmetIA_camo",""],["LMG_Mk200_LP_BI_F","","","acc_pointer_IR","bipod_03_F_blk"],["","","","",""],["hgun_ACPC2_F","","","",""],["ItemMap","ItemCompass","ItemWatch","ItemRadio",NIGHT_ITEM("NVGoggles_INDEP")],[["200Rnd_65x39_cased_Box",2],["",0],["9Rnd_45ACP_Mag",2],["HandGrenade",2],["SmokeShell",1],["SmokeShellGreen",1],["Chemlight_green",2],["",0],["",0]],[["FirstAidKit",1],["",0],["",0],["",0],["",0],["",0]],[]];
kit_allies_G = [["U_I_CombatUniform","V_PlateCarrierIAGL_dgtl","","H_HelmetIA_net","G_Sport_Blackyellow"],["arifle_Mk20_GL_ACO_F","optic_ACO_grn","","",""],["","","","",""],["hgun_ACPC2_F","","","",""],["ItemMap","ItemCompass","ItemWatch","ItemRadio",NIGHT_ITEM("NVGoggles_INDEP")],[["30Rnd_556x45_Stanag",5],["",0],["9Rnd_45ACP_Mag",2],["1Rnd_SmokePurple_Grenade_shell",1],["HandGrenade",2],["MiniGrenade",2],["1Rnd_HE_Grenade_shell",8],["SmokeShell",1],["SmokeShellGreen",1]],[["FirstAidKit",1],["",0],["",0],["",0],["",0],["",0]],[]];
kit_allies_AT = [["U_I_CombatUniform","V_PlateCarrierIA2_dgtl","I_Fieldpack_oli_LAT","H_HelmetIA","G_Aviator"],["arifle_Mk20_ACO_pointer_F","optic_ACO_grn","","acc_pointer_IR",""],["launch_NLAW_F","","","",""],["hgun_ACPC2_F","","","",""],["ItemMap","ItemCompass","ItemWatch","ItemRadio",NIGHT_ITEM("NVGoggles_INDEP")],[["30Rnd_556x45_Stanag",5],["NLAW_F",2],["9Rnd_45ACP_Mag",2],["SmokeShell",1],["SmokeShellGreen",1],["Chemlight_green",2],["",0],["",0],["",0]],[["FirstAidKit",1],["",0],["",0],["",0],["",0],["",0]],[]];
kit_allies_C = [["U_I_CombatUniform_shortsleeve","V_Chestrig_oli","","H_MilCap_dgtl",""],["arifle_Mk20_ACO_F","optic_ACO_grn","","",""],["","","","",""],["hgun_ACPC2_F","","","",""],["ItemMap","ItemCompass","ItemWatch","ItemRadio",NIGHT_ITEM("NVGoggles_INDEP")],[["30Rnd_556x45_Stanag",3],["",0],["9Rnd_45ACP_Mag",2],["SmokeShell",1],["SmokeShellGreen",1],["Chemlight_green",2],["",0],["",0],["",0]],[["FirstAidKit",1],["",0],["",0],["",0],["",0],["",0]],[]];

// Hostiles
kit_hostiles_R = [["U_O_CombatUniform_ocamo","V_HarnessO_brn","","H_HelmetO_ocamo",""],["arifle_Katiba_ACO_pointer_F","optic_ACO_grn","","acc_pointer_IR",""],["","","","",""],["hgun_Rook40_F","","","",""],["ItemMap","ItemCompass","ItemWatch","ItemRadio",NIGHT_ITEM("NVGoggles_OPFOR")],[["30Rnd_65x39_caseless_green",9],["",0],["16Rnd_9x21_Mag",2],["Chemlight_red",2],["HandGrenade",2],["SmokeShell",1],["SmokeShellRed",1],["",0],["",0]],[["FirstAidKit",1],["",0],["",0],["",0],["",0],["",0]],[]];
kit_hostiles_AR = [["U_O_CombatUniform_ocamo","V_HarnessO_brn","","H_HelmetO_ocamo",""],["LMG_Zafir_pointer_F","","","acc_pointer_IR",""],["","","","",""],["hgun_Rook40_F","","","",""],["ItemMap","ItemCompass","ItemWatch","ItemRadio",NIGHT_ITEM("NVGoggles_OPFOR")],[["150Rnd_762x54_Box",3],["",0],["16Rnd_9x21_Mag",2],["HandGrenade",2],["SmokeShell",1],["SmokeShellRed",1],["Chemlight_red",2],["",0],["",0]],[["FirstAidKit",1],["",0],["",0],["",0],["",0],["",0]],[]];
kit_hostiles_G = [["U_O_CombatUniform_ocamo","V_HarnessOGL_brn","","H_HelmetLeaderO_ocamo",""],["arifle_Katiba_GL_ACO_F","optic_ACO_grn","","",""],["","","","",""],["hgun_Rook40_F","","","",""],["ItemMap","ItemCompass","ItemWatch","ItemRadio",NIGHT_ITEM("NVGoggles_OPFOR")],[["30Rnd_65x39_caseless_green",5],["",0],["16Rnd_9x21_Mag",2],["Chemlight_red",2],["1Rnd_Smoke_Grenade_shell",2],["1Rnd_SmokeRed_Grenade_shell",1],["HandGrenade",2],["MiniGrenade",2],["1Rnd_HE_Grenade_shell",8]],[["FirstAidKit",1],["",0],["",0],["",0],["",0],["",0]],[]];
kit_hostiles_AT = [["U_O_CombatUniform_ocamo","V_TacVest_khk","B_FieldPack_cbr_LAT","H_HelmetO_ocamo",""],["arifle_Katiba_ACO_F","optic_ACO_grn","","",""],["launch_RPG32_F","","","",""],["hgun_Rook40_F","","","",""],["ItemMap","ItemCompass","ItemWatch","ItemRadio",NIGHT_ITEM("NVGoggles_OPFOR")],[["30Rnd_65x39_caseless_green",5],["RPG32_F",2],["16Rnd_9x21_Mag",2],["Chemlight_red",2],["SmokeShell",1],["SmokeShellRed",1],["RPG32_HE_F",2],["",0],["",0]],[["FirstAidKit",1],["",0],["",0],["",0],["",0],["",0]],[]];
kit_hostiles_C = [["U_O_CombatUniform_ocamo","V_BandollierB_khk","","H_MilCap_ocamo",""],["arifle_Katiba_ACO_F","optic_ACO_grn","","",""],["","","","",""],["hgun_Rook40_F","","","",""],["ItemMap","ItemCompass","ItemWatch","ItemRadio",NIGHT_ITEM("NVGoggles_OPFOR")],[["30Rnd_65x39_caseless_green",3],["",0],["16Rnd_9x21_Mag",2],["Chemlight_red",2],["SmokeShell",1],["SmokeShellRed",1],["",0],["",0],["",0]],[["FirstAidKit",1],["",0],["",0],["",0],["",0],["",0]],[]];

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
