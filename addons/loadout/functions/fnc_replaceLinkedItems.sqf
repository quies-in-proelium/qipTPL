#include "script_component.hpp"

params ["_configPath", "_loadoutTarget"];
private ["_class", "_parents"];

removeAllAssignedItems _loadoutTarget;
removeHeadgear _loadoutTarget;

{
    _class = [_x] call BIS_fnc_classWeapon;
    _parents = [_class, true] call BIS_fnc_returnParents;
    if ("Vest_Camo_Base" in _parents || "Vest_NoCamo_Base" in _parents) then {
        _loadoutTarget addVest _x;
    } else {
        _loadoutTarget linkItem _x;
    };
} forEach getArray (_configPath);
