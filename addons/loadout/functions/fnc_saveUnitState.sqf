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
private ["_unitID","_unitName","_unitRole","_unitTeam","_unitPos","_allGear","_activeWeaponAndMuzzle","_earplugs","_chestpack","_roleName"];

if (isNull _unit || {!alive _unit}) exitWith {};

if (isNil QEGVAR(common,iniDB)) then {
    call EFUNC(common,initDB);
};

_unitID = getPlayerUID _unit;
_unitName = name _unit;
_unitRole = roleDescription _unit;
_unitPos =  getPos _unit;
_unitTeam = assignedTeam _unit;
_allGear = getUnitLoadout _unit;
_activeWeaponAndMuzzle = [currentWeapon _unit, currentMuzzle _unit, currentWeaponMode _unit];
_earplugs = _unit getVariable ["ACE_hasEarPlugsIn", false];
_chestpack = _unit getVariable ["zade_boc_chestpack", []];
_roleName = [_unitRole,_unitName] joinString ":";

if (isNil "_roleName" || {!alive _unit}) exitWith {};

if (!isNil QEGVAR(common,iniDB)) then {
    ["write", [_roleName, "name", _unitName]] call EGVAR(common,iniDB);
    ["write", [_roleName, "id", _unitID]] call EGVAR(common,iniDB);
    ["write", [_roleName, "role", _unitRole]] call EGVAR(common,iniDB);
    ["write", [_roleName, "team", _unitTeam]] call EGVAR(common,iniDB);
    ["write", [_roleName, "unitPos", _unitPos]] call EGVAR(common,iniDB);
    ["write", [_roleName, "gear", _allGear]] call EGVAR(common,iniDB);
    ["write", [_roleName, "activeWeaponAndMuzzle", _activeWeaponAndMuzzle]] call EGVAR(common,iniDB);
    ["write", [_roleName, "earplugs", _earplugs]] call EGVAR(common,iniDB);
    ["write", [_roleName, "chestpack", _chestpack]] call EGVAR(common,iniDB);
	["write", [_roleName, "lastState", [_allGear, _activeWeaponAndMuzzle, _earplugs, _chestpack]]] call EGVAR(common,iniDB);
};

missionNamespace setVariable [_roleName, [_allGear, _activeWeaponAndMuzzle, _earplugs, _chestpack, _unitTeam], true];
