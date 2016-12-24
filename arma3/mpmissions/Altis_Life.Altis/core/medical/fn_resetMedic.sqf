#include <macro.h>
/*
	Author: DeadP4xel
	
	Description: L�scht alles f�r den Respawn und setzt alles neu
*/

// Setzt den Medic nach Respawn zur�ck
removeUniform player;
removeHeadgear player;
removeBackpack player;
removeAllItems player;
removeVest player;
removeAllWeapons player;
removeAllAssignedItems player;
{player removeMagazine _x;} foreach (magazines player);
RemoveGoggles player;

//Medic Gear + Setup
if((__GETC__(life_medicLevel)) == 1) exitWith {
	player forceAddUniform "U_O_OfficerUniform_ocamo";
	player setObjectTextureGlobal [0,"skins\human\medic\medic_uniform.jpg"];
	player addBackpackGlobal "B_Kitbag_sgg";
	hintSilent "Tu as quitt� le service";
	[] call life_fnc_medicLoadout;
};

//ADAC Gear + Setup
if((__GETC__(life_medicLevel)) == 2) exitWith {
	player forceAddUniform "U_B_HeliPilotCoveralls";
	player setObjectTextureGlobal [0,"skins\human\medic\adac_uniform.jpg"];
	player addHeadgear "H_Cap_marshal";
	player addBackpackGlobal "B_Kitbag_cbr";
	hintSilent "Tu as quitt� le service";
	[] call life_fnc_medicLoadout;
};