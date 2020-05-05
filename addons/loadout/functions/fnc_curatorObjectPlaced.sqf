#include "script_component.hpp"

if (hasInterface) then {
    {
        _x addEventHandler ["CuratorObjectPlaced", {
            params ["", "_entity"];

            if (_entity isKindOf "Man") then {
                [_entity] call FUNC(applyLoadout);
            };
        }];
     } forEach allCurators;
};
