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
 * [UNIT] call qipTPL_common_fnc_saveUnitState;
 *
 */
params ["_unit"];
private ["_unitID","_unitName","_unitRole","_unitPos","_savedGear","_proximity","_allGear","_activeWeaponAndMuzzle","_earplugs","_chestpack"];

if (isNull _unit || {!alive _unit}) exitWith {};

if (isNil QGVAR(iniDB)) then {
    call FUNC(initDB);
};

_unitID = getPlayerUID _unit;
_unitName = name _unit;
_unitRole = roleDescription _unit;
_unitPos =  getPos _unit;
_savedGear = missionNamespace getVariable [_unitID, nil];
_allGear = getUnitLoadout _unit;
_activeWeaponAndMuzzle = [currentWeapon _unit, currentMuzzle _unit, currentWeaponMode _unit];
_earplugs = _unit getVariable ["ACE_hasEarPlugsIn", false];
_chestpack = _unit getVariable ["zade_boc_chestpack", []];

if (isNull _unitID || {!alive _unit}) exitWith {};

["write", [_unitID, "name", _unitName]] call GVAR(iniDB);
["write", [_unitID, "role", _unitRole]] call GVAR(iniDB);
["write", [_unitID, "unitPos", _unitPos]] call GVAR(iniDB);
["write", [_unitID, "gear", _allGear]] call GVAR(iniDB);
["write", [_unitID, "activeWeaponAndMuzzle", _activeWeaponAndMuzzle]] call GVAR(iniDB);
["write", [_unitID, "earplugs", _earplugs]] call GVAR(iniDB);
["write", [_unitID, "chestpack", _chestpack]] call GVAR(iniDB);

if (!isNil QEGVAR(etu,teleporter)) then {
    _proximity = false;
    {
        if ((_unit distance _x) > 50) then {
            _proximity = true;
        };
    } forEach EGVAR(etu,teleporter);

    if (_proximity) then {
        missionNamespace setVariable [_unitID, [_allGear, _activeWeaponAndMuzzle, _earplugs, _chestpack], true];
        ["write", [_unitID, "etuGear", _allGear]] call GVAR(iniDB);
    };
} else {
    if (isNil "_savedGear") then {
        missionNamespace setVariable [_unitID, [_allGear, _activeWeaponAndMuzzle, _earplugs, _chestpack], true];
        ["write", [_unitID, "etuGear", _allGear]] call GVAR(iniDB);
    };
};
