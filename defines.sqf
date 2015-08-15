// Here will be common arrays and other configurable stuff for mission

// AoI to Properties
// [ @IDNumber,	[ @DisplayName, @OwnBy ] ]
aoiToPropertiesMapping = [
	[aoi_0,	["Stratis Air Base",	"allies"]]
	,[aoi_1,	["Agia Marina",		"allies"]]
	,[aoi_2,	["Girna",			"hostiles"]]
	,[aoi_3,	["Old Outpost",		"allies"]]
	,[aoi_4,	["LZ Conor",		"hostiles"]]
	,[aoi_5,	["Kamino Firing Range",	"allies"]]
	,[aoi_6,	["Camp Tempest",		"hostiles"]]
	,[aoi_7,	["Camp Maxwell",		"hostiles"]]
	,[aoi_8,	["Air Station Mike-25",	"hostiles"]]
];

// AOI's Garrisons
// [ @GarrisonType, @MarkerType[Allied, Hostile], @DYNAI_STUFF]
aoiGarrisonsToMarkerMapping = [
	 ["1FT", 		"b_unknown"]
	,["1AT", 		"b_unknown"]
	,["2FT", 		"b_inf"]
	,["1FT_1AT", 	"b_inf"]
	,["3FT", 		"b_recon"]
	,["2FT_1AT", 	"b_recon"]
	,["1FT_1VH", 	"b_motor_inf"]
	,["2FT_1VH", 	"b_motor_inf"]
	,["2FT_2VH", 	"b_mech_inf"]
	,["3FT_1VH", 	"b_mech_inf"]
	,["3FT_2VH", 	"b_armor"]
];

aoiGarrisonToWeightMapping = [
	 ["1FT", 		[1, 5]]
	,["1AT", 		[2, 5]]
	,["2FT", 		[3, 7]]
	,["1FT_1AT", 	[4, 7]]
	,["3FT", 		[5, 10]]
	,["2FT_1AT", 	[5, 10]]
	,["1FT_1VH", 	[5, 10]]
	,["2FT_1VH", 	[8, 100]]
	,["2FT_2VH", 	[12, 100]]
	,["3FT_1VH", 	[10, 100]]
	,["3FT_2VH", 	[14, 100]]
];

aoiGarrisonToLocationTypeMapping = [
	 ["LocationVillage_F", 		5	]
	,["LocationCity_F", 		10	]
	,["LocationCityCapital_F", 	15	]
	,["LocationArea_F", 		10	]
	,["LocationOutpost_F", 		8	]
	,["LocationCamp_F", 		20	]
	,["LocationFOB_F", 		30	]
];

aoiAmountToWeightMapping = [
	 [0, 0.25]
	,[1, 0.5]
	,[2, 1]
	,[3, 1.3]
	,[4, 2]
];

aoiGarrisonInfantryToOwnerMapping = [
	 ["allies",		"I_Soldier_F"]
	,["hostiles", 	"O_Soldier_F"]
];

aoiGarrisonVehiclesToOwnerMapping = [
	 [
		"allies",		
		[
			[/*Tech*/ "I_G_Offroad_01_armed_F"],
			[/*Light*/ "I_MRAP_03_hmg_F"],
			[/*Medium*/ "I_APC_Wheeled_03_cannon_F"],
			[/*Heavy*/ "I_MBT_03_cannon_F"]
		]
	]
	,[
		"hostiles",		
		[
			[/*Tech*/ "O_G_Offroad_01_armed_F", "O_G_Offroad_01_armed_F"],
			[/*Light*/ "O_MRAP_02_hmg_F"],
			[/*Medium*/ "O_APC_Wheeled_02_rcws_F"],
			[/*Heavy*/ "O_MBT_02_cannon_F"]
		]
	]
];

#define	G_Fireteam		"[['%1',[],'kit_%2_R'],['%1',[],'kit_%2_AR'],['%1',[],'kit_%2_G'],['%1',[],'kit_%2_R']]"
#define	G_ATTeam		"[['%1',[],'kit_%2_AT'],['%1',[],'kit_%2_R'],['%1',[],'kit_%2_AT']]"
#define	G_Indoors2		"[['%1',['indoors'],'kit_%2_R'], ['%1',['indoors'],'kit_%2_G']]"
#define	G_Indoors3		"[['%1',['indoors'],'kit_%2_R'], ['%1',['indoors'],'kit_%2_G'], ['%1',['indoors'],'kit_%2_R']]"
#define	G_CVehicle		"[['%3','isVehicle','%4'],['%1',[0,'driver'],'%2'],['%1',[0,'gunner'],'%2'],['%1',[0,'commander'],'%2']]"

aoiGarrisonsToGroupReferencesMapping = [
	[
		"1FT", 	
		format ["[[%1,%2]]", 1, G_Fireteam]
	]
	,[
		"1AT", 
		format ["[[%1,%2],[%3,%4]]", 1, G_Fireteam, 1, G_Indoors2]
	]
	,[
		"2FT",
		format ["[[%1,%2],[%3,%4]]", 2, G_Fireteam, 1, G_Indoors2]
	]
	,[
		"1FT_1AT", 
		format ["[[%1,%2],[%3,%4],[%5,%6]]", 1, G_Fireteam, 1, G_ATTeam, 1, G_Indoors2]
	]
	,[
		"3FT",
		format ["[[%1,%2],[%3,%4]]", 3, G_Fireteam, 1, G_Indoors3]
	]
	,[
		"2FT_1AT", 
		format ["[[%1,%2],[%3,%4],[%5,%6]]", 2, G_Fireteam, 1, G_ATTeam, 1, G_Indoors3]		
	]
	,[
		"1FT_1VH",
		format ["[[%1,%2],[%3,%4],[%5,%6]]", 1, G_Fireteam, 1, G_CVehicle, 1, G_Indoors2]	
	]
	,[
		"2FT_1VH", 
		format ["[[%1,%2],[%3,%4],[%5,%6]]", 2, G_Fireteam, 1, G_CVehicle, 1, G_Indoors3]
	]
	,[
		"2FT_2VH",
		format ["[[%1,%2],[%3,%4],[%5,%6]]", 2, G_Fireteam, 2, G_CVehicle, 1, G_Indoors3]
	]
	,[
		"3FT_1VH",
		format ["[[%1,%2],[%3,%4],[%5,%6]]", 3, G_Fireteam, 1, G_CVehicle, 1, G_Indoors3]
	]
	,[	
		"3FT_2VH",
		format ["[[%1,%2],[%3,%4],[%5,%6]]", 3, G_Fireteam, 2, G_CVehicle, 1, G_Indoors3]
	]
];



// Enviroment Setting mapping
weatherSettingsMapping = [
	[1, 0],
	[2, 0.25],
	[3, 0.5],
	[4, 0.75],
	[5, 1]
];

fogSettingsMapping = [
	[1, [0, 0.01, 0]],
	[2, [0.5, 0.02, 0]],
	[3, [1, 0.01, 0]]
];
