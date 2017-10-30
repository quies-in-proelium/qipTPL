#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"qiptpl_assets"};
        author = "NemesisRE";
        authors[] = {};
        authorUrl = "https://nrecom.net";
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"
#include "CfgModuleCategories.hpp"
#include "CfgFunctions.hpp"
#include "CfgIdentities.hpp"
#include "CfgRespawnTemplates.hpp"
