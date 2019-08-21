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

private ["_groupsToDrawMarkers", "_playerSide", "_showFriendlySides", "_sides", "_playersGroupUnitsToDrawMarkers"];

{
    deleteMarkerLocal _x;
} forEach GVAR(bftMarkers);

GVAR(bftMarkers) = [];

if (GVAR(requireItemGPS) && !([qipTPL_unit] call FUNC(hasGPSDevice))) exitWith {};

_groupsToDrawMarkers = [];
_playerSide = playerSide;
_showFriendlySides = [];
_sides = [EAST,WEST,RESISTANCE,CIVILIAN];
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
    _playersGroupUnitsToDrawMarkers = units (group qipTPL_unit);

    {
        private ["_markerType", "_markerColor", "_markerSize", "_markerDir", "_markerName", "_markerText", "_marker"];
         _markerType = [_x] call FUNC(getUnitMarkerType);
         _markerColor = [_x] call FUNC(getMarkerColor);
         _markerSize = [_x] call FUNC(getMarkerSize);
         _markerDir = getDirVisual (vehicle _x);
        if (!isNull objectParent _x) then {
            _markerName = (objectParent _x) call BIS_fnc_netId;
            _markerText = groupId (group _x);
        } else {
            _markerName = _x call BIS_fnc_netId;
            _markerText = name _x;
        };

        _marker = createMarkerLocal [_markerName, getPos _x];
        _marker setMarkerTypeLocal _markerType;
        _marker setMarkerColorLocal _markerColor;
        _marker setMarkerSizeLocal _markerSize;
        _marker setMarkerDirLocal _markerDir;
        if (GVAR(showUnitNames)) then {
            if ([_x] call FUNC(isPlayer)) then {
                if (GVAR(showPlayerNames)) then {
                    _marker setMarkerTextLocal _markerText;
                };
            } else {
                if (GVAR(showAINames)) then {
                    _marker setMarkerTextLocal _markerText;
                } else {
                    _marker setMarkerTextLocal '[AI]';
                };
            };
        };

        GVAR(bftMarkers) pushBack _marker;
    } forEach _playersGroupUnitsToDrawMarkers;

    if !(GVAR(showOwnGroup)) then {
        _groupsToDrawMarkers = _groupsToDrawMarkers select {
            {
                !(_x in (units (group qipTPL_unit)));
            } count units _x > 0;
        };
    };
};

{
    private ["_markerType", "_markerColor", "_markerSize", "_markerName", "_markerText", "_marker"];

    _markerType = [_x] call FUNC(getGroupMarkerType);
    _markerColor = [_x] call FUNC(getMarkerColor);
    _markerSize = [_x] call FUNC(getMarkerSize);
    _markerName = _x call BIS_fnc_netId;
    _markerText = groupId _x;

    _marker = createMarkerLocal [_markerName, (leader _x) modelToWorld [+5,0,0]];
    _marker setMarkerTypeLocal _markerType;
    _marker setMarkerColorLocal _markerColor;
    _marker setMarkerSizeLocal _markerSize;
    if (GVAR(showGroupMapText)) then {
        _marker setMarkerTextLocal _markerText;
    };

    GVAR(bftMarkers) pushBack _marker;
} forEach _groupsToDrawMarkers;
