#include "script_component.hpp"

if (isNil QGVAR(qipTPL_enabled) || !(GVAR(qipTPL_enabled))) exitWith {};

if (isServer) then {
    [{time > 10}, {
        [{{_x call FUNC(saveUnitState)} forEach allPlayers;}, 1] call CBA_fnc_addPerFrameHandler;
    }] call CBA_fnc_waitUntilAndExecute;
};
