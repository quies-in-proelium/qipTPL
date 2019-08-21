#include "script_component.hpp"
/*
 * Author: NemesisRE
 * Get the lifestate of the given unit depending on the medicalsystem that is used.
 *
 * Arguments:
 * 0: Unit <Object>
 *
 * Return Value:
 * Lifestate <STRING>
 *
 * Example:
 * ["UNIT"] call qipTPL_bft_fnc_getUnitLifeState
 *
 * Public: No
 */

params ["_unit"];

private _lifestate = "HEALTHY";

switch (GVAR(medicalSystem)) do {
    case "BIS": {
        switch (lifeState _unit) do {
            case "HEALTHY": {_lifestate = "HEALTHY";};
            case "INCAPACITATED": {_lifestate = "INCAPACITATED";};
            case "INJURED": {_lifestate = "INJURED";};
            case "DEAD";
            case "DEAD-RESPAWN";
            case "DEAD-SWITCHING": {_lifestate = "UNKNOWN";};
        };
    };
    case "BTC": {
        if ((!isNil {_unit getVariable "BTC_need_revive"}) && ((_unit getVariable "BTC_need_revive") isEqualTo 1)) exitWith {"INCAPACITATED"};
    };
    case "FAR": {
        if ((!isNil {_unit getVariable "FAR_isUnconscious"}) && ((_unit getVariable "FAR_isUnconscious") isEqualTo 1)) exitWith {"INCAPACITATED"};
    };
    case "AIS": {
        if ((!isNil {_unit getVariable "unit_is_unconscious"}) && ((_unit getVariable "unit_is_unconscious"))) exitWith {"INCAPACITATED"};
    };
    case "AWS": {
        if ((!isNil {_unit getVariable "tcb_ais_agony"}) && ((_unit getVariable "tcb_ais_agony"))) exitWith {"INCAPACITATED"};
    };
    case "ACE": {
        if ([_unit] call ace_medical_status_fnc_isInStableCondition) exitWith {"INJURED"};
        if ((!isNil {_unit getVariable "ACE_isUnconscious"}) && ((_unit getVariable "ACE_isUnconscious"))) exitWith {"INCAPACITATED"};
        // Used with ace medical rewrite
        //_unitState = [_unit, ace_medical_STATE_MACHINE] call CBA_statemachine_fnc_getCurrentState;
        //switch (_unitState) do {
        //    case "Default": {_lifestate = "HEALTHY";};
        //    case "Unconscious": {_lifestate = "INCAPACITATED";};
        //    case "CardiacArrest";
        //    case "Injured": {_lifestate = "INJURED";};
        //};
    };
};

_lifestate
