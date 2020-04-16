params ["_configPath", "_loadoutTarget"];

if (getText _configPath == "") then {
	_loadoutTarget unlinkItem "ItemGPS";
} else {
	_loadoutTarget linkItem getText (_configPath);
};
