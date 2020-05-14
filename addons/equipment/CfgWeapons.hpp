class CfgWeapons {
    class optic_Nightstalker;
    class InventoryOpticsItem_Base_F;
    class ACE_Vector;

    class qipTPL_Vector_Designator: ACE_Vector {
        author = "NemesisRE";
        displayName = "[qip] ACE Vector 21 (Laser Designator)";
        descriptionShort = "Rangefinder/Designator";
        simulation = "weapon";
        magazines[] = {"Laserbatteries"};
        cursor = "laserDesignator";
        cursorAim = "EmptyCursor";
        cursorAimOn = "CursorAimOn";
        showSwitchAction = 1;
        weaponInfoType = "qipTPL_RscOptics_vector";
        class WeaponSlotsInfo {
            mass = 20;
        };
        Laser = 1;
        visionMode[] = {"Normal","NVG","TI"};
        thermalMode[] = {0};
        opticsZoomMin = 0.0099999998;
        opticsZoomMax = 0.050000001;
        opticsZoomInit = 0.050000001;
        distanceZoomMin = 100;
        distanceZoomMax = 2300;
        minRange = 150;
        midRange = 500;
        maxRange = 5000;
    };

    class qipTPL_optic_Nightstalker: optic_Nightstalker {
        author="NemesisRE";
        displayName="[qip] Nightstalker";
        descriptionShort = "Nightstalker Sight<br />Magnification: 1x-10x";
        class ItemInfo: InventoryOpticsItem_Base_F {
            mass=12;
            opticType=1;
            optics=1;
            modelOptics="\A3\Weapons_f\acc\reticle_nightstalker_F";
            class OpticsModes {
                class NCTALKEP {
                    opticsID = 1;
                    useModelOptics = 1;
                    opticsPPEffects[] = {"OpticsCHAbera1","OpticsBlur1"};
                    opticsZoomMin = "0.25/1";
                    opticsZoomMax = "0.25/10";
                    opticsZoomInit = "0.25/10";
                    distanceZoomMin = 100;
                    distanceZoomMax = 1600;
                    discreteDistance[] = {100,200,300,400,500,600,700,800,900,1000,1100,1200,1300,1400,1500,1600};
                    discreteDistanceInitIndex = 1;
                    discreteFOV[] = {
                        "0.25/1","0.25/2","0.25/3","0.25/4","0.25/5",
                        "0.25/6","0.25/7","0.25/8","0.25/9","0.25/10"
                    };
                    discreteInitIndex = 0;
                    memoryPointCamera = "opticView";
                    visionMode[] = {"Normal","NVG","Ti"};
                    thermalMode[] = {0};
                    opticsFlare = 1;
                    opticsDisablePeripherialVision = 1;
                    cameraDir="";
                };
                class Iron: NCTALKEP {
                    opticsID = 2;
                    useModelOptics = 0;
                    opticsPPEffects[] = {"",""};
                    opticsFlare = 0;
                    opticsDisablePeripherialVision = 0;
                    discreteDistance[] = {200};
                    discreteDistanceInitIndex = 0;
                    opticsZoomMin = 0.25;
                    opticsZoomMax = 1.25;
                    opticsZoomInit = 0.75;
                    memoryPointCamera = "eye";
                    visionMode[] = {};
                };
            };
        };
        inertia=0.2;
    };
};
