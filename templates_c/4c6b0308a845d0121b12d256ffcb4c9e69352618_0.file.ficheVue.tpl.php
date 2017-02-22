<?php
/* Smarty version 3.1.29, created on 2017-02-20 14:38:22
  from "C:\wamp64\www\Projet2\vues\ficheVue.tpl" */

if ($_smarty_tpl->smarty->ext->_validateCompiled->decodeProperties($_smarty_tpl, array (
  'has_nocache_code' => false,
  'version' => '3.1.29',
  'unifunc' => 'content_58aaff5eb2b303_63469414',
  'file_dependency' => 
  array (
    '4c6b0308a845d0121b12d256ffcb4c9e69352618' => 
    array (
      0 => 'C:\\wamp64\\www\\Projet2\\vues\\ficheVue.tpl',
      1 => 1487601499,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_58aaff5eb2b303_63469414 ($_smarty_tpl) {
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
            <div class="fiche">
                <?php echo $_smarty_tpl->tpl_vars['photo']->value;?>

                <div class="dFiche">
                    <h1 class="nomAnimal"><strong><?php echo $_smarty_tpl->tpl_vars['prenom']->value;?>
 (<?php echo $_smarty_tpl->tpl_vars['numero']->value;?>
)</strong></h1>
                    <p class="pFiche">
                        <strong class="espAnimal"><?php echo $_smarty_tpl->tpl_vars['espece']->value;?>
 (<?php echo $_smarty_tpl->tpl_vars['pays']->value;?>
)</strong>
                        <br>
                        <strong>Numero de parcelle : </strong><?php echo $_smarty_tpl->tpl_vars['parcelle']->value;?>

                        <br>
                        <strong>Taille : </strong><?php echo $_smarty_tpl->tpl_vars['taille']->value;?>

                        <br>
                        <strong>Poids : </strong><?php echo $_smarty_tpl->tpl_vars['poids']->value;?>

                        <br>
                        <strong>Né le : </strong><?php echo $_smarty_tpl->tpl_vars['dOb']->value;?>

                        <br>
                        <strong>Lieu de Naissance : </strong><?php echo $_smarty_tpl->tpl_vars['pOb']->value;?>

                        <br>
                        <strong>Père : </strong><?php echo $_smarty_tpl->tpl_vars['pere']->value;?>

                        <br>
                        <strong>Mère : </strong><?php echo $_smarty_tpl->tpl_vars['mere']->value;?>

                        <br>
                        <p class="descAnimal"><?php echo $_smarty_tpl->tpl_vars['description']->value;?>
</p>
                    </p>
                </div>
            </div>
        </div>
    </body>
</html><?php }
}
