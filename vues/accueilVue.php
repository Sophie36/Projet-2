<?php

require_once 'include/libs/Smarty.class.php';

$tpl = new Smarty();
$script = '<script src="js/jquery.min.js" type="text/javascript"></script>
            <script src="js/Chart.min.js" type="text/javascript"></script>
            <script src="js/app.js" type="text/javascript"></script>';




$tpl->assign('js', $script);
$tpl->display('vues/accueilVue.tpl');