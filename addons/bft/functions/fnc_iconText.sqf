#include "script_component.hpp"

params ['_vehicle','_ds',['_mapScale',1]];

if ((_ds isEqualTo 2) || {(!(QS_ST_iconMapText))}) exitWith {};

private _showMOS = QS_ST_showMOS;
private _showAINames = QS_ST_AINames;
private _iconText = '';
private _n = 0;
private _vehicleType = missionNamespace getVariable [format ['QS_ST_iconVehicleDN#%1',(typeOf _vehicle)],''];
private _isAdmin = (((call (missionNamespace getVariable 'BIS_fnc_admin')) isEqualTo 2) && QS_ST_admin);

if (_vehicleType isEqualTo '') then {
    _vehicleType = getText (configFile >> 'CfgVehicles' >> (typeOf _vehicle) >> 'displayName');
    missionNamespace setVariable [format ['QS_ST_iconVehicleDN#%1',(typeOf _vehicle)],_vehicleType];
};
if (!(_showMOS)) then {
    _vehicleType = '';
};
private _vn = name ((crew _vehicle) select 0);
if (!isPlayer ((crew _vehicle) select 0)) then {
    if (!(_showAINames)) then {
        _vn = '[AI]';
    };
};

if (((_vehicle distance2D player) < QS_ST_showMOS_range) || {(_isAdmin)}) then {
    if ((_mapScale < 0.75) || {(_isAdmin)}) then {
        if ((_mapScale > 0.25) || {(_isAdmin)}) then {
            if (_showMOS) then {
                _iconText = format ['%1 [%2]',_vn,_vehicleType];
            } else {
                _iconText = format ['%1',_vn];
            };
        } else {
            if (_mapScale < 0.006) then {
                if (_showMOS) then {
                    _iconText = format ['%1 [%2]',_vn,_vehicleType];
                } else {
                    _iconText = format ['%1',_vn];
                };
            } else {
                _iconText = '';
            };
        };
    } else {
        _iconText = '';
    };
} else {
    if (_mapScale < 0.75) then {
        if (_mapScale > 0.25) then {
            _iconText = format ['%1',_vn];
        } else {
            if (_mapScale < 0.006) then {
                _iconText = format ['%1',_vn];
            } else {
                _iconText = '';
            };
        };
    } else {
        _iconText = '';
    };
};
if ((_vehicle isKindOf 'LandVehicle') || {(_vehicle isKindOf 'Air')} || {(_vehicle isKindOf 'Ship')}) then {
    _n = 0;
    _n = (count (crew _vehicle)) - 1;
    if (_n > 0) then {
        if (!isNil {_vehicle getVariable 'QS_ST_mapClickShowCrew'}) then {
            if (_vehicle getVariable 'QS_ST_mapClickShowCrew') then {
                _iconText = '';
                private _crewIndex = 0;
                private _na = '';
                private _crewCount = (count (crew _vehicle)) - 1;
                {
                    _na = name _x;
                    if (!(_showAINames)) then {
                        if (!isPlayer _x) then {
                            _na = '[AI]';
                        };
                    };
                    if (!(['error',_na,FALSE] call (missionNamespace getVariable 'BIS_fnc_inString'))) then {
                        if (!(_crewIndex isEqualTo _crewCount)) then {
                            _iconText = _iconText + _na + ', ';
                        } else {
                            _iconText = _iconText + _na;
                        };
                    };
                    _crewIndex = _crewIndex + 1;
                } forEach (crew _vehicle);
            } else {
                if (!isNull driver _vehicle) then {
                    if (_mapScale < 0.75) then {
                        if (_mapScale > 0.25) then {
                            if (_showMOS) then {
                                _iconText = format ['%1 [%2] +%3',_vn,_vehicleType,_n];
                            } else {
                                _iconText = format ['%1 +%2',_vn,_n];
                            };
                        } else {
                            if (_mapScale < 0.006) then {
                                if (_showMOS) then {
                                    _iconText = format ['%1 [%2] +%3',_vn,_vehicleType,_n];
                                } else {
                                    _iconText = format ['%1 +%2',_vn,_n];
                                };
                            } else {
                                _iconText = format ['+%1',_n];
                            };
                        };
                    } else {
                        _iconText = format ['+%1',_n];
                    };
                } else {
                    if (_mapScale < 0.75) then {
                        if (_mapScale > 0.25) then {
                            if (_showMOS) then {
                                _iconText = format ['[%1] %2 +%3',_vehicleType,_vn,_n];
                            } else {
                                _iconText = format ['%1 +%2',_vn,_n];
                            };
                        } else {
                            if (_mapScale < 0.006) then {
                                if (_showMOS) then {
                                    _iconText = format ['[%1] %2 +%3',_vehicleType,_vn,_n];
                                } else {
                                    _iconText = format ['%1 +%2',_vn,_n];
                                };
                            } else {
                                _iconText = format ['+%1',_n];
                            };
                        };
                    } else {
                        _iconText = format ['+%1',_n];
                    };
                };
            };
        } else {
            if (!isNull driver _vehicle) then {
                if (_mapScale < 0.75) then {
                    if (_mapScale > 0.25) then {
                        if (_showMOS) then {
                            _iconText = format ['%1 [%2] +%3',_vn,_vehicleType,_n];
                        } else {
                            _iconText = format ['%1 +%2',_vn,_n];
                        };
                    } else {
                        if (_mapScale < 0.006) then {
                            if (_showMOS) then {
                                _iconText = format ['%1 [%2] +%3',_vn,_vehicleType,_n];
                            } else {
                                _iconText = format ['%1 +%2',_vn,_n];
                            };
                        } else {
                            _iconText = format ['+%1',_n];
                        };
                    };
                } else {
                    _iconText = format ['+%1',_n];
                };
            } else {
                if (_mapScale < 0.75) then {
                    if (_mapScale > 0.25) then {
                        if (_showMOS) then {
                            _iconText = format ['[%1] %2 +%3',_vehicleType,_vn,_n];
                        } else {
                            _iconText = format ['%1 +%2',_vn,_n];
                        };
                    } else {
                        if (_mapScale < 0.006) then {
                            if (_showMOS) then {
                                _iconText = format ['[%1] %2 +%3',_vehicleType,_vn,_n];
                            } else {
                                _iconText = format ['%1 +%2',_vn,_n];
                            };
                        } else {
                            _iconText = format ['+%1',_n];
                        };
                    };
                } else {
                    _iconText = format ['+%1',_n];
                };
            };
        };
    } else {
        if (!isNull driver _vehicle) then {
            if (_mapScale < 0.75) then {
                if (_mapScale > 0.25) then {
                    if (_showMOS) then {
                        _iconText = format ['%1 [%2]',_vn,_vehicleType];
                    } else {
                        _iconText = format ['%1',_vn];
                    };
                } else {
                    if (_mapScale < 0.006) then {
                        if (_showMOS) then {
                            _iconText = format ['%1 [%2]',_vn,_vehicleType];
                        } else {
                            _iconText = format ['%1',_vn];
                        };
                    } else {
                        _iconText = '';
                    };
                };
            } else {
                _iconText = '';
            };
        } else {
            if (_mapScale < 0.75) then {
                if (_mapScale > 0.25) then {
                    if (_showMOS) then {
                        _iconText = format ['[%1] %2',_vehicleType,_vn];
                    } else {
                        _iconText = format ['%1',_vn];
                    };
                } else {
                    if (_mapScale < 0.006) then {
                        if (_showMOS) then {
                            _iconText = format ['[%1] %2',_vehicleType,_vn];
                        } else {
                            _iconText = format ['%1',_vn];
                        };
                    } else {
                        _iconText = '';
                    };
                };
            } else {
                _iconText = '';
            };
        };
    };
    if (unitIsUAV _vehicle) then {
        if (isUavConnected _vehicle) then {
            private _y = (UAVControl _vehicle) select 0;
            if (_mapScale < 0.75) then {
                if (_mapScale > 0.25) then {
                    if (_showMOS) then {
                        _iconText = format ['%1 [%2]',name _y,_vehicleType]; _iconText;
                    } else {
                        _iconText = format ['%1',name _y]; _iconText;
                    };
                } else {
                    if (_mapScale < 0.006) then {
                        if (_showMOS) then {
                            _iconText = format ['%1 [%2]',name _y,_vehicleType]; _iconText;
                        } else {
                            _iconText = format ['%1',name _y]; _iconText;
                        };
                    } else {
                        _iconText = '';
                    };
                };
            } else {
                _iconText = '';
            };
        } else {
            if (_mapScale < 0.75) then {
                if (_mapScale > 0.25) then {
                    if (_showMOS) then {
                        _iconText = format ['[AUTO] [%1]',_vehicleType]; _iconText;
                    } else {
                        _iconText = '[AUTO]'; _iconText;
                    };
                } else {
                    if (_mapScale < 0.006) then {
                        if (_showMOS) then {
                            _iconText = format ['[AUTO] [%1]',_vehicleType]; _iconText;
                        } else {
                            _iconText = '[AUTO]'; _iconText;
                        };
                    } else {
                        _iconText = '';
                    };
                };
            } else {
                _iconText = '';
            };
        };
    };
};

_iconText;
