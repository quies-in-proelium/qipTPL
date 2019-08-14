[
    QGVAR(enableLoadout), // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    "Predefind Mission Loadout", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    ["qipTPL Settings","Mission Settings"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    true, // data for this setting: [min, max, default, number of shown trailing decimals]
    1 // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
] call CBA_fnc_addSetting;

[
    QGVAR(enableBluforTracking), // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    "Blufor Tracking", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    ["qipTPL Settings","Mission Settings"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    true, // data for this setting: [min, max, default, number of shown trailing decimals]
    1, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {
        params ["_value"];
        if (_value) then {
            [] execVM QPATHTOF(Scripts\Soldier-Tracker\QS_icons.sqf); // Soldier Tracker by Quiksilver
        } else {
            if (true) then {
                INFO("Don't forget you wanted to fix that!"); // find a way to disable if running
            };
        };
    }
] call CBA_fnc_addSetting;
