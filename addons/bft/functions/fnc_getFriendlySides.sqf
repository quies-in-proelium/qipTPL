#include "script_component.hpp"
/*
 * Author: NemesisRE
 * Get friendly sides for given side
 *
 * Arguments:
 * 0: side <Side>
 *
 * Return Value:
 * friendly sides <ARRAY>
 *
 * Example:
 * [side] call qipTPL_bft_fnc_getFriendlySides
 *
 * Public: No
 */

params [["_side", playerSide]];
private ["_friendlySides", "_sides"];

_friendlySides = [];
_sides = [EAST,WEST,RESISTANCE,CIVILIAN];
if (!(_side isEqualTo CIVILIAN) && !(GVAR(showCivilians))) then {
    _sides = [EAST,WEST,RESISTANCE];
};

if (GVAR(friendlySidesDynamic)) then {
    {
        if ((_side getFriend _x) > 0.6) then {
            _friendlySides pushBack _x;
        };
    } forEach _sides;
} else {
    switch (_side) do {
        case east: {_friendlySides = GVAR(friendlySides_EAST)};
        case west: {_friendlySides = GVAR(friendlySides_WEST)};
        case resistance: {_friendlySides = GVAR(friendlySides_RESISTANCE)};
        case civilian: {_friendlySides = GVAR(friendlySides_CIVILIAN)};
        default {_friendlySides = []};
    };
};

_friendlySides
