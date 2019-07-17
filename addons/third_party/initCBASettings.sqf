[
    "qipTPL_enableLoadout", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    "Predefind Mission Loadout", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    ["qipTPL Settings","Mission Settings"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    true, // data for this setting: [min, max, default, number of shown trailing decimals]
    1 // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
] call CBA_fnc_addSetting;

[
    "qipTPL_enableBluforTracking", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    "Blufor Tracking", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    ["qipTPL Settings","Mission Settings"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    true, // data for this setting: [min, max, default, number of shown trailing decimals]
    1, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {
        params ["_value"];
        if (_value) then {
            qipTPL_BluforTracking = [] execVM QPATHTOF(Scripts\QS_icons.sqf); // Soldier Tracker by Quiksilver
        } else {
            terminate qipTPL_BluforTracking;
        };
    }
] call CBA_fnc_addSetting;
