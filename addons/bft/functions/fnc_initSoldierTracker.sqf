#include "script_component.hpp"

private _side = playerSide;
private _sides = [EAST,WEST,RESISTANCE,CIVILIAN];
uiSleep 0.1;
private _QS_ST_faction = _sides find _side;

if (_side isEqualTo EAST) then {
    _QS_ST_showFriendlySides = QS_ST_friendlySides_EAST;
};
if (_side isEqualTo WEST) then {
    _QS_ST_showFriendlySides = QS_ST_friendlySides_WEST;
};
if (_side isEqualTo RESISTANCE) then {
    _QS_ST_showFriendlySides = QS_ST_friendlySides_RESISTANCE;
};
if (_side isEqualTo CIVILIAN) then {
    _QS_ST_showFriendlySides = QS_ST_friendlySides_CIVILIAN;
};
_QS_ST_autonomousVehicles = [];
if (!(_QS_ST_iconShadowMap in [0,1,2])) then {
    _QS_ST_iconShadowMap = 1;
};
if (!(_QS_ST_iconShadowGPS in [0,1,2])) then {
    _QS_ST_iconShadowGPS = 1;
};
if (_QS_ST_iconUpdatePulseDelay > 0) then {
    missionNamespace setVariable ['QS_ST_iconUpdatePulseTimer',diag_tickTime];
};

if (QS_ST_enableGroupIcons) then {
    if (!(QS_ST_map_enableUnitIcons)) then {
        _QS_ST_groupIconOffset = [0,0];
    };
};
_QS_ST_groupIconText = FALSE;
_QS_ST_htmlColorMedical = [_QS_ST_MedicalIconColor select 0,_QS_ST_MedicalIconColor select 1,_QS_ST_MedicalIconColor select 2,_QS_ST_MedicalIconColor select 3] call (missionNamespace getVariable 'BIS_fnc_colorRGBtoHTML');
_QS_ST_htmlColorInjured = [_QS_ST_colorInjured select 0,_QS_ST_colorInjured select 1,_QS_ST_colorInjured select 2,_QS_ST_colorInjured select 3] call (missionNamespace getVariable 'BIS_fnc_colorRGBtoHTML');

