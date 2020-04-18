[
    QGVAR(enableLoadout),
    "CHECKBOX",
    "Predefind Mission Loadout",
    ["qipTPL Settings","Mission Settings"],
    true,
    1
] call CBA_fnc_addSetting;

[
    "cbrn_maxOxygenTime",
    "SLIDER",
    ["Oxygen Time", "Value in seconds of how long one oxygen container should last."],
    ["qipTPL Settings","CBRN Settings"],
    [600, 7200, 1800, 0],
    1
] call CBA_fnc_addSetting;

[
    "cbrn_maxWaterTime",
    "SLIDER",
    ["Oxygen Time", "Value in seconds of how long decon shower water should last."],
    ["qipTPL Settings","CBRN Settings"],
    [60, 7200, 120, 0],
    1
] call CBA_fnc_addSetting;
