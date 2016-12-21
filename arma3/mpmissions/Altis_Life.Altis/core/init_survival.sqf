[] spawn  {
	private["_fnc_food","_fnc_water","_fnc_battery"];
	_fnc_food = 
	{
		if(life_hunger < 2) then {player setDamage 1; hintSilent "Vous êtes mort de faim !";}
		else
		{
		life_hunger = life_hunger - 10;
		[] call life_fnc_hudUpdate;
		if(life_hunger < 2) then {player setDamage 1; hintSilent "Vous êtes mort de faim !";};
		switch(life_hunger) do {
			case 30: {hintSilent "Vous n'avez rien mangé depuis un moment, Vous devriez manger quelque chose !";};
			case 20: {hintSilent "Vous commencez à mourir de faim, Vous devez manger quelque chose ou vous mourrez.";};
			case 10: {hintSilent "Vous mourrez de faim, vous serez mort prochainement si vous ne manger rien";player setFatigue 1;};
			};
		};
	};
	
	_fnc_water = 
	{
		if(life_thirst < 2) then {player setDamage 1; hintSilent "Vous êtes mort de soif !";}
		else
		{
			life_thirst = life_thirst - 10;
			[] call life_fnc_hudUpdate;
			if(life_thirst < 2) then {player setDamage 1; hintSilent "Vous êtes mort de soif !";};
			switch(life_thirst) do 
			{
				case 30: {hintSilent"Vous n'avez rien bu depuis un moment, vous devriez boire quelque chose.";};
				case 20: {hintSilent "Vous n'avez rien bu depuis très longtemps, vous devez boire quelque chose ou vous mourrez."; player setFatigue 1;};
				case 10: {hintSilent "Vous mourrez de soif, buvez vite quelque chose !"; player setFatigue 1;};
			};
		};
	};
	
	_fnc_battery =
	{
		if(life_battery < 2) then {hintSilent "La batterie de votre téléphone est vide";}
		else
		{
			life_battery = life_battery - 5;
			[] call life_fnc_hudUpdate;
			if(life_battery < 2) then {hintSilent "Votre batterie est vide.";};
			switch(life_battery) do 
			{
				case 30: {hintSilent "Il vous reste 30% de batterie";};
				case 20: {hintSilent "Il vous reste 20% de batterie";};
				case 10: {hintSilent "Il vous reste 10% de batterie";};
			};
		};
	};
	
	while{true} do
	{
		uiSleep 600;
		[] call _fnc_water;
		uiSleep 10;
		[] call _fnc_battery;
		uiSleep 250;
		[] call _fnc_food;
	};
};

[] spawn
{
	private["_bp","_load","_cfg"];
	while{true} do
	{
		waitUntil {backpack player != ""};
		_bp = backpack player;
		_cfg = getNumber(configFile >> "CfgVehicles" >> (backpack player) >> "maximumload");
		_load = round(_cfg / 8);
		life_maxWeight = life_maxWeightT + _load;
		waitUntil {backpack player != _bp};
		if(backpack player == "") then 
		{
			life_maxWeight = life_maxWeightT;
		};
	};
};

[] spawn
{
	while {true} do
	{
		uiSleep 1.5;
		if(life_carryWeight > life_maxWeight && !isForcedWalk player) then {
			player forceWalk true;
			player setFatigue 1;
			hintSilent "Vous êtes surchargé, retirer des objets de votre inventaire.";
		} else {
			if(isForcedWalk player) then {
				player forceWalk false;
			};
		};
	};
};

[] spawn  
{
	private["_walkDis","_myLastPos","_MaxWalk","_runHunger","_runDehydrate"];
	_walkDis = 0;
	_myLastPos = (getPos player select 0) + (getPos player select 1);
	_MaxWalk = 1200;
	while{true} do 
	{
		uiSleep 0.5;
		if(!alive player) then {_walkDis = 0;}
		else
		{
			_CurPos = (getPos player select 0) + (getPos player select 1);
			if((_CurPos != _myLastPos) && (vehicle player == player)) then
			{
				_walkDis = _walkDis + 1;
				if(_walkDis == _MaxWalk) then
				{
					_walkDis = 0;
					life_thirst = life_thirst - 5;
					life_hunger = life_hunger - 5;
					[] call life_fnc_hudUpdate;
				};
			};
			_myLastPos = (getPos player select 0) + (getPos player select 1);
		};
	};
};

//part of alcohol system written by [midgetgrimm]
[] spawn
{
	while {true} do
	{
		waitUntil {(life_drink > 0)};
		while{(life_drink > 0)} do {
		
			if(life_drink > 0.08) then {
			"radialBlur" ppEffectEnable true;
			"radialBlur" ppEffectAdjust[0.08, 0,0.35,0.37];
			"radialBlur" ppEffectCommit 3;
			uiSleep 240;
			life_drink = life_drink - 0.02;
			} else {
			"radialBlur" ppEffectEnable true;
			"radialBlur" ppEffectAdjust[0.05, 0,0.36,0.38];
			"radialBlur" ppEffectCommit 1;
			uiSleep 180;
			life_drink = life_drink - 0.02;
			};
		};
		
		"radialBlur" ppEffectAdjust  [0,0,0,0];
		"radialBlur" ppEffectCommit 5;
		"radialBlur" ppEffectEnable false;
		life_drink = 0;
		
	};
};

[] spawn
{
	while {true} do
	{
		uiSleep 1.5;
		if(life_inv_uranium2 != 0) then {
			player forceWalk true;
			player setFatigue 1;
			hintSilent "L'uranium est lourd..vous ne pouvez marcher que lentement..";
		} else {
			if(isForcedWalk player) then {
				player forceWalk false;
			};
		};
	};
};

[] spawn  {
	while{true} do
	{
		waitUntil {(player getVariable "missingOrgan")};
		life_max_health = .50;
		while{(player getVariable "missingOrgan")} do {
			life_thirst =  50;
			life_hunger =  50;
			if(damage player < (1 - life_max_health)) then {player setDamage (1 - life_max_health);};
			"dynamicBlur" ppEffectEnable true;
			"dynamicBlur" ppEffectAdjust [2];
			"dynamicBlur" ppEffectCommit 1;
			uiSleep 5;
		};
		"dynamicBlur" ppEffectEnable false;
		life_max_health = 1;
	};
};

[] spawn
{
	while {true} do
	{
		private["_damage"];
		uiSleep 1;
		while {((player distance (getMarkerPos "uran_mine") < 100) && (player getVariable["Revive",TRUE]))} do
		{
			if(uniform player == "U_I_HeliPilotCoveralls") then
			{
				hintSilent "!!! ZONE RADIOACTIVE !!! Votre combinaison vous protège !";
				uiSleep 5;
			}else
			{
				hintSilent "!!! ZONE RADIOACTIVE !!! Vous allez mourrir sans protection !";
				_damage = damage player;
				_damage = _damage + 0.1;
				player setDamage (_damage);
				[] call life_fnc_hudUpdate;
				uiSleep 5;
			};
		};
	};
}; 