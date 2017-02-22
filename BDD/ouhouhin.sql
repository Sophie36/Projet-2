-- creation de la table sexe
CREATE TABLE IF NOT EXISTS sexe(
        idSexe int (11) Auto_increment  NOT NULL COMMENT 'R�f�rence sexe : 1 = Masculin/2 = F�minin',
        sexe   Enum ("M","F") NOT NULL COMMENT 'R�f�rence sexe : M = Masculin-M�le/2 = F�minin-Femelle',
        PRIMARY KEY (idSexe)
)CHARACTER SET UTF8 ENGINE=InnoDB;

-- creation de la table continent
CREATE TABLE IF NOT EXISTS continent(
        idContinent  int (11) Auto_increment  NOT NULL COMMENT 'R�f�rence continent',
        nomContinent Varchar (40) COMMENT 'D�nomination continent',
        PRIMARY KEY (idContinent)
)CHARACTER SET UTF8 ENGINE=InnoDB;

-- creation de la table pays
CREATE TABLE IF NOT EXISTS pays(
        idPays      int (11) Auto_increment  NOT NULL COMMENT 'R�f�rence pays',
        nomPays     Varchar (40) COMMENT 'D�nomination pays',
        idContinent Int(11) NOT NULL COMMENT 'R�f�rence continent',
        PRIMARY KEY (idPays)
)CHARACTER SET UTF8 ENGINE=InnoDB;

-- creation de la table employes
CREATE TABLE IF NOT EXISTS employes(
        idEmploye     int (11) Auto_increment  NOT NULL COMMENT 'R�f�rence de l\'employ�',
        nomEmploye    Char (40) NOT NULL COMMENT 'Nom de l\'employ�',
        prenomEmploye Char (40) NOT NULL COMMENT 'Nom de l\'employ�',
        fonction      Varchar (40) NOT NULL COMMENT 'Fonction occup�e par l\'employ�',
        motDePasse    Text NOT NULL COMMENT 'Mot de passe de l\'employ�',
        avatar        Varchar (40) NOT NULL DEFAULT 'avatarDefaut.png' COMMENT 'Nom de l\'image',
        adresse_mail  Varchar (40) NULL  COMMENT 'Adresse mail de l\'employ�',
        login         VARCHAR(40) NOT NULL COMMENT 'Login de l\'employ�',
        droits        Smallint NOT NULL COMMENT 'Droits : 1 = Stagiaire / 2 = V�t�rinaire-Chef / 3 = Administrateur',
        idSexe        Int(11) NOT NULL COMMENT 'R�f�rence sexe : 1 = Masculin/2 = F�minin',
        PRIMARY KEY (idEmploye)
)CHARACTER SET UTF8 ENGINE=InnoDB;

-- creation de la table especes 
CREATE TABLE IF NOT EXISTS especes(
        idEspece    int (11) Auto_increment  NOT NULL COMMENT 'R�f�rence de l\'esp�ce',
        nomEspece   Char (40) COMMENT 'D�nomination de l\'esp�ce',
        description Text COMMENT 'Descriptif de l\'esp�ce',
        gestation   Smallint COMMENT 'Temps de gestation (mois)',
        regime      Varchar (80) COMMENT 'R�gime alimentaire de l\'esp�ce',
        statut      Enum ("Menac�e","Vuln�rable","Prot�g�e","Non inscrit") COMMENT 'Statut de l\'esp�ce',
        idParcelle  Int(11) NOT NULL COMMENT 'R�f�rence de l\'enclos',
        PRIMARY KEY (idEspece)
)CHARACTER SET UTF8 ENGINE=InnoDB;

-- creation de la table animaux
CREATE TABLE IF NOT EXISTS animaux(
        idAnimaux           int (11) Auto_increment NOT NULL COMMENT 'R�f�rence de l\'animal',
        poids               float COMMENT 'Poids de l\'animal (Kg)',
        taille              Numeric COMMENT 'Taille de l\'animal (cm)',
        prenomAnimal        Varchar (40) COMMENT 'Pr�nom de l\'animal',
        photo               Text NOT NULL COMMENT 'Portrait de l\'animal',
        date_naissance      Date COMMENT 'Date de naissance de l\'animal',
        lieu_naissance      Varchar (20) COMMENT 'Lieu de naissance de l\'animal',
        date_deces          Date COMMENT 'Date de d�c�s de l\'animal',
        pere                Int(11) COMMENT 'R�f�rence de l\'animal p�re',
        mere                Int(11) COMMENT 'R�f�rence de l\'animal m�re',
        idParcelle          Int(11) NOT NULL COMMENT 'R�f�rence de l\'enclos',
        description         Text COMMENT 'Descriptif de l\'animal',
        statut              Enum ("Prete","Transfere") ,
        idPays              Int(11) NOT NULL COMMENT 'R�f�rence de l\'origine g�ographique',
        idEspece            Int(11) NOT NULL COMMENT 'R�f�rence de l\'origine raciale',
        idSexe              Int(11) NOT NULL COMMENT 'R�f�rence sexe : 1 = Masculin / 2 = F�minin',
        PRIMARY KEY (idAnimaux)
)CHARACTER SET UTF8 ENGINE=InnoDB;

