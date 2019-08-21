#include "script_component.hpp"
/*
 * Author: ACE-Team, NemesisRE
 * Update the blue force tracking.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call qipTPL_bft_fnc_trackingUpdate
 *
 * Public: No
 */

if ((isNil "qipTPL_unit") && (!alive qipTPL_unit)) exitWith {};

private ["_groupsToDrawMarkers", "_playerSide", "_showFriendlySides", "_sides"];

{
    deleteMarkerLocal _x;
} forEach GVAR(bftMarkers);

GVAR(bftMarkers) = [];

if (GVAR(requireItemGPS) && !([qipTPL_unit] call FUNC(hasGPSDevice))) exitWith {};

_groupsToDrawMarkers = [];
_playerSide = playerSide;
_showFriendlySides = [];
_sides = [EAST,WEST,RESISTANCE,CIVILIAN];
if (!(_playerSide isEqualTo CIVILIAN) && !(GVAR(showCivilians))) then {
    _sides = [EAST,WEST,RESISTANCE];
};

if (GVAR(friendlySidesDynamic)) then {
    {
        if ((_playerSide getFriend _x) > 0.6) then {
            _showFriendlySides pushBack _x;
        };
    } forEach _sides;
} else {
    switch (_playerSide) do {
        case east: {_showFriendlySides = GVAR(friendlySides_EAST)};
        case west: {_showFriendlySides = GVAR(friendlySides_WEST)};
        case resistance: {_showFriendlySides = GVAR(friendlySides_RESISTANCE)};
        case civilian: {_showFriendlySides = GVAR(friendlySides_CIVILIAN)};
        default {_showFriendlySides = []};
    };
};

if (GVAR(showOwnFactionOnly)) then {
    _groupsToDrawMarkers = allGroups select {side _x == _playerSide};
} else {
    _groupsToDrawMarkers = allGroups select {side _x in _showFriendlySides};
};

if (!GVAR(showAIGroups)) then {
    _groupsToDrawMarkers = _groupsToDrawMarkers select {
        {
            [_x] call FUNC(isPlayer);
        } count units _x > 0;
    };
};

_groupsToDrawMarkers = _groupsToDrawMarkers select {!(_x getVariable [QGVAR(hideBlueForceMarker), false])};

if !(GVAR(showOwnGroup)) then {
    _groupsToDrawMarkers = _groupsToDrawMarkers select {
        {
            !(_x in (units (group qipTPL_unit)));
        } count units _x > 0;
    };
};

[] call FUNC(createUnitMarkers);

[_groupsToDrawMarkers] call FUNC(createGroupMarkers);
