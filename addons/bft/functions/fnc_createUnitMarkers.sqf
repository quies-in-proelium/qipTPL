#include "script_component.hpp"
/*
 * Author: NemesisRE
 * Create markers for the players group
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call qipTPL_bft_fnc_createUnitMarkers
 *
 * Public: No
 */

if !(GVAR(showOwnGroupUnits)) exitWith {};

private _playersGroupUnitsToDrawMarkers = units (group qipTPL_unit);

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
                _marker setMarkerTextLocal "[AI]";
            };
        };
    };

    GVAR(bftMarkers) pushBack _marker;
} forEach _playersGroupUnitsToDrawMarkers;
