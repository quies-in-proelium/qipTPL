#include "script_component.hpp"

params ["_unit"];
private ["_unitStateVar","_lastState"];

_unitStateVar = ["qipTPL_unitState", name _unit, roleDescription _unit] joinString "_";
_lastState = missionNamespace getVariable [_unitStateVar, []];

_lastState
