#include "script_component.hpp"

if (GVAR(requireGPSItemGroup) && !(call FUNC(hasGPSDevice))) exitWith {setGroupIconsVisible [FALSE,FALSE];};

private _grp = grpNull;
private _sides = [EAST,WEST,RESISTANCE,CIVILIAN];
private _grpLeader = objNull;
if (!(playerSide isEqualTo CIVILIAN) && !(GVAR(showCivilianIcons))) then {
    _sides = [EAST,WEST,RESISTANCE];
};
private _as = [];
_as pushBack GVAR(playerFaction);
{
	_as pushBack (_sides select _x);
} forEach GVAR(showFriendlySides);

if (GVAR(friendlySidesDynamic)) then {
	if (diag_tickTime > GVAR(checkDiplomacy)) then {
		_as = [];
		{
			if ((GVAR(playerFaction) getFriend _x) > 0.6) then {
				_as pushBack _x;
			};
		} forEach _sides;
		GVAR(checkDiplomacy) = diag_tickTime + 10;
	};
};
if (diag_tickTime > GVAR(groupUpdateDelay)) then {
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
	} forEach allGroups;
	GVAR(groupUpdateDelay) = diag_tickTime + 5;
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
