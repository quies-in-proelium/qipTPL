#include "macros.hpp"
/*
* SL_Zeus - fn_getCuratorObj
*
* Author: PhilipJFry
*
* Description:
* Return Curator Object
*
* Parameter(s):
* 0: ID <STRING>
*
* Return Value:
* Curator Object <OBJECT>
*/

private _success = params [
    ["_id", "", [""]]
];

CHECK_TRUE(_success, fn_getVirtualUnit: params default value used)

private _curatorObj = {
    if ((_x getVariable [QGVAR(owner), ""]) isEqualTo _id) exitWith {_x};
} count GVAR(modCurators);

_curatorObj
