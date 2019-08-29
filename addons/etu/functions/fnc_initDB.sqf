#include "script_component.hpp"

private _joinedMissionName = missionName splitString " " joinString "_";
private _databasename = _joinedMissionName + "_Gear";

GVAR(gearDB) = ["new", _databasename] call OO_INIDBI;
