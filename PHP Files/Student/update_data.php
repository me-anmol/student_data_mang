<?php
    include("conn.php");
    $id = $_POST["id"];
    $branch = $_POST["branch"];
    $mobile = $_POST["mobile"];
    $sql = "UPDATE student SET branch='$branch',mobile=$mobile WHERE id = $id";
    if($connection->query($sql) === TRUE){
        echo "Great Success";
    }else{
        echo "Failed";
    }
?>