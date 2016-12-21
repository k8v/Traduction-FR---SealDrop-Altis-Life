/*
	File: fn_virt_shops.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Config for virtual shops.
*/
private["_shop"];
_shop = _this select 0;

switch (_shop) do
{
	case "market": {["Marché",["water","rabbit","apple","storagebig","storagesmall","bottledbeer","bottledwhiskey","redgull","battery","tbacon","pickaxe","peach","boltcutter"]]};
	case "rebel": {["Marché Rebelle",["water","rabbit","apple","redgull","tbacon","lockpick","pickaxe","fuelF","peach","boltcutter"]]};
	case "gang": {["Marché Gangster", ["water","rabbit","apple","redgull","tbacon","lockpick","pickaxe","fuelF","peach","boltcutter"]]};
	case "wongs": {["Restaurant Chinois",["turtlesoup","turtle","moonshine"]]};
	case "coffee": {["Stratis Coffee Club",["coffee","donuts"]]};
	case "heroin": {["DrugStore",["cocainep","heroinp","marijuana","methp"]]};
	case "fishmarket": {["Poissonier",["salema","ornate","mackerel","mullet","tuna","catshark"]]};
	case "glass": {["Optic 2000",["glass"]]};
	case "iron": {["Altis Industrie",["iron_r","copper_r"]]};
	case "diamond": {["Revendeur de Diamant",["diamond","diamondc"]]};
	case "salt": {["Revendeur de Sel",["salt_r"]]};
	case "cop": {["Cafétéria Police",["donuts","coffee","water","tbacon","spikeStrip","mauer","battery","painkillers","redgull","defusekit"]]};
	case "cement": {["Revendeur de Ciment",["cement"]]};
	case "beer": {["Chez Nicolas",["wine"]]};
	case "pharmacy": {["Pharmacie",["painkillers","morphium","scalpel","kidney"]]};
	case "medic": {["Cafétéria Médic/Dep",["apple","donuts","tbacon","coffee","water","battery","mauer","redgull","fuelF"]]};
	case "speakeasy": {["Pubs",["bottledbeer","bottledwhiskey","bottledshine"]]};
	case "bar": {["The Lounge",["bottles","cornmeal"]]};
	case "uranium": {["Marchand Uranium",["uranium","puranium"]]};
};