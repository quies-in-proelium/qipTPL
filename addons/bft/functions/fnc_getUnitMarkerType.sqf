#include "script_component.hpp"
/*
 * Author: NemesisRE
 * Get the apropriate marker for a unit.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * Marker Type <STRING>
 *
 * Example:
 * ["UNIT"] call qipTPL_bft_fnc_getUnitMarkerType
 *
 * Public: No
 */

params ["_unit"];

if (isNull _unit) exitWith {"iconMan"};

if (!isNull objectParent _unit) exitWith {
    if ((leader _unit) isEqualTo _unit) then {
        // Vehicle icon
    };
    if !(vehicle (leader _unit) isEqualTo vehicle _unit) then {
        // Vehicle icon
    };
};

// Leader
if ((leader _unit) isEqualTo _unit) exitWith {"iconManLeader"};

// AR
if (getText(configFile >> "CfgWeapons" >> (primaryWeapon (_unit)) >> "UIPicture") == "\a3\weapons_f\data\ui\icon_mg_ca.paa") exitWith {
    "iconManMG";
};

// AT
if (getText(configFile >> "CfgWeapons" >> (secondaryWeapon (_unit)) >> "UIPicture") == "\a3\weapons_f\data\ui\icon_at_ca.paa") exitWith {
    "iconManAT";
};

// Medic
if (_unit getVariable ["ace_medical_medicClass", [0, 1] select (_unit getUnitTrait "medic")] > 0) exitWith {
    "iconManMedic";
};

// Engineer
private _isEngineer = _unit getVariable ["ACE_isEngineer", _unit getUnitTrait "engineer"];
if (_isEngineer isEqualType 0) then {_isEngineer = _isEngineer > 0};

if (_isEngineer) exitWith {
    "iconManEngineer";
};

// Explosive Specialist
if (_unit getVariable ["ACE_isEOD", false] || {_unit getUnitTrait "explosiveSpecialist"}) exitWith {
    "iconManExplosive";
};

"iconMan"
