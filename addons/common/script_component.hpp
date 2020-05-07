#define COMPONENT common
#define COMPONENT_BEAUTIFIED Common
#include "\z\qiptpl\addons\main\script_mod.hpp"

#ifdef DEBUG_ENABLED_COMMON
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_COMMON
    #define DEBUG_SETTINGS DEBUG_SETTINGS_COMMON
#endif

#define DEBUG_MODE_NORMAL
#define DEBUG_SYNCHRONOUS
#include "\z\qiptpl\addons\main\script_macros.hpp"
