<?php
    include("conn.php");
    $queryRes = $connection->query("SELECT  * FROM STUDENT");
    $res = array();
    while($fetchdata = $queryRes->fetch_assoc()){
        $res[] = $fetchdata;
    }
    echo json_encode($res);
?>