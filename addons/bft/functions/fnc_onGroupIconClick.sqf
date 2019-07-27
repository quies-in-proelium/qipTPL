#include "script_component.hpp"

params ['_is3D','_group','_wpID','_button','_posx','_posy','_shift','_ctrl','_alt'];

if (!((side _group) isEqualTo playerSide)) exitWith {
    hintSilent QS_ST_STR_text2;
    0 spawn {
        uiSleep 3;
        hintSilent '';
    };
};

private _lifeState = '';
private _unitMOS = '';
private _unitName = '';
private _color = [0,0,0,1];
private _colorIncapacitated = [1,0.41,0,1];
private _colorInjured = [0,0,0,1];
private _colorDead = [0.4,0,0.5,0.65];
private _text = [_group,1] call FUNC(groupIconText);
private _groupCount = count (units _group);
private _unitNameList = '';
private _leader = TRUE;
private _showClass = QS_ST_groupInteractiveIcons_showClass;
private _AINames = QS_ST_showAINames;

if (QS_ST_showMedicalWounded) then {
    _colorIncapacitated = QS_ST_htmlColorMedical;
    _colorInjured = QS_ST_htmlColorInjured;
    _colorDead = [0.4,0,0.5,0.65];
} else {
    _colorIncapacitated = [1,0.41,0,1];
    _colorInjured = [0,0,0,1];
    _colorDead = [0.4,0,0.5,0.65];
};
{
    _color = [0,0,0,1];
    _lifeState = lifeState _x;
    switch (true) do {
        case (_lifeState isEqualTo 'INJURED'): _color = _colorInjured;
        case (_lifeState isEqualTo 'INCAPACITATED'): _color = _colorIncapacitated;
        case (_lifeState isEqualTo 'DEAD'): _color = _colorDead;
    };

    if ([_x,(QS_ST_MedicalSystem select 0)] call FUNC(isIncapacitated)) then {_color = _colorIncapacitated;};
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
