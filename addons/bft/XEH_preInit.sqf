#include "script_component.hpp"

ADDON = false;

#include "initCBASettings.sqf"
#include "XEH_PREP.hpp"

if (hasInterface) then {
    if (GVAR(bftEnabled)) then {
        GVAR(bftMarkers) = [];
        [FUNC(trackingUpdate), GVAR(updateInterval), []] call CBA_fnc_addPerFrameHandler;
    };
};

ADDON = true;