_QS_ST_R = [
    _QS_ST_map_enableUnitIcons,													// 0
    _QS_ST_gps_enableUnitIcons,													// 1
    _QS_ST_enableGroupIcons,													// 2
    _QS_ST_faction,																// 3
    _QS_ST_friendlySides_EAST,													// 4
    _QS_ST_friendlySides_WEST,													// 5
    _QS_ST_friendlySides_RESISTANCE,											// 6
    _QS_ST_friendlySides_CIVILIAN,												// 7
    _QS_ST_friendlySides_Dynamic,												// 8
    _QS_ST_iconColor_EAST,														// 9

    _QS_ST_iconColor_WEST,														// 10
    _QS_ST_iconColor_RESISTANCE,												// 11
    _QS_ST_iconColor_CIVILIAN,													// 12
    _QS_ST_iconColor_UNKNOWN,													// 13
    _QS_ST_showMedicalWounded,													// 14
    _QS_ST_MedicalSystem,														// 15
    _QS_ST_MedicalIconColor,													// 16
	_QS_ST_iconShadowMap,														// 17
    _QS_ST_iconShadowGPS,														// 18
    _QS_ST_iconTextSize_Map,													// 19

    _QS_ST_iconTextSize_GPS,													// 20
    _QS_ST_iconTextOffset,														// 21
    _QS_ST_iconSize_Man,														// 22
    _QS_ST_iconSize_LandVehicle,												// 23
    _QS_ST_iconSize_Ship,														// 24
    _QS_ST_iconSize_Air,														// 25
    _QS_ST_iconSize_StaticWeapon,												// 26
    _QS_ST_GPSDist,																// 27
    _QS_ST_GPSshowNames,														// 28
    _QS_ST_GPSshowGroupOnly,													// 29

    _QS_ST_showAIGroups,														// 30
    _QS_ST_showGroupMapIcons,													// 31
    _QS_ST_showGroupHudIcons,													// 32
    _QS_ST_groupInteractiveIcons,												// 33
    _QS_ST_groupInteractiveIcons_showClass,										// 34
    _QS_ST_dynamicGroupID,														// 35
    _QS_ST_showGroupMapText,													// 36
    _QS_ST_groupIconScale,														// 37
    _QS_ST_groupIconOffset,														// 38
    _QS_ST_groupIconText,														// 39

    _QS_ST_autonomousVehicles,													// 40
    _QS_fnc_iconColor,															// 41
    _QS_fnc_iconType,															// 42
    _QS_fnc_iconSize,															// 43
    _QS_fnc_iconPosDir,															// 44
    _QS_fnc_iconText,															// 45
    _QS_fnc_iconUnits,															// 46
    _QS_fnc_onMapSingleClick,													// 47
    _QS_fnc_mapVehicleShowCrew,													// 48
    _QS_fnc_iconDrawMap,														// 49

    _QS_fnc_iconDrawGPS,														// 50
    _QS_fnc_groupIconText,														// 51
    _QS_fnc_groupIconType,														// 52
    _QS_fnc_configGroupIcon,													// 53
    _QS_fnc_onGroupIconClick,													// 54
    _QS_fnc_onGroupIconOverLeave,												// 55
    _QS_ST_iconMapClickShowDetail,												// 56
    _QS_ST_showFriendlySides,													// 57
    _QS_fnc_onGroupIconOverEnter,												// 58
    _QS_ST_showCivilianGroups,													// 59

    _QS_ST_iconTextFont,														// 60
    _QS_ST_showAll,																// 61
    _QS_ST_showFactionOnly,														// 62
    _QS_ST_showAI,																// 63
    _QS_ST_showMOS,																// 64
    _QS_ST_showGroupOnly,														// 65
    _QS_ST_iconUpdatePulseDelay,												// 66
    _QS_ST_iconMapText,															// 67
    _QS_ST_showMOS_range,														// 68
    _QS_fnc_isIncapacitated,													// 69

    _QS_ST_htmlColorMedical,													// 70
    _QS_ST_AINames,																// 71
    _QS_ST_showAINames,															// 72
    _QS_ST_groupTextFactionOnly,												// 73
    _QS_ST_showCivilianIcons,													// 74
    _QS_ST_showOnlyVehicles,													// 75
    _QS_ST_showOwnGroup,														// 76
    _QS_fnc_iconColorGroup,														// 77
    _QS_ST_iconColor_empty,														// 78
    _QS_ST_iconSize_empty,														// 79

    _QS_ST_showEmptyVehicles,													// 80
    _QS_ST_htmlColorInjured,													// 81
    _QS_ST_otherDisplays,														// 82
    _QS_ST_MAPrequireGPSItem,													// 83
    _QS_ST_GPSrequireGPSItem,													// 84
    _QS_ST_GRPrequireGPSItem,													// 85
    _QS_ST_admin																// 86
];
{
    missionNamespace setVariable _x;
} forEach [
    ['QS_ST_X',(compileFinal (str _QS_ST_R)),FALSE],
    ['QS_ST_updateDraw_map',(diag_tickTime + 2),FALSE],
    ['QS_ST_updateDraw_gps',(diag_tickTime + 1),FALSE],
    ['QS_ST_drawArray_map',[],FALSE],
    ['QS_ST_drawArray_gps',[],FALSE]
];
waitUntil {
    uiSleep 0.1;
    !(isNull (findDisplay 12))
};
_QS_ST_X = [] call (missionNamespace getVariable 'QS_ST_X');
if (_QS_ST_X select 0) then {
    ((findDisplay 12) displayCtrl 51) ctrlAddEventHandler ['Draw',(format ['_this call %1',(_QS_ST_X select 49)])];
    if (_QS_ST_X select 82) then {
        [_QS_ST_X] spawn {
            scriptName 'Soldier Tracker by Quiksilver - Artillery Computer and UAV Terminal support';
            private ['_QS_display1Opened','_QS_display2Opened','_QS_display3Opened'];
            _QS_ST_X = _this select 0;
            _QS_display1Opened = FALSE;
            _QS_display2Opened = FALSE;
            _QS_display3Opened = FALSE;
            disableSerialization;
            for '_x' from 0 to 1 step 0 do {
                if (!(_QS_display1Opened)) then {
                    if (!isNull ((findDisplay 160) displayCtrl 51)) then {
                        _QS_display1Opened = TRUE;
                        ((findDisplay 160) displayCtrl 51) ctrlAddEventHandler ['Draw',(format ['_this call %1',(_QS_ST_X select 49)])];
                    };
                } else {
                    if (isNull ((findDisplay 160) displayCtrl 51)) then {
                        _QS_display1Opened = FALSE;
                    };
                };
                if (!(_QS_display2Opened)) then {
                    if (!isNull ((findDisplay -1) displayCtrl 500)) then {
                        _QS_display2Opened = TRUE;
                        ((findDisplay -1) displayCtrl 500) ctrlAddEventHandler ['Draw',(format ['_this call %1',(_QS_ST_X select 49)])];
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
                        ((uiNamespace getVariable "Tao_FoldMap") displayCtrl 40) ctrlAddEventHandler ['Draw',(format ['_this call %1',(_QS_ST_X select 49)])];
                        ((uiNamespace getVariable "Tao_FoldMap") displayCtrl 41) ctrlAddEventHandler ['Draw',(format ['_this call %1',(_QS_ST_X select 49)])];
                    };
                } else {
                    if (isNull (((uiNamespace getVariable "Tao_FoldMap") displayCtrl 40)) || {isNull (((uiNamespace getVariable "Tao_FoldMap") displayCtrl 41))}) then {
                        _QS_display3Opened = FALSE;
                    };
                };

                uiSleep 0.25;
            };
        };
    };
    if (_QS_ST_X select 56) then {
        player setVariable ['QS_ST_map_vehicleShowCrew',objNull,FALSE];
        player setVariable ['QS_ST_mapSingleClick',FALSE,FALSE];
        {
            addMissionEventHandler _x;
        } forEach [
            ['MapSingleClick',(_QS_ST_X select 47)],
            [
                'Map',
                {
                    params ['_mapIsOpened','_mapIsForced'];
                    if (!(_mapIsOpened)) then {
                        if (alive (player getVariable ['QS_ST_map_vehicleShowCrew',objNull])) then {
                            player setVariable ['QS_ST_mapSingleClick',FALSE,FALSE];
                            (player getVariable ['QS_ST_map_vehicleShowCrew',objNull]) setVariable ['QS_ST_mapClickShowCrew',FALSE,FALSE];
                            player setVariable ['QS_ST_map_vehicleShowCrew',objNull,FALSE];
                        };
                    };
                }
            ]
        ];
    };
};

