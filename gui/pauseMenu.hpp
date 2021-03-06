class RscStandardDisplay;
class RscTitle;
class RscButtonMenu;

class RscDisplayInterrupt: RscStandardDisplay
{
    class controls
    {
        class UCM_Title: RscTitle
        {
            idc = 20950;
            style = 0;
            show = 0;
            text = $STR_SCAR_UCM_Menu;
            colorBackground[] = {0.10, 0.19, 0.43, 0.9};
        };
        class UTC_ButtonSave: RscButtonMenu
        {
            idc = 20951;
            show = 0;
            text = $STR_SCAR_UCM_Menu_Save_UCM_Only;
        };
        class UTC_ButtonReset: RscButtonMenu
        {
            idc = 20952;
            show = 0;
            text = $STR_SCAR_UCM_Menu_Delete_UCM;
        };
    };
};

class RscDisplayMPInterrupt: RscStandardDisplay
{
    class controls
    {
        class UCM_Title: RscTitle
        {
            idc = 20950;
            style = 0;
            show = 0;
            text = $STR_SCAR_UCM_Menu;
            colorBackground[] = {0.10, 0.19, 0.43, 0.9};
        };
        class UTC_ButtonSave: RscButtonMenu
        {
            idc = 20951;
            show = 0;
            text = $STR_SCAR_UCM_Menu_Save_UCM_Only;
        };
        class UTC_ButtonReset: RscButtonMenu
        {
            idc = 20952;
            show = 0;
            text = $STR_SCAR_UCM_Menu_Delete_UCM;
        };
    };
};
