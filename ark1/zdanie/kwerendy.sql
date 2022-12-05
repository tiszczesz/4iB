SELECT haslo FROM `uzytkownicy` WHERE login like 'justyna';

SELECT count(*) FROM dane

select uzytkownicy.login,dane.rok_urodz,dane.przyjaciol,dane.hobby,
dane.zdjecie 
from uzytkownicy INNER JOIN dane
on uzytkownicy.id=dane.id 
where uzytkownicy.login like 'Justyna';

alter TABLE dane add COLUMN stanowisko varchar(50) null



select uzytkownicy.login, 
  dane.rok_urodz,(Year(CURDATE())- dane.rok_urodz) as wiek
from uzytkownicy INNER JOIN dane
on uzytkownicy.id=dane.id 