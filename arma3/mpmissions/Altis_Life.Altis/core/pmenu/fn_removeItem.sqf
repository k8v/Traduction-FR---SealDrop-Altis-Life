/*
	File: fn_removeItem.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Removes the selected item & amount to remove from the players
	virtual inventory.
*/
private["_data","_value","_obj","_pos","_ind"];
disableSerialization;
_data = lbData[2005,(lbCurSel 2005)];
_value = ctrlText 2010;
if(_data == "") exitWith {hintSilent "Vous n'avez rien sélectionné";};
if(!([_value] call TON_fnc_isnumber)) exitWith {hintSilent "Vous devez rentrer un nombre."};
if(parseNumber(_value) <= 0) exitWith {hintSilent "Vous devez rentre un nombre correct à donner"};
_ind = [_data,life_illegal_items] call TON_fnc_index;
if(_ind != -1 && ([west,getPos player,100] call life_fnc_nearUnits)) exitWith {titleText["Ceci est un objet illégal et les flis sont à proximité. Vous ne pouvez pas disposer de la preuve.","PLAIN"]};
if(player != vehicle player) exitWith {titleText["Vous ne pouvez pas jeter cet objet lorsque vous etes en voiture.","PLAIN"]};
if(!([false,_data,(parseNumber _value)] call life_fnc_handleInv)) exitWith {hintSilent "Vous ne pouvez pas en jeter autant car vous n'en avez pas autant."};
_type = [_data,0] call life_fnc_varHandle;
_type = [_type] call life_fnc_varToStr;
hintSilent format["Vous avez jeté %1 %2 de votre inventaire.",(parseNumber _value), _type];
	
[] call life_fnc_p_updateMenu;