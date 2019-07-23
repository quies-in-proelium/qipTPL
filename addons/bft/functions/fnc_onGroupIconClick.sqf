#include "script_component.hpp"

params ['_is3D','_group','_wpID','_button','_posx','_posy','_shift','_ctrl','_alt'];

if (!((side _group) isEqualTo playerSide)) exitWith {
    hintSilent QS_ST_STR_text2;
    0 spawn {
        uiSleep 3;
        hintSilent '';
    };
};

private _QS_ST_X = [] call (missionNamespace getVariable 'QS_ST_X');
private _lifeState = '';
private _unitMOS = '';
private _unitName = '';
private _color = [0,0,0,1];
private _colorIncapacitated = [1,0.41,0,1];
private _colorInjured = [0,0,0,1];
private _colorDead = [0.4,0,0.5,0.65];
private _text = [_group,_QS_ST_X,1] call (_QS_ST_X select 51);
private _groupCount = count (units _group);
private _unitNameList = '';
private _leader = TRUE;
private _showClass = _QS_ST_X select 34;
private _AINames = _QS_ST_X select 72;

if ((_QS_ST_X select 14)) then {
    _colorIncapacitated = _QS_ST_X select 70;
    _colorInjured = _QS_ST_X select 81;
    _colorDead = [0.4,0,0.5,0.65];
} else {
    _colorIncapacitated = [1,0.41,0,1];
    _colorInjured = [0,0,0,1];
    _colorDead = [0.4,0,0.5,0.65];
};
{
    _color = [0,0,0,1];
    _lifeState = lifeState _x;
    if (_lifeState isEqualTo 'INJURED') then {
        _color = _colorInjured;
    } else {
        if (_lifeState isEqualTo 'INCAPACITATED') then {
            _color = _colorIncapacitated;
        } else {
            if (_lifeState isEqualTo 'DEAD') then {
                _color = _colorDead;
            };
        };
    };
    if ([_x,((_QS_ST_X select 15) select 0)] call (_QS_ST_X select 69)) then {_color = _colorIncapacitated;};
    _unitMOS = getText (configFile >> 'CfgVehicles' >> (typeOf _x) >> 'displayName');
    _unitName = name _x;
    if (!isPlayer _x) then {
        if (!(_AINames)) then {
            _unitName = '[AI]';
        };
    };
    if (_leader) then {
        _leader = FALSE;
        if (_showClass) then {
            _unitNameList = _unitNameList + format ["<t align='left'><t size='1.2'><t color='%2'>%1</t></t></t>",_unitName,_color] + format ["<t align='right'><t size='0.75'><t color='%2'>[%1]</t></t></t>",_unitMOS,_color] + '<br/>';
        } else {
            _unitNameList = _unitNameList + format ["<t align='left'><t size='1.2'><t color='%2'>%1</t></t></t>",_unitName,_color] + '<br/>';
        };
    } else {
        if (_showClass) then {
            _unitNameList = _unitNameList + format ["<t align='left'><t color='%2'>%1</t></t>",_unitName,_color] + format ["<t align='right'><t size='0.75'><t color='%2'>[%1]</t></t></t>",_unitMOS,_color] + '<br/>';
        } else {
            _unitNameList = _unitNameList + format ["<t align='left'><t color='%2'>%1</t></t>",_unitName,_color] + '<br/>';
        };
    };
} count (units _group);

hintSilent parseText format [
    "
        <t align='left'><t size='2'>%1</t></t><t align='right'>%2</t><br/><br/>
        %3
    ",
    _text,
    _groupCount,
    _unitNameList
];
