<?php
function getConnection():mysqli{
    $conn = new mysqli("localhost","root",null,"4ib_egz3");
    if($conn->connect_errno!=0) return null;
    return $conn;
}