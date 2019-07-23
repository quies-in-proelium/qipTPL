#include "script_component.hpp"

if (
    (!('MinimapDisplay' in ((infoPanel 'left') + (infoPanel 'right')))) ||
    {(visibleMap)} ||
    {((QS_ST_GPSrequireGPSItem) && (!(call FUNC(hasGPSDevice))))}
) exitWith {};
_m = _this select 0;
_QS_ST_X = [] call (missionNamespace getVariable 'QS_ST_X');
if (diag_tickTime > (missionNamespace getVariable 'QS_ST_updateDraw_gps')) then {
    missionNamespace setVariable ['QS_ST_updateDraw_gps',(diag_tickTime + 3),FALSE];
    missionNamespace setVariable ['QS_ST_drawArray_gps',([2,_QS_ST_X] call (_QS_ST_X select 46)),FALSE];
};
if (!((missionNamespace getVariable 'QS_ST_drawArray_gps') isEqualTo [])) then {
    _shadow = QS_ST_iconShadowGPS;
    _textSize = QS_ST_iconTextSize_GPS;
    _textFont = QS_ST_iconTextFont;
    _textOffset = QS_ST_iconTextOffset;
    _delay = QS_ST_iconUpdatePulseDelay;
    private _vehicle = objNull;
    private _po = [[0,0,0],0];
    private _is = 0;
    {
        if (!isNull _x) then {
            _vehicle = vehicle _x;
            if (alive _vehicle) then {
                _po = [_vehicle,2,_delay] call (_QS_ST_X select 44);
                _is = [_vehicle,2,_QS_ST_X] call (_QS_ST_X select 43);
                _m drawIcon [
                    ([_vehicle,2,_QS_ST_X] call (_QS_ST_X select 42)),
                    ([_vehicle,2,_QS_ST_X] call (_QS_ST_X select 41)),
                    (_po select 0),
                    _is,
                    _is,
                    (_po select 1),
                    ([_vehicle,2,_QS_ST_X] call (_QS_ST_X select 45)),
                    _shadow,
                    _textSize,
                    _textFont,
                    _textOffset
                ];
            };
        };
    } count (missionNamespace getVariable ['QS_ST_drawArray_gps',[]]);
};
if (player isEqualTo (leader (group player))) then {
    if (!((groupSelectedUnits player) isEqualTo [])) then {
        {
            _m drawLine [(getPosASLVisual player),(getPosASLVisual (vehicle _x)),[0,1,1,0.5]];
        } count (groupSelectedUnits player);
    };
} else {
    if (isNull (objectParent player)) then {
        if (isNull (objectParent (leader (group player)))) then {
            if (((leader (group player)) distance2D player) < (QS_ST_GPSDist)) then {
                _m drawLine [(getPosASLVisual player),(getPosASLVisual (leader (group player))),[0,1,1,0.5]];
            };
        };
    };
};
