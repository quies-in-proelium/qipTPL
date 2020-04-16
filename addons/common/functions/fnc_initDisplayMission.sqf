#include "script_component.hpp"
#include "\a3\ui_f\hpp\defineResincl.inc"

params ["_display"];
if (ctrlIDD _display != IDD_MAIN_MAP) exitWith {};

private _control = _display displayCtrl IDC_MAP;

_control ctrlAddEventHandler ["Draw", {_this call FUNC(uavHelper);}];

[_display,_control] call FUNC(customMark);
