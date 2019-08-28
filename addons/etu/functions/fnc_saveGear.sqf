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
 * [this] call qipTPL_etu_fnc_saveGear;
 *
 */
params ["_unit"];
private ["_unitID","_savedGear","_proximity","_allGear","_activeWeaponAndMuzzle","_earplugs","_chestpack"];


if (!alive _unit) exitWith {};

_unitID = "qipTPL_savedGear_" + (getPlayerUID _unit);
_savedGear = missionNamespace getVariable [_unitID, nil];
_proximity = _unit distance GVAR(teleporter);
if (!isNil "_savedGear" && (_proximity < 100)) exitWith {};

_allGear = getUnitLoadout _unit;
_activeWeaponAndMuzzle = [currentWeapon _unit, currentMuzzle _unit, currentWeaponMode _unit];
_earplugs = _unit getVariable ["ACE_hasEarPlugsIn", false];
_chestpack = _unit getVariable ["zade_boc_chestpack", nil];

missionNamespace setVariable [_unitID, [_allGear, _activeWeaponAndMuzzle, _earplugs, _chestpack], true];
