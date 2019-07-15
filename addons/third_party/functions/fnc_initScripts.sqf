#include "script_component.hpp"

diag_log "Init - executing initScripts.sqf"; // Reporting. Do NOT edit/remove

[] execVM QPATHTOF(Scripts\QS_icons.sqf); // Soldier Tracker by Quiksilver

if (!mod_ACE3) then {
    [] execVM QPATHTOF(Scripts\NRE_earplugs.sqf); // Earplugs
};
