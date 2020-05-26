[
    QGVAR(disabled),
    "CHECKBOX",
    "Disable Backpack on Chest",
    ["qipTPL BoC","Main"],
    false,
    1
] call CBA_fnc_addSetting;

[
    QGVAR(forceWalk),
    "CHECKBOX",
    "Enable force walk while Backpack on Chest",
    ["qipTPL BoC","Main"],
    false,
    1
] call CBA_fnc_addSetting;

[
    QGVAR(removeKilledPlayerChestpack),
    "CHECKBOX",
    "Remove chestpack of dead players",
    ["qipTPL BoC","Main"],
    true,
    1
] call CBA_fnc_addSetting;
