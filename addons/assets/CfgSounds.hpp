/*******************************************************************************
Sounds die hier definiert wird kann mit dem Klassen namen gestartet werden
Anhand des Beispiels "wolf1" würde der aufruf dann wie folgt aussehen:

playSound "wolf1";
*******************************************************************************/
class CfgSounds {
	sounds[] = {};
	// class wolf1 {
	//	 name = "my_wolf_sound"; // how the sound is referred to in the editor (e.g. trigger effects)
	//	 sound[] = {"Sounds\wolf1.ogg", db+0, 1.0}; // Dateiname, volume, pitch
	//	 titles[] = {1, "*wolf growls*"}; // Untertitel verzögerung in sekunden, Untertitel text (optional)
	// };

	class qipTPL_Nuclear {
		name = "[qip] Nuclear siren";
		sound[] = {QPATHTOF(Music\Misc\Nuclear.ogg), db+0, 1.0};
		titles[] = {1, "Nuclear siren"};
	};

	class qipTPL_Baby {
		name = "[qip] Baby";
		sound[] = {QPATHTOF(Music\Horror\baby.ogg), db+0, 1.0};
		titles[] = {1, "Baby"};
	};

	class qipTPL_Kind {
		name = "[qip] Kind";
		sound[] = {QPATHTOF(Music\Horror\kind.ogg), db+0, 1.0};
		titles[] = {1, "Kind"};
	};
};
