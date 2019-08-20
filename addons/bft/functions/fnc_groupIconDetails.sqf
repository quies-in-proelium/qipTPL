#include "script_component.hpp"
/*
 * Author: NemesisRE
 * Shows hint with the group details for the given Marker
 *
 * Arguments:
 * 0: marker name <NetID>
 *
 * Return Value:
 * None
 *
 * Example:
 * ["UNIT"] call qipTPL_bft_fnc_groupIconDetails
 *
 * Public: No
 */

params ["_markerName"];
private ["_group", "_unitMOS", "_unitName", "_color", "_text", "_groupCount", "_unitNameList", "_leader", "_showClass"];

if (!isNull (_markerName call BIS_fnc_groupFromNetId)) then {
    _group = _markerName call BIS_fnc_groupFromNetId;
} else {
    _group = group (_markerName call BIS_fnc_objectFromNetId);
};

if (!((side _group) isEqualTo playerSide)) exitWith {
    hintSilent 'This group is not in your faction!';
};

_unitMOS = '';
_unitName = '';
_color = [0,0,0,1];
_text = [_group,1] call FUNC(groupIconText);
_groupCount = count (units _group);
_unitNameList = '';
_leader = TRUE;
_showClass = GVAR(groupInteractiveClassIcons);

{
    _color = [_x] call FUNC(getMarkerColor);
    _unitMOS = getText (configFile >> 'CfgVehicles' >> (typeOf _x) >> 'displayName');
    _unitName = name _x;
    if (!isPlayer _x) then {
        if (!(GVAR(showAINames))) then {
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
} forEach (units _group);

hintSilent parseText format [
    "
        <t align='left'><t size='2'>%1</t></t><t align='right'>%2</t><br/><br/>
        %3
    ",
    _text,
    _groupCount,
    _unitNameList
];
