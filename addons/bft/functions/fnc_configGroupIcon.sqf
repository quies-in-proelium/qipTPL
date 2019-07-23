#include "script_component.hpp"

params ['_grp','_type','_QS_ST_X'];

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
    _grpIconType = [_grp,_grpSize,_grpLeader_vehicle,_grpSide] call (_QS_ST_X select 52);
    _grp setVariable ['QS_ST_Group',1,FALSE];
    _iconID = _grp addGroupIcon [_grpIconType,(_QS_ST_X select 38)];
    _grp setGroupIcon [_iconID,_grpIconType];
    _grpIconColor = [_grpLeader,_QS_ST_X] call (_QS_ST_X select 77);
    _text = [_grp,_QS_ST_X,1] call (_QS_ST_X select 51);
    _scale = (_QS_ST_X select 37);
    _visibility = TRUE;
    _grp setGroupIconParams [_grpIconColor,_text,_scale,_visibility];
    _grp setVariable ['QS_ST_Group_Icon',[_iconID,_grpIconType,_grpLeader_vType,_grpIconColor,_text,_scale,_visibility],FALSE];
};
if (_type isEqualTo 1) then {
    private _update = FALSE;
    private _updateIcon = FALSE;
    private _updateParams = FALSE;
    _iconDetail = _grp getVariable 'QS_ST_Group_Icon';
    _iconDetail params ['_iconID','_grpIconType','_grpLeaderType','','_text','_scale','_visibility'];
    if (!(_grpLeaderType isEqualTo (typeOf _grpLeader_vehicle))) then {
        _update = TRUE;
        _updateIcon = TRUE;
    };
    if (!(_text isEqualTo ([_grp,_QS_ST_X,1] call (_QS_ST_X select 51)))) then {
        _update = TRUE;
        _updateParams = TRUE;
    };
    if (_update) then {
        _grpIconColor = [_grpLeader_vehicle,_QS_ST_X] call (_QS_ST_X select 77);
        if (_updateIcon) then {
            _grpIconType = [_grp,_grpSize,_grpLeader_vehicle,_grpSide] call (_QS_ST_X select 52);
            _grp setGroupIcon [_iconID,_grpIconType];
        };
        if (_updateParams) then {
            _text = [_grp,_QS_ST_X,1] call (_QS_ST_X select 51);
            _grp setGroupIconParams [_grpIconColor,_text,_scale,_visibility];
        };
        _grp setVariable ['QS_ST_Group_Icon',[_iconID,_grpIconType,_grpLeader_vType,_grpIconColor,_text,_scale,_visibility],FALSE];
    };
};
if (_type isEqualTo 2) then {
    _grpIconArray = _grp getVariable 'QS_ST_Group_Icon';
    _grpID = _grpIconArray select 0;
    clearGroupIcons _grp;
    _grp setVariable ['QS_ST_Group_Icon',nil,FALSE];
    _grp setVariable ['QS_ST_Group',nil,FALSE];
};

true;
