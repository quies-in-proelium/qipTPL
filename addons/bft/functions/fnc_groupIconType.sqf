#include "script_component.hpp"

params ['_grp','_grpSize','_grpVehicle','_grpSide'];

private _grpVehicleType = typeOf _grpVehicle;
private _vehicleClass = _grpVehicle getVariable ['QS_ST_groupVehicleClass',''];

if (_vehicleClass isEqualTo '') then {
    _vehicleClass = getText (configFile >> 'CfgVehicles' >> _grpVehicleType >> 'vehicleClass');
    _grpVehicle setVariable ['QS_ST_groupVehicleClass',_vehicleClass];
};

private _groupIconType = _grpVehicle getVariable ['QS_ST_groupVehicleIconType',''];

if (!(_groupIconType isEqualTo '')) exitWith {_groupIconType;};

private _iconTypes_EAST = ['o_inf','o_motor_inf','o_mech_inf','o_armor','o_recon','o_air','o_plane','o_uav','o_med','o_art','o_mortar','o_hq','o_support','o_maint','o_service','o_naval','o_unknown'];
private _iconTypes_WEST = ['b_inf','b_motor_inf','b_mech_inf','b_armor','b_recon','b_air','b_plane','b_uav','b_med','b_art','b_mortar','b_hq','b_support','b_maint','b_service','b_naval','b_unknown'];
private _iconTypes_RESISTANCE = ['n_inf','n_motor_inf','n_mech_inf','n_armor','n_recon','n_air','n_plane','n_uav','n_med','n_art','n_mortar','n_hq','n_support','n_maint','n_service','n_naval','n_unknown'];
private _iconTypes_CIVILIAN = ['c_air','c_car','c_plane','c_ship','c_unknown'];
private _iconTypes = [];

