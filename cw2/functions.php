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
    // var_dump($result);
    while($row = $result->fetch_assoc()){
        $dane[] = $row;
    }
    return $dane;
}
function toList(array $data,string $kind="ul"):string{
    $html = "<{$kind}>";
    foreach($data as $row){
        $html .= "<li>wycieczka do: <span class='green'>{$row["nazwa"]}</span> w cenie <span class='red'>{$row["cena"]}</span> PLN"
             ." w dniu: <span class='grey'>{$row["data_wyjazdu"]}</span></li> ";
    }

    return $html . "</{$kind}>";
}