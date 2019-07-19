#include "script_component.hpp"

["zeus", {
    systemChat "Zeus wird angefordert...";
    [FUNC(addZeus), [player]] call CBA_fnc_serverEvent;
}, "adminLogged"] call CBA_fnc_registerChatCommand;
