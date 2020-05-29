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
 *     [trigger,"text",this select 0] call qipTPL_etu_fnc_teleport;
 *   From trigger
 *     [trigger,"text",thisList] call qipTPL_etu_fnc_teleport;
 */

params [["_target", qipTPL_unit],["_text", "you've just crossed over into the twilight zone"],["_caller", qipTPL_unit]];

if (_target isEqualTo _caller) exitWith {};

if !(typeName _caller isEqualTo "ARRAY") then {
	_caller = [_caller];
};

{
	[
		[],
		{
			[0, "BLACK", 2, 1] spawn BIS_fnc_fadeEffect;
		}
	] remoteExec ["spawn", _x];

	[
		{
			params ["_target","_caller","_text"];
			private ["_pos"];
			_pos = [_target] call CBA_fnc_randPosArea;
			_caller setPos _pos;
			[
				_text,
				{
					titleText [_this,"PLAIN"];
				}
			] remoteExec ["spawn", _caller];
		},
		[_target,_x,_text],
		2
	] call CBA_fnc_waitAndExecute;

	[
		[],
		{
			[
				{
					titleFadeOut 2;
					[1, "BLACK", 5, 1] spawn BIS_fnc_fadeEffect;
				},
				[],
				8
			] call CBA_fnc_waitAndExecute;
		}
	] remoteExec ["spawn", _x];
} forEach _caller;
