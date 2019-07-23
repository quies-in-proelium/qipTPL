#include "script_component.hpp"

params ['_group','_QS_ST_X','_di'];

private _groupIconText = '';
if (_di isEqualTo 1) then {
    if (_QS_ST_X select 36) then {
        _groupIconText = groupId _group;
    };
};

_groupIconText;
