#include "script_component.hpp"
/*
 * Author: NemesisRE
 * Handles XEH DisplayLoad
 *
 * Arguments:
 * 0: idd <Display>
 *
 * Return Value:
 * None
 *
 * Example:
 * [display] call qipTPL_bft_fnc_initDisplayMission
 *
 * Public: No
 */

params ["_display"];

private _ctrlMap = _display displayCtrl 51;

if (GVAR(groupIconsInteraction) == "hover") then {
	[{
		ctrlMapMouseOver _ctrlMap params [["_type", ""], "_marker"];
		if (_type == "marker" && (!isNull (_marker call BIS_fnc_groupFromNetId) || !isNull (_marker call BIS_fnc_objectFromNetId))) then {
			[_marker] call FUNC(showGroupDetails);
		};
	}, 0] call CBA_fnc_addPerFrameHandler;
};
