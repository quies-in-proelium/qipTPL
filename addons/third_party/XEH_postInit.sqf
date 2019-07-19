#include "script_component.hpp"

if (isNil "qipTPL_enabled" || !(qipTPL_enabled)) exitWith {};

if (isServer || !hasInterface) exitWith {};

if (!mod_ACE3) then {
    [] execVM QPATHTOF(Scripts\NRE_earplugs.sqf); // Earplugs
};
