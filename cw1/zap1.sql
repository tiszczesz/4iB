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


CREATE TABLE wypos(id int not null AUTO_INCREMENT PRIMARY KEY,nazwa varchar(50),ilosc int)
CREATE TABLE noclegi(id int not null AUTO_INCREMENT PRIMARY KEY,pokoj varchar(50),ilosc int)

ALTER TABLE `noclegi` ADD `miejsce_id` INT NOT NULL AFTER `ilosc`; 

ALTER TABLE `wypos` ADD `uczestnicy_id` INT NOT NULL AFTER `ilosc`; 

ALTER TABLE `wypos` ADD CONSTRAINT `wypos_uczestnik` FOREIGN KEY (`uczestnicy_id`) 
REFERENCES `uczestnicy`(`id`) ON DELETE RESTRICT ON UPDATE RESTRICT; 

ALTER TABLE `noclegi` ADD CONSTRAINT `noclegi_miejsca` FOREIGN KEY (`miejsce_id`) 
REFERENCES `miejsca`(`id`) ON DELETE RESTRICT ON UPDATE RESTRICT; 


CREATE User `nazwa_user`@`localhost` identified by 'qazqaz';

show grants;
show grants for  `nazwa_user`@`localhost`

Drop User `nazwa_user`@`localhost`

grant select,insert,delete,update on `4ib_cw1`.* to u1@localhost;

grant select,insert,delete,update on `4ib_cw1`.* to u1@localhost;

REVOKE INSERT ON *.* FROM 'jeffrey'@'localhost';

REVOKE DELETE ON 4ib_cw1.* FROM 'u1'@'localhost';