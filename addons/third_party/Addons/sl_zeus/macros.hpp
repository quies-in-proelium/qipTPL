/*
 * Defines all necessary macros used within the mission
 */

 #define MAJOR 1
 #define MINOR 7
 #define BUILD 0

 #define VERSION MAJOR.MINOR.BUILD
 #define QVERSION QUOTE(VERSION)

 // indicate that developer mode is on
 //#define DEBUG true
 //#define SHOW_ONSCREEN_NOTIFICATIONS true

 // SL Zeus
 #define TAG SLZ

 #define GVAR(var) TAG##_##var
 #define QGVAR(var) QUOTE(GVAR(var))

 #define FUNC(function) TAG##_fnc_##function
 #define QFUNC(function) QUOTE(FUNC(function))

 #define QUOTE(txt) #txt
 #define FORMAT(txt, var) format [QUOTE(txt), var]

 // Debug tools
 #ifdef DEBUG
     // define debug macros
    #define CHECK_TRUE(bool) if (!(bool)) then { ERROR_LOG(Expected true but was false) };
    #define CHECK_TRUE(bool, msg) if (!(bool)) then { ERROR_LOG(msg) };
    #define CHECK_TRUE(bool, msg, code) if (!(bool)) then { ERROR_LOG(msg) }; if(!(bool)) exitWith code;
    #define CHECK_FALSE(bool) if (bool) then { ERROR_LOG(Expected false but was true) };
    #define CHECK_FALSE(bool, msg) if (bool) then { ERROR_LOG(msg) };
    #define CHECK_FALSE(bool, msg, code) if (bool) then { ERROR_LOG(msg) }; if(bool) exitWith code;
    #define DEBUG_LOG(msg) LOG(SL_Zeus VERSION [DEBUG]: msg)
    #define DEBUG_EXEC(code) code;
 #else
     // do nothing
     #define CHECK_TRUE(bool)
     #define CHECK_TRUE(bool, msg)
     #define CHECK_TRUE(bool, msg, code)
     #define CHECK_FALSE(bool)
     #define CHECK_FALSE(bool, msg)
     #define CHECK_FALSE(bool, msg, code)
     #define FUNCTIONS_RECOMPILE
     #define DEBUG_LOG(msg)
     #define DEBUG_EXEC(code)
 #endif

 // Logging
 #define ERROR_LOG(msg) LOG(<t color='#ff0000'>SL_Zeus VERSION [Error]:</t> msg)
 #define NOTIFICATION_LOG(msg) LOG(<t color='#50dd00'>SL_Zeus VERSION [Notification]:</t> msg)
 #define NOTIFICATION_FORMAT_LOG(msg, var) FORMAT_LOG(<t color='#50dd00'>SL_Zeus VERSION [Notification]:</t> msg, var)
 #define WARNING_LOG(msg) LOG(<t color='#ff8f00'>SL_Zeus VERSION [Warning]:</t> msg)

 #define SCRIPT_REFERENCE format["(%1: %2)", _fnc_scriptName, __LINE__]

 #ifdef SHOW_ONSCREEN_NOTIFICATIONS
     //TODO: use popup window for error display
     #define LOG(msg) diag_log (parseText(QUOTE(msg) + " - " + SCRIPT_REFERENCE)); \
         hintSilent (parseText(QUOTE(msg) + "</br>" + SCRIPT_REFERENCE));
     #define LOG_VAR(var) diag_log (parseText(str var + " - " + SCRIPT_REFERENCE)); \
         hintSilent (parseText(str var + "</br>" + SCRIPT_REFERENCE));
     #define FORMAT_LOG(msg, var) diag_log (parseText(FORMAT(msg, var) + " - " + SCRIPT_REFERENCE)); \
         hintSilent (parseText(FORMAT(msg, var) + " - " + SCRIPT_REFERENCE));
 #else
    #define LOG(msg) diag_log (parseText(QUOTE(msg) + " " + SCRIPT_REFERENCE));
    #define LOG_VAR(var) diag_log (str var + " " + SCRIPT_REFERENCE);
    #define FORMAT_LOG(msg, var) diag_log (parseText(FORMAT(msg, var) + " - " + SCRIPT_REFERENCE));
 #endif
