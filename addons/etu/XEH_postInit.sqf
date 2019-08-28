#include "script_component.hpp"

if (isServer) then {
    [{{_x call FUNC(saveGear)} forEach allPlayers;}, 30] call CBA_fnc_addPerFrameHandler;
};
