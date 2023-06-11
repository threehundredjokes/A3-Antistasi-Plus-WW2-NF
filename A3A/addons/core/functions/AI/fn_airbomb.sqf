/*  Creates the bombs for airstrikes, should be started 250 meters before the actual bomb run

*/

params ["_pilot", "_bombType", "_bombCount", "_bombRunLength"];
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
Debug_1("Executing on: %1", clientOwner);

//Ensure reasonable bomb run lenght
if(_bombRunLength < 100) then {_bombRunLength = 100};

private _hasVn = (side _pilot == Invaders && "VN" isEqualTo ((A3A_Inv_template splitString "_") select 0)) 
    || (side _pilot == Occupants && {"VN" isEqualTo ((A3A_Occ_template splitString "_") select 0)})
    || (side _pilot == teamPlayer && {"VN" isEqualTo ((A3A_Reb_template splitString "_") select 0)});

private _ammo = "";
private _bombOffset = 0;
switch (_bombType) do {
    case ("HE"):
    {
        _ammo = "Bo_Mk82";
        _bombOffset = 180;
    };
	case ("CLUSTER"):
    {
        _ammo = "BombCluster_03_Ammo_F";
        _bombOffset = 10;
	};
    case ("NAPALM"):
    {
        if(_hasVn) then {
            _ammo = "vn_bomb_500_blu1b_fb_ammo";
            _bombOffset = 50;
        } else {
            _ammo = "ammo_Bomb_SDB";
            _bombOffset = 170;
        };
    };
	case ("CHEMICAL"): {
        _ammo = "Bo_Mk82_MI08";
        _bombOffset = 25;
    };
	default
    {
		Error_1("Invalid bomb type, given was %1", _bombType);
	};
};

if(_ammo == "") exitWith {};

private _speedInMeters = (speed _pilot) / 3.6;
private _metersPerBomb = _bombRunLength / _bombCount;
//Decrease it a bit, to avoid scheduling erros
private _timeBetweenBombs = (_metersPerBomb / _speedInMeters) - 0.05;

sleep ((_timeBetweenBombs/2) + (_bombOffset/_speedInMeters));

switch (true) do {
    case (_bombType isEqualTo "CHEMICAL"): {
        for "_i" from 1 to _bombCount do {
            if (isNil "_pilot" || {!(alive _pilot)}) exitWith {};
            sleep _timeBetweenBombs;
            private _bombPos = (getPos _pilot) vectorAdd [0, 0, -6];
            _bomb = _ammo createvehicle _bombPos;
            waituntil {!isnull _bomb};
            _bomb setDir (getDir _pilot);
            _bomb setVelocity [0,0,-50];

            [_bomb, _pilot] spawn {
                params ["_lBomb", "_pilot"];

                private _pos = [];
                private _pitchBank = [];

                while {(getPosATL _lBomb) select 2 > 1} do {
                    _pos = getPos _lBomb;
                    _pitchBank = _lBomb call BIS_fnc_getPitchBank;
                };
                playSound3D ["A3\Sounds_f\weapons\explosion\explosion_mine_1.wss", _lBomb];
                deleteVehicle _lBomb;
                _pos remoteExec ["SCRT_fnc_effect_createSmallExplosionEffect", 0];
                [[_pos select 0, _pos select 1, 0], (getDir _pilot), _pitchBank, (side _pilot)] remoteExec  ["SCRT_fnc_support_chemicalBomb", 2];
            };
        };
    };
    case (_bombType isEqualTo "NAPALM" && {!_hasVn}): {
        for "_i" from 1 to _bombCount do {
            if (isNil "_pilot" || {!(alive _pilot)}) exitWith {};
            sleep _timeBetweenBombs;
            private _bombPos = (getPos _pilot) vectorAdd [0, 0, -6];
            if (_bombType isEqualTo "CLUSTER") then {
                _bombPos = _bombPos vectorAdd [0,0, -7];
            };

            _bomb = _ammo createvehicle _bombPos;
            waitUntil {!isnull _bomb};
            _bomb setDir (getDir _pilot);
            _bomb setVelocity [0,0,-50];
            [_bomb] spawn {
                params ["_bomba"];
                private _pos = [];
                while {!isNull _bomba} do
                {
                    _pos = getPos _bomba;
                    sleep 0.1;
                };
                [_pos] remoteExec ["A3A_fnc_napalm",2];
            };
        };
    };

    default {
        for "_i" from 1 to _bombCount do {
            if (isNil "_pilot" || {!(alive _pilot)}) exitWith {};
            sleep _timeBetweenBombs;
            private _bombPos = (getPos _pilot) vectorAdd [0, 0, -6];
            if (_bombType isEqualTo "CLUSTER") then {
                _bombPos = _bombPos vectorAdd [0,0, -7];
            };

            _bomb = _ammo createvehicle _bombPos;
            waituntil {!isnull _bomb};
            _bomb setDir (getDir _pilot);
            _bomb setVelocity [0,0,-50];
        };
    };
};