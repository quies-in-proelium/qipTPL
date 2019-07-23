#include "script_component.hpp"

params [['_vehicle',objNull],['_ds',1],['_mapScale',1]];

private _unit = effectiveCommander _vehicle;
private _side = side (group _unit);
private _exit = FALSE;
private _color = QS_ST_iconColor_UNKNOWN;
private _a = 0;
if (!(_vehicle isKindOf 'Man')) then {
    if (_vehicle getVariable ['QS_ST_drawEmptyVehicle',FALSE]) then {
        if ((count (crew _vehicle)) isEqualTo 0) then {
            _exit = TRUE;
            _color = QS_ST_iconColor_empty;
            _color set [3,0.65];
            if (_mapScale > 0.80) then {
                if (_ds isEqualTo 1) then {
                    _color set [3,0];
                };
            };
        };
    };
};
if (_exit) exitWith {_color;};
private _useTeamColor = FALSE;
if ((group _unit) isEqualTo (group player)) then {
    _useTeamColor = TRUE;
    _a = 0.85;
} else {
    _a = 0.65;
};
if (_QS_ST_X select 14) then {
    if ([_unit,((_QS_ST_X select 15) select 0)] call (_QS_ST_X select 69)) then {
        _exit = TRUE;
        _color = _QS_ST_X select 16;
        _color set [3,_a];
        if (_mapScale > 0.80) then {
            if (_ds isEqualTo 1) then {
                _color set [3,0];
            };
        };
    };
} else {
    if ([_unit,((_QS_ST_X select 15) select 0)] call (_QS_ST_X select 69)) then {
        _exit = TRUE;
        _color = _QS_ST_X select 16;
        _color set [3,0];
    };
};
if (_exit) exitWith {_color;};
if (_useTeamColor) then {
    if (isNull (objectParent _unit)) then {
        private _teamID = 0;
        if (!isNil {assignedTeam _unit}) then {
            _teamID = ['MAIN','RED','GREEN','BLUE','YELLOW'] find (assignedTeam _unit);
            if (_teamID isEqualTo -1) then {
                _teamID = 0;
            };
        };
        if (_side isEqualTo EAST) then {_color = _QS_ST_X select 9;};
        if (_side isEqualTo WEST) then {_color = _QS_ST_X select 10;};
        if (_side isEqualTo RESISTANCE) then {_color = _QS_ST_X select 11;};
        if (_side isEqualTo CIVILIAN) then {_color = _QS_ST_X select 12;};
        _color = [_color,[1,0,0,1],[0,1,0.5,1],[0,0.5,1,1],[1,1,0,1]] select _teamID;
        _color set [3,_a];
        if (_mapScale > 0.80) then {
            if (_ds isEqualTo 1) then {
                _color set [3,0];
            };
        };
        _exit = TRUE;
    };
};
if (_exit) exitWith {_color;};
if (_side isEqualTo EAST) exitWith {_color = _QS_ST_X select 9; _color set [3,_a];if (_ds isEqualTo 1) then {if (_mapScale > 0.80) then {_color set [3,0];};};_color;};
if (_side isEqualTo WEST) exitWith {_color = _QS_ST_X select 10;_color set [3,_a];if (_ds isEqualTo 1) then {if (_mapScale > 0.80) then {_color set [3,0];};};_color;};
if (_side isEqualTo RESISTANCE) exitWith {_color = _QS_ST_X select 11;_color set [3,_a];if (_ds isEqualTo 1) then {if (_mapScale > 0.80) then {_color set [3,0];};};_color;};
if (_side isEqualTo CIVILIAN) exitWith {_color = _QS_ST_X select 12;_color set [3,_a];if (_ds isEqualTo 1) then {if (_mapScale > 0.80) then {_color set [3,0];};};_color;};
_color = _QS_ST_X select 13;
if (_ds isEqualTo 1) then { if (_mapScale > 0.80) then {_color set [3,0];};};

_color;
