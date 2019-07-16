#include "script_component.hpp"

if (isServer || !hasInterface) exitWith {};

if (!mod_ACE3) then {
    [] execVM QPATHTOF(Scripts\NRE_earplugs.sqf); // Earplugs
};
if (!qipTPL_enableBluforTracking) then {
    [] execVM QPATHTOF(Scripts\QS_icons.sqf); // Soldier Tracker by Quiksilver
};
