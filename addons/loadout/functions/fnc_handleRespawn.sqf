#include "script_component.hpp"

params ["_unit"];

if !(GVAR(respawnLoadout)) exitWith {};

[_unit] call FUNC(applyLoadout);
