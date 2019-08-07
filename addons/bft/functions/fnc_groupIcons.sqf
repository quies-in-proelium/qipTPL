#include "script_component.hpp"

private _grp = grpNull;
private _sides = [EAST,WEST,RESISTANCE,CIVILIAN];
private _grpLeader = objNull;
private _refreshGroups = FALSE;
if (!(QS_ST_showCivilianGroups)) then {
	_sides deleteAt 3;
};
private _groupUpdateDelay_timer = 5;
private _groupUpdateDelay = diag_tickTime + _groupUpdateDelay_timer;
private _checkDiplomacy_delay = 10;
private _checkDiplomacy = diag_tickTime + _checkDiplomacy_delay;
private _as = [];
_as pushBack (_sides select QS_ST_faction);
if (!isNil "QS_ST_showFriendlySides") then {
	{
		_as pushBack (_sides select _x);
	} forEach QS_ST_showFriendlySides;
};

for '_x' from 0 to 1 step 0 do {
	if (QS_ST_friendlySides_Dynamic) then {
		if (diag_tickTime > _checkDiplomacy) then {
			_as = [];
			{
				if (((_sides select QS_ST_faction) getFriend _x) > 0.6) then {
					_as pushBack _x;
				};
			} forEach _sides;
			_checkDiplomacy = diag_tickTime + _checkDiplomacy_delay;
		};
	};
	if (diag_tickTime > _groupUpdateDelay) then {
		{
			_grp = _x;
			if ((QS_ST_showOwnGroup) || {((!(QS_ST_showOwnGroup)) && (!(_grp isEqualTo (group player))))} || {(!(QS_ST_map_enableUnitIcons))}) then {
				if (({(alive _x)} count (units _grp)) > 0) then {
					if ((side _grp) in _as) then {
						_grpLeader = leader _grp;
						if (QS_ST_showAIGroups) then {
							if (isNil {_grp getVariable 'QS_ST_Group'}) then {
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
								if (isNil {_grp getVariable 'QS_ST_Group'}) then {
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
						if (!isNil {_grp getVariable 'QS_ST_Group_Icon'}) then {
							[_grp,2] call FUNC(configGroupIcon);
						};
					};
				} else {
					if (!isNil {_grp getVariable 'QS_ST_Group_Icon'}) then {
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
	if (QS_ST_GRPrequireGPSItem) then {
		if (!(call FUNC(hasGPSDevice))) then {
			setGroupIconsVisible [FALSE,FALSE];
			waitUntil {
				uiSleep 0.25;
				call FUNC(hasGPSDevice);
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
			if (QS_ST_showGroupMapIcons) then {
				if (!(groupIconsVisible select 0)) then {
					setGroupIconsVisible [TRUE,(groupIconsVisible select 1)];
				};
			};
		};
	} else {
		if (QS_ST_showGroupMapIcons) then {
			if (groupIconsVisible select 0) then {
				setGroupIconsVisible [FALSE,(groupIconsVisible select 1)];
			};
		};
	};
	uiSleep 0.1;
};
