/****************************************************************
File: UPSMON_fnc_DOfindCombatvehicle.sqf
Author: Azroul13

Description:
	Search for near combat vehicles.

Parameter(s):
	<--- Group
	<--- Id of the group
Returns:
	nothing
****************************************************************/

private ["_grp","_npc","_unitsIn","_vehicle","_timeout"];
	
_grp = _this select 0;

//Get in combat vehicles				
_unitsIn = [];
_npc = leader _grp;
_grp setvariable ["UPSMON_embarking",true];
_unitsIn = [_npc,["air","land","sea","gun"],200] call UPSMON_fnc_GetIn_NearestVehicles;	
_timeout = time + 30;
				
	if ( count _unitsIn == 0) then 
	{							
		{ 
			waituntil {vehicle _x != _x || !canmove _x || !canstand _x || !alive _x || time > _timeout || movetofailed _x}; 
		}foreach _unitsIn;
						
		// did the leader die?
		If (({alive _x} count units _grp) == 0) exitwith {};								
						
		//Return to combat mode
		_timeout = time + 30;
		{ 
			waituntil {vehicle _x != _x || !canmove _x || !alive _x || time > _timeout || movetofailed _x}; 
		}foreach _unitsIn;
						
	{								
		if ( vehicle _x  iskindof "Air") then 
		{
			//moving hely for avoiding stuck
			if (driver vehicle _x == _x) then 
			{
				_vehicle = vehicle (_x);									
				nul = [_vehicle,1000] spawn UPSMON_domove;	
				//Execute control stuck for helys
				[_vehicle] spawn UPSMON_HeliStuckcontrol;
			};									
		};
							
		if (driver vehicle _x == _x) then 
		{
			//Starts gunner control
			nul = [vehicle _x] spawn UPSMON_Gunnercontrol;								
		};
	} foreach _unitsIn;									
};
_grp setvariable ["UPSMON_embarking",false];