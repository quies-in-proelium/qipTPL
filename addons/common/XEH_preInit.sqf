#include "script_component.hpp"

ADDON = false;

#include "XEH_PREP.hpp"

if (isNil "qipTPL_enabled" || !(qipTPL_enabled)) exitWith {};

qipTPL_unit = objNull;
uiNamespace setVariable ["qipTPL_unit", objNull];

player setVariable ["BIS_noCoreConversations",true]; // Disable AI chatter.
enableSaving [false,false]; // Disables save when aborting.
enableTeamSwitch false; // Disables team switch.
enableSentences false; // Disable AI chatter.

ADDON = true;
