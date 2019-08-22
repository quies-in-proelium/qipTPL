#include "script_component.hpp"
/*
 * Author: NemesisRE
 * Checks if given unit has any sort of GPS device
 *
 * Arguments:
 * 0: Unit <Object>
 *
 * Return Value:
 * has any sort of GPS device <BOOL>
 *
 * Example:
 * ["UNIT"] call qipTPL_bft_fnc_getMarkerSize
 *
 * Public: No
 */

params [["_unit", qipTPL_unit]];

private _return = FALSE;

if ("ACE_microDAGR" in items _unit) then {
    _return = TRUE;
} else {
    {
        if (_x isKindOf ["ItemGPS", configFile >> "CfgWeapons"] || {_x isKindOf ["UavTerminal_base", configFile >> "CfgWeapons"]} || {_x isKindOf ["ItemcTab", configFile >> "CfgWeapons"]}) then {
            _return = TRUE;
        };
    } forEach assignedItems _unit;
};
_return;
