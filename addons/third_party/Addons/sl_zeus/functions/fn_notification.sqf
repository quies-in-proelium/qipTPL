#include "macros.hpp"
/*
* SL_Zeus - fn_notification
*
* Author: PhilipJFry
*
* Description:
* Print a massage.
*
* Parameter(s):
* 0: Status <STRING>
*
* Return Value:
* None <ANY>
*/

params [
    ["_status", "", [""]]
];

private _message = switch (_status) do {
    case "whitelistedCurator": {"SL Zeus: You are a curator!"};
    case "missionCuratorAdmin": {"SL Zeus: You are whitelisted but you are already a mission curator, probably a admin curator!"};
    case "missionCurator": {"SL Zeus: Getrennt (You are whitelisted but you are already a mission curator!)"};
    case "virtual": {"SL Zeus: Getrennt (You are a virtual curator!)"};
    case "checkRole": {"SL Zeus: Verbunden (There are mission curators, checking your role!)"};
    case "connected": {"SL Zeus: Verbunden"};
};

systemChat _message;

nil
