-- creation de la table sexe
CREATE TABLE IF NOT EXISTS sexe(
        idSexe int (11) Auto_increment  NOT NULL COMMENT 'Référence sexe : 1 = Masculin/2 = Féminin',
        sexe   Enum ("M","F") NOT NULL COMMENT 'Référence sexe : M = Masculin-Mâle/2 = Féminin-Femelle',
        PRIMARY KEY (idSexe)
)CHARACTER SET UTF8 ENGINE=InnoDB;

-- creation de la table continent
CREATE TABLE IF NOT EXISTS continent(
        idContinent  int (11) Auto_increment  NOT NULL COMMENT 'Référence continent',
        nomContinent Varchar (40) COMMENT 'Dénomination continent',
        PRIMARY KEY (idContinent)
)CHARACTER SET UTF8 ENGINE=InnoDB;

-- creation de la table pays
CREATE TABLE IF NOT EXISTS pays(
        idPays      int (11) Auto_increment  NOT NULL COMMENT 'Référence pays',
        nomPays     Varchar (40) COMMENT 'Dénomination pays',
        idContinent Int(11) NOT NULL COMMENT 'Référence continent',
        PRIMARY KEY (idPays)
)CHARACTER SET UTF8 ENGINE=InnoDB;

-- creation de la table employes
CREATE TABLE IF NOT EXISTS employes(
        idEmploye     int (11) Auto_increment  NOT NULL COMMENT 'Référence de l\'employé',
        nomEmploye    Char (40) NOT NULL COMMENT 'Nom de l\'employé',
        prenomEmploye Char (40) NOT NULL COMMENT 'Nom de l\'employé',
        fonction      Varchar (40) NOT NULL COMMENT 'Fonction occupée par l\'employé',
        motDePasse    Text NOT NULL COMMENT 'Mot de passe de l\'employé',
        avatar        Varchar (40) NOT NULL DEFAULT 'avatarDefaut.png' COMMENT 'Nom de l\'image',
        adresse_mail  Varchar (40) NULL  COMMENT 'Adresse mail de l\'employé',
        login         VARCHAR(40) NOT NULL COMMENT 'Login de l\'employé',
        droits        Smallint NOT NULL COMMENT 'Droits : 1 = Stagiaire / 2 = Vétérinaire-Chef / 3 = Administrateur',
        idSexe        Int(11) NOT NULL COMMENT 'Référence sexe : 1 = Masculin/2 = Féminin',
        PRIMARY KEY (idEmploye)
)CHARACTER SET UTF8 ENGINE=InnoDB;

-- creation de la table especes 
CREATE TABLE IF NOT EXISTS especes(
        idEspece    int (11) Auto_increment  NOT NULL COMMENT 'Référence de l\'espèce',
        nomEspece   Char (40) COMMENT 'Dénomination de l\'espèce',
        description Text COMMENT 'Descriptif de l\'espèce',
        gestation   Smallint COMMENT 'Temps de gestation (mois)',
        regime      Varchar (80) COMMENT 'Régime alimentaire de l\'espèce',
        statut      Enum ("Menacée","Vulnérable","Protégée","Non inscrit") COMMENT 'Statut de l\'espèce',
        idParcelle  Int(11) NOT NULL COMMENT 'Référence de l\'enclos',
        PRIMARY KEY (idEspece)
)CHARACTER SET UTF8 ENGINE=InnoDB;

-- creation de la table animaux
CREATE TABLE IF NOT EXISTS animaux(
        idAnimaux           int (11) Auto_increment NOT NULL COMMENT 'Référence de l\'animal',
        poids               float COMMENT 'Poids de l\'animal (Kg)',
        taille              Numeric COMMENT 'Taille de l\'animal (cm)',
        prenomAnimal        Varchar (40) COMMENT 'Prénom de l\'animal',
        photo               Text NOT NULL COMMENT 'Portrait de l\'animal',
        date_naissance      Date COMMENT 'Date de naissance de l\'animal',
        lieu_naissance      Varchar (20) COMMENT 'Lieu de naissance de l\'animal',
        date_deces          Date COMMENT 'Date de décés de l\'animal',
        pere                Int(11) COMMENT 'Référence de l\'animal père',
        mere                Int(11) COMMENT 'Référence de l\'animal mère',
        idParcelle          Int(11) NOT NULL COMMENT 'Référence de l\'enclos',
        description         Text COMMENT 'Descriptif de l\'animal',
        statut              Enum ("Prete","Transfere") ,
        idPays              Int(11) NOT NULL COMMENT 'Référence de l\'origine géographique',
        idEspece            Int(11) NOT NULL COMMENT 'Référence de l\'origine raciale',
        idSexe              Int(11) NOT NULL COMMENT 'Référence sexe : 1 = Masculin / 2 = Féminin',
        PRIMARY KEY (idAnimaux)
)CHARACTER SET UTF8 ENGINE=InnoDB;

