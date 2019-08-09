#include "script_component.hpp"

GVAR(playerFaction) = playerSide;
switch GVAR(playerFaction) do {
    case east: {GVAR(showFriendlySides) = GVAR(friendlySides_EAST)};
    case west: {GVAR(showFriendlySides) = GVAR(friendlySides_WEST)};
    case resistance: {GVAR(showFriendlySides) = GVAR(friendlySides_RESISTANCE)};
    case civilian: {GVAR(showFriendlySides) = GVAR(friendlySides_CIVILIAN)};
    default {GVAR(showFriendlySides) = []};
};

if (GVAR(iconUpdatePulseDelay) > 0) then {
    missionNamespace setVariable [QGVAR(iconUpdatePulseTimer),diag_tickTime];
};

GVAR(groupUpdateDelay) = diag_tickTime + 5;
GVAR(checkDiplomacy) = diag_tickTime + 10;

missionNamespace setVariable [QGVAR(updateDrawMap),(diag_tickTime + 2),FALSE];
missionNamespace setVariable [QGVAR(updateDrawGPS),(diag_tickTime + 1),FALSE];
missionNamespace setVariable [QGVAR(drawArrayMap),[],FALSE];
missionNamespace setVariable [QGVAR(drawArrayGPS),[],FALSE];

if (GVAR(enableUnitIconsMap) && GVAR(iconMapClickShowDetail)) then {
    player setVariable [QGVAR(mapVehicleShowCrew),objNull,FALSE];
    player setVariable [QGVAR(mapSingleClick),FALSE,FALSE];
    addMissionEventHandler ['MapSingleClick',FUNC(mapSingleClick)];
    addMissionEventHandler [
        'Map',
        {
            params ['_mapIsOpened'];
            if (!(_mapIsOpened) && (alive (player getVariable [QGVAR(mapVehicleShowCrew),objNull]))) then {
                player setVariable [QGVAR(mapSingleClick),FALSE,FALSE];
                (player getVariable [QGVAR(mapVehicleShowCrew),objNull]) setVariable [QGVAR(mapClickShowCrew),FALSE,FALSE];
                player setVariable [QGVAR(mapVehicleShowCrew),objNull,FALSE];
            };
        }
    ];
};

if (GVAR(enableGroupIcons)) then {
    if (!(GVAR(enableUnitIconsMap)) || (GVAR(showGroupOnly) && !(GVAR(showOwnGroup)))) then {
        GVAR(groupIconOffset) = [0,0];
    };

    setGroupIconsVisible [GVAR(showGroupMapIcons),GVAR(showGroupHudIcons)];

    switch GVAR(groupIconsInteraction) do {
        case "hover": {
            setGroupIconsSelectable true;
            addMissionEventHandler ['GroupIconOverEnter',FUNC(groupIconDetails)];
            addMissionEventHandler ['GroupIconOverLeave',FUNC(clearHint)];
        };
        case "click": {
            setGroupIconsSelectable true;
            addMissionEventHandler ['GroupIconClick',FUNC(groupIconDetails)];
            addMissionEventHandler ['GroupIconOverLeave',FUNC(clearHint)];
        };
        case "disabled": {setGroupIconsSelectable false};
    };

    [FUNC(groupIcons)] call CBA_fnc_addPerFrameHandler;
};
