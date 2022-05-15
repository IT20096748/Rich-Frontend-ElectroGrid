-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 15, 2022 at 08:55 AM
-- Server version: 10.4.16-MariaDB
-- PHP Version: 7.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `electro_grid`
--

-- --------------------------------------------------------

--
-- Table structure for table `complaint`
--

CREATE TABLE `complaint` (
  `cID` int(11) NOT NULL,
  `type` varchar(50) NOT NULL,
  `cdesc` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `complaint`
--

INSERT INTO `complaint` (`cID`, `type`, `cdesc`) VALUES
(99887655, 'Power cut', 'No electricity since 12 hours');

-- --------------------------------------------------------

--
-- Table structure for table `consumer`
--

CREATE TABLE `consumer` (
  `consumerNo` int(11) NOT NULL,
  `accountNo` int(11) NOT NULL,
  `fname` varchar(100) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `nic` varchar(15) NOT NULL,
  `number` varchar(12) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(20) NOT NULL,
  `address` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `consumer`
--

INSERT INTO `consumer` (`consumerNo`, `accountNo`, `fname`, `gender`, `nic`, `number`, `email`, `password`, `address`) VALUES
(29, 456777659, 'Ravi Jayasinghe', 'Male', '199087655678', '7655678899', 'ravii@gmail.com', 'acc123qq', 'Kandy, Peradeniya');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `empNo` int(11) NOT NULL,
  `empID` int(10) NOT NULL,
  `fname` varchar(100) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `nic` varchar(15) NOT NULL,
  `number` varchar(12) NOT NULL,
  `email` varchar(150) NOT NULL,
  `password` varchar(20) NOT NULL,
  `address` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`empNo`, `empID`, `fname`, `gender`, `nic`, `number`, `email`, `password`, `address`) VALUES
(6, 12, 'Tanasha Jayasinghe', 'Female', '199765566789', '76544567880', 'Tana123@gmail.com', 'E0012992', 'Kurunegala, Yanthampalawa');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `complaint`
--
ALTER TABLE `complaint`
  ADD PRIMARY KEY (`cID`);

--
-- Indexes for table `consumer`
--
ALTER TABLE `consumer`
  ADD PRIMARY KEY (`consumerNo`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`empNo`),
  ADD UNIQUE KEY `nic` (`nic`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `consumer`
--
ALTER TABLE `consumer`
  MODIFY `consumerNo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `empNo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
