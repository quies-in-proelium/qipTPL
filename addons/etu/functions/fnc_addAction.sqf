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
 * [this] call qipTPL_etu_fnc_addAction;
 *
 */

params [["_object", objNull, [objNull]]];

GVAR(teleporter) = _object;
GVAR(teleporter) enableSimulation false;
GVAR(teleporter) allowDamage false;

_object addAction [
    "Transport zum Squadleader",
    {
        params ["_target", "_caller"];
        private ["_leader","_pos","_targetPos"];
        _caller call FUNC(restoreGear);
        _leader = leader (group (vehicle _caller));
        _targetPos = getPos _target;
        if (vehicle _leader == _leader) then {
            _pos = [_leader, 2, 15, 1, 1, 20, 0, [], [_targetPos,_targetPos]] call BIS_fnc_findSafePos;
            if !(_pos isEqualTo _targetPos) then {
                _caller setpos _pos;
            } else {
                hint "Could not find a safe location near your leader, try again in a few seconds.";
            };
        } else {
            if ((vehicle _leader) emptyPositions "cargo" == 0) then {
                hint "No room in squad leader's vehicle, try again in a few seconds.";
            } else {
                _caller moveincargo vehicle _leader;
            };
        };
    },
    [],
    1,
    false
];
