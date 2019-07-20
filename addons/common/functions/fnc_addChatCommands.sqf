#include "script_component.hpp"

[QGVAR(requestZeus), {
    if (!isNull getAssignedCuratorLogic _ownerPlayer) exitWith {};
    params ["_ownerPlayer"];
    private _owner = ["#adminLogged", getPlayerUID _ownerPlayer] select isMultiplayer;
    private _group = createGroup sideLogic;
    private _zeus = _group createUnit ["ModuleCurator_F", [0,0,0], [], 0, "NONE"];
    _zeus setVariable ["owner", _owner, true];
    _zeus setVariable ["Addons", 3, true];
    _zeus setVariable ["TFAR_CuratorCamEars",true,true];
    _zeus setVariable ["BIS_fnc_initModules_disableAutoActivation", false];
    _zeus setCuratorCoef ["Place", 0];
    _zeus setCuratorCoef ["Delete", 0];
    _group deleteGroupWhenEmpty true;
    _zeus addCuratorEditableObjects [allMissionObjects "", true];
}] call CBA_fnc_addEventHandler;
["zeus", {
    [QGVAR(requestZeus), qipTPL_unit] call CBA_fnc_serverEvent;
}, "adminLogged"] call CBA_fnc_registerChatCommand;
