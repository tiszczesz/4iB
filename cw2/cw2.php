<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="cw2.css">
    <title>Wycieczki</title>
</head>
<body>
    <h1>Wykaz miejsc wycieczkowych</h1>
    <!-- <pre> -->
        <div class="container">
    <?php
    require_once "functions.php";
    $conn = getConnection();
    $d = getMiejsca();
    // var_dump($d);
    echo toList($d,"ol");
    echo toTable($d);
    ?>
    <!-- </pre> -->
    </div>
    <div>
        <a href="addPlace.html">dodaj nowe miejsce wycieczki</a>
    </div>
</body>
</html>