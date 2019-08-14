#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {
            "qiptpl_main"
        };
        author = "NemesisRE";
        authors[] = {"BlauBär"};
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"
#include "Dialog.hpp"
