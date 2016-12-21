/*
	File: fn_varToStr.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Takes the long-name (variable) and returns a display name for our
	virtual item.
*/
private["_var"];
_var = [_this,0,"",[""]] call BIS_fnc_param;
if(_var == "") exitWith {""};

switch (_var) do
{
	case "life_inv_oilu": {"Pétrole"};
	case "life_inv_oilp": {"Essence"};
	case "life_inv_heroinu": {"Héroïne non-transformée"};
	case "life_inv_heroinp": {"Héroïne Transformée"};
	case "life_inv_cannabis": {"Cannabis"};
	case "life_inv_marijuana": {"Marijuana"};
	case "life_inv_apple": {"Pomme"};
	case "life_inv_rabbit": {"Viande de lapin"};
	case "life_inv_salema": {"Filet de saumon"};
	case "life_inv_ornate": {"Filet d'ornate"};
	case "life_inv_mackerel": {"Filet de maquereau"};
	case "life_inv_tuna": {"Filet de thon"};
	case "life_inv_mullet": {"Filet de mulet"};
	case "life_inv_catshark": {"Filet de poisson-chat"};
	case "life_inv_turtle": {"Viande de tortue"};
	case "life_inv_fishingpoles": {"Canne à pêche"};
	case "life_inv_water": {"Bouteille d'eau"};
	case "life_inv_coffee": {"Café"};
	case "life_inv_turtlesoup": {"Soupe de tortue"};
	case "life_inv_donuts": {"Donuts"};
	case "life_inv_fuelE": {"Jerrycan(leer)"};
	case "life_inv_fuelF": {"Jerrycan de carburant"};
	case "life_inv_pickaxe": {"Pioche"};
	case "life_inv_copperore": {"Cuivre"};
	case "life_inv_ironore": {"Fer"};
	case "life_inv_ironr": {"Lingot de fer"};
	case "life_inv_copperr": {"Lingot de cuivre"};
	case "life_inv_sand": {"Sable"};
	case "life_inv_salt": {"Sel"};
	case "life_inv_saltr": {"Sel Traité"};
	case "life_inv_glass": {"Lunette"};
	case "life_inv_diamond": {"Diamant Brut"};
	case "life_inv_diamondr": {"Diamant taillé"};
	case "life_inv_tbacon": {"Bacon Tactique"};
	case "life_inv_redgull": {"RedGull"};
	case "life_inv_lockpick": {"Outils de crochetage"};
	case "life_inv_peach": {"Pêche"};
	case "life_inv_coke": {"Cocaïne Non-Traitée"};
	case "life_inv_cokep": {"Cocaïne Traitée"};
	case "life_inv_spikeStrip": {"Herse"};
	case "life_inv_rock": {"Pierre"};
	case "life_inv_cement": {"Sac de ciment"};
	case "life_inv_goldbar": {"Lingot d'or"};
	case "life_inv_wine": {"Vin"};
	case "life_inv_grapes": {"Raisin"};
	case "life_inv_methu": {"Méthamphétamine non-traitée"};
	case "life_inv_methp": {"Méthamphétamine pure"};
	case "life_inv_storage1": {"Box Stockage (petite)"};
	case "life_inv_storage2": {"Box Stockage (grande)"};
	case "life_inv_battery": {"Batterie de Téléphone"};
	case "life_inv_blastingcharge": {"Pain de C4"};
	case "life_inv_boltcutter": {"Coupe-boulons"};
	case "life_inv_defusekit": {"Kit de désamorçage"};
	case "life_inv_painkillers": {"Analgésique"};
	case "life_inv_morphium": {"Morphine"};
	case "life_inv_zipties": {"colier de sérrage"};
	case "life_inv_storagesmall": {"Small Storage Box"};
	case "life_inv_storagebig": {"Large Storage Box"};
	case "life_inv_mauer": {"Barrage"};
	case "life_inv_mash": {"Grain Mash Mélangé"};
	case "life_inv_yeast": {"Levure"};
	case "life_inv_rye": {"Seigle"};
	case "life_inv_hops": {"houblon"};
	case "life_inv_whiskey": {"Whisky distillé"};
	case "life_inv_beerp": {"Bière Fermentée"};
	case "life_inv_bottles": {"Bouteille en verre"};
	case "life_inv_cornmeal": {"Semoule de maïs"};
	case "life_inv_bottledwhiskey": {"Bouteille de Whiskey"};
	case "life_inv_bottledbeer": {"Bouteille de bière"};
	case "life_inv_bottledshine": {"Bouteille de Moonshine"};
	case "life_inv_moonshine": {"Moonshine distillé"};
	case "life_inv_puranium": {"Uranium mélangé"}; // Add This
    case "life_inv_ipuranium": {"Produkt III Uran"}; // Add This
    case "life_inv_uranium1": {"Uranerz"}; // Add This
    case "life_inv_uranium2": {"Uranium Brut"}; // Add This
    case "life_inv_uranium3": {"Uranium purifié"}; // Add This
    case "life_inv_uranium4": {"Uranium concentré"}; // Add This
    case "life_inv_uranium": {"Uranium"}; // Add This
	case "life_inv_kidney": {"Rein"}; 
	case "life_inv_scalpel": {"Scalpel"};
	
	//License Block
	case "license_civ_driver": {"Permis de Conduire"};
	case "license_civ_air": {"Licence de Pilote"};
	case "license_civ_heroin": {"Traitement d'Héroïne"};
	case "license_civ_gang": {"¨Gang Licence"};
	case "license_civ_oil": {"Licence de pétrole"};
	case "license_civ_dive": {"Licence de plongée"};
	case "license_civ_boat": {"Permis Bateau"};
	case "license_civ_gun": {"Permis Port d'arme"};
	case "license_cop_air": {"Pilote"};
	case "license_cop_swat": {"GIPN"};
	case "license_cop_cg": {"Garde Côte"};
	case "license_civ_rebel": {"Entrainement Rebelle"};
	case "license_civ_truck": {"Permis Poids lourd"};
	case "license_civ_diamond": {"Traitement de Diamant"};
	case "license_civ_copper": {"Traitement de Cuivre"};
	case "license_civ_iron": {"Traitement de Fer"};
	case "license_civ_sand": {"Traitement de Sable"};
	case "license_civ_salt": {"Traitement de Sel"};
	case "license_civ_coke": {"Traitemetn de Cocaïne"};
	case "license_civ_marijuana": {"Traitement Marijuana"};
	case "license_civ_cement": {"Fabrication Ciment"};
	case "license_civ_meth": {"Traitement de Méthamphétamine"};
	case "license_civ_grapes": {"Vignoble"};
	case "license_civ_moonshine": {"Fabrication Moonshine"};
	case "license_civ_meth": {"Frabrication Méthamphétamine"};
	case "license_med_air": {"Pilote"};
	case "license_civ_home": {"Droit de propriété"};
	case "license_med_adac": {"Licence Dépanneur"};
	case "license_civ_stiller": {"Licence Distillation"};
	case "license_civ_liquor": {"Licence Liqueur"};
	case "license_civ_bottler": {"Licence Remplissage"};
	case "license_civ_uranium": {"Traitement d'Uranium"};
};
