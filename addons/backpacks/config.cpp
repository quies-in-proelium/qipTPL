#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {
            "qip_TFAR_anarc210_ilbe",
            "qip_ilbe_marpatwd_west",
            "qip_ilbe_marpatd_west",
            "qip_ilbe_coyote_west",
            "qip_ilbe_khaki_west",
            "qip_TFAR_mr6000l_ilbe",
            "qip_ilbe_marpatwd_east",
            "qip_ilbe_marpatd_east",
            "qip_ilbe_coyote_east",
            "qip_ilbe_khaki_east",
            "qip_TFAR_anarc164_ilbe",
            "qip_ilbe_marpatwd_independent",
            "qip_ilbe_marpatd_independent",
            "qip_ilbe_coyote_independent",
            "qip_ilbe_khaki_independent",
            "talon_kitbag_coyote",
            "talon_kitbag_winter",
            "talon_kitbag_khaki",
            "qip_TFAR_rt1523g_kitbag",
            "qip_kitbag_khaki_west",
            "qip_kitbag_coyote_west",
            "qip_kitbag_winter_west",
            "qip_kitbag_black_west",
            "qip_TFAR_mr3000_kitbag",
            "qip_kitbag_khaki_east",
            "qip_kitbag_coyote_east",
            "qip_kitbag_winter_east",
            "qip_kitbag_black_east",
            "qip_TFAR_anprc155_kitbag",
            "qip_kitbag_khaki_independent",
            "qip_kitbag_coyote_independent",
            "qip_kitbag_winter_independent",
            "qip_kitbag_black_independent"
        };
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {
            "qipTPL_main",
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

#include "CfgVehicles.hpp"
