#include "script_component.hpp"

params ["_configPath", "_loadoutTarget"];

{_loadoutTarget addItem _x;} forEach getArray (_configPath);
