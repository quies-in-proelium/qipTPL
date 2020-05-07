#include "script_component.hpp"
/*
	Author: NemesisRE

	Description:
	Shows initialization message

*/
if (GVAR(skipMissionInit)) exitWith {};
private _lastState = qipTPL_unit call EFUNC(loadout,checkSavedUnitState);
if !(count _lastState == 0) exitWith {};

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

private _uavIntro = [] call FUNC(uavIntro);

waitUntil {scriptDone _uavIntro};

switch (GVAR(uavIntroVision)) do {
    case 1: {camUseNVG false};
    case 2: {false setCamUseTI 0};
    case 3: {false setCamUseTI 1};
    case 4: {false setCamUseTI 2};
    case 5: {false setCamUseTI 3};
    case 6: {false setCamUseTI 4};
    case 7: {false setCamUseTI 5};
    case 8: {false setCamUseTI 6};
    case 9: {false setCamUseTI 7};
};
[] call FUNC(missionIntro);
