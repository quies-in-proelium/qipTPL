#include "script_component.hpp"

params ["_configPath", "_loadoutTarget"];

if (getText _configPath == "") then {
	_loadoutTarget unlinkItem "ItemMap";
} else {
	_loadoutTarget linkItem getText (_configPath);
};
