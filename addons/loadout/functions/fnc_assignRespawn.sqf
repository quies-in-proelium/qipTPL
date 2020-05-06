#include "script_component.hpp"

if ( isDedicated ) exitWith {};

qipTPL_unit addEventHandler ["Respawn", {
    params ["_unit",""];
    [_unit] call FUNC(applyLoadout);
}];
