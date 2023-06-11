#define JAM_RADIUS 1000
#define JAM_STRENGTH 49

private _jammed = false;
private _sideX = side player;
private _isJammed = false;
private _interference = 1;
private _sendInterference = 1;
private _bases = outposts + airportsx + seaports + milbases;

private _antennas = [];

while {true} do {
	_antennas = antennas select { sidesX getVariable [([_bases,_x] call BIS_fnc_nearestPosition), sideUnknown] != _sideX };

	if (_sideX != teamPlayer) then {_antennas pushBack [vehicleBox]};
	if (_antennas isNotEqualTo []) then {
		private _jammer = [_antennas,player] call BIS_fnc_nearestPosition;
		private _distance = player distance _jammer;

	    if (_distance < JAM_RADIUS) then {
			_interference = JAM_STRENGTH - ((_distance / JAM_RADIUS) * JAM_STRENGTH) + 1; // Calculate the recieving interference, which has to be above 1 to have any effect.
			_sendInterference = 1/_interference; //Calculate the sending interference, which needs to be below 1 to have any effect.
			if (!_isJammed) then {_isJammed = true};
			player setVariable ["tf_receivingDistanceMultiplicator", _interference];
			player setVariable ["tf_sendingDistanceMultiplicator", _sendInterference];
	    } else {
	    	if (!_isJammed) exitWith {};
			_isJammed = false;
			_interference = 1;
			_sendInterference = 1;
			player setVariable ["tf_receivingDistanceMultiplicator", _interference];
			player setVariable ["tf_sendingDistanceMultiplicator", _sendInterference];
		};
	};
	
	sleep 10;
};