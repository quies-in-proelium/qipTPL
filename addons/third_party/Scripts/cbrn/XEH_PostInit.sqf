#include "script_component.hpp"

if (hasInterface) then {
    [
        { !isNull qipTPL_unit },
        {
            call cbrn_fnc_init;
        }
    ] call CBA_fnc_waitUntilAndExecute;
};

[
    "CBRN",
    "Decon & Heal",
    {
        params ["","_object"];
        if (isPlayer _object) then {
            _object setVariable ["cbrn_stoppedAutoDamage", true];
            _object setVariable ["cbrn_damage", 0];
            ["ace_medical_treatment_fullHealLocal", _object, _object] call CBA_fnc_targetEvent;
            ["ace_medical_status_fnc_setCardiacArrestState", [_object,false], _object] call CBA_fnc_targetEvent;
            ["ace_medical_status_fnc_setUnconsciousState", [_object,false], _object] call CBA_fnc_targetEvent;
        };
    }
] call zen_custom_modules_fnc_register;

[
    "CBRN",
    "Decon",
    {
        params ["","_object"];
        if (isPlayer _object) then {
            _object setVariable ["cbrn_stoppedAutoDamage", true];
            _object setVariable ["cbrn_damage", 0];
        };
    }
] call zen_custom_modules_fnc_register;
