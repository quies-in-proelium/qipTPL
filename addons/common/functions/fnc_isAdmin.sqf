#include "script_component.hpp"
/*
 * Author: NemesisRE
 * Checks if client is any sort of admin
 *
 * Arguments:
 * None
 *
 * Return Value:
 * BOOL
 *
 * Example:
 * call qipTPL_common_fnc_isAdmin;
 *
 */

if ((call BIS_fnc_admin) isEqualTo 2) exitWith {true};
if (getPlayerUID player in getMissionConfigValue ["enableDebugConsole",[]]) exitWith {true};
if (isServer) exitWith {true};

false
