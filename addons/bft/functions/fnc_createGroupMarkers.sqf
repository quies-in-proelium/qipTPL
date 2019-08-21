#include "script_component.hpp"
/*
 * Author: NemesisRE
 * Create markers for all given groups
 *
 * Arguments:
 * 0: Groups <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * call qipTPL_bft_fnc_createGroupMarkers
 *
 * Public: No
 */

params ["_groupsToDrawMarkers"];

if !(GVAR(showGroupIcons)) exitWith {};

{
    private ["_markerType", "_markerColor", "_markerSize", "_markerName", "_markerText", "_markerPosition", "_markerAlpha", "_marker"];

    _markerType = [_x] call FUNC(getGroupMarkerType);
    _markerColor = [_x] call FUNC(getMarkerColor);
    _markerSize = [_x] call FUNC(getMarkerSize);
    _markerName = _x call BIS_fnc_netId;
    _markerText = groupId _x;
    if (_x == group qipTPL_unit) then {
        _markerPosition = (leader _x) modelToWorld [+5, +5, 0];
        _markerAlpha = 0.5;

    } else {
        _markerPosition = getPos (leader _x);
        _markerAlpha = 1;
    };

    _marker = createMarkerLocal [_markerName, _markerPosition];
    _marker setMarkerTypeLocal _markerType;
    _marker setMarkerColorLocal _markerColor;
    _marker setMarkerSizeLocal _markerSize;
    if (GVAR(showGroupText)) then {
        _marker setMarkerTextLocal _markerText;
    };
    _marker setMarkerAlphaLocal _markerAlpha;

    GVAR(bftMarkers) pushBack _marker;
} forEach _groupsToDrawMarkers;
