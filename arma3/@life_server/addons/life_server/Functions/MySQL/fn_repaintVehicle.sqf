/*
	File: fn_repaintVehicle.sqf
	Author: MooN-Gaming 
*/
private["_uid","_side","_type","_className","_color","_plate","_query","_sql"];
_uid = [_this,0,"",[""]] call BIS_fnc_param;
_plate = [_this,1,-1,[0]] call BIS_fnc_param;
_color = [_this,2,0,[0]] call BIS_fnc_param;

if(_uid isEqualTo "" OR _color isEqualTo -1 OR _plate isEqualTo -1) exitWith {};

_query = format["UPDATE vehicles SET color='%1' WHERE plate='%2' AND pid='%3'",_color, _plate, _uid];
_queryResult = [_query,1] call DB_fnc_asyncCall;