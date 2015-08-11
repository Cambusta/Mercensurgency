// Here will be common arrays and other configurable stuff for mission

// AoI to Properties
// [ @IDNumber,	[ @DisplayName, @OwnBy ] ]
aoiToPropertiesMapping = [
	[aoi_0,		["Stratis Air Base",	"allies"]]
	,[aoi_1,	["Agia Marina",		"allies"]]
	,[aoi_2,	["Girna",		"hostiles"]]
	,[aoi_3,	["Old Outpost",		"allies"]]
	,[aoi_4,	["LZ Conor",		"hostiles"]]
	,[aoi_5,	["Kamino Firing Range",	"allies"]]
	,[aoi_6,	["Camp Tempest",	"hostiles"]]
	,[aoi_7,	["Camp Maxwell",	"hostiles"]]
	,[aoi_8,	["Air Station Mike-25",	"hostiles"]]
];

// AOI's Garrisons
// [ @GarrisonType,	@MarkerType,	@DYNAI_STUFF]
aoiGarrisonsTypes = [
	[ "Squad",	["group1",	[]]]
	,["Platoon",	["group3",	[]]]
	,["Squad_Veh",	["o_motor_inf",	[]]]
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
