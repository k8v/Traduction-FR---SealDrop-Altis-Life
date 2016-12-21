#include <macro.h>
/*
	File: fn_adminSpectate.sqf
	Author: ColinM9991
	
	Description:
	Spectate the chosen player.
*/
if(__GETC__(life_adminlevel) == 0) exitWith {closeDialog 0;};

private["_unit"];
_unit = lbData[2902,lbCurSel (2902)];
_unit = call compile format["%1", _unit];
if(isNil "_unit") exitwith {};
if(isNull _unit) exitWith {};
if(_unit == player) exitWith {hintSilent "Vous ne pouvez pas vous observer vous même";};

[] spawn {
  while {dialog} do {
   closeDialog 0;
   uiSleep 0.05;
  };
};

_unit switchCamera "EXTERNAL";
hintSilent format["Vous êtes en train d'observer %1 \n\n Presse F10 pour arreter.",_unit getVariable["realname",name _unit]];
AM_Exit = (findDisplay 46) displayAddEventHandler ["KeyDown","if((_this select 1) == 68) then {(findDisplay 46) displayRemoveEventHandler ['KeyDown',AM_Exit];player switchCamera 'INTERNAL';hintSilent 'Vous avez arrêté l'observation';};false"];