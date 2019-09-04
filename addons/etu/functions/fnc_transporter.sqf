#include "script_component.hpp"
/*
 * Author: NemesisRE
 * teleports unit to group leader and restores last saved gear
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

params [["_target", player],["_caller", player]];
private ["_leader","_pos","_targetPos"];

_caller call EFUNC(common,restoreGear);
_leader = leader (group (vehicle _caller));
_targetPos = getPos _target;
if (vehicle _leader == _leader) then {
	_pos = [_leader, 2, 15, 1, 1, 20, 0, [], [_targetPos,_targetPos]] call BIS_fnc_findSafePos;
	if !(_pos isEqualTo _targetPos) then {
		_caller setpos _pos;
	} else {
		hint "Could not find a safe location near your leader, try again in a few seconds.";
	};
} else {
	if ((vehicle _leader) emptyPositions "cargo" == 0) then {
		hint "No room in squad leader's vehicle, try again in a few seconds.";
	} else {
		_caller moveincargo vehicle _leader;
	};
};
