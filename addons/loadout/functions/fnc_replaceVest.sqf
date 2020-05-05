#include "script_component.hpp"

params ["_configPath", "_loadoutTarget"];
private ["_backUpItems"];

_backUpItems = vestItems _loadoutTarget;

if(getText _configPath == "") then {
    removeVest _loadoutTarget;
    {_loadoutTarget addItem _x;} forEach _backUpItems;
} else {
    _loadoutTarget addVest getText (_configPath);
    {_loadoutTarget addItemToVest _x;} forEach _backUpItems;
};
