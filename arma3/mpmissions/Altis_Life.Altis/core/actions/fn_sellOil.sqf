#include <macro.h>
/*
	File: fn_sellOil.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Sells the oil to the oil trader.
	Will be revised.
*/
private["_val"];

_val = life_inv_oilp;

if(life_inv_oilp < 10) exitWith { hintSilent "Vous devez avoir au moins 10 litres d'Essence !";};
if(([false,"oilp",_val] call life_fnc_handleInv)) then
{
	titleText[format["Vous avez réussi à transférer 10 litre d'Essence dans le Jerrycan"],"PLAIN"];
	life_inv_oilp = life_inv_oilp - 10;
	life_inv_fuelF = life_inv_fuelF + 10;
	life_carryWeight = life_carryWeight + 50;
};