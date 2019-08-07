#include "script_component.hpp"

private _side = playerSide;
private _sides = [EAST,WEST,RESISTANCE,CIVILIAN];
GVAR(playerFaction) = _sides find _side;
switch GVAR(playerFaction) do {
    case east: {GVAR(showFriendlySides) = GVAR(friendlySides_EAST)};
    case west: {GVAR(showFriendlySides) = GVAR(friendlySides_WEST)};
    case resistance: {GVAR(showFriendlySides) = GVAR(friendlySides_RESISTANCE)};
    case civilian: {GVAR(showFriendlySides) = GVAR(friendlySides_CIVILIAN)};
    default {GVAR(showFriendlySides) = []};
};

if (!(GVAR(iconShadowMap) in [0,1,2])) then {
    GVAR(iconShadowMap) = 1;
};
if (!(GVAR(iconShadowGPS) in [0,1,2])) then {
    GVAR(iconShadowGPS) = 1;
};
if (GVAR(iconUpdatePulseDelay) > 0) then {
    missionNamespace setVariable [QGVAR(iconUpdatePulseTimer),diag_tickTime];
};

if (GVAR(enableGroupIcons)) then {
    if (!(GVAR(enableUnitIconsMap))) then {
        GVAR(groupIconOffset) = [0,0];
    };
};

{
    missionNamespace setVariable _x;
} forEach [
    [QGVAR(updateDrawMap),(diag_tickTime + 2),FALSE],
    [QGVAR(updateDrawGPS),(diag_tickTime + 1),FALSE],
    [QGVAR(drawArrayMap),[],FALSE],
    [QGVAR(drawArrayGPS),[],FALSE]
];

if (GVAR(enableUnitIconsMap) && GVAR(iconMapClickShowDetail)) then {
    player setVariable [QGVAR(mapVehicleShowCrew),objNull,FALSE];
    player setVariable [QGVAR(mapSingleClick),FALSE,FALSE];
    {
        addMissionEventHandler _x;
    } forEach [
        ['MapSingleClick',FUNC(onMapSingleClick)],
        [
            'Map',
            {
                params ['_mapIsOpened'];
                if (!(_mapIsOpened)) then {
                    if (alive (player getVariable [QGVAR(mapVehicleShowCrew),objNull])) then {
                        player setVariable [QGVAR(mapSingleClick),FALSE,FALSE];
                        (player getVariable [QGVAR(mapVehicleShowCrew),objNull]) setVariable [QGVAR(mapClickShowCrew),FALSE,FALSE];
                        player setVariable [QGVAR(mapVehicleShowCrew),objNull,FALSE];
                    };
                };
            }
        ]
    ];
};

if (GVAR(enableGroupIcons)) then {
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
