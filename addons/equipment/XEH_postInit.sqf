#include "script_component.hpp"

if (isNil QGVAR(qipTPL_enabled) || !(GVAR(qipTPL_enabled))) exitWith {};

["unit", {
    qipTPL_unit = (_this select 0);
}, true] call CBA_fnc_addPlayerEventHandler;

mod_ACE3 = isClass (configFile >> "CfgPatches" >> "ace_common");

if (isServer) then {
    [{time > 5}, {
        call FUNC(initDB);
        call FUNC(rptLog);
    }] call CBA_fnc_waitUntilAndExecute;
};

if (hasInterface) then {
    call compile preprocessFileLineNumbers QPATHTOF(tplCredits.sqf);
    [] spawn FUNC(missionInitialization);
};
