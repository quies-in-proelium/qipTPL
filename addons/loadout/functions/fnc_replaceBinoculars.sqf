#include "script_component.hpp"

params ["_configPath", "_loadoutTarget"];

if (getText _configPath == "") then {
	_loadoutTarget removeWeapon (binocular _loadoutTarget);
} else {
	_loadoutTarget addWeapon getText (_configPath);
};
