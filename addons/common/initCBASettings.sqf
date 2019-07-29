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
    [15, 90, 30, 0],
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
    [100, 3000, 100, 0],
    1
] call CBA_fnc_addSetting;

[
    "qipTPL_uavIntroRadius",
    "SLIDER",
    ["UAV Intro radius","Radius of the circular movement (in meters)"],
    ["qipTPL Settings","Mission Settings"],
    [100, 1000, 100, 0],
    1
] call CBA_fnc_addSetting;

[
    "qipTPL_uavIntroAngle",
    "SLIDER",
    ["UAV Intro angle","Viewing angle (in degrees)"],
    ["qipTPL Settings","Mission Settings"],
    [0, 180, 160, 0],
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
