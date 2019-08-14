/*
 * Author: BlauBär
 * Logs a message of the given type to the RPT.
 *
 * Arguments:
 * 0: Message <STRING>
 * 1: Component <STRING>
 * 2: Mode (0 = local, 1 = server, 2 = global) <NUMBER>
 *
 * Return Value:
 * None
 */
#include "script_component.hpp"
params ["_message", "_component", ["_mode", 0]];

switch (_mode) do {
    case 0: {
        diag_log formatText ["[Template] %1: %2", _component, _message];
    };
    case 1: {
        if (!isServer) then {
            diag_log formatText ["[Template] %1: %2", _component, _message];
        };
        [QGVAR(log), [_message, _component]] call CBA_fnc_serverEvent;
    };
    case 2: {
        [QGVAR(log), [_message, _component]] call CBA_fnc_globalEvent;
    };
};
