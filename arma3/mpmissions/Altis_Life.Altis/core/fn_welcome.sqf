#include <macro.h> 
/*
	File: fn_welcome.sqf
	Author: DeadP4xel (SealDrop.de)
	
	Description:
	Erstellt ein schönen Regel Screen
*/

//Start erst nach Spawn

private ["_text","_intro"];

_intro = [];
_text = [];

switch (playerSide) do
{
	case west: 
	{
        _text = [
			format ["<t align='left'><t color='#ff1111'>S'il vous plaît garder notre serveur Roleplay il n'y aura pas d'autre avertissement!</t>"],
			format ["<t align='left'>Si ceci est votre première visite sur notre serveurs, nous vous demandons de lire attentivement le règlement. Disponible sur : SealDrop.de.</t>"],
			format ["<t align='left'>Pour consulter la bourse, Message, Argent... appuyer sur <t color='#FF8000'>Y</t>.</t>"],
			format ["<t align='left'><t color='#ff1111'>AltisLife est une BETA. Aucun remboursement n'est donc possible!</t>"],
			format ["<t align='left'>Les Admins vous souhaite beaucoup de plaisir sur ce serveur.</t>"],
			format ["<t align='left' color='#428BCA'>TS3 : TS_IP</t>"],
			format ["<t align='left' color='#428BCA'>Forum : HOMEPAGE_LINK</t>"]
		];
	};
	case independent:
	{
        _text = [
			format ["<t align='left'><t color='#ff1111'>S'il vous plaît garder notre serveur Roleplay il n'y aura pas d'autre avertissement!</t>"],
			format ["<t align='left'>Si ceci est votre première visite sur notre serveurs, nous vous demandons de lire attentivement le règlement. Disponible sur : SealDrop.de.</t>"],
			format ["<t align='left'>Pour consulter la bourse, Message, Argent... appuyer sur <t color='#FF8000'>Y</t>.</t>"],
			format ["<t align='left'><t color='#ff1111'>AltisLife est une BETA. Aucun remboursement n'est donc possible!</t>"],
			format ["<t align='left'>Les Admins vous souhaite beaucoup de plaisir sur ce serveur.</t>"],
			format ["<t align='left' color='#428BCA'>TS3 : TS_IP</t>"],
			format ["<t align='left' color='#428BCA'>Forum : HOMEPAGE_LINK</t>"]
		];
	};
	case civilian:
	{
        _text = [
			format ["<t align='left'><t color='#ff1111'>S'il vous plaît garder notre serveur Roleplay il n'y aura pas d'autre avertissement!</t>"],
			format ["<t align='left'>Si ceci est votre première visite sur notre serveurs, nous vous demandons de lire attentivement le règlement. Disponible sur : SealDrop.de.</t>"],
			format ["<t align='left'>Pour consulter la bourse, Message, Argent... appuyer sur <t color='#FF8000'>Y</t>.</t>"],
			format ["<t align='left'><t color='#ff1111'>AltisLife est une BETA. Aucun remboursement n'est donc possible!</t>"],
			format ["<t align='left'>Les Admins vous souhaite beaucoup de plaisir sur ce serveur.</t>"],
			format ["<t align='left' color='#428BCA'>TS3 : TS_IP</t>"],
			format ["<t align='left' color='#428BCA'>Forum : HOMEPAGE_LINK</t>"]
		];
	};
};

{
	_intro set [count _intro, (parseText _x)];
} forEach _text;
        
format ["Bonjour %1, Bienvenue sur notre serveur !", name player] hintC _intro;
