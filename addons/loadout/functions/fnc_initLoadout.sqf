#include "script_component.hpp"

params ["_unit"];

if (isNil QEGVAR(common,qipTPL_enabled) || !(EGVAR(common,qipTPL_enabled))) exitWith {};

if (isServer) exitWith  {
    if !(local _unit) exitWith {};
    [_unit] call FUNC(applyLoadout);
};
