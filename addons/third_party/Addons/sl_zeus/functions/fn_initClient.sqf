#include "macros.hpp"
/*
* SL_Zeus - fn_initClient
*
* Author: PhilipJFry
*
* Description:
* Initializes SL Zeus on the Client
*
* Parameter(s):
* 0: Mission Curators <BOOLN>
* 1: Share Objects <BOOLN>
*
* Return Value:
* None <ANY>
*/

GVAR(missionCurator) = param [0, true, [false]];
GVAR(sharedObjects) = param [1, false, [false]];

QGVAR(clientEvent) addPublicVariableEventHandler {
    (_this select 1) params [
        ["_status", "", [""]],
        ["_curatorObj", objNull, [objNull]],
        ["_countObjects", 0, [0]]
    ];

    [_status] call FUNC(notification);

    if (_status isEqualTo "whitelistedCurator") then {
        if (isNil QGVAR(respawnEHID)) then {
            GVAR(respawnEHID) = player addEventHandler [
                "Respawn", {
                    [] spawn {
                        sleep 1;

                        GVAR(serverEvent) = [player, clientOwner, serverCommandAvailable "#kick"];
                        publicVariableServer QGVAR(serverEvent);
                    };
                }
            ];
        };

        if (isNil QGVAR(zeusDEHopen) && _countObjects > 0) then {
            GVAR(zeusDEHopen) = (findDisplay 46) displayAddEventHandler [
                "KeyDown", {
                    if (inputAction "CuratorInterface" > 0) then {
                        GVAR(serverEvent) = [getAssignedCuratorLogic player];
                        publicVariableServer QGVAR(serverEvent);
                    };
                    false;
                }
            ];
        };

        if (isNil QGVAR(modCurator) && GVAR(sharedObjects)) then {
            GVAR(modCurator) = 1;

            GVAR(curatorEHOP) = _curatorObj addEventHandler [
                "CuratorObjectPlaced", {
                    GVAR(objectPlaced) = _this;
                    publicVariableServer QGVAR(objectPlaced);
                }
            ];
        };
    } else {
        if (!isNil QGVAR(zeusDEHopen)) then {
            (findDisplay 46) displayRemoveEventHandler ["KeyDown", GVAR(zeusDEHopen)];
            GVAR(zeusDEHopen) = nil;
        };

        if (!isNil QGVAR(respawnEHID)) then {
            player removeEventHandler ["Respawn", GVAR(respawnEHID)];
            GVAR(respawnEHID) = nil;
        };

        if (_status isEqualTo "missionCuratorAdmin") then {
            [] spawn {
                waitUntil {!serverCommandAvailable "#kick"};

                ["checkRole"] call FUNC(notification);

                sleep 5;

                GVAR(serverEvent) = [player, clientOwner, serverCommandAvailable "#kick"];
                publicVariableServer QGVAR(serverEvent);
            };
        };
    };
};

[] spawn FUNC(initWatchDog);

nil
