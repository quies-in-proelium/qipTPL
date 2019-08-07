#include "script_component.hpp"

params ['_unit'];

private _vehicleType = typeOf (vehicle _unit);
private _iconType = missionNamespace getVariable [QGVAR(iconType#) + _vehicleType,''];
switch ((_iconType isEqualTo '') && ((vehicle _unit) isKindOf 'CAManBase')) do {
    case (_unit getUnitTrait 'medic'): {
        _vehicleType = 'B_medic_F';
    };
    case (_unit getUnitTrait 'engineer'): {
        _vehicleType = 'B_engineer_F';
    };
    case (_unit getUnitTrait 'explosiveSpecialist'): {
        _vehicleType = 'B_soldier_exp_F';
    };
};

_iconType = getText (configFile >> 'CfgVehicles' >> _vehicleType >> 'icon');
missionNamespace setVariable [QGVAR(iconType#) + _vehicleType,_iconType];

_iconType;
