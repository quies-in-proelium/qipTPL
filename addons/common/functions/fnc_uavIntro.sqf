#include "script_component.hpp"

private ["_uavIntro","_uavIntroPosition"];

if (!GVAR(uavIntro)) then {
    _uavIntro = 0 spawn {};
} else {
    if (getMarkerColor "qipTPL_uavIntroMarker" == "") then {
        _uavIntroPosition = vehicle qipTPL_unit;
    } else {
        _uavIntroPosition = getMarkerPos "qipTPL_uavIntroMarker";
    };

    if (GVAR(uavIntroText) == "") then {
        GVAR(uavIntroText) = getText (missionConfigFile >> "onLoadName");
    };

    _uavIntro = [
        _uavIntroPosition,
        GVAR(uavIntroText),
        GVAR(uavIntroAltitude),
        GVAR(uavIntroRadius),
        GVAR(uavIntroAngle),
        1,
        [],
        0,
        true,
        3
    ] spawn BIS_fnc_establishingShot;
    //QUESTION: can I call BIS_fnc_establishingShot so I wont need waitUntil?
    switch (GVAR(uavIntroVision)) do {
        case 1: {camUseNVG true};
        case 2: {true setCamUseTI 0};
        case 3: {true setCamUseTI 1};
        case 4: {true setCamUseTI 2};
        case 5: {true setCamUseTI 3};
        case 6: {true setCamUseTI 4};
        case 7: {true setCamUseTI 5};
        case 8: {true setCamUseTI 6};
        case 9: {true setCamUseTI 7};
    };

    [
        {scriptDone _uavIntro},
        {
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
        }
    ] call CBA_fnc_waitUntilAndExecute;
};

_uavIntro;
