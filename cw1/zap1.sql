SELECT count(*) FROM `miejsca`;
SELECT count(*) FROM uczestnicy;
SELECT concat(uczestnicy.nazwisko,' ',uczestnicy.imie) 
     FROM uczestnicy;
SELECT concat(uczestnicy.nazwisko,' ',
         left(uczestnicy.imie,1),'.') 
     FROM uczestnicy;
SELECT length('Żółta');
SELECT char_length('Żółta');
SELECT nazwisko FROM uczestnicy ORDER BY nazwisko desc;
SELECT nazwisko FROM uczestnicy ORDER BY char_length(nazwisko) desc;
SELECT nazwisko, imie,char_length(concat(nazwisko,imie)) as `długość`
    FROM uczestnicy 
        ORDER BY char_length(concat(nazwisko,imie)) desc;
SELECT nazwisko, imie,char_length(concat(nazwisko,imie)) as `długość`
    FROM uczestnicy 
        ORDER BY 3 desc;

SELECT nazwa,cena, month(data_wyjazdu) from miejsca

SELECT Time(data_wyjazdu) FROM `miejsca`

SELECT count(*), month(data_wyjazdu) as `miesiąc` 
        FROM `miejsca` GROUP BY month(data_wyjazdu)

SELECT count(*), month(data_wyjazdu) as `miesiąc` FROM `miejsca` 
 GROUP BY month(data_wyjazdu) ORDER by `miesiąc` DESC

 SELECT count(*) as `ilość`, month(data_wyjazdu) as `miesiąc` FROM `miejsca`
  GROUP BY month(data_wyjazdu) ORDER by `ilość` DESC

  SELECT nazwa, cena ,data_wyjazdu,DAYOFYEAR(data_wyjazdu) as `dzień roku` from miejsca

  SELECT nazwa, cena ,data_wyjazdu from miejsca WHERE DAYOFMONTH(data_wyjazdu)<=10

  SELECT nazwa, cena ,data_wyjazdu from miejsca 
  WHERE DAYOFMONTH(data_wyjazdu)   BETWEEN 10 and 15

  SELECT nazwa, cena, data_wyjazdu, Year(Now())-Year(data_wyjazdu) as `lata`
        FROM `miejsca` 

SELECT nazwa, cena, data_wyjazdu FROM `miejsca` WHERE Year(data_wyjazdu) % 2 = 0

SELECT nazwa, cena, data_wyjazdu
FROM `miejsca`
WHERE Year(data_wyjazdu) % 2 = 0 
and month(data_wyjazdu) % 2 = 0

SELECT TIMESTAMPDIFF(month,now(),'2021-04-12')