#include "script_component.hpp"

params ['_di'];

private _exit = FALSE;
private _sides = [EAST,WEST,RESISTANCE,CIVILIAN];
private _as = [];
private _au = [];
private _isAdmin = (((call BIS_fnc_admin) isEqualTo 2) && GVAR(adminMode));

if (!(playerSide isEqualTo CIVILIAN)) then {
    if (!(GVAR(showCivilianIcons))) then {
        _sides = [EAST,WEST,RESISTANCE];
    };
};
if ((GVAR(showAll)) > 0) exitWith {
    if ((GVAR(showAll)) isEqualTo 1) then {
        _au = allUnits + vehicles;
    };
    if ((GVAR(showAll)) isEqualTo 2) then {
        _au = entities [[],[],TRUE,TRUE];
    };
    _au;
};
if (((_di isEqualTo 1) && GVAR(showCivilianIcons)) && {(!(GVAR(showOnlyVehicles)))}) then {
    _exit = TRUE;
    _au = units (group player);
    if (GVAR(showEmptyVehicles)) then {
        {
            if (!(_x in _au)) then {
                if (_x getVariable [QGVAR(drawEmptyVehicle),FALSE]) then {
                    if ((crew _x) isEqualTo []) then {
                        _au pushBack _x;
                    };
                };
            };
        } forEach vehicles;
    };
    _au;
};
if ((_di isEqualTo 2) && GVAR(GPSshowGroupOnly)) then {
    _exit = TRUE;
    _au = units (group player);
    _au;
};
if (_exit) exitWith {_au;};
if (GVAR(showFactionOnly)) then {
    _as pushBack GVAR(playerFaction);
} else {
    if (isMultiplayer) then {
        if (_isAdmin) then {
            {
                _as pushBack _x;
            } forEach _sides;
        } else {
            if (GVAR(friendlySidesDynamic)) then {
                _as pushBack GVAR(playerFaction);
                {
                    if ((GVAR(playerFaction) getFriend _x) > 0.6) then {
                        _as pushBack _x;
                    };
                } forEach _sides;
            } else {
                _as pushBack GVAR(playerFaction);
                {
                    _as pushBack (_sides select _x);
                } forEach GVAR(showFriendlySides);
            };
        };
    } else {
        if (GVAR(friendlySidesDynamic)) then {
            _as pushBack GVAR(playerFaction);
            {
                if ((GVAR(playerFaction) getFriend _x) > 0.6) then {
                    _as pushBack _x;
                };
            } forEach _sides;
        } else {
            _as pushBack GVAR(playerFaction);
            {
                _as pushBack _x;
            } forEach GVAR(showFriendlySides);
        };
    };
};
if (!(GVAR(showAI))) then {
    if (isMultiplayer) then {
        if (_isAdmin) then {
            {
                if (_x isEqualTo ((crew (vehicle _x)) select 0)) then {
                    _au pushBack _x;
                };
            } forEach allUnits;
        } else {
            {
                if (((side _x) in _as) || {(captive _x)}) then {
                    if (isPlayer _x) then {
                        if (_di isEqualTo 2) then {
                            if ((_x distance2D player) < GVAR(GPSDist)) then {
                                if (_x isEqualTo ((crew (vehicle _x)) select 0)) then {
                                    _au pushBack _x;
                                };
                            };
                        } else {
                            if (_x isEqualTo ((crew (vehicle _x)) select 0)) then {
                                _au pushBack _x;
                            };
                        };
                    };
                };
            } forEach (allPlayers + allUnitsUav);
        };
    } else {
        {
            if (((side _x) in _as) || {(captive _x)}) then {
                if (isPlayer _x) then {
                    if (_di isEqualTo 2) then {
                        if ((_x distance2D player) < GVAR(GPSDist)) then {
                            if (_x isEqualTo ((crew (vehicle _x)) select 0)) then {
                                _au pushBack _x;
                            };
                        };
                    } else {
                        if (_x isEqualTo ((crew (vehicle _x)) select 0)) then {
                            _au pushBack _x;
                        };
                    };
                };
            };
        } forEach (allPlayers + allUnitsUav);
    };
} else {
    {
        if (((side _x) in _as) || {(captive _x)}) then {
            if (_di isEqualTo 2) then {
                if ((_x distance2D player) < GVAR(GPSDist)) then {
                    if (_x isEqualTo ((crew (vehicle _x)) select 0)) then {
                        _au pushBack _x;
                    };
                };
            } else {
                if (_x isEqualTo ((crew (vehicle _x)) select 0)) then {
                    _au pushBack _x;
                };
            };
        };
    } forEach allUnits;
};
if ((_di isEqualTo 1) && GVAR(showOnlyVehicles)) exitWith {
    private _auv = [];
    {
        if (!((vehicle _x) isKindOf 'Man')) then {
            _auv pushBack _x;
        };
    } forEach _au;
    if (GVAR(showEmptyVehicles)) then {
        {
            if (!(_x in _auv)) then {
                if (_x getVariable [QGVAR(drawEmptyVehicle),FALSE]) then {
                    if ((crew _x) isEqualTo []) then {
                        _auv pushBack _x;
                    };
                };
            };
        } forEach vehicles;
    };
    if (GVAR(showGroupOnly)) then {
        {
            _auv pushBack _x;
        } forEach (units (group player));
    };
    _auv;
};
if ((_di isEqualTo 1) && GVAR(showEmptyVehicles)) exitWith {
    {
        if (!(_x in _au)) then {
            if (_x getVariable [QGVAR(drawEmptyVehicle),FALSE]) then {
                if ((crew _x) isEqualTo []) then {
                    _au pushBack _x;
                };
            };
        };
    } foreach vehicles;
    _au;
};

_au;
