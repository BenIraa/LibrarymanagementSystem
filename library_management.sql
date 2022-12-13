-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 27, 2022 at 11:36 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `library_management`
--

DELIMITER $$
--
-- Procedures
--
DROP PROCEDURE IF EXISTS `BookProcedure`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `BookProcedure` (IN `book_ID` INT(11), IN `bk_title` VARCHAR(30), IN `bk_name` VARCHAR(30), IN `publisher` VARCHAR(11), IN `auth` VARCHAR(10), IN `bk_num` INT(11))   INSERT INTO book VALUES (88, 'Hello', 'world','Benjamin', 123456)$$

DROP PROCEDURE IF EXISTS `BorrowingProcedure`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `BorrowingProcedure` (IN `borrower_id` INT(11), IN `book_ID` INT(11), IN `stud_ID` INT(11), IN `staffName` VARCHAR(10), IN `studeentNoCopies` INT(10))   INSERT INTO borrowing VALUES (001,0022,0111,'Benjamin Iradukunda',12345)$$

DROP PROCEDURE IF EXISTS `ClearedRecordsProceduer`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `ClearedRecordsProceduer` (IN `Cleard_ID` INT(11), IN `borrower_id` INT(11), IN `book_id` INT(11), IN `bk_title` VARCHAR(11), IN `stud_ID` INT(11), IN `fname` INT(11), IN `lastname` VARCHAR(31), IN `studentNoCopies` INT(11))   INSERT INTO clearedrecords VALUES (0011,00011,00022,'Jules',000011,'Benjamin','IRADUKUNDA', 99911)$$

DROP PROCEDURE IF EXISTS `displayBorrowing`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `displayBorrowing` (IN `book_id` INT(11), IN `Borrower_id` INT(11), IN `student_id` INT(11), IN `staff_id` INT(11), IN `staffName` VARCHAR(11), IN `NumberOfCpoies` INT(11), IN `DueDate` DATE)   select * FROM borrowing$$

DROP PROCEDURE IF EXISTS `displayProcedurer`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `displayProcedurer` (IN `book_id` INT(11), IN `bk_title` VARCHAR(11), IN `bk_name` VARCHAR(11), IN `publisher` VARCHAR(11), IN `auth` VARCHAR(11), IN `bk_num` VARCHAR(11), IN `pub_date` DATE)   SELECT * FROM book$$

DROP PROCEDURE IF EXISTS `DisplayReport`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `DisplayReport` (IN `report_id` INT, IN `trans_id` INT, IN `book_id` INT, IN `bk_title` INT, IN `ReturnedCopies` INT, IN `ReportPenality` INT)   SELECT * from report$$

DROP PROCEDURE IF EXISTS `ReportProcedure`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `ReportProcedure` (IN `report_ID` INT(11), IN `trans_id` INT(11), IN `book_id` INT(11), IN `returnedCopies` INT(11), IN `reportRemarks` VARCHAR(10), IN `numbersOfdays` INT(11), IN `penalities` VARCHAR(31), IN `reportRecieved` VARCHAR(11))   INSERT INTO clearedrecords VALUES (00020,00222,00202,2222,'Late', 12, 'yes', 'Payment')$$

DROP PROCEDURE IF EXISTS `staffProcedure`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `staffProcedure` (IN `staff_ID` INT(11), IN `fname` VARCHAR(30), IN `lname` VARCHAR(30), IN `gender` VARCHAR(30), IN `age` INT(11), IN `cantact` INT(11), IN `staff_email ` VARCHAR(31), IN `staff_pass` VARCHAR(11))   INSERT into staff VALUES (00011, 'Benny','crispe', 'male', 0987654321,'beniraa50@gmail',0987654321 )$$

DROP PROCEDURE IF EXISTS `studentProcedure`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `studentProcedure` (IN `student_ID` INT(11), IN `firstname` INT(30), IN `lastname` INT(30), IN `gender` INT(10), IN `age` INT(10), IN `contact` INT(11), IN `student_email` VARCHAR(31), IN `student_pass` VARCHAR(11))   INSERT INTO student VALUES (0001,'IRAKUNDA', 'Benjamin','male', 12, 098765432,'iradukunda@gmail.com,')$$

