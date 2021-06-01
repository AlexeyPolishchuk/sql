-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Июн 01 2021 г., 07:54
-- Версия сервера: 10.4.18-MariaDB
-- Версия PHP: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
DROP DATABASE IF EXISTS `conference`;
CREATE DATABASE `conference`;
--
-- База данных: `conference`
--

-- --------------------------------------------------------

--
-- Структура таблицы `addressinfo`
--

CREATE TABLE `addressinfo` (
  `ID` int(11) NOT NULL,
  `Last_Name` varchar(255) NOT NULL,
  `First_name` varchar(255) NOT NULL,
  `Middle_name` varchar(255) NOT NULL,
  `Country` varchar(255) NOT NULL,
  `City` varchar(255) NOT NULL,
  `Postcode` varchar(255) NOT NULL,
  `Address_Street` varchar(255) NOT NULL,
  `Address_HouseNumber` varchar(255) NOT NULL,
  `Address_Flat` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Структура таблицы `conference`
--

CREATE TABLE `conference` (
  `Participant_ID` int(11) NOT NULL,
  `First_invitation` date NOT NULL,
  `Second_invitation` date NOT NULL,
  `Application` date NOT NULL,
  `Fee` int(11) NOT NULL,
  `Fee date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Структура таблицы `departments`
--

CREATE TABLE `departments` (
  `Department_ID` int(11) NOT NULL,
  `Department_Name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Структура таблицы `participantinfo`
--

CREATE TABLE `participantinfo` (
  `Person_ID` int(11) NOT NULL,
  `Person_Info` int(11) NOT NULL,
  `ParticipantID` int(11) NOT NULL,
  `SpeakerOrParticipant` int(11) NOT NULL,
  `Report topic` text NOT NULL,
  `Report thesis` text NOT NULL,
  `Arrival date` date NOT NULL,
  `Departure date` date NOT NULL,
  `Hotel need` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Структура таблицы `personalinfotable`
--

CREATE TABLE `personalinfotable` (
  `PIT_ID` int(11) NOT NULL,
  `Address` int(11) NOT NULL,
  `WorkPhoneNumber` varchar(15) NOT NULL,
  `HomePhoneNumber` varchar(15) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `WorkID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Структура таблицы `positions`
--

CREATE TABLE `positions` (
  `Position_ID` int(11) NOT NULL,
  `Position_Name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `positions`
--

INSERT INTO `positions` (`Position_ID`, `Position_Name`) VALUES
(0, '[value-2]gg');

-- --------------------------------------------------------

--
-- Структура таблицы `workinfo`
--

CREATE TABLE `workinfo` (
  `ID` int(11) NOT NULL,
  `AcademicDegree` varchar(255) NOT NULL,
  `AcademicRank` varchar(255) NOT NULL,
  `ScientificDirection` varchar(255) NOT NULL,
  `Work Place` varchar(255) NOT NULL,
  `Department` int(11) NOT NULL,
  `Position` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `addressinfo`
--
ALTER TABLE `addressinfo`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `conference`
--
ALTER TABLE `conference`
  ADD PRIMARY KEY (`Participant_ID`);

--
-- Индексы таблицы `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`Department_ID`);

--
-- Индексы таблицы `participantinfo`
--
ALTER TABLE `participantinfo`
  ADD PRIMARY KEY (`Person_ID`),
  ADD KEY `ParticipantInfo_fk0` (`Person_Info`),
  ADD KEY `ParticipantInfo_fk1` (`ParticipantID`);

--
-- Индексы таблицы `personalinfotable`
--
ALTER TABLE `personalinfotable`
  ADD PRIMARY KEY (`PIT_ID`),
  ADD KEY `PersonalInfoTable_fk0` (`Address`),
  ADD KEY `PersonalInfoTable_fk1` (`WorkID`);

--
-- Индексы таблицы `positions`
--
ALTER TABLE `positions`
  ADD PRIMARY KEY (`Position_ID`);

--
-- Индексы таблицы `workinfo`
--
ALTER TABLE `workinfo`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `WorkInfo_fk0` (`Department`),
  ADD KEY `WorkInfo_fk1` (`Position`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `participantinfo`
--
ALTER TABLE `participantinfo`
  MODIFY `Person_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `participantinfo`
--
ALTER TABLE `participantinfo`
  ADD CONSTRAINT `ParticipantInfo_fk0` FOREIGN KEY (`Person_Info`) REFERENCES `personalinfotable` (`PIT_ID`),
  ADD CONSTRAINT `ParticipantInfo_fk1` FOREIGN KEY (`ParticipantID`) REFERENCES `conference` (`Participant_ID`);

--
-- Ограничения внешнего ключа таблицы `personalinfotable`
--
ALTER TABLE `personalinfotable`
  ADD CONSTRAINT `PersonalInfoTable_fk0` FOREIGN KEY (`Address`) REFERENCES `addressinfo` (`ID`),
  ADD CONSTRAINT `PersonalInfoTable_fk1` FOREIGN KEY (`WorkID`) REFERENCES `workinfo` (`ID`);

--
-- Ограничения внешнего ключа таблицы `workinfo`
--
ALTER TABLE `workinfo`
  ADD CONSTRAINT `WorkInfo_fk0` FOREIGN KEY (`Department`) REFERENCES `departments` (`Department_ID`),
  ADD CONSTRAINT `WorkInfo_fk1` FOREIGN KEY (`Position`) REFERENCES `positions` (`Position_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
