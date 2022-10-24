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
function toTable(array $data):string {
    $html = "<table>";
    $html .= "<tr><th>lp</th><th>miejsce</th><th>cena</th><th>data</th></tr>";
    $lp = 0;
    $total = 0;
    foreach($data as $row){
        $lp++;
        $html .= "<tr>";
        $html .= "<td>{$lp}</td>";
        $html .= "<td style='text-align:left'>{$row["nazwa"]}</td>";
        $html .= "<td class='right'>{$row["cena"]}</td>";
        $html .= "<td>{$row["data_wyjazdu"]}</td>";
        $html .= "</tr>";
        $total += $row["cena"];
    }
    $html .= "<tr class='right'><td class='right' colspan='2'>"
             ."Cena za wszystko: </td><td colspan='2'>{$total}</td></tr>";
    return $html ."</table>";
}
function AddPlace(array $data):bool {
    $conn = getConnection();
    if($conn==null) return false;
    $result = $conn->query("INSERT INTO miejsca(nazwa,cena,`data_wyjazdu`)"
        ." VALUES ('{$data[0]}','{$data[1]}','{$data[2]}')");
        $conn->close();
    return $result;
}