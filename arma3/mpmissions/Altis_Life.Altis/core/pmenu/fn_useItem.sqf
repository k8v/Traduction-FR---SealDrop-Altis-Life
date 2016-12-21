/*
	File: fn_useItem.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Main function for item effects and functionality through the player menu.
*/
private["_item"];
disableSerialization;
if((lbCurSel 2005) == -1) exitWith {hintSilent "Selectionnez un objet d'abord !";};
_item = lbData[2005,(lbCurSel 2005)];

switch (true) do
{
	case (_item == "water" or _item == "coffee"):
	{
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			life_thirst = 100;
			player setFatigue 0;
		};
	};
	
	case (_item == "boltcutter"): {
		[cursorTarget] spawn life_fnc_boltcutter;
		closeDialog 0;
	};
	
	case (_item == "painkillers"):
	{
		if(vehicle player != player) exitWith {hintSilent "Tu ne peux pas te guérir dans un véhicule..."};
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			player setDamage 0;
			player setFatigue 0;
			player allowDamage true;
			player enableSimulation true;
			closeDialog 0;
			hintSilent "Les analgésiques ont agi, tu es maintenant plein de vie."
		};
	};
	
	case (_item == "morphium"):
	{
		if(playerSide in [west,independent]) exitWith {hintSilent "Tu es en service !"};
		if(vehicle player != player) exitWith {hintSilent "Tu ne peux pas te guérir dans un véhicule..."};
		if(([false,_item,1]call life_fnc_handleInv)) then
		{
			player setFatigue 1;
			player setDamage 0;
			if(isNil "life_drink") then {life_drink = 0;};
			life_drink = life_drink + 0.1;
			life_thirst = life_thirst - 65;
			life_hunger = life_hunger - 75;
			if (life_drink < 0.08) exitWith {};
			[] spawn life_fnc_drinkwhiskey;
			closeDialog 0;
		};
	};
	
	case (_item == "blastingcharge"): {
		player reveal fed_bank;
		(group player) reveal fed_bank;
		[cursorTarget] spawn life_fnc_blastingCharge;
	};
	
	case (_item == "defusekit"): {
		[cursorTarget] spawn life_fnc_defuseKit;
	};
	
	case (_item in ["storagesmall","storagebig"]): {
		[_item] call life_fnc_storageBox;
	};
	
	case (_item == "battery"):
	{
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			life_battery = 100;
			hintSilent "Deine Battery ist nun auf 100%.";
		};
	};
	
	case (_item == "redgull"):
	{
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			life_thirst = 100;
			player setFatigue 0;
			[] spawn
			{
				life_redgull_effect = time;
				titleText["Vous pouvez à présent courir plus vite pendant 5 minutes.","PLAIN"];
				player enableFatigue false;
				waitUntil {!alive player OR ((time - life_redgull_effect) > (5 * 60))};
				player enableFatigue true;
			};
		};
	};
	
	case (_item == "spikeStrip"):
	{
		if(!isNull life_spikestrip) exitWith {hintSilent "Tu as déja un herse dans les mains !"};
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			[] spawn life_fnc_spikeStrip;
		};
	};
	
	case (_item == "mauer"):
	{
		if(!isNull life_mauer) exitWith {hintSilent "Tu mets déjà un mur"};
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			[] spawn life_fnc_mauer;
		};
	};
	
	case (_item == "fuelF"):
	{
		if(vehicle player != player) exitWith {hintSilent "Tu es dans un véhicule"};
		[] spawn life_fnc_jerryRefuel;
	};
	
	case (_item == "lockpick"):
	{
		[] spawn life_fnc_lockpick;
	};
	
	case (_item in ["apple","rabbit","salema","ornate","mackerel","tuna","mullet","catshark","turtle","turtlesoup","donuts","tbacon","peach"]):
	{
		[_item] call life_fnc_eatFood;
	};

	case (_item == "pickaxe"):
	{
		[] spawn life_fnc_pickAxeUse;
	};
	
	case (_item =="bottledwhiskey"):
	{
		if(playerSide in [west,independent]) exitWith {hintSilent localize "STR_MISC_WestIndNoNo";};
		if((player getVariable ["inDrink",FALSE])) exitWith {hintSilent localize "STR_MISC_AlreadyDrinking";};
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			if(isNil "life_drink") then {life_drink = 0;};
			life_drink = life_drink + 0.06;
			if (life_drink < 0.07) exitWith {};
			[] spawn life_fnc_drinkwhiskey;
		};
	};
	
	case (_item =="bottledshine"):
	{
		if(playerSide in [west,independent]) exitWith {hintSilent localize "STR_MISC_WestIndNoNo";};
		if((player getVariable ["inDrink",FALSE])) exitWith {hintSilent localize "STR_MISC_AlreadyDrinking";};
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			if(isNil "life_drink") then {life_drink = 0;};
			life_drink = life_drink + 0.08;
			if (life_drink < 0.09) exitWith {};
			[] spawn life_fnc_drinkmoonshine;
		};
	};
	
	case (_item =="bottledbeer"):
	{
		
		if(playerSide in [west,independent]) exitWith {hintSilent localize "STR_MISC_WestIndNoNo";};
		if((player getVariable ["inDrink",FALSE])) exitWith {hintSilent localize "STR_MISC_AlreadyDrinking";};
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			if(isNil "life_drink") then {life_drink = 0;};
			life_drink = life_drink + 0.02;
			if (life_drink < 0.06) exitWith {};
			[] spawn life_fnc_drinkbeer;
		};
	};
	
	case (_item == "methp"):
	{
		if(playerSide in [west,independent]) exitWith {hintSilent "Tu es en service !!"};
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			[] spawn life_fnc_useMarihuana;
		};
	};
	
	case (_item == "heroinp"):
	{
		if(playerSide in [west,independent]) exitWith {hintSilent "Tu es en service !!"};
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			[] spawn life_fnc_useHeroin;
		};
	};
	
	case (_item == "cocainep"):
	{
		if(playerSide in [west,independent]) exitWith {hintSilent "Tu es en service !!!"};
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			[] spawn life_fnc_useKokain;
		};
	};
	
	case (_item == "kidney"):
	{
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			player setVariable["missingOrgan",false,true];
			life_thirst = 100;
			life_hunger = 100;
			player setFatigue .5;
		};
	};
	
	case (_item == "marijuana"):
	{
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			[] spawn life_fnc_weed;
		};
	};
	
	default
	{
		hintSilent "Vous ne pouvez pas utiliser cet objet";
	};
};
	
[] call life_fnc_p_updateMenu;
[] call life_fnc_hudUpdate;