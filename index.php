<?php

require_once 'include/configuration.php';

if(isset($_REQUEST['gestion'])){
    $gestion = $_REQUEST['gestion'];
}else{
    $gestion = 'login';
}

require_once 'controleurs/router.php';      


