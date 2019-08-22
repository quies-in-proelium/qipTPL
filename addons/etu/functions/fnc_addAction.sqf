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

GVAR(teleporter) = _object;
_object addAction ["Transport zum Squadleader",
    {
        params ["", "_caller"];
        private ["_leader","_pos"];
        _caller call FUNC(restoreGear);
        _leader = leader (group (vehicle _caller));
        if (vehicle _leader == _leader) then {
            _pos = _leader modelToWorld [-5,-5,0];
			_pos set [2,0];
            _caller setpos _pos;
        } else {
            if ((vehicle _leader) emptyPositions "cargo" == 0) then {
                hint "No room in squad leader's vehicle";
            } else {
                _caller moveincargo vehicle _leader;
            };
        };
    },
    [],
    1,
    false
];
