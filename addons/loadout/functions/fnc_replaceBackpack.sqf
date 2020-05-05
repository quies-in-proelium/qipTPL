#include "script_component.hpp"

params ["_configPath", "_loadoutTarget"];
private ["_backUpItems"];

_backUpItems = backpackItems _loadoutTarget;

removeBackpack _loadoutTarget;

if (getText _configPath == "") then {
    {_loadoutTarget addItem _x;} forEach _backUpItems;
} else {
    _loadoutTarget addBackpack getText (_configPath);
    {_loadoutTarget removeItemFromBackpack _x;} forEach backpackItems _loadoutTarget;
    {_loadoutTarget addItemToBackpack _x;} forEach _backUpItems;
};
