params ["_configPath", "_loadoutTarget"];

removeAllHandgunItems _loadoutTarget;
{ _loadoutTarget addHandgunItem _x; } forEach getArray (_configPath);
