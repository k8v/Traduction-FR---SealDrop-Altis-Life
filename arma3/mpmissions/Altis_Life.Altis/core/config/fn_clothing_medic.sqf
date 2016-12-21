#include <macro.h>
/*
	File: fn_clothing_medic.sqf

	Author: DeadP4xel
	Description:
	Configfile for the Medic Store
*/

private["_filter","_ret"];
_filter = [_this,0,0,[0]] call BIS_fnc_param;

//Shop Title Name
ctrlSetText[3103,"Magasin Uniforme"];

_ret = [];
switch (_filter) do
{
	//Uniforms
	case 0:
	{
		_ret = 
		[
			["U_O_OfficerUniform_ocamo","Tenue secouriste",500],
			["U_B_HeliPilotCoveralls","Tenue dépanneur",500]
		];
	};
	
	//Hats
	case 1:
	{
		_ret =
		[
			["H_Cap_blk",nil,50],
			["H_Cap_marshal",nil,50]
		];
	};
	
	//Glasses
	case 2:
	{
		_ret = 
		[
			["G_Shades_Black",nil,25],
			["G_Shades_Blue",nil,20],
			["G_Sport_Blackred",nil,20],
			["G_Sport_Checkered",nil,20],
			["G_Sport_Blackyellow",nil,20],
			["G_Sport_BlackWhite",nil,20],
			["G_Aviator",nil,75],
			["G_Squares",nil,10],
			["G_Lowprofile",nil,30]
		];
	};
	
	//Vest
	case 3:
	{
		_ret =
		[	
		];
	};
	
	//Backpacks
	case 4:
	{
		_ret =
		[
			["B_Kitbag_sgg","MEDIC-Backpack",250],
			["B_Kitbag_cbr","ADAC-Backpack",250]
		];
	};
};

_ret;