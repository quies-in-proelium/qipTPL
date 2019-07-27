#include "script_component.hpp"

disableSerialization;
private _gps = controlNull;
private _exit = FALSE;
for '_x' from 0 to 1 step 0 do {
	{
		if (['311',(str _x),FALSE] call BIS_fnc_inString) then {
			if (!isNull (_x displayCtrl 101)) exitWith {
				_gps = (_x displayCtrl 101);
				_gps ctrlRemoveAllEventHandlers 'Draw';
				_gps ctrlAddEventHandler ['Draw',(format ['_this call %1',FUNC(iconDrawGPS)])];
				_exit = TRUE;
			};
		};
	} forEach (uiNamespace getVariable 'IGUI_displays');
	uiSleep 0.25;
	if (_exit) exitWith {};
};
