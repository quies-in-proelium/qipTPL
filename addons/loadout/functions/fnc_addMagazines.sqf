#include "script_component.hpp"

params ["_configPath", "_loadoutTarget"];

{_loadoutTarget addMagazine _x;} forEach getArray (_configPath);
