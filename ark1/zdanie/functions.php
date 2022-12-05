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
   
    $count = $result->fetch_row()[0]; 
    $conn->close();
    return $count;
}
function Autorize($login,$haslo):void {
    $conn = getConnection();
    echo "<div class='wizytowka'>";
    if($conn==null) return ;
    $sql = "SELECT login, haslo FROM uzytkownicy WHERE login like '{$login}'";
   // echo $sql;
    $result = $conn->query($sql);
    //var_dump($result);
    if ($result->num_rows==0) {
        echo "<p>login nie istnieje</p>";
        $conn->close();
        echo "</div>";
        return ;
    }else{
        if(isset($_POST['login'])){
           // var_dump($_POST);
            $user = $result->fetch_row();
          //  var_dump($user);
            
            $haslo = $_POST['haslo'];
            $login = $_POST['login'];
            //var_dump(sha1($haslo));
            if(sha1($haslo)==$user[1]){
             //   echo "zmodyfikowane zapytanie 3";
                $sql2=<<<TEXT
                select uzytkownicy.login,dane.rok_urodz,dane.przyjaciol,
                dane.hobby,
                dane.zdjecie 
                from uzytkownicy INNER JOIN dane
                on uzytkownicy.id=dane.id 
                where login like '{$login}';                
TEXT;
               $result2 = $conn->query($sql2);     
                $row = $result2->fetch_row();
                $wiek = date('Y')-$row[1];
              //  var_dump($row);
                echo "<img src='{$row[4]}' alt='osoba'>";
                echo "<h4>{$row[0]} ({$wiek})</h4>";
                echo "<p>hobby: {$row[3]}</p>";
                echo "<h1><img src='icon-on.png'> ({$row[2]})</h1>";
                
                $conn->close();
            }else{
                echo "<p>hasło nieprawidłowe</p>";

            }
        }
        // $user = $result->fetch_row();
        // if($user)
        echo "<a href='dane.html' class=\"btn\">Więcej informacji</a>";
        echo "</div>";
        return ;
    }
    
}