/*
	Author: Tobias 'Xetoxyc' Sittenauer

	File: fn_removeWeapons.sqf
*/

private["_cop"];
_cop = [_this,0,Objnull,[objNull]] call BIS_fnc_param;
if(_cop == player) then {};

if(isNull _cop OR !(player getVariable["restrained",FALSE])) exitWith {}; //Error check?

removeAllWeapons player;

[[0,format["Les armes de %1 ont été saisis par %2", name player, name _cop]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;