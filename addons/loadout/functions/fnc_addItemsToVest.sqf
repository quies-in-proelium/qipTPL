#include "script_component.hpp"

params ["_configPath", "_loadoutTarget"];

{_loadoutTarget addItemToVest _x;} forEach getArray (_configPath);
