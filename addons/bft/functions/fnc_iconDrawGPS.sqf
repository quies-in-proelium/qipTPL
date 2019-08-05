#include "script_component.hpp"

if (
    (!('MinimapDisplay' in ((infoPanel 'left') + (infoPanel 'right')))) ||
    {(visibleMap)} ||
    {(QS_ST_GPSrequireGPSItem && (!(call FUNC(hasGPSDevice))))}
) exitWith {};
private _map = _this select 0;
if (diag_tickTime > (missionNamespace getVariable 'QS_ST_updateDraw_gps')) then {
    missionNamespace setVariable ['QS_ST_updateDraw_gps',(diag_tickTime + 3),FALSE];
    missionNamespace setVariable ['QS_ST_drawArray_gps',([2] call FUNC(iconUnits)),FALSE];
};
if (!((missionNamespace getVariable 'QS_ST_drawArray_gps') isEqualTo [])) then {
    private _vehicle = objNull;
    private _position = [[0,0,0],0];
    private _iconSize = 0;
    {
        if (!isNull _x) then {
            _vehicle = vehicle _x;
            if (alive _vehicle) then {
                _position = [_vehicle,2,QS_ST_iconUpdatePulseDelay] call FUNC(iconPosDir);
                _iconSize = [_vehicle,2] call FUNC(iconSize);
                _map drawIcon [
                    ([_vehicle,2] call FUNC(iconType)),
                    ([_vehicle,2] call FUNC(iconColor)),
                    (_position select 0),
                    _iconSize,
                    _iconSize,
                    (_position select 1),
                    ([_vehicle,2] call FUNC(iconText)),
                    QS_ST_iconShadowGPS,
                    QS_ST_iconTextSize_GPS,
                    QS_ST_iconTextFont,
                    QS_ST_iconTextOffset
                ];
            };
        };
    } count (missionNamespace getVariable ['QS_ST_drawArray_gps',[]]);
};
if (player isEqualTo (leader (group player))) then {
    if (!((groupSelectedUnits player) isEqualTo [])) then {
        {
            _map drawLine [(getPosASLVisual player),(getPosASLVisual (vehicle _x)),[0,1,1,0.5]];
        } count (groupSelectedUnits player);
    };
} else {
    if (isNull (objectParent player)) then {
        if (isNull (objectParent (leader (group player)))) then {
            if (((leader (group player)) distance2D player) < QS_ST_GPSDist) then {
                _map drawLine [(getPosASLVisual player),(getPosASLVisual (leader (group player))),[0,1,1,0.5]];
            };
        };
    };
};
