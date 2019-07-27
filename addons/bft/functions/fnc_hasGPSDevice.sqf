#include "script_component.hpp"

private _return = FALSE;

if ("ACE_microDAGR" in items player) then {
    _return = TRUE;
} else {
    {
        if (_x isKindOf ["ItemGPS", configFile >> "CfgWeapons"] || {_x isKindOf ["UavTerminal_base", configFile >> "CfgWeapons"]} || {_x isKindOf ["ItemcTab", configFile >> "CfgWeapons"]}) then {
            _return = TRUE;
        };
    } forEach assignedItems player;
};
_return;
