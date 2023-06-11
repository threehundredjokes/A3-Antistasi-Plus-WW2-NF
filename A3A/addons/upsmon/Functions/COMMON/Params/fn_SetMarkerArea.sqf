/****************************************************************
File: UPSMON_fnc_SetmarkerArea.sqf
Author: Azroul13

Description:
	Get unit behaviour
Parameter(s):
	<--- group
	<--- Marker Area of the group
	<--- UPSMON parameters
Returns:

****************************************************************/
private["_grp","_areamarker","_Ucthis","_showmarker","_groups","_marker","_in","_id"];	

_grp = _this select 0;
_areamarker = _this select 1;
_Ucthis = _this select 2;

_showmarker = "HIDEMARKER";
_in = false;
_groups = [];
_id = - 1;
{
	_id = _id + 1;
	_marker = _x select 0;
	If (_areamarker == _marker) exitwith 
	{
		_in = true;
		_groups = _x select 1;
	};
} foreach UPSMON_Markers;

_groups set [count _groups,_grp];
_markerarray = [_areamarker,_groups];
If (_in) then
{
	UPSMON_Markers set [_id,_markerarray];
}
else
{
	UPSMON_Markers set [count UPSMON_Markers,_markerarray];
};

{
	_group = _x;
	If (({alive _x && !(captive _x)} count units _group) > 0) then
	{
		_UCthis = _group getvariable ["UPSMON_Ucthis",[]];
		If ("SHOWMARKER" in _UCthis) exitwith {_showmarker = "SHOWMARKER";};
	};
} foreach _groups;

if (_showmarker=="HIDEMARKER") then 
{
	_areamarker setmarkerAlpha 0;
}
else
{
	If (MarkerAlpha _areamarker == 0) then
	{
		_areamarker setmarkerAlpha 1;
	};
};