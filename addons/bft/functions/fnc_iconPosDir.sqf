#include "script_component.hpp"

params ['_vehicle','_ds','_dl'];

private _iconPosDir = [[0,0,0],0];

if (_ds isEqualTo 1) then {
    if (_dl > 0) then {
        if (diag_tickTime > (missionNamespace getVariable 'QS_ST_iconUpdatePulseTimer')) then {
            _iconPosDir = [getPosASLVisual _vehicle,getDirVisual _vehicle];
            _vehicle setVariable ['QS_ST_lastPulsePos',_iconPosDir,FALSE];
        } else {
            if (!isNil {_vehicle getVariable 'QS_ST_lastPulsePos'}) then {
                _iconPosDir = _vehicle getVariable 'QS_ST_lastPulsePos';
            } else {
                _iconPosDir = [getPosASLVisual _vehicle,getDirVisual _vehicle];
                _vehicle setVariable ['QS_ST_lastPulsePos',_iconPosDir,FALSE];
            };
        };
    } else {
        _iconPosDir = [getPosASLVisual _vehicle,getDirVisual _vehicle];
    };
} else {
    _iconPosDir = [getPosASLVisual _vehicle,getDirVisual _vehicle];
};

_iconPosDir;
