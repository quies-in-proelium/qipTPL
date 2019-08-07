#include "script_component.hpp"

params ['_vehicle'];

private _unit = effectiveCommander _vehicle;
private _ps = side _unit;
private _color = [0,0,0,0];

if (_ps isEqualTo EAST) exitWith {
    _color = GVAR(iconColor_EAST);
    _unit setVariable [QGVAR(groupIconColor),
    [_color,_ps],FALSE];
    _color;
};
if (_ps isEqualTo WEST) exitWith {
    _color = GVAR(iconColor_WEST);
    _unit setVariable [QGVAR(groupIconColor),[_color,_ps],FALSE];
    _color;
};
if (_ps isEqualTo RESISTANCE) exitWith {
    _color = GVAR(iconColor_RESISTANCE);
    _unit setVariable [QGVAR(groupIconColor),[_color,_ps],FALSE];
    _color;
};
if (_ps isEqualTo CIVILIAN) exitWith {
    _color = GVAR(iconColor_CIVILIAN);
    _unit setVariable [QGVAR(groupIconColor),[_color,_ps],FALSE];
    _color;
};
_color = GVAR(iconColor_UNKNOWN);
_unit setVariable [QGVAR(groupIconColor),[_color,_ps],FALSE];

_color;
