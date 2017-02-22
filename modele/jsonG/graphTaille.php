<?php

//setting header to json
header('Content-Type: application/json');
//database
define('SERVEUR', 'localhost');
define('UTILISATEUR', 'root');
define('MOTDEPASSE', 'admin');
define('BASEDEDONNEES', 'ouhouhin');

function getBD() {
    $cnx = connexion(SERVEUR, UTILISATEUR, MOTDEPASSE, BASEDEDONNEES);
    return $cnx;
}

function connexion($serv, $util, $mdp, $bdd) {
    $logIn = new PDO('mysql:host=' . $serv . ';dbname=' . $bdd, $util, $mdp, array(PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES utf8", PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION));
    return $logIn;
}

function executeR($logIn, $sql, $arg = null) {
    if ($arg == null) {
        $resReque = $logIn->query($sql);
    } else {
        $resReque = $logIn->prepare($sql);
        $resReque->execute($arg);
    }
    return $resReque;
}

$cnx = getBD();

$req = "SELECT nomEspece, ROUND(AVG(taille), 2) 'tMoyenne' 
        FROM animaux, especes
        WHERE animaux.idEspece = especes.idEspece 
        GROUP BY 1";

$reqChart = executeR($cnx, $req);



foreach ($reqChart as $ligne){
    $espece[] = $ligne;
};

print json_encode($espece);

