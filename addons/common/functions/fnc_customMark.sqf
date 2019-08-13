#include "script_component.hpp"

params ["_display","_control"];
private ["_qipTPL_customMark"];

_control ctrlAddEventHandler ["MouseMoving", {
    _qipTPL_customMark = "customMark" in (ctrlMapMouseOver (_this select 0));
}];

 ["qipTPL_setCustomMark", "onMapSingleClick", {
    params ["_pos","_shift"];
    if (_shift) then {
        missionNamespace setVariable ["qipTPL_customMarkLocation",_pos];
    };
}] call BIS_fnc_addStackedEventHandler;

_display displayAddEventHandler ["KeyDown", {
    if (!isNil "_qipTPL_customMark" && {_qipTPL_customMark} && {(_this select 1) == 211}) then {
        missionNamespace setVariable ["qipTPL_customMarkLocation",nil];
    };
}];

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
