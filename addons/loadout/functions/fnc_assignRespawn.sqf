#include "script_component.hpp"

if ( isDedicated ) exitWith {};

player addEventHandler ["Respawn", {
    params ["_unit",""];
    [_unit] call FUNC(applyLoadout);
}];
