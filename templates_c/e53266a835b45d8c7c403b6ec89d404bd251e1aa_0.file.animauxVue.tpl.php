<?php
/* Smarty version 3.1.29, created on 2017-02-20 13:21:11
  from "C:\wamp64\www\Projet2\vues\animauxVue.tpl" */

if ($_smarty_tpl->smarty->ext->_validateCompiled->decodeProperties($_smarty_tpl, array (
  'has_nocache_code' => false,
  'version' => '3.1.29',
  'unifunc' => 'content_58aaed4734f2b0_26072039',
  'file_dependency' => 
  array (
    'e53266a835b45d8c7c403b6ec89d404bd251e1aa' => 
    array (
      0 => 'C:\\wamp64\\www\\Projet2\\vues\\animauxVue.tpl',
      1 => 1487596866,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_58aaed4734f2b0_26072039 ($_smarty_tpl) {
?>
<!DOCTYPE html>
<html lang="fr">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="style/styles.css" rel="stylesheet">
        <title>Ouhouhin-Animaux</title>
    </head>
    <body>
        <div class="conteneur">
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
            <div class="conteneurTable">
                <?php echo $_smarty_tpl->tpl_vars['initTable']->value;?>

                <?php
$_from = $_smarty_tpl->tpl_vars['listeAnimaux']->value;
if (!is_array($_from) && !is_object($_from)) {
settype($_from, 'array');
}
$__foreach_Animal_0_saved_item = isset($_smarty_tpl->tpl_vars['Animal']) ? $_smarty_tpl->tpl_vars['Animal'] : false;
$_smarty_tpl->tpl_vars['Animal'] = new Smarty_Variable();
$_smarty_tpl->tpl_vars['Animal']->_loop = false;
foreach ($_from as $_smarty_tpl->tpl_vars['Animal']->value) {
$_smarty_tpl->tpl_vars['Animal']->_loop = true;
$__foreach_Animal_0_saved_local_item = $_smarty_tpl->tpl_vars['Animal'];
?>
                    <tr>
                        <td><?php echo $_smarty_tpl->tpl_vars['Animal']->value['photo'];?>
</td>
                        <td><?php echo $_smarty_tpl->tpl_vars['Animal']->value['prenomAnimal'];?>
</td>
                        <td><?php echo $_smarty_tpl->tpl_vars['Animal']->value['nomEspece'];?>
</td>
                        <td><?php echo $_smarty_tpl->tpl_vars['Animal']->value['sexe'];?>
</td>
                        <td><?php echo $_smarty_tpl->tpl_vars['Animal']->value['age'];?>
</td>
                        <td><?php echo $_smarty_tpl->tpl_vars['Animal']->value['statut'];?>
</td>
                    </tr>
                <?php
$_smarty_tpl->tpl_vars['Animal'] = $__foreach_Animal_0_saved_local_item;
}
if ($__foreach_Animal_0_saved_item) {
$_smarty_tpl->tpl_vars['Animal'] = $__foreach_Animal_0_saved_item;
}
?>
                </table>
            </div>
        </div>  
    </body>
</html><?php }
}
