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
private ["_vehicle", "_isEngineer"];

if (isNull _unit) exitWith {"iconMan"};

if (!isNull objectParent _unit) exitWith {
    _vehicle = vehicle _unit;
    if (_vehicle isKindOf "Plane") exitWith {
        "iconPlane"
    };

    if (_vehicle isKindOf "Helicopter") exitWith {
        "iconHelicopter"
    };

    if (_vehicle isKindOf "StaticMortar") exitWith {
        "iconStaticMortar"
    };

    if (getNumber (configFile >> "CfgVehicles" >> typeOf _vehicle >> "artilleryScanner") == 1) exitWith {
        "iconStaticCannon"
    };

    if (_vehicle isKindOf "Car") exitWith {
        "iconCar"
    };

    if (_vehicle isKindOf "Tank") exitWith {
        "iconTank"
    };

    if (_vehicle isKindOf "Ship") exitWith {
        "iconShip"
    };

    if (_vehicle isKindOf "apc") exitWith {
        "iconApc"
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
_isEngineer = _unit getVariable ["ACE_isEngineer", _unit getUnitTrait "engineer"];
if (_isEngineer isEqualType 0) then {_isEngineer = _isEngineer > 0};

if (_isEngineer) exitWith {
    "iconManEngineer";
};

// Explosive Specialist
if (_unit getVariable ["ACE_isEOD", false] || {_unit getUnitTrait "explosiveSpecialist"}) exitWith {
    "iconManExplosive";
};

"iconMan"
