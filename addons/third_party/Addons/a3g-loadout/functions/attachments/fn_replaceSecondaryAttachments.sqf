params ["_configPath", "_loadoutTarget"];

{_loadoutTarget removeSecondaryWeaponItem _x;} forEach secondaryWeaponItems _loadoutTarget;
{_loadoutTarget addSecondaryWeaponItem _x;} forEach getArray _configPath;
