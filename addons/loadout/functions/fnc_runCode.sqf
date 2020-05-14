#include "script_component.hpp"

params ["_configPath", "_loadoutTarget"];
private ["_code"];

if (getText _configPath != "") then {
    _code = compile getText _configPath;
    _loadoutTarget call _code;
};
