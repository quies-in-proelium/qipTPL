[
    QGVAR(enableLoadout),
    "CHECKBOX",
    "Use predefind mission loadout",
    ["qipTPL Loadout","Main"],
    true,
    1
] call CBA_fnc_addSetting;

[
    QGVAR(respawnLoadout),
    "CHECKBOX",
    "Respawn with saved gear",
    ["qipTPL Loadout","Main"],
    true,
    1
] call CBA_fnc_addSetting;
