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

params ["_target",["_caller", qipTPL_unit]];
private ["_pos", "_ctrl", "_targets"];

if (isNil "_target") then {
	_ctrl = (findDisplay 1000) displayCtrl 1101;
	_targets = profileNamespace getVariable ["transporterTargets",nil];
	if (isNil "_targets") exitWith {closeDialog 0};
	_target = _targets select (lbCurSel _ctrl);
};

if (isNil "_target") exitWith {hint "No transport target found"};

if (vehicle _target == _target) then {
	_pos = [_target, 3, direction _target] call CBA_fnc_randPos;
	_caller setpos [_pos select 0, _pos select 1, ASLtoAGL getPosASL _target select 2];
	closeDialog 0;
} else {
	if ((vehicle _target) emptyPositions "cargo" == 0) then {
		hint "No room in target vehicle, try again later.";
	} else {
		_caller moveincargo vehicle _target;
		closeDialog 0;
	};
};
