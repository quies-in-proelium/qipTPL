#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"qiptpl_main"};
        author = "NemesisRE";
        authors[] = {"Quiksilver","ACE3"};
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"
#include "CfgMarkers.hpp"
#include "CfgMarkerColors.hpp"
