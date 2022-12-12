-- kw1
SELECT klienci.imie,klienci.nazwisko,klienci.punkty 
from klienci ORDER by klienci.punkty desc limit 3 

-- kw2
SELECT typy.nazwa, COUNT(klienci.id) as `liczba klientów` 
from typy INNER JOIN klienci 
ON typy.id=klienci.Typy_id 
GROUP by typy.nazwa 

--kw3
SELECT klienci.zdjecie, klienci.imie, opinie.opinia 
from klienci INNER join opinie 
on klienci.id=opinie.Klienci_id 
--where klienci.Typy_id BETWEEN 2 and 3 
where klienci.Typy_id=2 or klienci.Typy_id=3
--where klienci.Typy_id>=2 and klienci.Typy_id<=3

--kw4

ALTER TABLE klienci 
ADD COLUMN adres varchar(50) null