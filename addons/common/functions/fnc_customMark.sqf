#include "script_component.hpp"

params ["_display","_control"];
private ["_qipTPL_customMark","_customMarkLocation",];

_control ctrlAddEventHandler ["MouseMoving", {
    _qipTPL_customMark = "customMark" in (ctrlMapMouseOver (_this select 0));
}];

 ["qipTPL_setCustomMark", "onMapSingleClick", {
    if (_shift) then {
        _customMarkLocation = _pos;
    };
}] call BIS_fnc_addStackedEventHandler;

_display displayAddEventHandler ["KeyDown", {
    if (!isNil "_qipTPL_customMark" && {_qipTPL_customMark} && {(_this select 1) == 211}) then {
        _customMarkLocation = nil;
    };
}];

addMissionEventHandler ["Draw3D", {
    if (!isNil "_customMarkLocation") then {
        drawIcon3D [
            "tacticalpingdefault",
            [1,1,1,0.5],
            [_customMarkLocation select 0, _customMarkLocation select 1, (_customMarkLocation select 2) + 2],
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
