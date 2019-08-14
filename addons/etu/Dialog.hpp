class RscButton;
class RscCombo;
class RscListBox;
class RscText;

class RscTemplateTransporter {
    idd = -1;
    movingEnable = false;
    enableSimulation = true;
    controlsBackground[] = {
        Background
    };
    controls[] = {
        ListPlayers,
        ComboOptions,
        ButtonTeleport
    };

    onLoad = QUOTE(call FUNC(onLoad));

    class Background: RscText {
        idc = -1;
        sizeEx = 0;
        colorText[] = {0, 0, 0, 0};
        colorShadow[] = {0, 0, 0, 0};
        colorBackground[] = {0, 0, 0, 0.8};
        x = QUOTE(MIDX - 7.5 * CELLW);
        y = QUOTE(MIDY - 8 * CELLH);
        w = QUOTE(15 * CELLW);
        h = QUOTE(16 * CELLH);
    };

    class ListPlayers: RscListBox {
        idc = 10;
        x = QUOTE(MIDX - 7 * CELLW);
        y = QUOTE(MIDY - 7.5 * CELLH);
        w = QUOTE(14 * CELLW);
        h = QUOTE(12 * CELLH);
        sizeEx = QUOTE(SIZEEX);
        rowHeight = QUOTE(CELLH);
        onLBSelChanged = QUOTE(call FUNC(onListPlayersSelChanged));
    };

    class ComboOptions: RscCombo {
        idc = 20;
        x = QUOTE(MIDX - 7 * CELLW);
        y = QUOTE(MIDY + 5 * CELLH);
        w = QUOTE(14 * CELLW);
        h = QUOTE(1 * CELLH);
        wholeHeight = QUOTE(5 * CELLH);
        sizeEx = QUOTE(SIZEEX);
        onLBSelChanged = QUOTE(call FUNC(onListOptionsSelChanged));
    };

    class ButtonTeleport: RscButton {
        idc = 30;
        x = QUOTE(MIDX - 7 * CELLW);
        y = QUOTE(MIDY + 6.5 * CELLH);
        w = QUOTE(14 * CELLW);
        h = QUOTE(1 * CELLH);
        shadow = 0;
        sizeEx = QUOTE(SIZEEX);
        text = "Energie!";
        onButtonClick = QUOTE(call FUNC(onButtonTeleportClick));
    };
};
