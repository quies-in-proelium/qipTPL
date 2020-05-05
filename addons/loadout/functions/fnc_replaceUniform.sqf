#include "script_component.hpp"

params ["_configPath", "_loadoutTarget"];
private ["_backUpItems"];

_backUpItems = uniformItems _loadoutTarget;

if (getText _configPath == "") then {
    removeUniform _loadoutTarget;
    {_loadoutTarget addItem _x;} forEach _backUpItems;
} else {
    _loadoutTarget forceAddUniform getText (_configPath);
    {_loadoutTarget addItemToUniform _x;} forEach _backUpItems;
};
