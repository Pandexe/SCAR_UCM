/*
    Author: _SCAR

    Description:
    Adds custom save with UCM to menu.

    Return:
    true

    Example:
    [] call SCAR_UCM_fnc_guiAddSaveMenu;
*/

if !(hasInterface) exitWith {};

private _null = [] spawn {

    // init
    disableSerialization;
    private _displayType = if (isMultiplayer) then { "RscDisplayMPInterrupt" } else { "RscDisplayInterrupt" };

    while { true } do {

        waitUntil { !((uiNamespace getVariable _displayType) isEqualTo displayNull) };

        // get display
        private _displayPause = uiNamespace getVariable _displayType;

        // get control
        private _saveControl = _displayPause displayCtrl 103;

        // set text
        private _originalText = ctrlText _saveControl;
        _saveControl ctrlSetText format ["%1 (%2)", _originalText, localize ("STR_SCAR_UCM_Menu_WithUCM")];

        // add event
        _saveControl ctrlAddEventHandler ["buttonClick", {
            // save on server
            [] remoteExec ["SCAR_UCM_fnc_saveAll", 2];
        }];

        waitUntil { ((uiNamespace getVariable _displayType) isEqualTo displayNull) }; // wait until closed
    };
};

// return
true
