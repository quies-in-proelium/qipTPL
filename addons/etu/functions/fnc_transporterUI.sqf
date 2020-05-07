#include "script_component.hpp"
/*
 * Author: NemesisRE
 * teleport UI
 *
 * Return Value:
 * None
 *
 * Example:
 * call qipTPL_etu_fnc_transporterUI;
 *
 */

private ["_targets", "_ctrl"];
_targets = [];

{
    if !(_x == qipTPL_unit) then {
        if (vehicle _x == _x || {(vehicle _x) emptyPositions "cargo" >= 1}) then {
            _targets pushBack _x;
        };
    };
} forEach allPlayers;

if ((count _targets) < 1) exitWith {hint "No transport target found"};

createDialog QGVAR(transporterUI);
_ctrl = (findDisplay 1000) displayCtrl 1101;
{
    _ctrl lbAdd (name _x);
} forEach _targets;

_ctrl lbSetCurSel 0;

profileNamespace setVariable ["transporterTargets",_targets];
