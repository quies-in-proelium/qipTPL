#define COMPONENT etu
#define COMPONENT_BEAUTIFIED Emergency transport unit
#include "\z\qiptpl\addons\main\script_mod.hpp"

// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE
// #define CBA_DEBUG_SYNCHRONOUS
// #define ENABLE_PERFORMANCE_COUNTERS

#define LOG_S_2(var1,var2,var3) [format [ARR_3(var1,var2,var3)], QUOTE(COMPONENT_BEAUTIFIED), 1] call FUNC(log)


#ifdef DEBUG_ENABLED_ETU
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_ETU
    #define DEBUG_SETTINGS DEBUG_SETTINGS_ETU
#endif

#include "\z\qiptpl\addons\main\script_macros.hpp"
