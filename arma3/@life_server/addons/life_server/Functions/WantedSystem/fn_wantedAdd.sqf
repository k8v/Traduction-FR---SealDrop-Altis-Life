/*
	File: fn_wantedAdd.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Adds or appends a unit to the wanted list.
*/
private["_uid","_type","_index","_data","_crimes","_val","_customBounty","_name"];
_uid = [_this,0,"",[""]] call BIS_fnc_param;
_name = [_this,1,"",[""]] call BIS_fnc_param;
_type = [_this,2,"",[""]] call BIS_fnc_param;
_customBounty = [_this,3,-1,[0]] call BIS_fnc_param;
if(_uid == "" OR _type == "" OR _name == "") exitWith {}; //Bad data passed.

//What is the crime?
switch(_type) do
{
	case "187V": {_type = ["Ecrasé un joueur",1234567]};
	case "187": {_type = ["Assassiner",1234567]};
	case "901": {_type = ["Evasion de prison",1234567]};
	case "261": {_type = ["Viol",5000]}; //What type of sick bastard would add this?
	case "261A": {_type = ["Tentative de viol",3000]};
	case "215": {_type = ["Tentative de Vol de voiture",10000]};
	case "213": {_type = ["Utilisation d'explosifs illégaux",10000]};
	case "211": {_type = ["Braquage",60000]};
	case "207": {_type = ["Prise d'otages",1234567]};
	case "207A": {_type = ["Tentative de prise d'otages",1234567]};
	case "487": {_type = ["Vol de véhicules",20000]};
	case "488": {_type = ["Vol",15000]};
	case "480": {_type = ["Délit de fuite",1300]};
	case "481": {_type = ["Possession de drogue",1234567]};
	case "482": {_type = ["Recèle ",5000]};
	case "483": {_type = ["Trafic de drogue",1234567]};
	case "459": {_type = ["Cambriolages",50000]};
	case "390": {_type = ["Sous l'influence de l'alcool",15000]};
	case "919": {_type = ["Trafic d'organes",50000]};
	
	case "1": {_type = ["Conduite sans permis",15000]};
    case "2": {_type = ["Tentative de vol de voiture",10000]};
    case "3": {_type = ["Exécution d'un véhicule volé",20000]};
    case "4": {_type = ["Conduite sans lumières",1500]};
    case "5": {_type = ["Vitesse excessive",6000]};
    case "6": {_type = ["Conduite dangereuse",7500]};
    case "7": {_type = ["Tentative de vol de véhicule de police",15000]};
    case "8": {_type = ["Vol de véhicules de police",25000]};
    case "9": {_type = ["Atterrir sans autorisation",20000]};
    case "10": {_type = ["Conduire des véhicules illégaux", 100000]};
    case "11": {_type = ["Accident avec délit de fuite",5000]};
    case "12": {_type = ["Exécuter de la police",17500]};
    case "13": {_type = ["Écrasé par un autre joueur",30000]};
    case "14": {_type = ["Barrages routiers illégal",15000]};
    case "15": {_type = ["Troubles civils",45000]};
    case "16": {_type = ["Ne pas suivre e. pol. par arrangement",5000]};
    case "17": {_type = ["Insulte",15000]};
    case "18": {_type = ["Harcèlement d'un agent de police",14000]};
    case "19": {_type = ["la saisie d'un pol. dans la zone d'exclusion",50000]};
    case "20": {_type = ["Tuer un policier",1234567]};
    case "21": {_type = ["bombardement de Police/agents/biens",1234567]};
    case "22": {_type = ["Destruction de biens de la police",15000]};
    case "23": {_type = ["Infractions relatives aux drogues",1234567]};
    case "24": {_type = ["Possession d'armes sans permis",70000]};
    case "25": {_type = ["Vue avec une arme en ville",50000]};
    case "26": {_type = ["Possession d'une arme illégale",150000]};
    case "27": {_type = ["Coup de feu dans une ville",50000]};
    case "28": {_type = ["Prise d'otages",1234567]};
    case "29": {_type = ["Vol",60000]};
    case "30": {_type = ["Vol de banque",1234567]};
    case "31": {_type = ["Assassiner",1234567]};
    case "32": {_type = ["Révolte",75000]};
    case "33": {_type = ["Attaque par les rebelles",75000]};
    case "34": {_type = ["Assault/siège de villes/check-points",1234567]};
    case "35": {_type = ["Atterrissage dans une zone d'exclusion aérienne",75000]};
    case "36": {_type = ["Survol/vol stationnaire au-dessous de 150 m au-dessus de la ville",20000]};
    case "37": {_type = ["Evasion de prison",1234567]};
    case "38": {_type = ["Vol sans licence de vol",50000]};
    case "39": {_type = ["klaxon permanent",7500]};
    case "40": {_type = ["Commerce des produits exotiques",50000]};
	case "41": {_type = ["Entrer dans un avant-poste",25000]};
	case "42": {_type = ["Manipulation des centrales électriques",25000]};
	
	case "120S": {_type = ["Vitesse excessive",5000]};
	case "120H": {_type = ["Conduite anormal",8000]};
	case "120WL": {_type = ["Conduire W/O Permis",8000]};
	case "120FS": {_type = ["Conduite dangereuse",8000]};
	default {_type = [];};
};

if(count _type == 0) exitWith {}; //Not our information being passed...
//Is there a custom bounty being sent? Set that as the pricing.
if(_customBounty != -1) then {_type set[1,_customBounty];};
//Search the wanted list to make sure they are not on it.
_index = [_uid,life_wanted_list] call TON_fnc_index;

if(_index != -1) then
{
	_data = life_wanted_list select _index;
	_crimes = _data select 2;
	_crimes pushBack (_type select 0);
	_val = _data select 3;
	life_wanted_list set[_index,[_name,_uid,_crimes,(_type select 1) + _val]];
}
	else
{
	life_wanted_list pushBack [_name,_uid,[(_type select 0)],(_type select 1)];
};