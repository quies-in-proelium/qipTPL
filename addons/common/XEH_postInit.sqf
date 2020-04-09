#include "script_component.hpp"

if (isNil QGVAR(qipTPL_enabled) || !(GVAR(qipTPL_enabled))) exitWith {};

["unit", {
    qipTPL_unit = (_this select 0);
}, true] call CBA_fnc_addPlayerEventHandler;

mod_ACE3 = isClass (configFile >> "CfgPatches" >> "ace_common");

if (isServer) then {
    [{time > 10}, {
        if (isDedicated) then {
            [{{_x call FUNC(saveUnitState)} forEach allPlayers;}, 1] call CBA_fnc_addPerFrameHandler;
        };

        [] call FUNC(rptLog);
    }] call CBA_fnc_waitUntilAndExecute;
};

call compile preprocessFileLineNumbers QPATHTOF(tplCredits.sqf);

[] spawn FUNC(missionInitialization);
