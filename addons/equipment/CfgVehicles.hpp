class CfgVehicles {
    class ACE_Item_Vector;

    class qipTPL_Item_Vector_Designator: ACE_Item_Vector {
        author = "NemessisRE";
        displayName = "[qip] ACE Vector Designator (NVG/TI)";
        class TransportItems {
            class qipTPL_Vector_Designator {
                name="qipTPL_Vector_Designator";
                count=1;
            };
        };
    };

    class qipTPL_Item_Vector_Designator_NVG: qipTPL_Item_Vector_Designator {
        displayName = "[qip] ACE Vector Designator (NVG)";
        class TransportItems {
            class qipTPL_Vector_Designator {
                name="qipTPL_Vector_Designator_NVG";
                count=1;
            };
        };
    };

    class Item_optic_Nightstalker;
    class qipTPL_Item_optic_Nightstalker: Item_optic_Nightstalker {
        displayName="[qip] Nightstalker";
        author="NemesisRE";
        vehicleClass="WeaponAccessories";
        class TransportItems {
            class qipTPL_optic_Nightstalker {
                name="qipTPL_optic_Nightstalker";
                count=1;
            };
        };
    };

    class Item_optic_AMS;
    class qipTPL_Item_optic_AMS: Item_optic_AMS {
        displayName="[qip] AMS (Black)";
        author="NemesisRE";
        class TransportItems {
            class qipTPL_optic_AMS {
                name="qipTPL_optic_AMS";
                count=1;
            };
        };
    };
    class qipTPL_Item_optic_AMS_khk: qipTPL_Item_optic_AMS {
        displayName="[qip] AMS (Khaki)";
        class TransportItems {
            class qipTPL_optic_AMS_khk {
                name="qipTPL_optic_AMS_khk";
                count=1;
            };
        };
    };
    class qipTPL_Item_optic_AMS_snd: qipTPL_Item_optic_AMS {
        displayName="[qip] AMS (Sand)";
        class TransportItems {
            class qipTPL_optic_AMS_snd {
                name="qipTPL_optic_AMS_snd";
                count=1;
            };
        };
    };
    class qipTPL_Item_optic_AMSTI: Item_optic_AMS {
        displayName="[qip] AMS-TI (Black)";
        author="NemesisRE";
        class TransportItems {
            class qipTPL_optic_AMS {
                name="qipTPL_optic_AMSTI";
                count=1;
            };
        };
    };
    class qipTPL_Item_optic_AMSTI_khk: qipTPL_Item_optic_AMSTI {
        displayName="[qip] AMS-TI (Khaki)";
        class TransportItems {
            class qipTPL_optic_AMS_khk {
                name="qipTPL_optic_AMSTI_khk";
                count=1;
            };
        };
    };
    class qipTPL_Item_optic_AMSTI_snd: qipTPL_Item_optic_AMSTI {
        displayName="[qip] AMS-TI (Sand)";
        class TransportItems {
            class qipTPL_optic_AMS_snd {
                name="qipTPL_optic_AMSTI_snd";
                count=1;
            };
        };
    };

    class Box_NATO_Support_F;
    class ACE_Box_Misc: Box_NATO_Support_F {
        class TransportItems {
            class qipTPL_Vector_Designator {
                name="qipTPL_Vector_Designator_NVG";
                count=3;
            };
        };
    };
};
