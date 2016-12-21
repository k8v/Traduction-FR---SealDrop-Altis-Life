/*
	File: fn_weaponShopMenu.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Something
*/
private["_config","_itemInfo","_itemList"];
uiNamespace setVariable ["Weapon_Shop",_this select 3];

disableSerialization;
if(!(createDialog "life_weapon_shop")) exitwith {};

_config = [_this select 3] call life_fnc_weaponShopCfg;
if(typeName _config == "STRING") exitWith {hintSilent _config; closeDialog 0;};

ctrlSetText[38401,_config select 0];

_filters = ((findDisplay 38400) displayCtrl 38402);
lbClear _filters;

_filters lbAdd "Boutique";
_filters lbAdd "Inventaire";

_filters lbSetCurSel 0;