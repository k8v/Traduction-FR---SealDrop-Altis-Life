waitUntil {!isNull player && player == player};
if(player diarySubjectExists "rules")exitwith{};

player createDiarySubject ["changelog","Changelog"];
player createDiarySubject ["serverrules","Règles du serveur"];
player createDiarySubject ["policerules","Règles Police"];
player createDiarySubject ["safezones","SafeZones"];
//player createDiarySubject ["civrules","Règles Civil"];
player createDiarySubject ["illegalitems","Illegal"];
//player createDiarySubject ["gangrules","Règles Gang"];
//player createDiarySubject ["terrorrules","Règles Rebelle"];
player createDiarySubject ["controls","Autres"];

/*  Example
	player createDiaryRecord ["", //Container
		[
			"", //Subsection
				"
				TEXT HERE<br/><br/>
				"
		]
	];
*/
	player createDiaryRecord["changelog",
		[
			"Official Change Log",
				"
					Tous les changements sont sur : HOMEPAGE_URL
				"
		]
	];
	
	player createDiaryRecord["changelog",
		[
			"SealDrop Changelog",
				"
					Tous les changements sont sur : https://sealdrop.de/
				"
		]
	];

		player createDiaryRecord ["serverrules",
		[
			"Exploits", 
				"
				Tous les règles sont sur ! www.HOMEPAGE_URL!<br/>
				"
		]
	];
	
	player createDiaryRecord["safezones",
		[
			"Safe Zones",
				"
				Tous les règles sont sur ! www.HOMEPAGE_URL!<br/>
				"
		]
	];
					
	
	player createDiaryRecord ["serverrules",
		[
			"Infractions bannale", 
				"
				Tous les règles sont sur ! www.HOMEPAGE_URL!<br/>
				"
		]
	];
	
	player createDiaryRecord ["serverrules",
		[
			"Police Interaction", 
				"
				Tous les règles sont sur ! www.HOMEPAGE_URL!<br/>
				"
		]
	];
	
	player createDiaryRecord ["serverrules",
		[
			"Bateaux", 
				"
				Tous les règles sont sur ! www.HOMEPAGE_URL!<br/>
				"
		]
	];
	
	player createDiaryRecord ["serverrules",
		[
			"Aviation", 
				"
				Tous les règles sont sur ! www.HOMEPAGE_URL!<br/>
				"
		]
	];
	
	player createDiaryRecord ["serverrules",
		[
			"Vehicles", 
				"
				Tous les règles sont sur ! www.HOMEPAGE_URL!<br/>
				"
		]
	];
	
	player createDiaryRecord ["serverrules",
		[
			"Règles de communication", 
				"
				Tous les règles sont sur ! www.HOMEPAGE_URL!<br/>
				"
		]
	];
	
	player createDiaryRecord ["serverrules",
		[
			"Aléatoire Deathmatching (RDM)", 
				"
				Tous les règles sont sur ! www.HOMEPAGE_URL!<br/>
				"
		]
	];
	player createDiaryRecord ["serverrules",
		[
			"Nouvelle règle de vie", 
				"
				Tous les règles sont sur ! www.HOMEPAGE_URL!<br/>
				"
		]
	];

	player createDiaryRecord ["serverrules",
		[
			"Don't Be A Dick!", 
				"
				Tous les règles sont sur ! www.HOMEPAGE_URL!<br/>
				"
		]
	];
	
