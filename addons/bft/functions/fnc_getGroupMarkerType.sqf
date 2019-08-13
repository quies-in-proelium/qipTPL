#include "script_component.hpp"
/*
 * Author: KoffeinFlummi, NemesisRE
 * Get the apropriate marker for a group.
 *
 * Arguments:
 * 0: Group <GROUP>
 *
 * Return Value:
 * Marker Type <STRING>
 *
 * Example:
 * ["GROUP"] call qipTPL_bft_fnc_getGroupMarkerType
 *
 * Public: No
 */

params ["_group"];

private _leader = leader _group;
private _vehicle = vehicle _leader;
private _side = side _leader;
private _sides = [];

if (GVAR(showCivilianIcons)) then {
    _sides = ["GUER", "WEST", "EAST", "CIV"];
} else {
    _sides = ["GUER", "WEST", "EAST"];
};

if (_vehicle == _leader) exitWith {
    if (
        getNumber (configFile >> "CfgVehicles" >> typeOf _leader >> "detectSkill") > 20 ||
        getNumber (configFile >> "CfgVehicles" >> typeOf _leader >> "camouflage") < 1 ||
        getText   (configFile >> "CfgVehicles" >> typeOf _leader >> "textsingular") == "diver"
    ) then {
        ["n_recon", "b_recon", "o_recon", "c_unknown"] select ((_sides find str _side) max 0)
    } else {
        ["n_inf", "b_inf", "o_inf", "c_unknown"] select ((_sides find str _side) max 0)
    };
};

if (getNumber (configFile >> "CfgVehicles" >> typeOf _vehicle >> "attendant") == 1) exitWith {
    ["n_med", "b_med", "o_med", "c_unknown"] select ((_sides find str _side) max 0)
};

if (
    getNumber (configFile >> "CfgVehicles" >> typeOf _vehicle >> "transportRepair") > 0 ||
    getNumber (configFile >> "CfgVehicles" >> typeOf _vehicle >> "transportFuel") > 0 ||
    getNumber (configFile >> "CfgVehicles" >> typeOf _vehicle >> "transportAmmo") > 0 ||
    getNumber (configFile >> "CfgVehicles" >> typeOf _vehicle >> "ACE_canRepair") > 0 ||
    getNumber (configFile >> "CfgVehicles" >> typeOf _vehicle >> "ACE_fuelCapacityCargo") > 0
) exitWith {
    ["n_maint", "b_maint", "o_maint", "c_unknown"] select ((_sides find str _side) max 0)
};

if (_vehicle isKindOf "Plane") exitWith {
    ["n_plane", "b_plane", "o_plane", "c_plane"] select ((_sides find str _side) max 0)
};

if (_vehicle isKindOf "Air") exitWith {
    ["n_air", "b_air", "o_air", "c_air"] select ((_sides find str _side) max 0)
};

if (_vehicle isKindOf "StaticMortar") exitWith {
    ["n_mortar", "b_mortar", "o_mortar", "c_unknown"] select ((_sides find str _side) max 0)
};

if (getNumber (configFile >> "CfgVehicles" >> typeOf _vehicle >> "artilleryScanner") == 1) exitWith {
    ["n_art", "b_art", "o_art", "c_unknown"] select ((_sides find str _side) max 0)
};

if (_vehicle isKindOf "Car") exitWith {
    ["n_motor_inf", "b_motor_inf", "o_motor_inf", "c_car"] select ((_sides find str _side) max 0)
};

if (_vehicle isKindOf "Tank") exitWith {
    if (getNumber (configFile >> "CfgVehicles" >> typeOf _vehicle >> "transportSoldier") > 0) then {
        ["n_mech_inf", "b_mech_inf", "o_mech_inf", "c_unknown"] select ((_sides find str _side) max 0)
    } else {
        ["n_armor", "b_armor", "o_armor", "c_unknown"] select ((_sides find str _side) max 0)
    };
};

if (_vehicle isKindOf "Ship") exitWith {
    ["n_naval", "b_naval", "o_naval", "c_ship"] select ((_sides find str _side) max 0)
};

// generic marker
["n_unknown", "b_unknown", "o_unknown", "c_unknown"] select ((_sides find str _side) max 0)
