<!DOCTYPE html>
<html lang="pl-PL">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Portal społecznościowy</title>
    <link rel="stylesheet" href="portal.css">
</head>
<?php
require_once "functions.php";
?>
<body>
    <div class="wrapper1">
        <div class="sm1">
            <h1>Nasze osiedle</h1>
        </div>
        <div class="sm2">
            <?php
            $result = getCount();
           echo "Lista osób: {$result}";
            ?>
        </div>
    </div>
    <div class="wrapper2">
        <div class="left">
            <h3>Logowanie</h3>
            <form method="post">
                login:<br>
                <input type="text" name="login" placeholder="login"><br>
                hasło:<br>
                <input type="password" name="haslo" placeholder="haslo"><br>
                <input type="submit" value="Zaloguj" name="btn">
            </form>
        </div>
        <div class="right">
            <h3>Wizytówka</h3>
            <?php
            if(isset($_POST['btn'])){
                $login  = trim($_POST['login']);
                $password = trim($_POST['haslo']);
                if($login==''||$password==''){
                    echo "Brak danych!!!";
                }else{
                    Autorize($login,$password);
                }
            }
            ?>
        </div>
    </div>
    <div class="footer">
        Stronę wykonał: 0000000000
    </div>
</body>

</html>
