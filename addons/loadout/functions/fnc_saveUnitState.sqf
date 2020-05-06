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
 * [UNIT] call qipTPL_loadout_fnc_saveUnitState;
 *
 */
params ["_unit"];
private ["_unitID","_unitName","_unitRole","_unitPos","_allGear","_activeWeaponAndMuzzle","_earplugs","_chestpack"];

if (isNull _unit || {!alive _unit}) exitWith {};

if (isNil QEGVAR(common,iniDB)) then {
    call EFUNC(common,initDB);
};

_unitID = getPlayerUID _unit;
_unitName = name _unit;
_unitRole = roleDescription _unit;
_unitPos =  getPos _unit;
_allGear = getUnitLoadout _unit;
_activeWeaponAndMuzzle = [currentWeapon _unit, currentMuzzle _unit, currentWeaponMode _unit];
_earplugs = _unit getVariable ["ACE_hasEarPlugsIn", false];
_chestpack = _unit getVariable ["zade_boc_chestpack", []];

if (isNil "_unitID" || {!alive _unit}) exitWith {};

if (!isNil QEGVAR(common,iniDB)) then {
    ["write", [_unitID, "name", _unitName]] call EGVAR(common,iniDB);
    ["write", [_unitID, "role", _unitRole]] call EGVAR(common,iniDB);
    ["write", [_unitID, "unitPos", _unitPos]] call EGVAR(common,iniDB);
    ["write", [_unitID, "gear", _allGear]] call EGVAR(common,iniDB);
    ["write", [_unitID, "activeWeaponAndMuzzle", _activeWeaponAndMuzzle]] call EGVAR(common,iniDB);
    ["write", [_unitID, "earplugs", _earplugs]] call EGVAR(common,iniDB);
    ["write", [_unitID, "chestpack", _chestpack]] call EGVAR(common,iniDB);
	["write", [_unitID, "lastState", [_allGear, _activeWeaponAndMuzzle, _earplugs, _chestpack]]] call EGVAR(common,iniDB);
};

missionNamespace setVariable [_unitID, [_allGear, _activeWeaponAndMuzzle, _earplugs, _chestpack], true];
