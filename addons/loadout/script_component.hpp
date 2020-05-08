#define COMPONENT loadout
#define COMPONENT_BEAUTIFIED Loadout
#include "\z\qipTPL\addons\main\script_mod.hpp"

#ifdef DEBUG_ENABLED_LOADOUT
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_LOADOUT
    #define DEBUG_SETTINGS DEBUG_SETTINGS_LOADOUT
#endif

#define DEBUG_MODE_NORMAL
#define DEBUG_SYNCHRONOUS
#include "\z\qipTPL\addons\main\script_macros.hpp"
