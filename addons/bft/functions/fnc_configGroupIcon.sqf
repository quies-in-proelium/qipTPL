#include "script_component.hpp"

params ['_grp','_type'];

private _scale = 0;
private _text = '';
private _visibility = TRUE;
private _grpIconColor = [0,0,0,0];
private _iconID = -1;
private _grpIconType = 'c_unknown';
private _grpLeader = leader _grp;
private _grpLeader_vehicle = vehicle _grpLeader;
private _grpLeader_vType = typeOf _grpLeader_vehicle;
private _grpSize = count (units _grp);
private _grpSide = side _grpLeader;

if (_type isEqualTo 0) then {
    _grpIconType = [_grp,_grpSize,_grpLeader_vehicle,_grpSide] call FUNC(groupIconType);
    _grp setVariable [QGVAR(group),1,FALSE];
    _iconID = _grp addGroupIcon [_grpIconType,GVAR(groupIconOffset)];
    _grp setGroupIcon [_iconID,_grpIconType];
    _grpIconColor = [_grpLeader] call FUNC(iconColorGroup);
    _text = [_grp,1] call FUNC(groupIconText);
    _scale = GVAR(groupIconScale);
    _visibility = TRUE;
    _grp setGroupIconParams [_grpIconColor,_text,_scale,_visibility];
    _grp setVariable [QGVAR(groupIcon),[_iconID,_grpIconType,_grpLeader_vType,_grpIconColor,_text,_scale,_visibility],FALSE];
};
if (_type isEqualTo 1) then {
    private _update = FALSE;
    private _updateIcon = FALSE;
    private _updateParams = FALSE;
    private _iconDetail = _grp getVariable QGVAR(groupIcon);
    _iconDetail params ['_iconID','_grpIconType','_grpLeaderType','','_text','_scale','_visibility'];
    if (!(_grpLeaderType isEqualTo (typeOf _grpLeader_vehicle))) then {
        _update = TRUE;
        _updateIcon = TRUE;
    };
    if (!(_text isEqualTo ([_grp,1] call FUNC(groupIconText)))) then {
        _update = TRUE;
        _updateParams = TRUE;
    };
    if (_update) then {
        _grpIconColor = [_grpLeader_vehicle] call FUNC(iconColorGroup);
        if (_updateIcon) then {
            _grpIconType = [_grp,_grpSize,_grpLeader_vehicle,_grpSide] call FUNC(groupIconType);
            _grp setGroupIcon [_iconID,_grpIconType];
        };
        if (_updateParams) then {
            _text = [_grp,1] call FUNC(groupIconText);
            _grp setGroupIconParams [_grpIconColor,_text,_scale,_visibility];
        };
        _grp setVariable [QGVAR(groupIcon),[_iconID,_grpIconType,_grpLeader_vType,_grpIconColor,_text,_scale,_visibility],FALSE];
    };
};
if (_type isEqualTo 2) then {
    clearGroupIcons _grp;
    _grp setVariable [QGVAR(groupIcon),nil,FALSE];
    _grp setVariable [QGVAR(group),nil,FALSE];
};

true;
