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
	#include "Music\Horror\CfgMusic_Horror.hpp"
	#include "Music\Tears_of_the_Sun\CfgMusic_TotS.hpp"
	#include "Music\Misc\CfgMusic_Misc.hpp"
};
