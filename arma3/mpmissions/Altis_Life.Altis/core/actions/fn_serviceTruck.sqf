/*
	File: fn_serviceTruck.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Main functionality for the service truck.
	*Needs to be revised for new system and flow*
*/
private["_nearby"];
_nearby = nearestObjects[(vehicle player),["Car","Ship","Air"],10];
if(count (_nearby) > 1) then
{
	_vehicle = _nearby select 1;
	_name = getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName");
	titleText[format["Servicing %1 don't move...",_name],"PLAIN"];
	titleFadeOut 12;
	uiSleep 10;
	if((vehicle player) distance _vehicle > 10) exitWith {titleText["Vous n'avez pas pu faire le plein/réparation du véhicules car vous êtes plus de 10m de lui","PLAIN"];};
	titleText[format["You have refueled/repaired %1",_name],"PLAIN"];
	if(!local _vehicle) then
	{
		[{_vehicle setFuel 1;},"life_fnc_setFuel",_vehicle,false] spawn life_fnc_MP;
	}
		else
	{
		_vehicle setFuel 1;
	};
	_vehicle setDamage 0;
};