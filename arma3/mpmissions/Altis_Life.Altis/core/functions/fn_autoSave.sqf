/* 
	Author: DeadP4xel für SealDrop.de
*/

while {true} do {
	uiSleep 1800;
	[] call SOCK_fnc_updateRequest;
	hintSilent "Vos informations joueur ont été automatiquement enregistrées sur le serveur\n\n Prochaine Auto-save: 30 Minutes"
};