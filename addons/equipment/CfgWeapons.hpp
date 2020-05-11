class CfgWeapons {
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
};
