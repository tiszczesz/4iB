<?php
function getConnection(): ?mysqli {
    $conn = new mysqli('localhost','root',null,'4ib_cw1');
    if($conn->connect_errno>0) return null;

    $conn->set_charset('utf8');
    return $conn;
}
function getMiejsca():array
{
    $dane = [];
    $conn = getConnection();
    if($conn==null) $dane;
    $sql = 'SELECT * FROM miejsca';
    $result = $conn->query($sql);
    var_dump($result);

    return $dane;
}