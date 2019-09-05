#include "script_component.hpp"

if (isNil QGVAR(qipTPL_enabled) || !(GVAR(qipTPL_enabled))) exitWith {};

["unit", {
    qipTPL_unit = (_this select 0);
}, true] call CBA_fnc_addPlayerEventHandler;

mod_ACE3 = isClass (configFile >> "CfgPatches" >> "ace_common");

if (isServer) then {
    [{time > 10}, {
        if (isDedicated) then {
            [{{_x call FUNC(saveUnitState)} forEach allPlayers;}, 1] call CBA_fnc_addPerFrameHandler;
        };

        [QGVAR(createZeus), {
            params ["_ownerPlayer"];
            private _owner = ["#adminLogged", getPlayerUID _ownerPlayer] select isMultiplayer;
            private _group = createGroup sideLogic;
            private _zeus = _group createUnit ["ModuleCurator_F", [0,0,0], [], 0, "NONE"];
            missionNamespace setVariable [format [QGVAR(zeus_%1), _owner], _zeus];
            _zeus setVariable ["owner", _owner, true];
            _zeus setVariable ["Addons", 3, true];
            _zeus setVariable ["BIS_fnc_initModules_disableAutoActivation", false];
            _zeus setCuratorCoef ["Place", 0];
            _zeus setCuratorCoef ["Delete", 0];
            _group deleteGroupWhenEmpty true;
            _zeus addCuratorEditableObjects [allMissionObjects "", true];
            _ownerPlayer setVariable ["TFAR_CuratorCamEars",true,true];
            if (!isMultiplayer && {!isNull findDisplay IDD_DISPLAY3DEN}) then {
                private _addons = ('true' configClasses (configFile >> "CfgPatches")) apply {configName _x};
                activateAddons _addons;
                removeAllCuratorAddons _zeus;
                _zeus addCuratorAddons _addons;
            };
            [QGVAR(zeusCreated), _zeus, _ownerPlayer] call CBA_fnc_targetEvent;
        }] call CBA_fnc_addEventHandler;

        [] call FUNC(rptLog);
    }] call CBA_fnc_waitUntilAndExecute;
};

if (hasInterface) then {
    [QGVAR(zeusCreated), {
        params ["_zeus"];
        GVAR(zeus) = _zeus;
        [localize "str_a3_cfgvehicles_moduletasksetstate_f_arguments_state_values_created_0"] call ace_common_fnc_displayTextStructured;
    }] call CBA_fnc_addEventHandler;
};

call compile preprocessFileLineNumbers QPATHTOF(tplCredits.sqf);

[] spawn FUNC(missionInitialization);
