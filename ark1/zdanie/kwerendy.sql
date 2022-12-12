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

zarzadzanie kopiami zapasowymi:
https://dev.mysql.com/doc/refman/8.0/en/mysqldump.html

C:\xampp\mysql\bin\mysqldump.exe 
        --all-databases --user root 
        > C:\xampp\htdocs\4iB\dump.sql