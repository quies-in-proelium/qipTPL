#include "script_component.hpp"

params ["_configPath", "_entryName"];
private ["_exists"];

_exists = [_configPath, _entryName, false] call bis_fnc_returnConfigEntry;
if (_exists isEqualTo false) exitWith { false };

true
