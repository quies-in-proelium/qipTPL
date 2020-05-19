#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {
            "qipTPL_boc_moduleDisable",
            "qipTPL_boc_moduleAdd",
            "qipTPL_boc_moduleOnChest",
            "qipTPL_boc_weaponHolder"
        };
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {
            "qipTPL_main",
            "a3_ui_f",
            "A3_Modules_F",
            "ace_main",
            "ace_common"
        };
        author = "NemesisRE";
        authors[] = {"DerZade"};
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"
#include "CfgVehicles.hpp"
#include "CfgFactionClasses.hpp"
