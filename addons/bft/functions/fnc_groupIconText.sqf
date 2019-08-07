#include "script_component.hpp"

params ['_group','_di'];

private _groupIconText = '';
if (_di isEqualTo 1) then {
    if (GVAR(showGroupMapText)) then {
        _groupIconText = groupId _group;
    };
};

_groupIconText;
