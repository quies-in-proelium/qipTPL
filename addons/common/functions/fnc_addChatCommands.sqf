#include "script_component.hpp"

[QGVAR(requestZeus), {
    params ["_ownerPlayer"];
    if (!isNull getAssignedCuratorLogic _ownerPlayer) exitWith {};
    private _owner = ["#adminLogged", getPlayerUID _ownerPlayer] select isMultiplayer;
    private _group = createGroup sideLogic;
    private _zeus = _group createUnit ["ModuleCurator_F", [0,0,0], [], 0, "NONE"];
    _zeus setVariable ["owner", _owner, true];
    _zeus setVariable ["Addons", 3, true];
    _zeus setVariable ["BIS_fnc_initModules_disableAutoActivation", false];
    _zeus setCuratorCoef ["Place", 0];
    _zeus setCuratorCoef ["Delete", 0];
    _group deleteGroupWhenEmpty true;
    _zeus addCuratorEditableObjects [allMissionObjects "", true];
    _ownerPlayer setVariable ["TFAR_CuratorCamEars",true,true];

    if (!isMultiplayer && {!isNull findDisplay IDD_DISPLAY3DEN}) then {
        // if loaded from editor (but not after restart), addons are not activated so we do it manually
        private _addons = ('true' configClasses (configFile >> "CfgPatches")) apply {configName _x};
        activateAddons _addons;
        removeAllCuratorAddons _zeus;
        _zeus addCuratorAddons _addons;
    };
    [QGVAR(zeusCreated), _zeus, _ownerPlayer] call CBA_fnc_targetEvent;
}] call CBA_fnc_addEventHandler;
