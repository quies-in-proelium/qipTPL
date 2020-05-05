#include "script_component.hpp"

params ["_configPath", "_loadoutTarget"];

{_loadoutTarget addItemToUniform _x;} forEach getArray (_configPath);
