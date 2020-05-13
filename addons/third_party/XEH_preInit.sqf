#include "script_component.hpp"

ADDON = false;

#include "initCBASettings.sqf"

if (isNil QEGVAR(common,qipTPL_enabled) || !(EGVAR(common,qipTPL_enabled))) exitWith {};

#include "Scripts\cbrn\XEH_PreInit.sqf"

ADDON = true;
