#include "script_component.hpp"

params ['_vehicle','_QS_ST_X'];

private _unit = effectiveCommander _vehicle;
private _ps = side _unit;
private _c = [0,0,0,0];

if (_ps isEqualTo EAST) exitWith {
    _c = _QS_ST_X select 9;
    _unit setVariable ['QS_ST_groupIconColor',
    [_c,_ps],FALSE];
    _c;
};
if (_ps isEqualTo WEST) exitWith {
    _c = _QS_ST_X select 10;
    _unit setVariable ['QS_ST_groupIconColor',[_c,_ps],FALSE];
    _c;
};
if (_ps isEqualTo RESISTANCE) exitWith {
    _c = _QS_ST_X select 11;
    _unit setVariable ['QS_ST_groupIconColor',[_c,_ps],FALSE];
    _c;
};
if (_ps isEqualTo CIVILIAN) exitWith {
    _c = _QS_ST_X select 12;
    _unit setVariable ['QS_ST_groupIconColor',[_c,_ps],FALSE];
    _c;
};
_c = _QS_ST_X select 13;
_unit setVariable ['QS_ST_groupIconColor',[_c,_ps],FALSE];

_c;
