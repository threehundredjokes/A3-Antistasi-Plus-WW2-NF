params ["_unit", "_helped"];

if !([_unit] call A3A_fnc_canFight) exitWith {};
if (time < _unit getVariable ["smokeUsed",time - 1]) exitWith {};

if (vehicle _unit != _unit) exitWith {};

_unit setVariable ["smokeUsed",time + 60];

private _muzzle = [_unit] call A3A_fnc_returnMuzzle;
private _enemy = if (count _this > 2) then {_this select 2} else {_unit findNearestEnemy _unit};
if (_muzzle !="") then {
	if (!isNull _enemy && 
		{_enemy distance _unit > 75 && 
		{([objNull, "VIEW"] checkVisibility [eyePos _enemy, eyePos _helped]) > 0 && 
		{behaviour _unit isEqualTo "COMBAT"
	}}}) then {
		_unit stop true;
		_unit doWatch _enemy;
		_unit lookAt _enemy;
		_unit doTarget _enemy;
		if (_unit != _helped) then {sleep 5} else {sleep 1};
		_unit forceWeaponFire [_muzzle,_muzzle];
		_unit stop false;
		_unit doFollow (leader _unit);
	};
} else {
	if (side _unit != teamPlayer) then {
		if (fleeing _unit) then {[_unit,_enemy] call A3A_fnc_suppressingFire};
	};
};