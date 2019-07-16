#include "macros.hpp"
/*
* SL_Zeus - fn_initWatchDog
*
* Author: PhilipJFry
*
* Description:
* Initializes the assigning of the player
*
* Parameter(s):
* 0: None <ANY>
*
* Return Value:
* None <ANY>
*/

waitUntil {!isNull findDisplay 46};

sleep 1;

if (player isKindOf "VirtualCurator_F") exitWith {["virtual"] call FUNC(notification)};

if (GVAR(missionCurator)) then {
    ["checkRole"] call FUNC(notification);

    private _time = time + 10;

    waitUntil {!isNull (getAssignedCuratorLogic player) || _time < time};

    GVAR(serverEvent) = [player, clientOwner, serverCommandAvailable "#kick", !isNull (getAssignedCuratorLogic player)];
    publicVariableServer QGVAR(serverEvent);
} else {
    ["connected"] call FUNC(notification);

    sleep 5;

    GVAR(serverEvent) = [player, clientOwner, serverCommandAvailable "#kick"];
    publicVariableServer QGVAR(serverEvent);
};

nil
