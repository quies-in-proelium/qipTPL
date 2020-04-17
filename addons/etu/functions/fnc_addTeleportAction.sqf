#include "script_component.hpp"
/*
 * Author: NemesisRE
 * Adds a teleporter action to the given object.
 *
 * Arguments:
 * 0: Object action is on <OBJECT>
 * 1: Aktion Text <STRING>
 * 2: Target of teleport <STRING,OBJECT,ARRAY>
 * 3: Text while teleport <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [this, "Enter Bunker", bunkerInside, "You are entering the Bunker"] call qipTPL_etu_fnc_addTeleportAction;
 *
 */

params [["_object", objNull, [objNull]],["_actionText", "Teleport to the Twilight Zone"],["_teleportTarget", qipTPL_unit],["_teleportText", nil]];

_object addAction [
    _actionText,
    {[_this select 3 select 0, _this select 3 select 1, _this select 1] call FUNC(teleport);},
    [_teleportTarget, _teleportText],
    1,
    false
];
