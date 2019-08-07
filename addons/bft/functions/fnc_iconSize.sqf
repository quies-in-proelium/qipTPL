#include "script_component.hpp"

params ['_vehicle'];

private _iconSize = missionNamespace getVariable [QGVAR(iconSize#) + typeOf _vehicle, 0];;

if (_iconSize isEqualTo 0) then {
    if (_vehicle isKindOf 'Man') then {_iconSize = GVAR(iconSize_Man);_iconSize;};
    if (_vehicle isKindOf 'LandVehicle') then {_iconSize = GVAR(iconSize_LandVehicle);_iconSize;};
    if (_vehicle isKindOf 'Air') then {_iconSize = GVAR(iconSize_Air);_iconSize;};
    if (_vehicle isKindOf 'StaticWeapon') then {_iconSize = GVAR(iconSize_StaticWeapon); _iconSize;};
    if (_vehicle isKindOf 'Ship') then {_iconSize = GVAR(iconSize_Ship);_iconSize;};
    missionNamespace setVariable [QGVAR(iconSize#) + typeOf _vehicle,_iconSize,FALSE];
};

_iconSize;
