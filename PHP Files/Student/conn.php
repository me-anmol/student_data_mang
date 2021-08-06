<?php
$host = "localhost";
$username = "Anmol";
$password = "anmol@123";
$database ="student";
    $connection = new mysqli($host,$username,$password,$database);
    if(!$connection){
        echo "Error Occurred";
        exit();
    }
?>