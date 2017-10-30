/*******************************************************************************
Sounds die hier definiert wird kann mit dem Klassen namen gestartet werden
Anhand des Beispiels "wolf1" würde der aufruf dann wie folgt aussehen:

playSound "wolf1";
*******************************************************************************/
class CfgSounds {
	sounds[] = {};
	// class wolf1 {
	//	 // how the sound is referred to in the editor (e.g. trigger effects)
	//	 name = "my_wolf_sound";
	//	 // Dateiname, volume, pitch
	//	 sound[] = {"\qipTPL_Assets\Sounds\wolf1.ogg", db+0, 1.0};
	//	 // Untertitel verzögerung in sekunden, Untertitel text (optional)
	//	 titles[] = {1, "*wolf growls*"};
	// };

	class qipTPL_Nuclear {
	    name = "[qip] Nuclear siren";
	    sound[] = {"\qipTPL_Assets\Music\Misc\Nuclear.ogg", db+0, 1.0};
		titles[] = {1, "Nuclear siren"};
	};

	class qipTPL_Baby {
	    name = "[qip] Baby";
	    sound[] = {"\qipTPL_Assets\Music\Horror\baby.ogg", db+0, 1.0};
		titles[] = {1, "Baby"};
	};

	class qipTPL_Kind {
	    name = "[qip] Kind";
	    sound[] = {"\qipTPL_Assets\Music\Horror\kind.ogg", db+0, 1.0};
		titles[] = {1, "Kind"};
	};
};
