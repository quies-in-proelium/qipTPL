#include "script_component.hpp"
/*
 * Author: NemesisRE, commy2
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

switch (GVAR(groupIconsInteraction)) do {
    case "hover": {
        _ctrlMap ctrlAddEventHandler ["Draw", {
            params ["_ctrlMap"];
            ctrlMapMouseOver _ctrlMap params [["_type", ""], ["_marker", ""]];

            if (_type == "marker" && (!isNull (_marker call BIS_fnc_groupFromNetId) || !isNull (_marker call BIS_fnc_objectFromNetId))) then {
                [_marker] call FUNC(showGroupDetails);
            } else {
                call FUNC(clearHint);
            };
        }];
    };
    case "click": {
        // TODO:
    };
    case "disabled";
    default {};
};
