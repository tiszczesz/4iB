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