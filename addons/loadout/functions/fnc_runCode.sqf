#include "script_component.hpp"

params ["_configPath", "_loadoutTarget"];
private ["_code"];

_code = compile getText _configPath;
_loadoutTarget call _code;
