#include "script_component.hpp"

params["_map"];

private _player = player;
private _mapScale = ctrlMapScale _map;
private _vehicle = objNull;
private _position = [[0,0,0],0];
private _iconSize = 0;

if (GVAR(requireGPSItemMap) && (!(call FUNC(hasGPSDevice)))) exitWith {};

if (diag_tickTime > (missionNamespace getVariable QGVAR(updateDrawMap))) then {
    missionNamespace setVariable [QGVAR(updateDrawMap),(diag_tickTime + 3),FALSE];
    missionNamespace setVariable [QGVAR(drawArrayMap),([1] call FUNC(iconUnits)),FALSE];
};

if (!((missionNamespace getVariable QGVAR(drawArrayMap)) isEqualTo [])) then {
    {
        if (!isNull _x) then {
            _vehicle = vehicle _x;
            if (alive _vehicle) then {
                _position = [_vehicle,1,GVAR(iconUpdatePulseDelay)] call FUNC(iconPosDir);
                _iconSize = _vehicle call FUNC(iconSize);
                if (_vehicle isEqualTo (vehicle _player)) then {
                    _map drawIcon [
                        'a3\ui_f\data\igui\cfg\islandmap\iconplayer_ca.paa',
                        [1,0,0,0.75],
                        (_position select 0),
                        24,
                        24,
                        (_position select 1),
                        '',
                        0,
                        0.03,
                        GVAR(iconTextFont),
                        GVAR(iconTextOffset)
                    ];
                };
                _map drawIcon [
                    (_vehicle call FUNC(iconType)),
                    ([_vehicle,1,_mapScale] call FUNC(iconColor)),
                    (_position select 0),
                    _iconSize,
                    _iconSize,
                    (_position select 1),
                    ([_vehicle,1,_mapScale] call FUNC(iconText)),
                    GVAR(iconShadowMap),
                    GVAR(iconTextSizeMap),
                    GVAR(iconTextFont),
                    GVAR(iconTextOffset)
                ];
            };
        };
    } forEach (missionNamespace getVariable [QGVAR(drawArrayMap),[]]);
};
if (_player isEqualTo (leader (group _player))) then {
    if (!((groupSelectedUnits _player) isEqualTo [])) then {
        {
            _map drawLine [(getPosASLVisual _player),(getPosASLVisual (vehicle _x)),[0,1,1,0.5]];
        } forEach (groupSelectedUnits _player);
    };
} else {
    if (isNull (objectParent _player)) then {
        if (isNull (objectParent (leader (group _player)))) then {
            if (((leader (group _player)) distance2D _player) < GVAR(GPSDist)) then {
                _map drawLine [(getPosASLVisual _player),(getPosASLVisual (leader (group _player))),[0,1,1,0.5]];
            };
        };
    };
};
if (GVAR(iconUpdatePulseDelay) > 0) then {
    if (diag_tickTime > (missionNamespace getVariable QGVAR(iconUpdatePulseTimer))) then {
        missionNamespace setVariable [QGVAR(iconUpdatePulseTimer),(diag_tickTime + GVAR(iconUpdatePulseDelay))];
    };
};