-- creation de la table parcelle
CREATE TABLE IF NOT EXISTS parcelle(
        idParcelle  int (11) Auto_increment  NOT NULL COMMENT 'Référence de l\'enclos',
        nomParcelle Varchar (40) COMMENT 'Dénomination de l\'enclos',
        idEspece    int (11) NOT NULL COMMENT 'Référence de l\'espèce',
        PRIMARY KEY (idParcelle)
)CHARACTER SET UTF8 ENGINE=InnoDB;


-- alimentation de la table sexe
INSERT INTO sexe (sexe) VALUES 
("M"),
("F")
;

-- alimentation de la table continent
INSERT INTO `continent` (`nomContinent`) VALUES
('Afrique'),
('Asie'),
('Amérique du Nord'),
('Amérique du Sud'),
('Europe'),
('Océanie')
;

-- alimentation de la table pays
INSERT INTO `pays` (`nomPays`, `idContinent`) VALUES
('Bénin', 1),
('Cameroun', 1),
('Congo', 1),
('Ethiopie', 1),
('Gabon', 1),
('Kenya', 1),
('Mali', 1),
('Sahara', 1),
('Sénégal', 1),
('Tanzanie', 1),
('Togo', 1),
('Zaïre', 1),
('Brésil', 4),
('Cerrado', 4),
('Costa Rica', 4),
('France', 5),
('Honduras', 3),
('Sumatra', 6)
;

-- alimentation dans la table employes
INSERT INTO `employes` (`login`, `nomEmploye`, `prenomEmploye`, `fonction`, `motDePasse`, `avatar`, `adresse_mail`, `droits`, `idSexe`) 
VALUES
('vlacroix', 'Lacroix', 'Valérie', 'Administrateur', 'rbtqe6qV', '484830.png', 'vlacroix@ouhouhin.fr', 3, 2),
('ecourtemanche', 'Courtemanche', 'Eugéne', 'Chef Animalier', 'qKlJfWoB', 'userlogom.png', 'ecourtemanche@ouhouhin.fr', 2, 1),
('tpoisson', 'Poisson', 'Tyson', 'Vétérinaire', 'gZH6Yurc', 'userlogom.png', 'tpoisson@ouhouhin.fr', 2, 1),
('tbler', 'Bler', 'Théodore', 'Vétérinaire', '6CEJJIOW', 'userlogom.png', 'tbler@ouhouhin.fr', 2, 1),
('obeland', 'Béland', 'Océane', 'Stagiaire', 'jjLUf1of', 'userlogof.png', 'obeland@ouhouhin.fr', 1, 2),
('davare', 'Avare', 'Désiré', 'Stagiaire', 'HEIvrKFB', 'userlogof.png', 'davare@ouhouhin.fr', 1, 2),
('cpoirier', 'Poirier', 'Charles', 'Stagiaire', '0GoDzMMS', 'userlogom.png', 'cpoirier@ouhouhin.fr', 1, 1),
('agaulin', 'Gaulin', 'Arianne', 'Stagiaire', '4S5ecSZN', 'userlogof.png', 'agaulin@ouhouhin.fr', 1, 2),
('stheberge', 'Théberge', 'Suzette', 'Stagiaire', 'HAnadwZZ', 'userlogof.png', 'stheberge@ouhouhin.fr', 1, 2),
('mdesjardins', 'Desjardins', 'Marjollaine', 'Stagiaire', 'd8ZjuJTs', 'userlogof.png', 'mdesjardins@ouhouhin.fr', 1, 2),
('mduhamel', 'Duhamel', 'Mirabelle', 'Stagiaire', 'X9b3JlMM', 'userlogof.png', 'mduhamel@ouhouhin.fr', 1, 2),
('jlampron', 'Lampron', 'Jérôme', 'Stagiaire', 'h5vRfo69', 'userlogom.png', 'jlampron@ouhouhin.fr', 1, 1),
('acouet', 'Couet', 'Angelette', 'Stagiaire', 'FXlzS6fm', 'userlogof.png', 'acouet@ouhouhin.fr', 1, 2),
('ytanguay', 'Tanguay', 'Yolande', 'Stagiaire', 'tMxG9d78', 'userlogof.png', 'ytanguay@ouhouhin.fr', 1, 2),
('mricher', 'Richer', 'Mélodie', 'Stagiaire', 'L6s37Kzd', 'userlogof.png', 'mricher@ouhouhin.fr', 1, 2),
('driquier', 'Riquier', 'Didier', 'Stagiaire', 'FkA73d5h', 'userlogom.png', 'driquier@ouhouhin.fr', 1, 1),
('arossignol', 'rossignol', 'anthony', 'stagiaire', '123456', 'userlogom.png', '123456', 1, 1);

