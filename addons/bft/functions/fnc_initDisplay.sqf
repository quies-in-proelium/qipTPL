#include "script_component.hpp"

params ["_display"];

if (ctrlIDD _display == 12) then {
    _display displayCtrl 51 ctrlAddEventHandler ["Draw", {
        _this call FUNC(iconDrawMap);
    }];
};

if (GVAR(enableUnitIconsGPS)) then {
    if (ctrlIDD _display == 311) then {
        _display displayCtrl 101 ctrlAddEventHandler ["Draw", {
            _this call FUNC(iconDrawGPS);
        }];
    };
};

if (GVAR(otherDisplays)) then {
    if (ctrlIDD _display == 160) then {
        _display displayCtrl 51 ctrlAddEventHandler ["Draw", {
            _this call FUNC(iconDrawMap);
        }];
    };

    if (ctrlIDD _display == -1) then {
         _display displayCtrl 500 ctrlAddEventHandler ["Draw", {
            _this call FUNC(iconDrawMap);
        }];

        _display displayCtrl 40 ctrlAddEventHandler ["Draw", {
            _this call FUNC(iconDrawMap);
        }];

        _display displayCtrl 41 ctrlAddEventHandler ["Draw", {
            _this call FUNC(iconDrawMap);
        }];
    };
};
