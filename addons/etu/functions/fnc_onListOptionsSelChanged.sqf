#include "script_component.hpp"
/*
 * Author: BlauBär
 * Handles a change of the selected transport option.
 *
 * Arguments:
 * 0: List <CONTROL>
 * 1: Selected index <NUMBER>
 *
 * Return Value:
 * None
 */

params ["_ctrl", "_selection"];

GVAR(targetType) = _ctrl lbData _selection;

private _display = ctrlParent _ctrl;
private _buttonTransport = _display displayCtrl 30;
_buttonTransport ctrlEnable true;
