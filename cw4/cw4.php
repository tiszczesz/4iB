<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="cw4.css">
    <title>Document</title>
</head>

<body>
    <div class="container">
        <div class="baner">
            Biuro podróży
        </div>
        <main>
            <div id="lewy">
                <h2>Kontakt</h2>
            </div>
            <div id="srodek">
                <h2>Galeria</h2>
                <?php
                require_once "functions.php";
                $conn = getConnection();
                $sql = <<<TEXT
                 SELECT zdjecia.nazwaPliku, zdjecia.podpis,zdjecia.id from zdjecia ORDER BY zdjecia.podpis 
TEXT;

                 $result = $conn->query($sql);
                while ($row = $result->fetch_row()) {
                    echo "<a href='?id={$row[2]}'><img src='{$row[0]}' alt='{$row[1]}'></a>\n";
                }
                ?>

            </div>
            <div id="prawy">
                <h2>Promocje</h2>
            </div>
        </main>
        <siection id="dolne">


            <?php
            $sql2 = "SELECT id,dataWyjazdu,cel,cena from wycieczki WHERE dostepna=1";
            $reault = $conn->query($sql2);
            while ($row = $reault->fetch_assoc()) {
                echo "<div>{$row['id']} {$row['dataWyjazdu']}, {$row['cel']}, cena: {$row['cena']}</div>";
            }
            echo "<hr>";
            if(isset($_GET['id'])){
                $id = $_GET['id'];
              //  var_dump($id);
                $sql3 = "SELECT id,dataWyjazdu,cel,cena FROM wycieczki WHERE wycieczki.zdjecia_id = {$id}";
               // echo $sql3;
                 $result = $conn->query($sql3);
                 var_dump($result);
                 while($row=$reault->fetch_row()){
                    var_dump($row);
                    echo "<div>{$row['id']} {$row['dataWyjazdu']}, {$row['cel']}, cena: {$row['cena']}</div>";
                 }
            }
           
            $conn->close();
            ?>
        </siection>

        <footer>

        </footer>
    </div>
</body>

</html>