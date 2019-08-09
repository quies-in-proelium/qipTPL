//================= GENERAL
[
    QGVAR(enableUnitIconsMap),
    "CHECKBOX",
    "Enable MAP unit/vehicle Icons",
    ["qipTPL BFT Main","General"],
    true,
    1
] call CBA_fnc_addSetting;

[
    QGVAR(enableUnitIconsGPS),
    "CHECKBOX",
    "Enable GPS unit/vehicle Icons",
    ["qipTPL BFT Main","General"],
    true,
    1
] call CBA_fnc_addSetting;

[
    QGVAR(enableGroupIcons),
    "CHECKBOX",
    "Enable Map+GPS+HUD GROUP Icons",
    ["qipTPL BFT Main","General"],
    true,
    1
] call CBA_fnc_addSetting;

[
    QGVAR(adminMode),
    "CHECKBOX",
    "Enable showing all units (even enemies) if logged in as admin on a server",
    ["qipTPL BFT Main","General"],
    false,
    1
] call CBA_fnc_addSetting;

//================= MEDICAL
[
    QGVAR(showMedicalWounded),
    "CHECKBOX",
    "Show wounded on the map and GPS",
    ["qipTPL BFT Main","Medical"],
    true,
    1
] call CBA_fnc_addSetting;

[
    QGVAR(medicalSystem),
    "LIST",
    "Medical System that is used",
    ["qipTPL BFT Main","Medical"],
    [["BIS","BTC","AIS","ACE","FAR","AWS"],["BIS","BTC","AIS","ACE","FAR","AWS"],0],
    1,
    nil,
    true
] call CBA_fnc_addSetting;

//================= DIPLOMACY
[
    QGVAR(friendlySidesDynamic),
    "CHECKBOX",
    "Allow faction alliances to change dynamically",
    ["qipTPL BFT Main","Diplomacy"],
    true,
    1
] call CBA_fnc_addSetting;

[
    QGVAR(friendlySides_EAST),
    "LIST",
    "East is Friendly to:",
    ["qipTPL BFT Main","Diplomacy"],
    [[[1],[2],[3],[1,2],[1,3],[2,3],[1,2,3]],["West","Independent","Civilians","West & Independent","West & Civilians","Independent & Civilians","All three"],2],
    1,
    nil,
    true
] call CBA_fnc_addSetting;

[
    QGVAR(friendlySides_WEST),
    "LIST",
    "West is Friendly to:",
    ["qipTPL BFT Main","Diplomacy"],
    [[[0],[2],[3],[0,2],[0,3],[2,3],[0,2,3]],["East","Independent","Civilians","East & Independent","East & Civilians","Independent & Civilians","All three"],1],
    1,
    nil,
    true
] call CBA_fnc_addSetting;

[
    QGVAR(friendlySides_RESISTANCE),
    "LIST",
    "Independent is Friendly to:",
    ["qipTPL BFT Main","Diplomacy"],
    [[[0],[1],[3],[0,1],[0,3],[1,3],[0,1,3]],["East","West","Civilians","East & West","East & Civilians","West & Civilians","All three"],5],
    1,
    nil,
    true
] call CBA_fnc_addSetting;

[
    QGVAR(friendlySides_CIVILIAN),
    "LIST",
    "Civilians is Friendly to:",
    ["qipTPL BFT Main","Diplomacy"],
    [[[0],[1],[2],[0,1],[0,2],[1,2],[0,1,2]],["East","West","Independent","East & West","East & Independent","West & Independent","All three"],4],
    1,
    nil,
    true
] call CBA_fnc_addSetting;

[
    QGVAR(groupIconsInteraction),
    "LIST",
    "Interaction with group icons to show details",
    ["qipTPL BFT Main","Group"],
    [["disabled","hover","click"],["Disabled","Hover","Click"],1],
    0
] call CBA_fnc_addSetting;

//================= DEFAULT ICON COLORS by FACTION

GVAR(iconColor_EAST) = [0.5,0,0,0.65];                            // ARRAY (NUMBER). RGBA color code.    Default [0.5,0,0,0.65];
GVAR(iconColor_WEST) = [0,0.3,0.6,0.65];                        // ARRAY (NUMBER). RGBA color code. Default [0,0.3,0.6,0.65];
GVAR(iconColor_RESISTANCE) = [0,0.5,0,0.65];                    // ARRAY (NUMBER). RGBA color code. Default [0,0.5,0,0.65];
GVAR(iconColor_CIVILIAN) = [0.4,0,0.5,0.65];                    // ARRAY (NUMBER). RGBA color code. Default [0.4,0,0.5,0.65];
GVAR(iconColor_UNKNOWN) = [0.7,0.6,0,0.5];                        // ARRAY (NUMBER). RGBA color code. Default [0.7,0.6,0,0.5];

