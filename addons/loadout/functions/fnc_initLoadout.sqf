#include "script_component.hpp"

params ["_entity"];
private ["_savedGear"];

if (isNil QEGVAR(common,qipTPL_enabled) || !(EGVAR(common,qipTPL_enabled))) exitWith {};
if (!local _entity) exitWith {};

if (hasInterface) then {
    _savedGear = _entity call FUNC(checkSavedGear);
    if !(_savedGear == "") then {
        diag_log format ["Found previous gear for this entity (%1)", _entity];
        [_entity,_savedGear] call FUNC(restoreGear);
    } else {
        [_entity] call FUNC(applyLoadout);
    };
};
