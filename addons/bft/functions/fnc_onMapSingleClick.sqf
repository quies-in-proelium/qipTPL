#include "script_component.hpp"

params ['_units','_position','_alt','_shift'];

if ((!(_alt)) && (!(_shift))) then {
    if (player getVariable 'QS_ST_mapSingleClick') then {
        player setVariable ['QS_ST_mapSingleClick',FALSE,FALSE];
        if (alive (player getVariable ['QS_ST_map_vehicleShowCrew',objNull])) then {
            (player getVariable ['QS_ST_map_vehicleShowCrew',objNull]) setVariable ['QS_ST_mapClickShowCrew',FALSE,FALSE];
        };
    };
    comment "player setVariable ['QS_ST_map_vehicleShowCrew',objNull,FALSE];";
    player setVariable ['QS_ST_mapSingleClick',TRUE,FALSE];
    private _vehicle = objNull;
    _vehicles = (nearestObjects [_position,['Air','LandVehicle','Ship'],250,TRUE]) select {(alive _x)};
    if ((count _vehicles) > 0) then {
        if ((count _vehicles) > 1) then {
            private _dist = 999999;
            {
                if ((_x distance2D _position) < _dist) then {
                    _dist = _x distance2D _position;
                    _vehicle = _x;
                };
            } forEach _vehicles;
        } else {
            _vehicle = _vehicles select 0;
        };
    };
    _QS_ST_X = [] call (missionNamespace getVariable 'QS_ST_X');
    if (alive _vehicle) then {
        if ((count (crew _vehicle)) > 1) then {
            if ((side (effectiveCommander _vehicle)) isEqualTo playerSide) then {
                if (!(_vehicle isEqualTo (player getVariable ['QS_ST_map_vehicleShowCrew',objNull]))) then {
                    player setVariable ['QS_ST_map_vehicleShowCrew',_vehicle,FALSE];
                    _vehicle setVariable ['QS_ST_mapClickShowCrew',TRUE,FALSE];
                } else {
                    (player getVariable ['QS_ST_map_vehicleShowCrew',objNull]) setVariable ['QS_ST_mapClickShowCrew',FALSE,FALSE];
                    player setVariable ['QS_ST_map_vehicleShowCrew',objNull,FALSE];
                    player setVariable ['QS_ST_mapSingleClick',FALSE,FALSE];
                };
            } else {
                (player getVariable ['QS_ST_map_vehicleShowCrew',objNull]) setVariable ['QS_ST_mapClickShowCrew',FALSE,FALSE];
                player setVariable ['QS_ST_map_vehicleShowCrew',objNull,FALSE];
                player setVariable ['QS_ST_mapSingleClick',FALSE,FALSE];
            };
        } else {
            (player getVariable ['QS_ST_map_vehicleShowCrew',objNull]) setVariable ['QS_ST_mapClickShowCrew',FALSE,FALSE];
            player setVariable ['QS_ST_map_vehicleShowCrew',objNull,FALSE];
            player setVariable ['QS_ST_mapSingleClick',FALSE,FALSE];
        };
    } else {
        (player getVariable ['QS_ST_map_vehicleShowCrew',objNull]) setVariable ['QS_ST_mapClickShowCrew',FALSE,FALSE];
        player setVariable ['QS_ST_map_vehicleShowCrew',objNull,FALSE];
        player setVariable ['QS_ST_mapSingleClick',FALSE,FALSE];
    };
};
if (_shift) then {
    if (player isEqualTo (leader (group player))) then {
        private _nearUnit = objNull;
        _nearUnits = (nearestObjects [_position,['CAManBase'],250,TRUE]) select {((alive _x) && ((group _x) isEqualTo (group player)) && (isNull (objectParent _x)))};
        if ((count _nearUnits) > 0) then {
            if ((count _nearUnits) > 1) then {
                private _dist = 999999;
                {
                    if ((_x distance2D _position) < _dist) then {
                        _dist = _x distance2D _position;
                        _nearUnit = _x;
                    };
                } forEach _nearUnits;
            } else {
                _nearUnit = _nearUnits select 0;
            };
        };
        if (alive _nearUnit) then {
            player groupSelectUnit [_nearUnit,(!(_nearUnit in _units))];
        };
    };
};
