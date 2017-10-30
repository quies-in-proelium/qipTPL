/*******************************************************************************
Music die hier definiert wird kann mit dem Klassen namen gestartet werden
Anhand des Beispiels "MarsIntro" würde der aufruf dann wie folgt aussehen:

playMusic "MarsIntro";
*******************************************************************************/
class CfgMusicClasses
{
	class Tears_of_the_sun {
		displayName = "Tears of the Sun";
	};

	class Horror {
		displayName = "Horror";
	};

    class Misc {
        displayName = "Sonstiges";
    };
};

class CfgMusic {
	tracks[]={};
	// class MarsIntro {
	// 	name = "";
	// 	sound[] = {"\qipTPL_Assets\Music\filename.ogg", db+0, 1.0};
	//	theme = "combat";
	//	duration = "144";
	//	musicClass = "Arma_2_British_Armed_Forces";
	// };
    #include "\qipTPL_Assets\Music\Horror\CfgMusic_Horror.hpp"
    #include "\qipTPL_Assets\Music\Tears_of_the_Sun\CfgMusic_TotS.hpp"
    #include "\qipTPL_Assets\Music\Misc\CfgMusic_Misc.hpp"
};
