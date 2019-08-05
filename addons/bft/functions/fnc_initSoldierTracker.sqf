#include "script_component.hpp"

private _side = playerSide;
private _sides = [EAST,WEST,RESISTANCE,CIVILIAN];
uiSleep 0.1;
QS_ST_faction = _sides find _side;
switch _side do {
    case "EAST": {QS_ST_showFriendlySides = QS_ST_friendlySides_EAST};
    case "WEST": {QS_ST_showFriendlySides = QS_ST_friendlySides_WEST};
    case "RESISTANCE": {QS_ST_showFriendlySides = QS_ST_friendlySides_RESISTANCE};
    case "CIVILIAN": {QS_ST_showFriendlySides = QS_ST_friendlySides_CIVILIAN};
};
QS_ST_autonomousVehicles = [];
if (!(QS_ST_iconShadowMap in [0,1,2])) then {
    QS_ST_iconShadowMap = 1;
};
if (!(QS_ST_iconShadowGPS in [0,1,2])) then {
    QS_ST_iconShadowGPS = 1;
};
if (QS_ST_iconUpdatePulseDelay > 0) then {
    missionNamespace setVariable ['QS_ST_iconUpdatePulseTimer',diag_tickTime];
};

if (QS_ST_enableGroupIcons) then {
    if (!(QS_ST_map_enableUnitIcons)) then {
        QS_ST_groupIconOffset = [0,0];
    };
};
QS_ST_groupIconText = FALSE;
QS_ST_htmlColorMedical = [QS_ST_MedicalIconColor select 0,QS_ST_MedicalIconColor select 1,QS_ST_MedicalIconColor select 2,QS_ST_MedicalIconColor select 3] call (missionNamespace getVariable 'BIS_fnc_colorRGBtoHTML');
QS_ST_htmlColorInjured = [QS_ST_colorInjured select 0,QS_ST_colorInjured select 1,QS_ST_colorInjured select 2,QS_ST_colorInjured select 3] call (missionNamespace getVariable 'BIS_fnc_colorRGBtoHTML');

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
    !(isNull (findDisplay 12))
};
if (QS_ST_map_enableUnitIcons) then {
    ((findDisplay 12) displayCtrl 51) ctrlAddEventHandler ['Draw',(format ['_this call %1',FUNC(iconDrawMap)])];
    if (QS_ST_otherDisplays) then {
        [] spawn FUNC(additionalDevices);
    };
    if (QS_ST_iconMapClickShowDetail) then {
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

if (QS_ST_gps_enableUnitIcons) then {
    [] spawn FUNC(gpsIcons);
};
if (QS_ST_gps_enableUnitIcons) then {
    setGroupIconsVisible [QS_ST_showGroupMapIcons,QS_ST_showGroupHudIcons];
    setGroupIconsSelectable QS_ST_groupInteractiveIcons;
    if (QS_ST_groupInteractiveIcons) then {
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
