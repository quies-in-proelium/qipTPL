#include "script_component.hpp"

params ["_unit"];

if (isNil QEGVAR(common,qipTPL_enabled) || !(EGVAR(common,qipTPL_enabled)) || !(GVAR(enableLoadout))) exitWith {};

[{!isNull _this && local _this}, {
    [_this] call FUNC(applyLoadout);
}, _unit,5] call CBA_fnc_waitUntilAndExecute;
