#include "script_component.hpp"
/*
 * Author: NemesisRE
 * teleports unit to given target
 *
 * Arguments:
 * 0: target <OBJECT>
 * 1: text <STRING>
 * 2: caller <ARRAY>
 *
 * Return Value:
 * None
 *
 * Examples:
 *   From addAction
 *     [trigger,"text",this select 0] spawn qipTPL_etu_fnc_teleport;
 *   From trigger
 *     [trigger,"text",this] call qipTPL_etu_fnc_teleport;
 */

params [["_target", qipTPL_unit],["_text", "you've just crossed over into the twilight zone"],["_caller", qipTPL_unit]];
private ["_pos"];

if !(typeName _caller isEqualTo "ARRAY") then {
	_caller = [_caller];
};

[0, "BLACK", 5, 1, "qipTPL_TwilightZoneShort"] spawn BIS_fnc_fadeEffect;
sleep 5;

{
	_pos = [_target] call CBA_fnc_randPosArea;
	_x setPos _pos;
} forEach _caller;

titleText [_text,"PLAIN"];
sleep 5;
titleFadeOut 3;
[1, "BLACK", 3, 1] spawn BIS_fnc_fadeEffect;