-- alimentation de la table especes 
INSERT INTO especes (nomEspece, description, gestation, regime, statut, idParcelle) VALUES 

("Babouin", "Nom : Papio cynocephalus
 Famille : Cercopithécidés
 Identification : Museau de chien, se déplace essentiellement à quatre pattes ; mâles deux fois plus gros que les femelles ; pelage vert-jaune
 Taille : De 55 à 84 cm (mâles) ; de 36 à 60 cm (femelles) ; queue : de 53 à 66 cm (mâles) de 35 à 56 cm (femelles)
 Poids : De 20 à 25 kg (mâles), de 8 à 16 kg (femelles)
 Habitat : Forêts ouvertes, savanes arbustives et arborées, steppes, près des forêts-galeries et des collines rocheuses ; domaine vital moyen de 50 km2
 Organisation sociale : Troupe mixte de 10 à 150 animaux
 Nombre de jeunes par portée : 1 (rarement des jumeaux)
 Espérance de vie : De 30 à 45 ans
 Effectifs : Abondants mais inconnus précisément ; stables
 Statut : Espèce inscrite en Annexe II de la Cites (Convention sur le commerce international des espèces menacées d'extinction).", 180, "Omnivore", "Menacée", 1), 

("Bonobo", "Nom : Pan paniscus
 Famille : Hominidés
 Identification : Museau de chien, se déplace essentiellement à quatre pattes ; mâles deux fois plus gros que les femelles ; pelage vert-jaune
 Taille : De 55 à 84 cm (mâles) ; de 36 à 60 cm (femelles) ; queue : de 53 à 66 cm (mâles) de 35 à 56 cm (femelles)
 Poids : De 20 à 25 kg (mâles), de 8 à 16 kg (femelles)
 Habitat : Forêts ouvertes, savanes arbustives et arborées, steppes, près des forêts-galeries et des collines rocheuses ; domaine vital moyen de 50 km2
 Organisation sociale : Troupe mixte de 10 à 150 animaux
 Nombre de jeunes par portée : 1 (rarement des jumeaux)
 Espérance de vie : De 30 à 45 ans
 Statut : Espèce inscrite en Annexe II de la Cites (Convention sur le commerce international des espèces menacées d'extinction).", 180, "Omnivore", "Protégée", 2), 

("Capucin", "Nom : Cebus capucinus
 Famille :Cebidaés
 Identification : Le visage est généralement rose et la quantité de fourrure blanche qui le recouvre est variable selon les classes d’âge et de sexe.
 Taille : entre 33.5 à 45,3 cm et sa queue mesure entre 35.0 et 55,1 cm
 Poids : Les femelles pèsent en moyenne 2,67 kg alors que les mâles atteignent un poids moyen de 3,87 kg
 Habitat : Il se trouve dans les forêts tropicales humides et sèches, les forêts inondées, les forêts de mangrove, les forêts-galeries, ainsi que dans les forêts sèches à feuilles caduques où les averses sont absentes 5 à 6 mois de l’année.
 Répartition : Sa distribution géographique s’étend de l’extrême nord-ouest de l’Équateur jusqu’au Honduras, en passant par l’ouest de la Colombie, le Panama, le Costa Rica ainsi que le Nicaragua. 
 Organisation sociale : La taille moyenne d’un groupe est de 16 individus
 Nombre de jeunes par portée : 1 (rarement des jumeaux)
 Espérance de vie : 10 ans
 Statut : Espèce inscrite en Annexe II de la Cites (Convention sur le commerce international des espèces menacées d'extinction)", 160, "Omnivore", "Menacée", 3), 

("Chimpanzé", "Nom : Pan
 Famille : Hominidés
 Identification : Museau de chien, se déplace essentiellement à quatre pattes ; mâles deux fois plus gros que les femelles ; pelage vert-jaune
 Taille : De 55 à 84 cm (mâles) ; de 36 à 60 cm (femelles) ; queue : de 53 à 66 cm (mâles) de 35 à 56 cm (femelles)
 Poids : De 20 à 25 kg (mâles), de 8 à 16 kg (femelles)
 Habitat : Forêts ouvertes, savanes arbustives et arborées, steppes, près des forêts-galeries et des collines rocheuses ; domaine vital moyen de 50 km2
 Organisation sociale : Troupe mixte de 10 à 150 animaux
 Nombre de jeunes par portée : 1 (rarement des jumeaux)
 Espérance de vie : De 30 à 45 ans
 Statut : Espèce inscrite en Annexe II de la Cites (Convention sur le commerce international des espèces menacées d'extinction).", 180, "Omnivore à dominance herbivore, notamment frugivore ", "Vulnérable", 4), 

("Colobe", "Nom : Colobus guereza
 Famille : Cercopithecidae
 Identification : La fourrure de ces animaux est noire et blanche de façon très contrastée. La coloration principale est noire, et de manière diverse, des parties du visage, de la poitrine, des épaules ou de la queue sont blanches, parfois sous la forme de longs manteaux de poils en forme de U, ou d'une queue en houppette. Comme pour tous les colobes, la disparition du pouce est une adaptation au mode de vie arboricole
 Taille : 45 à 72 cm
 Poids : 5 à 14,5kg
 Habitat : forêts humides et les forêts de mangrove que les forêts de montagne jusqu'à 3 000 mètres au-dessus du niveau de la mer. Ils viennent aussi parfois dans les prairies arborées.
 Organisation sociale : 
 Portée : 1 (rarement des jumeaux)
 Espérance de vie : 20 ans
 Statut : Espèce inscrite en Annexe II de la Cites (Convention sur le commerce international des espèces menacées d'extinction).", 175, "Végétarien", "Protégée", 5), 

("Gélada", "Nom : Theropithecus gelada
 Famille :Cercopithécidés
 Identification : Ils possèdent une épaisse fourrure qui ressemble à une crinière et qui leur vaut l’appellation de singe lion. Le mâle possède sur le torse une zone rouge, dépourvue de poils, en forme de sablier. Les canines de ce primate sont très développées.
 Taille : 40 à 50 cm pour les femelles et 55 à 65 cm pour les mâles
 Poids : 15 à 25 Kg pour le male et  10 à 15 Kg pour la femelle
 Habitat : Les geladas passent leurs nuits dans les escarpements, à l’abri des prédateurs. Ils remontent sur les plateaux en début de journée et attendent le lever du soleil avant de partir à la recherche de nourriture.
 Organisation sociale :bandes de plusieurs harems composés d’un mâle dominant et de trois à vingt femelles.
 Portée : 1 (rarement des jumeaux)
 Espérance de vie : 20 à 25 ans (jusqu'à 30 ans en captivité)
 Statut : Bien que non listés comme espèce en danger, seuls 50 à 60 000 géladas ont été recensés. ", 175, "Herbivore", "Non inscrit", 6), 

("Gibbon", "Nom : Gibbon
 Famille : Hylobatidae
 Identification : Les gibbons sont des singes dépourvus de queue, qui se caractérisent par leurs très longs bras. Ils se déplacent de branches en branches, en se balançant au bout de leurs bras, et en sautant d'arbre en arbre. Ils ne descendent quasiment jamais à terre, et marchent très peu.
Le gibbon à mains blanches ou gibbon lar, est le singe le plus rapide au monde, pouvant atteindre la vitesse de 65 km/h, il est très rapide dans les arbres, quand il est au sol par contre, il ne se déplace pas vite.
 Taille : 70 à 90cm
 Poids : 8 à 11kg  pour les mâles, 6,5 kg pour les femelles
 Habitat : forêts tropicales d’Asie du Sud-Est : Chine, Laos, Vietnam, Cambodge, Thaïlande, Bengladesh,Myanmar, nord-est de l’Inde, Malaisie et bien sûr en Indonésie.
 Organisation sociale : Ils vivent en couple (uni jusqu'à la mort de l’un des deux partenaires) avec leur petits, sur un territoire aux limites bien précises. 
 Portée : 1 par portée
 Espérance de vie : environ 35 ans", 210, "Arboricoles", "Menacée", 7), ("Gorille", "Nom : Gorilla gorilla gorilla
 Famille : Hominidés
 Identification :  Comme tous les anthropoïdes, les gorilles sont dépourvus de queue. Leur anatomie est puissante, le visage et les oreilles sont glabres et ils présentent des torus supra-orbitaires marqués.
 Taille : 1,70 mètre
 Poids : 275kg  pour les mâles, 90 à 150 kg pour les femelles
 Habitat : les gorilles vivent en groupes dans les forêts tropicales ou subtropicales
 Organisation sociale :  La composition des groupes varie de deux à trente individus, la moyenne se situant entre 10 et 15.
 Portée 
 Espérance de vie : 30 ans en milieu naturel, jusqu'à 50 ans en captivité", 260, "Végétarien", "Protégée", 8), 

 ("Macaque", "Nom : Macaca singes catarhiniens 
 Famille : Cercopithecidae
 Identification : Le pelage des macaques va du beige au noir en passant par toutes les nuances du brun. La face se colore en rose ou même en rouge. Les macaques ont des abajoues, ce sont deux poches qui s'ouvrent dans la bouche. Ils peuvent y emmagasiner rapidement de la nourriture pour ensuite la manger tranquillement, loin de leurs concurrents. Leurs yeux, placés frontalement, leur donnent une vision en trois dimensions semblable à celle de l'être humain.
 Taille : 79 à 95 cm
 Poids : 10 à 14 kg pour le mâle et de 8 à 10 kg pour la femelle.
 Habitat : Ils sont capables de vivre à proximité des êtres humains, de leurs champs et de leurs habitations.
 Organisation sociale : Le macaque est un singe social qui vit en bandes de plusieurs dizaines d’individus.
 Portée : donne naissance à un unique jeune qui n’est totalement sevré qu’au bout de deux ans
 Espérance de vie : environ 20 ans", 180, "Omnivore", "Menacée", 9), 

 ("Mandrill", "Nom : Mandrillus sphinx
 Famille : Cercopithecidae
 Identification : Malgré son pelage qui peut être gris, vert olive ou noir, sauf sur la partie ventrale où il est blanc, c'est probablement le singe le plus coloré. Il possède une face glabre avec un long museau muni de canines longues et puissantes.
 Taille : 65 à 100 cm
 Poids :  50 kg pour le mâle et de 20 kg pour la femelle.
 Habitat : Le mandrill est une espèce forestière que l'on trouve principalement dans les forêts tropicales du Cameroun dans le secteur du rio Muni et du Gabon, mais également en Guinée équatoriale, en République démocratique du Congo et au Nigeria.
 Organisation sociale : hordes peuvent se composer de 15 jusqu'à 100 individus
 Portée : 1
 Espérance de vie : 20 à 30 ans", 175, "Omnivore", "Menacée", 10), 

 ("Marmouset", "Nom : Ouistitis ou Callitriches
 Famille : Cébidés
 Identification :  Leur robe est tantôt blanche, tantôt sombre ou bien encore agouti, une sorte de brun chiné. Les ouistitis sont les seuls singes à posséder de longues soies sur chaque poignet, véritables poils tactiles. Ils ont un pelage moucheté ou tacheté (de noir avec soit du blanc, du jaune, du chamois ou du rougeâtre), la queue annelée de noir et de gris, les oreilles touffues (poils blancs, noirs ou jaunes)
 Taille : 15 cm
 Poids : 120 et 400 g
 Habitat : Ils sont indigènes aux forêts humides du Brésil, du Pérou, de la Bolivie, de l’Équateur et de la Colombie.
 Organisation sociale : Dans la nature, la vie en groupe assure une meilleure protection contre les prédateurs, mais en captivité, les ouistitis préfèrent vivre en couple. La nuit, les membres du groupe se pelotonnent, comportement baptisé huddling ('blottissement') en anglais. Pendant le repos ou le sommeil, le ouistiti enroule sa queue entre ses jambes.
 Portée : deux jumeaux deux fois par an des l’âge de 2 ans. La gestation dure 4 à 5 mois et l’allaitement 1 mois.
 Espérance de vie : 18 ans en captivité", 140, "Omnivore, Frugivore, Gommivore", "Vulnérable", 11), 

 ("SA Laineux", "Nom : singe araignée
 Famille :  Atélidés
 Identification : Sa fourrure varie du noir au brun ou encore chamois.
 Taille : 40 à 60cm
 Poids : 9,6 – 15 kg pour le mâle et de 8 – 11 kg pour la femelle.
 Habitat : On le retrouve dans la forêt tropicale du sud du Brésil, au centre du Mexique, à Panama et en Bolivie.
 Organisation sociale :  Très sociables, ils vivent en troupes d’environ 20 individus. Cependant, ils sont très rarement vus ensemble, ils ne se regroupent essentiellement que pour la recherche de nourriture.
 Portée :1
 Espérance de vie : environ 20 ans", 210, "Frugivore", "Protégée", 12);

-- alimentation de la table animaux
INSERT INTO animaux (poids, taille, prenomAnimal, photo, date_naissance, lieu_naissance, date_deces, pere, mere, idParcelle, description, statut, idPays, idEspece, idSexe) 
VALUES 
(33,102,"Patio","Patio.png","2007-07-05","Zoo Ethiopie",NULL,NULL,NULL,1,"Male de 9 ans ayant un caractère assez fort et  voulant toujours faire sa loi, attention avec les petits", "prêté",4 ,1 ,1 ),
(12,54,"Léonne","Léonne.png","2008-04-03","Zoo Afrique Australe",NULL,NULL,NULL,1,"Femelle de 8 ans venant de mettre bas, elle est très protectrice avec son petit et serait même agressive avec le male",NULL, 6, 1, 2),
(2,25,"Franzie","Franzie.png","2016-08-27","Zoo",NULL,1,2,1,"Le petit est né avec un pelage noir, son visage et ses oreilles étaient bien roses. Il commence à se débrouiller tout seul",NULL,16 ,1 ,1),
(37,98,"Hanon","Hanon.png","2009-10-15","Zoo",NULL,NULL,NULL,1,"Male très doux et craintif, c'est très bien fait adopté par le clan","transfèré", 10, 1 ,1),
(1,25,"Suzy","Suzy.png","2016-12-25","Zoo",NULL,6,7,2,"Petite femelle nourrit au biberon car la mère refuse de la nourrir",NULL,16 ,2 , 2),
(42,115,"Arthur","Arthur.png","2002-09-27","Zoo Apeldoorn",NULL,NULL,NULL,2,"Male preter le temps de la reproduction mais il est très docile","prêté",12 , 2, 1),
(34,111,"Horine","Horine.png","2005-05-03","Zoo",NULL,NULL,NULL,2,"Elle n'a pas du tout la fibre maternel et refuse de s'occuper de son bébé",NULL, 12, 2, 2),
(3.2,45,"Gizzmo","Gizzmo.png","2009-08-18","Zoo",NULL,NULL,NULL,3,"Très bon reproducteur et très sociable partis pour 2 ans au Zoo de Madrid","transfèré",15, 3, 1),
(3.8,41,"Orion","Orion.png","2011-10-30","Zoo Amiens",NULL,NULL,NULL,3,"Née dans le Zoo Amiens et nous a été échangé pour le sociabilisé et permettre qu'il s'épanouisse",NULL, 17, 3, 1),
(0.85,20,"Gizzo","Gizzo.png","2017-01-01","Zoo",NULL,8,11,3,"Le bébé se porte bien et évolue correctement, très proche de ses deux parents",NULL, 16 ,3 ,1),
(2.5,34,"Aimy","Aimy.png","2010-12-04","Zoo de la  Palmyre",NULL,NULL,NULL,3,"Très proche de son bébé, elle nous interdit de l'approché c'est une très bonne mère",NULL, 15 ,3 , 2),
(18,72,"Rodolf","Rodolf.png","2012-02-08","Milieu naturel",NULL,NULL,NULL,4,"Capturé dans son milieu naturel et ramener bébé dans le zoo vers environ 3 mois, très proche du personnel",NULL, 9, 4, 1),
(14,56,"Chita","Chita.png","2007-01-29","Zoo",NULL,NULL,NULL,4,"femelle douce et caline, une très bonne mère et laisse facilement approché son petit pour les soins",NULL, 11, 4, 2),
(4,23,"PtitChito","PtitChito.png","2016-11-12","Zoo",NULL,15,13,4,"Joli petit male très farouche il faut y aller avec beaucoup de précaution avec lui",NULL, 16, 4, 1),
(24,80,"Chito","Chito.png","1998-03-03","Zoo",NULL,NULL,NULL,4,"Il est très personnel, ignore complétement son petit et sa femelle",NULL, 1, 4, 1),
(12,67,"Tacos","Tacos.png","2002-11-21","Zoo",NULL,NULL,NULL,5,"Très bon male proche de ses femelles et un père protecteur","transfèré", 4, 5, 1),
(13.5,72,"Dirk","Dirk.png","1999-05-02","Zoo",NULL,NULL,NULL,5,"un bon pépère qui est proche de la retraite, très calin","prêté", 6, 5, 1),
(8.7,51,"Akita","Akita.png","2009-08-18","Zoo",NULL,NULL,NULL,5,"Petite femelle bonne maman protectrice" ,NULL, 10, 5, 2),
(1,21,"Chillye","Chillye.png","2016-10-30","Zoo",NULL,16,18,5,"Petite femelle très bon développement , profite correctement",NULL, 16, 5, 2),
(14,46,"Havana","Havana.png","2001-08-27","Zoo",NULL,NULL,NULL,6,"Femelle farouche au départ avec l'humain mais plus facile à approcher ensuite",NULL, 6, 6, 2),
(12, 59,"Jethro","Jethro.png","2000-09-11","Zoo",NULL,NULL,NULL,6,"Male ayant déjà eut plusieurs descendances et étant un peu plus fragile suite à son age",NULL, 4, 6, 1),
(8.4,30,"Irma","Irma.png","2016-04-18","Zoo",NULL,21,20,6,"Jeune femelle très caractérielle et ne voulant en faire qu'a sa tête",NULL, 16, 6, 2),
(10.7,90,"Floyd","Floyd.png","1979-01-14","Zoo","2015-12-12",NULL,NULL,7,"Superbe male, il est mort de vieillesse, c'était un très beau male",NULL, 18, 7, 1),
(6.3,72,"Floris","Floris.png","2002-03-31","Zoo Branfere", NULL, NULL, NULL,7,"Cette femelle nous a été prêté avec son male afin d'avoir une progéniture qui pourra resté chez nous après le sevrage. Elle est très douce et se laisse examiné facilement","prêté", 18, 7, 2),
(1.2,24,"Dafney","Dafney.png","2016-11-05","Zoo",NULL,27,24,7,"Belle petite femelle qui se développe très bien",NULL, 16, 7, 2),
(1.7,27,"Diesel","Diesel.png","2016-11-05","Zoo",NULL,27,24,7,"Beau petit male suis la même courbe que sa sœur",NULL, 16, 7, 1),
(10.8,87,"Whisky","Whisky.png","2004-02-23","Zoo Branfere",NULL,NULL,NULL,7,"Male très protecteur pour sa femelle et ses petits ramène tout ce qu'il faut à sa femelle pour qu'elle ne s'occupe que de ses petits","prêté", 18, 7, 1),
(267,168,"Bloomer","Bloomer.png","1968-05-24","Zoo","2016-09-04",NULL,NULL,7,"Beau male décédé de vieillesse dans sa parcelle mais n'a pas souffert",NULL, 2, 8, 1),
(245,165,"Bobby","Bobby.png","1984-07-06","Zoo",NULL,NULL,NULL,8,"Superbe male avec une belle prestance, très proche de sa femelle",NULL, 3, 8, 1),
(123,159,"Angie","Angie.png","1993-08-27","Zoo",NULL,NULL,NULL,8,"Femelle ayant eut déjà plusieurs portées très bonne maman mais faire attention on ne peux pas approché son petit facilement",NULL, 5, 8, 2),
(6.8,67,"Baby","Baby.png","2016-09-28","Zoo",NULL,29,30,8,"Beau bébé male a eut un début dificile car né avant le terme obligé de le perfuser mais à bien évolué depuis",NULL, 16, 8, 1),
(14,92,"Saurent","Saurent.png","1999-11-02","Zoo",NULL,NULL,NULL,9,"Male capricieux, beaucoup de mal à le présenter à sa femelle mais maintenant il ne reste qu'avec elle",NULL, 16, 9, 1),
(9.2,81,"Vera","Vera.png","2004-02-26","Zoo",NULL,NULL,NULL,9,"Femelle assez indépendante et qui n'hésite pas à repousser son male même son petit",NULL, 8, 9, 2),
(2.1,24,"Baileys","Baileys.png","2016-09-11","Zoo",NULL,32,33,9,"Bébé en manque attention par sa mère nous sommes obligés de le sollicité pour son développement et l'aider à s'alimenter",NULL, 8, 9, 1),
(47,99,"Vivian","Vivian.png","1998-02-06","Zoo",NULL,NULL,NULL,10,"Male très fier de lui, très attentif à son clan n'hésite pas à s'occuper de son petit pour son épanouissement",NULL, 2, 10, 1),
(18,78,"Ashley","Ashley.png","2001-11-05","Zoo",NULL,NULL,NULL,10,"Femelle craintive toujours à surveillé que personne ne va venir  pendant qu'elle nourrit son petit et s'occupe bien de son petit",NULL, 5, 10, 2),
(8,32,"Bubbles","Bubbles.png","2016-08-28","Zoo",NULL,35,36,10,"Petit male qui cherche de plus en plus à s'éloigner de sa mère, il est très alerte et vif",NULL, 16, 10, 1),
(0.265,15,"Olaf","Olaf.png","2008-07-22","Zoo",NULL,NULL,NULL,11,"Male très curieux mais pas du tout intéressé pas sa femelle qu'il ignore et délaisse complètement depuis le décès de son autre femelle à surveillé",NULL, 16, 11, 1),
(0.125,12,"Rosy","Rosy.png","2010-03-01","Zoo",NULL,NULL,NULL,11,"Petite femelle très curieuse qui essaye de se rapprocher de son male mais celui-ci la rejete donc pas de petits pour l'instant",NULL, 13, 11, 2),
(0.387,14,"Victoria","Victoria.png","1999-02-12","Zoo","2017-01-20",NULL,NULL,11,"Première femelle de Olaf qui est décédé dernièrement, elle a eut plusieurs petits qui ont tous été donné dans d'autres Zoos",NULL, 14, 11, 2),
(15.1,57,"Argos","Argos.png","1998-10-18","Zoo",NULL,NULL,NULL,12,"Beau male reproducteur et proche de sa tribu, va jusqu'à chercher la nourriture pour sa femelle afin qu'elle ne s'occupe exclusivement que de son petit",NULL, 13, 12, 1),
(10.8,43,"Chilie","Chilie.png","2002-06-14","Zoo",NULL,NULL,NULL,12,"Femelle ne s'occupant que de son petit et nous laissant l'approché sans aucun problème.Très douce et attentive avec lui  ",NULL, 13, 12, 1),
(2.3,21,"Caleb","Caleb.png","2017-01-01","Zoo",NULL,41,42,12,"Bébé en bonne progression, se développe bien. Bien collé à sa mère",NULL, 13, 12, 1)
;

-- alimentation de la table parcelle
INSERT INTO parcelle (nomParcelle, idEspece) VALUES ("Territoire des Babouins", 1), ("Territoire des Bonobos", 2), ("Territoire des Capucins", 3), ("Territoire des Chimpanzés", 4), ("Territoire des Colobes", 5), ("Territoire des Géladas", 6), ("Territoire des Gibbons", 7), ("Territoire des Gorilles", 8), ("Territoire des Macaques", 9), ("Territoire des Mandrills", 10), ("Territoire des Marmousets", 11), ("Territoire des Lagotriches", 12);

-- ajout des contraintes
ALTER TABLE animaux ADD CONSTRAINT fk_animaux_sexe FOREIGN KEY (idSexe) REFERENCES sexe(idSexe);
ALTER TABLE employes ADD CONSTRAINT fk_employes_sexe FOREIGN KEY (idSexe) REFERENCES sexe(idSexe);
ALTER TABLE animaux ADD CONSTRAINT fk_animaux_idPays FOREIGN KEY (idPays) REFERENCES pays(idPays);
ALTER TABLE animaux ADD CONSTRAINT fk_animaux_espece FOREIGN KEY (idEspece) REFERENCES especes(idEspece);
ALTER TABLE animaux ADD CONSTRAINT fk_animaux_parcelle FOREIGN KEY (idParcelle) REFERENCES parcelle(idParcelle);
ALTER TABLE pays ADD CONSTRAINT fk_pays_continent FOREIGN KEY (idContinent) REFERENCES continent(idContinent);
ALTER TABLE parcelle ADD CONSTRAINT fk_parcelle_espece FOREIGN KEY (idEspece) REFERENCES especes(idEspece);

