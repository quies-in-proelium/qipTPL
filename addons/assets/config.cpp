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
        author = "";
        authors[] = {""};
        VERSION_CONFIG;
    };
};

#include "CfgMusic.hpp"
#include "CfgRadio.hpp"
#include "CfgSounds.hpp"
#include "CfgUnitInsignia.hpp"
