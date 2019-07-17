#include "script_component.hpp"

private ["_uavIntroPosition","_uavIntro"];

if (getMarkerColor "qipTPL_uavIntroMarker" == "") then {
	_uavIntroPosition = vehicle qipTPL_unit;
} else {
	_uavIntroPosition = getMarkerPos "qipTPL_uavIntroMarker";
};

_uavIntro = [
    _uavIntroPosition, // Target position (replace MARKERNAME)
    getText (missionConfigFile >> "onLoadName"), // SITREP text
    100,                    // 400m altitude
    100,                    // 200m radius
    160,                    // 0 degrees viewing angle
    1,                      // Clockwise movement
    [],
    1,
    true,
    3
] spawn BIS_fnc_establishingShot;

_uavIntro;
