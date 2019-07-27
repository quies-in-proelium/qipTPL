//================= GENERAL
[
    "QS_ST_map_enableUnitIcons", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    "Enable MAP unit/vehicle Icons", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    ["qipTPL BFT Main","General"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    true, // data for this setting: [min, max, default, number of shown trailing decimals]
    1 // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
] call CBA_fnc_addSetting;

[
    "QS_ST_gps_enableUnitIcons", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    "Enable GPS unit/vehicle Icons", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    ["qipTPL BFT Main","General"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    true, // data for this setting: [min, max, default, number of shown trailing decimals]
    1 // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
] call CBA_fnc_addSetting;

[
    "QS_ST_enableGroupIcons", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    "Enable Map+GPS+HUD GROUP Icons", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    ["qipTPL BFT Main","General"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    true, // data for this setting: [min, max, default, number of shown trailing decimals]
    1 // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
] call CBA_fnc_addSetting;

[
    "QS_ST_admin", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    "Enable showing all units (even enemies) if logged in as admin on a server", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    ["qipTPL BFT Main","General"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    false, // data for this setting: [min, max, default, number of shown trailing decimals]
    1 // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
] call CBA_fnc_addSetting;

//================= MEDICAL
[
    "QS_ST_showMedicalWounded", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    "Show wounded on the map and GPS", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    ["qipTPL BFT Main","Medical"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    true, // data for this setting: [min, max, default, number of shown trailing decimals]
    1 // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
] call CBA_fnc_addSetting;

[
    "QS_ST_MedicalSystem", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "LIST", // setting type
    "Medical System that is used", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    ["qipTPL BFT Main","Medical"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [["BIS","BTC","AIS","ACE","FAR","AWS"],["BIS","BTC","AIS","ACE","FAR","AWS"],0], // data for this setting: [min, max, default, number of shown trailing decimals]
    1, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    nil,
    true
] call CBA_fnc_addSetting;

//================= DIPLOMACY
[
    "QS_ST_friendlySides_Dynamic", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    "Allow faction alliances to change dynamically", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    ["qipTPL BFT Main","Diplomacy"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    true, // data for this setting: [min, max, default, number of shown trailing decimals]
    1 // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
] call CBA_fnc_addSetting;

[
    "QS_ST_friendlySides_EAST", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "LIST", // setting type
    "East is Friendly to:", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    ["qipTPL BFT Main","Diplomacy"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [[[1],[2],[3],[1,2],[1,3],[2,3],[1,2,3]],["West","Independent","Civilians","West & Independent","West & Civilians","Independent & Civilians","All three"],2], // data for this setting: [min, max, default, number of shown trailing decimals]
    1, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    nil,
    true
] call CBA_fnc_addSetting;

[
    "QS_ST_friendlySides_WEST", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "LIST", // setting type
    "West is Friendly to:", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    ["qipTPL BFT Main","Diplomacy"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [[[0],[2],[3],[0,2],[0,3],[2,3],[0,2,3]],["East","Independent","Civilians","East & Independent","East & Civilians","Independent & Civilians","All three"],1], // data for this setting: [min, max, default, number of shown trailing decimals]
    1, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    nil,
    true
] call CBA_fnc_addSetting;

[
    "QS_ST_friendlySides_RESISTANCE", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "LIST", // setting type
    "Independent is Friendly to:", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    ["qipTPL BFT Main","Diplomacy"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [[[0],[1],[3],[0,1],[0,3],[1,3],[0,1,3]],["East","West","Civilians","East & West","East & Civilians","West & Civilians","All three"],5], // data for this setting: [min, max, default, number of shown trailing decimals]
    1, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    nil,
    true
] call CBA_fnc_addSetting;

[
    "QS_ST_friendlySides_CIVILIAN", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "LIST", // setting type
    "Civilians is Friendly to:", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    ["qipTPL BFT Main","Diplomacy"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [[[0],[1],[2],[0,1],[0,2],[1,2],[0,1,2]],["East","West","Independent","East & West","East & Independent","West & Independent","All three"],4], // data for this setting: [min, max, default, number of shown trailing decimals]
    1, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    nil,
    true
] call CBA_fnc_addSetting;

//================= DEFAULT ICON COLORS by FACTION

QS_ST_iconColor_EAST = [0.5,0,0,0.65];                            // ARRAY (NUMBER). RGBA color code.    Default [0.5,0,0,0.65];
QS_ST_iconColor_WEST = [0,0.3,0.6,0.65];                        // ARRAY (NUMBER). RGBA color code. Default [0,0.3,0.6,0.65];
QS_ST_iconColor_RESISTANCE = [0,0.5,0,0.65];                    // ARRAY (NUMBER). RGBA color code. Default [0,0.5,0,0.65];
QS_ST_iconColor_CIVILIAN = [0.4,0,0.5,0.65];                    // ARRAY (NUMBER). RGBA color code. Default [0.4,0,0.5,0.65];
QS_ST_iconColor_UNKNOWN = [0.7,0.6,0,0.5];                        // ARRAY (NUMBER). RGBA color code. Default [0.7,0.6,0,0.5];

//================= MEDICAL
QS_ST_MedicalIconColor = [1,0.41,0,1];                            // ARRAY (NUMBER). Color of medical icons in RGBA format. Default [1,0.41,0,1];
QS_ST_colorInjured = [0.75,0.55,0,0.75];                        // ARRAY (NUMBER). RGBA color code. Color of units with > 10% damage, in map group interactive interface. Default [0.7,0.6,0,0.5];

//==================================================================================//
//=========================== CONFIGURE MAP (UNIT/VEHICLE) ICONS ===================//
//==================================================================================//

QS_ST_showFactionOnly = FALSE;                                    // BOOL. will override ST_showFriendlySides TRUE. If TRUE then will only show players faction. If FALSE then can show friendly factions. Default FALSE.
QS_ST_showAI = TRUE;                                            // BOOL. FALSE = players only, TRUE = players and AI. Default TRUE.
QS_ST_AINames = TRUE;                                            // BOOL. Set TRUE to show human names for AI with the map/vehicle icons. Set FALSE and will be named 'AI'. Default FALSE.
QS_ST_showCivilianIcons = FALSE;                                // BOOL. Set TRUE to allow showing of civilians, only works if Dynamic Diplomacy is enabled above. Default FALSE.
QS_ST_iconMapText = TRUE;                                        // BOOL. TRUE to show unit/vehicle icon text on the map. FALSE to only show the icon and NO text (name/class). Default TRUE.
QS_ST_showMOS = TRUE;                                            // BOOL. TRUE = show Military Occupational Specialty text(unit/vehicle class/role display name), FALSE = disable and only show icons and names. Default FALSE.
QS_ST_showMOS_range = 3500;                                    // NUMBER. Range in distance to show MOS on the map. Default 3500.
QS_ST_showGroupOnly = TRUE;                                    // BOOL. Set TRUE to show ONLY the unit icons of THE PLAYERS GROUP MEMBERS on the MAP, FALSE to show ALL your factions units. May override other config. Default TRUE.
QS_ST_showOnlyVehicles = FALSE;                                // BOOL. Set TRUE to show ONLY vehicles, no foot-soldier units will be shown. May override other config. Default TRUE.
QS_ST_iconMapClickShowDetail = TRUE;                            // BOOL. Set TRUE to show unit/vehicle detail when player clicks on their map near the vehicle. Only works for shown vehicles. Default TRUE.
QS_ST_iconUpdatePulseDelay = 0;                                // NUMBER. How often should location of unit on the MAP be updated? 0 = as fast as possible, else if > 0 then it = time in seconds. Default 0.
QS_ST_iconShadowMap = 1;                                        // NUMBER. Icon Shadow on MAP. 0 = no shadow. 1 = shadow. 2 = outline. Must be 0, 1, or 2. Default 1.
QS_ST_iconTextSize_Map = 0.05;                                    // NUMBER. Icon Text Size on MAP display. Default is 0.05.
QS_ST_iconTextOffset = 'right';                                // STRING. Icon Text Offset. Can be 'left' or 'center' or 'right'. Default is 'right'
QS_ST_iconSize_Man = 22;                                        // NUMBER. Icon Size by Vehicle Type. Man/Units. Default = 22
QS_ST_iconSize_LandVehicle = 26;                                // NUMBER. Icon Size by Vehicle Type. Ground-based vehicles. Default = 26
QS_ST_iconSize_Ship = 24;                                        // NUMBER. Icon Size by Vehicle Type. Water-based vehicles. Default = 24
QS_ST_iconSize_Air = 24;                                        // NUMBER. Icon Size by Vehicle Type. Air vehicles. Default = 24
QS_ST_iconSize_StaticWeapon = 22;                                // NUMBER. Icon Size by Vehicle Type. Static Weapon (Mortar, remote designator, HMG/GMG. Default = 22
QS_ST_iconTextFont = [                                        // ARRAY (STRING). Icon Text Font. Only the uncommented one will be used. Do not add commas and only allow 1 to be uncommented. Default 'puristaMedium'.
    //'EtelkaMonospacePro'
    //'EtelkaMonospaceProBold'
    //'EtelkaNarrowMediumPro'
    //'LucidaConsoleB'
    //'PuristaBold'
    //'PuristaLight'
    //'puristaMedium'
    //'PuristaSemibold'
    'TahomaB'
];
QS_ST_otherDisplays = TRUE;                                    // BOOL. TRUE to add Unit/Vehicle Icon support for UAV Terminal and Artillery Computer. Runs a separate script to handle these displays. Only works if  _QS_ST_map_enableUnitIcons = TRUE;
QS_ST_MAPrequireGPSItem = TRUE;                                // BOOL. TRUE to require player have GPS in his assigned items. Default FALSE.

//==================================================================================//
//=========================== CONFIGURE GPS (UNIT/VEHICLE) ICONS ===================//
//==================================================================================//

QS_ST_GPSDist = 300;                                            // NUMBER. Distance from player that units shown on GPS. Higher number = lower script performance. Not significant but every 1/10th of a frame counts! Default 300
QS_ST_GPSshowNames = FALSE;                                    // BOOL. TRUE to show unit names on the GPS display. Default FALSE.
QS_ST_GPSshowGroupOnly = TRUE;                                // BOOL. TRUE to show only group members on the GPS display. Default TRUE.
QS_ST_iconTextSize_GPS = 0.05;                                    // NUMBER. Icon Text Size on GPS display. Default is 0.05.
QS_ST_iconShadowGPS = 1;                                        // NUMBER. Icon Shadow on GPS. 0 = no shadow. 1 = shadow. 2 = outline. Must be 0, 1, or 2. Default 1.
QS_ST_GPSrequireGPSItem = TRUE;                                // BOOL. TRUE to require player have GPS in his assigned items. Default FALSE.

//==================================================================================//
//============================= CONFIGURE GROUP ICONS ==============================//
//==================================================================================//

QS_ST_showGroupMapIcons = TRUE;                                // BOOL. Group icons displayed on map. Default TRUE.
QS_ST_showGroupHudIcons = FALSE;                                // BOOL. Group icons displayed on player 3D HUD. Default FALSE.
QS_ST_showAIGroups = TRUE;                                        // BOOL. Show Groups with AI leaders. Default TRUE.
QS_ST_showAINames = TRUE;                                        // BOOL. Show AI Names. If FALSE, when names are listed with Group features, will only display as '[AI]'. Default FALSE.
QS_ST_groupInteractiveIcons = TRUE;                            // BOOL. Group icons are interactable (mouse hover and mouse click for group details). Default TRUE.
QS_ST_groupInteractiveIcons_showClass = TRUE;                    // BOOL. TRUE to show units vehicle class when revealing group details with interactive map group click. Default TRUE.
QS_ST_dynamicGroupID = TRUE;                                    // BOOL. If TRUE, Script tries to utilize BIS-Dynamic-Groups Group Name for group info display (only available with QS_ST_groupInteractiveIcons), if available. Default TRUE. EDIT: Obsolete as of A3 1.48
QS_ST_showGroupMapText = TRUE;                                    // BOOL. TRUE to show Group Name on the map. If FALSE, name can still be seen by clicking on the group icon, if QS_ST_groupInteractiveIcons = TRUE. Default FALSE.
QS_ST_groupIconScale = 0.75;                                        // NUMBER. Group Icon Scale. Default = 0.75
QS_ST_groupIconOffset = [0.65,0.65];                            // ARRAY (NUMBERS). [X,Y], offset position of icon from group leaders position. Can be positive or negative numbers. Default = [0.65,0.65];
QS_ST_groupTextFactionOnly = TRUE;                                // BOOL. TRUE to show group icon text from ONLY the PLAYERS faction. FALSE will show text for all friendly/revealed factions. Default TRUE.
QS_ST_showCivilianGroups = FALSE;                                // BOOL. TRUE to show Civilian groups. Must be whitelisted above in friendlySides. Default FALSE.
QS_ST_showOwnGroup = FALSE;                                    // BOOL. TRUE to show the Players own group icon. Default FALSE.
QS_ST_GRPrequireGPSItem = TRUE;                                // BOOL. TRUE to require player have GPS in his assigned items. Default FALSE.

//==================================================================================//
//============================= CONFIGURE BONUS FEATURES ===========================//
//==================================================================================//

QS_ST_showEmptyVehicles = FALSE;                                // BOOL. TRUE to mark certain unoccupied vehicles on the map. The vehicle must be assigned this variable:    <vehicle> setVariable ['QS_ST_drawEmptyVehicle',TRUE,TRUE];    Default FALSE.   Only works if  _QS_ST_map_enableUnitIcons = TRUE;
QS_ST_iconColor_empty = [0.7,0.6,0,0.5];                        // ARRAY (NUMBERS). Color of unoccupied vehicles, in RGBA. Default = [0.7,0.6,0,0.5];
QS_ST_iconSize_empty = 20;

//================= DEBUG
QS_ST_showAll = 0;                                            // NUMBER. Intended for Debug / Development use only! Caution: Will cause lag if 1 or 2! Settings -  0 = Disabled (Recommended). 1 = Reveal all Units + vehicles. 2 = Reveal all mission objects + vehicles + units. May override below configurations if set at 1 or 2.
