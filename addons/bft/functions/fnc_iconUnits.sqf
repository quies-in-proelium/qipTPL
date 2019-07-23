#include "script_component.hpp"

params ['_di','_QS_ST_X'];

private _exit = FALSE;
private _side = [EAST,WEST,RESISTANCE,CIVILIAN];
private _as = [];
private _au = [];
private _isAdmin = (((call (missionNamespace getVariable 'BIS_fnc_admin')) isEqualTo 2) && (_QS_ST_X select 86));

if (!(playerSide isEqualTo CIVILIAN)) then {
    if (!(_QS_ST_X select 74)) then {
        _side = [EAST,WEST,RESISTANCE];
    };
};
if ((_QS_ST_X select 61) > 0) exitWith {
    if ((_QS_ST_X select 61) isEqualTo 1) then {
        _au = allUnits + vehicles;
    };
    if ((_QS_ST_X select 61) isEqualTo 2) then {
        _au = entities [[],[],TRUE,TRUE];
    };
    _au;
};
if (((_di isEqualTo 1) && ((_QS_ST_X select 65))) && {(!(_QS_ST_X select 75))}) then {
    _exit = TRUE;
    _au = units (group player);
    if ((_QS_ST_X select 80)) then {
        {
            if (!(_x in _au)) then {
                if (_x getVariable ['QS_ST_drawEmptyVehicle',FALSE]) then {
                    if ((crew _x) isEqualTo []) then {
                        0 = _au pushBack _x;
                    };
                };
            };
        } count vehicles;
    };
    _au;
};
if ((_di isEqualTo 2) && ((_QS_ST_X select 29))) then {
    _exit = TRUE;
    _au = units (group player);
    _au;
};
if (_exit) exitWith {_au;};
if ((_QS_ST_X select 62)) then {
    _as pushBack (_side select (_QS_ST_X select 3));
} else {
    if (isMultiplayer) then {
        if (_isAdmin) then {
            {
                0 = _as pushBack _x;
            } count _side;
        } else {
            if ((_QS_ST_X select 8)) then {
                _as pushBack (_side select (_QS_ST_X select 3));
                {
                    if (((_side select (_QS_ST_X select 3)) getFriend _x) > 0.6) then {
                        0 = _as pushBack _x;
                    };
                } count _side;
            } else {
                _as pushBack (_side select (_QS_ST_X select 3));
                {
                    0 = _as pushBack (_side select _x);
                } count (_QS_ST_X select 57);
            };
        };
    } else {
        if ((_QS_ST_X select 8)) then {
            _as pushBack (_side select (_QS_ST_X select 3));
            {
                if (((_side select (_QS_ST_X select 3)) getFriend _x) > 0.6) then {
                    0 = _as pushBack _x;
                };
            } count _side;
        } else {
            _as pushBack (_side select (_QS_ST_X select 3));
            {
                0 = _as pushBack (_side select _x);
            } count (_QS_ST_X select 57);
        };
    };
};
if (!(_QS_ST_X select 63)) then {
    if (isMultiplayer) then {
        if (_isAdmin) then {
            {
                if (_x isEqualTo ((crew (vehicle _x)) select 0)) then {
                    0 = _au pushBack _x;
                };
            } count allUnits;
        } else {
            {
                if (((side _x) in _as) || {(captive _x)}) then {
                    if (isPlayer _x) then {
                        if (_di isEqualTo 2) then {
                            if ((_x distance2D player) < (_QS_ST_X select 27)) then {
                                if (_x isEqualTo ((crew (vehicle _x)) select 0)) then {
                                    0 = _au pushBack _x;
                                };
                            };
                        } else {
                            if (_x isEqualTo ((crew (vehicle _x)) select 0)) then {
                                0 = _au pushBack _x;
                            };
                        };
                    };
                };
            } count (allPlayers + allUnitsUav);
        };
    } else {
        {
            if (((side _x) in _as) || {(captive _x)}) then {
                if (isPlayer _x) then {
                    if (_di isEqualTo 2) then {
                        if ((_x distance2D player) < (_QS_ST_X select 27)) then {
                            if (_x isEqualTo ((crew (vehicle _x)) select 0)) then {
                                0 = _au pushBack _x;
                            };
                        };
                    } else {
                        if (_x isEqualTo ((crew (vehicle _x)) select 0)) then {
                            0 = _au pushBack _x;
                        };
                    };
                };
            };
        } count (allPlayers + allUnitsUav);
    };
} else {
    {
        if (((side _x) in _as) || {(captive _x)}) then {
            if (_di isEqualTo 2) then {
                if ((_x distance2D player) < (_QS_ST_X select 27)) then {
                    if (_x isEqualTo ((crew (vehicle _x)) select 0)) then {
                        0 = _au pushBack _x;
                    };
                };
            } else {
                if (_x isEqualTo ((crew (vehicle _x)) select 0)) then {
                    0 = _au pushBack _x;
                };
            };
        };
    } count allUnits;
};
if ((_di isEqualTo 1) && (_QS_ST_X select 75)) exitWith {
    _auv = [];
    {
        if (!((vehicle _x) isKindOf 'Man')) then {
            0 = _auv pushBack _x;
        };
    } count _au;
    if ((_QS_ST_X select 80)) then {
        {
            if (!(_x in _auv)) then {
                if (_x getVariable ['QS_ST_drawEmptyVehicle',FALSE]) then {
                    if ((crew _x) isEqualTo []) then {
                        0 = _auv pushBack _x;
                    };
                };
            };
        } count vehicles;
    };
    if ((_QS_ST_X select 65)) then {
        {
            0 = _auv pushBack _x;
        } count (units (group player));
    };
    _auv;
};
if ((_di isEqualTo 1) && (_QS_ST_X select 80)) exitWith {
    {
        if (!(_x in _au)) then {
            if (_x getVariable ['QS_ST_drawEmptyVehicle',FALSE]) then {
                if ((crew _x) isEqualTo []) then {
                    0 = _au pushBack _x;
                };
            };
        };
    } count vehicles;
    _au;
};

_au;
