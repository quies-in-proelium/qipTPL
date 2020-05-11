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
private ["_unitID","_unitName","_unitRole","_unitSide","_unitTeam","_unitPos","_allGear","_activeWeaponAndMuzzle","_earplugs","_chestpack","_unitStateVar","_lastState"];

if (isNull _unit || {!alive _unit}) exitWith {};

if (local _unit) then {
    _unitName = name _unit;
    _unitRole = roleDescription _unit;
    _unitSide = str (side _unit);
    _unitID = getPlayerUID _unit;
    _unitPos =  getPos _unit;
    _unitTeam = assignedTeam _unit;
    _allGear = getUnitLoadout _unit;
    _activeWeaponAndMuzzle = [currentWeapon _unit, currentMuzzle _unit, currentWeaponMode _unit];
    _earplugs = _unit getVariable ["ACE_hasEarPlugsIn", false];
    _chestpack = _unit getVariable ["zade_boc_chestpack", []];
    _unitStateVar = ["qipTPL_unitState", name _unit, roleDescription _unit] joinString "_";
    missionNamespace setVariable [_unitStateVar, [_allGear, _activeWeaponAndMuzzle, _earplugs, _chestpack, _unitTeam, _unitPos, _unitID, _unitName, _unitRole, _unitSide], true];
};

if (isDedicated) then {
    _lastState = _unit call FUNC(checkSavedUnitState);
    if (count _lastState == 0) exitWith {};

    if (!isNil QEGVAR(common,iniDB)) then {
        ["write", [_unit, "allGear", _lastState select 0]] call EGVAR(common,iniDB);
        ["write", [_unit, "activeWeaponAndMuzzle", _lastState select 1]] call EGVAR(common,iniDB);
        ["write", [_unit, "earplugs", _lastState select 2]] call EGVAR(common,iniDB);
        ["write", [_unit, "chestpack", _lastState select 3]] call EGVAR(common,iniDB);
        ["write", [_unit, "unitTeam", _lastState select 4]] call EGVAR(common,iniDB);
        ["write", [_unit, "unitPos", _lastState select 5]] call EGVAR(common,iniDB);
        ["write", [_unit, "unitID", _lastState select 6]] call EGVAR(common,iniDB);
        ["write", [_unit, "unitName", _lastState select 7]] call EGVAR(common,iniDB);
        ["write", [_unit, "unitRole", _lastState select 8]] call EGVAR(common,iniDB);
        ["write", [_unit, "unitSide", _lastState select 9]] call EGVAR(common,iniDB);
    	["write", [_unit, "lastState", _lastState]] call EGVAR(common,iniDB);
    } else {
        call EFUNC(common,initDB);
    };
};
