#include "script_component.hpp"

if (isNil QEGVAR(common,qipTPL_enabled) || !(EGVAR(common,qipTPL_enabled))) exitWith {};

if !(hasInterface) exitWith {};

call FUNC(arsenal_postInit);

qipTPL_unit setVariable [QGVAR(preventProne),false,true];

[{
    if (
        (stance qipTPL_unit) == "PRONE" &&
        {qipTPL_unit getvariable [QGVAR(preventProne),false]} &&
        {!(qipTPL_unit getVariable ["ACE_isUnconscious", false]) || lifeState qipTPL_unit != "INCAPACITATED"}
       ) then {
        qipTPL_unit playAction "PlayerCrouch";
        hint localize "str_qipTPL_boc_crouch";
    };
},1] call CBA_fnc_addPerFrameHandler;
