class CfgWeapons {
    class ACE_Vector;
    class ACE_Vector_Designator: ACE_Vector {
        author = "NemesisRE";
        displayName = "[qip] ACE Vector 21 (Laser Designator)";
        descriptionShort = "Rangefinder/Designator";
        simulation="weapon";
		class WeaponSlotsInfo
		{
			mass=20;
		};
		Laser=1;
		weaponInfoType="RscOptics_LaserDesignator";
		visionMode[]=
		{
			"Normal",
			"NVG",
			"TI"
		};
		thermalMode[]={7};
		opticsZoomMin=0.0099999998;
		opticsZoomMax=0.050000001;
		opticsZoomInit=0.050000001;
		distanceZoomMin=100;
		distanceZoomMax=2300;
		minRange=150;
		midRange=500;
		maxRange=5000;
        modelOptics = "\A3\Weapons_F\empty.p3d";
    };
};
