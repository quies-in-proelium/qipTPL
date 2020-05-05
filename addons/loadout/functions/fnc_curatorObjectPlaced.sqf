#include "script_component.hpp"

params [["_curatorModule", objNull]];

if (isNull _curatorModule || {!local _curatorModule}) exitWith {};

_curatorModule addEventHandler ["CuratorObjectPlaced", {
    params ["", "_entity"];

    if (_entity isKindOf "Man") then {
        [_entity] call FUNC(applyLoadout);
    };
}];
