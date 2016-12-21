#include <macro.h>
/*
	File: fn_adminTeleport.sqf
	Author: ColinM9991
	Credits: To original script author(s) & Ciaran from AL Forums
	Description:
	Teleport to chosen position.
*/
if((call life_adminlevel) < 2) exitWith {hintSilent "Vous n'avez pas les droits..."};

//Add Map
player addItem "ItemMap";
player assignItem "ItemMap";

[] spawn {
  while {dialog} do {
   closeDialog 0;
   uiSleep 0.05;
  };
};

tele={
	_pos = [_this select 0, _this select 1, _this select 2];
	(vehicle player) setpos [_pos select 0, _pos select 1, 0];
	onMapSingleClick "";
	openMap [false, false];
	hintSilent "Vous êtes arrivé à destination !";
};
openMap [true, false];
onMapSingleClick "[_pos select 0, _pos select 1, _pos select 2] call tele";