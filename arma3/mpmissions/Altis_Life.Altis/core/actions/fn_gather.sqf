/*
	File: fn_gather.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Main functionality for gathering.
*/
if(isNil "life_action_gathering") then {life_action_gathering = false;};
private["_gather","_itemWeight","_diff","_itemName","_val","_resourceZones","_zone"];
_resourceZones = ["apple_1","apple_2","apple_3","apple_4","peaches_1","peaches_2","peaches_3","peaches_4","heroin_1","cocaine_1","cocaine_2","weed_1","grape_1","rye_1","yeast_1","hops_1","meth_1"];
_zone = "";

if(life_action_gathering) exitWith {}; //Action is in use, exit to prevent spamming.
life_action_gathering = true;
//Find out what zone we're near
{
	if(player distance (getMarkerPos _x) < 30) exitWith {_zone = _x;};
} foreach _resourceZones;

if(_zone == "") exitWith {
	life_action_inUse = false;
};

//Get the resource that will be gathered from the zone name...
switch(true) do {
	case (_zone in ["apple_1","apple_2","apple_3","apple_4"]): {_gather = "apple"; _val = 3;};
	case (_zone in ["peaches_1","peaches_2","peaches_3","peaches_4"]): {_gather = "peach"; _val = 3;};
	case (_zone in ["heroin_1"]): {_gather = "heroinu"; _val = 1 + (round random 3);};
	case (_zone in ["cocaine_1","cocaine_2"]): {_gather = "cocaine"; _val = 1;};
	case (_zone in ["weed_1"]): {_gather = "cannabis"; _val = 1 + (round random 3);};
	case (_zone in ["meth_1"]): {_gather = "methu"; _val = 1 + (round random 3);};
	case (_zone in ["grape_1"]): {_gather = "grapes"; _val = 3 + (round random 6);};
	case (_zone in ["rye_1"]): {_gather = "rye"; _val = 1 + (round random 4);};
	case (_zone in ["yeast_1"]): {_gather = "yeast"; _val = 1 + (round random 5);};
	case (_zone in ["hops_1"]): {_gather = "hops"; _val = 1 + (round random 6);};
	default {""};
};
//gather check??
if(vehicle player != player) exitWith {};

_diff = [_gather,_val,life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;
if(_diff == 0) exitWith {hintSilent "Inventaire Plein"};
life_action_inUse = true;
for "_i" from 0 to 2 do
{
	player playMove "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
	waitUntil{animationState player != "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";};
	uiSleep 2.5;
};

if(([true,_gather,_diff] call life_fnc_handleInv)) then
{
	_itemName = [([_gather,0] call life_fnc_varHandle)] call life_fnc_varToStr;
	titleText[format["Vous avez récolté %1 %2x .",_itemName,_diff],"PLAIN"];
};

life_action_inUse = false;
