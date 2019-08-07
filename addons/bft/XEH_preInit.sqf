#include "script_component.hpp"

ADDON = false;

#include "initCBASettings.sqf"
#include "XEH_PREP.hpp"

if (hasInterface) then {
    PREP(initDisplay);
};

ADDON = true;
