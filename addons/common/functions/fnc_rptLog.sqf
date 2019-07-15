#include "script_component.hpp"

diag_log "RPT: Init - executing Function rptLog"; // Reporting. Do NOT edit/remove

private ["_playableUnits","_aiUnits"];

if (isMultiplayer) then {
    _playableUnits = playableUnits;
} else {
    _playableUnits = switchableUnits;
};

if (((count allUnits)-(count _playableUnits)) < 0) then {
    _aiUnits = 0;
} else {
    _aiUnits = ((count allUnits)-(count _playableUnits));
};

// Init reporting
diag_log ""; diag_log "";
diag_log "--------------------------------------------------------------------------------------";
diag_log format ["RPT: Init - Mission name: %1",(getText (missionConfigFile >> "overviewText"))];
diag_log format ["RPT: Init - Mission developer: %1",(getText (missionConfigFile >> "author"))];
diag_log "--------------------------------------------------------------------------------------";
diag_log format ["RPT: Init - Number of clients connected: %1", (count _playableUnits)];
diag_log "--------------------------------------------------------------------------------------";
diag_log format ["RPT: Init - Number of AI's active: %1", _aiUnits];
diag_log "--------------------------------------------------------------------------------------";
diag_log ""; diag_log "";
