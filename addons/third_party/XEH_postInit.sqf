#include "script_component.hpp"

if (isServer || !hasInterface) exitWith {};

call FUNC(initAddons);
call FUNC(initScripts);
