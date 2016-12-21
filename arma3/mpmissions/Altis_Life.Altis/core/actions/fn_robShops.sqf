private["_robber","_shop","_kassa","_ui","_progress","_pgText","_cP","_rip","_pos"];
_shop = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param; //The object that has the action attached to it is _this. ,0, is the index of object, ObjNull is the default should there be nothing in the parameter or it's broken
_robber = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param; //Can you guess? Alright, it's the player, or the "caller". The object is 0, the person activating the object is 1
//_kassa = 1000; //The amount the shop has to rob, you could make this a parameter of the call (https://community.bistudio.com/wiki/addAction). Give it a try and post below ;)
_action = [_this,2] call BIS_fnc_param;//Action name

if(side _robber != civilian) exitWith { hintSilent "Vous ne pouvez pas voler cette station !" };
if(_robber distance _shop > 5) exitWith { hintSilent "Vous devez rester à 5m du caissier pour le voler !" };

if !(_kassa) then { _kassa = 1000; };
if (_rip) exitWith { hintSilent "Le vol est déja en cours !" };
if (vehicle player != _robber) exitWith { hintSilent "Sors de ton véhicule !" };

if !(alive _robber) exitWith {};
if (currentWeapon _robber == "") exitWith { hintSilent "Haha tu n'as même pas d'arme ! Tire toi de là, Clochard !" };
if (_kassa == 0) exitWith { hintSilent "La caisse est vide !" };

_rip = true;
_kassa = 10000 + round(random 10000);
_shop removeAction _action;
_shop switchMove "AmovPercMstpSsurWnonDnon";
_chance = random(100);
if(_chance >= 85) then { hintSilent "Le caissier a activé l'alarme silencieuse, La police est prévenue !"; [[1,format["ALARM! - Station essence: %1 se fait braquer !", _shop]],"life_fnc_broadcast",west,false] spawn life_fnc_MP; };

_cops = (west countSide allPlayers);
if(_cops < 2) exitWith{[[_vault,-1],"disableSerialization;",false,false] spawn life_fnc_MP; hintSilent "There isnt enough Police to rob gas station!";};
disableSerialization;
5 cutRsc ["life_progress","PLAIN"];
_ui = uiNameSpace getVariable "life_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["Vol en cours, restez à proximité (10m) (1%1)...","%"];
_progress progressSetPosition 0.01;
_cP = 0.01;
 
if(_rip) then
{
while{true} do
{
uiSleep 0.85;
_cP = _cP + 0.01;
_progress progressSetPosition _cP;
_pgText ctrlSetText format["Vol en cours, restez à proximité (10m) (%1%2)...",round(_cP * 100),"%"];
_Pos = position player; // by ehno: get player pos
				                _marker = createMarker ["Marker200", _Pos]; //by ehno: Place a Maker on the map
				                "Marker200" setMarkerColor "ColorRed";
				                "Marker200" setMarkerText "!ATTENTION! Braquage !ATTENTION!";
				                "Marker200" setMarkerType "mil_warning";			
if(_cP >= 1) exitWith {};
if(_robber distance _shop > 10.5) exitWith { };
if!(alive _robber) exitWith {};
};
if!(alive _robber) exitWith { _rip = false; };
if(_robber distance _shop > 10.5) exitWith { deleteMarker "Marker200"; _shop switchMove ""; hintSilent "Vous deviez rester à moins de 10m de la caisse ! - La caisse est mainetnant vérouillée."; 5 cutText ["","PLAIN"]; _rip = false; };
5 cutText ["","PLAIN"];

titleText[format["Vous avez volé $%1, barre toi avant que la Police n'arrive !",[_kassa] call life_fnc_numberText],"PLAIN"];
deleteMarker "Marker200"; // by ehno delete maker
life_cash = life_cash + _kassa;

_rip = false;
life_use_atm = false;
uiSleep (30 + random(180));
life_use_atm = true;
if!(alive _robber) exitWith {};
[[getPlayerUID _robber,name _robber,"211"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;
};
uiSleep 300;
_action = _shop addAction["Rob the Gas Station",life_fnc_robShops];
_shop switchMove "";

