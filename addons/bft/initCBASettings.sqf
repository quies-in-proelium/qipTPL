//================= GENERAL
[
    QGVAR(bftEnabled),
    "CHECKBOX",
    "Enable Icons",
    ["qipTPL BFT Main","General"],
    true,
    1
] call CBA_fnc_addSetting;

[
    QGVAR(updateInterval),
    "SLIDER",
    "Update Interval",
    ["qipTPL BFT Main","General"],
    [0, 30, 0, 1],
    true,
    nil,
    true // Needs mission restart
] call CBA_fnc_addSetting;

[
    QGVAR(showAINames),
    "CHECKBOX",
    "Show AI Names or Just '[AI]'",
    ["qipTPL BFT Main","General"],
    true,
    1
] call CBA_fnc_addSetting;

[
    QGVAR(requireItemGPS),
    "CHECKBOX",
    "A GPS or similar device ist needed",
    ["qipTPL BFT Main","General"],
    true,
    1
] call CBA_fnc_addSetting;

[
    QGVAR(showFactionOnly),
    "CHECKBOX",
    "Show only own faction",
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

[
    QGVAR(teamColors),
    "LIST",
    "Color style for team colors",
    ["qipTPL BFT Main","Group"],
    [["Default","ACE","STHUD"],["Default","ACE","STHUD"],0],
    0
] call CBA_fnc_addSetting;

//==================================================================================//
//=========================== CONFIGURE MAP (UNIT/VEHICLE) ICONS ===================//
//==================================================================================//

GVAR(showFactionOnly) = FALSE;                             // BOOL. will override ST_showFriendlySides TRUE. If TRUE then will only show players faction. If FALSE then can show friendly factions. Default FALSE.
GVAR(showCivilianIcons) = TRUE;                            // BOOL. Set TRUE to allow showing of civilians, only works if Dynamic Diplomacy is enabled above. Default FALSE.
GVAR(showMOS) = TRUE;                                      // BOOL. TRUE = show Military Occupational Specialty text(unit/vehicle class/role display name), FALSE = disable and only show icons and names. Default FALSE.
GVAR(showMOSRange) = 3500;                                 // NUMBER. Range in distance to show MOS on the map. Default 3500.
GVAR(showOwnGroupUnits) = TRUE;                            // BOOL. Set TRUE to show ONLY the unit icons of THE PLAYERS GROUP MEMBERS on the MAP, FALSE to show ALL your factions units. May override other config. Default TRUE.
GVAR(iconMapClickShowDetail) = TRUE;                       // BOOL. Set TRUE to show unit/vehicle detail when player clicks on their map near the vehicle. Only works for shown vehicles. Default TRUE.
GVAR(showLifeState) = TRUE;
GVAR(showUnitNames) = TRUE;                                // BOOL. TRUE to show unit/vehicle icon text on the map. FALSE to only show the icon and NO text (name/class). Default TRUE.
//==================================================================================//
//============================= CONFIGURE GROUP ICONS ==============================//
//==================================================================================//

GVAR(showGroupMapIcons) = TRUE;                            // BOOL. Group icons displayed on map. Default TRUE.
GVAR(showGroupHudIcons) = FALSE;                           // BOOL. Group icons displayed on player 3D HUD. Default FALSE.
GVAR(showAIGroups) = TRUE;                                 // BOOL. Show Groups with AI leaders. Default TRUE.
GVAR(showPlayerNames) = TRUE;
GVAR(groupInteractiveClassIcons) = TRUE;                   // BOOL. TRUE to show units vehicle class when revealing group details with interactive map group click. Default TRUE.
GVAR(showGroupMapText) = TRUE;                             // BOOL. TRUE to show Group Name on the map. If FALSE, name can still be seen by clicking on the group icon, if GVAR(groupInteractiveIcons) = TRUE. Default FALSE.
GVAR(showCivilianGroups) = FALSE;                          // BOOL. TRUE to show Civilian groups. Must be whitelisted above in friendlySides. Default FALSE.
GVAR(showOwnGroup) = FALSE;                                // BOOL. TRUE to show the Players own group icon. Default FALSE.

//==================================================================================//
//============================= CONFIGURE BONUS FEATURES ===========================//
//==================================================================================//

GVAR(showEmptyVehicles) = FALSE;                           // BOOL. TRUE to mark certain unoccupied vehicles on the map. The vehicle must be assigned this variable:    <vehicle> setVariable [QGVAR(drawEmptyVehicle),TRUE,TRUE];    Default FALSE.   Only works if  GVAR(enableUnitIconsMap) = TRUE;
