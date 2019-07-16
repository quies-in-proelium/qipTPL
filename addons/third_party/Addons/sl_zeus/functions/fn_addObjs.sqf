#include "macros.hpp"
/*
* SL_Zeus - fn_addObjs
*
* Author: PhilipJFry
*
* Description:
* Add Objects to Curator
*
* Parameter(s):
* 0: Curator object <OBJECT>
* 1: Objects placed by curator <OBJECT>
*
* Return Value:
* None <ANY>
*/

private _success = params [
    ["_curator", objNull, [objNull]],
    ["_placedObj", objNull, [objNull, grpNull]]
];

CHECK_TRUE(_success, fn_addObjs: params default value used)

if (_placedObj isEqualTo objNull) then {
    {
        if (_x isEqualType {}) then {
            _curator addCuratorEditableObjects [call _x, false];
        };

        if (_x isEqualType []) then {
            _curator addCuratorEditableObjects [_x, false];
        };

        nil
    } count GVAR(objects);
} else {
    {
        _x addCuratorEditableObjects [[_placedObj], true];
        nil
    } count (GVAR(modCurators) - [_curator]);
};

nil
