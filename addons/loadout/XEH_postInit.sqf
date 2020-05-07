#include "script_component.hpp"

if (isNil QGVAR(qipTPL_enabled) || !(GVAR(qipTPL_enabled))) exitWith {};

[{time > 5}, {
    [{{_x call FUNC(saveUnitState)} forEach allPlayers;}, 1] call CBA_fnc_addPerFrameHandler;
}] call CBA_fnc_waitUntilAndExecute;

if (hasInterface) then {
    [
        { !isNull player },
        {
            private _lastState = qipTPL_unit call FUNC(checkSavedUnitState);
            if !(count _lastState == 0) then {
                INFO(format ["Found previous gear for this entity (%1)", qipTPL_unit]);
                [qipTPL_unit,_lastState] call FUNC(restoreSavedState);
            } else {
                [qipTPL_unit] call FUNC(applyLoadout);
            };
        }
    ] call CBA_fnc_waitUntilAndExecute;
};
