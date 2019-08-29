#include "script_component.hpp"

if (isDedicated) then {
    call FUNC(initDB);
    [{
        [{{_x call FUNC(saveGear)} forEach allPlayers;}, 30] call CBA_fnc_addPerFrameHandler;
    }, [], 30] call CBA_fnc_waitAndExecute;
};
