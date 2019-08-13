#include "script_component.hpp"
/*
 * Author: NemesisRE
 * Get the apropriate marker color.
 *
 * Arguments:
 * 0: groupOrUnit <Group/Object>
 *
 * Return Value:
 * Marker Color <STRING>
 *
 * Example:
 * ["UNIT"] call qipTPL_bft_fnc_getMarkerColor
 *
 * Public: No
 */

params["_unit"];

private _color = "ColorUNKNOWN";

if (_unit in allGroups) exitWith {
    [side (leader _unit),  true] call BIS_fnc_sideColor;
};

if (_unit in allUnits) then {
    private _assignedTeam = [assignedTeam _unit] param [0, "MAIN"];
    _color = ["Color", _assignedTeam, GVAR(teamColors)] joinString "_";
    if (GVAR(showLifeState)) then {
        switch ([_unit] call FUNC(getUnitLifeState)) do {
            case "INCAPACITATED": {_color = "Color_INCAPACITATED";};
            case "INJURED": {_color = "Color_INJURED";};
            case "UNKNOWN": {_color = "ColorUNKNOWN";};
            case "HEALTHY": {_color = _color;};
        };
    };
};

_color
