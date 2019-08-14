#include "script_component.hpp"
/*
 * Author: BlauBär
 * Handles clicking the teleport button.
 *
 * Arguments:
 * 0: Button <CONTROL>
 *
 * Return Value:
 * None
 */

if (isNull GVAR(target)) exitWith {};
closeDialog 0;

LOG_S_2("%1 teleportierte sich zu %2.",name qipTPL_unit,name GVAR(target));

switch GVAR(targetType) do {
    case "nearby": {
        private _targetPos = GVAR(target) modelToWorld [0, -2, 0];
        _targetPos set [2, 0];
        qipTPL_unit setPos _targetPos;
        qipTPL_unit setDir (qipTPL_unit getDir GVAR(target));
    };
    case "nearbyVehicle": {
        private _targetPos = (vehicle GVAR(target)) modelToWorld [10, 0, 0];
        _targetPos set [2, 0];
        qipTPL_unit setPos _targetPos;
        qipTPL_unit setDir (qipTPL_unit getDir vehicle GVAR(target));
    };
    case "cargo": {
        qipTPL_unit moveInCargo vehicle GVAR(target);
    };
    case "driver": {
        qipTPL_unit moveInDriver vehicle GVAR(target);
    };
    case "gunner": {
        qipTPL_unit moveInGunner vehicle GVAR(target);
    };
    case "commander": {
        qipTPL_unit moveInCommander vehicle GVAR(target);
    };
};
