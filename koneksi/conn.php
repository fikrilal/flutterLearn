<?php

$connect = new mysqli ("localhost", "root", "", "db_edamkar");

if($connect) {

} else {
    echo "Koneksimu gagal masbro";
    exit();
}