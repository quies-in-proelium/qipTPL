#include "script_component.hpp"

private _map = _this select 0;
private _shadow = QS_ST_iconShadowMap;
private _textSize = QS_ST_iconTextSize_Map;
private _textFont = QS_ST_iconTextFont;
private _textOffset = QS_ST_iconTextOffset;
private _delay = QS_ST_iconUpdatePulseDelay;
private _player = player;
private _mapScale = ctrlMapScale _map;
private _vehicle = objNull;
private _position = [[0,0,0],0];
private _iconSize = 0;

if (QS_ST_MAPrequireGPSItem && (!(call FUNC(hasGPSDevice)))) exitWith {};

if (diag_tickTime > (missionNamespace getVariable 'QS_ST_updateDraw_map')) then {
    missionNamespace setVariable ['QS_ST_updateDraw_map',(diag_tickTime + 3),FALSE];
    missionNamespace setVariable ['QS_ST_drawArray_map',([1] call FUNC(iconUnits)),FALSE];
};

if (!((missionNamespace getVariable 'QS_ST_drawArray_map') isEqualTo [])) then {
    {
        if (!isNull _x) then {
            _vehicle = vehicle _x;
            if (alive _vehicle) then {
                _position = [_vehicle,1,_delay] call FUNC(iconPosDir);
                _iconSize = [_vehicle,1] call FUNC(iconSize);
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
                        _textFont,
                        _textOffset
                    ];
                };
                _map drawIcon [
                    ([_vehicle,1] call FUNC(iconType)),
                    ([_vehicle,1,_mapScale] call FUNC(iconColor)),
                    (_position select 0),
                    _iconSize,
                    _iconSize,
                    (_position select 1),
                    ([_vehicle,1,_mapScale] call FUNC(iconText)),
                    _shadow,
                    _textSize,
                    _textFont,
                    _textOffset
                ];
            };
        };
    } count (missionNamespace getVariable ['QS_ST_drawArray_map',[]]);
};
if (_player isEqualTo (leader (group _player))) then {
    if (!((groupSelectedUnits _player) isEqualTo [])) then {
        {
            _map drawLine [(getPosASLVisual _player),(getPosASLVisual (vehicle _x)),[0,1,1,0.5]];
        } count (groupSelectedUnits _player);
    };
} else {
    if (isNull (objectParent _player)) then {
        if (isNull (objectParent (leader (group _player)))) then {
            if (((leader (group _player)) distance2D _player) < QS_ST_GPSDist) then {
                _map drawLine [(getPosASLVisual _player),(getPosASLVisual (leader (group _player))),[0,1,1,0.5]];
            };
        };
    };
};
if (_delay > 0) then {
    if (diag_tickTime > (missionNamespace getVariable 'QS_ST_iconUpdatePulseTimer')) then {
        missionNamespace setVariable ['QS_ST_iconUpdatePulseTimer',(diag_tickTime + _delay)];
    };
};
