#include "script_component.hpp"

params ['_u','_med'];

if ((lifeState _u) isEqualTo 'INCAPACITATED') exitWith {TRUE};

private _r = FALSE;

switch (true) do {
    case (_med isEqualTo 'BTC'): {
        if (!isNil {_u getVariable 'BTC_need_revive'}) then {
            if ((_u getVariable 'BTC_need_revive') isEqualTo 1) then {
                _r = TRUE;
            };
        };
    };
    case (_med isEqualTo 'FAR'): {
        if (!isNil {_u getVariable 'FAR_isUnconscious'}) then {
            if ((_u getVariable 'FAR_isUnconscious') isEqualTo 1) then {
                _r = TRUE;
            };
        };
    };
    case (_med isEqualTo 'AIS'): {
        if (!isNil {_u getVariable 'unit_is_unconscious'}) then {
            if ((_u getVariable 'unit_is_unconscious')) then {
                _r = TRUE;
            };
        };
    };
    case (_med isEqualTo 'AWS'): {
        if (!isNil {_u getVariable 'tcb_ais_agony'}) then {
            if ((_u getVariable 'tcb_ais_agony')) then {
                _r = TRUE;
            };
        };
    };
    case (_med isEqualTo 'ACE'): {
        if (!isNil {_u getVariable 'ACE_isUnconscious'}) then {
            if ((_u getVariable 'ACE_isUnconscious')) then {
                _r = TRUE;
            };
        };
    };
};

_r;
