#include "script_component.hpp"

params ["_unit"];

if (isNil QEGVAR(common,qipTPL_enabled) || !(EGVAR(common,qipTPL_enabled))) exitWith {};

if !(local _unit || {_unit in allPlayers}) exitWith {};
[_unit] call FUNC(applyLoadout);
