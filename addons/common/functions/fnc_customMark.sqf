#include "script_component.hpp"

["qipTPL_setCustomMark", "onMapSingleClick", {
    params ["_pos","_shift"];
    if (_shift) then {
        missionNamespace setVariable ["qipTPL_customMarkLocation",_pos];
    };
}] call BIS_fnc_addStackedEventHandler;

addMissionEventHandler ["Draw3D", {
    if (!isNil str (missionNamespace getVariable "qipTPL_customMarkLocation")) then {
        drawIcon3D [
            "tacticalpingdefault",
            [1,1,1,0.5],
            (missionNamespace getVariable "qipTPL_customMarkLocation"),
            1,
            1,
            0,
            "Marker",
            1,
            0.3,
            "TahomaB",
            'center'
        ];
    };
}];
