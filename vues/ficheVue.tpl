<!DOCTYPE html>
<html lang="fr">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="style/styles.css" rel="stylesheet">
        <title>Projet2</title>
    </head>
    <body>
        <div class="conteneur noOverF">
            <img class="logo" src="img/logoSinges.png">
            <header>
                <ul>
                    <li>
                        <form method="POST" name="gestion">
                            <input type="hidden" name="gestion" value="accueil">
                            <input class="lienNav" type="submit" value="Accueil">
                        </form>
                    </li>
                    <li>
                        <form method="POST" name="gestion">
                            <input type="hidden" name="gestion" value="animaux">
                            <input class="lienNav" type="submit" value="Animaux">
                        </form>
                    </li>
                    <li>
                        <form method="POST" name="gestion">
                            <input type="hidden" name="gestion" value="login">
                            <input class="lienNav" type="submit" value="Carte">
                        </form>
                    </li>
                    <li><input class="lienNav" type="submit" name="lignes_commande" value="Statistiques"></li>
                    <img class="avatar" src="img/avatarTest.png" alt=""/>
                </ul>
            </header>
            <div class="fiche">
                {$photo}
                <div class="dFiche">
                    <h1 class="nomAnimal"><strong>{$prenom} ({$numero})</strong></h1>
                    <p class="pFiche">
                        <strong class="espAnimal">{$espece} ({$pays})</strong>
                        <br>
                        <strong>Numero de parcelle : </strong>{$parcelle}
                        <br>
                        <strong>Taille : </strong>{$taille}
                        <br>
                        <strong>Poids : </strong>{$poids}
                        <br>
                        <strong>Né le : </strong>{$dOb}
                        <br>
                        <strong>Lieu de Naissance : </strong>{$pOb}
                        <br>
                        <strong>Père : </strong>{$pere}
                        <br>
                        <strong>Mère : </strong>{$mere}
                        <br>
                        <p class="descAnimal">{$description}</p>
                    </p>
                </div>
            </div>
        </div>
    </body>
</html>