#include "script_component.hpp"

params ['_unit','_med'];

if ((lifeState _unit) isEqualTo 'INCAPACITATED') exitWith {TRUE};

private _return = FALSE;

switch (true) do {
    case (_med isEqualTo 'BTC'): {
        if (!isNil {_unit getVariable 'BTC_need_revive'}) then {
            if ((_unit getVariable 'BTC_need_revive') isEqualTo 1) then {
                _return = TRUE;
            };
        };
    };
    case (_med isEqualTo 'FAR'): {
        if (!isNil {_unit getVariable 'FAR_isUnconscious'}) then {
            if ((_unit getVariable 'FAR_isUnconscious') isEqualTo 1) then {
                _return = TRUE;
            };
        };
    };
    case (_med isEqualTo 'AIS'): {
        if (!isNil {_unit getVariable 'unit_is_unconscious'}) then {
            if ((_unit getVariable 'unit_is_unconscious')) then {
                _return = TRUE;
            };
        };
    };
    case (_med isEqualTo 'AWS'): {
        if (!isNil {_unit getVariable 'tcb_ais_agony'}) then {
            if ((_unit getVariable 'tcb_ais_agony')) then {
                _return = TRUE;
            };
        };
    };
    case (_med isEqualTo 'ACE'): {
        if (!isNil {_unit getVariable 'ACE_isUnconscious'}) then {
            if ((_unit getVariable 'ACE_isUnconscious')) then {
                _return = TRUE;
            };
        };
    };
};

_return;