class CfgVehicles {
    class TFAR_rt1523g;    // External class reference
    class TFAR_mr3000;
    class TFAR_anprc155;

    class qip_kitbag_khaki_west : TFAR_rt1523g {
        author = "NemesisRE";
        displayName = "[qip] Kitbag Radio Green (West)";
        model = "\A3\weapons_f\Ammoboxes\bags\Backpack_Fast";
        hiddenSelections[] = {"camo"};
        hiddenSelectionsTextures[] = {"\A3\weapons_f\ammoboxes\bags\data\backpack_fast_rgr_co.paa"};
        maximumLoad = 200;
        mass = 130;
    };

    class qip_kitbag_coyote_west : qip_kitbag_khaki_west {
        displayName = "[qip] Kitbag Radio Coyote (West)";
        hiddenSelectionsTextures[] = {"\A3\weapons_f\ammoboxes\bags\data\backpack_fast_cbr_co.paa"};
    };

    class qip_kitbag_winter_west : qip_kitbag_khaki_west {
        displayName = "[qip] Kitbag Radio Winter (West)";
        hiddenSelectionsTextures[] = {QPATHTOF(data\textures\kitbag_wte.paa)};
    };

    class qip_kitbag_black_west : qip_kitbag_khaki_west {
        displayName = "[qip] Kitbag Radio Black (West)";
        hiddenSelectionsTextures[] = {"\a3\weapons_f\ammoboxes\bags\data\backpack_fast_blk_co.paa"};
    };

    class qip_kitbag_khaki_east : TFAR_mr3000 {
        author = "NemesisRE";
        displayName = "[qip] Kitbag Radio Green (East)";
        model = "\A3\weapons_f\Ammoboxes\bags\Backpack_Fast";
        hiddenSelections[] = {"camo"};
        hiddenSelectionsTextures[] = {"\A3\weapons_f\ammoboxes\bags\data\backpack_fast_rgr_co.paa"};
        maximumLoad = 200;
        mass = 130;
    };

    class qip_kitbag_coyote_east : qip_kitbag_khaki_east {
        displayName = "[qip] Kitbag Radio Coyote (East)";
        hiddenSelectionsTextures[] = {"\A3\weapons_f\ammoboxes\bags\data\backpack_fast_cbr_co.paa"};
    };

    class qip_kitbag_winter_east : qip_kitbag_khaki_east {
        displayName = "[qip] Kitbag Radio Winter (East)";
        hiddenSelectionsTextures[] = {QPATHTOF(data\textures\kitbag_wte.paa)};
    };

    class qip_kitbag_black_east : qip_kitbag_khaki_east {
        displayName = "[qip] Kitbag Radio Black (East)";
        hiddenSelectionsTextures[] = {"\a3\weapons_f\ammoboxes\bags\data\backpack_fast_blk_co.paa"};
    };

    class qip_kitbag_khaki_independent : TFAR_anprc155 {
        author = "NemesisRE";
        displayName = "[qip] Kitbag Radio Green (Independent)";
        model = "\A3\weapons_f\Ammoboxes\bags\Backpack_Fast";
        hiddenSelections[] = {"camo"};
        hiddenSelectionsTextures[] = {"\A3\weapons_f\ammoboxes\bags\data\backpack_fast_rgr_co.paa"};
        maximumLoad = 200;
        mass = 130;
    };

    class qip_kitbag_coyote_independent : qip_kitbag_khaki_independent {
        displayName = "[qip] Kitbag Radio Coyote (Independent)";
        hiddenSelectionsTextures[] = {"\A3\weapons_f\ammoboxes\bags\data\backpack_fast_cbr_co.paa"};
    };

    class qip_kitbag_winter_independent : qip_kitbag_khaki_independent {
        displayName = "[qip] Kitbag Radio Winter (Independent)";
        hiddenSelectionsTextures[] = {QPATHTOF(data\textures\kitbag_wte.paa)};
    };

    class qip_kitbag_black_independent : qip_kitbag_khaki_independent {
        displayName = "[qip] Kitbag Radio Black (Independent)";
        hiddenSelectionsTextures[] = {"\a3\weapons_f\ammoboxes\bags\data\backpack_fast_blk_co.paa"};
    };

    // For older Missions
    class talon_kitbag_khaki: qip_kitbag_khaki_west {
        scope = 1;
        scopeCurator = 1;
        scopeArsenal = 1;
    };

    class talon_kitbag_coyote: qip_kitbag_coyote_west {
        scope = 1;
        scopeCurator = 1;
        scopeArsenal = 1;
    };

    class talon_kitbag_winter: qip_kitbag_winter_west {
        scope = 1;
        scopeCurator = 1;
        scopeArsenal = 1;
    };
};
