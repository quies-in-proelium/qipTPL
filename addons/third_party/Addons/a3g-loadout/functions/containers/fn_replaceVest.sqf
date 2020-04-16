params ["_configPath", "_loadoutTarget"];
private ["_backUpItems"];

// Backup items ( contains magazines )
_backUpItems = vestItems _loadoutTarget;

if(getText _configPath == "") then {
    removeVest _loadoutTarget;
    {_loadoutTarget addItem _x;} forEach _backUpItems;
} else {
    _loadoutTarget addVest getText (_configPath);
    // Reapply items
    {_loadoutTarget addItemToVest _x;} forEach _backUpItems;
};