-- creation de la table parcelle
CREATE TABLE IF NOT EXISTS parcelle(
        idParcelle  int (11) Auto_increment  NOT NULL COMMENT 'R�f�rence de l\'enclos',
        nomParcelle Varchar (40) COMMENT 'D�nomination de l\'enclos',
        idEspece    int (11) NOT NULL COMMENT 'R�f�rence de l\'esp�ce',
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
('Am�rique du Nord'),
('Am�rique du Sud'),
('Europe'),
('Oc�anie')
;

-- alimentation de la table pays
INSERT INTO `pays` (`nomPays`, `idContinent`) VALUES
('B�nin', 1),
('Cameroun', 1),
('Congo', 1),
('Ethiopie', 1),
('Gabon', 1),
('Kenya', 1),
('Mali', 1),
('Sahara', 1),
('S�n�gal', 1),
('Tanzanie', 1),
('Togo', 1),
('Za�re', 1),
('Br�sil', 4),
('Cerrado', 4),
('Costa Rica', 4),
('France', 5),
('Honduras', 3),
('Sumatra', 6)
;

-- alimentation dans la table employes
INSERT INTO `employes` (`login`, `nomEmploye`, `prenomEmploye`, `fonction`, `motDePasse`, `avatar`, `adresse_mail`, `droits`, `idSexe`) 
VALUES
('vlacroix', 'Lacroix', 'Val�rie', 'Administrateur', 'rbtqe6qV', '484830.png', 'vlacroix@ouhouhin.fr', 3, 2),
('ecourtemanche', 'Courtemanche', 'Eug�ne', 'Chef Animalier', 'qKlJfWoB', 'userlogom.png', 'ecourtemanche@ouhouhin.fr', 2, 1),
('tpoisson', 'Poisson', 'Tyson', 'V�t�rinaire', 'gZH6Yurc', 'userlogom.png', 'tpoisson@ouhouhin.fr', 2, 1),
('tbler', 'Bler', 'Th�odore', 'V�t�rinaire', '6CEJJIOW', 'userlogom.png', 'tbler@ouhouhin.fr', 2, 1),
('obeland', 'B�land', 'Oc�ane', 'Stagiaire', 'jjLUf1of', 'userlogof.png', 'obeland@ouhouhin.fr', 1, 2),
('davare', 'Avare', 'D�sir�', 'Stagiaire', 'HEIvrKFB', 'userlogof.png', 'davare@ouhouhin.fr', 1, 2),
('cpoirier', 'Poirier', 'Charles', 'Stagiaire', '0GoDzMMS', 'userlogom.png', 'cpoirier@ouhouhin.fr', 1, 1),
('agaulin', 'Gaulin', 'Arianne', 'Stagiaire', '4S5ecSZN', 'userlogof.png', 'agaulin@ouhouhin.fr', 1, 2),
('stheberge', 'Th�berge', 'Suzette', 'Stagiaire', 'HAnadwZZ', 'userlogof.png', 'stheberge@ouhouhin.fr', 1, 2),
('mdesjardins', 'Desjardins', 'Marjollaine', 'Stagiaire', 'd8ZjuJTs', 'userlogof.png', 'mdesjardins@ouhouhin.fr', 1, 2),
('mduhamel', 'Duhamel', 'Mirabelle', 'Stagiaire', 'X9b3JlMM', 'userlogof.png', 'mduhamel@ouhouhin.fr', 1, 2),
('jlampron', 'Lampron', 'J�r�me', 'Stagiaire', 'h5vRfo69', 'userlogom.png', 'jlampron@ouhouhin.fr', 1, 1),
('acouet', 'Couet', 'Angelette', 'Stagiaire', 'FXlzS6fm', 'userlogof.png', 'acouet@ouhouhin.fr', 1, 2),
('ytanguay', 'Tanguay', 'Yolande', 'Stagiaire', 'tMxG9d78', 'userlogof.png', 'ytanguay@ouhouhin.fr', 1, 2),
('mricher', 'Richer', 'M�lodie', 'Stagiaire', 'L6s37Kzd', 'userlogof.png', 'mricher@ouhouhin.fr', 1, 2),
('driquier', 'Riquier', 'Didier', 'Stagiaire', 'FkA73d5h', 'userlogom.png', 'driquier@ouhouhin.fr', 1, 1),
('arossignol', 'rossignol', 'anthony', 'stagiaire', '123456', 'userlogom.png', '123456', 1, 1);

-- alimentation de la table especes 
INSERT INTO especes (nomEspece, description, gestation, regime, statut, idParcelle) VALUES 

("Babouin", "Nom : Papio cynocephalus
 Famille : Cercopith�cid�s
 Identification : Museau de chien, se d�place essentiellement � quatre pattes ; m�les deux fois plus gros que les femelles ; pelage vert-jaune
 Taille : De 55 � 84 cm (m�les) ; de 36 � 60 cm (femelles) ; queue : de 53 � 66 cm (m�les) de 35 � 56 cm (femelles)
 Poids : De 20 � 25 kg (m�les), de 8 � 16 kg (femelles)
 Habitat : For�ts ouvertes, savanes arbustives et arbor�es, steppes, pr�s des for�ts-galeries et des collines rocheuses ; domaine vital moyen de 50 km2
 Organisation sociale : Troupe mixte de 10 � 150 animaux
 Nombre de jeunes par port�e : 1 (rarement des jumeaux)
 Esp�rance de vie : De 30 � 45 ans
 Effectifs : Abondants mais inconnus pr�cis�ment ; stables
 Statut : Esp�ce inscrite en Annexe II de la Cites (Convention sur le commerce international des esp�ces menac�es d'extinction).", 180, "Omnivore", "Menac�e", 1), 

("Bonobo", "Nom : Pan paniscus
 Famille : Hominid�s
 Identification : Museau de chien, se d�place essentiellement � quatre pattes ; m�les deux fois plus gros que les femelles ; pelage vert-jaune
 Taille : De 55 � 84 cm (m�les) ; de 36 � 60 cm (femelles) ; queue : de 53 � 66 cm (m�les) de 35 � 56 cm (femelles)
 Poids : De 20 � 25 kg (m�les), de 8 � 16 kg (femelles)
 Habitat : For�ts ouvertes, savanes arbustives et arbor�es, steppes, pr�s des for�ts-galeries et des collines rocheuses ; domaine vital moyen de 50 km2
 Organisation sociale : Troupe mixte de 10 � 150 animaux
 Nombre de jeunes par port�e : 1 (rarement des jumeaux)
 Esp�rance de vie : De 30 � 45 ans
 Statut : Esp�ce inscrite en Annexe II de la Cites (Convention sur le commerce international des esp�ces menac�es d'extinction).", 180, "Omnivore", "Prot�g�e", 2), 

("Capucin", "Nom : Cebus capucinus
 Famille :Cebida�s
 Identification : Le visage est g�n�ralement rose et la quantit� de fourrure blanche qui le recouvre est variable selon les classes d��ge et de sexe.
 Taille : entre 33.5 � 45,3 cm et sa queue mesure entre 35.0 et 55,1 cm
 Poids : Les femelles p�sent en moyenne 2,67 kg alors que les m�les atteignent un poids moyen de 3,87 kg
 Habitat : Il se trouve dans les for�ts tropicales humides et s�ches, les for�ts inond�es, les for�ts de mangrove, les for�ts-galeries, ainsi que dans les for�ts s�ches � feuilles caduques o� les averses sont absentes 5 � 6 mois de l�ann�e.
 R�partition : Sa distribution g�ographique s��tend de l�extr�me nord-ouest de l��quateur jusqu�au Honduras, en passant par l�ouest de la Colombie, le Panama, le Costa Rica ainsi que le Nicaragua. 
 Organisation sociale : La taille moyenne d�un groupe est de 16 individus
 Nombre de jeunes par port�e : 1 (rarement des jumeaux)
 Esp�rance de vie : 10 ans
 Statut : Esp�ce inscrite en Annexe II de la Cites (Convention sur le commerce international des esp�ces menac�es d'extinction)", 160, "Omnivore", "Menac�e", 3), 

("Chimpanz�", "Nom : Pan
 Famille : Hominid�s
 Identification : Museau de chien, se d�place essentiellement � quatre pattes ; m�les deux fois plus gros que les femelles ; pelage vert-jaune
 Taille : De 55 � 84 cm (m�les) ; de 36 � 60 cm (femelles) ; queue : de 53 � 66 cm (m�les) de 35 � 56 cm (femelles)
 Poids : De 20 � 25 kg (m�les), de 8 � 16 kg (femelles)
 Habitat : For�ts ouvertes, savanes arbustives et arbor�es, steppes, pr�s des for�ts-galeries et des collines rocheuses ; domaine vital moyen de 50 km2
 Organisation sociale : Troupe mixte de 10 � 150 animaux
 Nombre de jeunes par port�e : 1 (rarement des jumeaux)
 Esp�rance de vie : De 30 � 45 ans
 Statut : Esp�ce inscrite en Annexe II de la Cites (Convention sur le commerce international des esp�ces menac�es d'extinction).", 180, "Omnivore � dominance herbivore, notamment frugivore ", "Vuln�rable", 4), 

("Colobe", "Nom : Colobus guereza
 Famille : Cercopithecidae
 Identification : La fourrure de ces animaux est noire et blanche de fa�on tr�s contrast�e. La coloration principale est noire, et de mani�re diverse, des parties du visage, de la poitrine, des �paules ou de la queue sont blanches, parfois sous la forme de longs manteaux de poils en forme de U, ou d'une queue en houppette. Comme pour tous les colobes, la disparition du pouce est une adaptation au mode de vie arboricole
 Taille : 45 � 72 cm
 Poids : 5 � 14,5kg
 Habitat : for�ts humides et les for�ts de mangrove que les for�ts de montagne jusqu'� 3 000 m�tres au-dessus du niveau de la mer. Ils viennent aussi parfois dans les prairies arbor�es.
 Organisation sociale : 
 Port�e : 1 (rarement des jumeaux)
 Esp�rance de vie : 20 ans
 Statut : Esp�ce inscrite en Annexe II de la Cites (Convention sur le commerce international des esp�ces menac�es d'extinction).", 175, "V�g�tarien", "Prot�g�e", 5), 

("G�lada", "Nom : Theropithecus gelada
 Famille :Cercopith�cid�s
 Identification : Ils poss�dent une �paisse fourrure qui ressemble � une crini�re et qui leur vaut l�appellation de singe lion. Le m�le poss�de sur le torse une zone rouge, d�pourvue de poils, en forme de sablier. Les canines de ce primate sont tr�s d�velopp�es.
 Taille : 40 � 50 cm pour les femelles et 55 � 65 cm pour les m�les
 Poids : 15 � 25 Kg pour le male et  10 � 15 Kg pour la femelle
 Habitat : Les geladas passent leurs nuits dans les escarpements, � l�abri des pr�dateurs. Ils remontent sur les plateaux en d�but de journ�e et attendent le lever du soleil avant de partir � la recherche de nourriture.
 Organisation sociale :bandes de plusieurs harems compos�s d�un m�le dominant et de trois � vingt femelles.
 Port�e : 1 (rarement des jumeaux)
 Esp�rance de vie : 20 � 25 ans (jusqu'� 30 ans en captivit�)
 Statut : Bien que non list�s comme esp�ce en danger, seuls 50 � 60 000 g�ladas ont �t� recens�s. ", 175, "Herbivore", "Non inscrit", 6), 

("Gibbon", "Nom : Gibbon
 Famille : Hylobatidae
 Identification : Les gibbons sont des singes d�pourvus de queue, qui se caract�risent par leurs tr�s longs bras. Ils se d�placent de branches en branches, en se balan�ant au bout de leurs bras, et en sautant d'arbre en arbre. Ils ne descendent quasiment jamais � terre, et marchent tr�s peu.
Le gibbon � mains blanches ou gibbon lar, est le singe le plus rapide au monde, pouvant atteindre la vitesse de 65 km/h, il est tr�s rapide dans les arbres, quand il est au sol par contre, il ne se d�place pas vite.
 Taille : 70 � 90cm
 Poids : 8 � 11kg  pour les m�les, 6,5 kg pour les femelles
 Habitat : for�ts tropicales d�Asie du Sud-Est : Chine, Laos, Vietnam, Cambodge, Tha�lande, Bengladesh,Myanmar, nord-est de l�Inde, Malaisie et bien s�r en Indon�sie.
 Organisation sociale : Ils vivent en couple (uni jusqu'� la mort de l�un des deux partenaires) avec leur petits, sur un territoire aux limites bien pr�cises. 
 Port�e : 1 par port�e
 Esp�rance de vie : environ 35 ans", 210, "Arboricoles", "Menac�e", 7), ("Gorille", "Nom : Gorilla gorilla gorilla
 Famille : Hominid�s
 Identification :  Comme tous les anthropo�des, les gorilles sont d�pourvus de queue. Leur anatomie est puissante, le visage et les oreilles sont glabres et ils pr�sentent des torus supra-orbitaires marqu�s.
 Taille : 1,70 m�tre
 Poids : 275kg  pour les m�les, 90 � 150 kg pour les femelles
 Habitat : les gorilles vivent en groupes dans les for�ts tropicales ou subtropicales
 Organisation sociale :  La composition des groupes varie de deux � trente individus, la moyenne se situant entre 10 et 15.
 Port�e 
 Esp�rance de vie : 30 ans en milieu naturel, jusqu'� 50 ans en captivit�", 260, "V�g�tarien", "Prot�g�e", 8), 

 ("Macaque", "Nom : Macaca singes catarhiniens 
 Famille : Cercopithecidae
 Identification : Le pelage des macaques va du beige au noir en passant par toutes les nuances du brun. La face se colore en rose ou m�me en rouge. Les macaques ont des abajoues, ce sont deux poches qui s'ouvrent dans la bouche. Ils peuvent y emmagasiner rapidement de la nourriture pour ensuite la manger tranquillement, loin de leurs concurrents. Leurs yeux, plac�s frontalement, leur donnent une vision en trois dimensions semblable � celle de l'�tre humain.
 Taille : 79 � 95 cm
 Poids : 10 � 14 kg pour le m�le et de 8 � 10 kg pour la femelle.
 Habitat : Ils sont capables de vivre � proximit� des �tres humains, de leurs champs et de leurs habitations.
 Organisation sociale : Le macaque est un singe social qui vit en bandes de plusieurs dizaines d�individus.
 Port�e : donne naissance � un unique jeune qui n�est totalement sevr� qu�au bout de deux ans
 Esp�rance de vie : environ 20 ans", 180, "Omnivore", "Menac�e", 9), 

 ("Mandrill", "Nom : Mandrillus sphinx
 Famille : Cercopithecidae
 Identification : Malgr� son pelage qui peut �tre gris, vert olive ou noir, sauf sur la partie ventrale o� il est blanc, c'est probablement le singe le plus color�. Il poss�de une face glabre avec un long museau muni de canines longues et puissantes.
 Taille : 65 � 100 cm
 Poids :  50 kg pour le m�le et de 20 kg pour la femelle.
 Habitat : Le mandrill est une esp�ce foresti�re que l'on trouve principalement dans les for�ts tropicales du Cameroun dans le secteur du rio Muni et du Gabon, mais �galement en Guin�e �quatoriale, en R�publique d�mocratique du Congo et au Nigeria.
 Organisation sociale : hordes peuvent se composer de 15 jusqu'� 100 individus
 Port�e : 1
 Esp�rance de vie : 20 � 30 ans", 175, "Omnivore", "Menac�e", 10), 

 ("Marmouset", "Nom : Ouistitis ou Callitriches
 Famille : C�bid�s
 Identification :  Leur robe est tant�t blanche, tant�t sombre ou bien encore agouti, une sorte de brun chin�. Les ouistitis sont les seuls singes � poss�der de longues soies sur chaque poignet, v�ritables poils tactiles. Ils ont un pelage mouchet� ou tachet� (de noir avec soit du blanc, du jaune, du chamois ou du rouge�tre), la queue annel�e de noir et de gris, les oreilles touffues (poils blancs, noirs ou jaunes)
 Taille : 15 cm
 Poids : 120 et 400 g
 Habitat : Ils sont indig�nes aux for�ts humides du Br�sil, du P�rou, de la Bolivie, de l��quateur et de la Colombie.
 Organisation sociale : Dans la nature, la vie en groupe assure une meilleure protection contre les pr�dateurs, mais en captivit�, les ouistitis pr�f�rent vivre en couple. La nuit, les membres du groupe se pelotonnent, comportement baptis� huddling ('blottissement') en anglais. Pendant le repos ou le sommeil, le ouistiti enroule sa queue entre ses jambes.
 Port�e : deux jumeaux deux fois par an des l��ge de 2 ans. La gestation dure 4 � 5 mois et l�allaitement 1 mois.
 Esp�rance de vie : 18 ans en captivit�", 140, "Omnivore, Frugivore, Gommivore", "Vuln�rable", 11), 

 ("SA Laineux", "Nom : singe araign�e
 Famille :  At�lid�s
 Identification : Sa fourrure varie du noir au brun ou encore chamois.
 Taille : 40 � 60cm
 Poids : 9,6 � 15 kg pour le m�le et de 8 � 11 kg pour la femelle.
 Habitat : On le retrouve dans la for�t tropicale du sud du Br�sil, au centre du Mexique, � Panama et en Bolivie.
 Organisation sociale :  Tr�s sociables, ils vivent en troupes d�environ 20 individus. Cependant, ils sont tr�s rarement vus ensemble, ils ne se regroupent essentiellement que pour la recherche de nourriture.
 Port�e :1
 Esp�rance de vie : environ 20 ans", 210, "Frugivore", "Prot�g�e", 12);

-- alimentation de la table animaux
INSERT INTO animaux (poids, taille, prenomAnimal, photo, date_naissance, lieu_naissance, date_deces, pere, mere, idParcelle, description, statut, idPays, idEspece, idSexe) 
VALUES 
(33,102,"Patio","Patio.png","2007-07-05","Zoo Ethiopie",NULL,NULL,NULL,1,"Male de 9 ans ayant un caract�re assez fort et  voulant toujours faire sa loi, attention avec les petits", "pr�t�",4 ,1 ,1 ),
(12,54,"L�onne","L�onne.png","2008-04-03","Zoo Afrique Australe",NULL,NULL,NULL,1,"Femelle de 8 ans venant de mettre bas, elle est tr�s protectrice avec son petit et serait m�me agressive avec le male",NULL, 6, 1, 2),
(2,25,"Franzie","Franzie.png","2016-08-27","Zoo",NULL,1,2,1,"Le petit est n� avec un pelage noir, son visage et ses oreilles �taient bien roses. Il commence � se d�brouiller tout seul",NULL,16 ,1 ,1),
(37,98,"Hanon","Hanon.png","2009-10-15","Zoo",NULL,NULL,NULL,1,"Male tr�s doux et craintif, c'est tr�s bien fait adopt� par le clan","transf�r�", 10, 1 ,1),
(1,25,"Suzy","Suzy.png","2016-12-25","Zoo",NULL,6,7,2,"Petite femelle nourrit au biberon car la m�re refuse de la nourrir",NULL,16 ,2 , 2),
(42,115,"Arthur","Arthur.png","2002-09-27","Zoo Apeldoorn",NULL,NULL,NULL,2,"Male preter le temps de la reproduction mais il est tr�s docile","pr�t�",12 , 2, 1),
(34,111,"Horine","Horine.png","2005-05-03","Zoo",NULL,NULL,NULL,2,"Elle n'a pas du tout la fibre maternel et refuse de s'occuper de son b�b�",NULL, 12, 2, 2),
(3.2,45,"Gizzmo","Gizzmo.png","2009-08-18","Zoo",NULL,NULL,NULL,3,"Tr�s bon reproducteur et tr�s sociable partis pour 2 ans au Zoo de Madrid","transf�r�",15, 3, 1),
(3.8,41,"Orion","Orion.png","2011-10-30","Zoo Amiens",NULL,NULL,NULL,3,"N�e dans le Zoo Amiens et nous a �t� �chang� pour le sociabilis� et permettre qu'il s'�panouisse",NULL, 17, 3, 1),
(0.85,20,"Gizzo","Gizzo.png","2017-01-01","Zoo",NULL,8,11,3,"Le b�b� se porte bien et �volue correctement, tr�s proche de ses deux parents",NULL, 16 ,3 ,1),
(2.5,34,"Aimy","Aimy.png","2010-12-04","Zoo de la  Palmyre",NULL,NULL,NULL,3,"Tr�s proche de son b�b�, elle nous interdit de l'approch� c'est une tr�s bonne m�re",NULL, 15 ,3 , 2),
(18,72,"Rodolf","Rodolf.png","2012-02-08","Milieu naturel",NULL,NULL,NULL,4,"Captur� dans son milieu naturel et ramener b�b� dans le zoo vers environ 3 mois, tr�s proche du personnel",NULL, 9, 4, 1),
(14,56,"Chita","Chita.png","2007-01-29","Zoo",NULL,NULL,NULL,4,"femelle douce et caline, une tr�s bonne m�re et laisse facilement approch� son petit pour les soins",NULL, 11, 4, 2),
(4,23,"PtitChito","PtitChito.png","2016-11-12","Zoo",NULL,15,13,4,"Joli petit male tr�s farouche il faut y aller avec beaucoup de pr�caution avec lui",NULL, 16, 4, 1),
(24,80,"Chito","Chito.png","1998-03-03","Zoo",NULL,NULL,NULL,4,"Il est tr�s personnel, ignore compl�tement son petit et sa femelle",NULL, 1, 4, 1),
(12,67,"Tacos","Tacos.png","2002-11-21","Zoo",NULL,NULL,NULL,5,"Tr�s bon male proche de ses femelles et un p�re protecteur","transf�r�", 4, 5, 1),
(13.5,72,"Dirk","Dirk.png","1999-05-02","Zoo",NULL,NULL,NULL,5,"un bon p�p�re qui est proche de la retraite, tr�s calin","pr�t�", 6, 5, 1),
(8.7,51,"Akita","Akita.png","2009-08-18","Zoo",NULL,NULL,NULL,5,"Petite femelle bonne maman protectrice" ,NULL, 10, 5, 2),
(1,21,"Chillye","Chillye.png","2016-10-30","Zoo",NULL,16,18,5,"Petite femelle tr�s bon d�veloppement , profite correctement",NULL, 16, 5, 2),
(14,46,"Havana","Havana.png","2001-08-27","Zoo",NULL,NULL,NULL,6,"Femelle farouche au d�part avec l'humain mais plus facile � approcher ensuite",NULL, 6, 6, 2),
(12, 59,"Jethro","Jethro.png","2000-09-11","Zoo",NULL,NULL,NULL,6,"Male ayant d�j� eut plusieurs descendances et �tant un peu plus fragile suite � son age",NULL, 4, 6, 1),
(8.4,30,"Irma","Irma.png","2016-04-18","Zoo",NULL,21,20,6,"Jeune femelle tr�s caract�rielle et ne voulant en faire qu'a sa t�te",NULL, 16, 6, 2),
(10.7,90,"Floyd","Floyd.png","1979-01-14","Zoo","2015-12-12",NULL,NULL,7,"Superbe male, il est mort de vieillesse, c'�tait un tr�s beau male",NULL, 18, 7, 1),
(6.3,72,"Floris","Floris.png","2002-03-31","Zoo Branfere", NULL, NULL, NULL,7,"Cette femelle nous a �t� pr�t� avec son male afin d'avoir une prog�niture qui pourra rest� chez nous apr�s le sevrage. Elle est tr�s douce et se laisse examin� facilement","pr�t�", 18, 7, 2),
(1.2,24,"Dafney","Dafney.png","2016-11-05","Zoo",NULL,27,24,7,"Belle petite femelle qui se d�veloppe tr�s bien",NULL, 16, 7, 2),
(1.7,27,"Diesel","Diesel.png","2016-11-05","Zoo",NULL,27,24,7,"Beau petit male suis la m�me courbe que sa s�ur",NULL, 16, 7, 1),
(10.8,87,"Whisky","Whisky.png","2004-02-23","Zoo Branfere",NULL,NULL,NULL,7,"Male tr�s protecteur pour sa femelle et ses petits ram�ne tout ce qu'il faut � sa femelle pour qu'elle ne s'occupe que de ses petits","pr�t�", 18, 7, 1),
(267,168,"Bloomer","Bloomer.png","1968-05-24","Zoo","2016-09-04",NULL,NULL,7,"Beau male d�c�d� de vieillesse dans sa parcelle mais n'a pas souffert",NULL, 2, 8, 1),
(245,165,"Bobby","Bobby.png","1984-07-06","Zoo",NULL,NULL,NULL,8,"Superbe male avec une belle prestance, tr�s proche de sa femelle",NULL, 3, 8, 1),
(123,159,"Angie","Angie.png","1993-08-27","Zoo",NULL,NULL,NULL,8,"Femelle ayant eut d�j� plusieurs port�es tr�s bonne maman mais faire attention on ne peux pas approch� son petit facilement",NULL, 5, 8, 2),
(6.8,67,"Baby","Baby.png","2016-09-28","Zoo",NULL,29,30,8,"Beau b�b� male a eut un d�but dificile car n� avant le terme oblig� de le perfuser mais � bien �volu� depuis",NULL, 16, 8, 1),
(14,92,"Saurent","Saurent.png","1999-11-02","Zoo",NULL,NULL,NULL,9,"Male capricieux, beaucoup de mal � le pr�senter � sa femelle mais maintenant il ne reste qu'avec elle",NULL, 16, 9, 1),
(9.2,81,"Vera","Vera.png","2004-02-26","Zoo",NULL,NULL,NULL,9,"Femelle assez ind�pendante et qui n'h�site pas � repousser son male m�me son petit",NULL, 8, 9, 2),
(2.1,24,"Baileys","Baileys.png","2016-09-11","Zoo",NULL,32,33,9,"B�b� en manque attention par sa m�re nous sommes oblig�s de le sollicit� pour son d�veloppement et l'aider � s'alimenter",NULL, 8, 9, 1),
(47,99,"Vivian","Vivian.png","1998-02-06","Zoo",NULL,NULL,NULL,10,"Male tr�s fier de lui, tr�s attentif � son clan n'h�site pas � s'occuper de son petit pour son �panouissement",NULL, 2, 10, 1),
(18,78,"Ashley","Ashley.png","2001-11-05","Zoo",NULL,NULL,NULL,10,"Femelle craintive toujours � surveill� que personne ne va venir  pendant qu'elle nourrit son petit et s'occupe bien de son petit",NULL, 5, 10, 2),
(8,32,"Bubbles","Bubbles.png","2016-08-28","Zoo",NULL,35,36,10,"Petit male qui cherche de plus en plus � s'�loigner de sa m�re, il est tr�s alerte et vif",NULL, 16, 10, 1),
(0.265,15,"Olaf","Olaf.png","2008-07-22","Zoo",NULL,NULL,NULL,11,"Male tr�s curieux mais pas du tout int�ress� pas sa femelle qu'il ignore et d�laisse compl�tement depuis le d�c�s de son autre femelle � surveill�",NULL, 16, 11, 1),
(0.125,12,"Rosy","Rosy.png","2010-03-01","Zoo",NULL,NULL,NULL,11,"Petite femelle tr�s curieuse qui essaye de se rapprocher de son male mais celui-ci la rejete donc pas de petits pour l'instant",NULL, 13, 11, 2),
(0.387,14,"Victoria","Victoria.png","1999-02-12","Zoo","2017-01-20",NULL,NULL,11,"Premi�re femelle de Olaf qui est d�c�d� derni�rement, elle a eut plusieurs petits qui ont tous �t� donn� dans d'autres Zoos",NULL, 14, 11, 2),
(15.1,57,"Argos","Argos.png","1998-10-18","Zoo",NULL,NULL,NULL,12,"Beau male reproducteur et proche de sa tribu, va jusqu'� chercher la nourriture pour sa femelle afin qu'elle ne s'occupe exclusivement que de son petit",NULL, 13, 12, 1),
(10.8,43,"Chilie","Chilie.png","2002-06-14","Zoo",NULL,NULL,NULL,12,"Femelle ne s'occupant que de son petit et nous laissant l'approch� sans aucun probl�me.Tr�s douce et attentive avec lui  ",NULL, 13, 12, 1),
(2.3,21,"Caleb","Caleb.png","2017-01-01","Zoo",NULL,41,42,12,"B�b� en bonne progression, se d�veloppe bien. Bien coll� � sa m�re",NULL, 13, 12, 1)
;

-- alimentation de la table parcelle
INSERT INTO parcelle (nomParcelle, idEspece) VALUES ("Territoire des Babouins", 1), ("Territoire des Bonobos", 2), ("Territoire des Capucins", 3), ("Territoire des Chimpanz�s", 4), ("Territoire des Colobes", 5), ("Territoire des G�ladas", 6), ("Territoire des Gibbons", 7), ("Territoire des Gorilles", 8), ("Territoire des Macaques", 9), ("Territoire des Mandrills", 10), ("Territoire des Marmousets", 11), ("Territoire des Lagotriches", 12);

-- ajout des contraintes
ALTER TABLE animaux ADD CONSTRAINT fk_animaux_sexe FOREIGN KEY (idSexe) REFERENCES sexe(idSexe);
ALTER TABLE employes ADD CONSTRAINT fk_employes_sexe FOREIGN KEY (idSexe) REFERENCES sexe(idSexe);
ALTER TABLE animaux ADD CONSTRAINT fk_animaux_idPays FOREIGN KEY (idPays) REFERENCES pays(idPays);
ALTER TABLE animaux ADD CONSTRAINT fk_animaux_espece FOREIGN KEY (idEspece) REFERENCES especes(idEspece);
ALTER TABLE animaux ADD CONSTRAINT fk_animaux_parcelle FOREIGN KEY (idParcelle) REFERENCES parcelle(idParcelle);
ALTER TABLE pays ADD CONSTRAINT fk_pays_continent FOREIGN KEY (idContinent) REFERENCES continent(idContinent);
ALTER TABLE parcelle ADD CONSTRAINT fk_parcelle_espece FOREIGN KEY (idEspece) REFERENCES especes(idEspece);

