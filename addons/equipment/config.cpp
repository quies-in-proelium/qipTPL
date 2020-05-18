#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {
            "qipTPL_Item_Vector_Designator",
            "qipTPL_Item_optic_Nightstalker",
            "qipTPL_Item_optic_AMS",
            "qipTPL_Item_optic_AMS_khk",
            "qipTPL_Item_optic_AMS_snd"
        };
        weapons[] = {
            "qipTPL_Vector_Designator",
            "qipTPL_optic_Nightstalker",
            "qipTPL_optic_AMS_base",
            "qipTPL_optic_AMS",
            "qipTPL_optic_AMS_khk",
            "qipTPL_optic_AMS_snd"
        };
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {
            "qipTPL_main",
            "ace_vector",
            "A3_Weapons_F",
            "cba_jr"
        };
        author = "";
        authors[] = {""};
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"
#include "CfgVehicles.hpp"
#include "CfgWeapons.hpp"
#include "jr_classes.hpp"
#include "RscInGameUI.hpp"
