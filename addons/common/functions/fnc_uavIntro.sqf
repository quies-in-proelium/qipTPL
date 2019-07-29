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
}

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

_uavIntro;
