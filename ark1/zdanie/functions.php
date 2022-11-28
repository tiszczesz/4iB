<?php
function getConnection():?mysqli{
    $conn = new mysqli("localhost","root",null,"4ib_portal");
   // var_dump($conn);
    if($conn->connect_errno!==0) return null;
    return $conn;
}
function getCount():int{
    $conn = getConnection();
    if($conn==null) return 0;
    $sql = "SELECT count(*) from dane";
    $result = $conn->query($sql);
    //var_dump($result);
    $conn->close();
    $count = $result->fetch_row()[0];
    return $count;
}
function Autorize($login,$haslo):bool {
    $conn = getConnection();
    if($conn==null) return false;
    $sql = "SELECT login, haslo FROM uzytkownicy WHERE login like {$login}";
    $result = $conn->query($sql);
    if ($result->num_rows==0) {
        echo "Błędny login";
        $conn->close();
        return false;
    }

}