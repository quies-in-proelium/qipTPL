#include "script_component.hpp"

if (isNil "qipTPL_enabled" || !(qipTPL_enabled) || !hasInterface) exitWith {};

["unit", {
    qipTPL_unit = (_this select 0);
}, true] call CBA_fnc_addPlayerEventHandler;

mod_ACE3 = isClass (configFile >> "CfgPatches" >> "ace_common");

if (isServer) then {
    [] spawn FUNC(rptLog);
    [] call FUNC(addChatCommands);
};

["zeus", {
    [QGVAR(requestZeus), qipTPL_unit] call CBA_fnc_serverEvent;
}, "adminLogged"] call CBA_fnc_registerChatCommand;

call compile preprocessFileLineNumbers QPATHTOF(tplCredits.sqf);

[] spawn FUNC(missionInitialization);
