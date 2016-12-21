#include <macro.h>
/*
	File: fn_adminTpHere.sqf
	Author: ColinM9991
	
	Description:
	Teleport selected player to you.
*/
if(__GETC__(life_adminlevel) == 0) exitWith {closeDialog 0;};

private["_target"];
_target = lbData[2902,lbCurSel (2902)];
_target = call compile format["%1", _target];
if(isNil "_target") exitwith {};
if(isNull _target) exitWith {};
if(_target == player) exitWith {hintSilent "tu ne peux pas te TP à toi même";};

_target setPos (getPos player);
hintSilent format["Vous avez téléporté %1 auprès de vous",_target getVariable["realname",name _target]];