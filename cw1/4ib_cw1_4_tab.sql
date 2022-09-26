-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 26 Wrz 2022, 13:14
-- Wersja serwera: 10.4.14-MariaDB
-- Wersja PHP: 7.4.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `4ib_cw1`
--
CREATE DATABASE IF NOT EXISTS `4ib_cw1` DEFAULT CHARACTER SET utf8 COLLATE utf8_polish_ci;
USE `4ib_cw1`;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `miejsca`
--

CREATE TABLE `miejsca` (
  `id` int(11) NOT NULL,
  `nazwa` varchar(50) COLLATE utf8_polish_ci NOT NULL,
  `cena` decimal(10,2) NOT NULL,
  `data_wyjazdu` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `miejsca`
--

INSERT INTO `miejsca` (`id`, `nazwa`, `cena`, `data_wyjazdu`) VALUES
(1, 'Zakopane', '400.99', '2018-09-14'),
(2, 'Tarnów', '320.00', '2014-09-15'),
(3, 'Gdynia', '700.00', '2022-08-16'),
(4, 'London', '1200.00', '2002-07-18'),
(5, 'Toruń', '345.00', '2021-05-09'),
(6, 'Grudziądz', '4500.00', '2022-05-13'),
(7, 'Gdynia', '2300.00', '2022-02-09'),
(8, 'Rzym', '4500.00', '2005-05-01');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `noclegi`
--

CREATE TABLE `noclegi` (
  `id` int(11) NOT NULL,
  `pokoj` varchar(50) COLLATE utf8_polish_ci DEFAULT NULL,
  `ilosc` int(11) DEFAULT NULL,
  `miejsce_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `noclegi`
--

INSERT INTO `noclegi` (`id`, `pokoj`, `ilosc`, `miejsce_id`) VALUES
(1, '101', 4, 3),
(2, '201', 7, 3);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `uczestnicy`
--

CREATE TABLE `uczestnicy` (
  `id` int(11) NOT NULL,
  `imie` varchar(50) COLLATE utf8_polish_ci NOT NULL,
  `nazwisko` varchar(50) COLLATE utf8_polish_ci NOT NULL,
  `miejsce_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `uczestnicy`
--

INSERT INTO `uczestnicy` (`id`, `imie`, `nazwisko`, `miejsce_id`) VALUES
(1, 'Franek', 'Dzbanek', 3),
(2, 'Irena', 'Serena', 2),
(3, 'Monika', 'Klika', 2),
(4, 'Roman', 'Boman', 1),
(5, 'Grażyna', 'Sprężyna', 1),
(6, 'Ryszard', 'Małek', 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `wypos`
--

CREATE TABLE `wypos` (
  `id` int(11) NOT NULL,
  `nazwa` varchar(50) COLLATE utf8_polish_ci DEFAULT NULL,
  `ilosc` int(11) DEFAULT NULL,
  `uczestnicy_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `wypos`
--

INSERT INTO `wypos` (`id`, `nazwa`, `ilosc`, `uczestnicy_id`) VALUES
(1, 'buty', 1, 1),
(2, 'plecak', 2, 1);

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `miejsca`
--
ALTER TABLE `miejsca`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `noclegi`
--
ALTER TABLE `noclegi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `noclegi_miejsca` (`miejsce_id`);

--
-- Indeksy dla tabeli `uczestnicy`
--
ALTER TABLE `uczestnicy`
  ADD PRIMARY KEY (`id`),
  ADD KEY `miejsca_uczestnik_FK` (`miejsce_id`);

--
-- Indeksy dla tabeli `wypos`
--
ALTER TABLE `wypos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wypos_uczestnik` (`uczestnicy_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT dla tabeli `miejsca`
--
ALTER TABLE `miejsca`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT dla tabeli `noclegi`
--
ALTER TABLE `noclegi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT dla tabeli `uczestnicy`
--
ALTER TABLE `uczestnicy`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT dla tabeli `wypos`
--
ALTER TABLE `wypos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `noclegi`
--
ALTER TABLE `noclegi`
  ADD CONSTRAINT `noclegi_miejsca` FOREIGN KEY (`miejsce_id`) REFERENCES `miejsca` (`id`);

--
-- Ograniczenia dla tabeli `uczestnicy`
--
ALTER TABLE `uczestnicy`
  ADD CONSTRAINT `miejsca_uczestnik_FK` FOREIGN KEY (`miejsce_id`) REFERENCES `miejsca` (`id`);

--
-- Ograniczenia dla tabeli `wypos`
--
ALTER TABLE `wypos`
  ADD CONSTRAINT `wypos_uczestnik` FOREIGN KEY (`uczestnicy_id`) REFERENCES `uczestnicy` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
