#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {
            "qipTPL_main"
        };
        author = "NemesisRE";
        authors[] = {"BlauBär"};
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"

// UI stuff
class RscText;
class RscListbox;
class RscButton;
#include "transporterUI.hpp"
