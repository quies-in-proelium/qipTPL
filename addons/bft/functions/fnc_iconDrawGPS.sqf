#include "script_component.hpp"

if (
    (!('MinimapDisplay' in ((infoPanel 'left') + (infoPanel 'right')))) ||
    {(visibleMap)} ||
    {(GVAR(requireGPSItemGPS) && (!(call FUNC(hasGPSDevice))))}
) exitWith {};

params["_map"];

if (diag_tickTime > (missionNamespace getVariable QGVAR(updateDrawGPS))) then {
    missionNamespace setVariable [QGVAR(updateDrawGPS),(diag_tickTime + 3),FALSE];
    missionNamespace setVariable [QGVAR(drawArrayGPS),([2] call FUNC(iconUnits)),FALSE];
};
if (!((missionNamespace getVariable QGVAR(drawArrayGPS)) isEqualTo [])) then {
    private _vehicle = objNull;
    private _position = [[0,0,0],0];
    private _iconSize = 0;
    {
        if (!isNull _x) then {
            _vehicle = vehicle _x;
            if (alive _vehicle) then {
                _position = [_vehicle,2,GVAR(iconUpdatePulseDelay)] call FUNC(iconPosDir);
                _iconSize = _vehicle call FUNC(iconSize);
                _map drawIcon [
                    (_vehicle call FUNC(iconType)),
                    ([_vehicle,2] call FUNC(iconColor)),
                    (_position select 0),
                    _iconSize,
                    _iconSize,
                    (_position select 1),
                    ([_vehicle,2] call FUNC(iconText)),
                    GVAR(iconShadowGPS),
                    GVAR(iconTextSizeGPS),
                    GVAR(iconTextFont),
                    GVAR(iconTextOffset)
                ];
            };
        };
    } forEach (missionNamespace getVariable [QGVAR(drawArrayGPS),[]]);
};
if (player isEqualTo (leader (group player))) then {
    if (!((groupSelectedUnits player) isEqualTo [])) then {
        {
            _map drawLine [(getPosASLVisual player),(getPosASLVisual (vehicle _x)),[0,1,1,0.5]];
        } forEach (groupSelectedUnits player);
    };
} else {
    if (isNull (objectParent player)) then {
        if (isNull (objectParent (leader (group player)))) then {
            if (((leader (group player)) distance2D player) < GVAR(GPSDist)) then {
                _map drawLine [(getPosASLVisual player),(getPosASLVisual (leader (group player))),[0,1,1,0.5]];
            };
        };
    };
};
