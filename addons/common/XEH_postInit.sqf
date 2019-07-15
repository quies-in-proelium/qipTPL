#include "script_component.hpp"

if (!hasInterface) exitWith {};

if (isServer) exitWith {
    [] call FUNC(rptLog);
};

if (isNil "qipTPL_enabled" || !(qipTPL_enabled)) exitWith {};

["unit", {
    qipTPL_unit = (_this select 0);
}, true] call CBA_fnc_addPlayerEventHandler;

call compile preprocessFileLineNumbers ("qipTPL\config\briefing.sqf");
call compile preprocessFileLineNumbers QPATHTOF(tplCredits.sqf);

mod_ACE3  = isClass (configFile >> "CfgPatches" >> "ace_common");

call FUNC(missionInitialization);

_uavHelper = [] spawn {
    disableSerialization;
    waitUntil {!isNull ((findDisplay 12) displayCtrl 51)};
    _ehUavHelperMap = ((findDisplay 12) displayCtrl 51) ctrlAddEventHandler ["draw", "_this call FUNC(uavHelper)"];
};

if ( vehicle qipTPL_unit == qipTPL_unit ) then {
    if (mod_ACE3) then {
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
