if (player != leader group player) exitWith {
	[localize "STR_A3A_ai_ai_autoheal_header", localize "STR_A3A_ai_ai_autoheal_mustbealeader"] call A3A_fnc_customHint; 
	autoHeal = false
};

private _units = units group player;

if ({alive _x} count _units == {isPlayer _x} count _units) exitWith {
	[localize "STR_A3A_ai_ai_autoheal_header", localize "STR_A3A_ai_ai_autoheal_atleast1unit"] call A3A_fnc_customHint; 
	autoHeal = false
};
