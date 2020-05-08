#include "script_component.hpp"

["qipTPL_setCustomMark", "onMapSingleClick", {
    params ["_pos","_shift"];
    if (_shift) then {
        qipTPL_unit setVariable ["qipTPL_customMarkLocation",_pos];
    };
}] call BIS_fnc_addStackedEventHandler;

addMissionEventHandler ["Draw3D", {
    private _qipTPL_customMarkLocation = qipTPL_unit getVariable ["qipTPL_customMarkLocation",nil];
    if (!isNil "_qipTPL_customMarkLocation") then {
        drawIcon3D [
            "tacticalpingdefault",
            [1,1,1,0.75],
            _qipTPL_customMarkLocation,
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
