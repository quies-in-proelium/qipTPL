#include "script_component.hpp"

cbrn_maxDamage = 100; // how much damage before death, 50% starts internal contamination
cbrn_backpacks = ["B_SCBA_01_F",
"B_CombinationUnitRespirator_01_F"];
cbrn_suits = ["U_C_CBRN_Suit_01_Blue_F",
    "U_B_CBRN_Suit_01_MTP_F",
    "U_B_CBRN_Suit_01_Tropic_F",
    "U_C_CBRN_Suit_01_White_F",
    "U_B_CBRN_Suit_01_Wdl_F",
    "U_I_CBRN_Suit_01_AAF_F",
    "U_I_E_CBRN_Suit_01_EAF_F"];
cbrn_masks = ["G_AirPurifyingRespirator_02_black_F",
    "G_AirPurifyingRespirator_02_olive_F",
    "G_AirPurifyingRespirator_02_sand_F",
    "G_AirPurifyingRespirator_01_F",
    "G_RegulatorMask_F",
    "GP21_GasmaskPS",
    "GP5Filter_RaspiratorPS",
    "GP7_RaspiratorPS",
    "SE_M17",
    "Hamster_PS",
    "SE_S10"];
cbrn_threatMeteritem = "ChemicalDetector_01_watch_F";
cbrn_maxOxygenTime = 60 * 30;
cbrn_maxWaterTime = 60 * 2;

// do not edit below here unless you know what you are doing
if !(hasInterface) exitWith {};
cbrn_localZones = [];
cbrn_curThreat = 0;
cbrn_lastBeep = -1;
cbrn_beepVolume = 0;
cbrn_beep = true;
["cbrn_createZone", {
    params ["_pos", "_threatLevel", "_size", "_falloffArea"];
    private _trg = createTrigger ["EmptyDetector", _pos, false];
    _trg setVariable ["cbrn_zone", true];
    _trg enableDynamicSimulation false;
    _trg setVariable ["cbrn_active", true];
    _trg setVariable ["cbrn_threatLevel", _threatLevel];
    _trg setVariable ["cbrn_size", _size];
    _trg setVariable ["cbrn_falloffArea", _falloffArea];
    private _radius = _size + _falloffArea;
    _trg setTriggerArea [_radius, _radius, 0, false, _radius];
    _trg setTriggerActivation ["ANYPLAYER", "PRESENT", true];
    _trg setTriggerStatements ["thisTrigger getVariable ['cbrn_active',false] && {this && {(vehicle qipTPL_unit) in thisList}}", "[thisTrigger, qipTPL_unit, true] call cbrn_fnc_addZone", "[thisTrigger, qipTPL_unit, false] call cbrn_fnc_addZone"];
    cbrn_localZones pushBack _trg;
}] call CBA_fnc_addEventhandler;


// display gas mask overlay above ace nvg and below DUI
if !(isNil "ace_nightvision") then {
    "ace_nightvision_display" cutFadeOut 0;
};
"cbrn_gasmask_overlay" cutFadeOut 0;
if !(isNil "diwako_dui_radar") then {
    "diwako_dui_compass" cutFadeOut 0;
    "diwako_dui_namebox" cutFadeOut 0;
};
