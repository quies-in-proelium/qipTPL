#include "script_component.hpp"

params ["_unit"];
private ["_units","_configPath","_unitVar","_unitRole"];

if (isNil QEGVAR(common,qipTPL_enabled) || !(EGVAR(common,qipTPL_enabled))) exitWith {};
if !(GVAR(enableLoadout)) exitWith {};

_units = [];
_configPath = missionConfigFile >> "CfgLoadouts";

if ( !isNil "_unit"  && { _unit isKindOf "CAManBase" } ) then {
    _units pushBack _unit;
} else {
    {
        if ( local _x ) then {
            _units pushBack _x;
        };
    } forEach allUnits;
};

INFO_1("Apply Loadout running for %1", _units);

{
    // General --------------------------------------------------------------------------------------
    // Every single unit
    if( isClass ( _configPath >> "AllUnits" )) then {
        [_configPath >> "AllUnits", _x] call FUNC(doLoadout);
    };

    // All AI units
    if( !isPlayer _x && { isClass ( _configPath >> "AllAi" )}) then {
        [_configPath >> "AllAi", _x] call FUNC(doLoadout);
    };

    // All players
    if( isPlayer _x && { isClass ( _configPath >> "AllPlayers" )}) then {
        [_configPath >> "AllPlayers", _x] call FUNC(doLoadout);
    };

    // General sides --------------------------------------------------------------------------------
    // All blufor units
    if( side _x == blufor && { isClass ( _configPath >> "Blufor" )}) then {
        [_configPath >> "Blufor", _x] call FUNC(doLoadout);
    };

    // All opfor units
    if( side _x == opfor && { isClass ( _configPath >> "Opfor" )}) then {
        [_configPath >> "Opfor", _x] call FUNC(doLoadout);
    };

    // All independent units
    if( side _x == independent && { isClass ( _configPath >> "Independent" )}) then {
        [_configPath >> "Independent", _x] call FUNC(doLoadout);
    };

    // All civilian units
    if( side _x == civilian && { isClass ( _configPath >> "Civilian" )}) then {
        [_configPath >> "Civilian", _x] call FUNC(doLoadout);
    };

    // AI sides -------------------------------------------------------------------------------------
    // All blufor AI units
    if( side _x == blufor && { !isPlayer _x } && { isClass ( _configPath >> "BluforAi" )}) then {
        [_configPath >> "BluforAi", _x] call FUNC(doLoadout);
    };

    // All opfor AI units
    if( side _x == opfor && { !isPlayer _x } && { isClass ( _configPath >> "OpforAi" )}) then {
        [_configPath >> "OpforAi", _x] call FUNC(doLoadout);
    };

    // All independent AI units
    if( side _x == independent && { !isPlayer _x } && { isClass ( _configPath >> "IndependentAi" )}) then {
        [_configPath >> "IndependentAi", _x] call FUNC(doLoadout);
    };

    // All civilian AI units
    if( side _x == civilian && { !isPlayer _x } && { isClass ( _configPath >> "CivilianAi" )}) then {
        [_configPath >> "CivilianAi", _x] call FUNC(doLoadout);
    };

    // Player sides ---------------------------------------------------------------------------------
    // All blufor units
    if( side _x == blufor && { isPlayer _x } && { isClass ( _configPath >> "BluforPlayers" )}) then {
        [_configPath >> "BluforPlayers", _x] call FUNC(doLoadout);
    };

    // All opfor units
    if( side _x == opfor && { isPlayer _x } && { isClass ( _configPath >> "OpforPlayers" )}) then {
        [_configPath >> "OpforPlayers", _x] call FUNC(doLoadout);
    };

    // All independent units
    if( side _x == independent && { isPlayer _x } && { isClass ( _configPath >> "IndependentPlayers" )}) then {
        [_configPath >> "IndependentPlayers", _x] call FUNC(doLoadout);
    };

    // All civilian units
    if( side _x == civilian && { isPlayer _x } && { isClass ( _configPath >> "CivilianPlayers" )}) then {
        [_configPath >> "CivilianPlayers", _x] call FUNC(doLoadout);
    };

    // Class & Unique -------------------------------------------------------------------------------
    // Class based loadouts
    if( isClass ( _configPath >> typeof _x )) then {
        [_configPath >> typeof _x, _x] call FUNC(doLoadout);
    };

    // Roledescription based loadouts
    _unitRole = roleDescription _x splitString " " joinString "";
    if( isClass ( _configPath >> _unitRole )) then {
        [_configPath >> _unitRole, _x] call FUNC(doLoadout);
    };

    // Name based loadouts
    if (["Spieler", str _x] call BIS_fnc_inString) then {
        _unitVar = str _x splitString "_" select 1;
    } else {
        _unitVar = str _x splitString "_" select 0;
    };
    if( isClass ( _configPath >> _unitVar )) then {
        [_configPath >> _unitVar, _x] call FUNC(doLoadout);
    };
} forEach _units;
