#include "script_component.hpp"

params ['_vehicle'];

private _iconSize = missionNamespace getVariable [(format ['QS_ST_iconSize#%1',(typeOf _vehicle)]),0];

if (_iconSize isEqualTo 0) then {
    if (_vehicle isKindOf 'Man') then {_iconSize = QS_ST_iconSize_Man;_iconSize;};
    if (_vehicle isKindOf 'LandVehicle') then {_iconSize = QS_ST_iconSize_LandVehicle;_iconSize;};
    if (_vehicle isKindOf 'Air') then {_iconSize = QS_ST_iconSize_Air;_iconSize;};
    if (_vehicle isKindOf 'StaticWeapon') then {_iconSize = QS_ST_iconSize_StaticWeapon; _iconSize;};
    if (_vehicle isKindOf 'Ship') then {_iconSize = QS_ST_iconSize_Ship;_iconSize;};
    missionNamespace setVariable [(format ['QS_ST_iconSize#%1',(typeOf _vehicle)]),_iconSize,FALSE];
};

_iconSize;
