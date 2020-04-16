params ["_configPath", "_loadoutTarget"];

{_loadoutTarget removeItem _x;} forEach items _loadoutTarget;
{_loadoutTarget addItem _x;} forEach getArray (_configPath);
