class CfgVehicles {
    class Man;
    class CAManBase: Man {
        class ACE_SelfActions {
            class GVAR(create) {
                displayName = "Create [qip] Zeus";
                condition = QUOTE(call FUNC(isAdmin));
                exceptions[] = {"isNotSwimming", "isNotInside", "isNotSitting", "isNotOnLadder", "isNotRefueling"};
                statement = QUOTE(GVAR(zeus) = objNull; [ARR_2(QQGVAR(createZeus), qipTPL_unit)] call CBA_fnc_serverEvent);
                showDisabled = 1;
                icon = "\A3\Ui_F_Curator\Data\Logos\arma3_curator_eye_32_ca.paa";
            };
            class GVAR(delete) {
                displayName = "Delete [qip] Zeus";
                condition = QUOTE(!(isNil QQGVAR(zeus) || {isNull GVAR(zeus)}));
                exceptions[] = {"isNotSwimming", "isNotInside", "isNotSitting", "isNotOnLadder", "isNotRefueling"};
                statement = QUOTE(deleteVehicle GVAR(zeus); GVAR(zeus) = nil);
                showDisabled = 1;
                icon = "\A3\Ui_F_Curator\Data\Logos\arma3_curator_eye_32_ca.paa";
            };
        };
    };
};
