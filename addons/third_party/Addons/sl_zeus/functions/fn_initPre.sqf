#include "macros.hpp"
/*
* SL_Zeus - fn_initPre
*
* Author: PhilipJFry
*
* Description:
* Creates curator modules
*
* Parameter(s):
* 0: None <ANY>
*
* Return Value:
* None <ANY>
*/

if (isServer) then {
    GVAR(initZeus) = false;

    if (!isFilePatchingEnabled) then {
        ERROR_LOG(FilePatching is not enabled! Can not load userconfig! SL Zeus terminated!)
    } else {
        [] call compile preprocessFileLineNumbers "\userconfig\slz\slz_settings.sqf";

        if (count GVAR(whiteList) isEqualTo 0) then {
            NOTIFICATION_FORMAT_LOG(%1 Curators created! Whitelist is empty, count GVAR(whiteList))
        } else {
            GVAR(initZeus) = true;
            GVAR(modCurators) = [];

            private _centerPosition = getArray (configfile >> "CfgWorlds" >> worldname >> "centerPosition");
            private _group = createGroup sideLogic;

            for "_i" from 1 to count GVAR(whiteList) do {
                private _gameMasterModule = _group createUnit ["ModuleCurator_F", _centerPosition, [], 0, "NONE"];
                _gameMasterModule setVariable [QGVAR(owner), (GVAR(whiteList) select (_i - 1))];
                GVAR(modCurators) pushBack _gameMasterModule;
            };

            NOTIFICATION_FORMAT_LOG(%1 Curator(s) created! , count GVAR(modCurators))
        };
    };
} else {WARNING_LOG(It is a serverside mod, SL_Zeus terminated!)};

nil
