/*Sibghat Ullah Rayyan Shaikh
1831773042
CSE311L.1 Assessment */

-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 28, 2021 at 07:21 PM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `books`
--

-- --------------------------------------------------------

--
-- Table structure for table `book`
--

CREATE TABLE `book` (
  `BOOK_ID` int(11) NOT NULL,
  `TITLE` varchar(20) DEFAULT NULL,
  `PUB_YEAR` varchar(20) DEFAULT NULL,
  `PUBLISHER_NAME` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `book`
--

INSERT INTO `book` (`BOOK_ID`, `TITLE`, `PUB_YEAR`, `PUBLISHER_NAME`) VALUES
(1, 'Database Management', 'JAN-2017', 'MCGRAW-HILL'),
(3, 'CN', 'SEP-2016', 'PEARSON'),
(4, 'CG', 'SEP-2015', 'GRUPO PLANETA'),
(5, 'OS', 'MAY-2016', 'PEARSON');

-- --------------------------------------------------------

--
-- Table structure for table `book_authors`
--

CREATE TABLE `book_authors` (
  `AUTHOR_NAME` varchar(20) NOT NULL,
  `BOOK_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `book_authors`
--

INSERT INTO `book_authors` (`AUTHOR_NAME`, `BOOK_ID`) VALUES
('NAVATHE', 1),
('NAVATHE', 2),
('TANENBAUM', 3),
('EDWARD ANGEL', 4),
('GALVIN', 5);

-- --------------------------------------------------------

--
-- Table structure for table `book_copies`
--

CREATE TABLE `book_copies` (
  `NO_OF_COPIES` int(11) DEFAULT NULL,
  `BOOK_ID` int(11) NOT NULL,
  `BRANCH_ID` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `book_copies`
--

INSERT INTO `book_copies` (`NO_OF_COPIES`, `BOOK_ID`, `BRANCH_ID`) VALUES
(10, 1, 10),
(5, 1, 11),
(2, 2, 12),
(5, 2, 13),
(7, 3, 14),
(3, 4, 11),
(1, 5, 10);

-- --------------------------------------------------------

--
-- Table structure for table `book_lending`
--

CREATE TABLE `book_lending` (
  `DATE_OUT` date DEFAULT NULL,
  `DUE_DATE` date DEFAULT NULL,
  `BOOK_ID` int(11) NOT NULL,
  `BRANCH_ID` int(4) NOT NULL,
  `CARD_NO` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `book_lending`
--

INSERT INTO `book_lending` (`DATE_OUT`, `DUE_DATE`, `BOOK_ID`, `BRANCH_ID`, `CARD_NO`) VALUES
('2017-01-01', '2017-06-01', 1, 10, 101),
('2017-01-11', '2017-03-11', 3, 14, 101),
('2017-02-21', '2017-04-21', 2, 13, 101),
('2017-03-15', '2017-07-15', 4, 11, 101),
('2017-04-12', '2017-05-12', 1, 11, 104);

-- --------------------------------------------------------

--
-- Table structure for table `card`
--

CREATE TABLE `card` (
  `CARD_NO` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `card`
--

INSERT INTO `card` (`CARD_NO`) VALUES
(100),
(101),
(102),
(103),
(104);

-- --------------------------------------------------------

--
-- Table structure for table `library_branch`
--

CREATE TABLE `library_branch` (
  `BRANCH_ID` int(11) NOT NULL,
  `BRANCH_NAME` varchar(50) DEFAULT NULL,
  `ADDRESS` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `library_branch`
--

INSERT INTO `library_branch` (`BRANCH_ID`, `BRANCH_NAME`, `ADDRESS`) VALUES
(10, 'RR NAGAR', 'BANGALORE'),
(11, 'RNSIT', 'BANGALORE'),
(12, 'RAJAJI NAGAR', 'BANGALORE'),
(13, 'NITTE', 'MANGALORE'),
(14, 'MANIPAL', 'UDUPI');

-- --------------------------------------------------------

--
-- Table structure for table `publisher`
--

CREATE TABLE `publisher` (
  `NAME` varchar(20) NOT NULL,
  `PHONE` bigint(11) DEFAULT NULL,
  `ADDRESS` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `publisher`
--

INSERT INTO `publisher` (`NAME`, `PHONE`, `ADDRESS`) VALUES
('GRUPO PLANETA', 2147483647, 'BANGALORE'),
('HACHETTE LIVRE', 2147483647, 'CHENAI'),
('MCGRAW-HILL', 2147483647, 'BANGALORE'),
('PEARSON', 2147483647, 'NEWDELHI'),
('RANDOM HOUSE', 2147483647, 'HYDRABAD');

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_books`
-- (See below for the actual view)
--
CREATE TABLE `view_books` (
`Book_ID` int(11)
,`Title` varchar(20)
,`NO_Of_Copies` int(11)
);

-- --------------------------------------------------------

--
-- Structure for view `view_books`
--
DROP TABLE IF EXISTS `view_books`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_books`  AS SELECT `b`.`BOOK_ID` AS `Book_ID`, `b`.`TITLE` AS `Title`, `c`.`NO_OF_COPIES` AS `NO_Of_Copies` FROM ((`book` `b` join `book_copies` `c`) join `library_branch` `d`) WHERE `b`.`BOOK_ID` = `c`.`BOOK_ID` AND `c`.`BRANCH_ID` = `d`.`BRANCH_ID` ;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
