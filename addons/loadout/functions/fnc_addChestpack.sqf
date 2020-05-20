#include "script_component.hpp"

params ["_configPath", "_loadoutTarget"];
private ["_chestpack"];

_chestpack = getArray (_configPath);

[_loadoutTarget, _chestpack select 0] call EFUNC(boc,addChestpack);
[_loadoutTarget, parseSimpleArray (_chestpack select 1)] call EFUNC(boc,setChestpackLoadout);
