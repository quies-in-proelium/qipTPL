#include "macros.hpp"
/*
* SL_Zeus - fn_assignCurator
*
* Author: PhilipJFry
*
* Description:
* Assign the player to the respective curator
*
* Parameter(s):
* 0: Player Object <OBJECT>
* 1: Client ID <SCALAR>
* 2: Admin Status <BOOLN>
* 3: Player Is Curator <BOOLN>
*
* Return Value:
* None <ANY>
*/

params [
    ["_playerObj", objNull, [objNull]],
    ["_clientID", 0, [0]],
    ["_adminStatus", false, [false]],
    ["_playerIsCurator", false, [true]]
];

private _curatorObj = getAssignedCuratorLogic _playerObj;

if (!isNull _curatorObj || _playerIsCurator) then {
    if (_adminStatus) then {
        GVAR(clientEvent) = ["missionCuratorAdmin"];
        _clientID publicVariableClient QGVAR(clientEvent);
    } else {
        GVAR(clientEvent) = ["missionCurator"];
        _clientID publicVariableClient QGVAR(clientEvent);
    };
} else {
    _curatorObj = [getplayerUID _playerObj] call FUNC(getCuratorObj);

    if (!isNull (getAssignedCuratorUnit _curatorObj)) then {
        unassignCurator _curatorObj;
    };

    [_playerObj, _curatorObj, _clientID] spawn {
        sleep 5;

        params ["_playerObj", "_curatorObj", "_clientID"];

        _playerObj assignCurator _curatorObj;

        GVAR(clientEvent) = ["whitelistedCurator", _curatorObj, count GVAR(objects)];
        _clientID publicVariableClient QGVAR(clientEvent);
    };
};

nil
