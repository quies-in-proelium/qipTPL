#include "script_component.hpp"

params ["_configPath", "_loadoutTarget"];

removeAllPrimaryWeaponItems _loadoutTarget;
{ _loadoutTarget addPrimaryWeaponItem _x; } forEach getArray (_configPath);
