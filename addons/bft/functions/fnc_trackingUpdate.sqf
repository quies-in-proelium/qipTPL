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

// Delete last set of markers (always)
{
    deleteMarkerLocal _x;
} forEach GVAR(bftMarkers);

GVAR(bftMarkers) = [];

if (GVAR(requireItemGPS) && !(call FUNC(hasGPSDevice))) exitWith {};

private _groupsToDrawMarkers = [];
private _playerSide = playerSide;
private _showFriendlySides = [];
private _sides = [EAST,WEST,RESISTANCE,CIVILIAN];
if (!(_playerSide isEqualTo CIVILIAN) && !(GVAR(showCivilianIcons))) then {
    _sides = [EAST,WEST,RESISTANCE];
};

if (GVAR(friendlySidesDynamic)) then {
    {
        if ((_playerSide getFriend _x) > 0.6) then {
            _showFriendlySides pushBack _x;
        };
    } forEach _sides;
} else {
    {
        _showFriendlySides pushBack (_sides select _x);
    } forEach GVAR(showFriendlySides);
};

if (GVAR(showFactionOnly)) then {
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

if (GVAR(showOwnGroupUnits)) then {
    private _playersGroupUnitsToDrawMarkers = units (group qipTPL_unit);

    {
        private _markerType = [_x] call FUNC(getUnitMarkerType);
        private _colour = [_x] call FUNC(getMarkerColor);
        private _size = [_x] call FUNC(getMarkerSize);

        private _marker = createMarkerLocal [str _x, getPos _x];
        _marker setMarkerTypeLocal _markerType;
        _marker setMarkerColorLocal _colour;
        _marker setMarkerSizeLocal _size;
        _marker setMarkerDirLocal (getDirVisual vehicle _x);
        if ((GVAR(showPlayerNames)) && ([_x] call FUNC(isPlayer))) then {
            _marker setMarkerTextLocal (name _x);
        };
        if ((GVAR(showAINames))) then {
            _marker setMarkerTextLocal (name _x);
        } else {
            _marker setMarkerTextLocal '[AI]';
        };

        GVAR(bftMarkers) pushBack _marker;
    } forEach _playersGroupUnitsToDrawMarkers;

    _groupsToDrawMarkers = _groupsToDrawMarkers select {
        {
            !(_x in (units (group qipTPL_unit)));
        } count units _x > 0;
    };
};

{
    private _markerType = [_x] call FUNC(getGroupMarkerType);
    private _colour = [_x] call FUNC(getMarkerColor);
    private _size = [_x] call FUNC(getMarkerSize);

    private _marker = createMarkerLocal [str _x, getPos (leader _x)];
    _marker setMarkerTypeLocal _markerType;
    _marker setMarkerColorLocal _colour;
    _marker setMarkerSizeLocal _size;
    _marker setMarkerTextLocal (groupId _x);

    GVAR(bftMarkers) pushBack _marker;
} forEach _groupsToDrawMarkers;
