#include "script_component.hpp"

params ["_ownerPlayer"];

if (!isNull getAssignedCuratorLogic _ownerPlayer) exitWith {};

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
