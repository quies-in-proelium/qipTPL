#include "script_component.hpp"

if (isNil QGVAR(qipTPL_enabled) || !(GVAR(qipTPL_enabled))) exitWith {};

call FUNC(applyLoadout);
call FUNC(CuratorObjectPlaced);
