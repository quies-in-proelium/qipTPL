#include "script_component.hpp"

ADDON = false;

#include "initCBASettings.sqf"

if (isNil QGVAR(qipTPL_enabled) || !(GVAR(qipTPL_enabled))) exitWith {};

#include "XEH_PREP.hpp"

ADDON = true;
