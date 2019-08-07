#include "script_component.hpp"

private _grp = grpNull;
private _sides = [EAST,WEST,RESISTANCE,CIVILIAN];
private _grpLeader = objNull;
private _refreshGroups = FALSE;
if (!(GVAR(showCivilianGroups))) then {
	_sides deleteAt 3;
};
private _groupUpdateDelay_timer = 5;
private _groupUpdateDelay = diag_tickTime + _groupUpdateDelay_timer;
private _checkDiplomacy_delay = 10;
private _checkDiplomacy = diag_tickTime + _checkDiplomacy_delay;
private _as = [];
_as pushBack (_sides select GVAR(playerFaction));
if (!isNil QGVAR(showFriendlySides)) then {
	{
		_as pushBack (_sides select _x);
	} forEach GVAR(showFriendlySides);
};

for '_x' from 0 to 1 step 0 do {
	if (GVAR(friendlySidesDynamic)) then {
		if (diag_tickTime > _checkDiplomacy) then {
			_as = [];
			{
				if (((_sides select GVAR(playerFaction)) getFriend _x) > 0.6) then {
					_as pushBack _x;
				};
			} forEach _sides;
			_checkDiplomacy = diag_tickTime + _checkDiplomacy_delay;
		};
	};
	if (diag_tickTime > _groupUpdateDelay) then {
		{
			_grp = _x;
			if ((GVAR(showOwnGroup)) || {((!(GVAR(showOwnGroup))) && (!(_grp isEqualTo (group player))))} || (!(GVAR(enableUnitIconsMap)))) then {
				if (({(alive _x)} count (units _grp)) > 0) then {
					if ((side _grp) in _as) then {
						_grpLeader = leader _grp;
						if (GVAR(showAIGroups)) then {
							if (isNil {_grp getVariable QGVAR(group)}) then {
								if (!isNull _grp) then {
									if (!isNull _grpLeader) then {
										[_grp,0] call FUNC(configGroupIcon);
									};
								};
							} else {
								if (!isNull _grp) then {
									if (!isNull _grpLeader) then {
										[_grp,1] call FUNC(configGroupIcon);
									};
								};
							};
						} else {
							if (isPlayer _grpLeader) then {
								if (isNil {_grp getVariable QGVAR(group)}) then {
									if (!isNull _grp) then {
										if (!isNull _grpLeader) then {
											[_grp,0] call FUNC(configGroupIcon);
										};
									};
								} else {
									if (!isNull _grp) then {
										if (!isNull _grpLeader) then {
											[_grp,1] call FUNC(configGroupIcon);
										};
									};
								};
							};
						};
					} else {
						if (!isNil {_grp getVariable QGVAR(groupIcon)}) then {
							[_grp,2] call FUNC(configGroupIcon);
						};
					};
				} else {
					if (!isNil {_grp getVariable QGVAR(groupIcon)}) then {
						[_grp,2] call FUNC(configGroupIcon);
					};
				};
			};
			uiSleep ([0.05,0.01] select _refreshGroups);
		} forEach allGroups;
		if (_refreshGroups) then {
			_refreshGroups = FALSE;
		};
		_groupUpdateDelay = diag_tickTime + _groupUpdateDelay_timer;
	};
	if (GVAR(requireGPSItemGroup)) then {
		if (!(call FUNC(hasGPSDevice))) then {
			setGroupIconsVisible [FALSE,FALSE];
			waitUntil {
				uiSleep 0.25;
				call FUNC(hasGPSDevice);
			};
		};
	};

	if ((!(visibleMap)) && (isNull ((findDisplay 160) displayCtrl 51)) && (isNull ((findDisplay -1) displayCtrl 500)) && (isNull (((findDisplay -1) displayCtrl 40))) && (isNull (((findDisplay -1) displayCtrl 41)))) then {
		waitUntil {
			uiSleep 0.25;
			((visibleMap) || {(!isNull ((findDisplay 160) displayCtrl 51))} || {(!isNull ((findDisplay -1) displayCtrl 500))} || {(!isNull (((findDisplay -1) displayCtrl 40)))} || {(!isNull (((findDisplay -1) displayCtrl 41)))})
		};
		_refreshGroups = TRUE;
	};
	if ((visibleMap) || {(!isNull ((findDisplay 160) displayCtrl 51))} || {(!isNull ((findDisplay -1) displayCtrl 500))} || {(!isNull (((findDisplay -1) displayCtrl 40)))} || {(!isNull (((findDisplay -1) displayCtrl 41)))}) then {
		if ((ctrlMapScale ((findDisplay 12) displayCtrl 51)) isEqualTo 1) then {
			if (groupIconsVisible select 0) then {
				setGroupIconsVisible [FALSE,(groupIconsVisible select 1)];
			};
		} else {
			if (GVAR(showGroupMapIcons)) then {
				if (!(groupIconsVisible select 0)) then {
					setGroupIconsVisible [TRUE,(groupIconsVisible select 1)];
				};
			};
		};
	} else {
		if (GVAR(showGroupMapIcons)) then {
			if (groupIconsVisible select 0) then {
				setGroupIconsVisible [FALSE,(groupIconsVisible select 1)];
			};
		};
	};
	uiSleep 0.1;
};
