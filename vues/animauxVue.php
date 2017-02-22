<?php

require_once 'include/libs/Smarty.class.php';

$tpl = new Smarty();
$listeAnimaux = [];
$reqListeAnimaux = $tabReqListe[0];
$reqAgeAnimaux = $tabReqListe[1];
$reqEspeceAnimaux = $tabReqListe[2];
$reqSexAnimaux = $tabReqListe[3];
$i = 0;


if (isset($_POST['action'])) {

    if (!$ligne = $reqListeAnimaux->fetch()) {
        $aucRes = '<p class="aucRes">--La recherche ne fournit aucun resultat--</p>';
        $nbLignes = '';
        $initTable = '';
    } else {
        $initTable = '<table class="tAnimaux">
                    <tr>
                        <th>Photo</th>
                        <th>Prénom</th>
                        <th>Espèce</th>
                        <th>Sexe</th>
                        <th>Age</th>
                        <th>Statut</th>
                    </tr>';

        while ($ligne = $reqListeAnimaux->fetch(PDO::FETCH_ASSOC)) {
            $listeAnimaux[$i]['photo'] = '<form method="POST" action="index.php">
                                            <input type="hidden" name="gestion" value="fiche">
                                            <input type="hidden" name="action" value="consulter">
                                            <input type="hidden" name="consulter" value="consulter">
                                            <input type="hidden" name="idAnimal" value=' . $ligne['idAnimaux'] . '>
                                            <input class="vignLienFiche" value="" type="submit" style="background-image: url(img/imgFiches/' . $ligne['prenomAnimal'] . 'Tn.png">
                                          <form>';
            $listeAnimaux[$i]['prenomAnimal'] = $ligne['prenomAnimal'];
            $listeAnimaux[$i]['statut'] = $ligne['statut'];
            $i++;
        }
        //Recupération de l'age
        $i = 0;
        while ($ligne2 = $reqAgeAnimaux->fetch(PDO::FETCH_ASSOC)) {
            $listeAnimaux[$i]['age'] = $ligne2['Age'];
            $i++;
        }
        //Recuperation de l'espèce
        $i = 0;
        while ($ligne3 = $reqEspeceAnimaux->fetch(PDO::FETCH_ASSOC)) {
            $listeAnimaux[$i]['nomEspece'] = $ligne3['nomEspece'];
            $i++;
        }
        //Recuperation du sexe
        $i = 0;
        while ($ligne4 = $reqSexAnimaux->fetch(PDO::FETCH_ASSOC)) {
            $listeAnimaux[$i]['sexe'] = $ligne4['sexe'];
            if ($listeAnimaux[$i]['sexe'] == 'M') {
                $listeAnimaux[$i]['sexe'] == 'Male';
            } else {
                $listeAnimaux[$i]['sexe'] == 'Femelle';
            }
            $i++;
        }
        $aucRes = '';
        $nbLignes = $reqListeAnimaux->rowCount();
    }
} else {
    $initTable = '<table class="tAnimaux">
                    <tr>
                        <th>Photo</th>
                        <th>Prénom</th>
                        <th>Espèce</th>
                        <th>Sexe</th>
                        <th>Age</th>
                        <th>Statut</th>
                    </tr>';

    while ($ligne = $reqListeAnimaux->fetch(PDO::FETCH_ASSOC)) {
        //Vignette cliquable pour la consultation
        $listeAnimaux[$i]['photo'] = '<form method="POST" action="index.php">
                                        <input type="hidden" name="gestion" value="fiche">
                                        <input type="hidden" name="consulter" value="consulter">
                                        <input type="hidden" name="action" value="consulter">
                                        <input type="hidden" name="idAnimal" value=' . $ligne['idAnimaux'] . '>
                                        <input class="vignLienFiche" value="" type="submit" style="background-image: url(img/imgFiches/' . $ligne['prenomAnimal'] . 'Tn.png">
                                      </form>';
        $listeAnimaux[$i]['prenomAnimal'] = $ligne['prenomAnimal'];
        $listeAnimaux[$i]['statut'] = $ligne['statut'];
        if ($listeAnimaux[$i]['statut'] == NULL) {
            $listeAnimaux[$i]['statut'] = "Présent";
        }
        $i++;
    }

    //Recupération de l'age des bêtes
    $i = 0;
    while ($ligne2 = $reqAgeAnimaux->fetch(PDO::FETCH_ASSOC)) {
        $listeAnimaux[$i]['age'] = $ligne2['Age'];
        if ($listeAnimaux[$i]['age'] <= 1) {
            $listeAnimaux[$i]['age'] = $listeAnimaux[$i]['age'] . ' an';
        } else {
            $listeAnimaux[$i]['age'] = $listeAnimaux[$i]['age'] . ' ans';
        }
        $i++;
    }
    //Recuperation de l'espèce
    $i = 0;
    while ($ligne3 = $reqEspeceAnimaux->fetch(PDO::FETCH_ASSOC)) {
        $listeAnimaux[$i]['nomEspece'] = $ligne3['nomEspece'];
        $i++;
    }
    //Recuperation du sexe
    $i = 0;
    while ($ligne4 = $reqSexAnimaux->fetch(PDO::FETCH_ASSOC)) {
        $listeAnimaux[$i]['sexe'] = $ligne4['sexe'];
        if ($listeAnimaux[$i]['sexe'] == 'M') {
            $listeAnimaux[$i]['sexe'] = 'Male';
        } else {
            $listeAnimaux[$i]['sexe'] = 'Femelle';
        }
        $i++;
    }
    $aucRes = '';
    $nbLignes = $reqListeAnimaux->rowCount();
}


$tpl->assign('msg', 'Liste des Animaux');
$tpl->assign('aucRes', $aucRes);
$tpl->assign('nbLignes', $nbLignes);
$tpl->assign('initTable', $initTable);
$tpl->assign('listeAnimaux', $listeAnimaux);












$tpl->display('vues/animauxVue.tpl');
