/*
    Author: _SCAR

    Description:
    Sets the worker's map marker.

    Parameter(s):
    0: UNIT - The worker.

    Return:
    0: true

    Example:
    [_worker] call SCAR_UCM_fnc_setMarkerWorker;
*/

if !(isServer) exitWith {};

params ["_worker"];

// did we initialize markers on this worker yet?
private _previousMarker = _worker getVariable ["SCAR_UCM_workerMarker", objNull];
if (_previousMarker isEqualTo objNull) then {
    // no previous marker --> init
    _worker addEventHandler ["Killed", {
        _killed = _this select 0;
        // delete marker
        _marker = _killed getVariable "SCAR_UCM_workerMarker";
        deleteMarker _marker;
    }];
} else {
    deleteMarker _previousMarker;
};

// create
private _marker = createMarker [format["SCAR_UCM_workerMarker:%1", _worker], getPos _worker];
_marker setMarkerShape "ICON";
_marker setMarkerType "mil_dot";
_marker setMarkerColor format["color%1", (side _worker)];

// set marker text localized
[_marker, { localize "STR_SCAR_UCM_Main_Worker" }] remoteExec ["setMarkerTextLocal", -2, _marker];

// save vars
_worker setVariable ["SCAR_UCM_workerMarker", _marker];

// return
true
