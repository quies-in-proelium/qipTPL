#include "script_component.hpp"

ADDON = false;

if (isNil QEGVAR(common,qipTPL_enabled) || !(EGVAR(common,qipTPL_enabled))) exitWith {};

#include "XEH_PREP.hpp"

ADDON = true;
