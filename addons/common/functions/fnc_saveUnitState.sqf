#include "script_component.hpp"
/*
 * Author: NemesisRE
 * Saves the gear of the given unit into the missionNamespace.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [this] call qipTPL_common_fnc_saveUnitState;
 *
 */
params ["_unit"];
private ["_unitID","_unitRole","_unitPos","_savedGear","_proximity","_allGear","_activeWeaponAndMuzzle","_earplugs","_chestpack"];

if (_unit != player || {isNull _unit} || {!alive _unit}) exitWith {};

_unitID = "qipTPL_savedGear_" + (name _unit);
_unitRole = roleDescription _unit;
_unitPos =  getPos _unit;
_savedGear = missionNamespace getVariable [_unitID, nil];
_allGear = getUnitLoadout _unit;
_activeWeaponAndMuzzle = [currentWeapon _unit, currentMuzzle _unit, currentWeaponMode _unit];
_earplugs = _unit getVariable ["ACE_hasEarPlugsIn", false];
_chestpack = _unit getVariable ["zade_boc_chestpack", []];

["write", [_unitID, "role", _unitRole]] call GVAR(iniDB);
["write", [_unitID, "unitPos", _unitPos]] call GVAR(iniDB);
["write", [_unitID, "gear", _allGear]] call GVAR(iniDB);
["write", [_unitID, "activeWeaponAndMuzzle", _activeWeaponAndMuzzle]] call GVAR(iniDB);
["write", [_unitID, "earplugs", _earplugs]] call GVAR(iniDB);
["write", [_unitID, "chestpack", _chestpack]] call GVAR(iniDB);

if (!isNil QGVAR(transporter)) then {
	_proximity = _unit distance GVAR(teleporter);
	if (isNil "_savedGear" || (_proximity > 100)) then {
		missionNamespace setVariable [_unitID, [_allGear, _activeWeaponAndMuzzle, _earplugs, _chestpack], true];
		["write", [_unitID, "allGear", _allGear]] call GVAR(iniDB);
	};
};
