<?php

require_once 'include/libs/Smarty.class.php';

$tpl = new Smarty();
$ficheAnimal = [];

$reqConsAnimal = $tabReqConsult[0];
$reqAgeAnimal = $tabReqConsult[1];
$reqEspeceAnimal = $tabReqConsult[2];
$reqSexAnimal = $tabReqConsult[3];
$reqPaysAnimal = $tabReqConsult[4];

if ($ligne = $reqConsAnimal->fetch()) {
    $ficheAnimal['idAnimal'] = $ligne['idAnimaux'];
    $ficheAnimal['photo'] = '<img class="iPortrait" src= "img/imgFiches/' . $ligne['photo'] . '">';
    $ficheAnimal['prenomAnimal'] = $ligne['prenomAnimal'];
    $ficheAnimal['idParcelle'] = $ligne['idParcelle'];
    $ficheAnimal['poids'] = $ligne['poids']." kg";
    $ficheAnimal['taille'] = $ligne['taille']." cm";
    $ficheAnimal['dateNaissance'] = $ligne['date_naissance'];
    $ficheAnimal['lieuNaissance'] = $ligne['lieu_naissance'];
    $ficheAnimal['statut'] = $ligne['statut'];
    $ficheAnimal['description'] = $ligne['description'];
    $ficheAnimal['pere'] = $ligne['pere'];
    if($ficheAnimal['pere'] == NULL){
         $ficheAnimal['pere'] = "Inconnu";
    }
    $ficheAnimal['mere'] = $ligne['mere'];
    if($ficheAnimal['mere'] == NULL){
         $ficheAnimal['mere'] = "Inconnue";
    }
    //Recupération de l'age
    if ($ligne2 = $reqAgeAnimal->fetch(PDO::FETCH_ASSOC)) {
        $ficheAnimal['age'] = $ligne2['Age'];
    }
    //Recuperation de l'espèce
    if ($ligne3 = $reqEspeceAnimal->fetch(PDO::FETCH_ASSOC)) {
        $ficheAnimal['nomEspece'] = $ligne3['nomEspece'];
    }
    //Recuperation du sexe
    if ($ligne4 = $reqSexAnimal->fetch(PDO::FETCH_ASSOC)) {
        $ficheAnimal['sexe'] = $ligne4['sexe'];
        if ($ficheAnimal['sexe'] == 'M') {
            $ficheAnimal['sexe'] = 'Male';
        } else {
            $ficheAnimal['sexe'] = 'Femelle';
        }
    }
    //Recuperation du pays d'origine
    if ($ligne5 = $reqPaysAnimal->fetch(PDO::FETCH_ASSOC)) {
        $ficheAnimal['pays'] = $ligne5['nomPays'];
    }

    $erreur = "";
} else {
    $erreur = "<p>Une erreur est survenue</p>";
}

$tpl->assign('photo', $ficheAnimal['photo']);
$tpl->assign('numero', "N° ".$ficheAnimal['idAnimal']);
$tpl->assign('parcelle', "N° ".$ficheAnimal['idParcelle']);
$tpl->assign('espece', $ficheAnimal['nomEspece']);
$tpl->assign('prenom', $ficheAnimal['prenomAnimal']);
$tpl->assign('poids', $ficheAnimal['poids']);
$tpl->assign('taille', $ficheAnimal['taille']);
$tpl->assign('dOb', $ficheAnimal['dateNaissance']);
$tpl->assign('pOb', $ficheAnimal['lieuNaissance']);
$tpl->assign('statut', $ficheAnimal['idAnimal']);
$tpl->assign('description', $ficheAnimal['description']);
$tpl->assign('pays', $ficheAnimal['pays']);
$tpl->assign('pere', $ficheAnimal['pere']);
$tpl->assign('mere', $ficheAnimal['mere']);



$tpl->display('vues/ficheVue.tpl');

