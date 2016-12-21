/*
	File: fn_giveMoney.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Gives the selected amount of money to the selected player.
*/
private["_unit","_amount"];
_amount = ctrlText 2018;
ctrlShow[2001,false];
if((lbCurSel 2022) == -1) exitWith {hintSilent "Personne n'est sélectionné !";ctrlShow[2001,true];};
_unit = lbData [2022,lbCurSel 2022];
_unit = call compile format["%1",_unit];
if(isNil "_unit") exitWith {ctrlShow[2001,true];};
if(_unit == player) exitWith {ctrlShow[2001,true];};
if(isNull _unit) exitWith {ctrlShow[2001,true];};

//A series of checks *ugh*
if(!life_use_atm) exitWith {hintSilent "Vous venez de braquer la banque, vous pouvez pas donner l'argent tout de suite.";ctrlShow[2001,true];};
if(!([_amount] call TON_fnc_isnumber)) exitWith {hintSilent "Vous n'avez pas saisie de nombre.";ctrlShow[2001,true];};
if(parseNumber(_amount) <= 0) exitWith {hintSilent "Vous devez rentrer un montant réel que vous voulez donner.";ctrlShow[2001,true];};
if(parseNumber(_amount) > life_cash) exitWith {hintSilent "Vous n'avez pas tant à donner";ctrlShow[2001,true];};
if(isNull _unit) exitWith {ctrlShow[2001,true];};
if(isNil "_unit") exitWith {ctrlShow[2001,true]; hintSilent "La personne selectionnée est hors de portée";};
hintSilent format["Vous avez donné $%1 à %2",[(parseNumber(_amount))] call life_fnc_numberText,_unit getVariable["realname",name _unit]];
life_cash = life_cash - (parseNumber(_amount));
[0] call SOCK_fnc_updatePartial;
[[_unit,_amount,player],"life_fnc_receiveMoney",_unit,false] spawn life_fnc_MP;
[] call life_fnc_p_updateMenu;

ctrlShow[2001,true];