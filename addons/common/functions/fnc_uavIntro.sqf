#include "script_component.hpp"

private ["_uavIntro","_uavIntroPosition"];

if (!qipTPL_uavIntro) then {
    _uavIntro = 0 spawn {};
};

if (getMarkerColor "qipTPL_uavIntroMarker" == "") then {
    _uavIntroPosition = vehicle qipTPL_unit;
} else {
    _uavIntroPosition = getMarkerPos "qipTPL_uavIntroMarker";
};

if (qipTPL_uavIntroText == "") then {
    qipTPL_uavIntroText = getText (missionConfigFile >> "onLoadName");
};

_uavIntro = [
    _uavIntroPosition,
    qipTPL_uavIntroText,
    qipTPL_uavIntroAltitude,
    qipTPL_uavIntroRadius,
    qipTPL_uavIntroAngle,
    1,
    [],
    0,
    true,
    3
] spawn BIS_fnc_establishingShot;

switch (qipTPL_uavIntroVision) do {
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

_uavIntro;
