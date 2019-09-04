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

GVAR(teleporter) = _object;
GVAR(teleporter) enableSimulation false;
GVAR(teleporter) allowDamage false;

_object addAction [
    "Transport zum Squadleader",
    {[_this] call FUNC(transporter);},
    [],
    1,
    false
];
