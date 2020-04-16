params ["_configPath", "_loadoutTarget"];

if (getText _configPath == "") then {
	removeGoggles _loadoutTarget;
} else {
	_loadoutTarget addGoggles getText (_configPath);
};
