#include "script_component.hpp"
/*
	Author: NemesisRE

	Description:
	Shows initialization message

*/

if (GVAR(skipMissionInit)) exitWith {};

private ["_uavIntro"];

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

_uavIntro = [] call FUNC(uavIntro);

[{scriptDone _uavIntro}, {call FUNC(missionIntro)}, [player]] call CBA_fnc_waitUntilAndExecute;
