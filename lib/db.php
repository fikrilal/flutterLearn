<?php

$db_name = "db_edamkar";
$db_server = "192.168.137.1";
$db_user = "root";
$db_pass = "";

$db = new
PDO("mysql:host={$db_server}; dbname={$db_name}; charset=utf8", $db_user, $db_pass);
$db->setAttribute(PDO::ATTR_EMULATE_PREPARES, false);
$db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
?>