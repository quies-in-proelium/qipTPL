// Argument 0 is module logic
_logic = [_this,0,objNull,[objNull]] call BIS_fnc_param;
// Argument 1 is list of affected units (affected by value selected in the 'class Units' argument))
//_units = [_this,1,[],[[]]] call BIS_fnc_param;
// True when the module was activated, false when it's deactivated (i.e., synced triggers are no longer active)
_activated = [_this,2,true,[true]] call BIS_fnc_param;

// Module specific behavior. Function can extract arguments from logic and use them.
if (_activated) then {
// quake loop
quakemoduleloop=compilefinal
	'
	private ["_delay","_fatiguedefault"];
	_quake=_this select 0;
	_delay=_this select 1;
	_qrange=_quake getvariable ["Range",400];
	if((_quake distance player)<=_qrange)then
	{
		_fatiguedefault = getFatigue player;
		//{((_x distance (getpos _quake))>_qrange)&&_damageunits=_damageunits+[_x]} foreach allunits;
		enableCamShake true;
		addcamshake [floor (random (20*_qrange)/((_quake distance player)+1+_qrange)),15,floor (random 100)];;
		player setFatigue (random _qrange/((_quake distance player)+1+_qrange));
		//[floor(random 4)+1] call bis_fnc_earthquake;
		sleep _delay;
		player setFatigue _fatiguedefault;
		enableCamShake false;
	};
'; // end quakeloop
if ismultiplayer then{publicvariable "quakemoduleloop"};

if isserver then{
_qrange=_logic getvariable ["Range",400]; //[_this, 0, 2, [0]] call BIS_fnc_param;
if(_qrange<=0)exitwith{hintsilent "error in range"};
while{_activated}do{
_delay=(floor (random 30)+15);
if ismultiplayer then{
[_logic,_delay] remoteexec ["quakemoduleloop",[0,-2] select isdedicated,true];
}else{
[_logic,_delay] spawn quakemoduleloop;
}; // ismultiplayer
playsound3d [format ["a3\sounds_f\environment\ambient\quakes\earthquake%1.wss",floor (random 4)+1],_logic]; //_quake say3d _sfx;
[getpos _logic,_qrange,floor (random 10000)] spawn bis_fnc_destroycity;
sleep _delay+1;
}; //while loop

}; // isserver

}; // if activated

// Module function is executed by spawn command, so returned value is not necessary.
// However, it's a good practice to include one.
true;
