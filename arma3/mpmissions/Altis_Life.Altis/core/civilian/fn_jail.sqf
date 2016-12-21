/*
	File: fn_jail.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Starts the initial process of jailing.
*/
private["_bad","_unit","_time"];
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
hintSilent format["%1", _unit];
if(isNull _unit) exitWith {}; //Dafuq?
if(_unit != player) exitWith {}; //Dafuq?
if(life_is_arrested) exitWith {}; //Dafuq i'm already arrested
_time = [_this,2,15,[0]] call BIS_fnc_param;
_bad = [_this,1,false,[false]] call BIS_fnc_param;

player setVariable["restrained",false,true];
player setVariable["Escorting",false,true];
player setVariable["transporting",false,true];

titleText["Vous avez été arrêté, Purge ta peine sagement. Si vous tentez un respawn ou une reconnexion ton temps sera augmenté.","PLAIN"];
hintSilent "En raison de votre incarceration vous avez perdu les licences suivant si vous les possédiez\n\nFirearms License\nRebel License";
player setPos (getMarkerPos "jail_marker");

if(_bad) then
{
	waitUntil {alive player};
	uiSleep 1;
};

//Check to make sure they goto check
if(player distance (getMarkerPos "jail_marker") > 100) then
{
	player setPos (getMarkerPos "jail_marker");
};

[1] call life_fnc_removeLicenses;
if(life_inv_heroinu > 0) then {[false,"heroinu",life_inv_heroinu] call life_fnc_handleInv;};
if(life_inv_heroinp > 0) then {[false,"heroinp",life_inv_heroinp] call life_fnc_handleInv;};
if(life_inv_coke > 0) then {[false,"cocaine",life_inv_coke] call life_fnc_handleInv;};
if(life_inv_cokep > 0) then {[false,"cocainep",life_inv_cokep] call life_fnc_handleInv;};
if(life_inv_turtle > 0) then {[false,"turtle",life_inv_turtle] call life_fnc_handleInv;};
if(life_inv_cannabis > 0) then {[false,"cannabis",life_inv_cannabis] call life_fnc_handleInv;};
if(life_inv_marijuana > 0) then {[false,"marijuana",life_inv_marijuana] call life_fnc_handleInv;};
if(life_inv_methu > 0) then {[false,"methu",life_inv_methu] call life_fnc_handleInv;};
if(life_inv_methp > 0) then {[false,"methp",life_inv_methp] call life_fnc_handleInv;};
if(life_inv_bottledwhiskey > 0) then {[false,"bottledwhiskey",life_inv_bottledwhiskey] call life_fnc_handleInv;};
if(life_inv_bottledbeer > 0) then {[false,"bottledbeer",life_inv_bottledbeer] call life_fnc_handleInv;};
life_is_arrested = true;

removeAllItems player;
removeVest player;
removeBackpack player;
removeGoggles player;
removeHeadgear player;
removeAllWeapons player;
{player removeMagazine _x} foreach (magazines player);
removeUniform player;
player forceAddUniform "U_C_Scientist";

[[player,_bad,_time],"life_fnc_jailSys",false,false] spawn life_fnc_MP;
[5] call SOCK_fnc_updatePartial;