#include "script_component.hpp"
/*
 * Author: NemesisRE
 * Restores the saved gear.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [this] call qipTPL_etu_fnc_restoreGear;
 *
 */
params ["_unit"];
private ["_unitID","_savedGear","_allGear","_activeWeaponAndMuzzle","_earplugs","_chestpack"];

_unitID = "qipTPL_savedGear_" + (name _unit);
_savedGear = missionNamespace getVariable [_unitID, nil];
if (isNil "_savedGear" || {!alive _unit}) exitWith {};

_allGear = _savedGear select 0;
_activeWeaponAndMuzzle = _savedGear select 1;
_earplugs = _savedGear select 2;
_chestpack = _savedGear select 3;

if (!isNil "_allGear") then {
    _allGear params ["_primaryWeaponArray"];
    if ((_primaryWeaponArray param [0, ""]) == "ACE_FakePrimaryWeapon") then {
        TRACE_1("Ignoring fake gun",_primaryWeaponArray);
        _allGear set [0, []];
        _activeWeaponAndMuzzle = nil;
    };
    _unit setUnitLoadout _allGear;
};

// restore the last active weapon, muzzle and weaponMode
if (!isNil "_activeWeaponAndMuzzle") then {
    // @todo, replace this with CBA_fnc_selectWeapon after next CBA update
    _activeWeaponAndMuzzle params ["_activeWeapon", "_activeMuzzle", "_activeWeaponMode"];

    if (
        (_activeMuzzle != "") &&
        {_activeMuzzle != _activeWeapon} &&
        {_activeMuzzle in getArray (configFile >> "CfgWeapons" >> _activeWeapon >> "muzzles")}
    ) then {
        _unit selectWeapon _activeMuzzle;
    } else {
        if (_activeWeapon != "") then {
            _unit selectWeapon _activeWeapon;
        };
    };

    if (currentWeapon _unit != "") then {
        private _index = 0;

        while {
            _index < 299 && {currentWeaponMode _unit != _activeWeaponMode}
        } do {
            _unit action ["SwitchWeapon", _unit, _unit, _index];
            _index = _index + 1;
        };
    };
};

if (_earplugs) then {
    player addItemToUniform "ACE_Earplugs";
    [player] call ace_hearing_fnc_putInEarplugs;
};

if (_chestpack != 0) then {
    _chestpack set [0, _chestpack select 0 select 0];
    _chestpack deleteAt 1;
    [_unit, _chestpack select 0] call zade_boc_fnc_addChestpack;
    private _var = player getVariable ["zade_boc_chestpack", nil];
    if (!isNil "_var") then {
        _var set [2, _chestpack select 1];
        _var set [3, _chestpack select 2];
    };
    player setVariable ["zade_boc_chestpack", _var, true];
};
