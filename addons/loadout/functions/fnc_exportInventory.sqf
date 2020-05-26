#include "script_component.hpp"
/*
    Author: NemesisRE

    Description:
    Export unit's loadout qipTPL Style

    Returns:
    STRING - Class code
*/
params ["_unit"];
private ["_tab","_fnc_addArray","_export","_chestpack"];

if (isNil "_unit") then {
    _unit = qipTPL_unit;
};
_tab = toString [9];
_fnc_addArray = {
    params ["_name", "_array"];

    _export = _export + _tab + format ["%1[] = {",_name];
    {
        if (_foreachindex > 0) then {_export = _export + ",";};
        if (typeName _x == "ARRAY") then {
            _export = _export + str (str _x);
        } else {
            _export = _export + str _x;
        };
    } foreach _array;
    _export = _export + "};" + endl;
};

_export = "";
_export = _export + format ["// Exported with qipTPL by %1",profilename] + endl;
_export = _export + format ["class %1 {",typeof vehicle _unit] + endl;
_export = _export + _tab + "items[] = {};" + endl;
_export = _export + _tab + "magazines[] = {};" + endl;
_export = _export + _tab + format ["uniform = ""%1"";",uniform _unit] + endl;
["addItemsToUniform",uniformitems _unit] call _fnc_addArray;
_export = _export + _tab + format ["vest = ""%1"";",vest _unit] + endl;
["addItemsToVest",vestitems _unit] call _fnc_addArray;
_export = _export + _tab + format ["backpack = ""%1"";",backpack _unit] + endl;
["addItemsToBackpack",backpackitems _unit] call _fnc_addArray;
_export = _export + _tab + format ["headgear = ""%1"";",headgear _unit] + endl;
_export = _export + _tab + format ["goggles = ""%1"";",goggles _unit] + endl;
_export = _export + _tab + format ["nvgoggles = ""%1"";",hmd _unit] + endl;
_export = _export + _tab + format ["binoculars = ""%1"";",binocular _unit] + endl;
_export = _export + _tab + format ["primaryWeapon = ""%1"";",primaryWeapon _unit] + endl;
["primaryWeaponAttachments",_unit weaponAccessories primaryWeapon _unit] call _fnc_addArray;
_export = _export + _tab + format ["secondaryWeapon = ""%1"";",secondaryweapon _unit] + endl;
["secondaryWeaponAttachments",_unit weaponAccessories secondaryweapon _unit] call _fnc_addArray;
_export = _export + _tab + format ["handgunWeapon = ""%1"";",handgunweapon _unit] + endl;
["handgunWeaponAttachments",_unit weaponAccessories handgunweapon _unit] call _fnc_addArray;
["linkedItems",assigneditems _unit - [binocular _unit, hmd _unit]] call _fnc_addArray;
if !([_unit] call EFUNC(boc,chestpack) isEqualTo "") then {
    _chestpack = [];
    _chestpack set [0, ((_unit getVariable [QEGVAR(boc,chestpack), []]) select 0) select 0];
    _chestpack set [1, (_unit getVariable [QEGVAR(boc,chestpack), []]) select 2];
    ["chestpack",_chestpack] call _fnc_addArray;
};
_export = _export + "};" + endl;
//--- Export to clipboard
"ace_clipboard" callExtension _export;
hint localize "STR_a3_RscDisplayArsenal_message_clipboard";

_export
