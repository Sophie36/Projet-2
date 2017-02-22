<?php
/* Smarty version 3.1.29, created on 2017-02-21 21:12:56
  from "C:\wamp64\www\Projet2\vues\accueilVue.tpl" */

if ($_smarty_tpl->smarty->ext->_validateCompiled->decodeProperties($_smarty_tpl, array (
  'has_nocache_code' => false,
  'version' => '3.1.29',
  'unifunc' => 'content_58acad589e0e89_75705947',
  'file_dependency' => 
  array (
    '9b78b7ace0dfc953d5d82a9269646c14b8902b07' => 
    array (
      0 => 'C:\\wamp64\\www\\Projet2\\vues\\accueilVue.tpl',
      1 => 1487710410,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_58acad589e0e89_75705947 ($_smarty_tpl) {
?>
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
            <div class="conteneurModules">
                <div class="blocModules">
                    <div class="module">
                        <div class="contGraphAccueil">
                            <canvas id="tailleEsp"></canvas>
                        </div>
                    </div>
                    <div class="module"></div>
                    <div class="module"></div>
                    <div class="module"></div>
                </div>
                <div class="blocModules">
                    <div class="module"></div>
                    <div class="module"></div>
                    <div class="module"></div>
                    <div class="module"></div>
                </div>
            </div>
        </div>
        <?php echo $_smarty_tpl->tpl_vars['js']->value;?>

    </body>
</html><?php }
}
