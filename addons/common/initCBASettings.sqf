[
    "qipTPL_enabled",
    "CHECKBOX",
    "Enable Template",
    ["qipTPL Settings","Mission Settings"],
    true,
    1
] call CBA_fnc_addSetting;

[
    "qipTPL_missionInitTime",
    "SLIDER",
    ["Init Time","Time to initialize the mission"],
    ["qipTPL Settings","Mission Settings"],
    [10, 90, 15, 0],
    1
] call CBA_fnc_addSetting;

[
    "qipTPL_uavIntro",
    "CHECKBOX",
    ["UAV Intro","Uses 'qipTPL_uavIntroMarker' marker or player position as target"],
    ["qipTPL Settings","Mission Settings"],
    true,
    1
] call CBA_fnc_addSetting;

[
    "qipTPL_uavIntroText",
    "EDITBOX",
    ["UAV Intro Text","Text that is show when UAV Intro plays"],
    ["qipTPL Settings","Mission Settings"],
    "",
    1
] call CBA_fnc_addSetting;

[
    "qipTPL_uavIntroAltitude",
    "SLIDER",
    ["UAV Intro altitude","Altitude (in meters)"],
    ["qipTPL Settings","Mission Settings"],
    [25, 3000, 100, 0],
    1
] call CBA_fnc_addSetting;

[
    "qipTPL_uavIntroRadius",
    "SLIDER",
    ["UAV Intro radius","Radius of the circular movement (in meters)"],
    ["qipTPL Settings","Mission Settings"],
    [25, 1000, 100, 0],
    1
] call CBA_fnc_addSetting;

[
    "qipTPL_uavIntroAngle",
    "SLIDER",
    ["UAV Intro angle","Viewing angle (in degrees)"],
    ["qipTPL Settings","Mission Settings"],
    [0, 360, 160, 0],
    1
] call CBA_fnc_addSetting;

[
    "qipTPL_uavIntroVision",
    "LIST",
    ["UAV Intro vision","Different visions (Normal,NVG,TI)"],
    ["qipTPL Settings","Mission Settings"],
    [[0,1,2,3,4,5,6,7,8,9],["Normal","NVG","White Hot","Black Hot","Light Green Hot / Darker Green cold","Black Hot / Darker Green cold","Light Red Hot / Darker Red Cold","Black Hot / Darker Red Cold","White Hot / Darker Red Cold","Thermal (Shade of Red and Green, Bodies are white)"],0],
    1
] call CBA_fnc_addSetting;

[
    "qipTPL_clanName",
    "EDITBOX",
    ["Clan Name","Clan name or name of the community. Used in Hints, intro's etc."],
    ["qipTPL Settings","Main Settings"],
    "quies in proelium",
    1
] call CBA_fnc_addSetting;

[
    "qipTPL_clanTag",
    "EDITBOX",
    ["Clan Tag","Clantag or shortname of the community. Used in Hints, intro's etc."],
    ["qipTPL Settings","Main Settings"],
    "[qip]",
    1
] call CBA_fnc_addSetting;

qipTPL_clanLogo = QPATHTOEF(assets,Images\clanLogo.paa);
qipTPL_clanFlag = QPATHTOEF(assets,Images\clanFlag.paa);
