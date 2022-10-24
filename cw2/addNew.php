<?php

require_once "functions.php";

$miejsca = trim(filter_input(INPUT_POST,'miejsce',FILTER_SANITIZE_ADD_SLASHES));
$cena = filter_input(INPUT_POST,'cena',FILTER_SANITIZE_NUMBER_FLOAT);
$data = filter_input(INPUT_POST,'data',FILTER_SANITIZE_ADD_SLASHES);
var_dump($miejsca,$cena,$data);
if($miejsca!='' && $cena>=0 && $data!=''){
    AddPlace([$miejsca,$cena,$data]);
    header("Location: cw2.php");
  echo "dodano";
}else{
    header("Location: addPlace.html");
  echo "nie dodano";
}