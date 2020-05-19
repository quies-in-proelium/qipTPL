#include "script_component.hpp"

if (isNil QEGVAR(common,qipTPL_enabled) || !(EGVAR(common,qipTPL_enabled))) exitWith {};

if !(hasInterface) exitWith {};

call FUNC(arsenal_postInit);

qipTPL_unit setVariable [QGVAR(preventCrouch),false,true];

[{
    if ((stance qipTPL_unit) == "PRONE" && {qipTPL_unit getvariable [QGVAR(preventCrouch),false]}) then {
        qipTPL_unit playAction "PlayerCrouch";
        hint localize "$str_qipTPL_boc_crouch";
    };
},1] call CBA_fnc_addPerFrameHandler;
