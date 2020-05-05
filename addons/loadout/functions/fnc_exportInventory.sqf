#include "script_component.hpp"
/*
	Author: NemesisRE

	Description:
	Export unit's loadout qipTPL Style

	Returns:
	STRING - Class code
*/
params ["_unit"];
private ["_br","_tab","_fnc_addArray","_export"];

if (isNil "_unit") then {
	_unit = qipTPL_unit;
};
_br = tostring [13,10];
_tab = toString [9];
_fnc_addArray = {
    params ["_name", "_array"];

    _export = _export + _tab + format ["%1[] = {",_name];
    {
        if (_foreachindex > 0) then {_export = _export + ",";};
        _export = _export + format ["""%1""",_x];
    } foreach _array;
    _export = _export + "};" + _br;
};

_export = "";
_export = _export + format ["// Exported with qipTPL by %1",profilename] + _br;
_export = _export + format ["class %1 {",typeof vehicle _unit] + _br;
_export = _export + _tab + "items[] = {};" + _br;
_export = _export + _tab + "magazines[] = {};" + _br;
_export = _export + _tab + format ["uniform = ""%1"";",uniform _unit] + _br;
["addItemsToUniform",uniformitems _unit] call _fnc_addArray;
_export = _export + _tab + format ["vest = ""%1"";",vest _unit] + _br;
["addItemsToVest",vestitems _unit] call _fnc_addArray;
_export = _export + _tab + format ["backpack = ""%1"";",backpack _unit] + _br;
["addItemsToBackpack",backpackitems _unit] call _fnc_addArray;
_export = _export + _tab + format ["headgear = ""%1"";",headgear _unit] + _br;
_export = _export + _tab + format ["goggles = ""%1"";",goggles _unit] + _br;
_export = _export + _tab + format ["nvgoggles = ""%1"";",hmd _unit] + _br;
_export = _export + _tab + format ["binoculars = ""%1"";",binocular _unit] + _br;
_export = _export + _tab + format ["primaryWeapon = ""%1"";",primaryWeapon _unit] + _br;
["primaryWeaponAttachments",_unit weaponAccessories primaryWeapon _unit] call _fnc_addArray;
_export = _export + _tab + format ["secondaryWeapon = ""%1"";",secondaryweapon _unit] + _br;
["secondaryWeaponAttachments",_unit weaponAccessories secondaryweapon _unit] call _fnc_addArray;
_export = _export + _tab + format ["handgunWeapon = ""%1"";",handgunweapon _unit] + _br;
["handgunWeaponAttachments",_unit weaponAccessories handgunweapon _unit] call _fnc_addArray;
["linkedItems",assigneditems _unit - [binocular _unit, hmd _unit]] call _fnc_addArray;
_export = _export + "};" + _br;
//--- Export to clipboard
_export spawn {copytoclipboard _this;};
hint localize "STR_a3_RscDisplayArsenal_message_clipboard";
