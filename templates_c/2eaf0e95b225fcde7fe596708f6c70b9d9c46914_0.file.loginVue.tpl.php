<?php
/* Smarty version 3.1.29, created on 2017-02-19 22:32:12
  from "C:\wamp64\www\Projet2\vues\loginVue.tpl" */

if ($_smarty_tpl->smarty->ext->_validateCompiled->decodeProperties($_smarty_tpl, array (
  'has_nocache_code' => false,
  'version' => '3.1.29',
  'unifunc' => 'content_58aa1ceced1388_68507113',
  'file_dependency' => 
  array (
    '2eaf0e95b225fcde7fe596708f6c70b9d9c46914' => 
    array (
      0 => 'C:\\wamp64\\www\\Projet2\\vues\\loginVue.tpl',
      1 => 1487097965,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_58aa1ceced1388_68507113 ($_smarty_tpl) {
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
        <div id="accueil">
            <header>
                <div id="boiteLogo"><img id="logoAcc" src="img/logoSinges.png"></div>
            </header>
            <main>
                <div class="form">
                    <form method="POST" name="gestion">
                        <label><h1>BIENVENUE</h1></label>
                        <input type="text" placeholder="username" />
                        <input type="password" placeholder="password" />
                        <input type="hidden" name="gestion" value="accueil">
                        <input id="boutonCo" type="submit" value="login">
                        <p class="message"><a href="#">Mot de passe oublié ?</a></p>
                    </form>
                </div>
            </main>
        </div>  
    </body>
</html><?php }
}
