[
    "qipTPL_enabled", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    "Enable Template", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "qipTPL Settings", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    true, // data for this setting: [min, max, default, number of shown trailing decimals]
    2 // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
] call CBA_fnc_addSetting;

[
    "qipTPL_missionInitTime", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    ["Init Time","Time to initialize the mission"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "qipTPL Settings", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [30, 90, 30, 0], // data for this setting: [min, max, default, number of shown trailing decimals]
    2 // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
] call CBA_fnc_addSetting;

[
    "qipTPL_clanName", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "EDITBOX", // setting type
    ["Clan Name","Clan name or name of the community. Used in Hints, intro's etc."], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "qipTPL Settings", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    "quies in proelium", // data for this setting: [min, max, default, number of shown trailing decimals]
    2 // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
] call CBA_fnc_addSetting;

[
    "qipTPL_clanTag", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "EDITBOX", // setting type
    ["Clan Tag","Clantag or shortname of the community. Used in Hints, intro's etc."], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "qipTPL Settings", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    "[qip]", // data for this setting: [min, max, default, number of shown trailing decimals]
    2 // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
] call CBA_fnc_addSetting;

qipTPL_clanLogo = QPATHTOEF(assets,Images\clanLogo.paa);
qipTPL_clanFlag = QPATHTOEF(assets,Images\clanFlag.paa);
