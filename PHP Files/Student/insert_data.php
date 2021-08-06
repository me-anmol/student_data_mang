<?php 
    include("conn.php");
    $name = $_POST["name"];
    $gender = $_POST["gender"];
    $mobile = $_POST["mobile"];
    $branch  = $_POST["branch"];
    $sql = "INSERT INTO student( Name, branch, gender, mobile) VALUES ('$name', '$branch', '$gender','$mobile')";
    echo $sql;
    if ($connection->query($sql) === TRUE){
        echo "Great Success";
    }else{
        echo "failed";
    }
?>