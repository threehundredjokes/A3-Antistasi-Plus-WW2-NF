/****************************************************************
File: UPSMON_GetIn_NearestCombat.sqf
Author: Ollem

Description:
	Replacement of "setvehicleinit" command. Add init line to a spawned AI.
Parameter(s):
	<--- netid object
	<--- unit init
Returns:
	Nothing
****************************************************************/


private ["_netID","_unit","_unitinit"];
	
_netID = _this select 0;
_unit = objectFromNetID _netID;
_unitinit = _this select 1;
_unitstr = "_unit";
	
_index=[_unitinit,"this",_unitstr] call UPSMON_fnc_Replace;
	
call compile format ["%1",_index];
