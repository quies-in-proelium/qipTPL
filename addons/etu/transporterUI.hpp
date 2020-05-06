class GVAR(transporterUI) {
    idd = 1000;
    name = "qipTPL_etu_transporterUI";
    onLoad = "uiNamespace setVariable ['qipTPL_etu_transporterUI', _this select 0];";
    onUnLoad = "uiNamespace setVariable ['qipTPL_etu_transporterUI', nil];";
    movingEnable = false;
    enableSimulation = true;

    class controlsBackground {};
    class controls {
        class Background: RscText {
            idc = 1100;
            text = "";
            x = 0.449942 * safezoneW + safezoneX;
            y = 0.325929 * safezoneH + safezoneY;
            w = 0.096723 * safezoneW;
            h = 0.378164 * safezoneH;
            ColorBackground[] = {0,0,0,0.694117};
            ColorText[] = {1,1,1,1};
        };
        class playerList: RscListbox {
            idc = 1101;
            x = 0.451585 * safezoneW + safezoneX;
            y = 0.329645 * safezoneH + safezoneY;
            w = 0.093525 * safezoneW;
            h = 0.325560 * safezoneH;
            ColorBackground[] = {0,0,0,0.705882};
            ColorText[] = {1,1,1,1};
            colorSelectBackground[] = {0,0,0,1};
            colorSelect[] = {0,0,0,1};
        };
        class teleportButton: RscButton {
            idc = 1102;
            text = "Teleport";
            x = 0.451628 * safezoneW + safezoneX;
            y = 0.658776 * safezoneH + safezoneY;
            w = 0.046254 * safezoneW;
            h = 0.040801 * safezoneH;
            ColorBackground[] = {0,0,0,0.627450};
            ColorText[] = {1,1,1,1};
            font = TahomaB;
            colorFocused[] = {0,0,0,1};
            colorDisabled[] = {0,0,0,1};
            action = QUOTE([] call FUNC(transporter););
        };
        class cancelButton: RscButton {
            idc = 1103;
            text = "Cancel";
            onButtonClick = QUOTE(closeDialog 0);
            x = 0.498617 * safezoneW + safezoneX;
            y = 0.658841 * safezoneH + safezoneY;
            w = 0.046470 * safezoneW;
            h = 0.040669 * safezoneH;
            ColorBackground[] = {0,0,0,0.627450};
            ColorText[] = {1,1,1,1};
            font = TahomaB;
            colorFocused[] = {0,0,0,1};
            colorDisabled[] = {0,0,0,1};
        };
    };
};
