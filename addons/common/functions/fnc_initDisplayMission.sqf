#include "script_component.hpp"

params ["_display"];

if (ctrlIDD _display == 12) then {
    private _control = _display displayCtrl 51;

    _control ctrlAddEventHandler ["Draw", {
        _this call FUNC(uavHelper);
    }];

    [_display,_control] call FUNC(customMark);
};
