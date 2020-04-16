params ["_configPath", "_loadoutTarget"];

if (getText _configPath == "") then {
	removeHeadgear _loadoutTarget;
} else {
	_loadoutTarget addHeadgear getText (_configPath);
};
