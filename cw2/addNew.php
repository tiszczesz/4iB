<?php

require_once "functions.php";
$conn = getConnection();
$miejsce = trim($_POST['miejsce']);
$cena = trim($_POST['cena']);
$data = trim($_POST['data']);


$conn->close();