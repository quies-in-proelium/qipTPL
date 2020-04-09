[
    QGVAR(qipTPL_enabled),
    "CHECKBOX",
    "Enable Template",
    ["qipTPL Settings","Mission Settings"],
    true,
    1
] call CBA_fnc_addSetting;

[
    QGVAR(skipMissionInit),
    "CHECKBOX",
    "Skip Mission initialization",
    ["qipTPL Settings","Mission Settings"],
    true,
    1
] call CBA_fnc_addSetting;

[
    QGVAR(missionInitTime),
    "SLIDER",
    ["Init Time","Time to initialize the mission"],
    ["qipTPL Settings","Mission Settings"],
    [10, 90, 15, 0],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(teleporterDistance),
    "SLIDER",
    ["Distance to teleporter","Distance needed to teleporter to save player variables"],
    ["qipTPL Settings","Player Backup"],
    [25, 200, 50, 0],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(uavIntro),
    "CHECKBOX",
    ["UAV Intro","Uses 'qipTPL_uavIntroMarker' marker or player position as target"],
    ["qipTPL Settings","Mission Settings"],
    true,
    1
] call CBA_fnc_addSetting;

[
    QGVAR(uavIntroText),
    "EDITBOX",
    ["UAV Intro Text","Text that is show when UAV Intro plays"],
    ["qipTPL Settings","Mission Settings"],
    "",
    1
] call CBA_fnc_addSetting;

[
    QGVAR(uavIntroAltitude),
    "SLIDER",
    ["UAV Intro altitude","Altitude (in meters)"],
    ["qipTPL Settings","Mission Settings"],
    [25, 3000, 100, 0],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(uavIntroRadius),
    "SLIDER",
    ["UAV Intro radius","Radius of the circular movement (in meters)"],
    ["qipTPL Settings","Mission Settings"],
    [25, 1000, 100, 0],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(uavIntroAngle),
    "SLIDER",
    ["UAV Intro angle","Viewing angle (in degrees)"],
    ["qipTPL Settings","Mission Settings"],
    [0, 360, 160, 0],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(uavIntroVision),
    "LIST",
    ["UAV Intro vision","Different visions (Normal,NVG,TI)"],
    ["qipTPL Settings","Mission Settings"],
    [[0,1,2,3,4,5,6,7,8,9],["Normal","NVG","White Hot","Black Hot","Light Green Hot / Darker Green cold","Black Hot / Darker Green cold","Light Red Hot / Darker Red Cold","Black Hot / Darker Red Cold","White Hot / Darker Red Cold","Thermal (Shade of Red and Green, Bodies are white)"],0],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(clanName),
    "EDITBOX",
    ["Clan Name","Clan name or name of the community. Used in Hints, intro's etc."],
    ["qipTPL Settings","Main Settings"],
    "quies in proelium",
    1
] call CBA_fnc_addSetting;

[
    QGVAR(clanTag),
    "EDITBOX",
    ["Clan Tag","Clantag or shortname of the community. Used in Hints, intro's etc."],
    ["qipTPL Settings","Main Settings"],
    "[qip]",
    1
] call CBA_fnc_addSetting;

GVAR(clanLogo) = QPATHTOEF(assets,Images\clanLogo.paa);
GVAR(clanFlag) = QPATHTOEF(assets,Images\clanFlag.paa);
