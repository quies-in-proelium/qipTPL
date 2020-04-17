#include "script_component.hpp"
/*
 * Author: NemesisRE
 * teleports unit to group leader
 *
 * Arguments:
 * 0: target <OBJECT>
 * 1: caller <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [this] call qipTPL_etu_fnc_transporter;
 *
 */

params ["",["_caller", qipTPL_unit]];
private ["_leader","_pos"];

_leader = leader (group (vehicle _caller));
if (vehicle _leader == _leader) then {
	_pos = [_leader] call CBA_fnc_randPosArea;
	_caller setpos _pos;
} else {
	if ((vehicle _leader) emptyPositions "cargo" == 0) then {
		hint "No room in squad leader's vehicle, try again in a few seconds.";
	} else {
		_caller moveincargo vehicle _leader;
	};
};
