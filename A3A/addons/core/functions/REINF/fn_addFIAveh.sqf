#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
params [
	["_typeVehX", "", [""]],
	["_callbackHandlerKey", "BUYFIA", [""]]
];

if (_typeVehX isEqualTo "") exitWith {[localize "STR_A3A_addFiaVeh_header", localize "STR_A3AP_error_empty_generic"] call A3A_fnc_customHint;};
if (!(isNil "HR_GRG_placing") && {HR_GRG_placing}) exitWith {[localize "STR_A3A_addFiaVeh_header", localize "STR_A3AP_error_already_placing_generic"] call A3A_fnc_customHint;};
if (player != player getVariable ["owner",player]) exitWith {[localize "STR_A3A_addFiaVeh_header", localize "STR_A3AP_error_aicontrol_generic"] call A3A_fnc_customHint;};
if ([getPosATL player] call A3A_fnc_enemyNearCheck) exitWith {[localize "STR_A3A_addFiaVeh_header", localize "STR_A3AP_error_enemynear_generic"] call A3A_fnc_customHint;};

vehiclePurchase_cost = [_typeVehX] call A3A_fnc_vehiclePrice;

private _resourcesFIA = 0;


if (player != theBoss) then {
	_resourcesFIA = player getVariable "moneyX";
} else {
	private _factionMoney = server getVariable "resourcesFIA";
	if (vehiclePurchase_cost <= _factionMoney) then {
		_resourcesFIA = _factionMoney;
	} else {
		_resourcesFIA = player getVariable "moneyX";
	};
};

if (_resourcesFIA < vehiclePurchase_cost) exitWith {
	[localize "STR_A3A_addFiaVeh_header", format [localize "STR_A3AP_error_veh_not_enough_money_generic", vehiclePurchase_cost, A3A_faction_civ get "currencySymbol"]] call A3A_fnc_customHint;
};
 
private _vehiclePurchase_nearestMarker = [markersX select {sidesX getVariable [_x,sideUnknown] == teamPlayer},player] call BIS_fnc_nearestPosition;

if (_callbackHandlerKey isNotEqualTo "BUYBLACKMARKET" && {!(player inArea _vehiclePurchase_nearestMarker)}) exitWith {
	[localize "STR_A3A_addFiaVeh_header", localize "STR_A3AP_error_veh_close_to_flag_generic"] call A3A_fnc_customHint;
};

private _extraMessage =	format [localize "STR_veh_callback_select_veh_generic", vehiclePurchase_cost,  A3A_faction_civ get "currencySymbol"];

[_typeVehX, _callbackHandlerKey, [], nil, nil, nil, false, _extraMessage] call HR_GRG_fnc_confirmPlacement;