// Police Section
	player createDiaryRecord ["policerules",
		[
			"Negotiation de crise",
				"
				Tous les règles sont sur ! www.HOMEPAGE_URL!<br/>
				"
		]
	];
	player createDiaryRecord ["policerules",
		[
			"Banque de France",
				"
				Tous les règles sont sur ! www.HOMEPAGE_URL!<br/>
				"
		]
	];
	player createDiaryRecord ["policerules",
		[
			"Aviation",
				"
				Tous les règles sont sur ! www.HOMEPAGE_URL!<br/>hélicoptères ne peuvent voler au dessus de la ville. Cops ne peuvent voler au dessus de la ville sauf si il ya une opération de Police actif en cours.<br/><br/>
				"
		]
	];
	
	player createDiaryRecord ["policerules",
		[
			"Zones Illegal", 
				"
				Tous les règles sont sur ! www.HOMEPAGE_URL!<br/>
				"
		]
	];
	
	player createDiaryRecord ["policerules",
		[
			"Patrouiller", 
				"
				Tous les règles sont sur ! www.HOMEPAGE_URL!<br/>
				"
		]
	];
	
	player createDiaryRecord ["policerules",
		[
			"Checkpoints", 
				"
				Tous les règles sont sur ! www.HOMEPAGE_URL!<br/>
				"
		]
	];
	
	player createDiaryRecord ["policerules",
		[
			"Les Vehicules", 
				"
				Tous les règles sont sur ! www.HOMEPAGE_URL!<br/>
				"
		]
	];

	player createDiaryRecord ["policerules",
		[
			"Vitesse", 
				"
				Dans les capitales: 30Km/h<br/>
				Les routes principales: 120Km/h<br/>
				"
		]
	];
	
	player createDiaryRecord ["policerules",
		[
			"Affectation", 
				"
				Tous les règles sont sur ! www.HOMEPAGE_URL!<br/>
				"
		]
	];
	
	player createDiaryRecord ["policerules",
		[
			"Gefägnis und Tickets",
				"
				Tous les règles sont sur ! www.HOMEPAGE_URL!<br/>
				"
		]
	];
		
	player createDiaryRecord ["policerules",
		[
			"Armes légales", 
				"
				Armes légales Civil (Avec permis d'armes à feu):<br/>
				1. P07<br/>
				3. ACP-C2<br/>
				5. PDW2000<br/><br/>
				"
		]
	];
	
	player createDiaryRecord ["policerules",
		[
			"Utilisation d'armes",
				"
				Tous les règles sont sur ! www.HOMEPAGE_URL!<br/>
				"
		]
	];

	player createDiaryRecord ["policerules",
		[
			"Raids",
				"
				Tous les règles sont sur ! www.HOMEPAGE_URL!<br/>
				"
		]
	];
	
	player createDiaryRecord ["policerules",
		[
			"Rang",
				"
				Rang:<br/>
				1. Recrues<br/>
				2. Police<br/>
				3. Chef de Police<br/>
				4. Commandant de Police<br/>
				5. SEK<br/>
				6. GSG9<br/>
				"
		]
	];
	
	player createDiaryRecord ["policerules",
		[
			"Autres",
				"
				Tous les règles sont sur ! www.HOMEPAGE_URL!<br/>
				"
		]
	];
	
	player createDiaryRecord ["policerules",
		[
			"Règles Teamspeak",
				"
				1. Tous les agents de Police doivent être sur le TeamSpeak.<br/>
				2. Trouver plus sur HOMEPAGE_URL<br/><br/>
				"
		]
	];
	
	
	
// Illegal Items Section
	player createDiaryRecord ["illegalitems",
		[
			"Règles Rebelle",
				"
				Tous les règles sont sur ! www.HOMEPAGE_URL!<br/>
				"
		]
	];
	player createDiaryRecord ["illegalitems",
		[
			"Règles Gang",
				"
				Tous les règles sont sur ! www.HOMEPAGE_URL!<br/>
				"
		]
	];
	player createDiaryRecord ["illegalitems",
		[
			"Véhicules illégales",
				"
				1. Ifrit<br/>
				2. Speedboat<br/>
				3. Hunter<br/>
				4. Police Offroad+<br/>
				5. Ifrit-HMG+<br/>
				6. Hunter-HMG+<br/>
				7. Strider<br/>
				8. Police Hunter+<br/>
				9. Police Limo+<br/>
				"
		]
	];
	player createDiaryRecord ["illegalitems",
		[
			"Armes illégales",
				"
				1. MX Series<br/>
				2. Katiba Series<br/>
				3. TRG Series<br/>
				4. Mk.20 Series<br/>
				5. Mk.18 EBR<br/>
				6. SDAR Rifle<br/>
				7. Sting SMG<br/>
				8. Silenced Rock40 (Tazer)<br/>
				9. Sprengstoff<br/>
				10. Zafir/Mk200<br/>
				11. M320 LRR<br/>
				12. Vermin ACP<br/>
				"
		]
	];
	player createDiaryRecord ["illegalitems",
		[
			"Produits illégaux",
				"
				Les matières premières suivantes sont illégales:<br/><br/>
				1. Tortues<br/>
				2. Cocaïne<br/>
				3. Héroïne<br/>
				4. Cannabis<br/>
				5. Marijuana<br/>
				6. Meth<br/>
				7. Alcool de contrebande<br/>
				8. lingots d'or<br/>
				9. Uranium III<br/>
				10. Rognons<br/>
				"
		]
	];

	
// Controls Section

	player createDiaryRecord ["controls",
		[
			"SealDrop Contrôle",
				"
				Z: Menu Joueurs<br/>
				U: Vehicules bloquer/debloquer<br/>
				F: Police Sirene<br/>
				T: Vehicle Trunk<br/>
				Ö: Police klaxon<br/>
				Ä: Cop barrières ouvertes<br/>
				O: Cops Sortir la herses<br/>
				^: Pioche<br/>
				Left Shift + 1: Telephone<br/>
				Left Shift + 2: WantedList<br/>
				Left Shift + 3: Poursuivre<br/>
				Left Shift + R: Arrêter<br/>
				Left Shift + G: Consacré<br/>
				Left Shift + V: Knockout<br/>
				Left Shift + O: Civ Restrain<br/>
				Left Shift + Space: Saut<br/>
				Left Shift + H: Etuis d'armes à feu<br/>
				Left Windows: Option de logement<br/>
				Left Windows: Fermes aux champs<br/>
				Left Windows: Menu Interaction Joueur<br/>
				"
		]
	];