if (_QS_ST_X select 1) then {
    [_QS_ST_X] spawn {
        scriptName 'Soldier Tracker (GPS Icons) by Quiksilver - Waiting for GPS display';
        params ['_QS_ST_X'];
        disableSerialization;
        private _gps = controlNull;
        private _exit = FALSE;
        for '_x' from 0 to 1 step 0 do {
            {
                if (['311',(str _x),FALSE] call BIS_fnc_inString) then {
                    if (!isNull (_x displayCtrl 101)) exitWith {
                        _gps = (_x displayCtrl 101);
                        _gps ctrlRemoveAllEventHandlers 'Draw';
                        _gps ctrlAddEventHandler ['Draw',(format ['_this call %1',(_QS_ST_X select 50)])];
                        _exit = TRUE;
                    };
                };
            } forEach (uiNamespace getVariable 'IGUI_displays');
            uiSleep 0.25;
            if (_exit) exitWith {};
        };
    };
};
if (_QS_ST_X select 2) then {
    setGroupIconsVisible [(_QS_ST_X select 31),(_QS_ST_X select 32)];
    setGroupIconsSelectable (_QS_ST_X select 33);
    if (_QS_ST_X select 33) then {
        {
            addMissionEventHandler _x;
        } forEach [
            ['GroupIconClick',(_QS_ST_X select 54)],
            ['GroupIconOverEnter',(_QS_ST_X select 58)],
            ['GroupIconOverLeave',(_QS_ST_X select 55)]
        ];
    };
    [_QS_ST_X] spawn {
        scriptName 'Soldier Tracker (Group Icons) by Quiksilver';
        params ['_QS_ST_X'];
        _showMapUnitIcons = _QS_ST_X select 0;
        _dynamicDiplomacy = _QS_ST_X select 8;
        _showFriendlySides = _QS_ST_X select 57;
        _playerFaction = _QS_ST_X select 3;
        _showAIGroups = _QS_ST_X select 30;
        _configGroupIcon = _QS_ST_X select 53;
        _showCivilianGroups = _QS_ST_X select 59;
        _groupIconsVisibleMap = _QS_ST_X select 31;
        _showOwnGroup = _QS_ST_X select 76;
        _gpsRequired = _QS_ST_X select 85;
        private _sidesFriendly = [];
        private _grp = grpNull;
        private _sides = [EAST,WEST,RESISTANCE,CIVILIAN];
        private _grpLeader = objNull;
        private _refreshGroups = FALSE;
        if (!(_showCivilianGroups)) then {
            _sides deleteAt 3;
        };
        _groupUpdateDelay_timer = 5;
        private _groupUpdateDelay = diag_tickTime + _groupUpdateDelay_timer;
        private _checkDiplomacy_delay = 10;
        private _checkDiplomacy = diag_tickTime + _checkDiplomacy_delay;
        if (_dynamicDiplomacy) then {
            _sidesFriendly = _sides;
        };
        private _as = [];
        _as pushBack (_sides select _playerFaction);
        {
            0 = _as pushBack (_sides select _x);
        } count _showFriendlySides;
        for '_x' from 0 to 1 step 0 do {
            if (_dynamicDiplomacy) then {
                if (diag_tickTime > _checkDiplomacy) then {
                    _as = [];
                    {
                        if (((_sides select _playerFaction) getFriend _x) > 0.6) then {
                            0 = _as pushBack _x;
                        };
                    } count _sides;
                    _checkDiplomacy = diag_tickTime + _checkDiplomacy_delay;
                };
            };
            if (diag_tickTime > _groupUpdateDelay) then {
                {
                    _grp = _x;
                    if ((_showOwnGroup) || {((!(_showOwnGroup)) && (!(_grp isEqualTo (group player))))} || {(!(_showMapUnitIcons))}) then {
                        if (({(alive _x)} count (units _grp)) > 0) then {
                            if ((side _grp) in _as) then {
                                _grpLeader = leader _grp;
                                if (_showAIGroups) then {
                                    if (isNil {_grp getVariable 'QS_ST_Group'}) then {
                                        if (!isNull _grp) then {
                                            if (!isNull _grpLeader) then {
                                                [_grp,0,_QS_ST_X] call _configGroupIcon;
                                            };
                                        };
                                    } else {
                                        if (!isNull _grp) then {
                                            if (!isNull _grpLeader) then {
                                                [_grp,1,_QS_ST_X] call _configGroupIcon;
                                            };
                                        };
                                    };
                                } else {
                                    if (isPlayer _grpLeader) then {
                                        if (isNil {_grp getVariable 'QS_ST_Group'}) then {
                                            if (!isNull _grp) then {
                                                if (!isNull _grpLeader) then {
                                                    [_grp,0,_QS_ST_X] call _configGroupIcon;
                                                };
                                            };
                                        } else {
                                            if (!isNull _grp) then {
                                                if (!isNull _grpLeader) then {
                                                    [_grp,1,_QS_ST_X] call _configGroupIcon;
                                                };
                                            };
                                        };
                                    };
                                };
                            } else {
                                if (!isNil {_grp getVariable 'QS_ST_Group_Icon'}) then {
                                    [_grp,2,_QS_ST_X] call _configGroupIcon;
                                };
                            };
                        } else {
                            if (!isNil {_grp getVariable 'QS_ST_Group_Icon'}) then {
                                [_grp,2,_QS_ST_X] call _configGroupIcon;
                            };
                        };
                    };
                    uiSleep ([0.05,0.01] select _refreshGroups);
                } count allGroups;
                if (_refreshGroups) then {
                    _refreshGroups = FALSE;
                };
                _groupUpdateDelay = diag_tickTime + _groupUpdateDelay_timer;
            };
            _QS_fnc_hasGPSDevice = {
                private _r = FALSE;
                if ("ACE_microDAGR" in items player) then {
                    _r = TRUE;
                } else {
                {
                        if (_x isKindOf ["ItemGPS", configFile >> "CfgWeapons"] || {_x isKindOf ["UavTerminal_base", configFile >> "CfgWeapons"]} || {_x isKindOf ["ItemcTab", configFile >> "CfgWeapons"]}) then {
                            _r = TRUE;
                        };
                    } forEach assignedItems player;
                };
                _r;
            };
            if (_gpsRequired) then {
                if (!(call _QS_fnc_hasGPSDevice)) then {
                    setGroupIconsVisible [FALSE,FALSE];
                    waitUntil {
                        uiSleep 0.25;
                        call _QS_fnc_hasGPSDevice;
                    };
                };
            };

            if ((!(visibleMap)) && (isNull ((findDisplay 160) displayCtrl 51)) && (isNull ((findDisplay -1) displayCtrl 500)) && (isNull (((uiNamespace getVariable "Tao_FoldMap") displayCtrl 40))) && (isNull (((uiNamespace getVariable "Tao_FoldMap") displayCtrl 41)))) then {
                waitUntil {
                    uiSleep 0.25;
                    ((visibleMap) || {(!isNull ((findDisplay 160) displayCtrl 51))} || {(!isNull ((findDisplay -1) displayCtrl 500))} || {(!isNull (((uiNamespace getVariable "Tao_FoldMap") displayCtrl 40)))} || {(!isNull (((uiNamespace getVariable "Tao_FoldMap") displayCtrl 41)))})
                };
                _refreshGroups = TRUE;
            };
            if ((visibleMap) || {(!isNull ((findDisplay 160) displayCtrl 51))} || {(!isNull ((findDisplay -1) displayCtrl 500))} || {(!isNull (((uiNamespace getVariable "Tao_FoldMap") displayCtrl 40)))} || {(!isNull (((uiNamespace getVariable "Tao_FoldMap") displayCtrl 41)))}) then {
                if ((ctrlMapScale ((findDisplay 12) displayCtrl 51)) isEqualTo 1) then {
                    if (groupIconsVisible select 0) then {
                        setGroupIconsVisible [FALSE,(groupIconsVisible select 1)];
                    };
                } else {
                    if (_groupIconsVisibleMap) then {
                        if (!(groupIconsVisible select 0)) then {
                            setGroupIconsVisible [TRUE,(groupIconsVisible select 1)];
                        };
                    };
                };
            } else {
                if (_groupIconsVisibleMap) then {
                    if (groupIconsVisible select 0) then {
                        setGroupIconsVisible [FALSE,(groupIconsVisible select 1)];
                    };
                };
            };
            uiSleep 0.1;
        };
    };
};
