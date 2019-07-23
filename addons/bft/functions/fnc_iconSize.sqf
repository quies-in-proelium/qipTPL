#include "script_component.hpp"

params ['_vehicle','','_QS_ST_X'];

private _iconSize = missionNamespace getVariable [(format ['QS_ST_iconSize#%1',(typeOf _vehicle)]),0];

if (_iconSize isEqualTo 0) then {
    if (_vehicle isKindOf 'Man') then {_iconSize = _QS_ST_X select 22;_iconSize;};
    if (_vehicle isKindOf 'LandVehicle') then {_iconSize = _QS_ST_X select 23;_iconSize;};
    if (_vehicle isKindOf 'Air') then {_iconSize = _QS_ST_X select 25;_iconSize;};
    if (_vehicle isKindOf 'StaticWeapon') then {_iconSize = _QS_ST_X select 26; _iconSize;};
    if (_vehicle isKindOf 'Ship') then {_iconSize = _QS_ST_X select 24;_iconSize;};
    missionNamespace setVariable [(format ['QS_ST_iconSize#%1',(typeOf _vehicle)]),_iconSize,FALSE];
};

_iconSize;
