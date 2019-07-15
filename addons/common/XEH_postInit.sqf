#include "script_component.hpp"

if (isNil "qipTPL_enabled" || !(qipTPL_enabled)) exitWith {};

["unit", {
    qipTPL_unit = (_this select 0);
}, true] call CBA_fnc_addPlayerEventHandler;

call compile preprocessFileLineNumbers QPATHTOF(qipTPL_config.sqf);
call compile preprocessFileLineNumbers ("qipTPL\config\initConfig.sqf");
call compile preprocessFileLineNumbers ("qipTPL\config\briefing.sqf");
call compile preprocessFileLineNumbers QPATHTOF(tplCredits.sqf);

// Get some mods availability from the A3 config file and store them in easy to use variables
mod_ACE3  = isClass (configFile >> "CfgPatches" >> "ace_common");
qipTPL_init = ["initTPL"] call qipTPL_fnc_paramToBool;

if (isServer) exitWith {
    [] call qipTPL_fnc_rptLog;
};

if (qipTPL_init) then {
    _l = ["tLayer"] call BIS_fnc_rscLayer;
    _l cutText ["", "BLACK IN", (qipTPL_missionInitTime + 5)];
};

_uavHelper = [] spawn {
    disableSerialization;
    waitUntil {!isNull ((findDisplay 12) displayCtrl 51)};
    _ehUavHelperMap = ((findDisplay 12) displayCtrl 51) ctrlAddEventHandler ["draw", "_this call qipTPL_fnc_uavHelper"];
};

qipTPL_init3rdPartyScripts = [] execVM QPATHTOEF(third_party,initScripts.sqf);   // initialize 3rd Scripts
qipTPL_init3rdPartyAddons = [] execVM QPATHTOEF(third_party,initAddons.sqf);  // initialize 3rd Addons

if ( vehicle qipTPL_unit == qipTPL_unit ) then {
    if (mod_ACE3 && !isVirtualCurator) then {
        [qipTPL_unit, currentWeapon qipTPL_unit, currentMuzzle qipTPL_unit] call ACE_SafeMode_fnc_lockSafety;
    };
    if ( primaryWeapon qipTPL_unit != "" ) then {
        qipTPL_unit playMove "AmovPercMstpSlowWrflDnon";
    } else {
        if ( handgunWeapon qipTPL_unit != "" ) then {
            qipTPL_unit playMove "AmovPercMstpSrasWpstDnon_AmovPercMstpSrasWlnrDnon";
        };
    };
};
