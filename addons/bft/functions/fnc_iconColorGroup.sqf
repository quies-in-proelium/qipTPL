#include "script_component.hpp"

params ['_vehicle'];

private _unit = effectiveCommander _vehicle;
private _ps = side _unit;
private _color = [0,0,0,0];

if (_ps isEqualTo EAST) exitWith {
    _color = QS_ST_iconColor_EAST;
    _unit setVariable ['QS_ST_groupIconColor',
    [_color,_ps],FALSE];
    _color;
};
if (_ps isEqualTo WEST) exitWith {
    _color = QS_ST_iconColor_WEST;
    _unit setVariable ['QS_ST_groupIconColor',[_color,_ps],FALSE];
    _color;
};
if (_ps isEqualTo RESISTANCE) exitWith {
    _color = QS_ST_iconColor_RESISTANCE;
    _unit setVariable ['QS_ST_groupIconColor',[_color,_ps],FALSE];
    _color;
};
if (_ps isEqualTo CIVILIAN) exitWith {
    _color = QS_ST_iconColor_CIVILIAN;
    _unit setVariable ['QS_ST_groupIconColor',[_color,_ps],FALSE];
    _color;
};
_color = QS_ST_iconColor_UNKNOWN;
_unit setVariable ['QS_ST_groupIconColor',[_color,_ps],FALSE];

_color;
