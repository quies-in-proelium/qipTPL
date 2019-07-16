#include "macros.hpp"
/*
* SL_Zeus - fn_initPost
*
* Author: PhilipJFry
*
* Description:
* Initializes SL Zeus on the Server
*
* Parameter(s):
* 0: None <ANY>
*
* Return Value:
* None <ANY>
*/

if (isServer) then {
    if (!GVAR(initZeus)) exitWith {
        GVAR(initZeus) = nil;
        NOTIFICATION_LOG(Terminated!)
    };

    GVAR(initZeus) = nil;

    publicVariable QFUNC(initClient);
    publicVariable QFUNC(notification);
    publicVariable QFUNC(initWatchDog);

    GVAR(missionCurator) = false;

    if ((count GVAR(modCurators)) isEqualTo (count allCurators)) then {
        NOTIFICATION_LOG(Only SL Zeus curator modules in this mission!)
    } else {
        GVAR(missionCurator) = true;
        NOTIFICATION_FORMAT_LOG(There are %1 more curator modules in this mission as expected!, (count allCurators) - (count GVAR(modCurators)))
    };

    if (GVAR(addAllAddons)) then {
        private _cfgPatches = configFile >> "CfgPatches";
        private _addons = [];

        for "_i" from 0 to (count _cfgPatches - 1) do {
            private _class = _cfgPatches select _i;

            if (isClass _class) then {_addons pushBack (configName _class)};
        };

        {
            _x addCuratorAddons _addons;
            nil
        } count GVAR(modCurators);

        NOTIFICATION_LOG(All addons are loaded!)
    };

    GVAR(playerConnected) = addMissionEventHandler [
        "PlayerConnected", {
            params ["_id", "_uid", "_name", "_jip", "_owner"];

            if (_name isEqualTo "__SERVER__") exitWith {NOTIFICATION_LOG(SERVER EXCLUDED)};

            if ((_uid) in GVAR(whitelist)) then {
                NOTIFICATION_FORMAT_LOG(%1 connected and is in whitelist, _name)

                [GVAR(missionCurator), GVAR(sharedObjects)] remoteExecCall [QFUNC(initClient), _owner];
            };
        }
    ];

    GVAR(playerDisconnected) = addMissionEventHandler [
        "PlayerDisconnected", {
            params ["_id", "_uid", "_name", "_jip", "_owner"];

            if (_name isEqualTo "__SERVER__") exitWith {NOTIFICATION_LOG(SERVER EXCLUDED)};

            if (_uid in GVAR(whitelist)) then {
                NOTIFICATION_FORMAT_LOG(%1 disconnected and is in whitelist, _name)

                private _curatorObj = [_uid] call FUNC(getCuratorObj);
                unassignCurator _curatorObj;
             };
        }
    ];

    QGVAR(serverEvent) addPublicVariableEventHandler {
        if (count (_this select 1) > 1) then {
            (_this select 1) call FUNC(assignCurator);
        } else {
            (_this select 1) call FUNC(addObjs);
        };
    };

    if (GVAR(sharedObjects)) then {
        QGVAR(objectPlaced) addPublicVariableEventHandler {
            (_this select 1) call FUNC(addObjs);
        };
    };
} else {WARNING_LOG(It is a serverside mod, SL_Zeus terminated!)};

nil
