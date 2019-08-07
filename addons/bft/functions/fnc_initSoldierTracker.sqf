#include "script_component.hpp"

private _side = playerSide;
private _sides = [EAST,WEST,RESISTANCE,CIVILIAN];
uiSleep 0.1;
QS_ST_faction = _sides find _side;
switch QS_ST_faction do {
    case east: {GVAR(showFriendlySides) = GVAR(friendlySides_EAST)};
    case west: {GVAR(showFriendlySides) = GVAR(friendlySides_WEST)};
    case resistance: {GVAR(showFriendlySides) = GVAR(friendlySides_RESISTANCE)};
    case civilian: {GVAR(showFriendlySides) = GVAR(friendlySides_CIVILIAN)};
    default {GVAR(showFriendlySides) = []};
};
QS_ST_autonomousVehicles = [];
if (!(GVAR(iconShadowMap) in [0,1,2])) then {
    GVAR(iconShadowMap) = 1;
};
if (!(GVAR(iconShadowGPS) in [0,1,2])) then {
    GVAR(iconShadowGPS) = 1;
};
if (GVAR(iconUpdatePulseDelay) > 0) then {
    missionNamespace setVariable ['QS_ST_iconUpdatePulseTimer',diag_tickTime];
};

if (GVAR(enableGroupIcons)) then {
    if (!(GVAR(enableUnitIconsMap))) then {
        GVAR(groupIconOffset) = [0,0];
    };
};
QS_ST_groupIconText = FALSE;
QS_ST_htmlColorMedical = [GVAR(medicalIconColor) select 0,GVAR(medicalIconColor) select 1,GVAR(medicalIconColor) select 2,GVAR(medicalIconColor) select 3] call (missionNamespace getVariable 'BIS_fnc_colorRGBtoHTML');
QS_ST_htmlColorInjured = [GVAR(colorInjured) select 0,GVAR(colorInjured) select 1,GVAR(colorInjured) select 2,GVAR(colorInjured) select 3] call (missionNamespace getVariable 'BIS_fnc_colorRGBtoHTML');

{
    missionNamespace setVariable _x;
} forEach [
    ['QS_ST_updateDraw_map',(diag_tickTime + 2),FALSE],
    ['QS_ST_updateDraw_gps',(diag_tickTime + 1),FALSE],
    ['QS_ST_drawArray_map',[],FALSE],
    ['QS_ST_drawArray_gps',[],FALSE]
];
waitUntil {
    uiSleep 0.1;
    !(isNull (findDisplay 12));
};
if (GVAR(enableUnitIconsMap)) then {
    ((findDisplay 12) displayCtrl 51) ctrlAddEventHandler ['Draw',(format ['_this call %1',FUNC(iconDrawMap)])];
    if (GVAR(otherDisplays)) then {
        [] spawn FUNC(additionalDevices);
    };
    if (GVAR(iconMapClickShowDetail)) then {
        player setVariable ['QS_ST_map_vehicleShowCrew',objNull,FALSE];
        player setVariable ['QS_ST_mapSingleClick',FALSE,FALSE];
        {
            addMissionEventHandler _x;
        } forEach [
            ['MapSingleClick',FUNC(onMapSingleClick)],
            [
                'Map',
                {
                    params ['_mapIsOpened'];
                    if (!(_mapIsOpened)) then {
                        if (alive (player getVariable ['QS_ST_map_vehicleShowCrew',objNull])) then {
                            player setVariable ['QS_ST_mapSingleClick',FALSE,FALSE];
                            (player getVariable ['QS_ST_map_vehicleShowCrew',objNull]) setVariable ['QS_ST_mapClickShowCrew',FALSE,FALSE];
                            player setVariable ['QS_ST_map_vehicleShowCrew',objNull,FALSE];
                        };
                    };
                }
            ]
        ];
    };
};

if (GVAR(enableUnitIconsGPS)) then {
    [] spawn FUNC(gpsIcons);
};
if (GVAR(enableUnitIconsGPS)) then {
    setGroupIconsVisible [GVAR(showGroupMapIcons),GVAR(showGroupHudIcons)];
    setGroupIconsSelectable GVAR(groupInteractiveIcons);
    if (GVAR(groupInteractiveIcons)) then {
        {
            addMissionEventHandler _x;
        } forEach [
            ['GroupIconClick',FUNC(onGroupIconClick)],
            ['GroupIconOverEnter',FUNC(onGroupIconOverEnter)],
            ['GroupIconOverLeave',FUNC(onGroupIconOverLeave)]
        ];
    };
    [] spawn FUNC(groupIcons);
};
