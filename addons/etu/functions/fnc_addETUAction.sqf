#include "script_component.hpp"
/*
 * Author: NemesisRE
 * Adds a teleporter action to the given object.
 *
 * Arguments:
 * 0: Object <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [this] call qipTPL_etu_fnc_addETUAction;
 *
 */

params [["_object", objNull, [objNull]]];

if (isNil QGVAR(teleporter)) then {
    GVAR(teleporter) = [];
};

GVAR(teleporter) pushBack _object;
_object allowDamage false;

_object addAction [
    "Transport",
    {call FUNC(transporterUI);},
    [],
    1,
    false
];
