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
 * [UNIT] call qipTPL_loadout_fnc_restoreSavedState;
 *
 */
params ["_unit",["_lastState",[],[[]]]];
private ["_allGear","_activeWeaponAndMuzzle","_earplugs","_chestpack","_unitTeam","_attached"];

if (!alive _unit) exitWith {};

if (count _lastState == 0) then {
    _lastState = _unit call FUNC(checkSavedUnitState);
    if (count _lastState == 0) exitWith {};
};

INFO_1("Restoring gear for %1", _unit);

_allGear = _lastState param [0,[],[[]]];
_activeWeaponAndMuzzle = _lastState param [1,[],[[]]];
_earplugs = _lastState param [2,false];
_chestpack = _lastState param [3,[],[[]]];
_unitTeam = _lastState param [4,"MAIN",[""]];
_attached = _lastState param [10,[],[[]]];

_unit setUnitLoadout (configFile >> "EmptyLoadout");

if (!isNil "_allGear") then {
    _allGear params ["_primaryWeaponArray"];
    if ((_primaryWeaponArray param [0, ""]) == "ACE_FakePrimaryWeapon") then {
        _allGear set [0, []];
        _activeWeaponAndMuzzle = nil;
    };
    _unit setUnitLoadout _allGear;
};

if (!isNil "_activeWeaponAndMuzzle") then {
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
    _unit addItemToUniform "ACE_Earplugs";
    [_unit] call ace_hearing_fnc_putInEarplugs;
};

if !(_chestpack isEqualTo []) then {
    [_unit, (_chestpack select 0) select 0] call EFUNC(boc,addChestpack);
    [_unit, (_chestpack select 2)] call EFUNC(boc,setChestpackLoadout);
};

if (_unitTeam != "") then {
	_unit assignTeam _unitTeam;
};

if !(_attached isEqualTo []) then {
    [_unit, _unit, _attached select 0 select 1, true] call ace_attach_fnc_attach;
};