//================= MEDICAL
GVAR(medicalIconColor) = [1,0.41,0,1];                            // ARRAY (NUMBER). Color of medical icons in RGBA format. Default [1,0.41,0,1];
GVAR(colorInjured) = [0.75,0.55,0,0.75];                        // ARRAY (NUMBER). RGBA color code. Color of units with > 10% damage, in map group interactive interface. Default [0.7,0.6,0,0.5];

//==================================================================================//
//=========================== CONFIGURE MAP (UNIT/VEHICLE) ICONS ===================//
//==================================================================================//

GVAR(showFactionOnly) = FALSE;                                    // BOOL. will override ST_showFriendlySides TRUE. If TRUE then will only show players faction. If FALSE then can show friendly factions. Default FALSE.
GVAR(showAI) = TRUE;                                            // BOOL. FALSE = players only, TRUE = players and AI. Default TRUE.
GVAR(AINames) = TRUE;                                            // BOOL. Set TRUE to show human names for AI with the map/vehicle icons. Set FALSE and will be named 'AI'. Default FALSE.
GVAR(showCivilianIcons) = FALSE;                                // BOOL. Set TRUE to allow showing of civilians, only works if Dynamic Diplomacy is enabled above. Default FALSE.
GVAR(iconMapText) = TRUE;                                        // BOOL. TRUE to show unit/vehicle icon text on the map. FALSE to only show the icon and NO text (name/class). Default TRUE.
GVAR(showMOS) = TRUE;                                            // BOOL. TRUE = show Military Occupational Specialty text(unit/vehicle class/role display name), FALSE = disable and only show icons and names. Default FALSE.
GVAR(showMOSRange) = 3500;                                    // NUMBER. Range in distance to show MOS on the map. Default 3500.
GVAR(showGroupOnly) = TRUE;                                    // BOOL. Set TRUE to show ONLY the unit icons of THE PLAYERS GROUP MEMBERS on the MAP, FALSE to show ALL your factions units. May override other config. Default TRUE.
GVAR(showOnlyVehicles) = FALSE;                                // BOOL. Set TRUE to show ONLY vehicles, no foot-soldier units will be shown. May override other config. Default TRUE.
GVAR(iconMapClickShowDetail) = TRUE;                            // BOOL. Set TRUE to show unit/vehicle detail when player clicks on their map near the vehicle. Only works for shown vehicles. Default TRUE.
GVAR(iconUpdatePulseDelay) = 0;                                // NUMBER. How often should location of unit on the MAP be updated? 0 = as fast as possible, else if > 0 then it = time in seconds. Default 0.
GVAR(iconShadowMap) = 1;                                        // NUMBER. Icon Shadow on MAP. 0 = no shadow. 1 = shadow. 2 = outline. Must be 0, 1, or 2. Default 1.
GVAR(iconTextSizeMap) = 0.05;                                    // NUMBER. Icon Text Size on MAP display. Default is 0.05.
GVAR(iconTextOffset) = 'right';                                // STRING. Icon Text Offset. Can be 'left' or 'center' or 'right'. Default is 'right'
GVAR(iconSize_Man) = 22;                                        // NUMBER. Icon Size by Vehicle Type. Man/Units. Default = 22
GVAR(iconSize_LandVehicle) = 26;                                // NUMBER. Icon Size by Vehicle Type. Ground-based vehicles. Default = 26
GVAR(iconSize_Ship) = 24;                                        // NUMBER. Icon Size by Vehicle Type. Water-based vehicles. Default = 24
GVAR(iconSize_Air) = 24;                                        // NUMBER. Icon Size by Vehicle Type. Air vehicles. Default = 24
GVAR(iconSize_StaticWeapon) = 22;                                // NUMBER. Icon Size by Vehicle Type. Static Weapon (Mortar, remote designator, HMG/GMG. Default = 22
GVAR(iconTextFont) = [                                        // ARRAY (STRING). Icon Text Font. Only the uncommented one will be used. Do not add commas and only allow 1 to be uncommented. Default 'puristaMedium'.
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
GVAR(otherDisplays) = TRUE;                                    // BOOL. TRUE to add Unit/Vehicle Icon support for UAV Terminal and Artillery Computer. Runs a separate script to handle these displays. Only works if  GVAR(enableUnitIconsMap) = TRUE;
GVAR(requireGPSItemMap) = TRUE;                                // BOOL. TRUE to require player have GPS in his assigned items. Default FALSE.

//==================================================================================//
//=========================== CONFIGURE GPS (UNIT/VEHICLE) ICONS ===================//
//==================================================================================//

GVAR(GPSDist) = 300;                                            // NUMBER. Distance from player that units shown on GPS. Higher number = lower script performance. Not significant but every 1/10th of a frame counts! Default 300
//GVAR(GPSshowNames) = FALSE;                                    // BOOL. TRUE to show unit names on the GPS display. Default FALSE. NOT USED
GVAR(GPSshowGroupOnly) = TRUE;                                // BOOL. TRUE to show only group members on the GPS display. Default TRUE.
GVAR(iconTextSizeGPS) = 0.05;                                    // NUMBER. Icon Text Size on GPS display. Default is 0.05.
GVAR(iconShadowGPS) = 1;                                        // NUMBER. Icon Shadow on GPS. 0 = no shadow. 1 = shadow. 2 = outline. Must be 0, 1, or 2. Default 1.
GVAR(requireGPSItemGPS) = TRUE;                                // BOOL. TRUE to require player have GPS in his assigned items. Default FALSE.

//==================================================================================//
//============================= CONFIGURE GROUP ICONS ==============================//
//==================================================================================//

GVAR(showGroupMapIcons) = TRUE;                                // BOOL. Group icons displayed on map. Default TRUE.
GVAR(showGroupHudIcons) = FALSE;                                // BOOL. Group icons displayed on player 3D HUD. Default FALSE.
GVAR(showAIGroups) = TRUE;                                        // BOOL. Show Groups with AI leaders. Default TRUE.
GVAR(showAINames) = TRUE;                                        // BOOL. Show AI Names. If FALSE, when names are listed with Group features, will only display as '[AI]'. Default FALSE.
//GVAR(groupInteractiveIcons) = TRUE;                            // BOOL. Group icons are interactable (mouse hover and mouse click for group details). Default TRUE.
GVAR(groupInteractiveClassIcons) = TRUE;                    // BOOL. TRUE to show units vehicle class when revealing group details with interactive map group click. Default TRUE.
GVAR(showGroupMapText) = TRUE;                                    // BOOL. TRUE to show Group Name on the map. If FALSE, name can still be seen by clicking on the group icon, if GVAR(groupInteractiveIcons) = TRUE. Default FALSE.
GVAR(groupIconScale) = 0.75;                                        // NUMBER. Group Icon Scale. Default = 0.75
GVAR(groupIconOffset) = [0.65,0.65];                            // ARRAY (NUMBERS). [X,Y], offset position of icon from group leaders position. Can be positive or negative numbers. Default = [0.65,0.65];
//GVAR(groupTextFactionOnly) = TRUE;                                // BOOL. TRUE to show group icon text from ONLY the PLAYERS faction. FALSE will show text for all friendly/revealed factions. Default TRUE. NOT USED
GVAR(showCivilianGroups) = FALSE;                                // BOOL. TRUE to show Civilian groups. Must be whitelisted above in friendlySides. Default FALSE.
GVAR(showOwnGroup) = FALSE;                                    // BOOL. TRUE to show the Players own group icon. Default FALSE.
GVAR(requireGPSItemGroup) = TRUE;                                // BOOL. TRUE to require player have GPS in his assigned items. Default FALSE.

//==================================================================================//
//============================= CONFIGURE BONUS FEATURES ===========================//
//==================================================================================//

GVAR(showEmptyVehicles) = FALSE;                                // BOOL. TRUE to mark certain unoccupied vehicles on the map. The vehicle must be assigned this variable:    <vehicle> setVariable [QGVAR(drawEmptyVehicle),TRUE,TRUE];    Default FALSE.   Only works if  GVAR(enableUnitIconsMap) = TRUE;
GVAR(iconColor_Empty) = [0.7,0.6,0,0.5];                        // ARRAY (NUMBERS). Color of unoccupied vehicles, in RGBA. Default = [0.7,0.6,0,0.5];
// GVAR(iconSize_Empty) = 20;                                   // NOT USED

//================= DEBUG
GVAR(showAll) = 0;                                            // NUMBER. Intended for Debug / Development use only! Caution: Will cause lag if 1 or 2! Settings -  0 = Disabled (Recommended). 1 = Reveal all Units + vehicles. 2 = Reveal all mission objects + vehicles + units. May override below configurations if set at 1 or 2.
