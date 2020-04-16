#include "script_component.hpp"
#include "\a3\ui_f\hpp\defineresincl.inc"
#include "\a3\ui_f\hpp\definedikcodes.inc"

params ["_display"];
if (ctrlIDD _display != IDD_MAIN_MAP) exitWith {};

private _control = _display displayCtrl IDC_MAP;

_control ctrlAddEventHandler ["Draw", {_this call FUNC(uavHelper);}];

_control ctrlAddEventHandler ["MouseMoving", {
    params ["_control"];
    GVAR(qipTPL_customMark) = "customMark" in (ctrlMapMouseOver _control);
}];

_display displayAddEventHandler ["KeyDown", {
    params ["", "_keyCode"];
    if (!isNil QGVAR(qipTPL_customMark) && {GVAR(qipTPL_customMark)} && {(_keyCode) == DIK_DELETE}) then {
        missionNamespace setVariable ["qipTPL_customMarkLocation",nil];
    };
}];
