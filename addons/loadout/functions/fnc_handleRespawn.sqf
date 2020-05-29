#include "script_component.hpp"

params ["_unit", "_corpse"];
private ["_attachedList"];
if (
    isNil QEGVAR(common,qipTPL_enabled)
    || !(EGVAR(common,qipTPL_enabled))
    || !(GVAR(respawnLoadout))
) exitWith {};

[_unit] call FUNC(initLoadout);

_attachedList = _corpse getVariable ["ACE_attach_attached", []];

if (_attachedList isEqualTo []) exitWith {};

{
    _x params ["_xObject"];
    [{deleteVehicle (_this select 0)}, [_xObject], 2] call CBA_fnc_waitAndExecute;
} forEach _attachedList;

_corpse setVariable [QGVAR(attached), nil, true];
