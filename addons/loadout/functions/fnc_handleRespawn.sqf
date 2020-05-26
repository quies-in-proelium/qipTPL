#include "script_component.hpp"

params ["_unit"];
if (
    isNil QEGVAR(common,qipTPL_enabled)
    || !(EGVAR(common,qipTPL_enabled))
    || !(GVAR(respawnLoadout))
) exitWith {};

[_unit] call FUNC(initLoadout);
