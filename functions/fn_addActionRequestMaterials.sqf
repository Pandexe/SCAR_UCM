/*
    Author: _SCAR

    Description:
    Adds the action to a unit to request materials.

    Parameter(s):
    0: OBJECT - The logicModule.
    1: UNIT.

    Return:
    0: true

    Example:
    [_logicModule, _unit] call SCAR_UCM_fnc_addActionRequestMaterials;
*/

if !(hasInterface) exitWith {};

params ["_logicModule", "_unit"];

_action = [
    "SCAR_UCM_RequestMaterial",
    (localize "STR_SCAR_UCM_Main_RequestMaterials"),
    "",
    // Statement <CODE>
    {
        params ["_target", "_player", "_logicModule"];
        [_logicModule, player] remoteExec ["SCAR_UCM_fnc_requestMaterial", 2];
    },
    // Condition <CODE>
    {
        params ["_target", "_player", "_logicModule"];
        [_target] call SCAR_UCM_fnc_canRespondToActions
    },
    {},
    _logicModule
] call ace_interact_menu_fnc_createAction;
[_unit,	0, ["ACE_MainActions"],	_action] call ace_interact_menu_fnc_addActionToObject;

// return
true