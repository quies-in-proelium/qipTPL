#include "script_component.hpp"

private ['_QS_display1Opened','_QS_display2Opened','_QS_display3Opened'];

_QS_display1Opened = FALSE;
_QS_display2Opened = FALSE;
_QS_display3Opened = FALSE;
disableSerialization;
for '_x' from 0 to 1 step 0 do {
	if (!(_QS_display1Opened)) then {
		if (!isNull ((findDisplay 160) displayCtrl 51)) then {
			_QS_display1Opened = TRUE;
			((findDisplay 160) displayCtrl 51) ctrlAddEventHandler ["Draw",{_this call FUNC(iconDrawMap)}];
		};
	} else {
		if (isNull ((findDisplay 160) displayCtrl 51)) then {
			_QS_display1Opened = FALSE;
		};
	};
	if (!(_QS_display2Opened)) then {
		if (!isNull ((findDisplay -1) displayCtrl 500)) then {
			_QS_display2Opened = TRUE;
			((findDisplay -1) displayCtrl 500) ctrlAddEventHandler ["Draw",{_this call FUNC(iconDrawMap)}];
		};
	} else {
		if (isNull ((findDisplay -1) displayCtrl 500)) then {
			_QS_display2Opened = FALSE;
		};
	};
	if (!(_QS_display3Opened)) then {
		if (!isNull (((uiNamespace getVariable "Tao_FoldMap") displayCtrl 40)) || {!isNull (((uiNamespace getVariable "Tao_FoldMap") displayCtrl 41))}) then {
			_QS_display3Opened = TRUE;
			// DAYMAP 40; Nightmap 41
			((uiNamespace getVariable "Tao_FoldMap") displayCtrl 40) ctrlAddEventHandler ["Draw",{_this call FUNC(iconDrawMap)}];
			((uiNamespace getVariable "Tao_FoldMap") displayCtrl 41) ctrlAddEventHandler ["Draw",{_this call FUNC(iconDrawMap)}];
		};
	} else {
		if (isNull (((uiNamespace getVariable "Tao_FoldMap") displayCtrl 40)) || {isNull (((uiNamespace getVariable "Tao_FoldMap") displayCtrl 41))}) then {
			_QS_display3Opened = FALSE;
		};
	};

	uiSleep 0.25;
};
