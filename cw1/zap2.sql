select * from miejsca;

SELECT count(uczestnicy.id) as `ilosc uczestnikow`,
miejsca.nazwa,month(miejsca.data_wyjazdu) as miesiac 
FROM `uczestnicy` INNER JOIN miejsca
on uczestnicy.miejsce_id=miejsca.id 
GROUP by month(miejsca.data_wyjazdu)
HAVING count(uczestnicy.id)>=5
ORDER BY miejsca.nazwa