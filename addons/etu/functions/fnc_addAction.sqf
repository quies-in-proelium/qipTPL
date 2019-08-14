/*
 * Author: BlauBär
 * Adds a teleporter action to the given object.
 *
 * Arguments:
 * 0: Object <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [this] call qipTPL_etu_fnc_addAction;
 *
 */
#include "script_component.hpp"
params [["_object", objNull, [objNull]]];

_object addAction ["Notfalltransporter", { createDialog "RscTemplateTransporter" }, [], 0, false];
