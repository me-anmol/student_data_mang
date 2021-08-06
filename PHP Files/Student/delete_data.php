<?php
    include("conn.php");
    $id = $_POST["id"];
    $sql = "DELETE FROM student WHERE id = $id";
    if($connection->query($sql) === TRUE){
        echo "Great Success";
    }else{
        echo "error";
    }

?>