#include "script_component.hpp"
/*
 * Author: NemesisRE
 * Get the apropriate marker size depending on the map scale.
 *
 * Arguments:
 * 0: groupOrUnit <Group/Object>
 *
 * Return Value:
 * Marker Size <ARRAY>
 *
 * Example:
 * ["UNIT"] call qipTPL_bft_fnc_getMarkerSize
 *
 * Public: No
 */

params ["_unit"];

private _size = [1,1];
private _briefingScale = ctrlMapScale ((findDisplay 53) displayCtrl 51);
private _mapScale = ctrlMapScale ((findDisplay 12) displayCtrl 51);

if (_unit in allGroups) exitWith {
    if ((_mapScale > 0.06) || (_briefingScale > 0.06)) then {
        _size = [0.5,0.5];
    };
};

if (_unit in allUnits) then {
    if ((_mapScale > 0.06) || (_briefingScale > 0.06)) then {
        _size = [0.5,0.5];
    };
};

_size
