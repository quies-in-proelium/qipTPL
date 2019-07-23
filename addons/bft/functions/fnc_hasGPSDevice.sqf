#include "script_component.hpp"

private _r = FALSE;

if ("ACE_microDAGR" in items player) then {
    _r = TRUE;
} else {
    {
        if (_x isKindOf ["ItemGPS", configFile >> "CfgWeapons"] || {_x isKindOf ["UavTerminal_base", configFile >> "CfgWeapons"]} || {_x isKindOf ["ItemcTab", configFile >> "CfgWeapons"]}) then {
            _r = TRUE;
        };
    } forEach assignedItems player;
};
_r;