DROP PROCEDURE IF EXISTS `transactionTable`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `transactionTable` (IN `trans_ID` INT(11), IN `borrower_id` INT(11), IN `trans_name` VARCHAR(30), IN `stud_Id` INT(11))   INSERT into transactiontable VALUES (0001,00002,'Payment', 00002)$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `book`
--

DROP TABLE IF EXISTS `book`;
CREATE TABLE `book` (
  `book_ID` int(11) NOT NULL,
  `bk_title` varchar(30) DEFAULT NULL,
  `bk_name` varchar(30) DEFAULT NULL,
  `publisher` varchar(30) DEFAULT NULL,
  `auth` varchar(30) DEFAULT NULL,
  `bk_num` int(11) DEFAULT NULL,
  `pub_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `book`
--

INSERT INTO `book` (`book_ID`, `bk_title`, `bk_name`, `publisher`, `auth`, `bk_num`, `pub_date`) VALUES
(1, 'Rich dad Poor dad', 'Rich dad Poor dad', 'Ben Iraa', 'Nicolas', 1234, '2022-07-11'),
(2, 'English', 'craziest things', 'Ben Iraa', 'Rositta', 1234, '2022-07-11'),
(3, 'mathematics', 'Algolithm', 'Ben Iraa', 'Nicolas', 1234, '2022-07-19');

--
-- Triggers `book`
--
DROP TRIGGER IF EXISTS `Book`;
DELIMITER $$
CREATE TRIGGER `Book` AFTER INSERT ON `book` FOR EACH ROW BEGIN 
INSERT INTO Book 
VALUES(NEW.book_ID, NEW.bk_title, New.bk_name, NEW.publisher, NEW.auth, NEW.bk_num, NEW.pub_date, NOW());
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `borrowing`
--

DROP TABLE IF EXISTS `borrowing`;
CREATE TABLE `borrowing` (
  `borrower_id` int(11) NOT NULL,
  `book_ID` int(11) DEFAULT NULL,
  `stud_ID` int(11) DEFAULT NULL,
  `staff_ID` int(11) DEFAULT NULL,
  `staffName` varchar(30) DEFAULT NULL,
  `studentNOcopies` int(11) DEFAULT NULL,
  `ReleaseDate` date DEFAULT NULL,
  `DueDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `borrowing`
--

INSERT INTO `borrowing` (`borrower_id`, `book_ID`, `stud_ID`, `staff_ID`, `staffName`, `studentNOcopies`, `ReleaseDate`, `DueDate`) VALUES
(22, 2, 12, 222, 'manager', 1234, '2022-07-20', '2022-07-23'),
(34, 3, 12, 222, 'manager', 1234, '2022-07-14', '2022-07-20'),
(332, 3, 12, 222, 'manager', 1234, '2022-07-11', '2022-07-27');

-- --------------------------------------------------------

--
-- Table structure for table `clearedrecords`
--

DROP TABLE IF EXISTS `clearedrecords`;
CREATE TABLE `clearedrecords` (
  `clearID` int(11) NOT NULL,
  `borrower_id` int(11) DEFAULT NULL,
  `book_ID` int(11) DEFAULT NULL,
  `bk_title` varchar(30) DEFAULT NULL,
  `stud_ID` int(11) DEFAULT NULL,
  `fname` varchar(30) DEFAULT NULL,
  `lname` varchar(30) DEFAULT NULL,
  `studentCopies` int(11) DEFAULT NULL,
  `releaseDate` date DEFAULT NULL,
  `DueDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `clearedrecords`
--

INSERT INTO `clearedrecords` (`clearID`, `borrower_id`, `book_ID`, `bk_title`, `stud_ID`, `fname`, `lname`, `studentCopies`, `releaseDate`, `DueDate`) VALUES
(44, 22, 2, 'Rich dad Poor dad', 12, 'Benjamin', 'IRADUKUNDA', 1234, '2022-07-20', '2022-07-23');

-- --------------------------------------------------------

--
-- Table structure for table `clearedrecordsview`
--

DROP TABLE IF EXISTS `clearedrecordsview`;
CREATE TABLE `clearedrecordsview` (
  `clearID` int(11) DEFAULT NULL,
  `borrower_id` int(11) DEFAULT NULL,
  `book_ID` int(11) DEFAULT NULL,
  `bk_title` varchar(30) DEFAULT NULL,
  `stud_ID` int(11) DEFAULT NULL,
  `fname` varchar(30) DEFAULT NULL,
  `lname` varchar(30) DEFAULT NULL,
  `studentCopies` int(11) DEFAULT NULL,
  `releaseDate` date DEFAULT NULL,
  `DueDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `report`
--

DROP TABLE IF EXISTS `report`;
CREATE TABLE `report` (
  `report_ID` int(11) NOT NULL,
  `trans_ID` int(11) DEFAULT NULL,
  `book_ID` int(11) DEFAULT NULL,
  `bookTitle` varchar(30) DEFAULT NULL,
  `reportCopieReturned` varchar(30) DEFAULT NULL,
  `reportReturnedDate` date DEFAULT NULL,
  `reportRemarks` varchar(30) DEFAULT NULL,
  `reportNumberOfDays` int(11) DEFAULT NULL,
  `reportPenalty` varchar(30) DEFAULT NULL,
  `reportReceived` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `report`
--

INSERT INTO `report` (`report_ID`, `trans_ID`, `book_ID`, `bookTitle`, `reportCopieReturned`, `reportReturnedDate`, `reportRemarks`, `reportNumberOfDays`, `reportPenalty`, `reportReceived`) VALUES
(32, 88, 2, 'crazy me', '123', '2022-07-23', 'returned', 12, 'none', 'yes'),
(234, 88, 3, 'crazy me', '123', '2022-07-22', 'returned', 12, 'none', 'no');

-- --------------------------------------------------------

--
-- Table structure for table `reportview`
--

DROP TABLE IF EXISTS `reportview`;
CREATE TABLE `reportview` (
  `report_ID` int(11) DEFAULT NULL,
  `trans_ID` int(11) DEFAULT NULL,
  `book_ID` int(11) DEFAULT NULL,
  `bookTitle` varchar(30) DEFAULT NULL,
  `reportCopieReturned` varchar(30) DEFAULT NULL,
  `reportReturnedDate` date DEFAULT NULL,
  `reportRemarks` varchar(30) DEFAULT NULL,
  `reportNumberOfDays` int(11) DEFAULT NULL,
  `reportPenalty` varchar(30) DEFAULT NULL,
  `reportReceived` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
CREATE TABLE `staff` (
  `staff_ID` int(11) NOT NULL,
  `fname` varchar(30) DEFAULT NULL,
  `laname` varchar(30) DEFAULT NULL,
  `gender` varchar(30) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `contact` int(11) DEFAULT NULL,
  `staff_email` varchar(30) DEFAULT NULL,
  `staff_pass` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`staff_ID`, `fname`, `laname`, `gender`, `age`, `contact`, `staff_email`, `staff_pass`) VALUES
(221, 'Ben', 'IRADUKUNDA', 'male', 21, 83883772, 'beniraa@gmail.com', '9876272'),
(222, 'Ingabire', 'Rosette', 'female', 21, 83883772, 'rosita@gmail.com', '9876272');

--
-- Triggers `staff`
--
DROP TRIGGER IF EXISTS `StaffUPDATE`;
DELIMITER $$
CREATE TRIGGER `StaffUPDATE` AFTER UPDATE ON `staff` FOR EACH ROW BEGIN
INSERT into staff VALUES (user(), CONCAT('Update staff Record ',
         OLD.staff_ID,' Previous Class :',OLD.fname,' Ben',
         NEW.age));
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `staffview`
--

DROP TABLE IF EXISTS `staffview`;
CREATE TABLE `staffview` (
  `staff_ID` int(11) DEFAULT NULL,
  `fname` varchar(30) DEFAULT NULL,
  `laname` varchar(30) DEFAULT NULL,
  `gender` varchar(30) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `contact` int(11) DEFAULT NULL,
  `staff_email` varchar(30) DEFAULT NULL,
  `staff_pass` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `stud_ID` int(11) NOT NULL,
  `fname` varchar(30) DEFAULT NULL,
  `laname` varchar(30) DEFAULT NULL,
  `gender` varchar(30) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `contact` int(11) DEFAULT NULL,
  `stud_email` varchar(30) DEFAULT NULL,
  `stud_pass` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`stud_ID`, `fname`, `laname`, `gender`, `age`, `contact`, `stud_email`, `stud_pass`) VALUES
(12, 'Benjamin', 'IRADUKUNDA', 'male', 21, 781975442, 'beniraa5@gmail.com', '87654321'),
(13, 'Nshuti', 'Blaise', 'male', 21, 838283772, 'nshuti@gmail.com', '87654321');

--
-- Triggers `student`
--
DROP TRIGGER IF EXISTS `StudentDelete`;
DELIMITER $$
CREATE TRIGGER `StudentDelete` AFTER DELETE ON `student` FOR EACH ROW BEGIN
INSERT into Student VALUES (user(), CONCAT('Delete Student Record ',
         OLD.stud_ID,' Name :',OLD.fname, '-> Deleted on ', NOW()));
END
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `StudentUPDATE`;
DELIMITER $$
CREATE TRIGGER `StudentUPDATE` AFTER UPDATE ON `student` FOR EACH ROW BEGIN
INSERT into Student VALUES (user(), CONCAT('Update Student Record ',
         OLD.stud_ID,' Previous Borrowing :',OLD.gender,' female',
         NEW.age));
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `studentview`
--

DROP TABLE IF EXISTS `studentview`;
CREATE TABLE `studentview` (
  `stud_ID` int(11) DEFAULT NULL,
  `fname` varchar(30) DEFAULT NULL,
  `laname` varchar(30) DEFAULT NULL,
  `gender` varchar(30) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `contact` int(11) DEFAULT NULL,
  `stud_email` varchar(30) DEFAULT NULL,
  `stud_pass` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `transactiontable`
--

DROP TABLE IF EXISTS `transactiontable`;
CREATE TABLE `transactiontable` (
  `trans_ID` int(11) NOT NULL,
  `borrower_id` int(11) NOT NULL,
  `trans_name` varchar(30) DEFAULT NULL,
  `stud_ID` int(11) DEFAULT NULL,
  `trans_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `transactiontable`
--

INSERT INTO `transactiontable` (`trans_ID`, `borrower_id`, `trans_name`, `stud_ID`, `trans_date`) VALUES
(88, 0, 'penality fees', 12, '2022-07-30'),
(89, 332, 'penality fees', 12, '2022-07-29');

--
-- Triggers `transactiontable`
--
DROP TRIGGER IF EXISTS `transactionTable`;
DELIMITER $$
CREATE TRIGGER `transactionTable` AFTER INSERT ON `transactiontable` FOR EACH ROW BEGIN 
INSERT INTO transactionTable VALUES(NEW.trans_ID, NEW.borrower_id, New.trans_name, NEW.stud_ID, NEW.trans_date, NOW());
END
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `transactionTableDeleteRECORDS`;
DELIMITER $$
CREATE TRIGGER `transactionTableDeleteRECORDS` AFTER DELETE ON `transactiontable` FOR EACH ROW BEGIN
INSERT INTO transactionTable VALUES (user(), CONCAT('Delete transaction Record ',
         OLD.trans_ID,' Name of transaction:',OLD.trans_name, '-> Deleted on ', NOW()));
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `transactiontableview`
--

DROP TABLE IF EXISTS `transactiontableview`;
CREATE TABLE `transactiontableview` (
  `trans_ID` int(11) DEFAULT NULL,
  `borrower_id` int(11) DEFAULT NULL,
  `trans_name` varchar(30) DEFAULT NULL,
  `stud_ID` int(11) DEFAULT NULL,
  `trans_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
