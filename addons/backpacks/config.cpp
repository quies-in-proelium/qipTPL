#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {
            "talon_kitbag_coyote",
            "talon_kitbag_winter",
            "talon_kitbag_khaki",
            "qip_kitbag_khaki_west",
            "qip_kitbag_coyote_west",
            "qip_kitbag_winter_west",
            "qip_kitbag_khaki_east",
            "qip_kitbag_coyote_east",
            "qip_kitbag_winter_east",
            "qip_kitbag_khaki_independent",
            "qip_kitbag_coyote_independent",
            "qip_kitbag_winter_independent"
        };
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {
            "qiptpl_main",
            "A3_Modules_F",
            "A3_UI_F",
            "A3_Structures_F_Items_Electronics",
            "A3_Weapons_F_ItemHolders",
            "tfar_backpacks"
        };
        author = "NemesisRE";
        authors[] = {""};
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"
#include "CfgVehicles.hpp"
