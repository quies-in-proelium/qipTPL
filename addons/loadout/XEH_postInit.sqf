#include "script_component.hpp"

if (isNil QGVAR(qipTPL_enabled) || !(GVAR(qipTPL_enabled))) exitWith {};

[{time > 5}, {
    [{{_x call FUNC(saveUnitState)} forEach allPlayers;}, 1] call CBA_fnc_addPerFrameHandler;
}] call CBA_fnc_waitUntilAndExecute;

[
    "[qipTPL] Loadout",
    "Set predefined loadout",
    {
        params ["","_object"];
        if ( !isNil "_object"  && { _object isKindOf "CAManBase" } ) then {
            [QFUNC(applyLoadout), [_object,true], _object] call CBA_fnc_targetEvent;
        };
    }
] call zen_custom_modules_fnc_register;

[
    "[qipTPL] Loadout",
    "Export qipTPL loadout",
    {
        params ["","_object"];
        if ( !isNil "_object"  && { _object isKindOf "CAManBase" } ) then {
            [_object] call FUNC(exportInventory);
        };
    }
] call zen_custom_modules_fnc_register;
