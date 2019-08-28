#include "script_component.hpp"

ADDON = false;

#include "initCBASettings.sqf"

if (isNil QGVAR(qipTPL_enabled) || !(GVAR(qipTPL_enabled))) exitWith {};

#include "XEH_PREP.hpp"

qipTPL_unit = objNull;
uiNamespace setVariable ["qipTPL_unit", objNull];

enableSaving [false,false]; // Disables save when aborting.
enableTeamSwitch false; // Disables team switch.

// Disable all AI chatter
player setVariable ["BIS_noCoreConversations",true]; // Disable AI chatter.
enableSentences false; // Disable AI chatter.
enableRadio false; // Disable AI radio.

ADDON = true;
