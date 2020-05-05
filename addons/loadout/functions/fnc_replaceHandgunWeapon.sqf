#include "script_component.hpp"

params ["_configPath", "_loadoutTarget"];

if (getText _configPath == "") then {
	_loadoutTarget removeWeapon (handgunWeapon _loadoutTarget);
} else {
	_loadoutTarget addWeapon getText _configPath;
};
