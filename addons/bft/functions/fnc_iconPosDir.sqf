#include "script_component.hpp"

params ['_vehicle','_ds','_delay'];

private _iconPosDir = [[0,0,0],0];

if (_ds isEqualTo 1) then {
    if (_delay > 0) then {
        if (diag_tickTime > (missionNamespace getVariable QGVAR(iconUpdatePulseTimer))) then {
            _iconPosDir = [getPosASLVisual _vehicle,getDirVisual _vehicle];
            _vehicle setVariable [QGVAR(lastPulsePos),_iconPosDir,FALSE];
        } else {
            if (!isNil {_vehicle getVariable QGVAR(lastPulsePos)}) then {
                _iconPosDir = _vehicle getVariable QGVAR(lastPulsePos);
            } else {
                _iconPosDir = [getPosASLVisual _vehicle,getDirVisual _vehicle];
                _vehicle setVariable [QGVAR(lastPulsePos),_iconPosDir,FALSE];
            };
        };
    } else {
        _iconPosDir = [getPosASLVisual _vehicle,getDirVisual _vehicle];
    };
} else {
    _iconPosDir = [getPosASLVisual _vehicle,getDirVisual _vehicle];
};

_iconPosDir;
