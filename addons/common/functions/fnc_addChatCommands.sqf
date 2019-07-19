#include "script_component.hpp"

[QGVAR(giveZeus), {
    [_this select 1] call FUNC(addZeus);
}] call CBA_fnc_addEventHandler;
["zeus", {
    systemChat "Zeus wird angefordert...";
    [QGVAR(giveZeus), [qipTPL_unit]] call CBA_fnc_serverEvent;
}, "adminLogged"] call CBA_fnc_registerChatCommand;
