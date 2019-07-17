/*
	Author: NemesisRE

	Description:
	Shows initialization message

*/
#include "script_component.hpp"

private ["_unit","_unitName","_cnt","_timerInput","_timer","_halfTime","_uavIntro","_initMsg","_postInitMsg", "_uavIntroPosition"];
_unitName = name qipTPL_unit;
_cnt = 0;
_timerInput = qipTPL_missionInitTime; // Mission Init time counter. Min 30 secs. Add 1 sec per 2 players. 10 players = 35 secs.
_timer = _timerInput / 100;
_cntStop = -1;

if ( vehicle qipTPL_unit == qipTPL_unit ) then {
    if (mod_ACE3) then {
        [qipTPL_unit, currentWeapon qipTPL_unit, currentMuzzle qipTPL_unit] call ACE_SafeMode_fnc_lockSafety;
    };
    if ( primaryWeapon qipTPL_unit != "" ) then {
        qipTPL_unit playMove "AmovPercMstpSlowWrflDnon";
    } else {
        if ( handgunWeapon qipTPL_unit != "" ) then {
            qipTPL_unit playMove "AmovPercMstpSrasWpstDnon_AmovPercMstpSrasWlnrDnon";
        };
    };
};

if (qipTPL_uavIntro) then {
    _uavIntro = [] call FUNC(uavIntro);
} else {
    _uavIntro = 0 spawn {};
};

while {(_cnt != 100)} do {
    _cnt = _cnt + 1;

    _initMsg = format ["
        <br/>
        <t align='left' size='1.2' color='#F7D358'>Missions Initialsierung:</t><br/>
        <t align='left' size='1.1' color='#CCA9A9' font='PuristaBold'>%1&#0037; abgeschlossen</t><br/><br/>
        <t align='left' color='#CCA9A9'>Hallo %3,</t><br/>
        <t align='left' color='#CCA9A9'>die Initialisierung dauert etwa %2 Sekunden. Währenddessen solltest du dich nicht bewegen oder andere Aktionen durchführen.</t><br/>
        <br/>
    ", _cnt,_TimerInput,_unitName];

    sleep _timer;
    if (scriptDone _uavIntro) then {
        hintSilent parseText _initMsg;
        if (_cntStop == -1) then {
            _cntStop = _cnt;
            [
                "<img size='8' shadow='false' image='" + qipTPL_clanLogo + "'/><br/><br/><t size='.7' color='#FFFFFF'>Mission presented by " + qipTPL_clanName + "</t>",
                0,
                0,
                5,
                ((100 - _cntStop) * _timer)
            ] spawn BIS_fnc_dynamicText;
        };
    };
};

_postInitMsg = format ["
    <br/>
    <t align='left' size='1.2' color='#F7D358'>Missions Initialsierung:</t><br/>
    <t align='left' size='1.1' color='#A9CCA9' font='PuristaBold'>Vollständig abgeschlossen</t><br/><br/>
    <t align='left' color='#FFFFFF'>Viel Spaß und denkt daran:</t><br/>
    <t align='left' color='#A1A4AD'>- Folgt den Befehlen eures Teamleiters.</t><br/>
    <t align='left' color='#A1A4AD'>- Sichert und senkt eure Waffe.</t><br/>
    <t align='left' color='#A1A4AD'>- Haltung bewahren, wenn angebracht.</t><br/>
    <t align='left' color='#A1A4AD'>- Verwendet nicht den Chat.</t><br/>
    <br/>
"];

hint parseText _postInitMsg;
sleep 5;

hintSilent "";
