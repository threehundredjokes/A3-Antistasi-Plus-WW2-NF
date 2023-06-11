/*  
Maintainer: John Jordan
    Create land attack force

Scope: Server or HC
Environment: Scheduled (sleeps between unit spawns)

Arguments:
    <SIDE> Side to create force for
    <STRING> Marker name of source base to spawn at
    <POS or STRING> Position or marker of target location for attack force
    <STRING> Resource pool to use
    <INTEGER> Total number of vehicles to create
    <INTEGER> Number of attack/support vehicles to create
    <INTEGER> Optional, tier modifier to apply to vehicle selection (Default: 0)
    <STRING> Optional, troop type to use (Default: "Normal")

Return array:
    <SCALAR> Resources spent
    <ARRAY> Array of vehicle objects created
    <ARRAY> Array of crew groups created
    <ARRAY> Array of cargo groups created
*/
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_side", "_base", "_target", "_resPool", "_vehCount", "_vehAttackCount", ["_tierMod", 0]];
private _targpos = if (_target isEqualType []) then { _target } else { markerPos _target };
private _transportRatio = 1 - _vehAttackCount / _vehCount;

private _resourcesSpent = 0;
private _vehicles = [];
private _crewGroups = [];
private _cargoGroups = [];

private _transportPool = [_side, tierWar+_tierMod] call A3A_fnc_getVehiclesGroundTransport;
private _supportPool = [_side, tierWar+_tierMod] call A3A_fnc_getVehiclesGroundSupport;

private _numTransports = 0;
private _isTransport = _vehAttackCount < _vehCount;            // normal case, first vehicle should be a transport
private _landPosBlacklist = [];

for "_i" from 1 to _vehCount do {
    private _vehType = selectRandomWeighted ([_supportPool, _transportPool] select _isTransport);

    private _vehData = [_vehType, "Normal", _resPool, _landPosBlacklist, _side, _base, _targPos] call A3A_fnc_createAttackVehicle;
    if !(_vehData isEqualType []) exitWith {};          // couldn't create for some reason, assume we're out of spawn places?

    _vehicles pushBack (_vehData#0);
    if (!isNull (_vehData#1)) then { _crewGroups pushBack (_vehData#1) };
    if (!isNull (_vehData#2)) then { _cargoGroups pushBack (_vehData#2) };
    _landPosBlacklist = (_vehData#3);

    private _vehCost = A3A_vehicleResourceCosts getOrDefault [_vehType, 0];
    private _crewCost = 10 * (count units (_vehData#1) + count units (_vehData#2));
    _resourcesSpent = _resourcesSpent + _vehCost + _crewCost;

    if (_isTransport) then { _numTransports = _numTransports + 1 };
    _isTransport = _vehAttackCount == 0 or (_numTransports / _i) < _transportRatio;

    sleep 10;
};


// TODO: Sort out the spawn positions API or don't use it
_base spawn {
    sleep 60;
    if (spawner getVariable _this == 2) then { [_this] call A3A_fnc_freeSpawnPositions };
};

[_resourcesSpent, _vehicles, _crewGroups, _cargoGroups];
