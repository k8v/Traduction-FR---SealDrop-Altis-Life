/*
  File: fn_bootVerleih.sqf
  Author: DeadP4xel for SealDrop

  Description:
  Titel :]
*/
private["_price","_boote","_duration","_className","_verleihAction","_player","_vPlayer","_spawnPoint","_timeKeeper"];

// CONFIG & VARIABLEN \\
_price = 5000;
_boote = ["C_Boat_Civil_01_rescue_F","C_Boat_Civil_01_F"];
_duration = (15 * 60);
_className = _boote select floor random count _boote;
_player = player;
_vPlayer = vehicle player;
_spawnPoint = "bootVerleih_spawn";
_timeKeeper = 1;

// Error checks
if(playerSide != civilian) exitWith {hintSilent "Du bist kein Zivilist!"};
if(!alive player) exitWith {};
if(_price > life_cash) exitWith {hintSilent format["Vous avez pas assez d'argent avec vous! Il vous manque: %1 Euro",_price - life_cash]};
if(license_civ_boat) exitWith {hintSilent "Vous n'avez pas de licence!"};
if(life_bootVerleihInUse) exitWith {hintSilent "Vous pouvez louer simultanément seulement un bateau!"};

_verleihAction = [format["Voulez-vous louer un bateau pour %1 minutes? Cela coûtera que %2",[(_duration),"MM"] call BIS_fnc_secondsToString,_price],"Location de bateaux Altis",localize "STR_Global_YES",localize "STR_Global_NO"] call BIS_fnc_guiMessage;
if(_verleihAction) then {
  hintSilent "L'achat a réussi votre bateau maintenant participer!";
  life_bootVerleihInUse = true;
  uiSleep 2;
  // Start Boat spawn
  life_cash = life_cash - _price;
  _vehicle = createVehicle [_className, (getMarkerPos _spawnPoint), [], 0, "NONE"];
  waitUntil {!isNil "_vehicle"};
  _vehicle allowDamage false; // Temp no damage
  _vehicle setPos (getMarkerPos _spawnPoint);
  _vehicle setDir (markerDir _spawnPoint);
  _vehicle engineOn true;
  _vehicle lock 2;
  _vehicle allowDamage true; // Can take damage now
  // Prepare the Player now
  _player allowDamage false; // Temp no damage
  _player moveInDriver _vehicle;
  _player allowDamage true; // Can take damage
  _player setDamage 0;
  hintSilent format["Votre bateau est maintenant prêt! Vous avez maintenant %1 minutes de temps de conduite! Nous espérons que vous prendrez plaisir!",[(_duration),"MM"] call BIS_fnc_secondsToString];
  // Danke an KiloSwiss für den "TimeKeeper" <3
  if(_timeKeeper == 1) then {
    _timeKeeper = 0;
    _wait = time + _duration;
    waitUntil {uiSleep 5; time >= _wait};
    _timeKeeper = 1;
    life_bootVerleihDone = true;
    life_bootVerleihInUse = false;
  };
  // The time is over..
  if(life_bootVerleihDone) then {
    _vPlayer allowDamage false; // Temp no damage
    uiSleep 0.2;
    deleteVehicle _vPlayer;
    _player setPos (getMarkerPos "bootVerleihTimeOver");
    uiSleep 1;
    _player allowDamage true; // Can take damage
    _player setDamage 0; // Just for case
    hintSilent "Nous espérons que vous avez eu du plaisir avec votre bateau! Nous nous réjouissons de votre prochaine visite!";
  };
};
