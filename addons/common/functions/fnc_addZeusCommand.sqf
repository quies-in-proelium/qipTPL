#include "script_component.hpp"

[QGVAR(giveZeus), {
    params ["_unit"];
    private _curator = (createGroup sideLogic) createUnit ["ModuleCurator_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
    _curator setVariable ["Addons", 3, true];
    _curator addCuratorEditableObjects [allMissionObjects "", true];
    _unit assignCurator _curator;
}] call CBA_fnc_addEventHandler;
["zeus", {
    systemChat "Zeus wird angefordert...";
    [QGVAR(giveZeus), [player]] call CBA_fnc_serverEvent;
}, "adminLogged"] call CBA_fnc_registerChatCommand;