if (_grpSide isEqualTo EAST) then {
    _iconTypes = _iconTypes_EAST;
};
if (_grpSide isEqualTo WEST) then {
    _iconTypes = _iconTypes_WEST;
};
if (_grpSide isEqualTo RESISTANCE) then {
    _iconTypes = _iconTypes_RESISTANCE;
};
if (_grpSide isEqualTo CIVILIAN) exitWith {
    _iconTypes = _iconTypes_CIVILIAN;
    if (_grpVehicle isKindOf 'Helicopter') then {
        _groupIconType = _iconTypes select 0;
    };
    if (_grpVehicle isKindOf 'LandVehicle') then {
        _groupIconType = _iconTypes select 1;
    };
    if (_grpVehicle isKindOf 'Plane') then {
        _groupIconType = _iconTypes select 2;
    };
    if (_grpVehicle isKindOf 'Ship') then {
        _groupIconType = _iconTypes select 3;
    };
    if (_grpVehicle isKindOf 'Man') then {
        _groupIconType = _iconTypes select 4;
    };
    _grpVehicle setVariable ['QS_ST_groupVehicleIconType',_groupIconType,FALSE];
    _groupIconType;
};
if ((_vehicleClass isEqualTo 'Ship') || {(_vehicleClass isEqualTo 'Submarine')}) exitWith {
    _groupIconType = _iconTypes select 15;
    _groupIconType;
};
if (_vehicleClass in ['Men','MenRecon','MenSniper','MenDiver','MenSupport','MenUrban','MenStory']) exitWith {
    _groupIconType = _iconTypes select 0;
    if (_vehicleClass isEqualTo 'Men') then {
        _groupIconType = _iconTypes select 0;
    };
    if (_vehicleClass in ['MenRecon','MenSniper','MenDiver']) then {
        _groupIconType = _iconTypes select 4;
    };
    if (['medic',_grpVehicleType,FALSE] call (missionNamespace getVariable 'BIS_fnc_inString')) then {
        _groupIconType = _iconTypes select 8;
    };
    _grpVehicle setVariable ['QS_ST_groupVehicleIconType',_groupIconType,FALSE];
    _groupIconType;
};
if (_vehicleClass isEqualTo 'Static') exitWith {
    if (['mortar',_grpVehicleType,FALSE] call (missionNamespace getVariable 'BIS_fnc_inString')) then {
        _groupIconType = _iconTypes select 10;
    } else {
        _groupIconType = _iconTypes select 12;
    };
    _grpVehicle setVariable ['QS_ST_groupVehicleIconType',_groupIconType,FALSE];
    _groupIconType;
};
if (_vehicleClass isEqualTo 'Autonomous') exitWith {
    if (['UAV',_grpVehicleType,FALSE] call (missionNamespace getVariable 'BIS_fnc_inString')) then {
        _groupIconType = _iconTypes select 7;
    } else {
        if (['UGV',_grpVehicleType,FALSE] call (missionNamespace getVariable 'BIS_fnc_inString')) then {
            _groupIconType = _iconTypes select 12;
        };
    };
    _grpVehicle setVariable ['QS_ST_groupVehicleIconType',_groupIconType,FALSE];
    _groupIconType;
};
if (_vehicleClass isEqualTo 'Air') exitWith {
    if (_grpVehicle isKindOf 'Helicopter') then {
        _groupIconType = _iconTypes select 5;
    } else {
        _groupIconType = _iconTypes select 6;
    };
    _grpVehicle setVariable ['QS_ST_groupVehicleIconType',_groupIconType,FALSE];
    _groupIconType;
};
if (_vehicleClass isEqualTo 'Armored') exitWith {
    if (['apc',_grpVehicleType,FALSE] call (missionNamespace getVariable 'BIS_fnc_inString')) then {
        _groupIconType = _iconTypes select 2;
    } else {
        if ((['arty',_grpVehicleType,FALSE] call (missionNamespace getVariable 'BIS_fnc_inString')) || {(['mlrs',_grpVehicleType,FALSE] call (missionNamespace getVariable 'BIS_fnc_inString'))}) then {
            _groupIconType = _iconTypes select 9;
        } else {
            if (['mbt',_grpVehicleType,FALSE] call (missionNamespace getVariable 'BIS_fnc_inString')) then {
                _groupIconType = _iconTypes select 3;
            };
        };
    };
    _grpVehicle setVariable ['QS_ST_groupVehicleIconType',_groupIconType,FALSE];
    _groupIconType;
};
if (_vehicleClass isEqualTo 'Car') exitWith {
    _groupIconType = _iconTypes select 1;
    _grpVehicle setVariable ['QS_ST_groupVehicleIconType',_groupIconType,FALSE];
    _groupIconType;
};
if (_vehicleClass isEqualTo 'Support') exitWith {
    if (['medical',_grpVehicleType,FALSE] call (missionNamespace getVariable 'BIS_fnc_inString')) then {
        _groupIconType = _iconTypes select 8;
    } else {
        if ((['ammo',_grpVehicleType,FALSE] call (missionNamespace getVariable 'BIS_fnc_inString')) || {(['box',_grpVehicleType,FALSE] call (missionNamespace getVariable 'BIS_fnc_inString'))} || {(['fuel',_grpVehicleType,FALSE] call (missionNamespace getVariable 'BIS_fnc_inString'))} || {(['CRV',_grpVehicleType,FALSE] call (missionNamespace getVariable 'BIS_fnc_inString'))} || {(['repair',_grpVehicleType,FALSE] call (missionNamespace getVariable 'BIS_fnc_inString'))}) then {
            _groupIconType = _iconTypes select 14;
        };
    };
    _grpVehicle setVariable ['QS_ST_groupVehicleIconType',_groupIconType,FALSE];
    _groupIconType;
};
_groupIconType = _iconTypes select 16;
_grpVehicle setVariable ['QS_ST_groupVehicleIconType',_groupIconType,FALSE];
_groupIconType;
