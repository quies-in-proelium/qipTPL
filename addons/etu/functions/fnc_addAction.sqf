#include "script_component.hpp"
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

params [["_object", objNull, [objNull]]];

//_object addAction ["Notfalltransporter", { createDialog "RscTemplateTransporter" }, [], 0, false];
_object addAction ["Transport zum Squadleader",
    {
        private ["_caller","_leader","_leaderPosX","_leaderPosY","_leaderPosZ"];
        _caller = _this select 1;
        _leader = leader _caller;
        if (vehicle _leader == _leader) then {
            _leaderPosX = (getpos _leader select 0) + (3*sin ((getDir _leader) -180));
            _leaderPosY = (getpos _leader select 1) + (3*cos ((getDir _leader) -180));
            _leaderPosZ = (getpos _leader select 2);
            _caller setpos [_leaderPosX,_leaderPosY,_leaderPosZ];
        } else {
            if ((vehicle _leader) emptyPositions "cargo" == 0) then {
                hint "No room in squad leader's vehicle.";
            } else {
                _caller moveincargo vehicle _leader;
            };
        };
    },
    [],
    1,
    false
];
