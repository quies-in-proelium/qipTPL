#include "script_component.hpp"

params ["_entity"];
private ["_unitName","_unitRole","_roleName","_savedGear"];

_unitName = name _entity;
_unitRole = roleDescription _entity;
_roleName = [_unitRole,_unitName] joinString ":";
_savedGear = missionNamespace getVariable [_roleName, ""];

_savedGear
