#include "script_component.hpp"

params ["_unit"];

private _curator = (createGroup sideLogic) createUnit ["ModuleCurator_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_curator setVariable ["Addons", 3, true];
_curator addCuratorEditableObjects [allMissionObjects "", true];
_unit assignCurator _curator;
