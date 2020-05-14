class CfgVehicles {
    class ACE_Item_Vector;
    class Item_optic_Nightstalker;

    class qipTPL_Item_Vector_Designator: ACE_Item_Vector {
        author = "NemessisRE";
        displayName = "[qip] ACE Vector 21 (Laser Designator)";
        class TransportItems {
            class qipTPL_Vector_Designator {
                name="qipTPL_Vector_Designator";
                count=1;
            };
        };
    };

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

    class Box_NATO_Support_F;
    class ACE_Box_Misc: Box_NATO_Support_F {
        class TransportItems {
            class qipTPL_Vector_Designator {
                name="qipTPL_Vector_Designator";
                count=3;
            };
        };
    };
};
