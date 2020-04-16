params ["_configPath", "_loadoutTarget"];

if (getText _configPath == "") then {
	_loadoutTarget unlinkItem "ItemWatch";
} else {
	_loadoutTarget linkItem getText (_configPath);
};
